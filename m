From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Tue, 17 Mar 2009 13:49:12 +0000 (UTC)
Subject: [Buildroot] svn commit: [25708] trunk/buildroot/package/libglib2
Message-ID: <20090317134912.BBBDC76419@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-03-17 13:49:12 +0000 (Tue, 17 Mar 2009)
New Revision: 25708

Log:
libglib2: pkgconfig patch no longer needed as we have HOST_DIR in path

Removed:
   trunk/buildroot/package/libglib2/libglib2-pkgconfig-cc.patch

Modified:
   trunk/buildroot/package/libglib2/libglib2.mk


Changeset:
Deleted: trunk/buildroot/package/libglib2/libglib2-pkgconfig-cc.patch
===================================================================
--- trunk/buildroot/package/libglib2/libglib2-pkgconfig-cc.patch	2009-03-17 13:49:03 UTC (rev 25707)
+++ trunk/buildroot/package/libglib2/libglib2-pkgconfig-cc.patch	2009-03-17 13:49:12 UTC (rev 25708)
@@ -1,27 +0,0 @@
-glib2: prefix glib binaries in pkgconfig file with BIN_DIR
-
-Make sure the host versions of the glib binaries are used.
----
- glib-2.0.pc.in |    7 ++++---
- 1 file changed, 4 insertions(+), 3 deletions(-)
-
-Index: glib-2.18.4/glib-2.0.pc.in
-===================================================================
---- glib-2.18.4.orig/glib-2.0.pc.in
-+++ glib-2.18.4/glib-2.0.pc.in
-@@ -1,11 +1,12 @@
-+BIN_DIR=
- prefix=@prefix@
- exec_prefix=@exec_prefix@
- libdir=@libdir@
- includedir=@includedir@
- 
--glib_genmarshal=glib-genmarshal
--gobject_query=gobject-query
--glib_mkenums=glib-mkenums
-+glib_genmarshal=${BIN_DIR}glib-genmarshal
-+gobject_query=$(BIN_DIR}gobject-query
-+glib_mkenums=${BIN_DIR}glib-mkenums
- 
- Name: GLib
- Description: C Utility Library

Modified: trunk/buildroot/package/libglib2/libglib2.mk
===================================================================
--- trunk/buildroot/package/libglib2/libglib2.mk	2009-03-17 13:49:03 UTC (rev 25707)
+++ trunk/buildroot/package/libglib2/libglib2.mk	2009-03-17 13:49:12 UTC (rev 25708)
@@ -64,11 +64,6 @@
 
 $(eval $(call AUTOTARGETS,package,libglib2))
 
-$(LIBGLIB2_HOOK_POST_INSTALL): $(LIBGLIB2_TARGET_INSTALL_STAGING)
-	$(SED) 's~^BIN_DIR=.*~BIN_DIR=$(HOST_DIR)/usr/bin/~' \
-		$(STAGING_DIR)/usr/lib/pkgconfig/glib-2.0.pc
-	touch $@
-
 # libglib2 for the host
 LIBGLIB2_HOST_DIR:=$(BUILD_DIR)/libglib2-$(LIBGLIB2_VERSION)-host
 LIBGLIB2_HOST_BINARY:=$(HOST_DIR)/usr/bin/glib-genmarshal
