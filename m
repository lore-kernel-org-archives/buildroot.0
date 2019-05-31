From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Fri, 31 May 2019 15:39:28 +0200
Subject: [Buildroot] [PATCH 1/1] package/libopenssl: fix static build
Message-ID: <20190531133928.19568-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

no-dso option has been removed with
https://github.com/openssl/openssl/commit/31b6ed76dfd53529b74e79830c81372d0b756929

To fix this error, use "gcc" target in static builds. This target is
very minimalistic, we need to manually pass -lpthread and
-DOPENSSL_THREADS however we can also remove libdl workarounds

Fixes:
 - http://autobuild.buildroot.org/results/96d6b89d20980e8f7fa450b832474a81d492b315

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libopenssl/libopenssl.mk | 46 +++++++++++++-------------------
 1 file changed, 18 insertions(+), 28 deletions(-)

diff --git a/package/libopenssl/libopenssl.mk b/package/libopenssl/libopenssl.mk
index 064b71bb2e..2a7514d590 100644
--- a/package/libopenssl/libopenssl.mk
+++ b/package/libopenssl/libopenssl.mk
@@ -12,7 +12,7 @@ LIBOPENSSL_LICENSE_FILES = LICENSE
 LIBOPENSSL_INSTALL_STAGING = YES
 LIBOPENSSL_DEPENDENCIES = zlib
 HOST_LIBOPENSSL_DEPENDENCIES = host-zlib
-LIBOPENSSL_TARGET_ARCH = generic32
+LIBOPENSSL_TARGET_ARCH = linux-generic32
 LIBOPENSSL_CFLAGS = $(TARGET_CFLAGS)
 LIBOPENSSL_PROVIDES = openssl
 
@@ -23,6 +23,10 @@ LIBOPENSSL_CFLAGS += -mxgot
 LIBOPENSSL_CFLAGS += -DOPENSSL_SMALL_FOOTPRINT
 endif
 
+ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
+LIBOPENSSL_CFLAGS += -DOPENSSL_THREADS
+endif
+
 ifeq ($(BR2_USE_MMU),)
 LIBOPENSSL_CFLAGS += -DHAVE_FORK=0 -DOPENSSL_NO_MADVISE
 endif
@@ -49,28 +53,33 @@ ifeq ($(BR2_TOOLCHAIN_HAS_UCONTEXT),)
 LIBOPENSSL_CFLAGS += -DOPENSSL_NO_ASYNC
 endif
 
+ifeq ($(BR2_STATIC_LIBS),y)
+# Use "gcc" minimalistic target to disable DSO
+LIBOPENSSL_TARGET_ARCH = gcc
+else
 # Some architectures are optimized in OpenSSL
 # Doesn't work for thumb-only (Cortex-M?)
 ifeq ($(BR2_ARM_CPU_HAS_ARM),y)
-LIBOPENSSL_TARGET_ARCH = armv4
+LIBOPENSSL_TARGET_ARCH = linux-armv4
 endif
 ifeq ($(ARCH),aarch64)
-LIBOPENSSL_TARGET_ARCH = aarch64
+LIBOPENSSL_TARGET_ARCH = linux-aarch64
 endif
 ifeq ($(ARCH),powerpc)
 # 4xx cores seem to have trouble with openssl's ASM optimizations
 ifeq ($(BR2_powerpc_401)$(BR2_powerpc_403)$(BR2_powerpc_405)$(BR2_powerpc_405fp)$(BR2_powerpc_440)$(BR2_powerpc_440fp),)
-LIBOPENSSL_TARGET_ARCH = ppc
+LIBOPENSSL_TARGET_ARCH = linux-ppc
 endif
 endif
 ifeq ($(ARCH),powerpc64)
-LIBOPENSSL_TARGET_ARCH = ppc64
+LIBOPENSSL_TARGET_ARCH = linux-ppc64
 endif
 ifeq ($(ARCH),powerpc64le)
-LIBOPENSSL_TARGET_ARCH = ppc64le
+LIBOPENSSL_TARGET_ARCH = linux-ppc64le
 endif
 ifeq ($(ARCH),x86_64)
-LIBOPENSSL_TARGET_ARCH = x86_64
+LIBOPENSSL_TARGET_ARCH = linux-x86_64
+endif
 endif
 
 define HOST_LIBOPENSSL_CONFIGURE_CMDS
@@ -93,11 +102,11 @@ define LIBOPENSSL_CONFIGURE_CMDS
 		$(TARGET_CONFIGURE_ARGS) \
 		$(TARGET_CONFIGURE_OPTS) \
 		./Configure \
-			linux-$(LIBOPENSSL_TARGET_ARCH) \
+			$(LIBOPENSSL_TARGET_ARCH) \
 			--prefix=/usr \
 			--openssldir=/etc/ssl \
 			$(if $(BR2_TOOLCHAIN_HAS_LIBATOMIC),-latomic) \
-			$(if $(BR2_TOOLCHAIN_HAS_THREADS),threads,no-threads) \
+			$(if $(BR2_TOOLCHAIN_HAS_THREADS),-lpthread threads, no-threads) \
 			$(if $(BR2_STATIC_LIBS),no-shared,shared) \
 			$(if $(BR2_PACKAGE_HAS_CRYPTODEV),enable-devcryptoeng) \
 			no-rc5 \
@@ -107,21 +116,12 @@ define LIBOPENSSL_CONFIGURE_CMDS
 			no-fuzz-libfuzzer \
 			no-fuzz-afl \
 			$(if $(BR2_STATIC_LIBS),zlib,zlib-dynamic) \
-			$(if $(BR2_STATIC_LIBS),no-dso) \
 	)
 	$(SED) "s#-march=[-a-z0-9] ##" -e "s#-mcpu=[-a-z0-9] ##g" $(@D)/Makefile
 	$(SED) "s#-O[0-9s]#$(LIBOPENSSL_CFLAGS)#" $(@D)/Makefile
 	$(SED) "s# build_tests##" $(@D)/Makefile
 endef
 
-# libdl is not available in a static build, and this is not implied by no-dso
-ifeq ($(BR2_STATIC_LIBS),y)
-define LIBOPENSSL_FIXUP_STATIC_MAKEFILE
-	$(SED) 's#-ldl##g' $(@D)/Makefile
-endef
-LIBOPENSSL_POST_CONFIGURE_HOOKS += LIBOPENSSL_FIXUP_STATIC_MAKEFILE
-endif
-
 define HOST_LIBOPENSSL_BUILD_CMDS
 	$(HOST_MAKE_ENV) $(MAKE) -C $(@D)
 endef
@@ -144,16 +144,6 @@ define LIBOPENSSL_INSTALL_TARGET_CMDS
 	rm -f $(TARGET_DIR)/usr/bin/c_rehash
 endef
 
-# libdl has no business in a static build
-ifeq ($(BR2_STATIC_LIBS),y)
-define LIBOPENSSL_FIXUP_STATIC_PKGCONFIG
-	$(SED) 's#-ldl##' $(STAGING_DIR)/usr/lib/pkgconfig/libcrypto.pc
-	$(SED) 's#-ldl##' $(STAGING_DIR)/usr/lib/pkgconfig/libssl.pc
-	$(SED) 's#-ldl##' $(STAGING_DIR)/usr/lib/pkgconfig/openssl.pc
-endef
-LIBOPENSSL_POST_INSTALL_STAGING_HOOKS += LIBOPENSSL_FIXUP_STATIC_PKGCONFIG
-endif
-
 ifeq ($(BR2_PACKAGE_PERL),)
 define LIBOPENSSL_REMOVE_PERL_SCRIPTS
 	$(RM) -f $(TARGET_DIR)/etc/ssl/misc/{CA.pl,tsget}
-- 
2.20.1
