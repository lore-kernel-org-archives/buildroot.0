From: aldot at uclibc.org <aldot@uclibc.org>
Date: Tue,  6 Feb 2007 03:22:51 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package:  cvs
Message-ID: <20070206112251.BF1A548671@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-02-06 03:22:50 -0800 (Tue, 06 Feb 2007)
New Revision: 17787

Log:
- resurrect cvs. Closes #1199
- bump version


Modified:
   trunk/buildroot/package/Config.in
   trunk/buildroot/package/cvs/Config.in
   trunk/buildroot/package/cvs/cvs.mk


Changeset:
Modified: trunk/buildroot/package/Config.in
===================================================================
--- trunk/buildroot/package/Config.in	2007-02-06 09:04:44 UTC (rev 17786)
+++ trunk/buildroot/package/Config.in	2007-02-06 11:22:50 UTC (rev 17787)
@@ -36,6 +36,7 @@
 source "package/automake/Config.in"
 source "package/bison/Config.in"
 source "toolchain/ccache/Config.in.2"
+source "package/cvs/Config.in"
 source "package/distcc/Config.in"
 source "package/dmalloc/Config.in"
 source "package/expat/Config.in"

Modified: trunk/buildroot/package/cvs/Config.in
===================================================================
--- trunk/buildroot/package/cvs/Config.in	2007-02-06 09:04:44 UTC (rev 17786)
+++ trunk/buildroot/package/cvs/Config.in	2007-02-06 11:22:50 UTC (rev 17787)
@@ -5,4 +5,11 @@
 	help
 	  Concurrent Versions System - source code revision control tools.
 
-	  http://www.cvshome.org/
+	  http://www.nongnu.org/cvs/
+
+config BR2_PACKAGE_CVS_SERVER
+	bool "server support"
+	default n
+	depends on BR2_PACKAGE_CVS
+	help
+	  Enable cvs server code

Modified: trunk/buildroot/package/cvs/cvs.mk
===================================================================
--- trunk/buildroot/package/cvs/cvs.mk	2007-02-06 09:04:44 UTC (rev 17786)
+++ trunk/buildroot/package/cvs/cvs.mk	2007-02-06 11:22:50 UTC (rev 17787)
@@ -3,21 +3,50 @@
 # cvs
 #
 #############################################################
-CVS_VER:=1.12.12
-CVS_SOURCE:=cvs-$(CVS_VER).tar.bz2
-CVS_SITE:=http://ccvs.cvshome.org/files/documents/19/872/$(CVS_SOURCE)
+CVS_VER:=1.12.13
+CVS_SOURCE:=cvs_$(CVS_VER).orig.tar.gz
+CVS_PATCH:=cvs_$(CVS_VER)-7.diff.gz
+CVS_SITE:=http://ftp.debian.org/debian/pool/main/c/cvs/
 CVS_DIR:=$(BUILD_DIR)/cvs-$(CVS_VER)
-CVS_CAT:=$(BZCAT)
+CVS_CAT:=$(ZCAT)
 CVS_BINARY:=src/cvs
 CVS_TARGET_BINARY:=usr/bin/cvs
 
+CVS_CONFIGURE_ARGS:=--disable-old-info-format-support
+ifeq ($(BR2_PACKAGE_CVS_SERVER),y)
+CVS_CONFIGURE_ARGS+=--enable-server
+else
+CVS_CONFIGURE_ARGS+=--disable-server
+endif
+ifeq ($(BR2_PACKAGE_ZLIB),y)
+CVS_CONFIGURE_ARGS+=--with-external-zlib
+endif
+
 $(DL_DIR)/$(CVS_SOURCE):
 	$(WGET) -P $(DL_DIR) $(CVS_SITE)/$(CVS_SOURCE)
 
-cvs-source: $(DL_DIR)/$(CVS_SOURCE)
+$(DL_DIR)/$(CVS_PATCH):
+	$(WGET) -P $(DL_DIR) $(CVS_SITE)/$(CVS_PATCH)
 
-$(CVS_DIR)/.unpacked: $(DL_DIR)/$(CVS_SOURCE)
-	$(CVS_CAT) $(DL_DIR)/$(CVS_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
+cvs-source: $(DL_DIR)/$(CVS_SOURCE) $(DL_DIR)/$(CVS_PATCH)
+
+$(CVS_DIR)/.unpacked: $(DL_DIR)/$(CVS_SOURCE) $(DL_DIR)/$(CVS_PATCH)
+	-mkdir $(CVS_DIR)
+	$(CVS_CAT) $(DL_DIR)/$(CVS_SOURCE) | tar -C $(CVS_DIR) $(TAR_OPTIONS) -
+	$(BZCAT) $(CVS_DIR)/cvs-$(CVS_VER)/cvs-$(CVS_VER).tar.bz2 | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
+	rm -rf $(CVS_DIR)/cvs-$(CVS_VER)
+	$(CONFIG_UPDATE) $(CVS_DIR)
+	toolchain/patch-kernel.sh $(CVS_DIR) package/cvs \*$(CVS_VER)\*.patch
+ifneq ($(CVS_PATCH),)
+	toolchain/patch-kernel.sh $(CVS_DIR) $(DL_DIR) $(CVS_PATCH)
+	if [ -d $(CVS_DIR)/debian/patches ]; then \
+		(cd $(CVS_DIR)/debian/patches && for i in * ; \
+		 do $(SED) 's,^\+\+\+ .*cvs-$(CVS_VER)/,+++ cvs-$(CVS_VER)/,' $$i ; \
+		 done ; \
+		) ; \
+		toolchain/patch-kernel.sh $(CVS_DIR) $(CVS_DIR)/debian/patches \* ; \
+	fi
+endif
 	touch $(CVS_DIR)/.unpacked
 
 $(CVS_DIR)/.configured: $(CVS_DIR)/.unpacked
@@ -30,21 +59,24 @@
 		--host=$(GNU_TARGET_NAME) \
 		--build=$(GNU_HOST_NAME) \
 		--prefix=/usr \
+		$(DISABLE_LARGEFILE) \
+		$(DISABLE_NLS) \
+		$(CVS_CONFIGURE_ARGS) \
 	);
-	touch $(CVS_DIR)/.configured
+	touch $@
 
 $(CVS_DIR)/$(CVS_BINARY): $(CVS_DIR)/.configured
 	$(MAKE) -C $(CVS_DIR)
 
 $(TARGET_DIR)/$(CVS_TARGET_BINARY): $(CVS_DIR)/$(CVS_BINARY)
 	install -D $(CVS_DIR)/$(CVS_BINARY) $(TARGET_DIR)/$(CVS_TARGET_BINARY)
-	$(STRIP) $(TARGET_DIR)/$(CVS_TARGET_BINARY)
+	$(STRIP) -s $(TARGET_DIR)/$(CVS_TARGET_BINARY)
 
 cvs: uclibc ncurses $(TARGET_DIR)/$(CVS_TARGET_BINARY)
 
 cvs-clean:
+	-$(MAKE) -C $(CVS_DIR) clean
 	rm -f $(TARGET_DIR)/$(CVS_TARGET_BINARY)
-	-$(MAKE) -C $(CVS_DIR) clean
 
 cvs-dirclean:
 	rm -rf $(CVS_DIR)
