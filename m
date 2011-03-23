From: bruce bushby <bruce.bushby@gmail.com>
Date: Wed, 23 Mar 2011 22:53:50 +0000
Subject: [Buildroot] BeagleBoard-xM, booting 2.6.37, root=/dev/mmcblk0p2,
 kernel hangs
In-Reply-To: <201103232310.39054.tmohr@s.netic.de>
References: <201103232200.55266.tmohr@s.netic.de>
	<AANLkTikXt+=tDUAtbP39EZQ8ExEZzEU0kMYFP0NQ_Pm5@mail.gmail.com>
	<201103232310.39054.tmohr@s.netic.de>
Message-ID: <AANLkTikPixoYQfWYnnKKBb6TuXOMXt165gkfVAzL-OPR@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I've only just started using buildroot but I found the NFS setup simplifies
things and it also makes testing new builds very easy.

I can help with the NFS setup if you need.....it's about the only part of
things I'm any good at :)

my uboot settings:

U-Boot> printenv
bootdelay=3
baudrate=115200
AutoRamSizeCfg=ON
AutoLinuxEnvCfg=ON
ethact=macb0
autostart=
autoload=no
ipaddr=192.100.1.102
ethaddr=192.100.1.102
bootcmd=ethinit $ipaddr ; tftp 0x20200000 uImage ; bootm 0x20200000
serverip=192.100.1.108
bootargs=console=ttyS0,115200 mem=64M ver=4384k icofat=257k root=/dev/nfs
nfsroot=192.100.1.108:/nfsroot ip=192.100.1.102
mtdparts=atmel_nand:7936k(ARMboot)ro,- at 7936k(root)
stdin=serial
stdout=serial
stderr=serial

Environment size: 431/32764 bytes
U-Boot>


1. setup tftpboot (I use /tftpboot)
2. Create an nfs share (I use /nfsroot)
2. Copy uImage to /tftpboot/uImage (give /tftpboot 777 file perms)
4. Copy rootfs.tar to /nfsroot ; tar -xf rootfs.tar

uboot:
setenv ipaddr 192.100.1.102
setenv bootcmd "...your bootcmd"
setenv bootargs "..your bootargs"
saveenv

I set my bootcmd to include "ethinit $ipaddr;" .... otherwise you have to
manually "ethinit $ipaddr"


Hope that helps


On Wed, Mar 23, 2011 at 10:10 PM, Torsten Mohr <tmohr@s.netic.de> wrote:

> Hi,
>
> no, i haven't set up tftp yet, but i can try that.  It will be a good test
> to
> see if the problem is the MMC or anything else related to mounting root,
> correct?
>
>
> Best regards,
> Torsten.
>
> Am Mittwoch, 23. M?rz 2011, 22:33:18 schrieb bruce bushby:
> > maybe a silly question.....have you tested your kernel/build via
> NFS....ie
> > "tftp boot uImage" & "NFS mount rootfs"?
> >
> > On Wed, Mar 23, 2011 at 9:00 PM, Torsten Mohr <tmohr@s.netic.de> wrote:
> > > Hello,
> > >
> > > i've set up a micro SD card with VFAT on partition 1, EXT2 on partition
> > > 2.
> > >
> > > Partition 2 is buildroot's output/images/rootfs.ext2, copied with "dd"
> to
> > > the
> > > micro SD card.
> > >
> > > On partition 1 i have u-boot and i start the kernel like this:
> > > mmc init
> > > mmc rescan 0
> > > run loaduimage
> > > bootm 0x82000000
> > >
> > > Then i see the kernel boot log and i see it hanging:
> > >
> > > [    1.215850] twl_rtc twl_rtc: setting system clock to 2000-01-01
> > > 00:05:25 UTC (946685125)
> > > [    1.226806] Waiting for root device /dev/mmcblk0p2...
> > > [    1.369873] mmc0: host does not support reading read-only switch.
> > > assuming
> > > write-enable.
> > > [    1.389953] mmc0: new SDHC card at address e624
> > > ---> no more output
> > >
> > >
> > > I use buildroot-2011.02, the kernel is 2.6.37.
> > >
> > > In the kernel configuration i have set:
> > >
> > > TI OMAP Multimedia Card Interface support (MMC_OMAP)
> > > TI OMAP High Speed Multimedia Card Interface support (MMC_OMAP_HS)
> > >
> > >
> > > Can anybody give me a hint why the kernel does not continue to boot?
> > >
> > >
> > > Best regards,
> > > Torsten.
> > >
> > > _______________________________________________
> > > buildroot mailing list
> > > buildroot at busybox.net
> > > http://lists.busybox.net/mailman/listinfo/buildroot
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20110323/48a9d65a/attachment.html>
