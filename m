From: aldot at uclibc.org <aldot@uclibc.org>
Date: Sat, 20 Jan 2007 12:54:06 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/dmalloc
Message-ID: <20070120205406.3D4DE4857C@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-01-20 12:54:05 -0800 (Sat, 20 Jan 2007)
New Revision: 17412

Log:
- dmalloc attempted to install itself to /
- make certain features dependant on the respective BR2 settings.


Modified:
   trunk/buildroot/package/dmalloc/dmalloc.mk


Changeset:
Modified: trunk/buildroot/package/dmalloc/dmalloc.mk
===================================================================
--- trunk/buildroot/package/dmalloc/dmalloc.mk	2007-01-20 20:48:33 UTC (rev 17411)
+++ trunk/buildroot/package/dmalloc/dmalloc.mk	2007-01-20 20:54:05 UTC (rev 17412)
@@ -22,8 +22,23 @@
 	$(SED) 's/^ac_cv_page_size=0$$/ac_cv_page_size=12/' $(DMALLOC_DIR)/configure
 	$(SED) 's/(ld -/($${LD-ld} -/' $(DMALLOC_DIR)/configure
 	$(SED) 's/'\''ld -/"$${LD-ld}"'\'' -/' $(DMALLOC_DIR)/configure
-	touch $(DMALLOC_DIR)/.unpacked
+	-$(SED) 's/ar cr/$$(AR) cr/' $(DMALLOC_DIR)/Makefile.in
+	touch $@
 
+ifeq ($(BR2_INSTALL_LIBSTDCPP),y)
+DMALLOC_CONFIG_ARGS:=--enable-cxx
+else
+DMALLOC_CONFIG_ARGS:=--disable-cxx
+endif
+
+ifeq ($(BR2_PTHREADS_NONE),y)
+DMALLOC_CONFIG_ARGS+=--disable-threads
+else
+DMALLOC_CONFIG_ARGS+=--enable-threads
+endif
+
+
+
 $(DMALLOC_DIR)/.configured: $(DMALLOC_DIR)/.unpacked
 	(cd $(DMALLOC_DIR); rm -rf config.cache; \
 		$(TARGET_CONFIGURE_OPTS) \
@@ -45,19 +60,26 @@
 		--includedir=/include \
 		--mandir=/usr/man \
 		--infodir=/usr/info \
-		--enable-threads \
 		--enable-shlib \
+		$(DMALLOC_CONFIG_ARGS) \
 	);
-	touch $(DMALLOC_DIR)/.configured
+	touch $@
 
 $(DMALLOC_DIR)/$(DMALLOC_BINARY): $(DMALLOC_DIR)/.configured
 	$(MAKE) -C $(DMALLOC_DIR)
 
 $(TARGET_DIR)/$(DMALLOC_TARGET_BINARY): $(DMALLOC_DIR)/$(DMALLOC_BINARY)
-	$(MAKE)	DESTDIR=$(STAGING_DIR) -C $(DMALLOC_DIR) install
+	# both DESTDIR and PREFIX are ignored..
+	$(MAKE)	includedir="$(STAGING_DIR)/usr/include" \
+		bindir="$(STAGING_DIR)/usr/bin" \
+		libdir="$(STAGING_DIR)/usr/lib" \
+		shlibdir="$(STAGING_DIR)/usr/lib" \
+		includedir="$(STAGING_DIR)/usr/share/info/" \
+		-C $(DMALLOC_DIR) install
 	(cd $(STAGING_DIR)/usr/lib; \
 		mv libdmalloc*.so $(TARGET_DIR)/usr/lib);
-	touch $(TARGET_DIR)/$(DMALLOC_TARGET_BINARY)
+	cp -dpf $(STAGING_DIR)/usr/bin/dmalloc $(TARGET_DIR)/$(DMALLOC_TARGET_BINARY)
+	$(STRIP) -s $(TARGET_DIR)/$(DMALLOC_TARGET_BINARY)
 
 dmalloc: uclibc $(TARGET_DIR)/$(DMALLOC_TARGET_BINARY)
 
