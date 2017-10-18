From: Adam Duskett <aduskett@gmail.com>
Date: Tue, 17 Oct 2017 22:32:28 -0400
Subject: [Buildroot] [PATCH 01/13] openssl: new virtual package
In-Reply-To: <20171018023240.22724-1-Adamduskett@outlook.com>
References: <20171018023240.22724-1-Adamduskett@outlook.com>
Message-ID: <20171018023240.22724-2-Adamduskett@outlook.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

To ease the transition to having both OpenSSL and LibreSSL, there has to be
a new virtual package introduced to handle both.

Instead of making a libssl, and adding OpenSSL and libressl to that package,
it will be far easier to move openssl to libopenssl and to make OpenSSL
a virtual package.  This offers a few advantages:

- BR2_PACKAGE_OPENSSL is still a visible symbol with no dependencies.
- It does not require a huge patch to convert every instance of
  OpenSSL -> libssl)
- Users will be able to update without ever having to select anything new.
- LibreSSL can be added at a later date to the virtual package.

Signed-off-by: Adam Duskett <Adamduskett@outlook.com>
---
 ...time-building-manpages-if-we-re-not-going.patch |   0
 ...todev-Fix-issue-with-signature-generation.patch |   0
 .../openssl.hash => libopenssl/libopenssl.hash}    |   0
 package/libopenssl/libopenssl.mk                   | 171 +++++++++++++++++++++
 package/openssl/Config.in                          |  44 ++++--
 package/openssl/openssl.mk                         | 165 +-------------------
 6 files changed, 207 insertions(+), 173 deletions(-)
 rename package/{openssl => libopenssl}/0001-Dont-waste-time-building-manpages-if-we-re-not-going.patch (100%)
 rename package/{openssl => libopenssl}/0002-cryptodev-Fix-issue-with-signature-generation.patch (100%)
 rename package/{openssl/openssl.hash => libopenssl/libopenssl.hash} (100%)
 create mode 100644 package/libopenssl/libopenssl.mk

diff --git a/package/openssl/0001-Dont-waste-time-building-manpages-if-we-re-not-going.patch b/package/libopenssl/0001-Dont-waste-time-building-manpages-if-we-re-not-going.patch
similarity index 100%
rename from package/openssl/0001-Dont-waste-time-building-manpages-if-we-re-not-going.patch
rename to package/libopenssl/0001-Dont-waste-time-building-manpages-if-we-re-not-going.patch
diff --git a/package/openssl/0002-cryptodev-Fix-issue-with-signature-generation.patch b/package/libopenssl/0002-cryptodev-Fix-issue-with-signature-generation.patch
similarity index 100%
rename from package/openssl/0002-cryptodev-Fix-issue-with-signature-generation.patch
rename to package/libopenssl/0002-cryptodev-Fix-issue-with-signature-generation.patch
diff --git a/package/openssl/openssl.hash b/package/libopenssl/libopenssl.hash
similarity index 100%
rename from package/openssl/openssl.hash
rename to package/libopenssl/libopenssl.hash
diff --git a/package/libopenssl/libopenssl.mk b/package/libopenssl/libopenssl.mk
new file mode 100644
index 0000000000..90cff585f8
--- /dev/null
+++ b/package/libopenssl/libopenssl.mk
@@ -0,0 +1,171 @@
+################################################################################
+#
+# libopenssl
+#
+################################################################################
+
+LIBOPENSSL_VERSION = 1.0.2l
+LIBOPENSSL_SITE = http://www.openssl.org/source
+LIBOPENSSL_SOURCE = openssl-$(LIBOPENSSL_VERSION).tar.gz
+LIBOPENSSL_LICENSE = OpenSSL or SSLeay
+LIBOPENSSL_LICENSE_FILES = LICENSE
+LIBOPENSSL_INSTALL_STAGING = YES
+LIBOPENSSL_DEPENDENCIES = zlib
+HOST_LIBOPENSSL_DEPENDENCIES = host-zlib
+LIBOPENSSL_TARGET_ARCH = generic32
+LIBOPENSSL_CFLAGS = $(TARGET_CFLAGS)
+LIBOPENSSL_PROVIDES = openssl
+LIBOPENSSL_PATCH = \
+	https://gitweb.gentoo.org/repo/gentoo.git/plain/dev-libs/openssl/files/openssl-1.0.2d-parallel-build.patch?id=c8abcbe8de5d3b6cdd68c162f398c011ff6e2d9d \
+	https://gitweb.gentoo.org/repo/gentoo.git/plain/dev-libs/openssl/files/openssl-1.0.2a-parallel-obj-headers.patch?id=c8abcbe8de5d3b6cdd68c162f398c011ff6e2d9d \
+	https://gitweb.gentoo.org/repo/gentoo.git/plain/dev-libs/openssl/files/openssl-1.0.2a-parallel-install-dirs.patch?id=c8abcbe8de5d3b6cdd68c162f398c011ff6e2d9d \
+	https://gitweb.gentoo.org/repo/gentoo.git/plain/dev-libs/openssl/files/openssl-1.0.2a-parallel-symlinking.patch?id=c8abcbe8de5d3b6cdd68c162f398c011ff6e2d9d
+
+# relocation truncated to fit: R_68K_GOT16O
+ifeq ($(BR2_m68k_cf),y)
+LIBOPENSSL_CFLAGS += -mxgot
+endif
+
+ifeq ($(BR2_USE_MMU),)
+LIBOPENSSL_CFLAGS += -DHAVE_FORK=0
+endif
+
+ifeq ($(BR2_PACKAGE_HAS_CRYPTODEV),y)
+LIBOPENSSL_CFLAGS += -DHAVE_CRYPTODEV -DUSE_CRYPTODEV_DIGESTS
+LIBOPENSSL_DEPENDENCIES += cryptodev
+endif
+
+# Some architectures are optimized in OpenSSL
+# Doesn't work for thumb-only (Cortex-M?)
+ifeq ($(BR2_ARM_CPU_HAS_ARM),y)
+LIBOPENSSL_TARGET_ARCH = armv4
+endif
+ifeq ($(ARCH),aarch64)
+LIBOPENSSL_TARGET_ARCH = aarch64
+endif
+ifeq ($(ARCH),powerpc)
+# 4xx cores seem to have trouble with openssl's ASM optimizations
+ifeq ($(BR2_powerpc_401)$(BR2_powerpc_403)$(BR2_powerpc_405)$(BR2_powerpc_405fp)$(BR2_powerpc_440)$(BR2_powerpc_440fp),)
+LIBOPENSSL_TARGET_ARCH = ppc
+endif
+endif
+ifeq ($(ARCH),powerpc64)
+LIBOPENSSL_TARGET_ARCH = ppc64
+endif
+ifeq ($(ARCH),powerpc64le)
+LIBOPENSSL_TARGET_ARCH = ppc64le
+endif
+ifeq ($(ARCH),x86_64)
+LIBOPENSSL_TARGET_ARCH = x86_64
+endif
+
+define HOST_LIBOPENSSL_CONFIGURE_CMDS
+	(cd $(@D); \
+		$(HOST_CONFIGURE_OPTS) \
+		./config \
+		--prefix=$(HOST_DIR) \
+		--openssldir=$(HOST_DIR)/etc/ssl \
+		--libdir=/lib \
+		shared \
+		zlib-dynamic \
+	)
+	$(SED) "s#-O[0-9]#$(HOST_CFLAGS)#" $(@D)/Makefile
+endef
+
+define LIBOPENSSL_CONFIGURE_CMDS
+	(cd $(@D); \
+		$(TARGET_CONFIGURE_ARGS) \
+		$(TARGET_CONFIGURE_OPTS) \
+		./Configure \
+			linux-$(LIBOPENSSL_TARGET_ARCH) \
+			--prefix=/usr \
+			--openssldir=/etc/ssl \
+			--libdir=/lib \
+			$(if $(BR2_TOOLCHAIN_HAS_THREADS),threads,no-threads) \
+			$(if $(BR2_STATIC_LIBS),no-shared,shared) \
+			no-rc5 \
+			enable-camellia \
+			enable-mdc2 \
+			enable-tlsext \
+			$(if $(BR2_STATIC_LIBS),zlib,zlib-dynamic) \
+			$(if $(BR2_STATIC_LIBS),no-dso) \
+	)
+	$(SED) "s#-march=[-a-z0-9] ##" -e "s#-mcpu=[-a-z0-9] ##g" $(@D)/Makefile
+	$(SED) "s#-O[0-9]#$(LIBOPENSSL_CFLAGS)#" $(@D)/Makefile
+	$(SED) "s# build_tests##" $(@D)/Makefile
+endef
+
+# libdl is not available in a static build, and this is not implied by no-dso
+ifeq ($(BR2_STATIC_LIBS),y)
+define LIBOPENSSL_FIXUP_STATIC_MAKEFILE
+	$(SED) 's#-ldl##g' $(@D)/Makefile
+endef
+LIBOPENSSL_POST_CONFIGURE_HOOKS += LIBOPENSSL_FIXUP_STATIC_MAKEFILE
+endif
+
+define HOST_LIBOPENSSL_BUILD_CMDS
+	$(HOST_MAKE_ENV) $(MAKE) -C $(@D)
+endef
+
+define LIBOPENSSL_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)
+endef
+
+define LIBOPENSSL_INSTALL_STAGING_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) INSTALL_PREFIX=$(STAGING_DIR) install
+endef
+
+define HOST_LIBOPENSSL_INSTALL_CMDS
+	$(HOST_MAKE_ENV) $(MAKE) -C $(@D) install
+endef
+
+define LIBOPENSSL_INSTALL_TARGET_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) INSTALL_PREFIX=$(TARGET_DIR) install
+	rm -rf $(TARGET_DIR)/usr/lib/ssl
+	rm -f $(TARGET_DIR)/usr/bin/c_rehash
+endef
+
+# libdl has no business in a static build
+ifeq ($(BR2_STATIC_LIBS),y)
+define LIBOPENSSL_FIXUP_STATIC_PKGCONFIG
+	$(SED) 's#-ldl##' $(STAGING_DIR)/usr/lib/pkgconfig/libcrypto.pc
+	$(SED) 's#-ldl##' $(STAGING_DIR)/usr/lib/pkgconfig/libssl.pc
+	$(SED) 's#-ldl##' $(STAGING_DIR)/usr/lib/pkgconfig/openssl.pc
+endef
+LIBOPENSSL_POST_INSTALL_STAGING_HOOKS += LIBOPENSSL_FIXUP_STATIC_PKGCONFIG
+endif
+
+ifneq ($(BR2_STATIC_LIBS),y)
+# libraries gets installed read only, so strip fails
+define LIBOPENSSL_INSTALL_FIXUPS_SHARED
+	chmod +w $(TARGET_DIR)/usr/lib/engines/lib*.so
+	for i in $(addprefix $(TARGET_DIR)/usr/lib/,libcrypto.so.* libssl.so.*); \
+	do chmod +w $$i; done
+endef
+LIBOPENSSL_POST_INSTALL_TARGET_HOOKS += LIBOPENSSL_INSTALL_FIXUPS_SHARED
+endif
+
+ifeq ($(BR2_PACKAGE_PERL),)
+define LIBOPENSSL_REMOVE_PERL_SCRIPTS
+	$(RM) -f $(TARGET_DIR)/etc/ssl/misc/{CA.pl,tsget}
+endef
+LIBOPENSSL_POST_INSTALL_TARGET_HOOKS += LIBOPENSSL_REMOVE_PERL_SCRIPTS
+endif
+
+ifeq ($(BR2_PACKAGE_LIBOPENSSL_BIN),)
+define LIBOPENSSL_REMOVE_BIN
+	$(RM) -f $(TARGET_DIR)/usr/bin/openssl
+	$(RM) -f $(TARGET_DIR)/etc/ssl/misc/{CA.*,c_*}
+endef
+LIBOPENSSL_POST_INSTALL_TARGET_HOOKS += LIBOPENSSL_REMOVE_BIN
+endif
+
+ifneq ($(BR2_PACKAGE_LIBOPENSSL_ENGINES),y)
+define LIBOPENSSL_REMOVE_LIBOPENSSL_ENGINES
+	rm -rf $(TARGET_DIR)/usr/lib/engines
+endef
+LIBOPENSSL_POST_INSTALL_TARGET_HOOKS += LIBOPENSSL_REMOVE_LIBOPENSSL_ENGINES
+endif
+
+$(eval $(generic-package))
+$(eval $(host-generic-package))
diff --git a/package/openssl/Config.in b/package/openssl/Config.in
index e08b648ba4..1b3e852fdb 100644
--- a/package/openssl/Config.in
+++ b/package/openssl/Config.in
@@ -1,28 +1,52 @@
 config BR2_PACKAGE_OPENSSL
+	bool "openssl support"
+	help
+	  Select the desired ssl library provider.
+
+if BR2_PACKAGE_OPENSSL
+
+choice
+	prompt "ssl library"
+	default BR2_PACKAGE_LIBOPENSSL
+	help
+	  Select OpenSSL.
+
+config BR2_PACKAGE_LIBOPENSSL
 	bool "openssl"
 	select BR2_PACKAGE_ZLIB
 	help
-	  A collaborative effort to develop a robust, commercial-grade, fully
-	  featured, and Open Source toolkit implementing the Secure Sockets
-	  Layer (SSL v2/v3) and Transport Security (TLS v1) as well as a
-	  full-strength general-purpose cryptography library.
+	  A collaborative effort to develop a robust, commercial-grade,
+	  fully featured, and Open Source toolkit implementing the
+	  Secure Sockets Layer (SSL v2/v3) and Transport Security
+	  (TLS v1) as well as a full-strength general-purpose
+	  cryptography library.
 
 	  http://www.openssl.org/
 
 	  Note: Some helper scripts need perl.
 
-if BR2_PACKAGE_OPENSSL
+if BR2_PACKAGE_LIBOPENSSL
 
-config BR2_PACKAGE_OPENSSL_BIN
+config BR2_PACKAGE_LIBOPENSSL_BIN
 	bool "openssl binary"
 	help
-	  Install the openssl binary and the associated helper scripts to the
-	  target file system. This is a command line tool for doing various
-	  cryptographic stuff.
+	  Install the openssl binary and the associated helper scripts
+	  to the target file system. This is a command line tool for
+	  doing various cryptographic stuff.
 
-config BR2_PACKAGE_OPENSSL_ENGINES
+config BR2_PACKAGE_LIBOPENSSL_ENGINES
 	bool "openssl additional engines"
 	help
 	  Install additional encryption engine libraries.
 
 endif
+
+endchoice
+
+config BR2_PACKAGE_HAS_OPENSSL
+	bool
+
+config BR2_PACKAGE_PROVIDES_OPENSSL
+	string
+	default "libopenssl"  if BR2_PACKAGE_LIBOPENSSL
+endif
diff --git a/package/openssl/openssl.mk b/package/openssl/openssl.mk
index ec8e6f204c..d20e184cfc 100644
--- a/package/openssl/openssl.mk
+++ b/package/openssl/openssl.mk
@@ -4,166 +4,5 @@
 #
 ################################################################################
 
-OPENSSL_VERSION = 1.0.2l
-OPENSSL_SITE = http://www.openssl.org/source
-OPENSSL_LICENSE = OpenSSL or SSLeay
-OPENSSL_LICENSE_FILES = LICENSE
-OPENSSL_INSTALL_STAGING = YES
-OPENSSL_DEPENDENCIES = zlib
-HOST_OPENSSL_DEPENDENCIES = host-zlib
-OPENSSL_TARGET_ARCH = generic32
-OPENSSL_CFLAGS = $(TARGET_CFLAGS)
-OPENSSL_PATCH = \
-	https://gitweb.gentoo.org/repo/gentoo.git/plain/dev-libs/openssl/files/openssl-1.0.2d-parallel-build.patch?id=c8abcbe8de5d3b6cdd68c162f398c011ff6e2d9d \
-	https://gitweb.gentoo.org/repo/gentoo.git/plain/dev-libs/openssl/files/openssl-1.0.2a-parallel-obj-headers.patch?id=c8abcbe8de5d3b6cdd68c162f398c011ff6e2d9d \
-	https://gitweb.gentoo.org/repo/gentoo.git/plain/dev-libs/openssl/files/openssl-1.0.2a-parallel-install-dirs.patch?id=c8abcbe8de5d3b6cdd68c162f398c011ff6e2d9d \
-	https://gitweb.gentoo.org/repo/gentoo.git/plain/dev-libs/openssl/files/openssl-1.0.2a-parallel-symlinking.patch?id=c8abcbe8de5d3b6cdd68c162f398c011ff6e2d9d
-
-# relocation truncated to fit: R_68K_GOT16O
-ifeq ($(BR2_m68k_cf),y)
-OPENSSL_CFLAGS += -mxgot
-endif
-
-ifeq ($(BR2_USE_MMU),)
-OPENSSL_CFLAGS += -DHAVE_FORK=0
-endif
-
-ifeq ($(BR2_PACKAGE_HAS_CRYPTODEV),y)
-OPENSSL_CFLAGS += -DHAVE_CRYPTODEV -DUSE_CRYPTODEV_DIGESTS
-OPENSSL_DEPENDENCIES += cryptodev
-endif
-
-# Some architectures are optimized in OpenSSL
-# Doesn't work for thumb-only (Cortex-M?)
-ifeq ($(BR2_ARM_CPU_HAS_ARM),y)
-OPENSSL_TARGET_ARCH = armv4
-endif
-ifeq ($(ARCH),aarch64)
-OPENSSL_TARGET_ARCH = aarch64
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
-define HOST_OPENSSL_CONFIGURE_CMDS
-	(cd $(@D); \
-		$(HOST_CONFIGURE_OPTS) \
-		./config \
-		--prefix=$(HOST_DIR) \
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
-	$(HOST_MAKE_ENV) $(MAKE) -C $(@D)
-endef
-
-define OPENSSL_BUILD_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)
-endef
-
-define OPENSSL_INSTALL_STAGING_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) INSTALL_PREFIX=$(STAGING_DIR) install
-endef
-
-define HOST_OPENSSL_INSTALL_CMDS
-	$(HOST_MAKE_ENV) $(MAKE) -C $(@D) install
-endef
-
-define OPENSSL_INSTALL_TARGET_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) INSTALL_PREFIX=$(TARGET_DIR) install
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
+$(eval $(virtual-package))
+$(eval $(host-virtual-package))
-- 
2.13.6
