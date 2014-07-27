From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 27 Jul 2014 16:05:49 +0200
Subject: [Buildroot] [git commit] ltrace: use current master
Message-ID: <20140727162113.038049D2E7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=efee851c614926dd9ed0f49c4808a6d9b4f64eb0
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

ltrace 0.7.3 is the latest release but it is actually broken on ARM
since PTRACE_SINGLESTEP emulation has been removed, see:

http://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/commit/?id=425fc47adb5bb69f76285be77a09a3341a30799e

It fails with:
PTRACE_SINGLESTEP: Input/output error

Using master solves that until a new release is made.

Signed-off-by: Alexandre Belloni <alexandre.belloni@free-electrons.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/ltrace/Config.in               |    1 +
 package/ltrace/ltrace-02-arm-plt.patch |   30 ++++++++++++++++++++++++++++++
 package/ltrace/ltrace.mk               |   13 +++++++++----
 3 files changed, 40 insertions(+), 4 deletions(-)

diff --git a/package/ltrace/Config.in b/package/ltrace/Config.in
index 3448342..aee14bd 100644
--- a/package/ltrace/Config.in
+++ b/package/ltrace/Config.in
@@ -3,6 +3,7 @@ config BR2_PACKAGE_LTRACE
 	depends on (BR2_i386 || BR2_arm || BR2_mips || BR2_mipsel \
 		|| BR2_powerpc || BR2_sparc || BR2_x86_64)
 	select BR2_PACKAGE_LIBELF
+	select BR2_PACKAGE_ELFUTILS
 	help
 	  Debugging program which runs a specified command until it exits.
 	  While the command is executing, ltrace intercepts and records
diff --git a/package/ltrace/ltrace-02-arm-plt.patch b/package/ltrace/ltrace-02-arm-plt.patch
new file mode 100644
index 0000000..f130ce8
--- /dev/null
+++ b/package/ltrace/ltrace-02-arm-plt.patch
@@ -0,0 +1,30 @@
+From 04377d28135e351c8d096c4392a493e937416815 Mon Sep 17 00:00:00 2001
+From: Alexandre Belloni <alexandre.belloni@free-electrons.com>
+Date: Thu, 24 Jul 2014 23:15:20 +0200
+Subject: [PATCH] Allow building with uclibc toolchains
+
+Unfortunately, uclicbc doesn't define SHT_ARM_ATTRIBUTES in elf.h
+
+Signed-off-by: Alexandre Belloni <alexandre.belloni@free-electrons.com>
+---
+ sysdeps/linux-gnu/arm/plt.c | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/sysdeps/linux-gnu/arm/plt.c b/sysdeps/linux-gnu/arm/plt.c
+index 9e9e37f0c5b0..a0a5795eb9cb 100644
+--- a/sysdeps/linux-gnu/arm/plt.c
++++ b/sysdeps/linux-gnu/arm/plt.c
+@@ -28,6 +28,10 @@
+ #include "library.h"
+ #include "ltrace-elf.h"
+ 
++#ifndef SHT_ARM_ATTRIBUTES
++#define SHT_ARM_ATTRIBUTES     0x70000003
++#endif
++
+ static int
+ get_hardfp(uint64_t abi_vfp_args)
+ {
+-- 
+1.9.1
+
diff --git a/package/ltrace/ltrace.mk b/package/ltrace/ltrace.mk
index 99c1af6..0a3a90c 100644
--- a/package/ltrace/ltrace.mk
+++ b/package/ltrace/ltrace.mk
@@ -4,13 +4,18 @@
 #
 ################################################################################
 
-LTRACE_VERSION = 0.7.3
-LTRACE_SITE = http://sources.buildroot.net/
-LTRACE_SOURCE = ltrace-$(LTRACE_VERSION).tar.bz2
-LTRACE_DEPENDENCIES = libelf
+LTRACE_VERSION = 0896ce554f80afdcba81d9754f6104f863dea803
+LTRACE_SITE = git://anonscm.debian.org/collab-maint/ltrace.git
+LTRACE_DEPENDENCIES = libelf elfutils
 LTRACE_CONF_OPT = --disable-werror
 LTRACE_LICENSE = GPLv2
 LTRACE_LICENSE_FILES = COPYING
+LTRACE_AUTORECONF = YES
+
+define LTRACE_CREATE_CONFIG_M4
+	mkdir -p $(@D)/config/m4
+endef
+LTRACE_POST_PATCH_HOOKS += LTRACE_CREATE_CONFIG_M4
 
 # ltrace can use libunwind only if libc has backtrace() support
 # We don't normally do so for uClibc and we can't know if it's external
