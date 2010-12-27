From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 27 Dec 2010 22:50:18 +0100
Subject: [Buildroot] [git commit master 1/1] mpc: make it a proper package
Message-ID: <20101227222052.004808EB81@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=7aa2e0c3d5b9f13fc1398e733090a3b4e6a95226
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

* Convert mpc to a proper autotargets package
* Hook it up for binutils/gcc to use

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/mpc/Config.in           |   15 +----
 package/mpc/mpc.mk              |  109 +++------------------------------------
 toolchain/binutils/binutils.mk  |   10 ++--
 toolchain/gcc/gcc-uclibc-4.x.mk |    6 +-
 4 files changed, 18 insertions(+), 122 deletions(-)

diff --git a/package/mpc/Config.in b/package/mpc/Config.in
index 61c9638..8377013 100644
--- a/package/mpc/Config.in
+++ b/package/mpc/Config.in
@@ -1,19 +1,10 @@
-config BR2_PACKAGE_LIBMPC
+config BR2_PACKAGE_MPC
 	bool "mpc"
-	select BR2_PACKAGE_LIBMPFR
-	select BR2_PACKAGE_LIBGMP
+	select BR2_PACKAGE_MPFR
+	select BR2_PACKAGE_GMP
 	help
 	  Mpc is a C library for the arithmetic of complex numbers with
 	  arbitrarily high precision and correct rounding of the result.
 	  It is built upon and follows the same principles as Mpfr.
 
 	  http://www.multiprecision.org/
-
-
-config BR2_PACKAGE_LIBMPC_HEADERS
-	bool "mpc headers for target"
-	depends on BR2_PACKAGE_LIBMPC
-	select BR2_PACKAGE_LIBMPFR_HEADERS
-	select BR2_PACKAGE_LIBGMP_HEADERS
-	help
-	  Install the mpc headers for the target.
diff --git a/package/mpc/mpc.mk b/package/mpc/mpc.mk
index 41c0ffa..8c6d486 100644
--- a/package/mpc/mpc.mk
+++ b/package/mpc/mpc.mk
@@ -3,107 +3,12 @@
 # mpc
 #
 #############################################################
-MPC_VERSION:=0.8.2
-MPC_SOURCE:=mpc-$(MPC_VERSION).tar.gz
-MPC_SITE:=http://www.multiprecision.org/mpc/download
-MPC_CAT:=$(ZCAT)
-MPC_DIR:=$(TOOLCHAIN_DIR)/mpc-$(MPC_VERSION)
-MPC_TARGET_DIR:=$(BUILD_DIR)/mpc-$(MPC_VERSION)
-MPC_BINARY:=libmpc$(LIBTGTEXT)
-MPC_HOST_BINARY:=libmpc$(HOST_LIBEXT)
-MPC_LIBVERSION:=2.0.0
 
-$(DL_DIR)/$(MPC_SOURCE):
-	 $(call DOWNLOAD,$(MPC_SITE),$(MPC_SOURCE))
+MPC_VERSION = 0.8.2
+MPC_SITE = http://www.multiprecision.org/mpc/download
+MPC_INSTALL_STAGING = YES
+MPC_DEPENDENCIES = gmp mpfr
+HOST_MPC_DEPENDENCIES = host-gmp host-mpfr
 
-libmpc-source: $(DL_DIR)/$(MPC_SOURCE)
-
-$(MPC_DIR)/.unpacked: $(DL_DIR)/$(MPC_SOURCE)
-	$(MPC_CAT) $(DL_DIR)/$(MPC_SOURCE) | tar -C $(TOOLCHAIN_DIR) $(TAR_OPTIONS) -
-	toolchain/patch-kernel.sh $(MPC_DIR) package/mpc/ \*.patch
-	$(CONFIG_UPDATE) $(@D)
-	touch $@
-
-$(MPC_TARGET_DIR)/.configured: $(MPC_DIR)/.unpacked
-	mkdir -p $(MPC_TARGET_DIR)
-	(cd $(MPC_TARGET_DIR); rm -rf config.cache; \
-		$(TARGET_CONFIGURE_OPTS) \
-		$(TARGET_CONFIGURE_ARGS) \
-		$(MPC_DIR)/configure $(QUIET) \
-		--target=$(GNU_TARGET_NAME) \
-		--host=$(GNU_TARGET_NAME) \
-		--build=$(GNU_HOST_NAME) \
-		--prefix=/usr \
-		$(PREFERRED_LIB_FLAGS) \
-		--with-mpfr-lib=$(TARGET_DIR)/usr/lib/ \
-		--with-gmp-lib=$(TARGET_DIR)/usr/lib/ \
-		--with-mpfr-include=$(STAGING_DIR)/usr/include/ \
-		--with-gmp-include=$(STAGING_DIR)/usr/include/ \
-		$(DISABLE_NLS) \
-	)
-	touch $@
-
-$(MPC_TARGET_DIR)/src/.libs/$(MPC_BINARY): $(MPC_TARGET_DIR)/.configured
-	#$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(MPC_TARGET_DIR)
-	$(MAKE) -C $(MPC_TARGET_DIR)
-
-$(STAGING_DIR)/usr/lib/$(MPC_BINARY): $(MPC_TARGET_DIR)/src/.libs/$(MPC_BINARY)
-	$(MAKE) DESTDIR=$(STAGING_DIR) -C $(MPC_TARGET_DIR) install
-	$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(STAGING_DIR)/usr/lib/libmpc$(LIBTGTEXT)*
-
-$(TARGET_DIR)/usr/lib/libmpc.so $(TARGET_DIR)/usr/lib/libmpc.so.$(MPC_LIBVERSION): $(STAGING_DIR)/usr/lib/$(MPC_BINARY)
-	cp -dpf $(STAGING_DIR)/usr/lib/libmpc$(LIBTGTEXT)* $(TARGET_DIR)/usr/lib/
-ifeq ($(BR2_PACKAGE_LIBMPC_HEADERS),y)
-	test -d $(TARGET_DIR)/usr/include || mkdir -p $(TARGET_DIR)/usr/include
-	cp -dpf $(STAGING_DIR)/usr/include/mpc.h $(TARGET_DIR)/usr/include/
-endif
-
-libmpc: libgmp libmpfr $(TARGET_DIR)/usr/lib/libmpc$(LIBTGTEXT)
-stage-libmpc: $(STAGING_DIR)/usr/lib/$(MPC_BINARY)
-
-libmpc-clean:
-	rm -f $(TARGET_DIR)/usr/lib/libmpc.* $(TARGET_DIR)/usr/include/mpc.h \
-		$(STAGING_DIR)/usr/lib/libmpc* $(STAGING_DIR)/usr/include/mpc.h
-	-$(MAKE) -C $(MPC_TARGET_DIR) clean
-
-libmpc-dirclean:
-	rm -rf $(MPC_TARGET_DIR) $(MPC_DIR)
-
-MPC_DIR2:=$(TOOLCHAIN_DIR)/mpc-$(MPC_VERSION)-host
-MPC_HOST_DIR:=$(TOOLCHAIN_DIR)/mpc
-$(MPC_DIR2)/.configured: $(MPC_DIR)/.unpacked
-	mkdir -p $(MPC_DIR2)
-	(cd $(MPC_DIR2); rm -rf config.cache; \
-		$(HOST_CONFIGURE_OPTS) \
-		$(MPC_CPP_FLAGS) \
-		$(MPC_DIR)/configure $(QUIET) \
-		--prefix="$(MPC_HOST_DIR)" \
-		--build=$(GNU_HOST_NAME) \
-		--host=$(GNU_HOST_NAME) \
-		--disable-shared \
-		--enable-static \
-		--with-mpfr=$(MPFR_HOST_DIR) \
-		--with-gmp=$(GMP_HOST_DIR) \
-		$(DISABLE_NLS) \
-	)
-	touch $@
-
-$(MPC_HOST_DIR)/lib/libmpc$(HOST_LIBEXT): $(MPC_DIR2)/.configured
-	$(MAKE) -C $(MPC_DIR2) install
-
-host-libmpc: $(MPC_HOST_DIR)/lib/$(MPC_HOST_BINARY)
-host-libmpc-source: libmpc-source
-host-libmpc-clean:
-	rm -rf $(MPC_HOST_DIR)
-	-$(MAKE) -C $(MPC_DIR2) clean
-host-libmpc-dirclean:
-	rm -rf $(MPC_HOST_DIR) $(MPC_DIR2)
-
-#############################################################
-#
-# Toplevel Makefile options
-#
-#############################################################
-ifeq ($(BR2_PACKAGE_LIBMPC),y)
-TARGETS+=libmpc
-endif
+$(eval $(call AUTOTARGETS,package,mpc))
+$(eval $(call AUTOTARGETS,package,mpc,host))
diff --git a/toolchain/binutils/binutils.mk b/toolchain/binutils/binutils.mk
index c332590..8ab383b 100644
--- a/toolchain/binutils/binutils.mk
+++ b/toolchain/binutils/binutils.mk
@@ -36,11 +36,11 @@ BINUTILS_ADD_MPC = y
 endif
 
 ifeq ($(BINUTILS_ADD_MPC),y)
-BINUTILS_HOST_PREREQ += $(TOOLCHAIN_DIR)/mpc/lib/libmpc$(HOST_LIBEXT)
-HOST_SOURCE += host-libmpc-source
-BINUTILS_TARGET_PREREQ += $(TARGET_DIR)/usr/lib/libmpc$(LIBTGTEXT)
-EXTRA_BINUTILS_CONFIG_OPTIONS += --with-mpc="$(MPC_HOST_DIR)"
-BINUTILS_TARGET_CONFIG_OPTIONS += --with-mpc="$(MPC_TARGET_DIR)"
+BINUTILS_HOST_PREREQ += host-mpc
+HOST_SOURCE += host-mpc-source
+BINUTILS_TARGET_PREREQ += mpc
+EXTRA_BINUTILS_CONFIG_OPTIONS += --with-mpc=$(HOST_DIR)/usr
+BINUTILS_TARGET_CONFIG_OPTIONS += --with-mpc=$(STAGING_DIR)/usr
 endif
 
 BINUTILS_PATCH_DIR:=toolchain/binutils/$(BINUTILS_VERSION)
diff --git a/toolchain/gcc/gcc-uclibc-4.x.mk b/toolchain/gcc/gcc-uclibc-4.x.mk
index f454be8..9e7127d 100644
--- a/toolchain/gcc/gcc-uclibc-4.x.mk
+++ b/toolchain/gcc/gcc-uclibc-4.x.mk
@@ -111,8 +111,8 @@ GCC_WITH_HOST_MPFR = --with-mpfr=$(HOST_DIR)/usr
 HOST_SOURCE += host-gmp-source host-mpfr-source
 
 ifeq ($(findstring x4.5.,x$(GCC_VERSION)),x4.5.)
-GCC_WITH_HOST_MPC=--with-mpc=$(MPC_HOST_DIR)
-HOST_SOURCE += host-libmpc-source
+GCC_WITH_HOST_MPC = --with-mpc=$(HOST_DIR)/usr
+HOST_SOURCE += host-mpc-source
 endif
 
 ifeq ($(BR2_INSTALL_FORTRAN),y)
@@ -122,7 +122,7 @@ GCC_TARGET_LANGUAGES:=$(GCC_TARGET_LANGUAGES),fortran
 GCC_WITH_TARGET_GMP = --with-gmp=$(STAGING_DIR)/usr
 GCC_WITH_TARGET_MPFR = --with-mpfr=$(STAGING_DIR)/usr
 ifeq ($(findstring x4.5.,x$(GCC_VERSION)),x4.5.)
-GCC_WITH_TARGET_MPC=--with-mpc="$(MPC_TARGET_DIR)"
+GCC_WITH_TARGET_MPC = --with-mpc=$(STAGING_DIR)/usr
 endif
 endif
 
-- 
1.7.2.2
