From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Tue, 19 Sep 2006 08:16:55 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/libglib12
Message-ID: <20060919151655.658C0485DA@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2006-09-19 08:16:55 -0700 (Tue, 19 Sep 2006)
New Revision: 16159

Log:
fix big/little endian

Modified:
   trunk/buildroot/package/libglib12/libglib12.mk


Changeset:
Modified: trunk/buildroot/package/libglib12/libglib12.mk
===================================================================
--- trunk/buildroot/package/libglib12/libglib12.mk	2006-09-19 15:12:12 UTC (rev 16158)
+++ trunk/buildroot/package/libglib12/libglib12.mk	2006-09-19 15:16:55 UTC (rev 16159)
@@ -9,6 +9,11 @@
 LIBGLIB12_DIR:=$(BUILD_DIR)/glib-1.2.10
 LIBGLIB12_BINARY:=libglib.a
 
+ifeq ($(BR2_ENDIAN),"BIG")
+LIBGLIB12_BE:=yes
+else
+LIBGLIB12_BE:=no
+endif
 
 $(DL_DIR)/$(LIBGLIB12_SOURCE):
 	 $(WGET) -P $(DL_DIR) $(LIBGLIB12_SITE)/$(LIBGLIB12_SOURCE)
@@ -24,6 +29,7 @@
 $(LIBGLIB12_DIR)/.configured: $(LIBGLIB12_DIR)/.unpacked
 	(cd $(LIBGLIB12_DIR); rm -rf config.cache; \
 		$(TARGET_CONFIGURE_OPTS) \
+		ac_cv_c_bigendian=$(LIBGLIB12_BE) \
 		./configure \
 		--host=$(REAL_GNU_TARGET_NAME) \
 		--build=$(GNU_HOST_NAME) \
