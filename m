From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 28 Feb 2017 00:01:23 +0100
Subject: [Buildroot] Analysis of build results for 2017-02-26: librsvg
 failure
In-Reply-To: <20170227142854.34d3fb86@free-electrons.com>
References: <20170227072848.7BD45207F5@mail.free-electrons.com>
 <20170227142854.34d3fb86@free-electrons.com>
Message-ID: <20170228000123.66658172@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Adding Gustavo on this one, there is some gdk-pixbuf stuff involved.

On Mon, 27 Feb 2017 14:28:54 +0100, Thomas Petazzoni wrote:

> >       x86_64 |                librsvg-2.40.16 | NOK | http://autobuild.buildroot.net/results/393145bc9bcb93d6df55ec8c63725c3d9a299957
> >       x86_64 |                librsvg-2.40.16 | NOK | http://autobuild.buildroot.net/results/60af583e52d9ff8efff1bc455e4f842721c5807c
> >       x86_64 |                librsvg-2.40.16 | NOK | http://autobuild.buildroot.net/results/492aaf78f4d47d80bb813810a54121799a5c8d46  
> 
>    Makefile:807: recipe for target 'gdk-pixbuf-loaders' failed
> 
> at installation time. It only happens with that specific x86-64
> toolchain: http://autobuild.buildroot.net/?reason=librsvg-2.40.16.
> 
> Could you be something like the host is x86-64/glibc and the target is
> x86-64/glibc, and it confuses something?

Adding Gustavo in Cc on this one. On my x86-64 machine, the following
defconfig reproduces the issue:

BR2_x86_64=y
BR2_x86_steamroller=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_INIT_NONE=y
BR2_SYSTEM_BIN_SH_NONE=y
# BR2_PACKAGE_BUSYBOX is not set
BR2_PACKAGE_LIBRSVG=y
# BR2_TARGET_ROOTFS_TAR is not set

The command that causes the installation failure is:

   /home/thomas/projets/buildroot/output/host/usr/bin/gdk-pixbuf-query-loaders ./libpixbufloader-svg.la && /home/thomas/projets/buildroot/output/host/usr/bin/gdk-pixbuf-query-loaders

Interestingly, when run outside of the build process, it is successful
(echo $? says 0). However, when run by the package Makefile, it fails
with Error 132. It turns out that it's an "Illegal instruction" error:

( strace -o /tmp/pouet.log /home/thomas/projets/buildroot/output/host/usr/bin/gdk-pixbuf-query-loaders ./libpixbufloader-svg.la && /home/thomas/projets/buildroot/output/host/usr/bin/gdk-pixbuf-query-loaders)
/bin/bash: line 1: 31690 Illegal instruction     strace -o /tmp/pouet.log /home/thomas/projets/buildroot/output/host/usr/bin/gdk-pixbuf-query-loaders ./libpixbufloader-svg.la
Makefile:807: recipe for target 'gdk-pixbuf-loaders' failed
make[4]: *** [gdk-pixbuf-loaders] Error 132

The strace (which was added by me), give:

read(3, "\177ELF\2\1\1\3\0\0\0\0\0\0\0\0\3\0>\0\1\0\0\0\0V\0\0\0\0\0\0"..., 832) = 832
fstat(3, {st_mode=S_IFREG|0644, st_size=1088952, ...}) = 0
mmap(NULL, 3178744, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 3, 0) = 0x7f8df2576000
mprotect(0x7f8df267e000, 2093056, PROT_NONE) = 0
mmap(0x7f8df287d000, 8192, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x107000) = 0x7f8df287d000
close(3)                                = 0
mprotect(0x7f8df287d000, 4096, PROT_READ) = 0
mprotect(0x7f8df361b000, 4096, PROT_READ) = 0
mprotect(0x7f8df556d000, 4096, PROT_READ) = 0
--- SIGILL {si_signo=SIGILL, si_code=ILL_ILLOPN, si_addr=0x7f8df3d26f02} ---
+++ killed by SIGILL +++

So very very early in the program execution, it aborts with an illegal
instruction. I dumped the environment from the Makefile right before
running this command, and couldn't see anything obviously wrong.

Any idea?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
