From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 17 Jun 2013 23:15:23 +0200
Subject: [Buildroot] [git commit] luacrypto: New package
Message-ID: <20130617212030.C457D9AEE1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=4630a6a8472a0f9f30fbacbefde7c45d6507156a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

LuaCrypto provides a Lua frontend to the OpenSSL cryptographic library.

[Peter: fix file header]
Signed-off-by: Assaf Inbal <shmuelzon@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Config.in              |    1 +
 package/luacrypto/Config.in    |   12 ++++++++++++
 package/luacrypto/luacrypto.mk |   14 ++++++++++++++
 3 files changed, 27 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 92927e3..bcc3470 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -317,6 +317,7 @@ source "package/coxpcall/Config.in"
 source "package/lbase64/Config.in"
 source "package/luabitop/Config.in"
 source "package/luacjson/Config.in"
+source "package/luacrypto/Config.in"
 source "package/luaexpat/Config.in"
 source "package/luafilesystem/Config.in"
 source "package/luasocket/Config.in"
diff --git a/package/luacrypto/Config.in b/package/luacrypto/Config.in
new file mode 100644
index 0000000..f4587c3
--- /dev/null
+++ b/package/luacrypto/Config.in
@@ -0,0 +1,12 @@
+config BR2_PACKAGE_LUACRYPTO
+	bool "luacrypto"
+	select BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_LUASOCKET
+	help
+	  LuaCrypto provides a Lua frontend to the OpenSSL cryptographic
+	  library.
+	  The OpenSSL features that are currently exposed are digests (MD5,
+	  SHA-1, HMAC, and more) and crypto-grade random number generators
+	  communication.
+
+	  http://luacrypto.luaforge.net
diff --git a/package/luacrypto/luacrypto.mk b/package/luacrypto/luacrypto.mk
new file mode 100644
index 0000000..ca57c65
--- /dev/null
+++ b/package/luacrypto/luacrypto.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# luacrypto
+#
+################################################################################
+
+LUACRYPTO_VERSION = 0.3.2
+LUACRYPTO_SITE = http://github.com/mkottman/luacrypto/tarball/$(LUACRYPTO_VERSION)
+LUACRYPTO_LICENSE = MIT
+LUACRYPTO_LICENSE_FILES = COPYING
+LUACRYPTO_DEPENDENCIES = lua openssl
+LUACRYPTO_CONF_OPT = "-DLUA_LIBRARIES=\"$(STAGING_DIR)/usr/lib/liblua.so\""
+
+$(eval $(cmake-package))
