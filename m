From: sjhill at uclibc.org <sjhill@uclibc.org>
Date: Sat, 13 Jan 2007 13:45:00 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package:  dash
Message-ID: <20070113214500.9DD6148577@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: sjhill
Date: 2007-01-13 13:45:00 -0800 (Sat, 13 Jan 2007)
New Revision: 17266

Log:
"Dashing through the snow...with a gForce based display...o'er the data fields we go....cache thrashing all the way...hahaha"


Added:
   trunk/buildroot/package/dash/
   trunk/buildroot/package/dash/Config.in
   trunk/buildroot/package/dash/dash.mk

Modified:
   trunk/buildroot/package/Config.in


Changeset:
Modified: trunk/buildroot/package/Config.in
===================================================================
--- trunk/buildroot/package/Config.in	2007-01-13 21:06:21 UTC (rev 17265)
+++ trunk/buildroot/package/Config.in	2007-01-13 21:45:00 UTC (rev 17266)
@@ -40,6 +40,7 @@
 source "package/bsdiff/Config.in"
 source "package/cairo/Config.in"
 source "package/customize/Config.in"
+source "package/dash/Config.in"
 source "package/dhcp/Config.in"
 source "package/dialog/Config.in"
 source "package/dillo/Config.in"

Added: trunk/buildroot/package/dash/Config.in
===================================================================
--- trunk/buildroot/package/dash/Config.in	                        (rev 0)
+++ trunk/buildroot/package/dash/Config.in	2007-01-13 21:45:00 UTC (rev 17266)
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_DASH
+	bool "dash"
+	default n
+	help
+	  The Debian/Linux port of the NetBSD version of
+	  ash (the Almquist SHell).
+
+	  http://gondor.apana.org.au/~herbert/dash

Added: trunk/buildroot/package/dash/dash.mk
===================================================================
--- trunk/buildroot/package/dash/dash.mk	                        (rev 0)
+++ trunk/buildroot/package/dash/dash.mk	2007-01-13 21:45:00 UTC (rev 17266)
@@ -0,0 +1,73 @@
+#############################################################
+#
+# dash
+#
+#############################################################
+DASH_VER:=0.5.3
+DASH_SOURCE:=dash_$(DASH_VER).orig.tar.gz
+DASH_SITE:=http://ftp.debian.org/debian/pool/main/d/dash
+DASH_CAT:=$(ZCAT)
+DASH_DIR:=$(BUILD_DIR)/dash-$(DASH_VER)
+DASH_PATCH1:=dash_$(DASH_VER)-6.diff.gz
+DASH_BINARY:=src/dash
+DASH_TARGET_BINARY:=bin/dash
+
+$(DL_DIR)/$(DASH_SOURCE):
+	$(WGET) -P $(DL_DIR) $(DASH_SITE)/$(DASH_SOURCE)
+
+$(DL_DIR)/$(DASH_PATCH1):
+	$(WGET) -P $(DL_DIR) $(DASH_SITE)/$(DASH_PATCH1)
+
+dash-source: $(DL_DIR)/$(DASH_SOURCE) $(DL_DIR)/$(DASH_PATCH1)
+
+$(DASH_DIR)/.unpacked: $(DL_DIR)/$(DASH_SOURCE) $(DL_DIR)/$(DASH_PATCH1)
+	$(DASH_CAT) $(DL_DIR)/$(DASH_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
+	$(ZCAT) $(DL_DIR)/$(DASH_PATCH1) | patch -p1 -d $(DASH_DIR)
+	touch $(DASH_DIR)/.unpacked
+
+$(DASH_DIR)/.configured: $(DASH_DIR)/.unpacked
+	(cd $(DASH_DIR); rm -rf config.cache; \
+		$(TARGET_CONFIGURE_OPTS) CC_FOR_BUILD="$(HOSTCC)" \
+		CFLAGS="$(TARGET_CFLAGS)" \
+		./configure \
+		--target=$(GNU_TARGET_NAME) \
+		--host=$(GNU_TARGET_NAME) \
+		--build=$(GNU_HOST_NAME) \
+		--prefix=/usr \
+		--exec-prefix=/usr \
+		--bindir=/usr/bin \
+		--sbindir=/usr/sbin \
+		--libexecdir=/usr/lib \
+		--sysconfdir=/etc \
+		--datadir=/usr/share \
+		--localstatedir=/var \
+		--mandir=/usr/man \
+		--infodir=/usr/info \
+	);
+	touch $(DASH_DIR)/.configured
+
+$(DASH_DIR)/$(DASH_BINARY): $(DASH_DIR)/.configured
+	$(MAKE1) CC=$(TARGET_CC) CC_FOR_BUILD="$(HOSTCC)" -C $(DASH_DIR)
+	touch -c $(DASH_DIR)/$(DASH_BINARY)
+
+$(TARGET_DIR)/$(DASH_TARGET_BINARY): $(DASH_DIR)/$(DASH_BINARY)
+	cp -a $(DASH_DIR)/$(DASH_BINARY) $(TARGET_DIR)/$(DASH_TARGET_BINARY)
+	touch -c $(TARGET_DIR)/$(DASH_TARGET_BINARY)
+
+dash: uclibc $(TARGET_DIR)/$(DASH_TARGET_BINARY)
+
+dash-clean:
+	$(MAKE1) CC=$(TARGET_CC) -C $(DASH_DIR) clean
+	rm -f $(TARGET_DIR)/$(DASH_TARGET_BINARY)
+
+dash-dirclean:
+	rm -rf $(DASH_DIR)
+
+#############################################################
+#
+# Toplevel Makefile options
+#
+#############################################################
+ifeq ($(strip $(BR2_PACKAGE_DASH)),y)
+TARGETS+=dash
+endif
