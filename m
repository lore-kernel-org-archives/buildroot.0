From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 17 Sep 2020 23:14:45 +0200
Subject: [Buildroot] [git commit] package/libseccomp: bump version to 2.4.4
Message-ID: <20200917210557.A40868B874@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2ff81c925dc56b8a0d213fa27eed35fd8a189bd4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Brings support for 5.8 syscalls and adds various fixes.

Drop 0001-remove-static.patch as it is upstream since 2.4.3:
https://github.com/seccomp/libseccomp/commit/2a1b67825842c6c75ca898f09f0d9c99339e1fa8

Drop 0002-Circumvent-bug-in-uClibc-ng-syscall-on-x86_64-system.patch as the
uClibc-ng issue is fixed in 1.0.33:
https://cgit.uclibc-ng.org/cgi/cgit/uclibc-ng.git/commit/?id=01e863c89fc772a406fe56c6dddb39f71a570c06

Download upstream uploaded tarball rather than using the github macro,
and use upstream hash and reformat hash file. This allows to drop
AUTORECONF = YES.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libseccomp/0001-remove-static.patch        | 40 -----------
 ...bug-in-uClibc-ng-syscall-on-x86_64-system.patch | 80 ----------------------
 package/libseccomp/libseccomp.hash                 |  5 +-
 package/libseccomp/libseccomp.mk                   |  5 +-
 4 files changed, 5 insertions(+), 125 deletions(-)

diff --git a/package/libseccomp/0001-remove-static.patch b/package/libseccomp/0001-remove-static.patch
deleted file mode 100644
index 60a1ff00b6..0000000000
--- a/package/libseccomp/0001-remove-static.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From 5d010fb06eae43b284e5ccc322f6de47eb42b751 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Sat, 2 Jun 2018 13:45:22 +0200
-Subject: [PATCH] remove static
-
-Do not force static link of tools, it breaks build with:
-BR2_SHARED_LIBS=y
-
-Patch retrieved from
-https://git.buildroot.net/buildroot/tree/package/libseccomp/0001-remove-static.patch
-and slighly updated to work with 2.3.3
-
-[Upstream status: https://github.com/seccomp/libseccomp/pull/121]
-
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Peter: updated for v2.4.0 which adds scmp_api_level]
-Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
----
- tools/Makefile.am | 3 ---
- 1 file changed, 3 deletions(-)
-
-diff --git a/tools/Makefile.am b/tools/Makefile.am
-index f768365..5f9d571 100644
---- a/tools/Makefile.am
-+++ b/tools/Makefile.am
-@@ -37,10 +37,7 @@ scmp_bpf_sim_SOURCES = scmp_bpf_sim.c bpf.h util.h
- scmp_api_level_SOURCES = scmp_api_level.c
- 
- scmp_sys_resolver_LDADD = ../src/libseccomp.la
--scmp_sys_resolver_LDFLAGS = -static
- scmp_arch_detect_LDADD = ../src/libseccomp.la
--scmp_arch_detect_LDFLAGS = -static
- scmp_bpf_disasm_LDADD = util.la
- scmp_bpf_sim_LDADD = util.la
- scmp_api_level_LDADD = ../src/libseccomp.la
--scmp_api_level_LDFLAGS = -static
--- 
-2.11.0
-
diff --git a/package/libseccomp/0002-Circumvent-bug-in-uClibc-ng-syscall-on-x86_64-system.patch b/package/libseccomp/0002-Circumvent-bug-in-uClibc-ng-syscall-on-x86_64-system.patch
deleted file mode 100644
index 6ac9b08a76..0000000000
--- a/package/libseccomp/0002-Circumvent-bug-in-uClibc-ng-syscall-on-x86_64-system.patch
+++ /dev/null
@@ -1,80 +0,0 @@
-From 613e601bb4b50dc359b41f162a5b629449e4bbea Mon Sep 17 00:00:00 2001
-From: Carlos Santos <casantos@redhat.com>
-Date: Fri, 18 Oct 2019 22:02:49 -0300
-Subject: [PATCH] Circumvent bug in uClibc-ng syscall() on x86_64 systems
-
-On uClibc at least up to v1.0.32, syscall() for x86_64 is defined in
-libc/sysdeps/linux/x86_64/syscall.S as
-
-syscall:
-        movq %rdi, %rax         /* Syscall number -> rax.  */
-        movq %rsi, %rdi         /* shift arg1 - arg5.  */
-        movq %rdx, %rsi
-        movq %rcx, %rdx
-        movq %r8, %r10
-        movq %r9, %r8
-        movq 8(%rsp),%r9        /* arg6 is on the stack.  */
-        syscall                 /* Do the system call.  */
-        cmpq $-4095, %rax       /* Check %rax for error.  */
-        jae __syscall_error     /* Branch forward if it failed.  */
-        ret                     /* Return to caller.  */
-
-And __syscall_error is defined in
-libc/sysdeps/linux/x86_64/__syscall_error.c as
-
-int __syscall_error(void) attribute_hidden;
-int __syscall_error(void)
-{
-	register int err_no __asm__ ("%rcx");
-	__asm__ ("mov %rax, %rcx\n\t"
-	         "neg %rcx");
-	__set_errno(err_no);
-	return -1;
-}
-
-Notice that __syscall_error returns -1 as a 32-bit int in %rax, a 64-bit
-register i.e. 0x00000000ffffffff (decimal 4294967295). When this value
-is compared to -1 in _sys_chk_seccomp_flag_kernel() the result is false,
-leading the function to always return 0.
-
-Prevent the error by coercing the return value of syscall() to int in a
-temporary variable before comparing it to -1. We could use just an (int)
-cast but the variable makes the code more readable and the machine code
-generated by the compiler is the same in both cases.
-
-All other syscall() invocations were inspected and they either already
-coerce the result to int or do not compare it to -1.
-
-The same problem probably occurs on other 64-bit systems but so far only
-x86_64 was tested.
-
-A bug report is being submitted to uClibc.
-
-Signed-off-by: Carlos Santos <casantos@redhat.com>
----
- src/system.c | 8 +++++---
- 1 file changed, 5 insertions(+), 3 deletions(-)
-
-diff --git a/src/system.c b/src/system.c
-index 8e5aafc..811b401 100644
---- a/src/system.c
-+++ b/src/system.c
-@@ -215,10 +215,12 @@ static int _sys_chk_seccomp_flag_kernel(int flag)
- 	/* this is an invalid seccomp(2) call because the last argument
- 	 * is NULL, but depending on the errno value of EFAULT we can
- 	 * guess if the filter flag is supported or not */
--	if (sys_chk_seccomp_syscall() == 1 &&
--	    syscall(_nr_seccomp, SECCOMP_SET_MODE_FILTER, flag, NULL) == -1 &&
--	    errno == EFAULT)
-+	int rc;
-+	if (sys_chk_seccomp_syscall() == 1) {
-+	    rc = syscall(_nr_seccomp, SECCOMP_SET_MODE_FILTER, flag, NULL);
-+	    if (rc == -1 && errno == EFAULT)
- 		return 1;
-+	}
- 
- 	return 0;
- }
--- 
-2.18.1
-
diff --git a/package/libseccomp/libseccomp.hash b/package/libseccomp/libseccomp.hash
index 39c5f8aa38..2d07c1c1fa 100644
--- a/package/libseccomp/libseccomp.hash
+++ b/package/libseccomp/libseccomp.hash
@@ -1,3 +1,4 @@
+# From https://github.com/seccomp/libseccomp/releases/tag/v2.4.4
+sha256  4e79738d1ef3c9b7ca9769f1f8b8d84fc17143c2c1c432e53b9c64787e0ff3eb  libseccomp-2.4.4.tar.gz
 # Locally calculated
-sha256 36aa502c0461ae9efc6c93ec2430d6badd9bf91ecbe73806baf7b7c6f687ab4f libseccomp-2.4.1.tar.gz
-sha256 102900208eef27b766380135906d431dba87edaa7ec6aa72e6ebd3dd67f3a97b LICENSE
+sha256  102900208eef27b766380135906d431dba87edaa7ec6aa72e6ebd3dd67f3a97b  LICENSE
diff --git a/package/libseccomp/libseccomp.mk b/package/libseccomp/libseccomp.mk
index 491e51b375..cea3d28604 100644
--- a/package/libseccomp/libseccomp.mk
+++ b/package/libseccomp/libseccomp.mk
@@ -4,11 +4,10 @@
 #
 ################################################################################
 
-LIBSECCOMP_VERSION = 2.4.1
-LIBSECCOMP_SITE = $(call github,seccomp,libseccomp,v$(LIBSECCOMP_VERSION))
+LIBSECCOMP_VERSION = 2.4.4
+LIBSECCOMP_SITE = https://github.com/seccomp/libseccomp/releases/download/v$(LIBSECCOMP_VERSION)
 LIBSECCOMP_LICENSE = LGPL-2.1
 LIBSECCOMP_LICENSE_FILES = LICENSE
 LIBSECCOMP_INSTALL_STAGING = YES
-LIBSECCOMP_AUTORECONF = YES
 
 $(eval $(autotools-package))
