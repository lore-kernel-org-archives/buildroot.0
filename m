From: aldot at uclibc.org <aldot@uclibc.org>
Date: Wed, 13 Dec 2006 11:57:05 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package: gmp mpfr
Message-ID: <20061213195705.970F148587@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2006-12-13 11:57:05 -0800 (Wed, 13 Dec 2006)
New Revision: 16903

Log:
- Add libgmp-host and libmpfr-host support. I'll need this for fortran support.


Modified:
   trunk/buildroot/package/gmp/gmp.mk
   trunk/buildroot/package/mpfr/mpfr.mk


Changeset:
Modified: trunk/buildroot/package/gmp/gmp.mk
===================================================================
--- trunk/buildroot/package/gmp/gmp.mk	2006-12-13 19:55:27 UTC (rev 16902)
+++ trunk/buildroot/package/gmp/gmp.mk	2006-12-13 19:57:05 UTC (rev 16903)
@@ -85,6 +85,7 @@
 		$(TARGET_DIR)/lib/libgmp.a
 
 libgmp: uclibc $(TARGET_DIR)/lib/libgmp.so.$(GMP_LIBVERSION)
+libgmp-stage: uclibc $(STAGING_DIR)/lib/$(GMP_BINARY)
 
 libgmp-clean:
 	rm -f $(TARGET_DIR)/lib/$(GMP_BINARY)
@@ -93,6 +94,37 @@
 libgmp-dirclean:
 	rm -rf $(GMP_DIR)
 
+GMP_HOST_DIR:=$(TOOL_BUILD_DIR)/gmp-$(GMP_VERSION)
+$(GMP_HOST_DIR)/.configured: $(GMP_DIR)/.unpacked
+	[ -d $(GMP_HOST_DIR) ] || mkdir $(GMP_HOST_DIR)
+	(cd $(GMP_HOST_DIR); \
+		CC_FOR_BUILD="$(HOSTCC)" \
+		CC="$(HOSTCC)" \
+		CFLAGS="$(HOST_CFLAGS)" \
+		$(GMP_DIR)/configure \
+		--prefix=$(STAGING_DIR) \
+		--exec_prefix=$(STAGING_DIR) \
+		--libdir=$(STAGING_DIR)/lib \
+		--includedir=$(STAGING_DIR)/include \
+		--bindir=/usr/bin \
+		--sbindir=/usr/sbin \
+		--libexecdir=/usr/lib \
+		--sysconfdir=/etc \
+		--datadir=/usr/share \
+		--localstatedir=/var \
+		--mandir=/usr/man \
+		--infodir=/usr/info \
+		--enable-shared \
+		--enable-static \
+		$(DISABLE_NLS) \
+	) && \
+	touch $(GMP_HOST_DIR)/.configured
+
+$(GMP_HOST_DIR)/.libs/$(GMP_BINARY): $(GMP_HOST_DIR)/.configured
+	$(MAKE) -C $(GMP_HOST_DIR)
+
+libgmp-host: $(GMP_HOST_DIR)/.libs/$(GMP_BINARY)
+
 #############################################################
 #
 # Toplevel Makefile options

Modified: trunk/buildroot/package/mpfr/mpfr.mk
===================================================================
--- trunk/buildroot/package/mpfr/mpfr.mk	2006-12-13 19:55:27 UTC (rev 16902)
+++ trunk/buildroot/package/mpfr/mpfr.mk	2006-12-13 19:57:05 UTC (rev 16903)
@@ -34,11 +34,12 @@
 endif
 	touch $(MPFR_DIR)/.unpacked
 
-$(MPFR_DIR)/.configured: $(MPFR_DIR)/.unpacked
+$(MPFR_DIR)/.configured: $(MPFR_DIR)/.unpacked $(STAGING_DIR)/lib/$(GMP_BINARY)
 	(cd $(MPFR_DIR); rm -rf config.cache; \
 		$(TARGET_CONFIGURE_OPTS) \
 		CFLAGS="$(TARGET_CFLAGS)" \
 		ac_cv_c_bigendian=$(MPFR_BE) \
+		CXX="" \
 		./configure \
 		--host=$(REAL_GNU_TARGET_NAME) \
 		--build=$(GNU_HOST_NAME) \
@@ -55,6 +56,7 @@
 		--mandir=/usr/man \
 		--infodir=/usr/info \
 		--enable-shared \
+		--with-gmp=$(STAGING_DIR) \
 		$(DISABLE_NLS) \
 	);
 	touch $(MPFR_DIR)/.configured
@@ -90,6 +92,7 @@
 		$(TARGET_DIR)/lib/libmpfr.a
 
 libmpfr: uclibc libgmp $(TARGET_DIR)/lib/libmpfr.so.$(MPFR_LIBVERSION)
+libmpfr-stage: uclibc $(STAGING_DIR)/lib/$(MPFR_BINARY)
 
 libmpfr-clean:
 	rm -f $(TARGET_DIR)/lib/$(MPFR_BINARY)
@@ -98,6 +101,37 @@
 libmpfr-dirclean:
 	rm -rf $(MPFR_DIR)
 
+MPFR_HOST_DIR:=$(TOOL_BUILD_DIR)/mpfr-$(MPFR_VERSION)
+$(MPFR_HOST_DIR)/.configured: $(MPFR_DIR)/.unpacked libgmp-host
+	[ -d $(MPFR_HOST_DIR) ] || mkdir $(MPFR_HOST_DIR)
+	(cd $(MPFR_HOST_DIR); \
+		CC="$(HOSTCC)" \
+		CXX="$(HOSTCXX)" \
+		$(MPFR_DIR)/configure \
+		--prefix=$(STAGING_DIR) \
+		--exec_prefix=$(STAGING_DIR) \
+		--libdir=$(STAGING_DIR)/lib \
+		--includedir=$(STAGING_DIR)/include \
+		--bindir=/usr/bin \
+		--sbindir=/usr/sbin \
+		--libexecdir=/usr/lib \
+		--sysconfdir=/etc \
+		--datadir=/usr/share \
+		--localstatedir=/var \
+		--mandir=/usr/man \
+		--infodir=/usr/info \
+		--enable-shared \
+		--enable-static \
+		--with-gmp-build=$(GMP_HOST_DIR) \
+		$(DISABLE_NLS) \
+	) && \
+	touch $(MPFR_DIR)/.configured
+
+$(MPFR_HOST_DIR)/.libs/$(MPFR_BINARY): $(MPFR_HOST_DIR)/.configured
+	$(MAKE) -C $(MPFR_HOST_DIR)
+
+libmpfr-host: $(MPFR_HOST_DIR)/.libs/$(MPFR_BINARY)
+
 #############################################################
 #
 # Toplevel Makefile options
