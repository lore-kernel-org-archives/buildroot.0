From: Kamel Bouhara <kamel.bouhara@bootlin.com>
Date: Mon, 27 Jul 2020 14:23:36 +0200
Subject: [Buildroot] [PATCH v2] package/cryptopp: add a target build
 configuration
Message-ID: <20200727122336.151322-1-kamel.bouhara@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Currently only a host build is supported for cryptopp, this add a new
configuration and build support for the make target.

Signed-off-by: Kamel Bouhara <kamel.bouhara@bootlin.com>
---
Changes in v2:
	- Fixed indentations issue
	- Removed unrequired Config.in.host
	- Added a depends on !BR2_STATIC_LIBS to build only in dynamic
	configuration.
	- Fixed inconsistency between TARGET_INSTALL and STAGING_INSTALL

---
 package/Config.in                             |  1 +
 ...ied-SONAME-to-shared-object-for-Linu.patch | 27 +++++++++++++++++++
 package/cryptopp/Config.in                    |  8 ++++++
 package/cryptopp/cryptopp.mk                  | 24 +++++++++++++++++
 4 files changed, 60 insertions(+)
 create mode 100644 package/cryptopp/0001-Add-fully-qualified-SONAME-to-shared-object-for-Linu.patch
 create mode 100644 package/cryptopp/Config.in

diff --git a/package/Config.in b/package/Config.in
index 9c4843be07..014f57a54a 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1279,6 +1279,7 @@ menu "Crypto"
 	source "package/botan/Config.in"
 	source "package/ca-certificates/Config.in"
 	source "package/cryptodev/Config.in"
+	source "package/cryptopp/Config.in"
 	source "package/gcr/Config.in"
 	source "package/gnutls/Config.in"
 	source "package/libargon2/Config.in"
diff --git a/package/cryptopp/0001-Add-fully-qualified-SONAME-to-shared-object-for-Linu.patch b/package/cryptopp/0001-Add-fully-qualified-SONAME-to-shared-object-for-Linu.patch
new file mode 100644
index 0000000000..e7edc76313
--- /dev/null
+++ b/package/cryptopp/0001-Add-fully-qualified-SONAME-to-shared-object-for-Linu.patch
@@ -0,0 +1,27 @@
+From 78eb43f50978ffd780cf31b1cea6736dadc6b155 Mon Sep 17 00:00:00 2001
+From: Kamel Bouhara <kamel.bouhara@bootlin.com>
+Date: Mon, 6 Jul 2020 17:10:55 +0200
+Subject: [PATCH] Add fully-qualified SONAME to shared object for Linux
+
+From: http://tldp.org/HOWTO/Program-Library-HOWTO/shared-libraries.html
+
+Signed-off-by: Kamel Bouhara <kamel.bouhara@bootlin.com>
+---
+ GNUmakefile | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/GNUmakefile b/GNUmakefile
+index e7b7b3a6..730e2a6f 100755
+--- a/GNUmakefile
++++ b/GNUmakefile
+@@ -1256,6 +1256,7 @@ ifneq ($(wildcard libcryptopp.so$(SOLIB_VERSION_SUFFIX)),)
+ 	$(CHMOD) 0755 $(DESTDIR)$(LIBDIR)/libcryptopp.so$(SOLIB_VERSION_SUFFIX)
+ ifeq ($(HAS_SOLIB_VERSION),1)
+ 	-$(LN) libcryptopp.so$(SOLIB_VERSION_SUFFIX) $(DESTDIR)$(LIBDIR)/libcryptopp.so
++	-$(LN) libcryptopp.so$(SOLIB_VERSION_SUFFIX) $(DESTDIR)$(LIBDIR)/libcryptopp.so$(SOLIB_COMPAT_SUFFIX)
+ 	$(LDCONF) $(DESTDIR)$(LIBDIR)
+ endif
+ endif
+--
+2.26.2
+
diff --git a/package/cryptopp/Config.in b/package/cryptopp/Config.in
new file mode 100644
index 0000000000..4ead5339ab
--- /dev/null
+++ b/package/cryptopp/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_CRYPTOPP
+	bool "cryptopp"
+	depends on !BR2_STATIC_LIBS
+	help
+	  A free C++ class library of cryptographic schemes
+
+comment "cryptopp needs a toolchain w/ dynamic library"
+	depends on BR2_STATIC_LIBS
diff --git a/package/cryptopp/cryptopp.mk b/package/cryptopp/cryptopp.mk
index f1d19386ab..d83c362b0b 100644
--- a/package/cryptopp/cryptopp.mk
+++ b/package/cryptopp/cryptopp.mk
@@ -34,4 +34,28 @@ define HOST_CRYPTOPP_INSTALL_CMDS
 	$(HOST_MAKE_ENV) $(MAKE) -C $(@D) PREFIX=$(HOST_DIR) install-lib
 endef

+define CRYPTOPP_EXTRACT_CMDS
+	$(UNZIP) $(CRYPTOPP_DL_DIR)/$(CRYPTOPP_SOURCE) -d $(@D)
+endef
+
+CRYPTOPP_CXXFLAGS = $(TARGET_CFLAGS) -fPIC
+
+CRYPTOPP_MAKE_OPTS = \
+	$(TARGET_CONFIGURE_OPTS) \
+	CXXFLAGS="$(CRYPTOPP_CXXFLAGS)"
+
+define CRYPTOPP_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) $(CRYPTOPP_MAKE_OPTS) shared
+endef
+
+define CRYPTOPP_INSTALL_TARGET_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) PREFIX=$(TARGET_DIR) install-lib
+endef
+
+define CRYPTOPP_INSTALL_STAGING_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) PREFIX=$(STAGING_DIR) libcryptopp.pc
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) PREFIX=$(STAGING_DIR) install-lib
+endef
+
+$(eval $(generic-package))
 $(eval $(host-generic-package))
--
2.27.0
