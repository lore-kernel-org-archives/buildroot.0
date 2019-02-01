From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 01 Feb 2019 12:58:38 +0000
Subject: [Buildroot] [Bug 11656] New: Device tree issues with
 BeagleBoneBlack and LCD cape
Message-ID: <bug-11656-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=11656

            Bug ID: 11656
           Summary: Device tree issues with BeagleBoneBlack and LCD cape
           Product: buildroot
           Version: 2018.02.9
          Hardware: Other
                OS: Linux
            Status: NEW
          Severity: major
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: tistolz at outlook.de
                CC: buildroot at uclibc.org
  Target Milestone: ---

Hello,

I'm trying to create a Buildroot 2018.02.9 system for the BeagleBone Black with
an LCD screen (4D Systems gen4-4DCAPE-43T). This screen is supported OK in the
BeagleBoard.org Debian Image 2018-06-17, but I want to run Buildroot due to
lower complexity and faster boot time.

The schematics of the LCD cape are presented in the datasheet:
<https://www.4dsystems.com.au/productpages/gen4-4DCAPE/downloads/gen4-4DCAPE_datasheet_R_1_0.pdf>

I figured out that all drivers needed for the LCD cape are available in the
kernel, i.e. tilcdc for video/DRM, ar1021_i2c for the resistive touchscreen,
and backlight_pwm + pwm-tiehrpwm/pwm-tiecap for the backlight dimmer IC.
(The TPS61165 backlight IC supports either PWM or EasyScale for setting the
brightness; I verified that PWM is used by Debian, and there is no official
kernel driver for EasyScale.)

However, running Buildroot with those drivers enabled in the kernel (compiled
in, not as modules) does not give any image on the LCD, and I have the
following line appearing at the serial console:

> [drm] Cannot find any crtc or sizes

It appears that for the drivers to work, correct information about the hardware
must be present in the *device tree*. Debian solves this by integrating "device
tree overlays" in the uboot bootloader. The filenames seem to be read from the
cape (=daughterboard) EEPROMs, e.g. /lib/firmware/BB-BONE-4D4R-01-00A1.dtbo --
source code for that is available at:
<https://github.com/beagleboard/bb.org-overlays/blob/master/src/arm/BB-BONE-4D4R-01-00A1.dts>

People in the #beagle IRC channel told me that dynamic device tree overlays do
not make sense with Buildroot, and I want to run it only with a certain cape
configuration (LCD cape, custom CAN interface). So they advised me to combine
the default device tree and the overlays (for LCD, CAN bus, etc.) into a single
device tree file, since cape detection plug-and-play is not needed.
(Compare
<http://buildroot-busybox.2317881.n4.nabble.com/support-for-device-tree-overlays-td120072.html>,
where it is stated that Buildroot does not have support for device tree
overlays.)
Instead of manually editing the .dts source, I found out that the device tree
information can be gathered from the running Debian system, on which the
display is working properly. The device tree is presented by the kernel in a
filesystem layout at /proc/device-tree/, which is a symlink to
/sys/firmware/devicetree/base/. We can use the 'dtc' device tree compiler to
produce a .dts file from this filesystem tree:

        dtc -I fs /proc/device-tree -o my-device-tree.dts


The goal is now to integrate this device tree file (call it
am335x-bbb-mycapes.dts) into the Buildroot build, which currently fails! I
followed these steps:

1. provide the path to the file at
   [make menuconfig --> Kernel --> Out-of-tree Device Tree Source file paths]
   and at
   [make menuconfig --> Bootloader (--> U-Boot) --> Device Tree Source file
paths]

2. make uboot-menuconfig
   --> Device Tree Control --> Default Device Tree for DT control -->
am335x-bbb-mycapes
   --> Device Tree Control --> List of device tree files to include for DT
control --> also set to am335x-bbb-mycapes

3. make
   --> Error: Device Tree Source is not correctly specified. Please define
'CONFIG_DEFAULT_DEVICE_TREE' or build with 'DEVICE_TREE=<device_tree>' argument

4. manual fix: copy am335x-bbb-mycapes.dtb [manually compiled using dtc] to
buildroot-2018.02.9/output/build/uboot-2016.09.01/arch/arm/dts/

5. make --> this time it works!

6. try booting the beaglebone black, get error message:
        No matching DT out of these options: am335x-bbb-mycapes

7. manually copy am335x-bbb-mycapes.dtb to the FAT partition (/dev/mmcblk0p1)
   (This seems to be a mistake of the build system: When running 'make linux',
it adds am335x-bbb-mycapes.dtb to output/images, but it will not be part of
output/images/boot.vfat !)

8. try booting again, same error message as in 6.


Finally I tried to "force-feed" my device tree into Buildroot by just naming it
am335x-boneblack.dts (which already exists in 
output/build/linux-4.14.96/arch/arm/boot/dts/ and
output/build/uboot-2016.09.01/arch/arm/dts/) and adding it to the Device Tree
Source file paths as in step 1.
This seemed to work during compilation, but as a result uboot would completely
fail to start! Uboot just outputs the following lines, after which it freezes
(it will restart after some 50 seconds):

> U-Boot SPL 2016.09.01 (Feb 01 2019 - 09:05:25)
> Trying to boot from MMC1
> reading args
> spl_load_image_fat_os: error reading image args, err - -1
> reading u-boot.img
> reading u-boot.img
> reading u-boot.img
> reading u-boot.img

I obtained the above result by booting with S2 (the switch close to the SD
card) pressed, which selects the SD card for initial bootloader loading. When I
press the power button without that, I get:

> U-Boot 2018.03-00002-gac9cce7c6a (Apr 05 2018 - 13:07:46 -0500), Build: jenkins-github_Bootloader-Builder-47
> [...]
> Board: BeagleBone Black
> [...]
> Loaded environment from /uEnv.txt
> Importing environment from mmc ...
> Checking if uenvcmd is set ...
> gpio: pin 56 (gpio 56) value is 1
> Running uenvcmd ...
> 5401856 bytes read in 342 ms (15.1 MiB/s)
> loading /am335x-boneblack.dtb ...
> 64290 bytes read in 9 ms (6.8 MiB/s)
> bootargs=console=ttyO0,115200n8 root=/dev/mmcblk0p2 rw rootfstype=ext4 rootwait
> ## Flattened Device Tree blob at 88000000
>    Booting using the fdt blob at 0x88000000
>    Loading Device Tree to 8ffed000, end 8ffffb21 ... OK
> 
> Starting kernel ...

It does not get beyond this point (all 4 LEDs on the BeagleBone are lit), but
resets after a time-out of one minute. The 64290-byte am335x-boneblack.dtb is
indeed the one I intended it to work with. So is that broken?


I think that this issue is quite relevant for the usage of Buildroot on
BeagleBones, since many use cases require the addition of capes, which must be
properly supported by means of a device tree.

Thanks for any help or suggestion.

Best regards,
Tibor Stolz

-- 
You are receiving this mail because:
You are on the CC list for the bug.
