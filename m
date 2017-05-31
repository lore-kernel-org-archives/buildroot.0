From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 31 May 2017 21:28:18 +0200
Subject: [Buildroot] [git commit branch/next] package/luaossl: new package
Message-ID: <20170531192829.2639682A21@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=26903e429e7b8b9214189f9f12134a5ae91a9361
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Marcin Niestroj <m.niestroj@grinn-global.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 DEVELOPERS                   |  1 +
 package/Config.in            |  1 +
 package/luaossl/Config.in    | 18 ++++++++++++++++++
 package/luaossl/luaossl.hash |  2 ++
 package/luaossl/luaossl.mk   | 14 ++++++++++++++
 5 files changed, 36 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index f86e5c6..5e8b695 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1039,6 +1039,7 @@ F:	board/grinn/
 F:	configs/grinn_*
 F:	package/argparse/
 F:	package/easydbus/
+F:	package/luaossl/
 F:	package/rs485conf/
 F:	package/turbolua/
 
diff --git a/package/Config.in b/package/Config.in
index 1b150b2..c1c6e65 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -573,6 +573,7 @@ menu "Lua libraries/modules"
 	source "package/luafilesystem/Config.in"
 	source "package/luajson/Config.in"
 	source "package/lualogging/Config.in"
+	source "package/luaossl/Config.in"
 	source "package/luaposix/Config.in"
 	source "package/lua-resty-http/Config.in"
 	source "package/luasec/Config.in"
diff --git a/package/luaossl/Config.in b/package/luaossl/Config.in
new file mode 100644
index 0000000..d8763e7
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
index 0000000..ea9f5e3
--- /dev/null
+++ b/package/luaossl/luaossl.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256	51641d8971c19b2c65d3954ded12c306d4ecf6315ff8f1ec584e9a23ca998576  luaossl-20161214-0.src.rock
diff --git a/package/luaossl/luaossl.mk b/package/luaossl/luaossl.mk
new file mode 100644
index 0000000..5bb3e82
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
