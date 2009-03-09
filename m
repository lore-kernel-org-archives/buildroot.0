From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Mon,  9 Mar 2009 20:28:40 +0000 (UTC)
Subject: [Buildroot] svn commit: [25593] trunk/buildroot/package:
	wpa_supplicant
Message-ID: <20090309202840.CA1CE7656F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-03-09 20:28:40 +0000 (Mon, 09 Mar 2009)
New Revision: 25593

Log:
wpa_supplicant: new package

Patch by Gustavo Zacarias <gustavo@zacarias.com.br>

Closes #81.

Added:
   trunk/buildroot/package/wpa_supplicant/
   trunk/buildroot/package/wpa_supplicant/Config.in
   trunk/buildroot/package/wpa_supplicant/wpa_supplicant.mk

Modified:
   trunk/buildroot/package/Config.in


Changeset:
Modified: trunk/buildroot/package/Config.in
===================================================================
--- trunk/buildroot/package/Config.in	2009-03-09 19:47:55 UTC (rev 25592)
+++ trunk/buildroot/package/Config.in	2009-03-09 20:28:40 UTC (rev 25593)
@@ -218,6 +218,7 @@
 source "package/wget/Config.in"
 endif
 source "package/wireless-tools/Config.in"
+source "package/wpa_supplicant/Config.in"
 
 endmenu
 

Added: trunk/buildroot/package/wpa_supplicant/Config.in
===================================================================
--- trunk/buildroot/package/wpa_supplicant/Config.in	                        (rev 0)
+++ trunk/buildroot/package/wpa_supplicant/Config.in	2009-03-09 20:28:40 UTC (rev 25593)
@@ -0,0 +1,32 @@
+config BR2_PACKAGE_WPA_SUPPLICANT
+	bool "wpa_supplicant"
+	help
+	  WPA supplicant for secure wireless networks
+
+	  http://hostap.epitest.fi/wpa_supplicant/
+
+config BR2_PACKAGE_WPA_SUPPLICANT_EAP
+	bool "Enable WPA with EAP"
+	depends on BR2_PACKAGE_WPA_SUPPLICANT
+	help
+	  Enable WPA with EAP (IEEE 802.1X)
+
+config BR2_PACKAGE_WPA_SUPPLICANT_OPENSSL
+	bool "Use openssl TLS (recommended)"
+	depends on BR2_PACKAGE_WPA_SUPPLICANT && BR2_PACKAGE_WPA_SUPPLICANT_EAP
+	select BR2_PACKAGE_OPENSSL
+	help
+	  Use OpenSSL's TLS implementation instead of internal libtommath.
+
+config BR2_PACKAGE_WPA_SUPPLICANT_CLI
+	bool "Install wpa_cli binary"
+	depends on BR2_PACKAGE_WPA_SUPPLICANT
+	help
+	  Install wpa_cli command line utility
+
+config BR2_PACKAGE_WPA_SUPPLICANT_PASSPHRASE
+	bool "Install wpa_passphrase binary"
+	depends on BR2_PACKAGE_WPA_SUPPLICANT
+	help
+	  Install wpa_passphrase command line utility
+

Added: trunk/buildroot/package/wpa_supplicant/wpa_supplicant.mk
===================================================================
--- trunk/buildroot/package/wpa_supplicant/wpa_supplicant.mk	                        (rev 0)
+++ trunk/buildroot/package/wpa_supplicant/wpa_supplicant.mk	2009-03-09 20:28:40 UTC (rev 25593)
@@ -0,0 +1,53 @@
+#############################################################
+#
+# wpa_supplicant
+#
+#############################################################
+
+WPA_SUPPLICANT_VERSION = 0.6.8
+WPA_SUPPLICANT_SOURCE = wpa_supplicant-$(WPA_SUPPLICANT_VERSION).tar.gz
+WPA_SUPPLICANT_SITE = http://hostap.epitest.fi/releases
+WPA_SUPPLICANT_LIBTOOL_PATCH = NO
+WPA_SUPPLICANT_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install
+WPA_SUPPLICANT_DEPENDENCIES = uclibc
+WPA_SUPPLICANT_CONFIG = $(WPA_SUPPLICANT_DIR)/wpa_supplicant/.config
+WPA_SUPPLICANT_SUBDIR = wpa_supplicant
+WPA_SUPPLICANT_TARGET_BINS = wpa_cli wpa_supplicant wpa_passphrase
+
+ifeq ($(BR2_PACKAGE_WPA_SUPPLICANT_OPENSSL),y)
+	WPA_SUPPLICANT_DEPENDENCIES += openssl
+endif
+
+$(eval $(call AUTOTARGETS,package,wpa_supplicant))
+
+$(WPA_SUPPLICANT_TARGET_CONFIGURE):
+	cp $(WPA_SUPPLICANT_DIR)/wpa_supplicant/defconfig $(WPA_SUPPLICANT_CONFIG)
+	echo "CFLAGS += $(TARGET_CFLAGS)" >>$(WPA_SUPPLICANT_CONFIG)
+	echo "CC = $(TARGET_CC)" >>$(WPA_SUPPLICANT_CONFIG)
+	$(SED) "s/\/local//" $(WPA_SUPPLICANT_DIR)/wpa_supplicant/Makefile
+ifneq ($(BR2_PACKAGE_WPA_SUPPLICANT_EAP),y)
+	$(SED) "s/^CONFIG_EAP_*/#CONFIG_EAP_/g" $(WPA_SUPPLICANT_CONFIG)
+	echo "CONFIG_TLS=none" >>$(WPA_SUPPLICANT_CONFIG)
+else
+ifeq ($(BR2_PACKAGE_WPA_SUPPLICANT_OPENSSL),y)
+	echo "CONFIG_TLS=openssl" >>$(WPA_SUPPLICANT_CONFIG)
+else
+	echo "CONFIG_TLS=internal" >>$(WPA_SUPPLICANT_CONFIG)
+	echo "CONFIG_INTERNAL_LIBTOMMATH=y" >>$(WPA_SUPPLICANT_CONFIG)
+endif
+endif
+	touch $@
+
+$(WPA_SUPPLICANT_HOOK_POST_INSTALL):
+ifneq ($(BR2_PACKAGE_WPA_SUPPLICANT_CLI),y)
+	rm -f $(TARGET_DIR)/usr/sbin/wpa_cli
+endif
+ifneq ($(BR2_PACKAGE_WPA_SUPPLICANT_PASSPHRASE),y)
+	rm -f $(TARGET_DIR)/usr/sbin/wpa_passphrase
+endif
+
+$(WPA_SUPPLICANT_TARGET_UNINSTALL):
+	$(call MESSAGE,"Uninstalling")
+	rm -f $(addprefix $(TARGET_DIR)/usr/sbin/, $(WPA_SUPPLICANT_TARGET_BINS))
+	rm -f $(WPA_SUPPLICANT_TARGET_INSTALL_TARGET) $(WPA_SUPPLICANT_HOOK_POST_INSTALL)
+
