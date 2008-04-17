From: hamish at uclibc.org <hamish@uclibc.org>
Date: Wed, 16 Apr 2008 21:52:58 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package:  axel
Message-ID: <20080417045258.41B6D3C61D@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: hamish
Date: 2008-04-16 21:52:57 -0700 (Wed, 16 Apr 2008)
New Revision: 21752

Log:
Added package for axel download accelerator


Added:
   trunk/buildroot/package/axel/
   trunk/buildroot/package/axel/Config.in
   trunk/buildroot/package/axel/axel.mk

Modified:
   trunk/buildroot/package/Config.in


Changeset:
Modified: trunk/buildroot/package/Config.in
===================================================================
--- trunk/buildroot/package/Config.in	2008-04-17 01:52:28 UTC (rev 21751)
+++ trunk/buildroot/package/Config.in	2008-04-17 04:52:57 UTC (rev 21752)
@@ -141,6 +141,7 @@
 comment "Networking applications"
 source "package/argus/Config.in"
 source "package/avahi/Config.in"
+source "package/axel/Config.in"
 source "package/boa/Config.in"
 source "package/bind/Config.in"
 source "package/bridge-utils/Config.in"

Added: trunk/buildroot/package/axel/Config.in
===================================================================
--- trunk/buildroot/package/axel/Config.in	                        (rev 0)
+++ trunk/buildroot/package/axel/Config.in	2008-04-17 04:52:57 UTC (rev 21752)
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_AXEL
+	bool "axel"
+	default n
+	help
+	  HTTP/FTP download accelerator.
+
+	  http://axel.alioth.debian.org/

Added: trunk/buildroot/package/axel/axel.mk
===================================================================
--- trunk/buildroot/package/axel/axel.mk	                        (rev 0)
+++ trunk/buildroot/package/axel/axel.mk	2008-04-17 04:52:57 UTC (rev 21752)
@@ -0,0 +1,55 @@
+#############################################################
+#
+# axel
+#
+#############################################################
+AXEL_VERSION:=1.1
+AXEL_SOURCE:=axel-$(AXEL_VERSION).tar.gz
+AXEL_SITE:=http://alioth.debian.org/frs/download.php/2287
+AXEL_CAT:=$(ZCAT)
+AXEL_DIR:=$(BUILD_DIR)/axel-$(AXEL_VERSION)
+AXEL_BINARY:=axel
+AXEL_TARGET_BINARY:=usr/bin/axel
+
+$(DL_DIR)/$(AXEL_SOURCE):
+	 $(WGET) -P $(DL_DIR) $(AXEL_SITE)/$(AXEL_SOURCE)
+
+axel-source: $(DL_DIR)/$(AXEL_SOURCE)
+
+$(AXEL_DIR)/.unpacked: $(DL_DIR)/$(AXEL_SOURCE)
+	$(AXEL_CAT) $(DL_DIR)/$(AXEL_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
+	#toolchain/patch-kernel.sh $(AXEL_DIR) package/axel axel\*.patch
+	touch $@
+
+$(AXEL_DIR)/Makefile.settings: $(AXEL_DIR)/.unpacked
+	(cd $(AXEL_DIR); \
+		./configure --enable-i18n=0 --prefix=/usr \
+	)
+	touch $@
+
+$(AXEL_DIR)/$(AXEL_BINARY): $(AXEL_DIR)/Makefile.settings
+	$(MAKE) CC="$(TARGET_CC)" STRIP="$(TARGET_STRIP)" -C $(AXEL_DIR)
+
+$(TARGET_DIR)/$(AXEL_TARGET_BINARY): $(AXEL_DIR)/$(AXEL_BINARY)
+	$(MAKE) DESTDIR=$(TARGET_DIR) -C $(AXEL_DIR) install-bin
+ifeq ($(BR2_HAVE_MANPAGES),y)
+	$(MAKE) DESTDIR=$(TARGET_DIR) -C $(AXEL_DIR) install-man
+endif
+
+axel: uclibc $(TARGET_DIR)/$(AXEL_TARGET_BINARY)
+
+axel-clean:
+	$(MAKE) DESTDIR=$(TARGET_DIR) -C $(AXEL_DIR) uninstall
+	-$(MAKE) -C $(AXEL_DIR) clean
+
+axel-dirclean:
+	rm -rf $(AXEL_DIR)
+
+#############################################################
+#
+# Toplevel Makefile options
+#
+#############################################################
+ifeq ($(strip $(BR2_PACKAGE_AXEL)),y)
+TARGETS+=axel
+endif
