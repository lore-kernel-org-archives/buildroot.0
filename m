From: Martin Banky <martin.banky@gmail.com>
Date: Tue,  5 Oct 2010 13:04:36 -0700
Subject: [Buildroot] [PATCH 1/2] input-tools: convert to gentargets
In-Reply-To: <1286309077-26567-1-git-send-email-Martin.Banky@gmail.com>
References: <1286309077-26567-1-git-send-email-Martin.Banky@gmail.com>
Message-ID: <1286309077-26567-2-git-send-email-Martin.Banky@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Martin Banky <Martin.Banky@gmail.com>
---
 .../input-tools/input-tools-20051019-rint.patch    |   18 ++++
 package/input-tools/input-tools.mk                 |   88 ++++++++-----------
 package/input-tools/joystick-20051019-rint.patch   |   18 ----
 3 files changed, 55 insertions(+), 69 deletions(-)
 create mode 100644 package/input-tools/input-tools-20051019-rint.patch
 delete mode 100644 package/input-tools/joystick-20051019-rint.patch

diff --git a/package/input-tools/input-tools-20051019-rint.patch b/package/input-tools/input-tools-20051019-rint.patch
new file mode 100644
index 0000000..b2aa13f
--- /dev/null
+++ b/package/input-tools/input-tools-20051019-rint.patch
@@ -0,0 +1,18 @@
+diff -urN joystick-20051019.orig/utils/jscal.c joystick-20051019/utils/jscal.c
+--- joystick-20051019.orig/utils/jscal.c	2004-10-19 09:51:52.000000000 +0200
++++ joystick-20051019/utils/jscal.c	2009-01-18 10:48:50.000000000 +0100
+@@ -141,10 +141,10 @@
+ 	c = 32767.0 / (inputs.cmin[1] - inputs.cmax[0]);
+ 	d = 32767.0 / (inputs.cmin[2] - inputs.cmax[1]);
+ 
+-	results[0] = rint(a);
+-	results[1] = rint(b);
+-	results[2] = rint(c*16384.0);
+-	results[3] = rint(d*16384.0);
++	results[0] = (int) (a + 0.5);
++	results[1] = (int) (b + 0.5);
++	results[2] = (int) (c*16384.0 + 0.5);
++	results[3] = (int) (d*16384.0 + 0.5);
+ 
+ 	return 1;
+ }
diff --git a/package/input-tools/input-tools.mk b/package/input-tools/input-tools.mk
index 9f5eb19..d4decc0 100644
--- a/package/input-tools/input-tools.mk
+++ b/package/input-tools/input-tools.mk
@@ -3,64 +3,50 @@
 # input-tools
 #
 #############################################################
+INPUT_TOOLS_VERSION = 20051019
+INPUT_TOOLS_SOURCE = joystick_$(INPUT_TOOLS_VERSION).orig.tar.gz
+INPUT_TOOLS_PATCH = joystick_$(INPUT_TOOLS_VERSION)-5.diff.gz
+INPUT_TOOLS_SITE = $(BR2_DEBIAN_MIRROR)/debian/pool/main/j/joystick/
 
-INPUT_TOOLS_VERSION:=20051019
-INPUT_TOOLS_SOURCE:=joystick_$(INPUT_TOOLS_VERSION).orig.tar.gz
-INPUT_TOOLS_PATCH:=joystick_$(INPUT_TOOLS_VERSION)-2.diff.gz
-INPUT_TOOLS_SITE:=$(BR2_DEBIAN_MIRROR)/debian/pool/main/j/joystick/
-INPUT_TOOLS_DIR:=$(BUILD_DIR)/joystick-$(INPUT_TOOLS_VERSION).orig
-INPUT_TOOLS_CAT:=$(ZCAT)
+INPUT_TOOLS_TARGETS_$(BR2_PACKAGE_INPUT_TOOLS_EVTEST) += evtest
+INPUT_TOOLS_TARGETS_$(BR2_PACKAGE_INPUT_TOOLS_INPUTATTACH) += inputattach
+INPUT_TOOLS_TARGETS_$(BR2_PACKAGE_INPUT_TOOLS_JSCAL) += jscal
+INPUT_TOOLS_TARGETS_$(BR2_PACKAGE_INPUT_TOOLS_JSTEST) += jstest
 
-INPUT_TOOLS_TARGETS-y:=
-
-INPUT_TOOLS_TARGETS-$(BR2_PACKAGE_INPUT_TOOLS_EVTEST) += evtest
-INPUT_TOOLS_TARGETS-$(BR2_PACKAGE_INPUT_TOOLS_INPUTATTACH) += inputattach
-INPUT_TOOLS_TARGETS-$(BR2_PACKAGE_INPUT_TOOLS_JSCAL) += jscal
-INPUT_TOOLS_TARGETS-$(BR2_PACKAGE_INPUT_TOOLS_JSTEST) += jstest
-
-INPUT_TOOLS_TARGETS := $(addprefix $(TARGET_DIR)/usr/bin/, $(INPUT_TOOLS_TARGETS-y))
-INPUT_TOOLS_SOURCES := $(addprefix $(INPUT_TOOLS_DIR)/utils/, \
-	$(addsuffix .c, $(INPUT_TOOLS_TARGETS-y)))
-
-$(DL_DIR)/$(INPUT_TOOLS_SOURCE):
-	$(call DOWNLOAD,$(INPUT_TOOLS_SITE),$(@F))
-
-$(DL_DIR)/$(INPUT_TOOLS_PATCH):
-	$(call DOWNLOAD,$(INPUT_TOOLS_SITE),$(@F))
-
-$(INPUT_TOOLS_DIR)/.unpacked: $(DL_DIR)/$(INPUT_TOOLS_SOURCE) $(DL_DIR)/$(INPUT_TOOLS_PATCH)
-	$(INPUT_TOOLS_CAT) $(DL_DIR)/$(INPUT_TOOLS_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
 ifneq ($(INPUT_TOOLS_PATCH),)
-	(cd $(INPUT_TOOLS_DIR) && $(INPUT_TOOLS_CAT) $(DL_DIR)/$(INPUT_TOOLS_PATCH) | patch -p1)
+define INPUT_TOOLS_DEBIAN_PATCHES
+	if [ -d $(@D)/debian/patches ]; then \
+		(cd $(@D)/debian/patches && for i in *; \
+		 do $(SED) 's,^\+\+\+ .*joystick-$(INPUT_TOOLS_VERSION)/,+++ joystick-$(INPUT_TOOLS_VERSION)/,' $$i; \
+		 done; \
+		); \
+		toolchain/patch-kernel.sh $(@D) $(@D)/debian/patches \*.patch; \
+	fi
+endef
 endif
-	toolchain/patch-kernel.sh $(INPUT_TOOLS_DIR) package/input-tools/ \*.patch
-	touch $@
-
-$(INPUT_TOOLS_SOURCES): $(INPUT_TOOLS_DIR)/.unpacked
 
-$(INPUT_TOOLS_DIR)/utils/%: $(INPUT_TOOLS_DIR)/utils/%.c
-	$(TARGET_CC) $(TARGET_CFLAGS) -o $@ $^
+INPUT_TOOLS_POST_PATCH_HOOKS = INPUT_TOOLS_DEBIAN_PATCHES
 
-$(INPUT_TOOLS_TARGETS): $(TARGET_DIR)/usr/bin/%: $(INPUT_TOOLS_DIR)/utils/%
-	cp -dpf $^ $@
-	$(STRIPCMD) $(STRIP_STRIP_ALL) $@
+define INPUT_TOOLS_BUILD_CMDS
+	(cd $(@D)/utils; \
+		$(TARGET_CC) $(TARGET_CFLAGS) -o evtest evtest.c; \
+		$(TARGET_CC) $(TARGET_CFLAGS) -o inputattach inputattach.c; \
+		$(TARGET_CC) $(TARGET_CFLAGS) -o jscal jscal.c; \
+		$(TARGET_CC) $(TARGET_CFLAGS) -o jstest jstest.c; \
+	)
+endef
 
-input-tools: $(INPUT_TOOLS_TARGETS)
+define INPUT_TOOLS_INSTALL_TARGET_CMDS
+	test -z "$(INPUT_TOOLS_TARGETS_y)" || \
+	install -m 755 $(addprefix $(@D)/utils/,$(INPUT_TOOLS_TARGETS_y)) $(TARGET_DIR)/usr/bin/
+endef
 
-input-tools-source: $(DL_DIR)/$(INPUT_TOOLS_SOURCE) $(DL_DIR)/$(INPUT_TOOLS_PATCH)
+define INPUT_TOOLS_UNINSTALL_TARGET_CMDS
+	rm -f $(addprefix $(TARGET_DIR)/usr/bin/,$(INPUT_TOOLS_TARGETS_y))
+endef
 
-input-tools-unpacked: $(INPUT_TOOLS_DIR)/.unpacked
+define INPUT_TOOLS_CLEAN_CMDS
+	rm -f $(addprefix $(@D)/utils/,$(INPUT_TOOLS_TARGETS_y))
+endef
 
-input-tools-clean:
-	rm -f $(INPUT_TOOLS_TARGETS)
-
-input-tools-dirclean:
-	rm -rf $(INPUT_TOOLS_DIR)
-#############################################################
-#
-# Toplevel Makefile options
-#
-#############################################################
-ifeq ($(BR2_PACKAGE_INPUT_TOOLS),y)
-TARGETS+=input-tools
-endif
+$(eval $(call GENTARGETS,package,input-tools))
diff --git a/package/input-tools/joystick-20051019-rint.patch b/package/input-tools/joystick-20051019-rint.patch
deleted file mode 100644
index b2aa13f..0000000
--- a/package/input-tools/joystick-20051019-rint.patch
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
-- 
1.7.3.1
