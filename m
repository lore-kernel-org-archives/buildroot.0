From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Tue, 18 Apr 2017 16:48:14 +0100
Subject: [Buildroot] [PATCH 1/2] librhash: new package
Message-ID: <20170418154815.51039-1-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 package/Config.in              |  1 +
 package/librhash/Config.in     | 23 +++++++++++++++
 package/librhash/librhash.hash |  3 ++
 package/librhash/librhash.mk   | 64 ++++++++++++++++++++++++++++++++++++++++++
 4 files changed, 91 insertions(+)
 create mode 100644 package/librhash/Config.in
 create mode 100644 package/librhash/librhash.hash
 create mode 100644 package/librhash/librhash.mk

diff --git a/package/Config.in b/package/Config.in
index 4eaa95b..a7053a6 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -948,6 +948,7 @@ menu "Crypto"
 	source "package/libmcrypt/Config.in"
 	source "package/libmhash/Config.in"
 	source "package/libnss/Config.in"
+	source "package/librhash/Config.in"
 	source "package/libscrypt/Config.in"
 	source "package/libsecret/Config.in"
 	source "package/libsha1/Config.in"
diff --git a/package/librhash/Config.in b/package/librhash/Config.in
new file mode 100644
index 0000000..c3b552d
--- /dev/null
+++ b/package/librhash/Config.in
@@ -0,0 +1,23 @@
+config BR2_PACKAGE_LIBRHASH
+	bool "librhash"
+	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT_IF_LOCALE
+	help
+	  RHash is a console utility for calculation and verification of magnet
+	  links and a wide range of hash sums like CRC32, MD4, MD5, SHA1,
+	  SHA256, SHA512, SHA3, AICH, ED2K, Tiger, DC++ TTH,  BitTorrent BTIH,
+	  GOST R 34.11-94, RIPEMD-160, HAS-160, EDON-R, Whirlpool and Snefru.
+
+	  https://github.com/rhash/RHash
+
+if BR2_PACKAGE_LIBRHASH
+
+config BR2_PACKAGE_RHASH
+	bool "rhash binary"
+	depends on !BR2_STATIC_LIBS
+	help
+	  Install rhash binary as well
+
+comment "rhash binary needs a toolchain w/ dynamic library"
+	depends on BR2_STATIC_LIBS
+
+endif
diff --git a/package/librhash/librhash.hash b/package/librhash/librhash.hash
new file mode 100644
index 0000000..5efc3a6
--- /dev/null
+++ b/package/librhash/librhash.hash
@@ -0,0 +1,3 @@
+# From https://sourceforge.net/projects/rhash/files/rhash/1.3.4/
+md5 0b51010604659e9e99f6307b053ba13b  rhash-1.3.4-src.tar.gz
+sha1 411d8c7ba84fa9763bc49fa2fd3a7587712fd52c  rhash-1.3.4-src.tar.gz
diff --git a/package/librhash/librhash.mk b/package/librhash/librhash.mk
new file mode 100644
index 0000000..79806c9
--- /dev/null
+++ b/package/librhash/librhash.mk
@@ -0,0 +1,64 @@
+################################################################################
+#
+# librhash
+#
+################################################################################
+
+LIBRHASH_VERSION = 1.3.4
+LIBRHASH_SOURCE = rhash-$(LIBRHASH_VERSION)-src.tar.gz
+LIBRHASH_SITE = https://sourceforge.net/projects/rhash/files/rhash/$(LIBRHASH_VERSION)
+LIBRHASH_LICENSE = MIT
+LIBRHASH_LICENSE_FILES = COPYING
+LIBRHASH_INSTALL_STAGING = YES
+
+ifeq ($(BR2_NEEDS_GETTEXT_IF_LOCALE),y)
+LIBRHASH_DEPENDENCIES += gettext
+LIBRHASH_ADDCFLAGS += -DUSE_GETTEXT
+LIBRHASH_ADDLDFLAGS += -lintl
+endif
+
+ifeq ($(BR2_PACKAGE_OPENSSL)x$(BR2_STATIC_LIBS),yx)
+LIBRHASH_DEPENDENCIES += openssl
+LIBRHASH_ADDCFLAGS += -DOPENSSL_RUNTIME -rdynamic
+LIBRHASH_ADDLDFLAGS += -ldl
+endif
+
+ifeq ($(BR2_SHARED_STATIC_LIBS),y)
+LIBRHASH_BUILD_TARGETS = lib-static lib-shared build-shared
+LIBRHASH_INSTALL_TARGETS = install-lib-static install-lib-shared install-so-link
+else ifeq ($(BR2_SHARED_LIBS),y)
+LIBRHASH_BUILD_TARGETS = lib-shared build-shared
+LIBRHASH_INSTALL_TARGETS = install-lib-shared install-so-link
+else
+LIBRHASH_BUILD_TARGETS = lib-static
+LIBRHASH_INSTALL_TARGETS = install-lib-static
+endif
+
+define LIBRHASH_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) \
+		ADDCFLAGS="$(LIBRHASH_ADDCFLAGS)" ADDLDFLAGS="$(LIBRHASH_ADDLDFLAGS)" \
+		$(LIBRHASH_BUILD_TARGETS)
+endef
+
+define LIBRHASH_INSTALL_STAGING_CMDS
+	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D)/librhash \
+		DESTDIR="$(STAGING_DIR)" PREFIX="/usr" \
+		$(LIBRHASH_INSTALL_TARGETS) install-headers
+endef
+
+define LIBRHASH_INSTALL_TARGET_CMDS
+	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D)/librhash \
+		DESTDIR="$(TARGET_DIR)" PREFIX="/usr" \
+		$(LIBRHASH_INSTALL_TARGETS)
+endef
+
+ifeq ($(BR2_PACKAGE_RHASH),y)
+define LIBRHASH_INSTALL_RHASH_BINARY
+	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) \
+		DESTDIR="$(TARGET_DIR)" PREFIX="/usr" \
+		install-shared
+endef
+LIBRHASH_POST_INSTALL_TARGET_HOOKS += LIBRHASH_INSTALL_RHASH_BINARY
+endif
+
+$(eval $(generic-package))
-- 
2.10.2
