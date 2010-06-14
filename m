From: Will Moore <will.moore@beraninstruments.com>
Date: Mon, 14 Jun 2010 09:42:27 +0100
Subject: [Buildroot] Annoying... nothing work at all :-(
In-Reply-To: <1276442348.14503.5.camel@localhost>
References: <1276398794.8108.31.camel@localhost> <20100613111949.358df33a@surf>
	<1276442348.14503.5.camel@localhost>
Message-ID: <D5E5BA12BC8A4D75B190A080DE36F259@AP366>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> -----Original Message-----
> From: buildroot-bounces at busybox.net [mailto:buildroot-bounces at busybox.net]
> On Behalf Of sani.broyeur
> Sent: 13 June 2010 16:19
> To: buildroot at busybox.net
> Subject: Re: [Buildroot] Annoying... nothing work at all :-(
> 
> OK thanks Thomas, let's be more accurate, step by step:
> 
> 0) My experience is not an "insult", juste a "result" :-)
> 
> 1) tar -xvzf buildroot-2010.05.tar.gz --> OK.
> 
> 2) cd buildroot-2010.05 --> OK.
> 
> 3) make menuconfig
> - no changes at all made to default options
> - save on exit
> 
> 4) make --> OK. rootfs.ext2 created in output/images
> 
> 5) make menuconfig again to ask for a kernel
> - kernel type -> advanced configuration
>         linux kernel version -> latest
>         patch -> no
>         linux kernel configuration -> Run make ARCH=$(ARCH) [xconfig|
> menuconfig] before build
>         kernel binary -> bZimage
>         destination -> copy kernel to root file
> - save on exit
> 
> 6) make
> 
> make[1]: *** [insmod.static] Erreur 1
> make[1]: *** Attente des t?ches non termin?es....
> make[1]: quittant le r?pertoire
> ? /devel/buildroot-2010.05/output/toolchain/module-init-tools-3.2.2 ?
> make: ***
> [/devel/buildroot-2010.05/output/toolchain/module-init-tools-3.2.2/depmod]
> Erreur 2
> [root at hercules buildroot-2010.05]#
> 
> -> Message means "waiting for unfinished tasks": the "-j 2" option in
> make invocation (defaut = 2) is perhaps the cause. Relaunch!
> 
> 7) make again
> 
> rm -rf /devel/buildroot-2010.05/output/build/buildroot-config
> mkdir -p /devel/buildroot-2010.05/output/build
> cp -dpRf
> package/config/buildroot-config /devel/buildroot-
> 2010.05/output/build/buildroot-config
> /usr/bin/make -j2
> -C /devel/buildroot-2010.05/output/toolchain/module-init-tools-3.2.2
> make[1]: entrant dans le r?pertoire
> ? /devel/buildroot-2010.05/output/toolchain/module-init-tools-3.2.2 ?
> /usr/lib64/ccache/gcc  -g -O2 -Wunused -Wall   -o lsmod  lsmod.o
> /usr/lib64/ccache/gcc  -g -O2 -Wunused -Wall   -o insmod  insmod.o
> /usr/lib64/ccache/gcc  -g -O2 -Wunused -Wall   -o rmmod  rmmod.o
> /usr/lib64/ccache/gcc  -g -O2 -Wunused -Wall   -o modprobe  modprobe.o
> zlibsupport.o
> /usr/lib64/ccache/gcc  -g -O2 -Wunused -Wall   -o depmod  depmod.o
> moduleops.o tables.o zlibsupport.o
> /usr/lib64/ccache/gcc  -g -O2 -Wunused -Wall   -o modinfo  modinfo.o
> zlibsupport.o
> /usr/lib64/ccache/gcc  -g -O2 -Wunused -Wall   -o insmod.static -static
> insmod.o
> /usr/bin/ld: cannot find -lc
> collect2: ld a retourn? 1 code d'?tat d'ex?cution
> make[1]: *** [insmod.static] Erreur 1
> make[1]: quittant le r?pertoire
> ? /devel/buildroot-2010.05/output/toolchain/module-init-tools-3.2.2 ?
> make: ***
> [/devel/buildroot-2010.05/output/toolchain/module-init-tools-3.2.2/depmod]
> Erreur 2
> 
> -> ld perhaps invoked with an empty variable leading to syntax mismatch,
> option taken for parameter or missing one, or something alike. Relaunch!
> 
> 8) make again
> 
> This time, "linux26-menuconfig" is automagically invoked as expected.
> - Just changed: SMP support [disable] / CPU type [ATOM]
> - No optimization nor kernel tayloring for the embedded x86 target.
> Let's make it simple :-)
> - save changes on exit
> make goes on, generating all the regular stuff.
> [...] MODPOST 1975 modules
> [...]
> Root device is (8, 2)
> Setup is 13516 bytes (padded to 13824 bytes).
> System is 3183 kB
> CRC f8992a55
> Kernel: arch/x86/boot/bzImage is ready  (#1)
> [...]
> /devel/buildroot-2010.05/output/target/boot/bzImage -> OK a kernel is
> generated.
> [...]
> >>>   Generating root filesystem image rootfs.ext2
> rm -f /devel/buildroot-2010.05/output/build/_fakeroot.fs
> touch /devel/buildroot-2010.05/output/build/.fakeroot.00000
> cat /devel/buildroot-2010.05/output/build/.fakeroot*
> > /devel/buildroot-2010.05/output/build/_fakeroot.fs
> echo "chown -R 0:0 /devel/buildroot-2010.05/output/target"
> >> /devel/buildroot-2010.05/output/build/_fakeroot.fs
> echo "/devel/buildroot-2010.05/output/host/usr/bin/makedevs -d
> target/generic/device_table.txt /devel/buildroot-2010.05/output/target"
> >> /devel/buildroot-2010.05/output/build/_fakeroot.fs
> echo "
> PATH="/devel/buildroot-2010.05/output/toolchain/bin:/devel/buildroot-
> 2010.05/output/host/bin:/devel/buildroot-
> 2010.05/output/host/usr/bin:/devel/buildroot-
> 2010.05/output/host/usr/sbin/:/devel/buildroot-
> 2010.05/output/staging/bin:/devel/buildroot-
> 2010.05/output/staging/usr/bin:/usr/lib64/qt-
> 3.3/bin:/usr/kerberos/sbin:/usr/kerberos/bin:/usr/lib64/ccache:/usr/local/
> sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin:/root/bin"
> fs/ext2/genext2fs.sh -d /devel/buildroot-2010.05/output/target  -U
> /devel/buildroot-2010.05/output/images/rootfs.ext2" >> /devel/buildroot-
> 2010.05/output/build/_fakeroot.fs
> chmod a+x /devel/buildroot-2010.05/output/build/_fakeroot.fs
> /devel/buildroot-2010.05/output/host/usr/bin/fakeroot
> -- /devel/buildroot-2010.05/output/build/_fakeroot.fs
> rootdir=/devel/buildroot-2010.05/output/target
> table='target/generic/device_table.txt'
> genext2fs: couldn't allocate a block (no free space)
> make: *** [/devel/buildroot-2010.05/output/images/rootfs.ext2] Erreur 1
> 
> -> KO the ext2 fs is NOT generated.
> 
> Of course, there is plenty of Gb available on disk, this error is
> surprising.
> 
> 9) trying to generate something else, i.e cramfs, squashfs and
> initramfs:
> - make menuconfig -> target filesystem option
>         ENABLED cramfs
>         ENABLED squashfs
>         ENABLED initramfs
>         DISABLED ext2
> - save on exit
> 
> 10) make again
> - building of cramfs
> [...]
> >>>   Generating root filesystem image rootfs.cramfs
> warning: estimate of required size (upper bound) is 661MB, but maximum
> image size is 272MB, we might die prematurely
> mkcramfs: filesystem too big
> make: *** [/devel/buildroot-2010.05/output/images/rootfs.cramfs] Erreur
> 8
> 
> 11) let see what we got after attempting to generate either a root fs
> and the corresponding kernel:
> 
> [root at hercules buildroot-2010.05]# ll output/images/
> total 7156
> -rw-r--r-- 1 root root 3272576 juin  13 15:50 bzImage
> -rw-r--r-- 1 root root       0 juin  13 15:50 rootfs.cramfs
> -rw-r--r-- 1 root root 3645440 juin  13 14:08 rootfs.ext2
> -rw-r--r-- 1 root root  394744 juin  13 15:49 rootfs.initramfs
> 
> - kernel seems to be generated (no evidence it will load at this time)
> - rootfs.cramfs isn't generated
> - rootfs.ext2 seems to be generated BUT is not (error above at point 8)
> - rootfs.initramfs is only a text file without any CPIO content:
> 
> [root at hercules buildroot-2010.05]# head output/images/rootfs.initramfs
> 
> #####################
> # /devel/buildroot-2010.05/output/target
> # Last modified: 1276436908.0000000000
> 
> dir /bin 775 0 0
> slink /bin/dmesg busybox 777 0 0
> slink /bin/tar busybox 777 0 0
> slink /bin/watch busybox 777 0 0
> slink /bin/zcat busybox 777 0 0
> 
> [root at hercules buildroot-2010.05]# tail output/images/rootfs.initramfs
> slink /usr/sbin/rdate ../../bin/busybox 777 0 0
> slink /usr/sbin/readprofile ../../bin/busybox 777 0 0
> slink /usr/sbin/setlogcons ../../bin/busybox 777 0 0
> slink /usr/sbin/dnsd ../../bin/busybox 777 0 0
> slink /usr/sbin/chroot ../../bin/busybox 777 0 0
> dir /usr/share 775 0 0
> dir /usr/share/udhcpc 775 0 0
> file /usr/share/udhcpc/default.script /devel/buildroot-
> 2010.05/output/target/usr/share/udhcpc/default.script 755 0 0
> dir /home 775 0 0
> dir /home/default 2755 1000 1000
> [root at hercules buildroot-2010.05]#
> 
> This "rootfs.initramfs" is NOT an initramfs as expected but something
> else I cannot state on.
> 
> 12) additional investigations:
> - asking for a bootloader without kernel prevent errors in target
> filesystems generation, since the size issue is avoided.
> - asking a bootloader in make menuconfig lead to strange things:
>         -> grub only create a /boot/grub subdir in target, but doesn't
> create
> menu.lst nor invoque root (hd0,0) nor setup (hd0,0). Doing it manually
> afterwards is refused.
>         -> sysconfig is an external bootloader, your're right, so
> including it
> in menuconfig could be understood as "prepare a subdir in output/image
> with all the relevant stuff configured, that is: bzImage+ldlinux.sys
> +rootfs.cramfs+syslinux.cfg. Nothing this way is done. What means
> "syslinux" in menuconfig?
> 
> 13) Pending questions...
> - Is buildroot suitable at this time to create tiny x86 embedded
> systems, either by regular filesystem on a disk (ext2) or ramdisk in a
> flashcard (syslinux+initrd) ?

I believe it is, yes.

I have used various versions of buildroot since early 2009 to generate cross
tools, build Linux kernel and a tar of a rootfs for both vortex86SX (486SX)
and vortex86dx (486DX) PC104 embedded X86 boards.  I use the host's syslinux
to generate a Linux boot partition on an IDE flash disk then copy the kernel
across.  I am not sure what you would term tiny, but I am generating tar
rootfs in the order of 2.3MB MB which I then copy across to an ext2 format
partition on the flash disk.

> - Why is there so many unrecoverable errors as I used default presets ?
> - Is there rock-solid examples of bootable x86 systems generated, or
> only "I sware it works, I was aware of an alien CPU card using it long
> time ago in a distant galaxy" :-)))

Yes.  Naturally I have a number of rock-solid examples of configurations for
bootable x86 systems generated by buildroot, as above.  I am running ICOP
VSX-6154 and ICOP VSX-6354 PC104 cards.

> 
> Please remember: this not an "insult", just a "result" ;-)
> 
> Best regards.
> 
> 
> 
> Le dimanche 13 juin 2010 ? 11:19 +0200, Thomas Petazzoni a ?crit :
> > Hello,
> >
> > On Sun, 13 Jun 2010 05:13:14 +0200
> > "sani.broyeur" <sani.broyeur@free.fr> wrote:
> >
> > > - When invoking "make menuconfig && make" an ext2 image is created. OK
> > > but unbootable, without bootloader nor kernel.
> >
> > We've made the choice by default to only build a toolchain + a simple
> > root filesystem image with only Busybox in it. So that's expected.
> >
> > > - When asking to add a bootloader, grub doesn't install properly on
> > > target image, config is not done. This part is broken.
> >
> > What do you expect exactly ? How would you want grub to be installed ?
> > If you're not more specific about what you expect, it's going to be
> > hard to help you.
> >
> > (FYI: I'm currently doing a fairly big bootloader code cleanup, for
> > which I've sent a 49 patches patch set yesterday on this list. At least
> > with this patch set applied, Grub compiles properly. However, I'm not
> > sure what to do with the resulting binaries.)
> >
> > > - When asking to add a CF/FAT16 bootloader, syslinux doesn't install
> > > at all on target image, this part is also broken since it does really
> > > nothing on the image :-)
> >
> > What do you call "target image" ? The ext2 filesystem ? Then it is
> > expected that syslinux isn't installed *in* it. However, the syslinux
> > image is supposed to be available in output/images/.
> >
> > But again, I know syslinux builds properly with my bootloaders-cleanup
> > branch applied. The bootloader code in Buildroot hasn't been
> > unmaintained for quite some time, so he doesn't surprise me that you
> > encounter issues.
> >
> > Another thing is that Buildroot is used a lot for non-x86 architectures
> > (ARM, PowerPC, etc.), and for these architectures, the bootloader is
> > never *in* the root filesystem image. The fact the bootloader is *in*
> > the root filesystem image is a x86-specific thing, and as we haven't
> > had a lot of x86-related contributions lately, it may well be that
> > we're not doing what should be done for this specific architecture.
> >
> > > - When asking a kernel, attempts lead often to cryptic make errors and
> > > the whole buildroot tree has to be recreated from .tar.gz without
> > > kernel generation. The "kernel" menu in menuconfig is broken, and no
> > > kernel config is invoked at build or within menuconfig.
> >
> > Please provide detailed reproduction steps, because ? attemps lead
> > often to cryptic make errors ? is by no means an useful description of
> > what's happening.
> >
> > FWIW :
> >
> >  * I've built succesfully a kernel yesterday with Buildroot, both ARM
> >    and PowerPC.
> >
> >  * I'm working on a big cleanup of the linux compilation code in
> >    Buildroot, because the current code is way too complicated.
> >
> > > - When invoking linux26-menuconfig (I'v found that one time), either
> > > nothing, or make errors, this one is also broken.
> >
> > Be more specific ?
> >
> > > All produced forms of "target" are either incomplete, or unusable, or
> > > unbootable, when the commands are not ending with errors!
> >
> > Be more specific ?
> >
> > > Is there somewhere an USABLE documentation?
> >
> > The only documentation we have so far is
> > http://buildroot.org/downloads/buildroot.html. Patches welcome.
> >
> > > I'm not a newbie to linux, but this "buildroot project" seems for sure
> > > not usable before years of improvements...
> >
> > We certainly have rough edges, particularly in the area of
> > bootloader/kernel compilation, which haven't seen any
> > cleanup/refactoring since a very, very long time.
> >
> > I'm sorry, but your message is by no means useful :
> >
> >  * You're not giving an appropriate level of precision that would give
> >    us the opportunity to understand and solve the problems you're
> >    facing. For each problem: the .config file that allows to produce
> >    the issue, the behaviour that you see, and the behaviour that you
> >    would expect Buildroot to have.
> >
> >  * You're insulting the work done by the developers on the Buildroot
> >    project, reducing their incentive to help you and to solve your
> >    problems.
> >
> > Thomas
> > --
> > Thomas Petazzoni, Free Electrons
> > Kernel, drivers, real-time and embedded Linux
> > development, consulting, training and support.
> > http://free-electrons.com
> > _______________________________________________
> > buildroot mailing list
> > buildroot at busybox.net
> > http://lists.busybox.net/mailman/listinfo/buildroot
> >
> 
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
