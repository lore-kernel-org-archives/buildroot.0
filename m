From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
Date: Tue,  8 Dec 2015 22:18:19 +0100
Subject: [Buildroot] [PATCH 2/3] package/nodejs: bump 0.12.x branch to
	version 0.12.9
In-Reply-To: <1449609500-10071-1-git-send-email-joerg.krause@embedded.rocks>
References: <1449609500-10071-1-git-send-email-joerg.krause@embedded.rocks>
Message-ID: <1449609500-10071-2-git-send-email-joerg.krause@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Patch #4 was applied upstream, however a new bug was introduced which breaks
building nodejs without OpenSSL support. We replace the applied patch with a
new patch to fix:
 error: ?ALLOW_INSECURE_SERVER_DHPARAM? was not declared in this scope
       ALLOW_INSECURE_SERVER_DHPARAM = true;

Patch #4 status: Sent upstream [1]

[1] https://github.com/nodejs/node/pull/4201

Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
---
 ...4-fix-build-error-without-OpenSSL-support.patch | 46 ----------------------
 ...01-Remove-dependency-on-Python-bz2-module.patch |  0
 .../0002-gyp-force-link-command-to-use-CXX.patch   |  0
 ...hon-variable-instead-of-hardcoding-Python.patch |  0
 ...c-fix-build-error-without-OpenSSL-support.patch | 44 +++++++++++++++++++++
 ...or-arm-predefined-macro-in-atomicops_inte.patch |  0
 package/nodejs/Config.in                           |  4 +-
 package/nodejs/nodejs.hash                         |  4 +-
 8 files changed, 48 insertions(+), 50 deletions(-)
 delete mode 100644 package/nodejs/0.12.7/0004-fix-build-error-without-OpenSSL-support.patch
 rename package/nodejs/{0.12.7 => 0.12.9}/0001-Remove-dependency-on-Python-bz2-module.patch (100%)
 rename package/nodejs/{0.12.7 => 0.12.9}/0002-gyp-force-link-command-to-use-CXX.patch (100%)
 rename package/nodejs/{0.12.7 => 0.12.9}/0003-Use-a-python-variable-instead-of-hardcoding-Python.patch (100%)
 create mode 100644 package/nodejs/0.12.9/0004-src-fix-build-error-without-OpenSSL-support.patch
 rename package/nodejs/{0.12.7 => 0.12.9}/0005-Fix-typo-for-arm-predefined-macro-in-atomicops_inte.patch (100%)

diff --git a/package/nodejs/0.12.7/0004-fix-build-error-without-OpenSSL-support.patch b/package/nodejs/0.12.7/0004-fix-build-error-without-OpenSSL-support.patch
deleted file mode 100644
index ccb29b1..0000000
--- a/package/nodejs/0.12.7/0004-fix-build-error-without-OpenSSL-support.patch
+++ /dev/null
@@ -1,46 +0,0 @@
-From 6bfa497dceb83de5257c64da59fbcf6a32d83305 Mon Sep 17 00:00:00 2001
-From: Martin Bark <martin@barkynet.com>
-Date: Tue, 30 Jun 2015 09:45:07 +0100
-Subject: [PATCH 4/4] fix build error without OpenSSL support
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Signed-off-by: J?rg Krause <jkrause@posteo.de>
-[Martin: adapt to 0.12.5]
-Signed-off-by: Martin Bark <martin@barkynet.com>
----
- src/node.cc | 4 ++++
- 1 file changed, 4 insertions(+)
-
-diff --git a/src/node.cc b/src/node.cc
-index e669706..d43b791 100644
---- a/src/node.cc
-+++ b/src/node.cc
-@@ -2934,8 +2934,10 @@ static void PrintHelp() {
-          "                       present.\n"
- #endif
- #endif
-+#if HAVE_OPENSSL
-          "  --enable-ssl2        enable ssl2\n"
-          "  --enable-ssl3        enable ssl3\n"
-+#endif
-          "\n"
-          "Environment variables:\n"
- #ifdef _WIN32
-@@ -3003,10 +3005,12 @@ static void ParseArgs(int* argc,
-     } else if (strcmp(arg, "--version") == 0 || strcmp(arg, "-v") == 0) {
-       printf("%s\n", NODE_VERSION);
-       exit(0);
-+#if HAVE_OPENSSL
-     } else if (strcmp(arg, "--enable-ssl2") == 0) {
-       SSL2_ENABLE = true;
-     } else if (strcmp(arg, "--enable-ssl3") == 0) {
-       SSL3_ENABLE = true;
-+#endif
-     } else if (strcmp(arg, "--help") == 0 || strcmp(arg, "-h") == 0) {
-       PrintHelp();
-       exit(0);
--- 
-2.1.4
-
diff --git a/package/nodejs/0.12.7/0001-Remove-dependency-on-Python-bz2-module.patch b/package/nodejs/0.12.9/0001-Remove-dependency-on-Python-bz2-module.patch
similarity index 100%
rename from package/nodejs/0.12.7/0001-Remove-dependency-on-Python-bz2-module.patch
rename to package/nodejs/0.12.9/0001-Remove-dependency-on-Python-bz2-module.patch
diff --git a/package/nodejs/0.12.7/0002-gyp-force-link-command-to-use-CXX.patch b/package/nodejs/0.12.9/0002-gyp-force-link-command-to-use-CXX.patch
similarity index 100%
rename from package/nodejs/0.12.7/0002-gyp-force-link-command-to-use-CXX.patch
rename to package/nodejs/0.12.9/0002-gyp-force-link-command-to-use-CXX.patch
diff --git a/package/nodejs/0.12.7/0003-Use-a-python-variable-instead-of-hardcoding-Python.patch b/package/nodejs/0.12.9/0003-Use-a-python-variable-instead-of-hardcoding-Python.patch
similarity index 100%
rename from package/nodejs/0.12.7/0003-Use-a-python-variable-instead-of-hardcoding-Python.patch
rename to package/nodejs/0.12.9/0003-Use-a-python-variable-instead-of-hardcoding-Python.patch
diff --git a/package/nodejs/0.12.9/0004-src-fix-build-error-without-OpenSSL-support.patch b/package/nodejs/0.12.9/0004-src-fix-build-error-without-OpenSSL-support.patch
new file mode 100644
index 0000000..62966eb
--- /dev/null
+++ b/package/nodejs/0.12.9/0004-src-fix-build-error-without-OpenSSL-support.patch
@@ -0,0 +1,44 @@
+From ba6142dbaebe06738686da150043abbd1ef1fbf5 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
+Date: Tue, 8 Dec 2015 21:22:45 +0100
+Subject: [PATCH] src: fix build error without OpenSSL support
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+PR #3890 [1] introduced the variable ALLOW_INSECURE_SERVER_DHPARAM defined
+in src/node_crypto.cc. However, if nodejs is built without OpenSSL support,
+the build fails:
+ error: ?ALLOW_INSECURE_SERVER_DHPARAM? was not declared in this scope
+       ALLOW_INSECURE_SERVER_DHPARAM = true;
+
+Fix this by using the preprocessor macro HAVE_OPENSSL to opt-out the use of
+ALLOW_INSECURE_SERVER_DHPARAM in non-OpenSSL builds.
+
+Patch status: Sent upstream [2]
+
+[1] https://github.com/nodejs/node/pull/3890
+[2] https://github.com/nodejs/node/pull/4201
+
+Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
+---
+ src/node.cc | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/src/node.cc b/src/node.cc
+index 1da8328..e5239ac 100644
+--- a/src/node.cc
++++ b/src/node.cc
+@@ -3042,7 +3042,9 @@ static void ParseArgs(int* argc,
+       SSL3_ENABLE = true;
+ #endif
+     } else if (strcmp(arg, "--allow-insecure-server-dhparam") == 0) {
++#if HAVE_OPENSSL
+       ALLOW_INSECURE_SERVER_DHPARAM = true;
++#endif
+     } else if (strcmp(arg, "--help") == 0 || strcmp(arg, "-h") == 0) {
+       PrintHelp();
+       exit(0);
+-- 
+2.6.3
+
diff --git a/package/nodejs/0.12.7/0005-Fix-typo-for-arm-predefined-macro-in-atomicops_inte.patch b/package/nodejs/0.12.9/0005-Fix-typo-for-arm-predefined-macro-in-atomicops_inte.patch
similarity index 100%
rename from package/nodejs/0.12.7/0005-Fix-typo-for-arm-predefined-macro-in-atomicops_inte.patch
rename to package/nodejs/0.12.9/0005-Fix-typo-for-arm-predefined-macro-in-atomicops_inte.patch
diff --git a/package/nodejs/Config.in b/package/nodejs/Config.in
index 30b7495..6ffe1f1 100644
--- a/package/nodejs/Config.in
+++ b/package/nodejs/Config.in
@@ -45,7 +45,7 @@ config BR2_BR2_PACKAGE_NODEJS_0_10_X
 	bool "v0.10.41"
 
 config BR2_BR2_PACKAGE_NODEJS_0_12_X
-	bool "v0.12.7"
+	bool "v0.12.9"
 	depends on BR2_PACKAGE_NODEJS_V8_ARCH_SUPPORTS
 
 config BR2_BR2_PACKAGE_NODEJS_4_X
@@ -62,7 +62,7 @@ endchoice
 config BR2_PACKAGE_NODEJS_VERSION_STRING
 	string
 	default "0.10.41"	if BR2_BR2_PACKAGE_NODEJS_0_10_X
-	default "0.12.7"	if BR2_BR2_PACKAGE_NODEJS_0_12_X
+	default "0.12.9"	if BR2_BR2_PACKAGE_NODEJS_0_12_X
 	default "4.1.2"		if BR2_BR2_PACKAGE_NODEJS_4_X
 
 menu "Module Selection"
diff --git a/package/nodejs/nodejs.hash b/package/nodejs/nodejs.hash
index d4e6edb..800af73 100644
--- a/package/nodejs/nodejs.hash
+++ b/package/nodejs/nodejs.hash
@@ -1,8 +1,8 @@
 # From upstream URL: http://nodejs.org/dist/v0.10.41/SHASUMS256.txt
 sha256	79f694e2a5c42543b75d0c69f6860499d7593136d0f6b59e7163b9e66fb2c995  node-v0.10.41.tar.gz
 
-# From upstream URL: http://nodejs.org/dist/v0.12.7/SHASUMS256.txt
-sha256	b23d64df051c9c969b0c583f802d5d71de342e53067127a5061415be7e12f39d  node-v0.12.7.tar.gz
+# From upstream URL: http://nodejs.org/dist/v0.12.9/SHASUMS256.txt
+sha256	35daad301191e5f8dd7e5d2fbb711d081b82d1837d59837b8ee224c256cfe5e4  node-v0.12.9.tar.gz
 
 # From upstream URL: http://nodejs.org/dist/v4.1.2/SHASUMS256.txt
 sha256  443c8251e812b1f2c4b3e9152a47df23c55567ade739e017e2c0ca0869b71e74  node-v4.1.2.tar.xz
-- 
2.6.3
