From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 6 Jun 2017 22:47:05 +0200
Subject: [Buildroot] [git commit] rhash: new package
Message-ID: <20170606204729.E44328289C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e375b971de02f2e3f1bc10d08fb91f6b14ad7f9e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
[Thomas:
 - fix indentation
 - don't use post install target hook.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in        |  1 +
 package/rhash/Config.in  | 24 ++++++++++++++++++
 package/rhash/rhash.hash |  3 +++
 package/rhash/rhash.mk   | 66 ++++++++++++++++++++++++++++++++++++++++++++++++
 4 files changed, 94 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index ce8ed37..3442828 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -970,6 +970,7 @@ menu "Crypto"
 	source "package/mbedtls/Config.in"
 	source "package/nettle/Config.in"
 	source "package/openssl/Config.in"
+	source "package/rhash/Config.in"
 	source "package/tinydtls/Config.in"
 	source "package/trousers/Config.in"
 	source "package/ustream-ssl/Config.in"
diff --git a/package/rhash/Config.in b/package/rhash/Config.in
new file mode 100644
index 0000000..46f6ca7
--- /dev/null
+++ b/package/rhash/Config.in
@@ -0,0 +1,24 @@
+config BR2_PACKAGE_RHASH
+	bool "rhash"
+	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT_IF_LOCALE
+	help
+	  LibRHash is a professional, portable, thread-safe C library
+	  for computing a wide variety of hash sums, such as CRC32,
+	  MD4, MD5, SHA1, SHA256, SHA512, SHA3, AICH, ED2K, Tiger,
+	  DC++ TTH, BitTorrent BTIH, GOST R 34.11-94, RIPEMD-160,
+	  HAS-160, EDON-R, Whirlpool and Snefru.
+
+	  https://github.com/rhash/RHash
+
+if BR2_PACKAGE_RHASH
+
+config BR2_PACKAGE_RHASH_BIN
+	bool "rhash binary"
+	depends on !BR2_STATIC_LIBS
+	help
+	  Install rhash console utility
+
+comment "rhash binary needs a toolchain w/ dynamic library"
+	depends on BR2_STATIC_LIBS
+
+endif
diff --git a/package/rhash/rhash.hash b/package/rhash/rhash.hash
new file mode 100644
index 0000000..5efc3a6
--- /dev/null
+++ b/package/rhash/rhash.hash
@@ -0,0 +1,3 @@
+# From https://sourceforge.net/projects/rhash/files/rhash/1.3.4/
+md5 0b51010604659e9e99f6307b053ba13b  rhash-1.3.4-src.tar.gz
+sha1 411d8c7ba84fa9763bc49fa2fd3a7587712fd52c  rhash-1.3.4-src.tar.gz
diff --git a/package/rhash/rhash.mk b/package/rhash/rhash.mk
new file mode 100644
index 0000000..6cfc271
--- /dev/null
+++ b/package/rhash/rhash.mk
@@ -0,0 +1,66 @@
+################################################################################
+#
+# rhash
+#
+################################################################################
+
+RHASH_VERSION = 1.3.4
+RHASH_SOURCE = rhash-$(RHASH_VERSION)-src.tar.gz
+RHASH_SITE = https://sourceforge.net/projects/rhash/files/rhash/$(RHASH_VERSION)
+RHASH_LICENSE = MIT
+RHASH_LICENSE_FILES = COPYING
+RHASH_INSTALL_STAGING = YES
+
+ifeq ($(BR2_NEEDS_GETTEXT_IF_LOCALE),y)
+RHASH_DEPENDENCIES += gettext
+RHASH_ADDCFLAGS += -DUSE_GETTEXT
+RHASH_ADDLDFLAGS += -lintl
+endif
+
+ifeq ($(BR2_PACKAGE_OPENSSL)x$(BR2_STATIC_LIBS),yx)
+RHASH_DEPENDENCIES += openssl
+RHASH_ADDCFLAGS += -DOPENSSL_RUNTIME -rdynamic
+RHASH_ADDLDFLAGS += -ldl
+endif
+
+RHASH_MAKE_OPTS = \
+	ADDCFLAGS="$(RHASH_ADDCFLAGS)" \
+	ADDLDFLAGS="$(RHASH_ADDLDFLAGS)" \
+	PREFIX="/usr"
+
+ifeq ($(BR2_SHARED_LIBS),y)
+RHASH_BUILD_TARGETS = lib-shared build-shared
+RHASH_INSTALL_TARGETS = install-lib-shared install-so-link
+else ifeq ($(BR2_STATIC_LIBS),y)
+RHASH_BUILD_TARGETS = lib-static
+RHASH_INSTALL_TARGETS = install-lib-static
+else
+RHASH_BUILD_TARGETS = lib-static lib-shared build-shared
+RHASH_INSTALL_TARGETS = install-lib-static install-lib-shared install-so-link
+endif
+
+define RHASH_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) \
+		$(RHASH_MAKE_OPTS) $(RHASH_BUILD_TARGETS)
+endef
+
+define RHASH_INSTALL_STAGING_CMDS
+	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D)/librhash \
+		DESTDIR="$(STAGING_DIR)" $(RHASH_MAKE_OPTS) $(RHASH_INSTALL_TARGETS) \
+		install-headers
+endef
+
+ifeq ($(BR2_PACKAGE_RHASH_BIN),y)
+define RHASH_INSTALL_TARGET_RHASH_BIN
+	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) \
+		DESTDIR="$(TARGET_DIR)" $(RHASH_MAKE_OPTS) install-shared
+endef
+endif
+
+define RHASH_INSTALL_TARGET_CMDS
+	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D)/librhash \
+		DESTDIR="$(TARGET_DIR)" $(RHASH_MAKE_OPTS) $(RHASH_INSTALL_TARGETS)
+	$(RHASH_INSTALL_TARGET_RHASH_BIN)
+endef
+
+$(eval $(generic-package))
