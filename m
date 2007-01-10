From: andersen at uclibc.org <andersen@uclibc.org>
Date: Wed, 10 Jan 2007 02:29:25 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/libpng
Message-ID: <20070110102925.5496E48562@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: andersen
Date: 2007-01-10 02:29:24 -0800 (Wed, 10 Jan 2007)
New Revision: 17222

Log:
fix install such that pkg-config setup is correct


Modified:
   trunk/buildroot/package/libpng/libpng.mk


Changeset:
Modified: trunk/buildroot/package/libpng/libpng.mk
===================================================================
--- trunk/buildroot/package/libpng/libpng.mk	2007-01-10 09:28:01 UTC (rev 17221)
+++ trunk/buildroot/package/libpng/libpng.mk	2007-01-10 10:29:24 UTC (rev 17222)
@@ -50,7 +50,10 @@
 		--target=$(GNU_TARGET_NAME) \
 		--host=$(GNU_TARGET_NAME) \
 		--build=$(GNU_HOST_NAME) \
-		--prefix=/usr \
+		--prefix=$(STAGING_DIR) \
+		--exec_prefix=$(STAGING_DIR) \
+		--libdir=$(STAGING_DIR)/lib \
+		--includedir=$(STAGING_DIR)/include \
 		--without-libpng-compat \
 	);
 	touch $(LIBPNG_DIR)/.configured
@@ -60,11 +63,21 @@
 	touch $(LIBPNG_DIR)/.compiled
 
 $(STAGING_DIR)/lib/libpng.so: $(LIBPNG_DIR)/.compiled
-	$(MAKE) \
-		-C $(LIBPNG_DIR) \
-		DESTDIR=$(STAGING_DIR) \
-		prefix=/ \
-		install
+	$(MAKE) prefix=$(STAGING_DIR) \
+	    exec_prefix=$(STAGING_DIR) \
+	    bindir=$(STAGING_DIR)/bin \
+	    sbindir=$(STAGING_DIR)/sbin \
+	    libexecdir=$(STAGING_DIR)/libexec \
+	    datadir=$(STAGING_DIR)/share \
+	    sysconfdir=$(STAGING_DIR)/etc \
+	    sharedstatedir=$(STAGING_DIR)/com \
+	    localstatedir=$(STAGING_DIR)/var \
+	    libdir=$(STAGING_DIR)/lib \
+	    includedir=$(STAGING_DIR)/include \
+	    oldincludedir=$(STAGING_DIR)/include \
+	    infodir=$(STAGING_DIR)/info \
+	    mandir=$(STAGING_DIR)/man \
+	    -C $(LIBPNG_DIR) install;
 	touch -c $(STAGING_DIR)/lib/libpng.so
 
 $(TARGET_DIR)/usr/lib/libpng.so: $(STAGING_DIR)/lib/libpng.so
