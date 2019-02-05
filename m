From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue,  5 Feb 2019 21:03:09 +0100
Subject: [Buildroot] [PATCH] package/luacrypto: remove package
Message-ID: <20190205200309.21377-1-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
http://autobuild.buildroot.net/results/afd/afdc598b80356a8301d890232466de421f7779d5/

Luacrypto fails to build with openssl 1.1.x.  The package has not seen any
functional changes since it was added in 2013 and has no reverse
dependencies.

The upstream repository (https://github.com/starius/luacrypto) explicitly
states:

this project is deprecated, use luaossl

So remove the package.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 Config.in.legacy                 |  6 ++++++
 DEVELOPERS                       |  1 -
 package/Config.in                |  1 -
 package/luacrypto/Config.in      | 11 -----------
 package/luacrypto/luacrypto.hash |  3 ---
 package/luacrypto/luacrypto.mk   | 12 ------------
 6 files changed, 6 insertions(+), 28 deletions(-)
 delete mode 100644 package/luacrypto/Config.in
 delete mode 100644 package/luacrypto/luacrypto.hash
 delete mode 100644 package/luacrypto/luacrypto.mk

diff --git a/Config.in.legacy b/Config.in.legacy
index 59d8bf25fc..79d74080e2 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,12 @@ endif
 
 comment "Legacy options removed in 2019.02"
 
+config BR2_PACKAGE_LUACRYPTO
+	bool "luacrypto package removed"
+	select BR2_LEGACY
+	help
+	  The luacrypto package was removed. Consider luaossl instead.
+
 config BR2_PACKAGE_TN5250
 	bool "tn5250 package removed"
 	select BR2_LEGACY
diff --git a/DEVELOPERS b/DEVELOPERS
index 59e1f32ba9..8e713f2d63 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -215,7 +215,6 @@ F:	package/ti-cgt-pru/
 N:	Assaf Inbal <shmuelzon@gmail.com>
 F:	package/lbase64/
 F:	package/luabitop/
-F:	package/luacrypto/
 F:	package/luaexpatutils/
 F:	package/luaposix/
 F:	package/luasec/
diff --git a/package/Config.in b/package/Config.in
index 6273ea8197..222857ad18 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -631,7 +631,6 @@ menu "Lua libraries/modules"
 	source "package/lua-testmore/Config.in"
 	source "package/lua-utf8/Config.in"
 	source "package/luabitop/Config.in"
-	source "package/luacrypto/Config.in"
 	source "package/luadbi/Config.in"
 	source "package/luadbi-sqlite3/Config.in"
 	source "package/luaexpat/Config.in"
diff --git a/package/luacrypto/Config.in b/package/luacrypto/Config.in
deleted file mode 100644
index cc5a8803a5..0000000000
--- a/package/luacrypto/Config.in
+++ /dev/null
@@ -1,11 +0,0 @@
-config BR2_PACKAGE_LUACRYPTO
-	bool "luacrypto"
-	select BR2_PACKAGE_OPENSSL
-	help
-	  LuaCrypto provides a Lua frontend to the OpenSSL cryptographic
-	  library.
-	  The OpenSSL features that are currently exposed are digests
-	  (MD5, SHA-1, HMAC, and more) and crypto-grade random number
-	  generators communication.
-
-	  http://mkottman.github.com/luacrypto/
diff --git a/package/luacrypto/luacrypto.hash b/package/luacrypto/luacrypto.hash
deleted file mode 100644
index 5d600b0547..0000000000
--- a/package/luacrypto/luacrypto.hash
+++ /dev/null
@@ -1,3 +0,0 @@
-# computed by luarocks/buildroot
-sha256 dc935c923b8851208d5d504b343448a9d5bd3e537bb8657875f12d72155600b8  luacrypto-0.3.2-1.src.rock
-sha256 f97651bcb248dff32f121ef7a904617b9252d80f4b911e4476806c512a268fa9  luacrypto-0.3.2/COPYING
diff --git a/package/luacrypto/luacrypto.mk b/package/luacrypto/luacrypto.mk
deleted file mode 100644
index b6dbb9999f..0000000000
--- a/package/luacrypto/luacrypto.mk
+++ /dev/null
@@ -1,12 +0,0 @@
-################################################################################
-#
-# luacrypto
-#
-################################################################################
-
-LUACRYPTO_VERSION = 0.3.2-1
-LUACRYPTO_LICENSE = MIT
-LUACRYPTO_LICENSE_FILES = $(LUACRYPTO_SUBDIR)/COPYING
-LUACRYPTO_DEPENDENCIES = openssl
-
-$(eval $(luarocks-package))
-- 
2.11.0
