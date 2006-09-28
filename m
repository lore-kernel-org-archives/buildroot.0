From: aldot at uclibc.org <aldot@uclibc.org>
Date: Thu, 28 Sep 2006 10:38:06 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package:  gmp mpfr
Message-ID: <20060928173806.A5CA3485AB@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2006-09-28 10:38:06 -0700 (Thu, 28 Sep 2006)
New Revision: 16250

Log:
- add stubs for gmp and mpfr
  not yet enabled


Added:
   trunk/buildroot/package/gmp/
   trunk/buildroot/package/gmp/Config.in
   trunk/buildroot/package/gmp/gmp.mk
   trunk/buildroot/package/mpfr/
   trunk/buildroot/package/mpfr/Config.in
   trunk/buildroot/package/mpfr/mpfr.mk


Changeset:
Added: trunk/buildroot/package/gmp/Config.in
===================================================================
--- trunk/buildroot/package/gmp/Config.in	2006-09-28 14:26:32 UTC (rev 16249)
+++ trunk/buildroot/package/gmp/Config.in	2006-09-28 17:38:06 UTC (rev 16250)
@@ -0,0 +1,16 @@
+config BR2_PACKAGE_GMP
+	bool "gmp"
+	default n
+	help
+	  GNU Multiple Precision Arithmetic Library.
+
+	  http://www.swox.com/gmp/
+
+
+config BR2_PACKAGE_GMP_HEADERS
+	bool "gmp headers for target"
+	default n
+	depends on BR2_PACKAGE_GMP
+	help
+	  Install the gmp.h for the target.
+

Added: trunk/buildroot/package/gmp/gmp.mk
===================================================================
--- trunk/buildroot/package/gmp/gmp.mk	2006-09-28 14:26:32 UTC (rev 16249)
+++ trunk/buildroot/package/gmp/gmp.mk	2006-09-28 17:38:06 UTC (rev 16250)
@@ -0,0 +1,100 @@
+#############################################################
+#
+# gmp
+#
+#############################################################
+GMP_VERSION:=4.2.1
+GMP_SOURCE:=gmp-$(GMP_VERSION).tar.bz2
+GMP_SITE:=http://ftp.sunet.se/pub/gnu/gmp/
+GMP_CAT:=bzcat
+GMP_DIR:=$(BUILD_DIR)/gmp-$(GMP_VERSION)
+GMP_BINARY:=libgmp.a
+GMP_LIBVERSION:=3.4.1
+
+ifeq ($(BR2_ENDIAN),"BIG")
+GMP_BE:=yes
+else
+GMP_BE:=no
+endif
+
+$(DL_DIR)/$(GMP_SOURCE):
+	 $(WGET) -P $(DL_DIR) $(GMP_SITE)/$(GMP_SOURCE)
+
+gmp-source: $(DL_DIR)/$(GMP_SOURCE)
+
+$(GMP_DIR)/.unpacked: $(DL_DIR)/$(GMP_SOURCE)
+	$(GMP_CAT) $(DL_DIR)/$(GMP_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
+	toolchain/patch-kernel.sh $(GMP_DIR) package/gmp/ \*.patch
+	$(CONFIG_UPDATE) $(GMP_DIR)
+	touch $(GMP_DIR)/.unpacked
+
+$(GMP_DIR)/.configured: $(GMP_DIR)/.unpacked
+	(cd $(GMP_DIR); rm -rf config.cache; \
+		$(TARGET_CONFIGURE_OPTS) \
+		ac_cv_c_bigendian=$(GMP_BE) \
+		./configure \
+		--host=$(REAL_GNU_TARGET_NAME) \
+		--build=$(GNU_HOST_NAME) \
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
+		$(DISABLE_NLS) \
+	);
+	touch $(GMP_DIR)/.configured
+
+$(GMP_DIR)/.libs/$(GMP_BINARY): $(GMP_DIR)/.configured
+	$(MAKE) CC=$(TARGET_CC) -C $(GMP_DIR)
+
+$(STAGING_DIR)/lib/$(GMP_BINARY): $(GMP_DIR)/.libs/$(GMP_BINARY)
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
+	    -C $(GMP_DIR) install;
+
+$(TARGET_DIR)/lib/libgmp.so.$(GMP_LIBVERSION): $(STAGING_DIR)/lib/$(GMP_BINARY)
+	cp -a $(STAGING_DIR)/lib/libgmp.so* $(STAGING_DIR)/lib/libgmp.a \
+		 $(TARGET_DIR)/lib/
+ifeq ($(BR2_PACKAGE_GMP_HEADERS),y)
+	cp -a $(STAGING_DIR)/include/gmp.h $(TARGET_DIR)/include/
+endif
+	$(STRIP) --strip-unneeded $(TARGET_DIR)/lib/libgmp.so* \
+		$(TARGET_DIR)/lib/libgmp.a
+
+gmp: uclibc $(TARGET_DIR)/lib/libgmp.so.$(GMP_LIBVERSION)
+
+gmp-clean:
+	rm -f $(TARGET_DIR)/lib/$(GMP_BINARY)
+	-$(MAKE) -C $(GMP_DIR) clean
+
+gmp-dirclean:
+	rm -rf $(GMP_DIR)
+
+#############################################################
+#
+# Toplevel Makefile options
+#
+#############################################################
+ifeq ($(strip $(BR2_PACKAGE_GMP)),y)
+TARGETS+=gmp
+endif

Added: trunk/buildroot/package/mpfr/Config.in
===================================================================
--- trunk/buildroot/package/mpfr/Config.in	2006-09-28 14:26:32 UTC (rev 16249)
+++ trunk/buildroot/package/mpfr/Config.in	2006-09-28 17:38:06 UTC (rev 16250)
@@ -0,0 +1,20 @@
+config BR2_PACKAGE_MPFR
+	bool "mpfr"
+	default n
+	default y if BR2_INSTALL_FORTRAN
+	select BR2_PACKAGE_GMP
+	help
+	  C library for multiple-precision floating-point computations
+	  with exact rounding.
+
+	  http://www.mpfr.org/
+
+
+config BR2_PACKAGE_MPFR_HEADERS
+	bool "mpfr headers for target"
+	default n
+	depends on BR2_PACKAGE_MPFR
+	select BR2_PACKAGE_GMP_HEADERS
+	help
+	  Install the mpfr headers for the target.
+

Added: trunk/buildroot/package/mpfr/mpfr.mk
===================================================================
--- trunk/buildroot/package/mpfr/mpfr.mk	2006-09-28 14:26:32 UTC (rev 16249)
+++ trunk/buildroot/package/mpfr/mpfr.mk	2006-09-28 17:38:06 UTC (rev 16250)
@@ -0,0 +1,107 @@
+#############################################################
+#
+# mpfr
+#
+#############################################################
+MPFR_VERSION:=2.2.0
+MPFR_PATCH:=patches
+MPFR_SOURCE:=mpfr-$(MPFR_VERSION).tar.bz2
+MPFR_SITE:=http://www.mpfr.org/mpfr-current/
+MPFR_CAT:=bzcat
+MPFR_DIR:=$(BUILD_DIR)/mpfr-$(MPFR_VERSION)
+MPFR_BINARY:=libmpfr.a
+MPFR_LIBVERSION:=1.0.0
+
+ifeq ($(BR2_ENDIAN),"BIG")
+MPFR_BE:=yes
+else
+MPFR_BE:=no
+endif
+
+$(DL_DIR)/$(MPFR_SOURCE):
+	 $(WGET) -P $(DL_DIR) $(MPFR_SITE)/$(MPFR_SOURCE)
+
+
+mpfr-source: $(DL_DIR)/$(MPFR_SOURCE)
+
+$(MPFR_DIR)/.unpacked: $(DL_DIR)/$(MPFR_SOURCE)
+	$(MPFR_CAT) $(DL_DIR)/$(MPFR_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
+	toolchain/patch-kernel.sh $(MPFR_DIR) package/mpfr/ \*.patch
+	$(CONFIG_UPDATE) $(MPFR_DIR)
+ifneq ($(MPFR_PATCH),)
+	$(WGET) -P $(MPFR_DIR) $(MPFR_SITE)/$(MPFR_PATCH)
+	( cd $(MPFR_DIR) ; patch -p1 < $(MPFR_PATCH) ; )
+endif
+	touch $(MPFR_DIR)/.unpacked
+
+$(MPFR_DIR)/.configured: $(MPFR_DIR)/.unpacked
+	(cd $(MPFR_DIR); rm -rf config.cache; \
+		$(TARGET_CONFIGURE_OPTS) \
+		ac_cv_c_bigendian=$(MPFR_BE) \
+		./configure \
+		--host=$(REAL_GNU_TARGET_NAME) \
+		--build=$(GNU_HOST_NAME) \
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
+		$(DISABLE_NLS) \
+	);
+	touch $(MPFR_DIR)/.configured
+
+$(MPFR_DIR)/.libs/$(MPFR_BINARY): $(MPFR_DIR)/.configured
+	$(MAKE) CC=$(TARGET_CC) -C $(MPFR_DIR)
+
+$(STAGING_DIR)/lib/$(MPFR_BINARY): $(MPFR_DIR)/.libs/$(MPFR_BINARY)
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
+	    -C $(MPFR_DIR) install;
+
+$(TARGET_DIR)/lib/libmpfr.so.$(MPFR_LIBVERSION): $(STAGING_DIR)/lib/$(MPFR_BINARY)
+	cp -a $(STAGING_DIR)/lib/libmpfr.so* $(STAGING_DIR)/lib/libmpfr.a \
+		$(TARGET_DIR)/lib/
+ifeq ($(BR2_PACKAGE_MPFR_HEADERS),y)
+	cp -a $(STAGING_DIR)/include/mpfr.h $(STAGING_DIR)/include/mpf2mpfr.h \
+		$(TARGET_DIR)/include/
+endif
+	$(STRIP) --strip-unneeded $(TARGET_DIR)/lib/libmpfr.so* \
+		$(TARGET_DIR)/lib/libmpfr.a
+
+mpfr: uclibc $(TARGET_DIR)/lib/libmpfr.so.$(MPFR_LIBVERSION)
+
+mpfr-clean:
+	rm -f $(TARGET_DIR)/lib/$(MPFR_BINARY)
+	-$(MAKE) -C $(MPFR_DIR) clean
+
+mpfr-dirclean:
+	rm -rf $(MPFR_DIR)
+
+#############################################################
+#
+# Toplevel Makefile options
+#
+#############################################################
+ifeq ($(strip $(BR2_PACKAGE_MPFR)),y)
+TARGETS+=mpfr
+endif
