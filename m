From: Peter Huewe <PeterHuewe@gmx.de>
Date: Thu, 13 May 2010 01:15:00 +0200
Subject: [Buildroot] [PATCH] package: Add support for clex filemanager (v
	3.19)
Message-ID: <201005130115.00927.PeterHuewe@gmx.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Peter Huewe <peterhuewe@gmx.de>

Clex is a free and open source ncurses filemanager.
(somewhat similar to a lightweight midnight commander)

"It displays directory contents including the file status
details and provides features like command history, filename
insertion, or name completion in order to help users to create
commands to be executed by the shell."

For more information visit http://www.clex.sk/about.html

This patch adds version 3.19 to the buildroot buildsystem.

Tested on and compiled with atmel ngw100_defconfig.

Signed-off-by: Peter Huewe <peterhuewe@gmx.de>
---
 package/Config.in                   |    1 +
 package/clex/Config.in              |    6 ++
 package/clex/clex-3.19-delkey.patch |   11 ++++
 package/clex/clex.mk                |  103 +++++++++++++++++++++++++++++++++++
 4 files changed, 121 insertions(+), 0 deletions(-)
 create mode 100644 package/clex/Config.in
 create mode 100644 package/clex/clex-3.19-delkey.patch
 create mode 100644 package/clex/clex.mk

diff --git a/package/Config.in b/package/Config.in
index d3c4316..1442107 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -448,6 +448,7 @@ source "package/logrotate/Config.in"
 source "package/screen/Config.in"
 source "package/sudo/Config.in"
 source "package/which/Config.in"
+source "package/clex/Config.in"
 endmenu
 
 menu "System tools"
diff --git a/package/clex/Config.in b/package/clex/Config.in
new file mode 100644
index 0000000..21a1181
--- /dev/null
+++ b/package/clex/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_CLEX
+	bool "clex filemanager"
+	default n
+	help
+		Ncurses file manager with a full-screen user interface
+		http://www.clex.sk/
diff --git a/package/clex/clex-3.19-delkey.patch b/package/clex/clex-3.19-delkey.patch
new file mode 100644
index 0000000..02e656e
--- /dev/null
+++ b/package/clex/clex-3.19-delkey.patch
@@ -0,0 +1,11 @@
+--- clex-3.18/src/inout.c.orig	2008-11-10 17:59:31.176202820 +0100
++++ clex-3.18/src/inout.c	2008-11-10 18:01:50.191201069 +0100
+@@ -306,6 +306,8 @@ kbd_getraw(void)
+ 		if (key == KEY_SUSPEND)
+ 			return CH_CTRL('Z');
+ #endif
++		if (key == 0177) /* my term uses this key for backspace DEL in ascii*/
++			return CH_CTRL('H');
+ 		if (key == KEY_BACKSPACE)
+ 			return CH_CTRL('H');
+ 		if (key == KEY_ENTER)
diff --git a/package/clex/clex.mk b/package/clex/clex.mk
new file mode 100644
index 0000000..723971f
--- /dev/null
+++ b/package/clex/clex.mk
@@ -0,0 +1,103 @@
+#############################################################
+#
+# clex filemanager
+#
+#
+# CLEX (pronounced KLEKS) is a file manager with a full-screen
+# user interface. It displays directory contents including the
+# file status details and provides features like command history,
+# filename insertion, or name completion in order to help users
+# to create commands to be executed by the shell.
+#
+# CLEX is a versatile tool for system administrators and all
+# users that utilize the enormous power of the command line.
+# Its unique one-panel user interface enhances productivity
+# and lessens the probability of mistake. There are no
+# built-in commands, CLEX is an add-on to your favorite shell.
+#
+# CLEX is free software released under the terms of GNU
+# General Public License. It is written in C language which
+# makes it easily portable to various Linux and UNIX systems.
+#
+#  Buildroot Script by Peter Huewe <peterhuewe@gmx.de>
+#
+#############################################################
+CLEX_VERSION:=3.19
+CLEX_SOURCE:=clex-$(CLEX_VERSION).tar.gz
+CLEX_SITE:=http://www.clex.sk/download/
+CLEX_DIR:=$(BUILD_DIR)/clex-$(CLEX_VERSION)
+CLEX_BINARY:=clex
+CLEX_CAT:=$(ZCAT)
+CLEX_TARGET_BINARY:=usr/bin/$(CLEX_BINARY)
+
+# The download rule. Main purpose is to download the source package.
+$(DL_DIR)/$(CLEX_SOURCE):
+	$(WGET) -P $(DL_DIR) $(CLEX_SITE)/$(CLEX_SOURCE)
+
+# The unpacking rule. Main purpose is to extract the source package, apply any
+# patches and update config.guess and config.sub.
+$(CLEX_DIR)/.unpacked: $(DL_DIR)/$(CLEX_SOURCE)
+	$(CLEX_CAT) $(DL_DIR)/$(CLEX_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
+	toolchain/patch-kernel.sh $(CLEX_DIR) package/clex/ clex-$(CLEX_VERSION)-\*.patch\*
+	touch $@
+
+# The configure rule. Main purpose is to get the package ready for compilation,
+# usually by running the configure script with different kinds of options
+# specified.
+$(CLEX_DIR)/.configured: $(CLEX_DIR)/.unpacked
+	(cd $(CLEX_DIR); rm -rf config.cache; \
+		$(TARGET_CONFIGURE_OPTS) \
+		$(TARGET_CONFIGURE_ARGS) \
+		./configure \
+		--target=$(GNU_TARGET_NAME) \
+		--host=$(GNU_TARGET_NAME) \
+		--build=$(GNU_HOST_NAME) \
+		--prefix=/usr \
+		--sysconfdir=/etc \
+		$(DISABLE_NLS) \
+		$(DISABLE_LARGEFILE) \
+	)
+	touch $@
+
+$(CLEX_DIR)/$(CLEX_BINARY): $(CLEX_DIR)/.configured
+	$(MAKE) -C $(CLEX_DIR)
+
+# The installing rule. Main purpose is to install the binary into the target
+# root directory and make sure it is stripped from debug symbols to reduce the
+# space requirements to a minimum.
+#
+# Only the files needed to run the application should be installed to the
+# target root directory, to not waste valuable flash space.
+$(TARGET_DIR)/$(CLEX_TARGET_BINARY): $(CLEX_DIR)/$(CLEX_BINARY)
+	cp -dpf $(CLEX_DIR)/src/clex $@
+	$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $@
+
+# Main rule which shows which other packages must be installed before the clex
+# package is installed. This to ensure that all depending libraries are
+# installed.
+clex:	uclibc $(TARGET_DIR)/$(CLEX_TARGET_BINARY)
+
+# Source download rule. Main purpose to download the source package. Since some
+# people would like to work offline, it is mandotory to implement a rule which
+# downloads everything this package needs.
+clex-source: $(DL_DIR)/$(CLEX_SOURCE)
+
+# Clean rule. Main purpose is to clean the build directory, thus forcing a new
+# rebuild the next time Buildroot is made.
+clex-clean:
+	-$(MAKE) -C $(CLEX_DIR) clean
+
+# Directory clean rule. Main purpose is to remove the build directory, forcing
+# a new extraction, patching and rebuild the next time Buildroot is made.
+clex-dirclean:
+	rm -rf $(CLEX_DIR)
+
+#############################################################
+#
+# Toplevel Makefile options
+#
+#############################################################
+# This is how the clex package is added to the list of rules to build.
+ifeq ($(strip $(BR2_PACKAGE_CLEX)),y)
+TARGETS+=clex
+endif
-- 
1.5.6.5
