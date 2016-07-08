From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 08 Jul 2016 18:14:23 +0000
Subject: [Buildroot] [Bug 9091] New: U-Boot fails to boot with large ramdisk
Message-ID: <bug-9091-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=9091

            Bug ID: 9091
           Summary: U-Boot fails to boot with large ramdisk
           Product: buildroot
           Version: unspecified
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: michaellmonaghan at gmail.com
                CC: buildroot at uclibc.org
  Target Milestone: ---

U-Boot fails to load a large ramdisk into memory properly (tested to occur with
a 20MB image on the zynq microzed). I have found a solution to the problem but
I'm unsure how to fix the problem in buildroot.


The U-Boot environment variable 'sdboot' is set to 

echo Booting from SD...; run envload; run fpgaboot; fatload mmc 0 0x1000000
${kernel_image} && fatload mmc 0 0x2000000 ${ramdisk_image} && fatload mmc 0
0x3000000 ${devicetree_image} && bootm 0x1000000 0x2000000 0x3000000

I believe the device tree is being written on top of the ramdisk. The system
boots when 'sdboot' is set to 

echo Booting from SD...; run envload; run fpgaboot; fatload mmc 0 0x1000000
${kernel_image} && fatload mmc 0 0x3000000 ${ramdisk_image} && fatload mmc 0
0x2000000 ${devicetree_image} && bootm 0x1000000 0x3000000 0x2000000

Here is a log of the default boot behavior.

######## begin boot log ########
U-Boot 2015.07 (Jul 07 2016 - 05:52:07 -0400)

Model: Zynq MicroZED Board
I2C: ready
DRAM: ECC disabled 1 GiB
MMC: zynq_sdhci: 0
Using default environment

In: serial
Out: serial
Err: serial
Model: Zynq MicroZED Board
Net: Gem.e000b000
Error: Gem.e000b000 address not set.

Hit any key to stop autoboot: 0
Booting from SD...
Device: zynq_sdhci
Manufacturer ID: 2
OEM: 544d
Name: SA04G
Tran Speed: 50000000
Rd Block Len: 512
SD version 3.0
High Capacity: Yes
Capacity: 3.6 GiB
Bus Width: 4-bit
Erase Group Size: 512 Bytes
reading uEnv.txt
** Unable to read file uEnv.txt **
reading system.bit
** Unable to read file system.bit **
FPGA image system.bit was not found, skipping...
reading uImage
3450752 bytes read in 309 ms (10.6 MiB/s)
reading rootfs.cpio.uboot
23719921 bytes read in 2027 ms (11.2 MiB/s)
reading zynq-zed.dtb
9141 bytes read in 19 ms (469.7 KiB/s)
## Booting kernel from Legacy Image at 01000000 ...
Image Name: Linux-3.18.0-xilinx
Image Type: ARM Linux Kernel Image (uncompressed)
Data Size: 3450688 Bytes = 3.3 MiB
Load Address: 00008000
Entry Point: 00008000
Verifying Checksum ... OK
## Loading init Ramdisk from Legacy Image at 02000000 ...
Image Name:
Image Type: ARM Linux RAMDisk Image (uncompressed)
Data Size: 23719857 Bytes = 22.6 MiB
Load Address: 00000000
Entry Point: 00000000
Verifying Checksum ... Bad Data CRC
Ramdisk image is corrupt or invalid
zynq-uboot>
######## end boot log ########

-- 
You are receiving this mail because:
You are on the CC list for the bug.
