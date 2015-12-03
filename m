From: gustavo.zacarias at free-electrons.com <gustavo.zacarias@free-electrons.com>
Date: Thu,  3 Dec 2015 14:45:57 -0300
Subject: [Buildroot] [PATCH] openssl: security bump to version 1.0.2e
Message-ID: <1449164757-20614-1-git-send-email-gustavo.zacarias@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>

Fixes:
CVE-2015-3193 - BN_mod_exp may produce incorrect results on x86_64
CVE-2015-3194 - Certificate verify crash with missing PSS parameter
CVE-2015-3195 - X509_ATTRIBUTE memory leak

Enable IDEA as well since otherwise the build breaks (always great
upstream) - it's no longer patent encumbered.

Signed-off-by: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
---
 package/openssl/openssl.hash |   4 +-
 package/openssl/openssl.mk   | 168 +------------------------------------------
 2 files changed, 4 insertions(+), 168 deletions(-)

diff --git a/package/openssl/openssl.hash b/package/openssl/openssl.hash
index 355be79..bed1c1c 100644
--- a/package/openssl/openssl.hash
+++ b/package/openssl/openssl.hash
@@ -1,2 +1,2 @@
-# From https://www.openssl.org/source/openssl-1.0.2d.tar.gz.sha256
-sha256	671c36487785628a703374c652ad2cebea45fa920ae5681515df25d9f2c9a8c8	openssl-1.0.2d.tar.gz
+# From https://www.openssl.org/source/openssl-1.0.2e.tar.gz.sha256
+sha256	eee11def03647aa2267434a779608af6fca645023c9a194ddb82f14426835537	openssl-1.0.2e.tar.gz
diff --git a/package/openssl/openssl.mk b/package/openssl/openssl.mk
index da492ff..bed1c1c 100644
--- a/package/openssl/openssl.mk
+++ b/package/openssl/openssl.mk
@@ -1,166 +1,2 @@
-################################################################################
-#
-# openssl
-#
-################################################################################
-
-OPENSSL_VERSION = 1.0.2d
-OPENSSL_SITE = http://www.openssl.org/source
-OPENSSL_LICENSE = OpenSSL or SSLeay
-OPENSSL_LICENSE_FILES = LICENSE
-OPENSSL_INSTALL_STAGING = YES
-OPENSSL_DEPENDENCIES = zlib
-HOST_OPENSSL_DEPENDENCIES = host-zlib
-OPENSSL_TARGET_ARCH = generic32
-OPENSSL_CFLAGS = $(TARGET_CFLAGS)
-
-ifeq ($(BR2_USE_MMU),)
-OPENSSL_CFLAGS += -DHAVE_FORK=0
-endif
-
-ifeq ($(BR2_PACKAGE_CRYPTODEV_LINUX),y)
-OPENSSL_CFLAGS += -DHAVE_CRYPTODEV -DUSE_CRYPTODEV_DIGESTS
-OPENSSL_DEPENDENCIES += cryptodev-linux
-endif
-
-ifeq ($(BR2_PACKAGE_OCF_LINUX),y)
-OPENSSL_CFLAGS += -DHAVE_CRYPTODEV -DUSE_CRYPTODEV_DIGESTS
-OPENSSL_DEPENDENCIES += ocf-linux
-endif
-
-# Some architectures are optimized in OpenSSL
-ifeq ($(ARCH),arm)
-OPENSSL_TARGET_ARCH = armv4
-endif
-ifeq ($(ARCH),powerpc)
-# 4xx cores seem to have trouble with openssl's ASM optimizations
-ifeq ($(BR2_powerpc_401)$(BR2_powerpc_403)$(BR2_powerpc_405)$(BR2_powerpc_405fp)$(BR2_powerpc_440)$(BR2_powerpc_440fp),)
-OPENSSL_TARGET_ARCH = ppc
-endif
-endif
-ifeq ($(ARCH),powerpc64)
-OPENSSL_TARGET_ARCH = ppc64
-endif
-ifeq ($(ARCH),powerpc64le)
-OPENSSL_TARGET_ARCH = ppc64le
-endif
-ifeq ($(ARCH),x86_64)
-OPENSSL_TARGET_ARCH = x86_64
-endif
-
-# Workaround for bug #3445
-ifeq ($(BR2_x86_i386),y)
-OPENSSL_TARGET_ARCH = generic32 386
-endif
-
-define HOST_OPENSSL_CONFIGURE_CMDS
-	(cd $(@D); \
-		$(HOST_CONFIGURE_OPTS) \
-		./config \
-		--prefix=$(HOST_DIR)/usr \
-		--openssldir=$(HOST_DIR)/etc/ssl \
-		--libdir=/lib \
-		shared \
-		zlib-dynamic \
-	)
-	$(SED) "s#-O[0-9]#$(HOST_CFLAGS)#" $(@D)/Makefile
-endef
-
-define OPENSSL_CONFIGURE_CMDS
-	(cd $(@D); \
-		$(TARGET_CONFIGURE_ARGS) \
-		$(TARGET_CONFIGURE_OPTS) \
-		./Configure \
-			linux-$(OPENSSL_TARGET_ARCH) \
-			--prefix=/usr \
-			--openssldir=/etc/ssl \
-			--libdir=/lib \
-			$(if $(BR2_TOOLCHAIN_HAS_THREADS),threads,no-threads) \
-			$(if $(BR2_STATIC_LIBS),no-shared,shared) \
-			no-idea \
-			no-rc5 \
-			enable-camellia \
-			enable-mdc2 \
-			enable-tlsext \
-			$(if $(BR2_STATIC_LIBS),zlib,zlib-dynamic) \
-			$(if $(BR2_STATIC_LIBS),no-dso) \
-	)
-	$(SED) "s#-march=[-a-z0-9] ##" -e "s#-mcpu=[-a-z0-9] ##g" $(@D)/Makefile
-	$(SED) "s#-O[0-9]#$(OPENSSL_CFLAGS)#" $(@D)/Makefile
-	$(SED) "s# build_tests##" $(@D)/Makefile
-endef
-
-# libdl is not available in a static build, and this is not implied by no-dso
-ifeq ($(BR2_STATIC_LIBS),y)
-define OPENSSL_FIXUP_STATIC_MAKEFILE
-	$(SED) 's#-ldl##g' $(@D)/Makefile
-endef
-OPENSSL_POST_CONFIGURE_HOOKS += OPENSSL_FIXUP_STATIC_MAKEFILE
-endif
-
-define HOST_OPENSSL_BUILD_CMDS
-	$(MAKE1) -C $(@D)
-endef
-
-define OPENSSL_BUILD_CMDS
-	$(MAKE1) -C $(@D)
-endef
-
-define OPENSSL_INSTALL_STAGING_CMDS
-	$(MAKE1) -C $(@D) INSTALL_PREFIX=$(STAGING_DIR) install
-endef
-
-define HOST_OPENSSL_INSTALL_CMDS
-	$(MAKE1) -C $(@D) install
-endef
-
-define OPENSSL_INSTALL_TARGET_CMDS
-	$(MAKE1) -C $(@D) INSTALL_PREFIX=$(TARGET_DIR) install
-	rm -rf $(TARGET_DIR)/usr/lib/ssl
-	rm -f $(TARGET_DIR)/usr/bin/c_rehash
-endef
-
-# libdl has no business in a static build
-ifeq ($(BR2_STATIC_LIBS),y)
-define OPENSSL_FIXUP_STATIC_PKGCONFIG
-	$(SED) 's#-ldl##' $(STAGING_DIR)/usr/lib/pkgconfig/libcrypto.pc
-	$(SED) 's#-ldl##' $(STAGING_DIR)/usr/lib/pkgconfig/libssl.pc
-	$(SED) 's#-ldl##' $(STAGING_DIR)/usr/lib/pkgconfig/openssl.pc
-endef
-OPENSSL_POST_INSTALL_STAGING_HOOKS += OPENSSL_FIXUP_STATIC_PKGCONFIG
-endif
-
-ifneq ($(BR2_STATIC_LIBS),y)
-# libraries gets installed read only, so strip fails
-define OPENSSL_INSTALL_FIXUPS_SHARED
-	chmod +w $(TARGET_DIR)/usr/lib/engines/lib*.so
-	for i in $(addprefix $(TARGET_DIR)/usr/lib/,libcrypto.so.* libssl.so.*); \
-	do chmod +w $$i; done
-endef
-OPENSSL_POST_INSTALL_TARGET_HOOKS += OPENSSL_INSTALL_FIXUPS_SHARED
-endif
-
-ifeq ($(BR2_PACKAGE_PERL),)
-define OPENSSL_REMOVE_PERL_SCRIPTS
-	$(RM) -f $(TARGET_DIR)/etc/ssl/misc/{CA.pl,tsget}
-endef
-OPENSSL_POST_INSTALL_TARGET_HOOKS += OPENSSL_REMOVE_PERL_SCRIPTS
-endif
-
-ifeq ($(BR2_PACKAGE_OPENSSL_BIN),)
-define OPENSSL_REMOVE_BIN
-	$(RM) -f $(TARGET_DIR)/usr/bin/openssl
-	$(RM) -f $(TARGET_DIR)/etc/ssl/misc/{CA.*,c_*}
-endef
-OPENSSL_POST_INSTALL_TARGET_HOOKS += OPENSSL_REMOVE_BIN
-endif
-
-ifneq ($(BR2_PACKAGE_OPENSSL_ENGINES),y)
-define OPENSSL_REMOVE_OPENSSL_ENGINES
-	rm -rf $(TARGET_DIR)/usr/lib/engines
-endef
-OPENSSL_POST_INSTALL_TARGET_HOOKS += OPENSSL_REMOVE_OPENSSL_ENGINES
-endif
-
-$(eval $(generic-package))
-$(eval $(host-generic-package))
+# From https://www.openssl.org/source/openssl-1.0.2e.tar.gz.sha256
+sha256	eee11def03647aa2267434a779608af6fca645023c9a194ddb82f14426835537	openssl-1.0.2e.tar.gz
-- 
2.4.10
