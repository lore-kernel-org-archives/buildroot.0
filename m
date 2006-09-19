From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Tue, 19 Sep 2006 07:19:32 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package:  dillo
Message-ID: <20060919141932.D1C17485C9@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2006-09-19 07:19:32 -0700 (Tue, 19 Sep 2006)
New Revision: 16151

Log:
Add dillo package

Added:
   trunk/buildroot/package/dillo/
   trunk/buildroot/package/dillo/Config.in
   trunk/buildroot/package/dillo/dillo.mk

Modified:
   trunk/buildroot/package/Config.in


Changeset:
Modified: trunk/buildroot/package/Config.in
===================================================================
--- trunk/buildroot/package/Config.in	2006-09-19 14:17:10 UTC (rev 16150)
+++ trunk/buildroot/package/Config.in	2006-09-19 14:19:32 UTC (rev 16151)
@@ -37,6 +37,7 @@
 source "package/customize/Config.in"
 source "package/dhcp/Config.in"
 source "package/dialog/Config.in"
+source "package/dillo/Config.in"
 source "package/directfb/Config.in"
 source "package/distcc/Config.in"
 source "package/dm/Config.in"

Added: trunk/buildroot/package/dillo/Config.in
===================================================================
--- trunk/buildroot/package/dillo/Config.in	2006-09-19 14:17:10 UTC (rev 16150)
+++ trunk/buildroot/package/dillo/Config.in	2006-09-19 14:19:32 UTC (rev 16151)
@@ -0,0 +1,13 @@
+config BR2_PACKAGE_DILLO
+	bool "dillo"
+	default n
+	select BR2_PACKAGE_ZLIB
+	select BR2_PACKAGE_JPEG
+	select BR2_PACKAGE_LIBPNG
+	select BR2_PACKAGE_LIBGLIB12
+	select BR2_PACKAGE_LIBGTK12
+	depends BR2_PACKAGE_XORG
+	help
+	  Dillo is a small GTK+ based web browser written in C.
+
+	  http://www.dillo.org/

Added: trunk/buildroot/package/dillo/dillo.mk
===================================================================
--- trunk/buildroot/package/dillo/dillo.mk	2006-09-19 14:17:10 UTC (rev 16150)
+++ trunk/buildroot/package/dillo/dillo.mk	2006-09-19 14:19:32 UTC (rev 16151)
@@ -0,0 +1,59 @@
+#############################################################
+#
+# dillo
+#
+#############################################################
+
+DILLO_VERSION=0.8.6
+DILLO_SOURCE=dillo-$(DILLO_VERSION).tar.bz2
+DILLO_SITE=http://www.dillo.org/download/
+DILLO_DIR=$(BUILD_DIR)/dillo-$(DILLO_VERSION)
+DILLO_CAT:=bzcat
+
+$(DL_DIR)/$(DILLO_SOURCE):
+	$(WGET) -P $(DL_DIR) $(DILLO_SITE)/$(DILLO_SOURCE)
+
+$(DILLO_DIR)/.unpacked: $(DL_DIR)/$(DILLO_SOURCE)
+	$(DILLO_CAT) $(DL_DIR)/$(DILLO_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
+	touch $(DILLO_DIR)/.unpacked
+
+$(DILLO_DIR)/.configured: $(DILLO_DIR)/.unpacked
+	(cd $(DILLO_DIR); rm -rf config.cache; \
+		$(TARGET_CONFIGURE_OPTS) \
+		./configure \
+		--target=$(GNU_TARGET_NAME) \
+		--host=$(GNU_TARGET_NAME) \
+		--build=$(GNU_HOST_NAME) \
+		--prefix=/usr \
+		--sysconfdir=/etc \
+		--program-transform-name='' \
+		--disable-dlgui \
+	);
+	touch $(DILLO_DIR)/.configured
+
+$(DILLO_DIR)/src/dillo: $(DILLO_DIR)/.configured
+	$(MAKE) CC=$(TARGET_CC) -C $(DILLO_DIR)
+
+$(DILLO_DIR)/.installed: $(DILLO_DIR)/src/dillo
+	$(MAKE) -C $(DILLO_DIR) DESTDIR=$(TARGET_DIR) install
+	touch $(DILLO_DIR)/.installed
+
+dillo:	uclibc xorg libglib12 libgtk12 jpeg libpng $(DILLO_DIR)/.installed
+
+dillo-source: $(DL_DIR)/$(DILLO_SOURCE)
+
+dillo-clean:
+	@if [ -d $(DILLO_DIR)/Makefile ] ; then \
+		$(MAKE) -C $(DILLO_DIR) clean ; \
+	fi;
+
+dillo-dirclean:
+	rm -rf $(DILLO_DIR)
+#############################################################
+#
+# Toplevel Makefile options
+#
+#############################################################
+ifeq ($(strip $(BR2_PACKAGE_DILLO)),y)
+TARGETS+=dillo
+endif
