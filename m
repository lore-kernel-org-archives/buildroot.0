From: ulf at uclibc.org <ulf@uclibc.org>
Date: Tue, 20 May 2008 22:52:13 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/qtopia4
Message-ID: <20080521055213.781553C67D@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2008-05-20 22:52:12 -0700 (Tue, 20 May 2008)
New Revision: 22032

Log:
add SVG selection to Qtopia 4 and fix strip command

Modified:
   trunk/buildroot/package/qtopia4/Config.in
   trunk/buildroot/package/qtopia4/qtopia4.mk


Changeset:
Modified: trunk/buildroot/package/qtopia4/Config.in
===================================================================
--- trunk/buildroot/package/qtopia4/Config.in	2008-05-21 05:48:38 UTC (rev 22031)
+++ trunk/buildroot/package/qtopia4/Config.in	2008-05-21 05:52:12 UTC (rev 22032)
@@ -147,6 +147,12 @@
 
 endchoice
 
+config BR2_PACKAGE_QTOPIA4_SVG
+	bool "Enable SVG support"
+	depends BR2_PACKAGE_QTOPIA4
+	help
+	  Enable the QtSvg library.
+
 config BR2_PACKAGE_QTOPIA4_SQL
 	bool "Enable SQL support"
 	depends BR2_PACKAGE_QTOPIA4

Modified: trunk/buildroot/package/qtopia4/qtopia4.mk
===================================================================
--- trunk/buildroot/package/qtopia4/qtopia4.mk	2008-05-21 05:48:38 UTC (rev 22031)
+++ trunk/buildroot/package/qtopia4/qtopia4.mk	2008-05-21 05:52:12 UTC (rev 22032)
@@ -154,6 +154,12 @@
 QTOPIA4_OPENSSL=-no-openssl
 endif
 
+ifeq ($(BR2_PACKAGE_QTOPIA4_SVG),y)
+QTOPIA4_SVG=-svg
+else
+QTOPIA4_SVG=-no-svg
+endif
+
 ifeq ($(BR2_PACKAGE_QTOPIA4_SQL),y)
 QTOPIA4_SQL_IBASE=-qt-sql-ibase
 QTOPIA4_SQL_MYSQL=-qt-sql-mysql
@@ -220,6 +226,7 @@
 		$(QTOPIA4_PNG) \
 		$(QTOPIA4_TIFF) \
 		$(QTOPIA4_ZLIB) \
+		$(QTOPIA4_SVG) \
 		$(QTOPIA4_SQL_IBASE) \
 		$(QTOPIA4_SQL_MYSQL) \
 		$(QTOPIA4_SQL_ODBC) \
@@ -260,20 +267,22 @@
 	cp -dpf $(STAGING_DIR)/usr/lib/fonts/micro*.qpf $(TARGET_DIR)/usr/lib/fonts
 ifeq ($(BR2_PACKAGE_QTOPIA4_SHARED),y)
 	cp -dpf $(STAGING_DIR)/usr/lib/libQt*.so.* $(TARGET_DIR)/usr/lib/
-	-$(STRIPCMD) --strip-unneeded $(TARGET_DIR)/usr/lib/libQt*.so.*
+	-$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/usr/lib/libQt*.so.*
 endif
 	# Install image plugins if they are built
 	if [ -d $(STAGING_DIR)/usr/plugins/imageformats ]; then \
 		mkdir -p $(TARGET_DIR)/usr/plugins; \
 		cp -dpfr $(STAGING_DIR)/usr/plugins/imageformats $(TARGET_DIR)/usr/plugins/; \
-		$(STRIPCMD) --strip-unneeded $(TARGET_DIR)/usr/plugins/imageformats/*; \
+		$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/usr/plugins/imageformats/*; \
 	fi
 ifneq ($(BR2_PACKAGE_QTOPIA4_SQL),y)
 	# Remove Sql libraries, not needed
 	-rm $(TARGET_DIR)/usr/lib/libQtSql*
 endif
+ifneq ($(BR2_PACKAGE_QTOPIA4_SVG),y)
 	# Remove Svg libraries, not needed
 	-rm $(TARGET_DIR)/usr/lib/libQtSvg*
+endif
 
 qtopia4: uclibc zlib $(QTOPIA4_DEP_LIBS) $(TARGET_DIR)/usr/lib/libQtCore.so.4
 
