From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 13 Jun 2010 18:41:30 +0200
Subject: [Buildroot] Annoying... nothing work at all :-(
In-Reply-To: <1276442348.14503.5.camel@localhost>
References: <1276398794.8108.31.camel@localhost> <20100613111949.358df33a@surf>
	<1276442348.14503.5.camel@localhost>
Message-ID: <20100613184130.4082a1f6@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Thanks for sharing more precisions about the issues you're having, this
report is actually helpful, even though a little bit more details on
some of the issues are still needed.

On Sun, 13 Jun 2010 17:19:08 +0200
"sani.broyeur" <sani.broyeur@free.fr> wrote:

> 0) My experience is not an "insult", juste a "result" :-)

Sorry, but:

?
I'm not a newbie to linux, but this "buildroot project" seems for sure
not usable before years of improvements...
?

is indeed insulting the work of the developers contributing to
Buildroot.

> 6) make
> 
> make[1]: *** [insmod.static] Erreur 1
> make[1]: *** Attente des t?ches non termin?es....
> make[1]: quittant le r?pertoire
> ? /devel/buildroot-2010.05/output/toolchain/module-init-tools-3.2.2 ?
> make: ***
> [/devel/buildroot-2010.05/output/toolchain/module-init-tools-3.2.2/depmod]
> Erreur 2 [root at hercules buildroot-2010.05]# 
> 
> -> Message means "waiting for unfinished tasks": the "-j 2" option in
> make invocation (defaut = 2) is perhaps the cause. Relaunch!

Please provide the rest of the build log, the real error occured before
that.

> /usr/lib64/ccache/gcc  -g -O2 -Wunused -Wall   -o insmod.static
> -static insmod.o  
> /usr/bin/ld: cannot find -lc
> collect2: ld a retourn? 1 code d'?tat d'ex?cution
> make[1]: *** [insmod.static] Erreur 1
> make[1]: quittant le r?pertoire
> ? /devel/buildroot-2010.05/output/toolchain/module-init-tools-3.2.2 ?
> make: ***
> [/devel/buildroot-2010.05/output/toolchain/module-init-tools-3.2.2/depmod]
> Erreur 2
> 
> -> ld perhaps invoked with an empty variable leading to syntax
> mismatch, option taken for parameter or missing one, or something
> alike. Relaunch!

Here I'm sorry, but it looks like something is broken on your side:
we're just using the gcc/ld of your host. Could you try to disable
ccache on your system and see if it works better ?

If you try to statically compile a simple program on your host, does it
work ?

> make goes on, generating all the regular stuff.
> [...] MODPOST 1975 modules

Ouch, huge number of modules. Certainly not an use case we've been
testing too much.

> >> -- /devel/buildroot-2010.05/output/build/_fakeroot.fs
> rootdir=/devel/buildroot-2010.05/output/target
> table='target/generic/device_table.txt'
> genext2fs: couldn't allocate a block (no free space)
> make: *** [/devel/buildroot-2010.05/output/images/rootfs.ext2] Erreur
> 1 
> 
> -> KO the ext2 fs is NOT generated.

Here, it seems that our help script fs/ext2/genext2fs.sh made a wrong
estimate of the number of blocks the target filesystem should be to
contain all the files of your system.

This is definitely a bug, I'll have a look at it.

> Of course, there is plenty of Gb available on disk, this error is
> surprising.

No, it isn't :-)

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
> make: *** [/devel/buildroot-2010.05/output/images/rootfs.cramfs]
> Erreur 8

By design, cramfs filesystems are limited to ~272 MB. See
http://en.wikipedia.org/wiki/Cramfs:

? Maximum file system size is a little under 272MB. (The last file on
the file system must begin before the 256MB block, but can extend past
it.) ?

Nothing we can really do about: cramfs filesystems are useful for some
embedded systems, and having a 661 MB root filesystem in Buildroot is
definitely not the common case.

Moreover, the message is pretty clear, it's saying: ? filesystem too
big ?

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

Yes, see above explanation.

> - rootfs.ext2 seems to be generated BUT is not (error above at point
> 8)

Yes, see above explanation.

> - rootfs.initramfs is only a text file without any CPIO content:

This is normal, this file is *not* supposed to be a CPIO archive. It is
supposed to be used by the kernel as the CONFIG_INITRAMFS_SOURCE value.
Its purpose is to describe what the initramfs should contain.

> This "rootfs.initramfs" is NOT an initramfs as expected but something
> else I cannot state on.

rootfs.initramfs *IS* the text file that will allow the kernel to
include an initramfs.

> 12) additional investigations:
> - asking for a bootloader without kernel prevent errors in target
> filesystems generation, since the size issue is avoided.

Yes, as these errors are all due to the fact that your filesystem is
much, much bigger than the typical cases we do (< 50 MB).

> - asking a bootloader in make menuconfig lead to strange things:
>         -> grub only create a /boot/grub subdir in target, but doesn't
> create
> menu.lst nor invoque root (hd0,0) nor setup (hd0,0). Doing it manually
> afterwards is refused.

What would you want Buildroot to do exactly with Grub ? Remember that
Buildroot doesn't run as root, and this might limit the actions that
Buildroot can take with regard to the installation of a bootloader.

>         -> sysconfig is an external bootloader, your're right, so
> including it
> in menuconfig could be understood as "prepare a subdir in output/image
> with all the relevant stuff configured, that is: bzImage+ldlinux.sys
> +rootfs.cramfs+syslinux.cfg. Nothing this way is done. What means
> "syslinux" in menuconfig?

I'm not sure what the current syslinux code is doing. In my cleanup,
I've made sure it copies isolinux.bin to output/images. If you'd like
it to do more things, please describe that in detail and I can have a
look at it.

> 13) Pending questions...
> - Is buildroot suitable at this time to create tiny x86 embedded
> systems, either by regular filesystem on a disk (ext2) or ramdisk in a
> flashcard (syslinux+initrd) ?

Yes, but as you can see, there might be issues here and there, mostly
because the bootloader code isn't very good for x86 bootloaders. Some
help on *what* Buildroot should do would be very helpful.

> - Why is there so many unrecoverable errors as I used default
> presets ?

See above explanations. I have no explanation for the module-init-tools
error you had, except that something seems strange with your ccache set
up.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
