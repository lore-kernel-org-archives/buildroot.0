From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 6 Feb 2015 11:03:00 +0100
Subject: [Buildroot] [PATCH] qemu: add architecture dependencies for
	host qemu
In-Reply-To: <87d25n9ybr.fsf@dell.be.48ers.dk>
References: <1423210548-4891-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <87d25n9ybr.fsf@dell.be.48ers.dk>
Message-ID: <20150206110300.5a62a636@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Peter Korsgaard,

On Fri, 06 Feb 2015 10:35:52 +0100, Peter Korsgaard wrote:

> Are you use about BR2_sh? sh4a atleast doesn't look supported:
> 
> http://autobuild.buildroot.net/results/4e5/4e530528c72f0c70f352f39ea09c686753757ecb/build-end.log

Interesting. Here I have:

qemu (master)$ ls linux-user/
aarch64       flatload.c    main.c         ppc       sparc64          uaccess.c
alpha         i386          Makefile.objs  qemu.h    strace.c         uname.c
arm           ioctls.h      microblaze     s390x     strace.list      uname.h
cris          linuxload.c   mips           sh4       syscall.c        unicore32
elfload.c     linux_loop.h  mips64         signal.c  syscall_defs.h   vm86.c
errno_defs.h  m68k          mmap.c         socket.h  syscall_types.h  x86_64
flat.h        m68k-sim.c    openrisc       sparc     target_flat.h

So there is a sh4 directory, which lead me to think that there is user
mode emulation support for SuperH. In fact, I should rather have
used ./configure --help, which says:

  --target-list=LIST       set target list (default: build everything)
                           Available targets: aarch64-softmmu alpha-softmmu 
                           arm-softmmu cris-softmmu i386-softmmu lm32-softmmu 
                           m68k-softmmu microblazeel-softmmu microblaze-softmmu 
                           mips64el-softmmu mips64-softmmu mipsel-softmmu 
                           mips-softmmu moxie-softmmu or32-softmmu 
                           ppc64-softmmu ppcemb-softmmu ppc-softmmu 
                           s390x-softmmu sh4eb-softmmu sh4-softmmu 
                           sparc64-softmmu sparc-softmmu unicore32-softmmu 
                           x86_64-softmmu xtensaeb-softmmu xtensa-softmmu 
                           aarch64-linux-user alpha-linux-user armeb-linux-user 
                           arm-linux-user cris-linux-user i386-linux-user 
                           m68k-linux-user microblazeel-linux-user 
                           microblaze-linux-user mips64el-linux-user 
                           mips64-linux-user mipsel-linux-user mips-linux-user 
                           mipsn32el-linux-user mipsn32-linux-user 
                           or32-linux-user ppc64abi32-linux-user 
                           ppc64le-linux-user ppc64-linux-user ppc-linux-user 
                           s390x-linux-user sh4eb-linux-user sh4-linux-user 
                           sparc32plus-linux-user sparc64-linux-user 
                           sparc-linux-user unicore32-linux-user 
                           x86_64-linux-user

So there is sh4 support, but it's named sh4-linux-user, not
sh4a-linux-user, so we need another exception in qemu.mk.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
