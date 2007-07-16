From: ulf at uclibc.org <ulf@uclibc.org>
Date: Mon, 16 Jul 2007 03:00:31 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/gettext
Message-ID: <20070716100031.90A15A6ABC@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-07-16 03:00:29 -0700 (Mon, 16 Jul 2007)
New Revision: 19109

Log:
Temporarily allow static libgettext library option to ensure build can complete for ARM

Modified:
   trunk/buildroot/package/gettext/Config.in
   trunk/buildroot/package/gettext/gettext.mk


Changeset:
Modified: trunk/buildroot/package/gettext/Config.in
===================================================================
--- trunk/buildroot/package/gettext/Config.in	2007-07-16 09:45:39 UTC (rev 19108)
+++ trunk/buildroot/package/gettext/Config.in	2007-07-16 10:00:29 UTC (rev 19109)
@@ -8,6 +8,19 @@
 
 	  http://www.gnu.org/software/gettext/
 
+config BR2_PACKAGE_GETTEXT_STATIC
+	bool "Use libgettext.a instead of libgettext.so.*"
+	default y
+	depends on BR2_PACKAGE_GETTEXT
+	depends on BR2_arm
+	help
+	  The GNU `gettext' utilities are a set of tools that provide a
+	  framework to help other GNU packages produce multi-lingual
+	  messages.
+
+	  http://www.gnu.org/software/gettext/
+
+
 config BR2_PACKAGE_LIBINTL
 	bool "libintl"
 	default n

Modified: trunk/buildroot/package/gettext/gettext.mk
===================================================================
--- trunk/buildroot/package/gettext/gettext.mk	2007-07-16 09:45:39 UTC (rev 19108)
+++ trunk/buildroot/package/gettext/gettext.mk	2007-07-16 10:00:29 UTC (rev 19109)
@@ -11,6 +11,12 @@
 GETTEXT_BINARY:=gettext-runtime/src/gettext
 GETTEXT_TARGET_BINARY:=usr/bin/gettext
 
+ifeq ($(strip $(BR2_PACKAGE_GETTEXT_STATIC)),y)
+LIBINTL_TARGET_BINARY:=usr/lib/libintl.a
+else
+LIBINTL_TARGET_BINARY:=usr/lib/libintl.so
+endif
+
 $(DL_DIR)/$(GETTEXT_SOURCE):
 	 $(WGET) -P $(DL_DIR) $(GETTEXT_SITE)/$(GETTEXT_SOURCE)
 
@@ -91,6 +97,7 @@
 		--prefix=/usr \
 		--exec-prefix=/usr \
 		--disable-libasprintf \
+		--enable-shared \
 		$(IGNORE_EXTERNAL_GETTEXT) \
 		$(OPENMP) \
 	);
@@ -144,8 +151,13 @@
 	rm -f $(TARGET_DIR)/usr/lib/libgettext*.so*.la $(TARGET_DIR)/usr/lib/libintl*.so*.la
 	touch -c $@
 
-libintl: $(TARGET_DIR)/usr/lib/libintl.so
+$(TARGET_DIR)/usr/lib/libintl.a: $(STAGING_DIR)/$(GETTEXT_TARGET_BINARY)
+	cp -dpf $(STAGING_DIR)/usr/lib/libgettext*.a $(TARGET_DIR)/usr/lib/
+	cp -dpf $(STAGING_DIR)/usr/lib/libintl*.a 	$(TARGET_DIR)/usr/lib/
+	touch -c $@
 
+libintl: $(TARGET_DIR)/$(LIBINTL_TARGET_BINARY)
+
 #############################################################
 #
 # Toplevel Makefile options
