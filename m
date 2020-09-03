From: Petr Vorel <petr.vorel@gmail.com>
Date: Thu,  3 Sep 2020 17:57:27 +0200
Subject: [Buildroot] [PATCH v2 1/2] package/uclibc: bump version to 1.0.35
Message-ID: <20200903155728.19448-1-petr.vorel@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Drop patch from this release.

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
---
 ...ude-hi-and-lo-in-__SYSCALL_CLOBBERS-.patch | 68 -------------------
 package/uclibc/uclibc.hash                    |  4 +-
 package/uclibc/uclibc.mk                      |  2 +-
 3 files changed, 3 insertions(+), 71 deletions(-)
 delete mode 100644 package/uclibc/0001-mips-Do-not-include-hi-and-lo-in-__SYSCALL_CLOBBERS-.patch

diff --git a/package/uclibc/0001-mips-Do-not-include-hi-and-lo-in-__SYSCALL_CLOBBERS-.patch b/package/uclibc/0001-mips-Do-not-include-hi-and-lo-in-__SYSCALL_CLOBBERS-.patch
deleted file mode 100644
index cc8b9d9c0b..0000000000
--- a/package/uclibc/0001-mips-Do-not-include-hi-and-lo-in-__SYSCALL_CLOBBERS-.patch
+++ /dev/null
@@ -1,68 +0,0 @@
-From aad6cdbcff0f5411a09ac524637fea62652786a3 Mon Sep 17 00:00:00 2001
-From: Romain Naour <romain.naour@gmail.com>
-Date: Fri, 8 May 2020 18:39:45 +0200
-Subject: [PATCH] mips: Do not include hi and lo in __SYSCALL_CLOBBERS for R6
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-From [1]
-"GCC 10 (PR 91233) won't silently allow registers that are not architecturally
-available to be present in the clobber list anymore, resulting in build failure
-for mips*r6 targets in form of:
-...
-.../sysdep.h:146:2: error: the register ?lo? cannot be clobbered in ?asm? for the current target
-  146 |  __asm__ volatile (      \
-      |  ^~~~~~~
-
-This is because base R6 ISA doesn't define hi and lo registers w/o DSP extension.
-This patch provides the alternative definitions of __SYSCALL_CLOBBERS for r6
-targets that won't include those registers."
-
-[1] https://sourceware.org/git/?p=glibc.git;a=commit;h=020b2a97bb15f807c0482f0faee2184ed05bcad8
-
-Signed-off-by: Romain Naour <romain.naour@gmail.com>
-Cc: Waldemar Brodkorb <wbx@openadk.org>
----
- libc/sysdeps/linux/mips/bits/syscalls.h | 18 ++++++++++++++----
- 1 file changed, 14 insertions(+), 4 deletions(-)
-
-diff --git a/libc/sysdeps/linux/mips/bits/syscalls.h b/libc/sysdeps/linux/mips/bits/syscalls.h
-index b8f80597e..13728ac55 100644
---- a/libc/sysdeps/linux/mips/bits/syscalls.h
-+++ b/libc/sysdeps/linux/mips/bits/syscalls.h
-@@ -270,8 +270,13 @@
- 	_sys_result;							\
- })
- 
--#define __SYSCALL_CLOBBERS "$1", "$3", "$8", "$9", "$10", "$11", "$12", "$13", \
--	"$14", "$15", "$24", "$25", "hi", "lo", "memory"
-+#if __mips_isa_rev >= 6
-+# define __SYSCALL_CLOBBERS "$1", "$3", "$8", "$9", "$10", "$11", "$12", "$13", \
-+	 "$14", "$15", "$24", "$25", "memory"
-+#else
-+# define __SYSCALL_CLOBBERS "$1", "$3", "$8", "$9", "$10", "$11", "$12", "$13", \
-+	 "$14", "$15", "$24", "$25", "hi", "lo", "memory"
-+#endif
- 
- #else /* N32 || N64 */
- 
-@@ -327,8 +332,13 @@
- 	_sys_result;							\
- })
- 
--#define __SYSCALL_CLOBBERS "$1", "$3", "$10", "$11", "$12", "$13", \
--	"$14", "$15", "$24", "$25", "hi", "lo", "memory"
-+#if __mips_isa_rev >= 6
-+# define __SYSCALL_CLOBBERS "$1", "$3", "$10", "$11", "$12", "$13", \
-+	 "$14", "$15", "$24", "$25", "memory"
-+#else
-+# define __SYSCALL_CLOBBERS "$1", "$3", "$10", "$11", "$12", "$13", \
-+	 "$14", "$15", "$24", "$25", "hi", "lo", "memory"
-+#endif
- 
- #endif
- 
--- 
-2.25.4
-
diff --git a/package/uclibc/uclibc.hash b/package/uclibc/uclibc.hash
index e54f127690..aea2802bac 100644
--- a/package/uclibc/uclibc.hash
+++ b/package/uclibc/uclibc.hash
@@ -1,4 +1,4 @@
-# From https://downloads.uclibc-ng.org/releases/1.0.34/uClibc-ng-1.0.34.tar.xz.sha256
-sha256  e6776229eee8d3f5a1cd29fb4286630e3cb9e97dded4e8f4a3a9bb4fa8c0d5e3  uClibc-ng-1.0.34.tar.xz
+# From https://downloads.uclibc-ng.org/releases/1.0.35/uClibc-ng-1.0.35.tar.xz.sha256
+sha256  4d0ee138f037017695a66b556b70f77a0eab8a238819bcb60af890b7b3382a2b  uClibc-ng-1.0.35.tar.xz
 # Locally calculated
 sha256  6095e9ffa777dd22839f7801aa845b31c9ed07f3d6bf8a26dc5d2dec8ccc0ef3  COPYING.LIB
diff --git a/package/uclibc/uclibc.mk b/package/uclibc/uclibc.mk
index daf81d29b2..0b5e45bcf4 100644
--- a/package/uclibc/uclibc.mk
+++ b/package/uclibc/uclibc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-UCLIBC_VERSION = 1.0.34
+UCLIBC_VERSION = 1.0.35
 UCLIBC_SOURCE = uClibc-ng-$(UCLIBC_VERSION).tar.xz
 UCLIBC_SITE = https://downloads.uclibc-ng.org/releases/$(UCLIBC_VERSION)
 UCLIBC_LICENSE = LGPL-2.1+
-- 
2.28.0
