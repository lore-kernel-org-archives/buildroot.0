From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 21 Jun 2017 00:17:53 +0200
Subject: [Buildroot] [git commit] package/input-tools: remove package
Message-ID: <20170620221747.E387980DAE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=438b2d1369738416b2dc9e23880753b0120ac6a6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

remove input-tools, it has been obsoleted by linuxconsoletools

linuxconsoletools uses the same name as upstream and carries
the latest version of the tools installed by input-tools.

Signed-off-by: Koen Martens <gmc@sonologic.nl>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 Config.in.legacy                     | 38 +++++++++++++++++++++++++++++++
 package/Config.in                    |  1 -
 package/input-tools/0001-rint.patch  | 18 ---------------
 package/input-tools/Config.in        | 27 ----------------------
 package/input-tools/input-tools.hash |  4 ----
 package/input-tools/input-tools.mk   | 44 ------------------------------------
 6 files changed, 38 insertions(+), 94 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 9af0e15..9a53495 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -145,6 +145,44 @@ endif
 ###############################################################################
 comment "Legacy options removed in 2017.08"
 
+config BR2_PACKAGE_INPUT_TOOLS
+	bool "input-tools removed"
+	select BR2_LEGACY
+	select BR2_PACKAGE_LINUXCONSOLETOOLS
+	help
+	  input-tools has been removed, it is replaced by
+	  linuxconsoletools, which has automatically been enabled.
+
+config BR2_PACKAGE_INPUT_TOOLS_INPUTATTACH
+	bool "inputattach moved to linuxconsoletools"
+	select BR2_LEGACY
+	select BR2_PACKAGE_LINUXCONSOLETOOLS
+	select BR2_PACKAGE_LINUXCONSOLETOOLS_INPUTATTACH
+	help
+	  input-tools has been removed, inputattach is now part
+	  of linuxconsoletools, which has automatically been
+	  enabled.
+
+config BR2_PACKAGE_INPUT_TOOLS_JSCAL
+	bool "jscal moved to linuxconsoletools"
+	select BR2_LEGACY
+	select BR2_PACKAGE_LINUXCONSOLETOOLS
+	select BR2_PACKAGE_LINUXCONSOLETOOLS_JOYSTICK
+	help
+	  input-tools has been removed, jscal is now part
+	  of linuxconsoletools, which has automatically been
+	  enabled.
+
+config BR2_PACKAGE_INPUT_TOOLS_JSTEST
+	bool "jstest moved to linuxconsoletools"
+	select BR2_LEGACY
+	select BR2_PACKAGE_LINUXCONSOLETOOLS
+	select BR2_PACKAGE_LINUXCONSOLETOOLS_JOYSTICK
+	help
+	  input-tools has been removed, jstest is now part
+	  of linuxconsoletools, which has automatically been
+	  enabled.
+
 config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_SH
 	bool "SH Sourcery toolchain has been removed"
 	select BR2_LEGACY
diff --git a/package/Config.in b/package/Config.in
index 6bad95d..e640ae6 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -411,7 +411,6 @@ endmenu
 	source "package/i2c-tools/Config.in"
 	source "package/i7z/Config.in"
 	source "package/input-event-daemon/Config.in"
-	source "package/input-tools/Config.in"
 	source "package/intel-microcode/Config.in"
 	source "package/iostat/Config.in"
 	source "package/ipmitool/Config.in"
diff --git a/package/input-tools/0001-rint.patch b/package/input-tools/0001-rint.patch
deleted file mode 100644
index b2aa13f..0000000
--- a/package/input-tools/0001-rint.patch
+++ /dev/null
@@ -1,18 +0,0 @@
-diff -urN joystick-20051019.orig/utils/jscal.c joystick-20051019/utils/jscal.c
---- joystick-20051019.orig/utils/jscal.c	2004-10-19 09:51:52.000000000 +0200
-+++ joystick-20051019/utils/jscal.c	2009-01-18 10:48:50.000000000 +0100
-@@ -141,10 +141,10 @@
- 	c = 32767.0 / (inputs.cmin[1] - inputs.cmax[0]);
- 	d = 32767.0 / (inputs.cmin[2] - inputs.cmax[1]);
- 
--	results[0] = rint(a);
--	results[1] = rint(b);
--	results[2] = rint(c*16384.0);
--	results[3] = rint(d*16384.0);
-+	results[0] = (int) (a + 0.5);
-+	results[1] = (int) (b + 0.5);
-+	results[2] = (int) (c*16384.0 + 0.5);
-+	results[3] = (int) (d*16384.0 + 0.5);
- 
- 	return 1;
- }
diff --git a/package/input-tools/Config.in b/package/input-tools/Config.in
deleted file mode 100644
index 85b4fd0..0000000
--- a/package/input-tools/Config.in
+++ /dev/null
@@ -1,27 +0,0 @@
-config BR2_PACKAGE_INPUT_TOOLS
-	bool "input-tools"
-	help
-	  Tools for the Linux kernel input layer.
-	  http://linuxconsole.sourceforge.net/
-
-if BR2_PACKAGE_INPUT_TOOLS
-
-config BR2_PACKAGE_INPUT_TOOLS_INPUTATTACH
-	bool "inputattach"
-	default y
-	help
-	  Inputattach is used for attaching a serial line to the input layer.
-
-config BR2_PACKAGE_INPUT_TOOLS_JSCAL
-	bool "jscal"
-	default y
-	help
-	  Joystick calibration program.
-
-config BR2_PACKAGE_INPUT_TOOLS_JSTEST
-	bool "jstest"
-	default y
-	help
-	  Joystick test program.
-
-endif
diff --git a/package/input-tools/input-tools.hash b/package/input-tools/input-tools.hash
deleted file mode 100644
index 53b0f92..0000000
--- a/package/input-tools/input-tools.hash
+++ /dev/null
@@ -1,4 +0,0 @@
-# From http://snapshot.debian.org/archive/debian/20141023T043132Z/pool/main/j/joystick/joystick_20051019-12.dsc
-sha256	cb60cb62093f1889a91fcef1cc36546aba406f451941e8d057f095639e6afb89	joystick_20051019.orig.tar.gz
-# From http://snapshot.debian.org/archive/debian/20090630T220234Z/pool/main/j/joystick/joystick_20051019-5.dsc
-sha256	01e9d14a656d594a3e261751233200f740a09c2a538ac71447c104ffe89ec10c	joystick_20051019-5.diff.gz
diff --git a/package/input-tools/input-tools.mk b/package/input-tools/input-tools.mk
deleted file mode 100644
index 6189b3e..0000000
--- a/package/input-tools/input-tools.mk
+++ /dev/null
@@ -1,44 +0,0 @@
-################################################################################
-#
-# input-tools
-#
-################################################################################
-
-INPUT_TOOLS_VERSION = 20051019
-INPUT_TOOLS_SOURCE = joystick_$(INPUT_TOOLS_VERSION).orig.tar.gz
-INPUT_TOOLS_PATCH = joystick_$(INPUT_TOOLS_VERSION)-5.diff.gz
-INPUT_TOOLS_SITE = http://snapshot.debian.org/archive/debian/20101023T043132Z/pool/main/j/joystick
-INPUT_TOOLS_LICENSE = GPL-2.0+
-INPUT_TOOLS_LICENSE_FILES = utils/Makefile
-
-INPUT_TOOLS_TARGETS_$(BR2_PACKAGE_INPUT_TOOLS_INPUTATTACH) += inputattach
-INPUT_TOOLS_TARGETS_$(BR2_PACKAGE_INPUT_TOOLS_JSCAL)       += jscal
-INPUT_TOOLS_TARGETS_$(BR2_PACKAGE_INPUT_TOOLS_JSTEST)      += jstest
-
-define INPUT_TOOLS_DEBIAN_PATCHES
-	if [ -d $(@D)/debian/patches ]; then \
-		$(APPLY_PATCHES) $(@D) $(@D)/debian/patches \*.patch; \
-	fi
-endef
-
-INPUT_TOOLS_POST_PATCH_HOOKS = INPUT_TOOLS_DEBIAN_PATCHES
-
-# jscal needs -lm
-define INPUT_TOOLS_BUILD_CMDS
-	for i in $(filter-out jscal,$(INPUT_TOOLS_TARGETS_y)); do \
-		$(TARGET_CC) $(TARGET_CFLAGS) -o $(@D)/$$i $(@D)/utils/$$i.c \
-			$(TARGET_LDFLAGS); \
-	done
-	for i in $(filter jscal,$(INPUT_TOOLS_TARGETS_y)); do \
-		$(TARGET_CC) $(TARGET_CFLAGS) -o $(@D)/$$i $(@D)/utils/$$i.c \
-			$(TARGET_LDFLAGS) -lm; \
-	done
-endef
-
-define INPUT_TOOLS_INSTALL_TARGET_CMDS
-	for i in $(INPUT_TOOLS_TARGETS_y); do \
-		$(INSTALL) -m 755 -D $(@D)/$$i $(TARGET_DIR)/usr/bin/$$i; \
-	done
-endef
-
-$(eval $(generic-package))
