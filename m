From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
Date: Sat, 31 Jan 2015 15:32:18 +0100
Subject: [Buildroot] [PATCH 1/1] package/uboot-tools: bump to version 2015.01
Message-ID: <1422714738-19397-1-git-send-email-joerg.krause@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bump to version 2015.01:
  * Add dependency for openssl, which is needed for supporting verified boot
  * Building the target 'tools-only' requires a '.config' file, so first make
    a default configuration (which defaults to sandbox_defconfig) as supposed
    on the U-Boot mailing list
    http://lists.denx.de/pipermail/u-boot/2014-September/187866.html
  * Remove patch uboot-tools-02-nostrip, it's upstream
  * Rename remaining patch to new convention

Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
---
 ...ls.patch => 0001-drop-configh-from-tools.patch} |  4 +-
 package/uboot-tools/Config.in                      |  1 +
 package/uboot-tools/Config.in.host                 |  1 +
 package/uboot-tools/uboot-tools-02-nostrip.patch   | 61 ----------------------
 package/uboot-tools/uboot-tools.mk                 |  7 +--
 5 files changed, 8 insertions(+), 66 deletions(-)
 rename package/uboot-tools/{uboot-tools-01-drop-configh-from-tools.patch => 0001-drop-configh-from-tools.patch} (99%)
 delete mode 100644 package/uboot-tools/uboot-tools-02-nostrip.patch

diff --git a/package/uboot-tools/uboot-tools-01-drop-configh-from-tools.patch b/package/uboot-tools/0001-drop-configh-from-tools.patch
similarity index 99%
rename from package/uboot-tools/uboot-tools-01-drop-configh-from-tools.patch
rename to package/uboot-tools/0001-drop-configh-from-tools.patch
index a36332f..cb45ce9 100644
--- a/package/uboot-tools/uboot-tools-01-drop-configh-from-tools.patch
+++ b/package/uboot-tools/0001-drop-configh-from-tools.patch
@@ -11,7 +11,7 @@ index aff471b..dfe7439 100644
 @@ -5,14 +5,6 @@
   * SPDX-License-Identifier:	GPL-2.0+
   */
- 
+
 -/* Pull in the current config to define the default environment */
 -#ifndef __ASSEMBLY__
 -#define __ASSEMBLY__ /* get only #defines from config.h */
@@ -20,6 +20,6 @@ index aff471b..dfe7439 100644
 -#else
 -#include <config.h>
 -#endif
- 
+
  /*
   * To build the utility with the static configuration
diff --git a/package/uboot-tools/Config.in b/package/uboot-tools/Config.in
index 7c8f17c..09090b5 100644
--- a/package/uboot-tools/Config.in
+++ b/package/uboot-tools/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_UBOOT_TOOLS
 	bool "u-boot tools"
+	select BR2_PACKAGE_OPENSSL
 	help
 	  Companion tools for Das U-Boot bootloader.
 
diff --git a/package/uboot-tools/Config.in.host b/package/uboot-tools/Config.in.host
index 7a844e9..12e2fdc 100644
--- a/package/uboot-tools/Config.in.host
+++ b/package/uboot-tools/Config.in.host
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_HOST_UBOOT_TOOLS
 	bool "host u-boot tools"
+	select BR2_PACKAGE_OPENSSL
 	help
 	  Companion tools for Das U-Boot bootloader.
 
diff --git a/package/uboot-tools/uboot-tools-02-nostrip.patch b/package/uboot-tools/uboot-tools-02-nostrip.patch
deleted file mode 100644
index 7333f41..0000000
--- a/package/uboot-tools/uboot-tools-02-nostrip.patch
+++ /dev/null
@@ -1,61 +0,0 @@
-From 17e0d6ddd1dc5d04b8032bde2f2076134b0c6dd7 Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Date: Wed, 27 Aug 2014 14:21:32 +0200
-Subject: [PATCH] tools/env: change stripping strategy to allow no-stripping
-
-When building the U-Boot tools for non-ELF platforms (such as Blackfin
-FLAT), since commit 79fc0c5f498c3982aa4740c273ab1a9255063d9c
-("tools/env: cross-compile fw_printenv without setting HOSTCC"), the
-build fails because it tries to strip a FLAT binary, which does not
-make sense.
-
-This commit solves this by changing the stripping logic in
-tools/env/Makefile to be similar to the one in tools/Makefile. This
-logic continues to apply strip to the final binary, but does not abort
-the build if it fails, and does the stripping in place on the final
-binary. This allows the logic to work fine if stripping doesn't work,
-as it leaves the final binary untouched.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Cc: Masahiro Yamada <yamada.m@jp.panasonic.com>
-Cc: Sonic Zhang <sonic.zhang@analog.com>
----
-An improved solution would be to be able to override STRIP completely
-by setting it to /bin/true, but the main Makefile enforces STRIP =
-$(CROSS_COMPILE)strip.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
----
- tools/env/Makefile | 14 ++++++++------
- 1 file changed, 8 insertions(+), 6 deletions(-)
-
-diff --git a/tools/env/Makefile b/tools/env/Makefile
-index f5368bc..d047aa5 100644
---- a/tools/env/Makefile
-+++ b/tools/env/Makefile
-@@ -21,14 +21,16 @@ HOST_EXTRACFLAGS += -DMTD_OLD
- endif
- 
- always := fw_printenv
--hostprogs-y := fw_printenv_unstripped
-+hostprogs-y := fw_printenv
- 
--fw_printenv_unstripped-objs := fw_env.o fw_env_main.o \
-+fw_printenv-objs := fw_env.o fw_env_main.o \
- 	crc32.o ctype.o linux_string.o \
- 	env_attr.o env_flags.o aes.o
- 
--quiet_cmd_strip = STRIP   $@
--      cmd_strip = $(STRIP) -o $@ $<
-+quiet_cmd_crosstools_strip = STRIP   $^
-+      cmd_crosstools_strip = $(STRIP) $^; touch $@
- 
--$(obj)/fw_printenv: $(obj)/fw_printenv_unstripped FORCE
--	$(call if_changed,strip)
-+$(obj)/.strip: $(obj)/fw_printenv
-+	$(call cmd,crosstools_strip)
-+
-+always += .strip
--- 
-2.0.0
-
diff --git a/package/uboot-tools/uboot-tools.mk b/package/uboot-tools/uboot-tools.mk
index f02bb55..87f83e1 100644
--- a/package/uboot-tools/uboot-tools.mk
+++ b/package/uboot-tools/uboot-tools.mk
@@ -4,11 +4,12 @@
 #
 ################################################################################
 
-UBOOT_TOOLS_VERSION = 2014.07
+UBOOT_TOOLS_VERSION = 2015.01
 UBOOT_TOOLS_SOURCE = u-boot-$(UBOOT_TOOLS_VERSION).tar.bz2
 UBOOT_TOOLS_SITE = ftp://ftp.denx.de/pub/u-boot
 UBOOT_TOOLS_LICENSE = GPLv2+
 UBOOT_TOOLS_LICENSE_FILES = Licenses/gpl-2.0.txt
+UBOOT_TOOLS_DEPENDENCIES = openssl
 
 define UBOOT_TOOLS_BUILD_CMDS
 	$(MAKE) -C $(@D) 			\
@@ -16,7 +17,7 @@ define UBOOT_TOOLS_BUILD_CMDS
 		CFLAGS="$(TARGET_CFLAGS)"	\
 		LDFLAGS="$(TARGET_LDFLAGS)"	\
 		CROSS_BUILD_TOOLS=y		\
-		tools-only
+		defconfig tools-only
 	$(MAKE) -C $(@D) 			\
 		CROSS_COMPILE="$(TARGET_CROSS)"	\
 		CFLAGS="$(TARGET_CFLAGS)"	\
@@ -54,7 +55,7 @@ define HOST_UBOOT_TOOLS_BUILD_CMDS
 		HOSTCC="$(HOSTCC)"		\
 		HOSTCFLAGS="$(HOST_CFLAGS)"	\
 		HOSTLDFLAGS="$(HOST_LDFLAGS)"	\
-		tools-only
+		defconfig tools-only
 endef
 
 define HOST_UBOOT_TOOLS_INSTALL_CMDS
-- 
2.2.2
