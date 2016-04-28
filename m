From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 28 Apr 2016 19:41:27 +0200
Subject: [Buildroot] [git commit] libtomcrypt: new package
Message-ID: <20160428174450.5F03B80110@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=cbed1c3b4a89e4c4d4b5cc715b1fd7202ad36881
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Peter: fix building without wchar]
Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Reviewed-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/Config.in                    |  1 +
 package/libtomcrypt/Config.in        | 11 +++++++++++
 package/libtomcrypt/libtomcrypt.hash |  2 ++
 package/libtomcrypt/libtomcrypt.mk   | 27 +++++++++++++++++++++++++++
 4 files changed, 41 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index e645dfe..c7743a2 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -848,6 +848,7 @@ menu "Crypto"
 	source "package/libsodium/Config.in"
 	source "package/libssh/Config.in"
 	source "package/libssh2/Config.in"
+	source "package/libtomcrypt/Config.in"
 	source "package/libuecc/Config.in"
 	source "package/mbedtls/Config.in"
 	source "package/nettle/Config.in"
diff --git a/package/libtomcrypt/Config.in b/package/libtomcrypt/Config.in
new file mode 100644
index 0000000..6678b30
--- /dev/null
+++ b/package/libtomcrypt/Config.in
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_LIBTOMCRYPT
+	bool "libtomcrypt"
+	select BR2_PACKAGE_LIBTOMMATH
+	help
+	  LibTomCrypt is a fairly comprehensive, modular and portable
+	  cryptographic toolkit that provides developers with a vast array
+	  of well known published block ciphers, one-way hash functions,
+	  chaining modes, pseudo-random number generators, public key
+	  cryptography and a plethora of other routines.
+
+	  http://www.libtom.net
diff --git a/package/libtomcrypt/libtomcrypt.hash b/package/libtomcrypt/libtomcrypt.hash
new file mode 100644
index 0000000..562016d
--- /dev/null
+++ b/package/libtomcrypt/libtomcrypt.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256  e33b47d77a495091c8703175a25c8228aff043140b2554c08a3c3cd71f79d116  crypt-1.17.tar.bz2
diff --git a/package/libtomcrypt/libtomcrypt.mk b/package/libtomcrypt/libtomcrypt.mk
new file mode 100644
index 0000000..53dbfd5
--- /dev/null
+++ b/package/libtomcrypt/libtomcrypt.mk
@@ -0,0 +1,27 @@
+################################################################################
+#
+# libtomcrypt
+#
+################################################################################
+
+LIBTOMCRYPT_VERSION = 1.17
+LIBTOMCRYPT_SITE = https://github.com/libtom/libtomcrypt/releases/download/$(LIBTOMCRYPT_VERSION)
+LIBTOMCRYPT_SOURCE = crypt-$(LIBTOMCRYPT_VERSION).tar.bz2
+LIBTOMCRYPT_LICENSE = WTFPL
+LIBTOMCRYPT_LICENSE_FILES = LICENSE
+LIBTOMCRYPT_INSTALL_STAGING = YES
+LIBTOMCRYPT_INSTALL_TARGET = NO # only static library
+LIBTOMCRYPT_DEPENDENCIES = libtommath
+
+LIBTOMCRYPT_CFLAGS = -I./src/headers $(TARGET_CFLAGS) -DLTC_SOURCE -DLTM_DESC \
+	$(if $(BR2_USE_WCHAR),,-DLTC_NO_WCHAR)
+
+define LIBTOMCRYPT_BUILD_CMDS
+	$(MAKE) -C $(@D) $(TARGET_CONFIGURE_OPTS) CFLAGS="$(LIBTOMCRYPT_CFLAGS)"
+endef
+
+define LIBTOMCRYPT_INSTALL_STAGING_CMDS
+	$(MAKE) -C $(@D) DESTDIR="$(STAGING_DIR)" NODOCS=1 INSTALL_USER=$(shell id -u) INSTALL_GROUP=$(shell id -g) install
+endef
+
+$(eval $(generic-package))
