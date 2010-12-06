From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon,  6 Dec 2010 16:40:07 -0300
Subject: [Buildroot] [PATCH 1/5] gmp: make it a proper package and bump to
	version 5.0.1
In-Reply-To: <1291664411-27836-1-git-send-email-gustavo@zacarias.com.ar>
References: <1291664411-27836-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1291664411-27836-2-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

* Convert gmp to a proper autotargets package
* Bump to version 5.0.1
* Hook it up for binutils/gcc to use

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/gmp/Config.in           |   12 +----
 package/gmp/gmp.mk              |  109 ++------------------------------------
 toolchain/binutils/binutils.mk  |   12 ++---
 toolchain/gcc/gcc-uclibc-4.x.mk |    6 +-
 4 files changed, 16 insertions(+), 123 deletions(-)

diff --git a/package/gmp/Config.in b/package/gmp/Config.in
index 74596f8..226e088 100644
--- a/package/gmp/Config.in
+++ b/package/gmp/Config.in
@@ -1,14 +1,6 @@
-config BR2_PACKAGE_LIBGMP
+config BR2_PACKAGE_GMP
 	bool "gmp"
 	help
 	  GNU Multiple Precision Arithmetic Library.
 
-	  http://www.swox.com/gmp/
-
-
-config BR2_PACKAGE_LIBGMP_HEADERS
-	bool "gmp headers for target"
-	depends on BR2_PACKAGE_LIBGMP
-	help
-	  Install the gmp.h for the target.
-
+	  http://gmplib.org/
diff --git a/package/gmp/gmp.mk b/package/gmp/gmp.mk
index a3488b8..cdddca1 100644
--- a/package/gmp/gmp.mk
+++ b/package/gmp/gmp.mk
@@ -3,108 +3,11 @@
 # gmp
 #
 #############################################################
-GMP_VERSION:=4.2.4
-GMP_SOURCE:=gmp-$(GMP_VERSION).tar.bz2
-GMP_SITE:=$(BR2_GNU_MIRROR)/gmp
-GMP_CAT:=$(BZCAT)
-GMP_DIR:=$(TOOLCHAIN_DIR)/gmp-$(GMP_VERSION)
-GMP_TARGET_DIR:=$(BUILD_DIR)/gmp-$(GMP_VERSION)
-GMP_BINARY:=libgmp$(LIBTGTEXT)
-GMP_HOST_BINARY:=libgmp$(HOST_LIBEXT)
-GMP_LIBVERSION:=3.4.4
 
-# this is a workaround for a bug in GMP, please see
-# http://gmplib.org/list-archives/gmp-devel/2006-April/000618.html
-ifeq ($(HOST_EXEEXT),.exe)
-GMP_CPP_FLAGS:=CPPFLAGS=-DDLL_EXPORT
-endif
+GMP_VERSION = 5.0.1
+GMP_SITE = $(BR2_GNU_MIRROR)/gmp
+GMP_SOURCE = gmp-$(GMP_VERSION).tar.bz2
+GMP_INSTALL_STAGING = YES
 
-$(DL_DIR)/$(GMP_SOURCE):
-	 $(call DOWNLOAD,$(GMP_SITE),$(GMP_SOURCE))
-
-libgmp-source: $(DL_DIR)/$(GMP_SOURCE)
-
-$(GMP_DIR)/.unpacked: $(DL_DIR)/$(GMP_SOURCE)
-	$(GMP_CAT) $(DL_DIR)/$(GMP_SOURCE) | tar -C $(TOOLCHAIN_DIR) $(TAR_OPTIONS) -
-	toolchain/patch-kernel.sh $(GMP_DIR) package/gmp/ \*.patch
-	$(CONFIG_UPDATE) $(@D)
-	touch $@
-
-$(GMP_TARGET_DIR)/.configured: $(GMP_DIR)/.unpacked
-	mkdir -p $(GMP_TARGET_DIR)
-	(cd $(GMP_TARGET_DIR); rm -rf config.cache; \
-		$(TARGET_CONFIGURE_OPTS) \
-		$(TARGET_CONFIGURE_ARGS) \
-		$(GMP_CPP_FLAGS) \
-		$(GMP_DIR)/configure $(QUIET) \
-		--target=$(GNU_TARGET_NAME) \
-		--host=$(GNU_TARGET_NAME) \
-		--build=$(GNU_HOST_NAME) \
-		--prefix=/usr \
-		$(PREFERRED_LIB_FLAGS) \
-		$(DISABLE_NLS) \
-	)
-	touch $@
-
-$(GMP_TARGET_DIR)/.libs/$(GMP_BINARY): $(GMP_TARGET_DIR)/.configured
-	#$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(GMP_TARGET_DIR)
-	$(MAKE) -C $(GMP_TARGET_DIR)
-
-$(STAGING_DIR)/usr/lib/$(GMP_BINARY): $(GMP_TARGET_DIR)/.libs/$(GMP_BINARY)
-	$(MAKE) DESTDIR=$(STAGING_DIR) -C $(GMP_TARGET_DIR) install
-	$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(STAGING_DIR)/usr/lib/libgmp$(LIBTGTEXT)*
-
-$(TARGET_DIR)/usr/lib/libgmp.so $(TARGET_DIR)/usr/lib/libgmp.so.$(GMP_LIBVERSION) $(TARGET_DIR)/usr/lib/libgmp.a: $(STAGING_DIR)/usr/lib/$(GMP_BINARY)
-	cp -dpf $(STAGING_DIR)/usr/lib/libgmp$(LIBTGTEXT)* $(TARGET_DIR)/usr/lib/
-ifeq ($(BR2_PACKAGE_LIBGMP_HEADERS),y)
-	test -d $(TARGET_DIR)/usr/include || mkdir -p $(TARGET_DIR)/usr/include
-	cp -dpf $(STAGING_DIR)/usr/include/gmp.h $(TARGET_DIR)/usr/include/
-endif
-
-libgmp: $(TARGET_DIR)/usr/lib/libgmp$(LIBTGTEXT)
-stage-libgmp: $(STAGING_DIR)/usr/lib/$(GMP_BINARY)
-
-libgmp-clean:
-	rm -f $(TARGET_DIR)/usr/lib/libgmp.* $(TARGET_DIR)/usr/include/gmp.h \
-		$(STAGING_DIR)/usr/lib/libgmp* $(STAGING_DIR)/usr/include/gmp.h
-	-$(MAKE) -C $(GMP_TARGET_DIR) clean
-
-libgmp-dirclean:
-	rm -rf $(GMP_TARGET_DIR) $(GMP_DIR)
-
-GMP_DIR2:=$(TOOLCHAIN_DIR)/gmp-$(GMP_VERSION)-host
-GMP_HOST_DIR:=$(TOOLCHAIN_DIR)/gmp
-$(GMP_DIR2)/.configured: $(GMP_DIR)/.unpacked
-	mkdir -p $(GMP_DIR2)
-	(cd $(GMP_DIR2); rm -rf config.cache; \
-		$(HOST_CONFIGURE_OPTS) \
-		$(GMP_CPP_FLAGS) \
-		$(GMP_DIR)/configure $(QUIET) \
-		--prefix="$(GMP_HOST_DIR)" \
-		--build=$(GNU_HOST_NAME) \
-		--host=$(GNU_HOST_NAME) \
-		--disable-shared \
-		--enable-static \
-		$(DISABLE_NLS) \
-	)
-	touch $@
-
-$(GMP_HOST_DIR)/lib/libgmp$(HOST_LIBEXT): $(GMP_DIR2)/.configured
-	$(MAKE) -C $(GMP_DIR2) install
-
-host-libgmp: $(GMP_HOST_DIR)/lib/$(GMP_HOST_BINARY)
-host-libgmp-source: libgmp-source
-host-libgmp-clean:
-	rm -rf $(GMP_HOST_DIR)
-	-$(MAKE) -C $(GMP_DIR2) clean
-host-libgmp-dirclean:
-	rm -rf $(GMP_HOST_DIR) $(GMP_DIR2)
-
-#############################################################
-#
-# Toplevel Makefile options
-#
-#############################################################
-ifeq ($(BR2_PACKAGE_LIBGMP),y)
-TARGETS+=libgmp
-endif
+$(eval $(call AUTOTARGETS,package,gmp))
+$(eval $(call AUTOTARGETS,package,gmp,host))
diff --git a/toolchain/binutils/binutils.mk b/toolchain/binutils/binutils.mk
index ef9f644..327a0f6 100644
--- a/toolchain/binutils/binutils.mk
+++ b/toolchain/binutils/binutils.mk
@@ -16,17 +16,15 @@ endif
 BINUTILS_HOST_PREREQ:=
 BINUTILS_TARGET_PREREQ:=
 
-BINUTILS_HOST_PREREQ:=$(TOOLCHAIN_DIR)/gmp/lib/libgmp$(HOST_LIBEXT) \
-	$(TOOLCHAIN_DIR)/mpfr/lib/libmpfr$(HOST_LIBEXT)
-HOST_SOURCE += host-libgmp-source host-libmpfr-source
+BINUTILS_HOST_PREREQ:=host-gmp $(TOOLCHAIN_DIR)/mpfr/lib/libmpfr$(HOST_LIBEXT)
+HOST_SOURCE += host-gmp-source host-libmpfr-source
 
-BINUTILS_TARGET_PREREQ:=$(TARGET_DIR)/usr/lib/libgmp$(LIBTGTEXT) \
-	$(TARGET_DIR)/usr/lib/libmpfr$(LIBTGTEXT)
+BINUTILS_TARGET_PREREQ:=gmp $(TARGET_DIR)/usr/lib/libmpfr$(LIBTGTEXT)
 
-EXTRA_BINUTILS_CONFIG_OPTIONS+=--with-gmp="$(GMP_HOST_DIR)"
+EXTRA_BINUTILS_CONFIG_OPTIONS+=--with-gmp=$(HOST_DIR)/usr
 EXTRA_BINUTILS_CONFIG_OPTIONS+=--with-mpfr="$(MPFR_HOST_DIR)"
 
-BINUTILS_TARGET_CONFIG_OPTIONS=--with-gmp="$(GMP_TARGET_DIR)"
+BINUTILS_TARGET_CONFIG_OPTIONS=--with-gmp=$(STAGING_DIR)/usr
 BINUTILS_TARGET_CONFIG_OPTIONS+=--with-mpfr="$(MPFR_TARGET_DIR)"
 
 ifeq ($(BR2_PACKAGE_LIBMPC),y)
diff --git a/toolchain/gcc/gcc-uclibc-4.x.mk b/toolchain/gcc/gcc-uclibc-4.x.mk
index af085f7..cbcaadb 100644
--- a/toolchain/gcc/gcc-uclibc-4.x.mk
+++ b/toolchain/gcc/gcc-uclibc-4.x.mk
@@ -106,9 +106,9 @@ ifeq ($(BR2_INSTALL_OBJC),y)
 GCC_TARGET_LANGUAGES:=$(GCC_TARGET_LANGUAGES),objc
 endif
 
-GCC_WITH_HOST_GMP=--with-gmp=$(GMP_HOST_DIR)
+GCC_WITH_HOST_GMP = --with-gmp=$(HOST_DIR)/usr
 GCC_WITH_HOST_MPFR=--with-mpfr=$(MPFR_HOST_DIR)
-HOST_SOURCE += host-libgmp-source host-libmpfr-source
+HOST_SOURCE += host-gmp-source host-libmpfr-source
 
 ifeq ($(findstring x4.5.,x$(GCC_VERSION)),x4.5.)
 GCC_WITH_HOST_MPC=--with-mpc=$(MPC_HOST_DIR)
@@ -119,7 +119,7 @@ ifeq ($(BR2_INSTALL_FORTRAN),y)
 GCC_TARGET_LANGUAGES:=$(GCC_TARGET_LANGUAGES),fortran
 #GCC_TARGET_PREREQ+=$(TARGET_DIR)/usr/lib/libmpfr.so $(TARGET_DIR)/usr/lib/libgmp.so
 #GCC_STAGING_PREREQ+=$(TOOLCHAIN_DIR)/mpfr/lib/libmpfr.so
-GCC_WITH_TARGET_GMP=--with-gmp="$(GMP_TARGET_DIR)"
+GCC_WITH_TARGET_GMP = --with-gmp=$(STAGING_DIR)/usr
 GCC_WITH_TARGET_MPFR=--with-mpfr="$(MPFR_TARGET_DIR)"
 ifeq ($(findstring x4.5.,x$(GCC_VERSION)),x4.5.)
 GCC_WITH_TARGET_MPC=--with-mpc="$(MPC_TARGET_DIR)"
-- 
1.7.2.2
