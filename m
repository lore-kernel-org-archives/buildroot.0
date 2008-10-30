From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 30 Oct 2008 09:03:58 +0100
Subject: [Buildroot] [PATCH] Fix Qtopia build
Message-ID: <20081030090358.06a8a8cb@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

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
---
 package/qtopia4/qtopia4.mk |    4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

Index: buildroot/package/qtopia4/qtopia4.mk
===================================================================
--- buildroot.orig/package/qtopia4/qtopia4.mk
+++ buildroot/package/qtopia4/qtopia4.mk
@@ -151,7 +151,7 @@
 else
 ifeq ($(BR2_PACKAGE_QTOPIA4_SYSTEMFREETYPE),y)
 QTOPIA4_CONFIGURE+= -system-freetype
-QTOPIA4_CONFIGURE+= -I $(FREETYPE_DIR)/include
+QTOPIA4_CONFIGURE+= -I $(STAGING_DIR)/usr/include/freetype2/
 QTOPIA4_DEP_LIBS+=freetype
 else
 QTOPIA4_CONFIGURE+= -no-freetype
@@ -277,6 +277,8 @@
 		-no-rpath \
 		-nomake examples \
 		-nomake demos \
+		-I $(STAGING_DIR)/usr/include \
+		-L $(STAGING_DIR)/usr/lib \
 	)
 	touch $@
 


-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers and embedded Linux development,
consulting, training and support.
http://free-electrons.com
