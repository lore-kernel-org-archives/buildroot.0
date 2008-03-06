From: ninevoltz at uclibc.org <ninevoltz@uclibc.org>
Date: Thu,  6 Mar 2008 10:16:50 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/libxslt
Message-ID: <20080306181650.8C895120235@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ninevoltz
Date: 2008-03-06 10:16:49 -0800 (Thu, 06 Mar 2008)
New Revision: 21209

Log:
updated libxslt

Added:
   trunk/buildroot/package/libxslt/libxslt-1.1.21-configure.patch

Modified:
   trunk/buildroot/package/libxslt/libxslt.mk


Changeset:
Added: trunk/buildroot/package/libxslt/libxslt-1.1.21-configure.patch
===================================================================
--- trunk/buildroot/package/libxslt/libxslt-1.1.21-configure.patch	                        (rev 0)
+++ trunk/buildroot/package/libxslt/libxslt-1.1.21-configure.patch	2008-03-06 18:16:49 UTC (rev 21209)
@@ -0,0 +1,18 @@
+--- a/configure	2007-06-12 12:43:03.000000000 -0400
++++ b/configure	2008-02-18 08:52:36.000000000 -0500
+@@ -22090,15 +22090,11 @@ esac
+ 
+ 
+ 
+-XSLT_LIBDIR='-L${libdir}'
+-XSLT_INCLUDEDIR='-I${includedir}'
+ XSLT_LIBS="-lxslt $LIBXML_LIBS $M_LIBS"
+ 
+ 
+ 
+ 
+-EXSLT_LIBDIR='-L${libdir}'
+-EXSLT_INCLUDEDIR='-I${includedir}'
+ EXSLT_LIBS="-lexslt $XSLT_LIBS $LIBGCRYPT_LIBS"
+ 
+ 

Modified: trunk/buildroot/package/libxslt/libxslt.mk
===================================================================
--- trunk/buildroot/package/libxslt/libxslt.mk	2008-03-06 18:16:30 UTC (rev 21208)
+++ trunk/buildroot/package/libxslt/libxslt.mk	2008-03-06 18:16:49 UTC (rev 21209)
@@ -13,6 +13,8 @@
 
 $(LIBXSLT_DIR)/.unpacked: $(DL_DIR)/$(LIBXSLT_SOURCE)
 	gzip -d -c $(DL_DIR)/$(LIBXSLT_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
+	toolchain/patch-kernel.sh $(LIBXSLT_DIR) package/libxslt/ libxslt-$(LIBXSLT_VERSION)\*.patch*
+	$(CONFIG_UPDATE) $(LIBXSLT_DIR)
 	touch $@
 
 #PKG_CONFIG_PATH="$(STAGING_DIR)/lib/pkconfig:$(STAGING_DIR)/usr/lib/pkgconfig" \
@@ -24,7 +26,10 @@
 	(cd $(LIBXSLT_DIR); \
 		$(TARGET_CONFIGURE_OPTS) \
 		$(TARGET_CONFIGURE_ARGS) \
+		PKG_CONFIG_PATH="$(STAGING_DIR)/usr/lib/pkgconfig" \
 		CFLAGS="$(TARGET_CFLAGS) -DNO_LARGEFILE_SOURCE" \
+		EXSLT_LIBDIR=$(STAGING_DIR)/usr/lib \
+		XSLT_LIBDIR=$(STAGING_DIR)/usr/lib \
 		./configure \
 		--target=$(GNU_TARGET_NAME) \
 		--host=$(GNU_TARGET_NAME) \
@@ -38,7 +43,7 @@
 		--sysconfdir=/etc \
 		--datadir=/usr/share \
 		--localstatedir=/var \
-		--includedir=/include \
+		--includedir=/usr/include \
 		--mandir=/usr/man \
 		--infodir=/usr/info \
 		--enable-shared \
@@ -48,6 +53,7 @@
 		--without-debugging \
 		--without-python \
 		--without-threads \
+		--with-libxml-libs-prefix=$(STAGING_DIR)/usr/lib \
 	);
 	touch $@
 
