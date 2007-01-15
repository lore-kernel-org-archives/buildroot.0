From: andersen at uclibc.org <andersen@uclibc.org>
Date: Mon, 15 Jan 2007 13:26:44 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/fontconfig
Message-ID: <20070115212644.EA71B4858E@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: andersen
Date: 2007-01-15 13:26:43 -0800 (Mon, 15 Jan 2007)
New Revision: 17315

Log:
teach fontconfig to actually apply its patches


Modified:
   trunk/buildroot/package/fontconfig/fontconfig.mk
   trunk/buildroot/package/fontconfig/libdir-la.patch


Changeset:
Modified: trunk/buildroot/package/fontconfig/fontconfig.mk
===================================================================
--- trunk/buildroot/package/fontconfig/fontconfig.mk	2007-01-15 17:34:58 UTC (rev 17314)
+++ trunk/buildroot/package/fontconfig/fontconfig.mk	2007-01-15 21:26:43 UTC (rev 17315)
@@ -16,6 +16,8 @@
 
 $(FONTCONFIG_DIR)/.unpacked: $(DL_DIR)/$(FONTCONFIG_SOURCE)
 	$(FONTCONFIG_CAT) $(DL_DIR)/$(FONTCONFIG_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
+	toolchain/patch-kernel.sh $(FONTCONFIG_DIR) package/fontconfig/ \*.patch*
+	$(CONFIG_UPDATE) $(FONTCONFIG_DIR)
 	touch $(FONTCONFIG_DIR)/.unpacked
 
 $(FONTCONFIG_DIR)/.configured: $(FONTCONFIG_DIR)/.unpacked
@@ -54,6 +56,8 @@
 
 $(TARGET_DIR)/lib/libfontconfig.so: $(STAGING_DIR)/lib/libfontconfig.so
 	cp -dpf $(STAGING_DIR)/lib/libfontconfig.so* $(TARGET_DIR)/lib/
+	mkdir -p $(TARGET_DIR)/etc/fonts
+	cp $(STAGING_DIR)/etc/fonts/fonts.conf $(TARGET_DIR)/etc/fonts/
 	-$(STRIP) --strip-unneeded $(TARGET_DIR)/lib/libfontconfig.so
 
 fontconfig: uclibc freetype $(TARGET_DIR)/lib/libfontconfig.so

Modified: trunk/buildroot/package/fontconfig/libdir-la.patch
===================================================================
--- trunk/buildroot/package/fontconfig/libdir-la.patch	2007-01-15 17:34:58 UTC (rev 17314)
+++ trunk/buildroot/package/fontconfig/libdir-la.patch	2007-01-15 21:26:43 UTC (rev 17315)
@@ -1,5 +1,5 @@
---- fontconfig/builds/unix/ltmain.sh.orig	2006-04-20 08:27:27.000000000 -0600
-+++ fontconfig/builds/unix/ltmain.sh	2007-01-13 14:26:01.000000000 -0700
+--- fontconfig/ltmain.sh.orig	2006-04-20 08:27:27.000000000 -0600
++++ fontconfig/ltmain.sh	2007-01-13 14:26:01.000000000 -0700
 @@ -273,8 +273,9 @@
  	# line option must be used.
  	if test -z "$tagname"; then
