From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 26 Sep 2010 23:11:43 +0200
Subject: [Buildroot] [git commit master 1/1] axel: convert to gentargets and
	bump to 2.4
Message-ID: <20100926211240.1A69C8B6D6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=0f9da87c1d18598f308ed129d027f65cdffcde77
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Peter: fix build with locale, pass LDFLAGS, simplify install]
Signed-off-by: Martin Banky <Martin.Banky@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                |    4 +-
 package/axel/Config.in |    2 +
 package/axel/axel.mk   |   78 +++++++++++++++++++++--------------------------
 3 files changed, 39 insertions(+), 45 deletions(-)

diff --git a/CHANGES b/CHANGES
index 33299a0..b01da23 100644
--- a/CHANGES
+++ b/CHANGES
@@ -17,8 +17,8 @@
 
 	New packages: xz
 
-	Updated/fixed packages: alsa-lib, at, avahi, berkeleydb, bind,
-	bmon, boa, bridge-utils, bsdiff, busybox, dbus, dmraid,
+	Updated/fixed packages: alsa-lib, at, avahi, axel, berkeleydb,
+	bind, bmon, boa, bridge-utils, bsdiff, busybox, dbus, dmraid,
 	docker, dosfstools, dropbear, e2fsprogs, expat, ezxml, fbset,
 	freetype, gawk, gvfs, haserl, hostapd, hwdata, ifplugd, iperf,
 	iproute2, iptables, jpeg, kexec, kismet, less, libcurl,
diff --git a/package/axel/Config.in b/package/axel/Config.in
index c706d4c..cb9af32 100644
--- a/package/axel/Config.in
+++ b/package/axel/Config.in
@@ -1,5 +1,7 @@
 config BR2_PACKAGE_AXEL
 	bool "axel"
+	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT_IF_LOCALE
+	select BR2_PACKAGE_LIBINTL if BR2_NEEDS_GETTEXT_IF_LOCALE
 	help
 	  HTTP/FTP download accelerator.
 
diff --git a/package/axel/axel.mk b/package/axel/axel.mk
index 8891795..1bf4d81 100644
--- a/package/axel/axel.mk
+++ b/package/axel/axel.mk
@@ -3,53 +3,45 @@
 # axel
 #
 #############################################################
-AXEL_VERSION:=1.1
-AXEL_SOURCE:=axel-$(AXEL_VERSION).tar.gz
-AXEL_SITE:=http://alioth.debian.org/frs/download.php/2287
-AXEL_CAT:=$(ZCAT)
-AXEL_DIR:=$(BUILD_DIR)/axel-$(AXEL_VERSION)
-AXEL_BINARY:=axel
-AXEL_TARGET_BINARY:=usr/bin/axel
-
-$(DL_DIR)/$(AXEL_SOURCE):
-	 $(call DOWNLOAD,$(AXEL_SITE),$(AXEL_SOURCE))
-
-axel-source: $(DL_DIR)/$(AXEL_SOURCE)
-
-$(AXEL_DIR)/.unpacked: $(DL_DIR)/$(AXEL_SOURCE)
-	$(AXEL_CAT) $(DL_DIR)/$(AXEL_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
-	#toolchain/patch-kernel.sh $(AXEL_DIR) package/axel axel\*.patch
-	touch $@
-
-$(AXEL_DIR)/Makefile.settings: $(AXEL_DIR)/.unpacked
-	(cd $(AXEL_DIR); \
-		./configure --i18n=0 --prefix=/usr \
-	)
-	touch $@
+AXEL_VERSION = 2.4
+AXEL_SOURCE = axel-$(AXEL_VERSION).tar.gz
+AXEL_SITE = https://alioth.debian.org/frs/download.php/3015
 
-$(AXEL_DIR)/$(AXEL_BINARY): $(AXEL_DIR)/Makefile.settings
-	$(MAKE) CC="$(TARGET_CC)" STRIP="$(TARGET_STRIP)" -C $(AXEL_DIR)
+AXEL_LDFLAGS = -lpthread
 
-$(TARGET_DIR)/$(AXEL_TARGET_BINARY): $(AXEL_DIR)/$(AXEL_BINARY)
-	$(MAKE) DESTDIR=$(TARGET_DIR) -C $(AXEL_DIR) install-bin
-ifeq ($(BR2_HAVE_DOCUMENTATION),y)
-	$(MAKE) DESTDIR=$(TARGET_DIR) -C $(AXEL_DIR) install-man
+ifeq ($(BR2_NEEDS_GETTEXT_IF_LOCALE),y)
+AXEL_DEPENDENCIES += gettext libintl
+AXEL_LDFLAGS += -lintl
 endif
 
-axel: $(TARGET_DIR)/$(AXEL_TARGET_BINARY)
+ifneq ($(BR2_ENABLE_LOCALE),y)
+AXEL_DISABLE_I18N=--i18n=0
+endif
 
-axel-clean:
-	$(MAKE) DESTDIR=$(TARGET_DIR) -C $(AXEL_DIR) uninstall
-	-$(MAKE) -C $(AXEL_DIR) clean
+define AXEL_CONFIGURE_CMDS
+	(cd $(@D); \
+		./configure \
+			--prefix=/usr \
+			--debug=1 \
+			$(AXEL_DISABLE_I18N) \
+	)
+endef
 
-axel-dirclean:
-	rm -rf $(AXEL_DIR)
+define AXEL_BUILD_CMDS
+	$(MAKE) CC="$(TARGET_CC)" CFLAGS="$(TARGET_CFLAGS)" \
+	LFLAGS="$(TARGET_LDFLAGS) $(AXEL_LDFLAGS)" -C $(@D)
+endef
 
-#############################################################
-#
-# Toplevel Makefile options
-#
-#############################################################
-ifeq ($(BR2_PACKAGE_AXEL),y)
-TARGETS+=axel
-endif
+define AXEL_INSTALL_TARGET_CMDS
+	$(MAKE) DESTDIR=$(TARGET_DIR) -C $(@D) install
+endef
+
+define AXEL_UNINSTALL_TARGET_CMDS
+	$(MAKE) DESTDIR=$(TARGET_DIR) -C $(@D) uninstall
+endef
+
+define AXEL_CLEAN_CMDS
+	-$(MAKE) -C $(@D) clean
+endef
+
+$(eval $(call GENTARGETS,package,axel))
-- 
1.7.1
