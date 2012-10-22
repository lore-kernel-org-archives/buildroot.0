From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 22 Oct 2012 20:53:15 +0200
Subject: [Buildroot] [git commit] openssl: disable apps for NOMMU
Message-ID: <20121022185335.3C534998F3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=720893b62510438237b9923d744dd079ddb4f67d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The openssl binary uses fork() so disable the option and build for !MMU.
Fixes
http://autobuild.buildroot.net/results/45a9b84c16caadbf77b6fc43d7a0001c981a4c87/build-end.log

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/openssl/Config.in  |    2 ++
 package/openssl/openssl.mk |   17 +++++++++--------
 2 files changed, 11 insertions(+), 8 deletions(-)

diff --git a/package/openssl/Config.in b/package/openssl/Config.in
index 6ba644a..2187023 100644
--- a/package/openssl/Config.in
+++ b/package/openssl/Config.in
@@ -12,6 +12,8 @@ config BR2_PACKAGE_OPENSSL
 config BR2_PACKAGE_OPENSSL_BIN
 	bool "openssl binary"
 	depends on BR2_PACKAGE_OPENSSL
+	# uses fork()
+	depends on BR2_USE_MMU
 	help
 	  Install the openssl binary to the target file system. This is a
 	  command line tool for doing various crypthographic stuff.
diff --git a/package/openssl/openssl.mk b/package/openssl/openssl.mk
index 0917344..265a4fb 100644
--- a/package/openssl/openssl.mk
+++ b/package/openssl/openssl.mk
@@ -13,6 +13,15 @@ OPENSSL_DEPENDENCIES = zlib
 OPENSSL_TARGET_ARCH = generic32
 OPENSSL_CFLAGS = $(TARGET_CFLAGS)
 
+ifeq ($(BR2_PACKAGE_OPENSSL_BIN),)
+define OPENSSL_DISABLE_APPS
+	$(SED) '/^build_apps/! s/build_apps//' $(@D)/Makefile.org
+	$(SED) '/^DIRS=/ s/apps//' $(@D)/Makefile.org
+endef
+endif
+
+OPENSSL_PRE_CONFIGURE_HOOKS += OPENSSL_DISABLE_APPS
+
 ifeq ($(BR2_PACKAGE_OPENSSL_OCF),y)
 	OPENSSL_CFLAGS += -DHAVE_CRYPTODEV -DUSE_CRYPTODEV_DIGESTS
 	OPENSSL_DEPENDENCIES += ocf-linux
@@ -84,14 +93,6 @@ ifneq ($(BR2_HAVE_DEVFILES),y)
 OPENSSL_POST_INSTALL_TARGET_HOOKS += OPENSSL_REMOVE_DEV_FILES
 endif
 
-define OPENSSL_REMOVE_OPENSSL_BIN
-	rm -f $(TARGET_DIR)/usr/bin/openssl
-endef
-
-ifneq ($(BR2_PACKAGE_OPENSSL_BIN),y)
-OPENSSL_POST_INSTALL_TARGET_HOOKS += OPENSSL_REMOVE_OPENSSL_BIN
-endif
-
 define OPENSSL_INSTALL_FIXUPS
 	rm -f $(TARGET_DIR)/usr/bin/c_rehash
 endef
