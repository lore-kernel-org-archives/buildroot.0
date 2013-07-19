From: Markos Chandras <markos.chandras@imgtec.com>
Date: Fri, 19 Jul 2013 16:57:43 +0100
Subject: [Buildroot] [PATCH v2] uClibc: Add uClibc patch to fix MIPS64/n64
	interpreter
Message-ID: <1374249463-10594-1-git-send-email-markos.chandras@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

uClibc picks the wrong interpreter for MIPS64/n64.
This patch fixes this problem by checking the selected
MIPS ABI instead of the MIPS variant.

The patch has been committed upstream:
http://git.uclibc.org/uClibc/commit/?id=603af30d6992e94ac30a66b953264076f4f2fd71

Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
---
Changes since v1:
- Adjust to new uclibc paths
- Update patch to be compatible with make-3.80 and match the one
actually committed upstream
---
 .../uclibc-0009-mips64-fix-n64-interp.patch        | 51 ++++++++++++++++++++++
 1 file changed, 51 insertions(+)
 create mode 100644 package/uclibc/0.9.33.2/uclibc-0009-mips64-fix-n64-interp.patch

diff --git a/package/uclibc/0.9.33.2/uclibc-0009-mips64-fix-n64-interp.patch b/package/uclibc/0.9.33.2/uclibc-0009-mips64-fix-n64-interp.patch
new file mode 100644
index 0000000..7efef78
--- /dev/null
+++ b/package/uclibc/0.9.33.2/uclibc-0009-mips64-fix-n64-interp.patch
@@ -0,0 +1,51 @@
+From 603af30d6992e94ac30a66b953264076f4f2fd71 Mon Sep 17 00:00:00 2001
+From: Markos Chandras <markos.chandras@imgtec.com>
+Date: Thu, 11 Jul 2013 16:59:16 +0000
+Subject: Rules.mak: MIPS64: Select correct interpreter
+
+gcc (eg 4.7.3) hardcodes the MIPS64 interpreters like this:
+(see gcc/config/linux.h and gcc/config/mips/linux64.h)
+
+o32: UCLIBC_DYNAMIC_LINKER "/lib/ld-uClibc.so.0"
+n32: UCLIBC_DYNAMIC_LINKERN32 "/lib32/ld-uClibc.so.0"
+n64: UCLIBC_DYNAMIC_LINKER64 "/lib/ld64-uClibc.so.0"
+
+The existing check for MIPS64 in uClibc is wrong because it does
+not respect the selected ABI
+
+We fix this by explicitely checking the selected ABI instead of the
+selected MIPS variant.
+
+Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
+Cc: Anthony G. Basile <blueness@gentoo.org>
+Signed-off-by: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
+---
+diff --git a/Rules.mak b/Rules.mak
+index 792b794..889108e 100644
+--- a/Rules.mak
++++ b/Rules.mak
+@@ -138,13 +138,19 @@ export MAJOR_VERSION MINOR_VERSION SUBLEVEL VERSION ABI_VERSION LC_ALL
+ LIBC := libc
+ SHARED_LIBNAME := $(LIBC).so.$(ABI_VERSION)
+ UBACKTRACE_DSO := libubacktrace.so.$(ABI_VERSION)
+-ifneq ($(findstring  $(TARGET_ARCH) , hppa64 ia64 mips64 powerpc64 s390x sparc64 x86_64 ),)
++
++UCLIBC_LDSO_NAME := ld-uClibc
++ARCH_NATIVE_BIT := 32
++ifneq ($(findstring $(TARGET_ARCH),hppa64 ia64 powerpc64 s390x sparc64 x86_64),)
+ UCLIBC_LDSO_NAME := ld64-uClibc
+ ARCH_NATIVE_BIT := 64
+ else
+-UCLIBC_LDSO_NAME := ld-uClibc
+-ARCH_NATIVE_BIT := 32
++ifeq ($(CONFIG_MIPS_N64_ABI),y)
++UCLIBC_LDSO_NAME := ld64-uClibc
++ARCH_NATIVE_BIT := 64
+ endif
++endif
++
+ UCLIBC_LDSO := $(UCLIBC_LDSO_NAME).so.$(ABI_VERSION)
+ NONSHARED_LIBNAME := uclibc_nonshared.a
+ libc := $(top_builddir)lib/$(SHARED_LIBNAME)
+--
+cgit v0.9.1
-- 
1.8.3.2
