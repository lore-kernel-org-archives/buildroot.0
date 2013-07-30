From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 30 Jul 2013 23:29:40 +0200
Subject: [Buildroot] [git commit] uClibc: Add uClibc patch to fix MIPS64/n64
	interpreter
Message-ID: <20130730212952.CC95F9AEBA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=1c834dd1ce5d8b6eedb36126c878dd3f9dbbdb55
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

uClibc picks the wrong interpreter for MIPS64/n64.
This patch fixes this problem by checking the selected
MIPS ABI instead of the MIPS variant.

This patch was sent upstream:
http://lists.uclibc.org/pipermail/uclibc/2013-July/047838.html

Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 toolchain/uClibc/uClibc-0.9.33.2-mips64n64.patch |   52 ++++++++++++++++++++++
 1 files changed, 52 insertions(+), 0 deletions(-)

diff --git a/toolchain/uClibc/uClibc-0.9.33.2-mips64n64.patch b/toolchain/uClibc/uClibc-0.9.33.2-mips64n64.patch
new file mode 100644
index 0000000..6eb3ab9
--- /dev/null
+++ b/toolchain/uClibc/uClibc-0.9.33.2-mips64n64.patch
@@ -0,0 +1,52 @@
+From b598215c00a1f9df5d47ce2a730399787351b782 Mon Sep 17 00:00:00 2001
+From: Markos Chandras <markos.chandras@imgtec.com>
+Date: Mon, 1 Jul 2013 09:59:40 +0100
+Subject: [PATCH uClibc] Rules.mak: MIPS64: Select correct interpreter
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
+---
+ Rules.mak | 12 ++++++++----
+ 1 file changed, 8 insertions(+), 4 deletions(-)
+
+diff --git a/Rules.mak b/Rules.mak
+index 792b794..87eb5ae 100644
+--- a/Rules.mak
++++ b/Rules.mak
+@@ -138,13 +138,17 @@ export MAJOR_VERSION MINOR_VERSION SUBLEVEL VERSION ABI_VERSION LC_ALL
+ LIBC := libc
+ SHARED_LIBNAME := $(LIBC).so.$(ABI_VERSION)
+ UBACKTRACE_DSO := libubacktrace.so.$(ABI_VERSION)
+-ifneq ($(findstring  $(TARGET_ARCH) , hppa64 ia64 mips64 powerpc64 s390x sparc64 x86_64 ),)
+-UCLIBC_LDSO_NAME := ld64-uClibc
+-ARCH_NATIVE_BIT := 64
+-else
++
+ UCLIBC_LDSO_NAME := ld-uClibc
+ ARCH_NATIVE_BIT := 32
++ifneq ($(findstring  $(TARGET_ARCH) , hppa64 ia64 powerpc64 s390x sparc64 x86_64 ),)
++UCLIBC_LDSO_NAME := ld64-uClibc
++ARCH_NATIVE_BIT := 64
++else ifeq ($(CONFIG_MIPS_N64_ABI),y)
++UCLIBC_LDSO_NAME := ld64-uClibc
++ARCH_NATIVE_BIT := 64
+ endif
++
+ UCLIBC_LDSO := $(UCLIBC_LDSO_NAME).so.$(ABI_VERSION)
+ NONSHARED_LIBNAME := uclibc_nonshared.a
+ libc := $(top_builddir)lib/$(SHARED_LIBNAME)
+-- 
+1.8.2.1
+
