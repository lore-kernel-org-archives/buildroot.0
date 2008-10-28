From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Tue, 28 Oct 2008 02:40:26 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/qtopia4
Message-ID: <20081028094026.563A73C671@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-10-28 02:40:25 -0700 (Tue, 28 Oct 2008)
New Revision: 23827

Log:
qtopia4: fix use of pkg-config

When cross compiling, Qt sets PKG_CONFIG in its own configure script to
an empty string. That leads to not using pkg-config. To avoid that, use
the configure option -force-pkg-config. Also set environment variables
for pkg-config defined in TARGET_CONFIGURE_OPTS.

Patch by Markus Heidelberg.

See http://buildroot.uclibc.org/lists/buildroot/2008-October/011324.html
for more details.

Modified:
   trunk/buildroot/package/qtopia4/qtopia4.mk


Changeset:
Modified: trunk/buildroot/package/qtopia4/qtopia4.mk
===================================================================
--- trunk/buildroot/package/qtopia4/qtopia4.mk	2008-10-28 06:48:06 UTC (rev 23826)
+++ trunk/buildroot/package/qtopia4/qtopia4.mk	2008-10-28 09:40:25 UTC (rev 23827)
@@ -253,10 +253,15 @@
 	
 	-[ -f $(QTOPIA4_QCONFIG_FILE) ] && cp $(QTOPIA4_QCONFIG_FILE) \
 		$(QTOPIA4_TARGET_DIR)/$(QTOPIA4_QCONFIG_FILE_LOCATION)
+# Qt doesn't use PKG_CONFIG, it searches for pkg-config with 'which'.
+# PKG_CONFIG_SYSROOT is only used to avoid a warning from Qt's configure system
+# when cross compiling, Qt 4.4.3 is wrong here.
 	(cd $(QTOPIA4_TARGET_DIR); rm -rf config.cache; \
-		PATH=$(TARGET_PATH) \
+		$(TARGET_CONFIGURE_OPTS) \
+		PKG_CONFIG_SYSROOT="$(STAGING_DIR)" \
 		./configure \
 		-verbose \
+		-force-pkg-config \
 		-embedded $(BR2_PACKAGE_QTOPIA4_EMB_PLATFORM) \
 		$(QTOPIA4_QCONFIG_COMMAND) \
 		$(QTOPIA4_CONFIGURE) \
