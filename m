From: =?iso-8859-1?Q?Arnar_Mar_Sigur=F0sson?= <antab@valka.is>
Date: Wed, 29 Oct 2008 14:11:29 -0000
Subject: [Buildroot] svn commit: trunk/buildroot/package/qtopia4
References: <20081028094026.563A73C671@busybox.net>
Message-ID: <061E11D86E3DFF459604DF5B36F0805F1BA6D0@salka01.valka.local>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This breaks building Qt for AVR32. It will force qmake to be build for the target so its unusable later on.


-----Original Message-----
From: buildroot-bounces@uclibc.org on behalf of jacmet at uclibc.org
Sent: Tue 10/28/2008 9:40 AM
To: buildroot at uclibc.org
Subject: [Buildroot] svn commit: trunk/buildroot/package/qtopia4
 
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

_______________________________________________
buildroot mailing list
buildroot at uclibc.org
http://busybox.net/mailman/listinfo/buildroot




-------------- next part --------------
A non-text attachment was scrubbed...
Name: not available
Type: application/ms-tnef
Size: 3596 bytes
Desc: not available
Url : http://busybox.net/lists/buildroot/attachments/20081029/8bed3fde/attachment.bin 
