From: aldot at uclibc.org <aldot@uclibc.org>
Date: Thu, 21 Jun 2007 15:06:48 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/lzo
Message-ID: <20070621220648.E1A864865A@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-06-21 15:06:48 -0700 (Thu, 21 Jun 2007)
New Revision: 18886

Log:
- use correct path for lzo libs and headers


Modified:
   trunk/buildroot/package/lzo/lzo.mk


Changeset:
Modified: trunk/buildroot/package/lzo/lzo.mk
===================================================================
--- trunk/buildroot/package/lzo/lzo.mk	2007-06-21 22:05:39 UTC (rev 18885)
+++ trunk/buildroot/package/lzo/lzo.mk	2007-06-21 22:06:48 UTC (rev 18886)
@@ -22,7 +22,7 @@
 $(LZO_DIR)/.unpacked: $(DL_DIR)/$(LZO_SOURCE)
 	$(LZO_CAT) $(DL_DIR)/$(LZO_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
 	toolchain/patch-kernel.sh $(LZO_DIR) package/lzo/ lzo\*.patch
-	touch $(LZO_DIR)/.unpacked
+	touch $@
 
 LZO_CONFIG_SHARED:=--disable-shared
 #LZO_CONFIG_SHARED:=--enable-shared
@@ -36,21 +36,21 @@
 		--target=$(GNU_TARGET_NAME) \
 		--host=$(GNU_TARGET_NAME) \
 		--build=$(GNU_HOST_NAME) \
-		--prefix=/ \
-		--includedir=/include \
-		--libdir=/lib \
+		--prefix=/usr \
+		--includedir=/usr/include \
+		--libdir=/usr/lib \
 		$(LZO_CONFIG_SHARED) \
 	);
-	touch $(LZO_DIR)/.configured
+	touch $@
 
 $(LZO_DIR)/src/liblzo.la: $(LZO_DIR)/.configured
 	$(MAKE) -C $(LZO_DIR)
 
-$(STAGING_DIR)/lib/liblzo.a: $(LZO_DIR)/src/liblzo.la
+$(STAGING_DIR)/usr/lib/liblzo.a: $(LZO_DIR)/src/liblzo.la
 	$(MAKE) CC="$(TARGET_CC)" DESTDIR=$(STAGING_DIR) -C $(LZO_DIR) install
-	touch -c $(STAGING_DIR)/lib/liblzo.a
+	touch -c $@
 
-lzo: uclibc $(STAGING_DIR)/lib/liblzo.a
+lzo: uclibc $(STAGING_DIR)/usr/lib/liblzo.a
 
 lzo-clean:
 	$(MAKE) DESTDIR=$(STAGING_DIR) -C $(LZO_DIR) uninstall
