From: Marcin Niestroj <m.niestroj@grinn-global.com>
Date: Mon, 29 May 2017 16:32:05 +0200
Subject: [Buildroot] [PATCH] package/luaossl: new package
Message-ID: <20170529143205.29529-1-m.niestroj@grinn-global.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Marcin Niestroj <m.niestroj@grinn-global.com>
---
 package/Config.in            |  1 +
 package/luaossl/Config.in    | 18 ++++++++++++++++++
 package/luaossl/luaossl.hash |  2 ++
 package/luaossl/luaossl.mk   | 14 ++++++++++++++
 4 files changed, 35 insertions(+)
 create mode 100644 package/luaossl/Config.in
 create mode 100644 package/luaossl/luaossl.hash
 create mode 100644 package/luaossl/luaossl.mk

diff --git a/package/Config.in b/package/Config.in
index d57813c5c..37e181a28 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -571,6 +571,7 @@ menu "Lua libraries/modules"
 	source "package/luafilesystem/Config.in"
 	source "package/luajson/Config.in"
 	source "package/lualogging/Config.in"
+	source "package/luaossl/Config.in"
 	source "package/luaposix/Config.in"
 	source "package/lua-resty-http/Config.in"
 	source "package/luasec/Config.in"
diff --git a/package/luaossl/Config.in b/package/luaossl/Config.in
new file mode 100644
index 000000000..d8763e76a
--- /dev/null
+++ b/package/luaossl/Config.in
@@ -0,0 +1,18 @@
+config BR2_PACKAGE_LUAOSSL
+	bool "luaossl"
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	select BR2_PACKAGE_OPENSSL
+	help
+	  luaossl is a comprehensive binding to OpenSSL for Lua 5.1,
+	  5.2, and later.
+
+	  It includes support for certificate and key management,
+	  key generation, signature verification, and deep bindings
+	  to the distinguished name, alternative name, and X.509v3
+	  extension interfaces. It also binds OpenSSL's bignum, message
+	  digest, HMAC, cipher, and CSPRNG interfaces.
+
+	  http://25thandclement.com/~william/projects/luaossl.html
+
+comment "luaossl needs a toolchain w/ threads"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/luaossl/luaossl.hash b/package/luaossl/luaossl.hash
new file mode 100644
index 000000000..ea9f5e333
--- /dev/null
+++ b/package/luaossl/luaossl.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256	51641d8971c19b2c65d3954ded12c306d4ecf6315ff8f1ec584e9a23ca998576  luaossl-20161214-0.src.rock
diff --git a/package/luaossl/luaossl.mk b/package/luaossl/luaossl.mk
new file mode 100644
index 000000000..5bb3e8260
--- /dev/null
+++ b/package/luaossl/luaossl.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# luaossl
+#
+################################################################################
+
+LUAOSSL_VERSION_UPSTREAM = 20161214
+LUAOSSL_VERSION = $(LUAOSSL_VERSION_UPSTREAM)-0
+LUAOSSL_SUBDIR = luaossl-rel-$(LUAOSSL_VERSION_UPSTREAM)
+LUAOSSL_LICENSE = MIT
+LUAOSSL_LICENSE_FILES = $(LUAOSSL_SUBDIR)/LICENSE
+LUAOSSL_DEPENDENCIES = openssl
+
+$(eval $(luarocks-package))
-- 
2.13.0
