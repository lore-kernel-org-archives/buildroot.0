From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Sun,  6 Apr 2008 12:59:22 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package:  input-tools
Message-ID: <20080406195922.A37283C484@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-04-06 12:59:21 -0700 (Sun, 06 Apr 2008)
New Revision: 21657

Log:
buildroot: add input-tools package (evtest, inputattach, jscal, jstest)


Added:
   trunk/buildroot/package/input-tools/
   trunk/buildroot/package/input-tools/Config.in
   trunk/buildroot/package/input-tools/input-tools.mk

Modified:
   trunk/buildroot/package/Config.in


Changeset:
Modified: trunk/buildroot/package/Config.in
===================================================================
--- trunk/buildroot/package/Config.in	2008-04-06 13:32:59 UTC (rev 21656)
+++ trunk/buildroot/package/Config.in	2008-04-06 19:59:21 UTC (rev 21657)
@@ -240,6 +240,7 @@
 source "package/hotplug/Config.in"
 endif
 source "package/hwdata/Config.in"
+source "package/input-tools/Config.in"
 source "package/iostat/Config.in"
 source "package/libaio/Config.in"
 source "package/libraw1394/Config.in"

Added: trunk/buildroot/package/input-tools/Config.in
===================================================================
--- trunk/buildroot/package/input-tools/Config.in	                        (rev 0)
+++ trunk/buildroot/package/input-tools/Config.in	2008-04-06 19:59:21 UTC (rev 21657)
@@ -0,0 +1,34 @@
+config BR2_PACKAGE_INPUT_TOOLS
+	bool "input-tools"
+	default n
+	help
+	  Tools for the Linux kernel input layer.
+	  http://linuxconsole.sourceforge.net/
+
+config BR2_PACKAGE_INPUT_TOOLS_EVTEST
+        bool "evtest"
+        depends on BR2_PACKAGE_INPUT_TOOLS
+        default y
+        help
+	  Input event interface test program.
+
+config BR2_PACKAGE_INPUT_TOOLS_INPUTATTACH
+        bool "inputattach"
+        depends on BR2_PACKAGE_INPUT_TOOLS
+        default y
+        help
+	  Inputattach is used for attaching a serial line to the input layer.
+
+config BR2_PACKAGE_INPUT_TOOLS_JSCAL
+        bool "jscal"
+        depends on BR2_PACKAGE_INPUT_TOOLS
+        default y
+        help
+	  Joystick calibration program.
+
+config BR2_PACKAGE_INPUT_TOOLS_JSTEST
+        bool "jstest"
+        depends on BR2_PACKAGE_INPUT_TOOLS
+        default y
+        help
+	  Joystick test program.

Added: trunk/buildroot/package/input-tools/input-tools.mk
===================================================================
--- trunk/buildroot/package/input-tools/input-tools.mk	                        (rev 0)
+++ trunk/buildroot/package/input-tools/input-tools.mk	2008-04-06 19:59:21 UTC (rev 21657)
@@ -0,0 +1,66 @@
+#############################################################
+#
+# input-tools
+#
+#############################################################
+
+INPUT_TOOLS_VERSION:=20051019
+INPUT_TOOLS_SOURCE:=joystick_$(INPUT_TOOLS_VERSION).orig.tar.gz
+INPUT_TOOLS_PATCH:=joystick_$(INPUT_TOOLS_VERSION)-1.1.diff.gz
+INPUT_TOOLS_SITE:=$(BR2_DEBIAN_MIRROR)/debian/pool/main/j/joystick/
+INPUT_TOOLS_DIR:=$(BUILD_DIR)/joystick-$(INPUT_TOOLS_VERSION).orig
+INPUT_TOOLS_CAT:=$(ZCAT)
+
+INPUT_TOOLS_TARGETS-y:=
+
+INPUT_TOOLS_TARGETS-$(BR2_PACKAGE_INPUT_TOOLS_EVTEST) += evtest
+INPUT_TOOLS_TARGETS-$(BR2_PACKAGE_INPUT_TOOLS_INPUTATTACH) += inputattach
+INPUT_TOOLS_TARGETS-$(BR2_PACKAGE_INPUT_TOOLS_JSCAL) += jscal
+INPUT_TOOLS_TARGETS-$(BR2_PACKAGE_INPUT_TOOLS_JSTEST) += jstest
+
+INPUT_TOOLS_TARGETS := $(addprefix $(TARGET_DIR)/usr/bin/, $(INPUT_TOOLS_TARGETS-y))
+INPUT_TOOLS_SOURCES := $(addprefix $(INPUT_TOOLS_DIR)/utils/, \
+	$(addsuffix .c, $(INPUT_TOOLS_TARGETS-y)))
+
+$(DL_DIR)/$(INPUT_TOOLS_SOURCE):
+	$(WGET) -P $(DL_DIR) $(INPUT_TOOLS_SITE)/$(@F)
+
+$(DL_DIR)/$(INPUT_TOOLS_PATCH):
+	$(WGET) -P $(DL_DIR) $(INPUT_TOOLS_SITE)/$(@F)
+
+$(INPUT_TOOLS_DIR)/.unpacked: $(DL_DIR)/$(INPUT_TOOLS_SOURCE) $(DL_DIR)/$(INPUT_TOOLS_PATCH)
+	$(INPUT_TOOLS_CAT) $(DL_DIR)/$(INPUT_TOOLS_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
+ifneq ($(INPUT_TOOLS_PATCH),)
+	(cd $(INPUT_TOOLS_DIR) && $(INPUT_TOOLS_CAT) $(DL_DIR)/$(INPUT_TOOLS_PATCH) | patch -p1)
+endif
+	toolchain/patch-kernel.sh $(INPUT_TOOLS_DIR) package/input-tools/ \*.patch
+	touch $@
+
+$(INPUT_TOOLS_SOURCES): $(INPUT_TOOLS_DIR)/.unpacked
+
+$(INPUT_TOOLS_DIR)/utils/%: $(INPUT_TOOLS_DIR)/utils/%.c
+	$(TARGET_CC) $(TARGET_CFLAGS) -o $@ $^
+
+$(INPUT_TOOLS_TARGETS): $(TARGET_DIR)/usr/bin/%: $(INPUT_TOOLS_DIR)/utils/%
+	cp -dpf $^ $@
+	$(STRIPCMD) $(STRIP_STRIP_ALL) $@
+
+input-tools: uclibc $(INPUT_TOOLS_TARGETS)
+
+input-tools-source: $(DL_DIR)/$(INPUT_TOOLS_SOURCE) $(DL_DIR)/$(INPUT_TOOLS_PATCH)
+
+input-tools-unpacked: $(INPUT_TOOLS_DIR)/.unpacked
+
+input-tools-clean:
+	rm -f $(INPUT_TOOLS_TARGETS)
+
+input-tools-dirclean:
+	rm -rf $(INPUT_TOOLS_DIR)
+#############################################################
+#
+# Toplevel Makefile options
+#
+#############################################################
+ifeq ($(strip $(BR2_PACKAGE_INPUT_TOOLS)),y)
+TARGETS+=input-tools
+endif
