From: tpetazzoni at uclibc.org <tpetazzoni@uclibc.org>
Date: Tue, 11 Nov 2008 10:35:43 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/qtopia4
Message-ID: <20081111183543.534143C9A4@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: tpetazzoni
Date: 2008-11-11 10:35:43 -0800 (Tue, 11 Nov 2008)
New Revision: 24001

Log:
Fix Qtopia build issues

This patch fixes two Qtopia build issues, encountered while trying to
use system implementation of zlib, freetype, jpeg and libpng :

 * The build process doesn't look in $(STAGING_DIR)/usr/include for
   includes and $(STAGING_DIR)/usr/lib. Same problem as the patch
   currently floating around adding LDFLAGS to TARGET_CONFIGURE_OPTS,
   but as Qtopia doesn't use TARGET_CONFIGURE_OPTS, we need a specific
   fix here. So we use the -I and -L options of Qtopia's configure
   script.

 * The build process doesn't use pkg-config to get the header path for
   Freetype headers (located in $(STAGING_DIR)/usr/include/freetype2
   and not directly in $(STAGING_DIR)/usr/include/). There was already
   a fix for this, consisting in adding $(FREETYPE_DIR)/include to the
   -I path of Qtopia's configure. This patch modifies this fix to use
   $(STAGING_DIR)/usr/include/freetype2 instead, which looks more
   coherent with how all the packages are built (using $(STAGING_DIR)
   as the reference to get headers and libraries).

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>



Modified:
   trunk/buildroot/package/qtopia4/qtopia4.mk


Changeset:
Modified: trunk/buildroot/package/qtopia4/qtopia4.mk
===================================================================
--- trunk/buildroot/package/qtopia4/qtopia4.mk	2008-11-11 18:32:31 UTC (rev 24000)
+++ trunk/buildroot/package/qtopia4/qtopia4.mk	2008-11-11 18:35:43 UTC (rev 24001)
@@ -212,7 +212,7 @@
 else
 ifeq ($(BR2_PACKAGE_QTOPIA4_SYSTEMFREETYPE),y)
 QTOPIA4_CONFIGURE+= -system-freetype
-QTOPIA4_CONFIGURE+= -I $(FREETYPE_DIR)/include
+QTOPIA4_CONFIGURE+= -I $(STAGING_DIR)/usr/include/freetype2/
 QTOPIA4_DEP_LIBS+=freetype
 else
 QTOPIA4_CONFIGURE+= -no-freetype
@@ -342,6 +342,8 @@
 		-no-rpath \
 		-nomake examples \
 		-nomake demos \
+		-I $(STAGING_DIR)/usr/include \
+		-L $(STAGING_DIR)/usr/lib \
 	)
 	touch $@
 
