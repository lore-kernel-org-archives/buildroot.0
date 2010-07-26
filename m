From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 26 Jul 2010 12:07:22 +0200
Subject: [Buildroot] [git commit master 1/1] wireless_tools: Migrate to
	gentargets and fixes
Message-ID: <20100726100842.3DE3083496@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=e7b5fd80c4d3695341d16b85e9960fb8fd8a9fa6
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Rename it from wireless-tools to wireless_tools to match upstream.
Make it install manpages.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                                            |    3 +-
 package/Config.in                                  |    2 +-
 package/wireless-tools/wireless-tools.mk           |   58 --------------------
 .../{wireless-tools => wireless_tools}/Config.in   |    0
 .../wireless_tools-29-remove-bzero.patch}          |    0
 package/wireless_tools/wireless_tools.mk           |   30 ++++++++++
 6 files changed, 33 insertions(+), 60 deletions(-)
 delete mode 100644 package/wireless-tools/wireless-tools.mk
 rename package/{wireless-tools => wireless_tools}/Config.in (100%)
 rename package/{wireless-tools/wireless_tools.29-remove-bzero.patch => wireless_tools/wireless_tools-29-remove-bzero.patch} (100%)
 create mode 100644 package/wireless_tools/wireless_tools.mk

diff --git a/CHANGES b/CHANGES
index 64a60b3..aeaef6f 100644
--- a/CHANGES
+++ b/CHANGES
@@ -25,7 +25,8 @@
 	mplayer, mysql_client, nbd, ncurses, neon, netcat, netperf,
 	ntfsprogs, openssl, php, qt, quagga, sqlite, sdl, sdl_mixer,
 	sdl_sound, sdl_ttf, squashfs, swfdec, thttpd, tn5250, tremor,
-	usbutils, webif, xkeyboard-config, xserver_xorg-server, xvkbd
+	usbutils, webif, wireless_tools, xkeyboard-config,
+	xserver_xorg-server, xvkbd
 
 	Removed packages: modutils, portage, rxvt
 
diff --git a/package/Config.in b/package/Config.in
index fe96939..6b3616a 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -435,7 +435,7 @@ source "package/webif/Config.in"
 if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 source "package/wget/Config.in"
 endif
-source "package/wireless-tools/Config.in"
+source "package/wireless_tools/Config.in"
 source "package/wpa_supplicant/Config.in"
 
 endmenu
diff --git a/package/wireless-tools/wireless-tools.mk b/package/wireless-tools/wireless-tools.mk
deleted file mode 100644
index 9c16ff8..0000000
--- a/package/wireless-tools/wireless-tools.mk
+++ /dev/null
@@ -1,58 +0,0 @@
-#############################################################
-#
-# wireless-tools - Wireless Tools
-#
-#############################################################
-
-# This Makefile only work with the multicall version of Wireless Tools,
-# which is available in 28-pre3 and later...
-# Jean II
-# v28.pre3 -> earliest possible
-WIRELESS_TOOLS_VERSION:=29
-WIRELESS_TOOLS_SUBVER:=
-
-WIRELESS_TOOLS_SOURCE_URL:=http://www.hpl.hp.com/personal/Jean_Tourrilhes/Linux/
-WIRELESS_TOOLS_SOURCE:=wireless_tools.$(WIRELESS_TOOLS_VERSION)$(WIRELESS_TOOLS_SUBVER).tar.gz
-WIRELESS_TOOLS_BUILD_DIR=$(BUILD_DIR)/wireless_tools.$(WIRELESS_TOOLS_VERSION)
-
-$(DL_DIR)/$(WIRELESS_TOOLS_SOURCE):
-	 $(call DOWNLOAD,$(WIRELESS_TOOLS_SOURCE_URL),$(WIRELESS_TOOLS_SOURCE))
-
-$(WIRELESS_TOOLS_BUILD_DIR)/.unpacked: $(DL_DIR)/$(WIRELESS_TOOLS_SOURCE)
-	$(ZCAT) $(DL_DIR)/$(WIRELESS_TOOLS_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
-	toolchain/patch-kernel.sh $(WIRELESS_TOOLS_BUILD_DIR) package/wireless-tools/ \*.patch
-	sed -i -e s:'strip':'$(STRIPCMD)':g $(WIRELESS_TOOLS_BUILD_DIR)/Makefile
-	touch $(WIRELESS_TOOLS_BUILD_DIR)/.unpacked
-
-$(WIRELESS_TOOLS_BUILD_DIR)/.configured: $(WIRELESS_TOOLS_BUILD_DIR)/.unpacked
-	touch $(WIRELESS_TOOLS_BUILD_DIR)/.configured
-
-$(WIRELESS_TOOLS_BUILD_DIR)/iwmulticall: $(WIRELESS_TOOLS_BUILD_DIR)/.configured
-	$(MAKE) -C $(WIRELESS_TOOLS_BUILD_DIR) \
-		CC="$(TARGET_CC)" CFLAGS="$(TARGET_CFLAGS)" \
-		iwmulticall
-
-$(TARGET_DIR)/sbin/iwconfig: $(WIRELESS_TOOLS_BUILD_DIR)/iwmulticall
-	$(MAKE) -C $(WIRELESS_TOOLS_BUILD_DIR) \
-		PREFIX="$(TARGET_DIR)" \
-		CC="$(TARGET_CC)" CFLAGS="$(TARGET_CFLAGS)" \
-		install-iwmulticall
-
-wireless-tools: $(TARGET_DIR)/sbin/iwconfig
-
-wireless-tools-source: $(DL_DIR)/$(WIRELESS_TOOLS_SOURCE)
-
-wireless-tools-clean:
-	$(MAKE) DESTDIR=$(TARGET_DIR) CC="$(TARGET_CC)" -C $(WIRELESS_TOOLS_BUILD_DIR) uninstall
-	-$(MAKE) -C $(WIRELESS_TOOLS_BUILD_DIR) clean
-
-wireless-tools-dirclean:
-	rm -rf $(WIRELESS_TOOLS_BUILD_DIR)
-#############################################################
-#
-# Toplevel Makefile options
-#
-#############################################################
-ifeq ($(BR2_PACKAGE_WIRELESS_TOOLS),y)
-TARGETS+=wireless-tools
-endif
diff --git a/package/wireless-tools/Config.in b/package/wireless_tools/Config.in
similarity index 100%
rename from package/wireless-tools/Config.in
rename to package/wireless_tools/Config.in
diff --git a/package/wireless-tools/wireless_tools.29-remove-bzero.patch b/package/wireless_tools/wireless_tools-29-remove-bzero.patch
similarity index 100%
rename from package/wireless-tools/wireless_tools.29-remove-bzero.patch
rename to package/wireless_tools/wireless_tools-29-remove-bzero.patch
diff --git a/package/wireless_tools/wireless_tools.mk b/package/wireless_tools/wireless_tools.mk
new file mode 100644
index 0000000..0707808
--- /dev/null
+++ b/package/wireless_tools/wireless_tools.mk
@@ -0,0 +1,30 @@
+#############################################################
+#
+# wireless_tools
+#
+#############################################################
+
+WIRELESS_TOOLS_VERSION = 29
+WIRELESS_TOOLS_SITE = http://www.hpl.hp.com/personal/Jean_Tourrilhes/Linux
+WIRELESS_TOOLS_SOURCE = wireless_tools.$(WIRELESS_TOOLS_VERSION).tar.gz
+
+define WIRELESS_TOOLS_BUILD_CMDS
+	$(MAKE) -C $(@D) CC="$(TARGET_CC)" CFLAGS="$(TARGET_CFLAGS)" \
+		iwmulticall
+endef
+
+define WIRELESS_TOOLS_CLEAN_CMDS
+	$(MAKE) -C $(@D) clean
+	rm -f $(@D)/iwmulticall
+endef
+
+define WIRELESS_TOOLS_INSTALL_TARGET_CMDS
+	$(MAKE) -C $(@D) PREFIX="$(TARGET_DIR)" install-iwmulticall
+	$(MAKE) -C $(@D) INSTALL_MAN="$(TARGET_DIR)/usr/share/man" install-man
+endef
+
+define WIRELESS_TOOLS_UNINSTALL_TARGET_CMDS
+	$(MAKE) -C $(@D) PREFIX="$(TARGET_DIR)" uninstall
+endef
+
+$(eval $(call GENTARGETS,package,wireless_tools))
-- 
1.7.1
