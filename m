From: cmchao <cmchao@gmail.com>
Date: Wed, 16 Jun 2010 19:47:18 +0800
Subject: [Buildroot] [PATCH 16/19] gmp : convert to autotools infrastructure
	& bump to 5.0.1
In-Reply-To: <1276688841-5252-1-git-send-email-cmchao@gmail.com>
References: <1276688841-5252-1-git-send-email-cmchao@gmail.com>
Message-ID: <1276688841-5252-17-git-send-email-cmchao@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: cmchao <cmchao@gmail.com>
---
 package/gmp/gmp.mk |  111 ++++------------------------------------------------
 1 files changed, 8 insertions(+), 103 deletions(-)

diff --git a/package/gmp/gmp.mk b/package/gmp/gmp.mk
index a3488b8..b850ad1 100644
--- a/package/gmp/gmp.mk
+++ b/package/gmp/gmp.mk
@@ -3,108 +3,13 @@
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
+LIBGMP_VERSION:=5.0.1
+LIBGMP_SOURCE:=gmp-$(LIBGMP_VERSION).tar.bz2
+LIBGMP_SITE:=$(BR2_GNU_MIRROR)/gmp
 
-# this is a workaround for a bug in GMP, please see
-# http://gmplib.org/list-archives/gmp-devel/2006-April/000618.html
-ifeq ($(HOST_EXEEXT),.exe)
-GMP_CPP_FLAGS:=CPPFLAGS=-DDLL_EXPORT
-endif
+LIBGMP_LIBTOOL_PATCH = NO
+LIBGMP_INSTALL_STAGING = YES
+LIBGMP_INSTALL_TARGET = YES
 
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
+$(eval $(call AUTOTARGETS,package,libgmp))
+$(eval $(call AUTOTARGETS,package,libgmp,host))
-- 
1.7.0.4
