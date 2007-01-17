From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Wed, 17 Jan 2007 05:58:02 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package:  rdesktop
Message-ID: <20070117135802.35C59485C4@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2007-01-17 05:58:01 -0800 (Wed, 17 Jan 2007)
New Revision: 17345

Log:
rdesktop package

Added:
   trunk/buildroot/package/rdesktop/
   trunk/buildroot/package/rdesktop/Config.in
   trunk/buildroot/package/rdesktop/rdesktop-8bit-colors.patch
   trunk/buildroot/package/rdesktop/rdesktop.mk

Modified:
   trunk/buildroot/package/Config.in


Changeset:
Modified: trunk/buildroot/package/Config.in
===================================================================
--- trunk/buildroot/package/Config.in	2007-01-17 13:54:12 UTC (rev 17344)
+++ trunk/buildroot/package/Config.in	2007-01-17 13:58:01 UTC (rev 17345)
@@ -253,8 +253,9 @@
 source "package/microwin/Config.in"
 source "package/metacity/Config.in"
 comment "X applications"
+source "package/dillo/Config.in"
+source "package/rdesktop/Config.in"
 source "package/rxvt/Config.in"
-source "package/dillo/Config.in"
 
 endif
 

Added: trunk/buildroot/package/rdesktop/Config.in
===================================================================
--- trunk/buildroot/package/rdesktop/Config.in	                        (rev 0)
+++ trunk/buildroot/package/rdesktop/Config.in	2007-01-17 13:58:01 UTC (rev 17345)
@@ -0,0 +1,12 @@
+config BR2_PACKAGE_RDESKTOP
+	bool "rdesktop"
+	select BR2_PACKAGE_XORG
+	select BR2_PACKAGE_OPENSSL
+	default n
+	help
+	  rdesktop is an open source client for Windows NT Terminal
+	  Server and Windows 2000/2003 Terminal Services, capable of
+	  natively speaking Remote Desktop Protocol (RDP) in order to
+	  present the user's NT desktop.
+
+	  http://rdesktop.sf.net/

Added: trunk/buildroot/package/rdesktop/rdesktop-8bit-colors.patch
===================================================================
--- trunk/buildroot/package/rdesktop/rdesktop-8bit-colors.patch	                        (rev 0)
+++ trunk/buildroot/package/rdesktop/rdesktop-8bit-colors.patch	2007-01-17 13:58:01 UTC (rev 17345)
@@ -0,0 +1,21 @@
+diff -urpN rdesktop-1.5.0-orig/xwin.c rdesktop-1.5.0/xwin.c
+--- rdesktop-1.5.0-orig/xwin.c	2007-01-17 12:01:18.000000000 +0100
++++ rdesktop-1.5.0/xwin.c	2007-01-17 12:05:02.000000000 +0100
+@@ -1461,7 +1461,7 @@ select_visual(int screen_num)
+ 		}
+ 
+ 		/* we use a colourmap, so the default visual should do */
+-		g_owncolmap = True;
++//		g_owncolmap = True;
+ 		g_visual = vmatches[0].visual;
+ 		g_depth = vmatches[0].depth;
+ 	}
+@@ -1568,7 +1568,7 @@ ui_init(void)
+ 	{
+ 		g_xcolmap =
+ 			XCreateColormap(g_display, RootWindowOfScreen(g_screen), g_visual,
+-					AllocNone);
++					(g_depth <= 8) ? AllocAll : AllocNone);
+ 		if (g_depth <= 8)
+ 			warning("Display colour depth is %d bit: you may want to use -C for a private colourmap.\n", g_depth);
+ 	}

Added: trunk/buildroot/package/rdesktop/rdesktop.mk
===================================================================
--- trunk/buildroot/package/rdesktop/rdesktop.mk	                        (rev 0)
+++ trunk/buildroot/package/rdesktop/rdesktop.mk	2007-01-17 13:58:01 UTC (rev 17345)
@@ -0,0 +1,60 @@
+#############################################################
+#
+# rdesktop
+#
+#############################################################
+
+RDESKTOP_VERSION=1.5.0
+RDESKTOP_SOURCE=rdesktop-$(RDESKTOP_VERSION).tar.gz
+RDESKTOP_SITE=http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/rdesktop/
+RDESKTOP_DIR=$(BUILD_DIR)/rdesktop-$(RDESKTOP_VERSION)
+RDESKTOP_CAT:=$(ZCAT)
+
+$(DL_DIR)/$(RDESKTOP_SOURCE):
+	$(WGET) -P $(DL_DIR) $(RDESKTOP_SITE)/$(RDESKTOP_SOURCE)
+
+$(RDESKTOP_DIR)/.unpacked: $(DL_DIR)/$(RDESKTOP_SOURCE)
+	$(RDESKTOP_CAT) $(DL_DIR)/$(RDESKTOP_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
+	toolchain/patch-kernel.sh $(RDESKTOP_DIR) package/rdesktop/ \*.patch*
+	touch $(RDESKTOP_DIR)/.unpacked
+
+$(RDESKTOP_DIR)/.configured: $(RDESKTOP_DIR)/.unpacked
+	(cd $(RDESKTOP_DIR); rm -rf config.cache; \
+		$(TARGET_CONFIGURE_OPTS) \
+		./configure \
+		--target=$(GNU_TARGET_NAME) \
+		--host=$(GNU_TARGET_NAME) \
+		--build=$(GNU_HOST_NAME) \
+		--prefix=/usr \
+		--with-openssl=$(STAGING_DIR) \
+		--sysconfdir=/etc \
+	);
+	read
+	touch $(RDESKTOP_DIR)/.configured
+
+$(RDESKTOP_DIR)/rdesktop: $(RDESKTOP_DIR)/.configured
+	$(MAKE) CC=$(TARGET_CC) -C $(RDESKTOP_DIR)
+
+$(RDESKTOP_DIR)/.installed: $(RDESKTOP_DIR)/rdesktop
+	cp $(RDESKTOP_DIR)/rdesktop $(TARGET_DIR)/usr/bin
+	touch $(RDESKTOP_DIR)/.installed
+
+rdesktop: uclibc xorg openssl $(RDESKTOP_DIR)/.installed
+
+rdesktop-source: $(DL_DIR)/$(RDESKTOP_SOURCE)
+
+rdesktop-clean:
+	@if [ -d $(RDESKTOP_DIR)/Makefile ] ; then \
+		$(MAKE) -C $(RDESKTOP_DIR) clean ; \
+	fi;
+
+rdesktop-dirclean:
+	rm -rf $(RDESKTOP_DIR) $(RDESKTOP_DIR)
+#############################################################
+#
+# Toplevel Makefile options
+#
+#############################################################
+ifeq ($(strip $(BR2_PACKAGE_RDESKTOP)),y)
+TARGETS+=rdesktop
+endif
