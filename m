From: John Voltz <john.voltz@gmail.com>
Date: Thu, 13 Mar 2008 12:59:34 -0400
Subject: [Buildroot] Problems after building rootfs.i386.ext2
In-Reply-To: <20080313160410.GA13136@mail.mhnet.de>
References: <20080313160410.GA13136@mail.mhnet.de>
Message-ID: <46a136670803130959n7d6cfcaxf8eb0a78d93acf71@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I think when you chroot you need to remount /proc. That can cause weird
problems like you describe. Also try using strace on commands that fail or
freeze up. This can be very enlightening (or confusing). You might not even
be able to chroot into it since you are using uClibc instead of glibc. I
don't know for sure. Does anyone else?

John Voltz


On Thu, Mar 13, 2008 at 12:04 PM, Micha Holzmann <holzmann@gmx.de> wrote:

> Hello all,
>
> after the rootfs ist built, i discoverd some problems which i can not
> solve by myself.
>
>
> Here are some infos about my environment:
>
> It is a Thinkpad R60 Laptop with Core2 Duo and 2GiB RAM.
> Operating system is Kubuntu 7.10 and this is the way i
> tried to make my own buildroot.
> I do not work as root (except the loop mount and chroot).
> I set LANG to C before starting the whole building.
>
>
>  svn co svn://uclibc.org/trunk/buildroot
>  cd buildroot
>  make menuconfig
>
>
> These are the main settings i choose:
>
> Target Architecture (i386)
> Target Architecture Variant (i386)
> Target filesystem options EXT2
> Linux Kernel Version (Linux 2.6.24)
>
> The other settings are left on standard settings.
>
>
> The run make
>
> Aborting.  'target/device/x86/i386/kernel-patches-2.6.24/' is not a
> directory.
> make: ***
> [/home/development/uclibc/buildroot/project_build_i386/uclibc/linux-2.6.24/.patched]
> Error 1
>
>
> I made the dir and started make again
>
>  mkdir -p target/device/x86/i386/kernel-patches-2.6.24/
>
> You should create a .config for your kernel
> and install it as target/device/x86/i386/linux-2.6.24.config
>
> OK, jump to the dir and...
>
>  pushd project_build_i386/uclibc/linux-2.6.24
>  cp /boot/config-2.6.22-14-386 .config
>  make oldconfig
>  popd
>  cp project_build_i386/uclibc/linux-2.6.24/.config
>  target/device/x86/i386/linux-2.6.24.config
>  make
>
> make: *** No rule to make target `package/busybox/busybox-1.9.0.config',
> needed by
> /home/development/uclibc/buildroot/project_build_i386/uclibc/busybox-1.9.1
> /.configured'.
> Stop.
>
> OK, jump to the dir and...
>
>  pushd project_build_i386/uclibc/busybox-1.9.1
>  make menuconfig
>  popd
>  cp project_build_i386/uclibc/busybox-1.9.1/.config
>  package/busybox/busybox-1.9.0.config
>  make
>
>
> After a long time, the rootfs was built. I run make menuconfig again and
> switch on
> [*] native toolchain in the target filesystem
> [*] make
>
> and built the rootfs again.
>
>
> I mount it at loop device and chroot in to it. I could chdir and run some
> programs.
> ls produces the known output but ls -al said:
>
> # ls -al
>
> rupt (core dumped)
>
> and ls -l keep stcuking without any output as long as i do not hit CTRL-C.
>
> The next i tried to compile the gawk sources. In another console (not
> chroot) i extract the sources into the mounted rootfs and run
> ./configure --help.
>
> This stucks also.
>
>
> I searched using google and the list archives but could not find an
> answer. What have i did wrong? I also read the docs/buildrott.html.
>
> If anyone is willing to give me a hint or a link, it is very
> appreceated.
>
>
> Best regards and thanks in adcance,
> Micha Holzmann
>
> --
> GPG Public-Key: send a Mail with Subject: GPG-KEY
> Key fingerprint = 6FEF 16C5 17EF 9573 892B  D810 66B9 8FBD 0EBA 820F
> _______________________________________________
> buildroot mailing list
> buildroot at uclibc.org
> http://busybox.net/mailman/listinfo/buildroot
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20080313/cc1919d7/attachment.htm 
