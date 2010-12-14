From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 14 Dec 2010 01:35:41 +0100
Subject: [Buildroot] [git commit master 1/1] input-tools: convert to
	gentargets
Message-ID: <20101214003640.E50638E2DA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=fbda1203878e597fdfc7382664eaa80416d116d2
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Martin Banky <Martin.Banky@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                                            |    6 +-
 ...-rint.patch => input-tools-20051019-rint.patch} |    0
 package/input-tools/input-tools.mk                 |  102 ++++++++------------
 3 files changed, 44 insertions(+), 64 deletions(-)
 rename package/input-tools/{joystick-20051019-rint.patch => input-tools-20051019-rint.patch} (100%)

diff --git a/CHANGES b/CHANGES
index 2d3bbb6..79dac1b 100644
--- a/CHANGES
+++ b/CHANGES
@@ -5,9 +5,9 @@
 
 	Updated/fixed packages: at, busybox, bzip2, dbus,
 	direcfb-examples, dmalloc, cloop, cups, ffmpeg, gdk-pixbuf,
-	hostapd, i2c-tools, libconfig, ltp-testsuite, m4, openssh,
-	openssl, openvpn, pango, qt, rsync, sdl_gfx, sdl_sound, udev,
-	usbutils, xz, zlib
+	hostapd, i2c-tools, input-tools, libconfig, ltp-testsuite, m4,
+	openssh, openssl, openvpn, pango, qt, rsync, sdl_gfx,
+	sdl_sound, udev, usbutils, xz, zlib
 
 	New packages: dhrystone, fbgrab, lsuio, rsh-redone, whetstone
 
diff --git a/package/input-tools/joystick-20051019-rint.patch b/package/input-tools/input-tools-20051019-rint.patch
similarity index 100%
rename from package/input-tools/joystick-20051019-rint.patch
rename to package/input-tools/input-tools-20051019-rint.patch
diff --git a/package/input-tools/input-tools.mk b/package/input-tools/input-tools.mk
index 9f5eb19..bd85af3 100644
--- a/package/input-tools/input-tools.mk
+++ b/package/input-tools/input-tools.mk
@@ -3,64 +3,44 @@
 # input-tools
 #
 #############################################################
-
-INPUT_TOOLS_VERSION:=20051019
-INPUT_TOOLS_SOURCE:=joystick_$(INPUT_TOOLS_VERSION).orig.tar.gz
-INPUT_TOOLS_PATCH:=joystick_$(INPUT_TOOLS_VERSION)-2.diff.gz
-INPUT_TOOLS_SITE:=$(BR2_DEBIAN_MIRROR)/debian/pool/main/j/joystick/
-INPUT_TOOLS_DIR:=$(BUILD_DIR)/joystick-$(INPUT_TOOLS_VERSION).orig
-INPUT_TOOLS_CAT:=$(ZCAT)
-
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
-ifneq ($(INPUT_TOOLS_PATCH),)
-	(cd $(INPUT_TOOLS_DIR) && $(INPUT_TOOLS_CAT) $(DL_DIR)/$(INPUT_TOOLS_PATCH) | patch -p1)
-endif
-	toolchain/patch-kernel.sh $(INPUT_TOOLS_DIR) package/input-tools/ \*.patch
-	touch $@
-
-$(INPUT_TOOLS_SOURCES): $(INPUT_TOOLS_DIR)/.unpacked
-
-$(INPUT_TOOLS_DIR)/utils/%: $(INPUT_TOOLS_DIR)/utils/%.c
-	$(TARGET_CC) $(TARGET_CFLAGS) -o $@ $^
-
-$(INPUT_TOOLS_TARGETS): $(TARGET_DIR)/usr/bin/%: $(INPUT_TOOLS_DIR)/utils/%
-	cp -dpf $^ $@
-	$(STRIPCMD) $(STRIP_STRIP_ALL) $@
-
-input-tools: $(INPUT_TOOLS_TARGETS)
-
-input-tools-source: $(DL_DIR)/$(INPUT_TOOLS_SOURCE) $(DL_DIR)/$(INPUT_TOOLS_PATCH)
-
-input-tools-unpacked: $(INPUT_TOOLS_DIR)/.unpacked
-
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
+INPUT_TOOLS_VERSION = 20051019
+INPUT_TOOLS_SOURCE  = joystick_$(INPUT_TOOLS_VERSION).orig.tar.gz
+INPUT_TOOLS_PATCH   = joystick_$(INPUT_TOOLS_VERSION)-5.diff.gz
+INPUT_TOOLS_SITE    = $(BR2_DEBIAN_MIRROR)/debian/pool/main/j/joystick/
+
+INPUT_TOOLS_TARGETS_$(BR2_PACKAGE_INPUT_TOOLS_EVTEST)      += evtest
+INPUT_TOOLS_TARGETS_$(BR2_PACKAGE_INPUT_TOOLS_INPUTATTACH) += inputattach
+INPUT_TOOLS_TARGETS_$(BR2_PACKAGE_INPUT_TOOLS_JSCAL)       += jscal
+INPUT_TOOLS_TARGETS_$(BR2_PACKAGE_INPUT_TOOLS_JSTEST)      += jstest
+
+define INPUT_TOOLS_DEBIAN_PATCHES
+	if [ -d $(@D)/debian/patches ]; then \
+		toolchain/patch-kernel.sh $(@D) $(@D)/debian/patches \*.patch; \
+	fi
+endef
+
+INPUT_TOOLS_POST_PATCH_HOOKS = INPUT_TOOLS_DEBIAN_PATCHES
+
+define INPUT_TOOLS_BUILD_CMDS
+	(cd $(@D)/utils; \
+		$(TARGET_CC) $(TARGET_CFLAGS) -o evtest evtest.c; \
+		$(TARGET_CC) $(TARGET_CFLAGS) -o inputattach inputattach.c; \
+		$(TARGET_CC) $(TARGET_CFLAGS) -o jscal jscal.c; \
+		$(TARGET_CC) $(TARGET_CFLAGS) -o jstest jstest.c; \
+	)
+endef
+
+define INPUT_TOOLS_INSTALL_TARGET_CMDS
+	test -z "$(INPUT_TOOLS_TARGETS_y)" || \
+	install -m 755 $(addprefix $(@D)/utils/,$(INPUT_TOOLS_TARGETS_y)) $(TARGET_DIR)/usr/bin/
+endef
+
+define INPUT_TOOLS_UNINSTALL_TARGET_CMDS
+	rm -f $(addprefix $(TARGET_DIR)/usr/bin/,$(INPUT_TOOLS_TARGETS_y))
+endef
+
+define INPUT_TOOLS_CLEAN_CMDS
+	rm -f $(addprefix $(@D)/utils/,$(INPUT_TOOLS_TARGETS_y))
+endef
+
+$(eval $(call GENTARGETS,package,input-tools))
-- 
1.7.2.2
