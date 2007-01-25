From: andersen at uclibc.org <andersen@uclibc.org>
Date: Thu, 25 Jan 2007 12:47:20 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/metacity
Message-ID: <20070125204720.6BBC4485DC@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: andersen
Date: 2007-01-25 12:47:19 -0800 (Thu, 25 Jan 2007)
New Revision: 17520

Log:
Use stable version 2.16.3, as 2.17.x misplaces topbar icons and whatnot.
download and install the Clearlooks theme


Modified:
   trunk/buildroot/package/metacity/metacity.mk


Changeset:
Modified: trunk/buildroot/package/metacity/metacity.mk
===================================================================
--- trunk/buildroot/package/metacity/metacity.mk	2007-01-25 20:34:10 UTC (rev 17519)
+++ trunk/buildroot/package/metacity/metacity.mk	2007-01-25 20:47:19 UTC (rev 17520)
@@ -4,18 +4,28 @@
 #
 #############################################################
 
-METACITY_VER:=2.17.3
+# Seems to be broken -- topbar icons and such are misplaced etc
+#METACITY_VER:=2.17.5
+
+METACITY_VER:=2.16.3
 METACITY_SOURCE:=metacity-$(METACITY_VER).tar.bz2
-METACITY_SITE:=http://ftp.gnome.org/pub/gnome/sources/metacity/2.17
+METACITY_SITE:=http://ftp.gnome.org/pub/gnome/sources/metacity/2.16
 METACITY_DIR:=$(BUILD_DIR)/metacity-$(METACITY_VER)
 METACITY_CAT:=$(BZCAT)
 
+METACITY_SOURCE2:=MCity-Clearlooks2.tar.gz
+METACITY_CAT2:=$(ZCAT)
+METACITY_SITE2:=http://art.gnome.org/download/themes/metacity/1190
+
 $(DL_DIR)/$(METACITY_SOURCE):
 	 $(WGET) -P $(DL_DIR) $(METACITY_SITE)/$(METACITY_SOURCE)
 
-metacity-source: $(DL_DIR)/$(METACITY_SOURCE)
+$(DL_DIR)/$(METACITY_SOURCE2):
+	 $(WGET) -P $(DL_DIR) $(METACITY_SITE2)/$(METACITY_SOURCE2)
 
-$(METACITY_DIR)/.unpacked: $(DL_DIR)/$(METACITY_SOURCE)
+metacity-source: $(DL_DIR)/$(METACITY_SOURCE) $(DL_DIR)/$(METACITY_SOURCE2)
+
+$(METACITY_DIR)/.unpacked: $(DL_DIR)/$(METACITY_SOURCE) $(DL_DIR)/$(METACITY_SOURCE2)
 	$(METACITY_CAT) $(DL_DIR)/$(METACITY_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
 	toolchain/patch-kernel.sh $(METACITY_DIR) package/metacity/ \*.patch*
 	(cd $(METACITY_DIR); libtoolize --force;)
@@ -121,7 +131,11 @@
 	mkdir -p $(TARGET_DIR)/usr/share/metacity/icons
 	cp -dpf $(STAGING_DIR)/usr/share/metacity/icons/* $(TARGET_DIR)/usr/share/metacity/icons/
 	mkdir -p $(TARGET_DIR)/usr/share/themes
-	cp -a $(STAGING_DIR)/usr/share/themes/* $(TARGET_DIR)/usr/share/themes/
+	$(METACITY_CAT2) $(DL_DIR)/$(METACITY_SOURCE2) | \
+		tar -C $(STAGING_DIR)/usr/share/themes $(TAR_OPTIONS) -
+	cp -a $(STAGING_DIR)/usr/share/themes/Clearlooks \
+		$(TARGET_DIR)/usr/share/themes/
+	(cd $(TARGET_DIR)/usr/share/themes; rm -rf Atlanta; ln -s Clearlooks Atlanta)
 	cp -a package/metacity/Xsession $(TARGET_DIR)/etc/X11/
 
 metacity: uclibc zlib xorg libgtk2 $(TARGET_DIR)/lib/*metacity*.so
