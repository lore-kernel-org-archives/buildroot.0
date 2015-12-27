From: Chris LaRocque <clarocq@gmail.com>
Date: Sat, 26 Dec 2015 19:09:25 -0500
Subject: [Buildroot] trying to use
 https://github.com/beagleboard/linux.git with buildroot
In-Reply-To: <1451173488.3993354.476829962.2D827969@webmail.messagingengine.com>
References: <1450890296.2355509.475056490.71128E4E@webmail.messagingengine.com>
 <20151223184751.12365336@free-electrons.com>
 <1450893821.3034067.475093450.34890777@webmail.messagingengine.com>
 <1450894505.3036056.475106194.467AC874@webmail.messagingengine.com>
 <20151223193943.21a6f0fc@free-electrons.com>
 <1450910736.3752716.475291418.490BB3EA@webmail.messagingengine.com>
 <20151223235253.0afe702e@free-electrons.com>
 <1450917779.3775953.475348978.37FAC3A8@webmail.messagingengine.com>
 <n5mdi8$5go$1@ger.gmane.org>
 <1451154853.3394517.476716010.48669FA1@webmail.messagingengine.com>
 <CA+-urNRO0DWv7Xw+DctiFspDootbJRwbwdE66UYMbfCjL8jWuQ@mail.gmail.com>
 <1451173488.3993354.476829962.2D827969@webmail.messagingengine.com>
Message-ID: <CAOURK2ug2snU=+Gq1wRn9_PsrH3teo9-28kw0r74_cuZefhXQQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Glad that you're up and running Craig.

I use the August 2015 uboot and the only change I make is to disable mmc 0
'cause I want to use the pins for something else.

Have fun.

Pushing back the boundaries of ignorance.
On Dec 26, 2015 18:44, "Craig Swank" <craigswank@fastmail.fm> wrote:

> YES!  Using Chris's uEnv.txt and u-boot 2015.07 instead of 2015.10 it
> finally booted up correctly.  Many thanks to Thomas, Chris, and, last
> but not least, Frank, who swooped in with the secret sauce at the very
> end.
>
> I'm not even close to being able to figure out why the 07 version worked
> and 10 did not, but I'm just too happy to care.
>
> Craig
>
>
> On Sat, Dec 26, 2015, at 03:02 PM, Frank Hunleth wrote:
> > Hi Craig,
> >
> > On Sat, Dec 26, 2015 at 1:34 PM, Craig Swank <craigswank@fastmail.fm>
> > wrote:
> > > My build succeeded, but I'm having trouble with booting now.  When I
> > > boot with the uEnv.txt you pasted:
> > >
> > > bootfile=zImage
> > > fdtfile=am335x-boneblack.dtb
> > > loadaddr=0x80007fc0
> > > fdtaddr=0x80F80000
> > > loadfdt=fatload mmc 0:1 ${fdtaddr} ${fdtfile}
> > > loaduimage=fatload mmc 0:1 ${loadaddr} ${bootfile}
> > > console=ttyO0,115200n8
> > > mmcroot=/dev/mmcblk0p2
> > > mmcrootfstype=ext2
> > > uenvcmd=mmc rescan; run loaduimage; run loadfdt; run fdtboot
> > > fdtboot=run mmc_args; run mmcargs; bootz ${loadaddr} - ${fdtaddr}
> > > mmc_args=setenv bootargs console=${console} ${optargs} root=${mmcroot}
> > > rw
> > > rootfstype=${mmcrootfstype} root wait
> > >
> > > I got an error about mmcargs not being defined.  The fdtboot line has
> > > both "run mmc_args" and "run mmcargs".  I tried removing the 'run
> > > mmcargs' part so now the uEnv.txt looks like:
> > >
> > > bootfile=zImage
> > > fdtfile=am335x-boneblack.dtb
> > > loadaddr=0x80007fc0
> > > fdtaddr=0x80F80000
> > > loadfdt=fatload mmc 0:1 ${fdtaddr} ${fdtfile}
> > > loaduimage=fatload mmc 0:1 ${loadaddr} ${bootfile}
> > > console=ttyO0,115200n8
> > > mmcroot=/dev/mmcblk0p2
> > > mmcrootfstype=ext2
> > > uenvcmd=mmc rescan; run loaduimage; run loadfdt; run fdtboot
> > > fdtboot=run mmc_args; bootz ${loadaddr} - ${fdtaddr}
> > > mmc_args=setenv bootargs console=${console} ${optargs} root=${mmcroot}
> > > rw
> > > rootfstype=${mmcrootfstype} root wait
> > >
> > >
> > > Next, when I boot with the new uEnv.txt file the error I get is:
> > >
> > > U-Boot 2015.10 (Dec 26 2015 - 10:23:47 -0700)
> > >
> > >        Watchdog enabled
> > > I2C:   ready
> > > DRAM:  512 MiB
> > > NAND:  0 MiB
> > > MMC:   OMAP SD/MMC: 0, OMAP SD/MMC: 1
> > > *** Error - No Valid Environment Area found
> > > *** Warning - bad CRC, using default environment
> > >
> > > Net:   <ethaddr> not set. Validating first E-fuse MAC
> > > cpsw, usb_ether
> > > Hit any key to stop autoboot:  0
> > > switch to partitions #0, OK
> > > mmc0 is current device
> > > SD/MMC found on device 0
> > > reading boot.scr
> > > ** Unable to read file boot.scr **
> > > reading uEnv.txt
> > > 471 bytes read in 3 ms (153.3 KiB/s)
> > > Loaded environment from uEnv.txt
> > > Importing environment from mmc ...
> > > Running uenvcmd ...
> > > reading zImage
> > > 7462256 bytes read in 404 ms (17.6 MiB/s)
> > > reading am335x-boneblack.dtb
> > > 59295 bytes read in 10 ms (5.7 MiB/s)
> > > Kernel image @ 0x80007fc0 [ 0x000000 - 0x71dd70 ]
> > > data abort
> > > pc : [<9ff62ef8>]          lr : [<9ff62f55>]
> > > reloc pc : [<80810ef8>]    lr : [<80810f55>]
> > > sp : 9ef31778  ip : 80725d30     fp : 9ef34f74
> > > r10: 00000002  r9 : 9ef31ed8     r8 : 9ffa35ac
> > > r7 : 9ffa35b0  r6 : 00000003     r5 : 9ef34f74  r4 : 9ffa3514
> > > r3 : 00000000  r2 : 9ffa3514     r1 : 9ef34f74  r0 : 00000000
> > > Flags: nZcv  IRQs off  FIQs on  Mode SVC_32
> > > Resetting CPU ...
> > >
> > > resetting ...
> > >
> > > I really need to learn more about u-boot, but google searches suggest
> > > that it means the loadaddr or fdtaddr is incorrect but I'm unable to
> > > find a solution.  Any suggestions?
> >
> > I ran into this issue too. My workaround was to specify a custom uboot
> > version and use the 2015.07 version instead. I didn't have time to
> > debug what had changed, so I'm curious as well what the right solution
> > is.
> >
> > Frank
> >
> > >
> > > I appreciate you working with me, Chris.  I'm obsessed with getting
> this
> > > to work and I feel I'm getting close.
> > >
> > >
> > >
> > >
> > > On Sat, Dec 26, 2015, at 08:00 AM, Chris LaRocque wrote:
> > >> Craig Swank wrote:
> > >>
> > >> > Here is another thing I've found:
> > >> >
> > >> > https://github.com/beagleboard/linux/issues/49
> > >> >
> > >> > In that issue the person had some addresses set incorrectly in
> uEnv.txt,
> > >> > but mine doesn't have any addresses set:
> > >> >
> > >> > bootpart=0:1
> > >> > bootdir=
> > >> > uenvcmd=run loadimage;run loadramdisk;run findfdt;run loadfdt;run
> ram
> > >> > boot
> > >> >
> > >> > Is there something that needs to be set in uEnv.txt?
> > >> >
> > >> >
> > >> > On Wed, Dec 23, 2015, at 02:52 PM, Thomas Petazzoni wrote:
> > >> >> Dear Craig Swank,
> > >> >>
> > >> >> On Wed, 23 Dec 2015 14:45:36 -0800, Craig Swank wrote:
> > >> >> > Is it strange to you that when I do the build the output/build
> > >> >> > directory has both of these dirs?
> > >> >> >
> > >> >> > ?  buildroot git:(master) ? ls output/build/linux-*
> > >> >> > output/build/linux-4.1.4-ti-r9
> > >> >> > output/build/linux-headers-3.12.10
> > >> >>
> > >> >> No, it is perfectly fine. linux-headers is used when building the
> > >> >> toolchain. linux is used to build the kernel itself.
> > >> >>
> > >> >> Thomas
> > >> >> --
> > >> >> Thomas Petazzoni, CTO, Free Electrons
> > >> >> Embedded Linux, Kernel and Android engineering
> > >> >> http://free-electrons.com
> > >> >
> > >> >
> > >> Hello Craig
> > >>
> > >> Hopefully the attachments will be accepted.
> > >>
> > >> The kernel defconfig from beagleboard.org:
> > >>
> > >> 1> doesn't set DEPRECATED_PARAM_STRUCT [=y] in the kernel .config.
> > >> uEnv.txt
> > >> (uboot) passes in the console config as "console=ttyO0,115200n8"
> > >>
> > >> 2> doesn't set EXT2_FS [=y] and the default buildroot .config FS
> image is
> > >> ext2. at least for the beaglebone black and I'm trying to keep things
> > >> sane.
> > >>
> > >> You'll want to do a make source and them make linux-menuconfig and
> change
> > >> the parameters above.
> > >>
> > >> I haven't created a patch file because I'm lazy.
> > >>
> > >> Also attached is my patch (hack) for dtc, derived from Robert Nelsons
> > >> bb.org-overlays.
> > >>
> > >> The dtc patch file goes into BR2_GLOBAL_PATCH_DIR ,
> > >> BR2_GLOBAL_PATCH_DIR"/dtc"
> > >>
> > >> Look in the buildroot .config for how I set BR2_GLOBAL_PATCH_DIR.
> you'll
> > >> need to point that to your own global patch directory.
> > >>
> > >> Regards
> > >>
> > >> Chris
> > >> _______________________________________________
> > >> buildroot mailing list
> > >> buildroot at busybox.net
> > >> http://lists.busybox.net/mailman/listinfo/buildroot
> > >> Email had 2 attachments:
> > >> + host-dtc-1.4.1.patch
> > >>   33k (text/x-patch)
> > >> + cleaned_buildroot_v41_12182015_01.config
> > >>   61k (text/plain)
> > >
> > >
> > > --
> > >   Craig Swank
> > >   craigswank at fastmail.fm
> > > _______________________________________________
> > > buildroot mailing list
> > > buildroot at busybox.net
> > > http://lists.busybox.net/mailman/listinfo/buildroot
>
>
> --
>   Craig Swank
>   craigswank at fastmail.fm
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20151226/f30975c5/attachment.html>
