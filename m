From: Assaf Inbal <shmuelzon@gmail.com>
Date: Mon, 20 May 2013 15:56:39 +0300
Subject: [Buildroot] [PATCH 07/12] luacrypto: New package
In-Reply-To: <1369054604-26139-1-git-send-email-shmuelzon@gmail.com>
References: <1369054604-26139-1-git-send-email-shmuelzon@gmail.com>
Message-ID: <1369054604-26139-7-git-send-email-shmuelzon@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

LuaCrypto provides a Lua frontend to the OpenSSL cryptographic library.

Signed-off-by: Assaf Inbal <shmuelzon@gmail.com>
---
 package/Config.in              |  1 +
 package/luacrypto/Config.in    | 12 ++++++++++++
 package/luacrypto/luacrypto.mk | 15 +++++++++++++++
 3 files changed, 28 insertions(+)
 create mode 100644 package/luacrypto/Config.in
 create mode 100644 package/luacrypto/luacrypto.mk

diff --git a/package/Config.in b/package/Config.in
index 1089533..c11ff27 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -310,6 +310,7 @@ source "package/coxpcall/Config.in"
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
index 0000000..b0cdfc3
--- /dev/null
+++ b/package/luacrypto/luacrypto.mk
@@ -0,0 +1,15 @@
+#############################################################
+#
+# lucrypto
+#
+#############################################################
+
+LUACRYPTO_VERSION = master
+LUACRYPTO_SITE = git://github.com/mkottman/luacrypto.git
+LUACRYPTO_SITE_METHOD = git
+LUACRYPTO_LICENSE = MIT
+LUACRYPTO_LICENSE_FILES = COPYING
+LUACRYPTO_DEPENDENCIES = lua luasocket openssl
+LUACRYPTO_CONF_OPT = "-DLUA_LIBRARIES=\"$(STAGING_DIR)/usr/lib/liblua.so\""
+
+$(eval $(cmake-package))
-- 
1.8.1.2
