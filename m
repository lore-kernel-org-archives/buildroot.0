From: Andy Bergh <allmyaddmin@gmail.com>
Date: Thu, 6 May 2021 17:52:31 +0200
Subject: [Buildroot] Load device tree overlay file (dts / dtb)
Message-ID: <CAAmck7WR1yWC8XxhH8r9Y0Y8px5xD3vP8oCosbcEUTRs10yqRA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I managed to build a dtb file so that I can use the CAN0 feature on the
beaglebone black. But I am not able to "load" it, if that is even the
correct term...

To build it I did:
make menuconfig
--> kernel
    --> (path/to/my/dts/file) Out-of-tree Device Tree Source file paths

I made no other changes to any configs regarding the device tree overlay,
not in uboot-menuconfig either (I think this may be where my problem lies-
I just do not know).

Once *make* is complete I can see my *.dtb file in the output/images
directory. I write the sdcard.img to an SD card and edit the uEnt.txt file
by adding the text highlighted in bold:

***************************************************************








*bootpart=0:1devtype=mmcbootdir=bootfile=zImagebootpartition=mmcblk0p2console=ttyS0,115200n8loadaddr=0x82000000fdtaddr=0x88000000*









*#Master Enableenable_uboot_overlays=1#Custom
Capedtb_overlay=/lib/firmware/*.dtboset_mmc1=if test $board_name =
A33515BB; then setenv bootpartition mmcblk1p2; fiset_bootargs=setenv
bootargs console=${console} root=/dev/${bootpartition} rw rootfstype=ext4
rootwaituenvcmd=run set_mmc1; run set_bootargs;run loadimage;run
loadfdt;printenv bootargs;bootz ${loadaddr} - ${fdtaddr}*
***************************************************************

The OS boots fine, and shows me no indication (which I am aware of) as to
whether the dtb file was loaded or not. I have no idea how to check if the
dtb file was loaded at all. The idea of the file is to be able to use the
CAN0 device of the BBB but I am not able to do that.
*ifconfig -a* shows nothing of a CAN
*ifup can0* says *Cannot find device "can0".*
*modprobe can*, *modprobe can-dev* and *modprobe can-raw *seems to load
fine (no output is given)

All the online material I follow seems to point to a *bone_capemgr*.* in
*/sys/devices* to be able to load it dynamically but from what I have read
this has been "removed" from around kernel v3.15 onward (I m a running
kernel 4.19.76).

My first and foremost question is, how can I check if a dtb file was
read/loaded during startup? Maybe my second question answers the first. Is
there a config setting I am missing, or maybe my uEnv.txt is wrong?

Any information would be much appreciated.

Thank you,
Andy
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20210506/a7c11eff/attachment.html>
