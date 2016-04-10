From: Francois Perrad <fperrad@gmail.com>
Date: Sun, 10 Apr 2016 16:55:25 +0200
Subject: [Buildroot] [V4 2/3] libtomcrypt: new package
In-Reply-To: <1460300126-11046-1-git-send-email-francois.perrad@gadz.org>
References: <1460300126-11046-1-git-send-email-francois.perrad@gadz.org>
Message-ID: <1460300126-11046-2-git-send-email-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Reviewed-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/Config.in                    |  1 +
 package/libtomcrypt/Config.in        | 11 +++++++++++
 package/libtomcrypt/libtomcrypt.hash |  2 ++
 package/libtomcrypt/libtomcrypt.mk   | 24 ++++++++++++++++++++++++
 4 files changed, 38 insertions(+)
 create mode 100644 package/libtomcrypt/Config.in
 create mode 100644 package/libtomcrypt/libtomcrypt.hash
 create mode 100644 package/libtomcrypt/libtomcrypt.mk

diff --git a/package/Config.in b/package/Config.in
index 24dbe09..9c2d56d 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -840,6 +840,7 @@ menu "Crypto"
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
index 0000000..9943f00
--- /dev/null
+++ b/package/libtomcrypt/libtomcrypt.mk
@@ -0,0 +1,24 @@
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
+define LIBTOMCRYPT_BUILD_CMDS
+	$(MAKE) -C $(@D) $(TARGET_CONFIGURE_OPTS) CFLAGS="-I./src/headers $(TARGET_CFLAGS) -DLTC_SOURCE -DLTM_DESC"
+endef
+
+define LIBTOMCRYPT_INSTALL_STAGING_CMDS
+	$(MAKE) -C $(@D) DESTDIR="$(STAGING_DIR)" NODOCS=1 INSTALL_USER=$(shell id -u) INSTALL_GROUP=$(shell id -g) install
+endef
+
+$(eval $(generic-package))
-- 
2.5.0
