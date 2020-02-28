From: Peter Seiderer <ps.report@gmx.net>
Date: Fri, 28 Feb 2020 15:18:09 +0100
Subject: [Buildroot] buildroot 2019.11.1 rpi-0-w error
In-Reply-To: <CAPm8-H4w3DyfbsA2sDgR8Ekuo_6ew+45XMoZn8zDrFaDAvK5oA@mail.gmail.com>
References: <CAPm8-H6q+gk=-rVR44L8zwL-RngM3a8YNHwxeS+Ddumi6K29FA@mail.gmail.com>
 <20200228135239.478d8257@gmx.net>
 <CAPm8-H4w3DyfbsA2sDgR8Ekuo_6ew+45XMoZn8zDrFaDAvK5oA@mail.gmail.com>
Message-ID: <20200228151809.400146ec@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Laurentiu-Cristian,

On Fri, 28 Feb 2020 15:51:44 +0200, Laurentiu-Cristian Duca <laurentiu.duca@gmail.com> wrote:

> Hi,
>
> On 2/28/20, Peter Seiderer <ps.report@gmx.net> wrote:
> >
> >
> > On Fri, 28 Feb 2020 14:03:45 +0200, Laurentiu-Cristian Duca
> > <laurentiu.duca@gmail.com> wrote:
> >
> >> Hi,
> >>
> >>   I am facing the following error in buildroot 2019.11.1
> >> when configuring buildroot for rpi-0-w
> >> with this settings:
> >>
> >> make menuconfig
> >> Kernel
> >>     Defconfig name (bcm2835)
> >>     In-tree Device Tree Source file names (bcm2835-rpi-zero-w)
> >>
> >> make
> >> >>>   Executing post-image script board/raspberrypi0w/post-image.sh
> >> INFO: cmd: "mkdir -p
> >> "/home/laur/lucru/raspberry-pi/buildroot/buildroot-2019.11.rpi/output/build/genimage.tmp""
> >> (stderr):
> >> INFO: cmd: "rm -rf
> >> "/home/laur/lucru/raspberry-pi/buildroot/buildroot-2019.11.rpi/output/build/genimage.tmp"/*"
> >> (stderr):
> >> INFO: cmd: "mkdir -p
> >> "/home/laur/lucru/raspberry-pi/buildroot/buildroot-2019.11.rpi/output/build/genimage.tmp""
> >> (stderr):
> >> INFO: cmd: "cp -a "/tmp/tmp.iaBv2bX7fQ"
> >> "/home/laur/lucru/raspberry-pi/buildroot/buildroot-2019.11.rpi/output/build/genimage.tmp/root""
> >> (stderr):
> >> INFO: cmd: "find
> >> '/home/laur/lucru/raspberry-pi/buildroot/buildroot-2019.11.rpi/output/build/genimage.tmp/root'
> >> -depth -type d -printf '%P\0' | xargs -0 -I {} touch -r
> >> '/tmp/tmp.iaBv2bX7fQ/{}'
> >> '/home/laur/lucru/raspberry-pi/buildroot/buildroot-2019.11.rpi/output/build/genimage.tmp/root/{}'"
> >> (stderr):
> >> ERROR: file(bcm2708-rpi-zero-w.dtb):
> >> stat(/home/laur/lucru/raspberry-pi/buildroot/buildroot-2019.11.rpi/output/images/bcm2708-rpi-zero-w.dtb)
> >> failed: No such file or directory
> >> ERROR: vfat(boot.vfat): could not setup bcm2708-rpi-zero-w.dtb
> >>
> >>   If I rename bcm2835-rpi-zero-w.dtb to bcm2708-rpi-zero-w.dtb in
> >> output/images,
> >> the build succeeds but linux does not boot.
> >>
> >
> > According to configs/raspberrypi0w_defconfig the DTS name should
> > be 'bcm2708-rpi-zero-w' (or 'bcm2708-rpi-0-w' prior to [1], [2])
> > and the defconfig name should be 'bcmrpi'?
> >
> > Does the plain raspberrypi0w_defconfig work for you?
>   Yes, it works. But only works with rpi linux.
> I wanted to use linux mainline kernel compiled separately
> and that is why I tried to use
> bcm2835-rpi-zero-w.dts because mainline kernel does not have bcm2708...dts

Then do not forget to change board/raspberrypi/genimage-raspberrypi0w.cfg:

--- a/board/raspberrypi/genimage-raspberrypi0w.cfg
+++ b/board/raspberrypi/genimage-raspberrypi0w.cfg
@@ -1,7 +1,7 @@
 image boot.vfat {
   vfat {
     files = {
-      "bcm2708-rpi-zero-w.dtb",
+      "bcm2835-rpi-zero-w.dtb",
       "rpi-firmware/bootcode.bin",
       "rpi-firmware/cmdline.txt",
       "rpi-firmware/config.txt",

And according to [3], [4] you need to add kernel and DTB file to /boot/config.txt,
e.g.:

kernel=zImage
device_tree=bcm2835-rpi-zero-w.dtb


[3] https://www.collabora.com/news-and-blog/blog/2019/03/12/quick-hack-raspberry-pi-meets-linux-kernel-mainline/
[4] https://wiki.gentoo.org/wiki/Raspberry_Pi/Mainline_Kernel

>
> Thanks
>
> >
> > Which linux kernel do you use (in doubt send your .config or defconfig
> > file)?
> >
> > Regards,
> > Peter
> >
> > [1]
> > https://git.buildroot.net/buildroot/commit/?id=42d22f3bdba41da8e6b6ace2c78af2b3e34d7491
> > [2]
> > https://git.buildroot.net/buildroot/commit/?id=fcecfb66d1fb749426306dbea50fdeb37d4706d8
> >
> >>   Any ideas?
> >>
> >> Thanks
> >> _______________________________________________
> >> buildroot mailing list
> >> buildroot at busybox.net
> >> http://lists.busybox.net/mailman/listinfo/buildroot
> >
> >
