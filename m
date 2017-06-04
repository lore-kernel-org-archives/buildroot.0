From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 4 Jun 2017 09:34:31 +0200
Subject: [Buildroot] Building gdbserver on m68k Coldfire
Message-ID: <20170604093431.7a19a341@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Waldemar,

As you know, gdbserver currently fails to build on m68k Coldfire due to
the use of fork(). I've investigated this, and it's due to the fact
that gdbserver looks at uClibc __UCLIBC_HAS_MMU__ define (see
https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;a=blob;f=gdb/nat/linux-ptrace.h;h=59549452c0990204ef48451dc2c902c85ee48215;hb=HEAD#l25)
to decide whether to define HAS_NOMMU. If HAS_NOMMU is defined, it uses
vfork().

So, I've fixed this with:

diff --git a/package/uclibc/uclibc.mk b/package/uclibc/uclibc.mk
index bbf389e..7bbbe3e 100644
--- a/package/uclibc/uclibc.mk
+++ b/package/uclibc/uclibc.mk
@@ -260,10 +260,12 @@ endif
 ifeq ($(BR2_USE_MMU),y)
 define UCLIBC_MMU_CONFIG
        $(call KCONFIG_ENABLE_OPT,ARCH_USE_MMU,$(@D)/.config)
+       $(call KCONFIG_ENABLE_OPT,ARCH_HAS_MMU,$(@D)/.config)
 endef
 else
 define UCLIBC_MMU_CONFIG
        $(call KCONFIG_DISABLE_OPT,ARCH_USE_MMU,$(@D)/.config)
+       $(call KCONFIG_DISABLE_OPT,ARCH_HAS_MMU,$(@D)/.config)
 endef
 endif
 
With this fix, the build goes a little bit further, but then fails with:

../nat/linux-ptrace.c: In function 'linux_fork_to_function':
../nat/linux-ptrace.c:282:19: warning: implicit declaration of function 'clone' [-Wimplicit-function-declaration]
       child_pid = clone (function, child_stack + STACK_SIZE,
                   ^
../nat/linux-ptrace.c:283:5: error: 'CLONE_VM' undeclared (first use in this function)
     CLONE_VM | SIGCHLD, child_stack + STACK_SIZE * 2);
     ^
../nat/linux-ptrace.c:283:5: note: each undeclared identifier is reported only once for each function it appears in

It's weird, because this piece of code in linux-ptrace is specifically
written for uClibc/noMMU systems:

https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;a=blob;f=gdb/nat/linux-ptrace.c;h=3265b160749b3b635676b423ec1298a26627d78f;hb=HEAD#l271

Is uClibc/noMMU supposed to support clone() and CLONE_VM ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
