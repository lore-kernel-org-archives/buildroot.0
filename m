From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 12 Dec 2015 18:27:51 +0100
Subject: [Buildroot] [git commit] package/nodejs: bump 0.10.x branch to
	version 0.10.41
Message-ID: <20151212173106.72FCF80ACA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=5cff6a83c66eff671831cb5fc6b9c96a4199677f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Also remove a patch applied upstream.

Signed-off-by: J??rg Krause <joerg.krause@embedded.rocks>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...4-fix-build-error-without-OpenSSL-support.patch | 54 ----------------------
 .../0001-remove-python-bz2-dependency.patch        |  0
 .../0002-gyp-force-link-command-to-use-CXX.patch   |  0
 .../0003-use-python-variable.patch                 |  0
 .../0004-fix-musl-USE-MISC-build-issue.patch}      |  0
 package/nodejs/Config.in                           |  4 +-
 package/nodejs/nodejs.hash                         |  4 +-
 7 files changed, 4 insertions(+), 58 deletions(-)

diff --git a/package/nodejs/0.10.40/0004-fix-build-error-without-OpenSSL-support.patch b/package/nodejs/0.10.40/0004-fix-build-error-without-OpenSSL-support.patch
deleted file mode 100644
index 9d41516..0000000
--- a/package/nodejs/0.10.40/0004-fix-build-error-without-OpenSSL-support.patch
+++ /dev/null
@@ -1,54 +0,0 @@
-From d9acdddb42aef48a9504368019beb1ad91c9a0c4 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?J=C3=B6rg=20Krause?= <jkrause@posteo.de>
-Date: Mon, 17 Nov 2014 12:34:05 +0100
-Subject: [PATCH 1/1] src/node.cc: fix build error without OpenSSL support
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Signed-off-by: J??rg Krause <jkrause@posteo.de>
----
- src/node.cc | 5 ++++-
- 1 file changed, 4 insertions(+), 1 deletion(-)
-
-diff --git a/src/node.cc b/src/node.cc
-index 18c743f..cb77f08 100644
---- a/src/node.cc
-+++ b/src/node.cc
-@@ -82,7 +82,6 @@ typedef int mode_t;
- #include "node_script.h"
- #include "v8_typed_array.h"
- 
--#include "node_crypto.h"
- #include "util.h"
- 
- using namespace v8;
-@@ -2544,8 +2543,10 @@ static void PrintHelp() {
-          "  --trace-deprecation  show stack traces on deprecations\n"
-          "  --v8-options         print v8 command line options\n"
-          "  --max-stack-size=val set max v8 stack size (bytes)\n"
-+#if HAVE_OPENSSL
-          "  --enable-ssl2        enable ssl2\n"
-          "  --enable-ssl3        enable ssl3\n"
-+#endif
-          "\n"
-          "Environment variables:\n"
- #ifdef _WIN32
-@@ -2579,12 +2580,14 @@ static void ParseArgs(int argc, char **argv) {
-       p = 1 + strchr(arg, '=');
-       max_stack_size = atoi(p);
-       argv[i] = const_cast<char*>("");
-+#if HAVE_OPENSSL
-     } else if (strcmp(arg, "--enable-ssl2") == 0) {
-       SSL2_ENABLE = true;
-       argv[i] = const_cast<char*>("");
-     } else if (strcmp(arg, "--enable-ssl3") == 0) {
-       SSL3_ENABLE = true;
-       argv[i] = const_cast<char*>("");
-+#endif
-     } else if (strcmp(arg, "--help") == 0 || strcmp(arg, "-h") == 0) {
-       PrintHelp();
-       exit(0);
--- 
-2.1.3
-
diff --git a/package/nodejs/0.10.40/0001-remove-python-bz2-dependency.patch b/package/nodejs/0.10.41/0001-remove-python-bz2-dependency.patch
similarity index 100%
rename from package/nodejs/0.10.40/0001-remove-python-bz2-dependency.patch
rename to package/nodejs/0.10.41/0001-remove-python-bz2-dependency.patch
diff --git a/package/nodejs/0.10.40/0002-gyp-force-link-command-to-use-CXX.patch b/package/nodejs/0.10.41/0002-gyp-force-link-command-to-use-CXX.patch
similarity index 100%
rename from package/nodejs/0.10.40/0002-gyp-force-link-command-to-use-CXX.patch
rename to package/nodejs/0.10.41/0002-gyp-force-link-command-to-use-CXX.patch
diff --git a/package/nodejs/0.10.40/0003-use-python-variable.patch b/package/nodejs/0.10.41/0003-use-python-variable.patch
similarity index 100%
rename from package/nodejs/0.10.40/0003-use-python-variable.patch
rename to package/nodejs/0.10.41/0003-use-python-variable.patch
diff --git a/package/nodejs/0.10.40/0005-fix-musl-USE-MISC-build-issue.patch b/package/nodejs/0.10.41/0004-fix-musl-USE-MISC-build-issue.patch
similarity index 100%
rename from package/nodejs/0.10.40/0005-fix-musl-USE-MISC-build-issue.patch
rename to package/nodejs/0.10.41/0004-fix-musl-USE-MISC-build-issue.patch
diff --git a/package/nodejs/Config.in b/package/nodejs/Config.in
index 5128901..30b7495 100644
--- a/package/nodejs/Config.in
+++ b/package/nodejs/Config.in
@@ -42,7 +42,7 @@ choice
 	  Select the version of Node.js you wish to use.
 
 config BR2_BR2_PACKAGE_NODEJS_0_10_X
-	bool "v0.10.40"
+	bool "v0.10.41"
 
 config BR2_BR2_PACKAGE_NODEJS_0_12_X
 	bool "v0.12.7"
@@ -61,7 +61,7 @@ endchoice
 
 config BR2_PACKAGE_NODEJS_VERSION_STRING
 	string
-	default "0.10.40"	if BR2_BR2_PACKAGE_NODEJS_0_10_X
+	default "0.10.41"	if BR2_BR2_PACKAGE_NODEJS_0_10_X
 	default "0.12.7"	if BR2_BR2_PACKAGE_NODEJS_0_12_X
 	default "4.1.2"		if BR2_BR2_PACKAGE_NODEJS_4_X
 
diff --git a/package/nodejs/nodejs.hash b/package/nodejs/nodejs.hash
index ab506df..d4e6edb 100644
--- a/package/nodejs/nodejs.hash
+++ b/package/nodejs/nodejs.hash
@@ -1,5 +1,5 @@
-# From upstream URL: http://nodejs.org/dist/v0.10.40/SHASUMS256.txt
-sha256	bae79c2fd959aebe1629af36077bebbb760128db753da226d2344cd91499149f  node-v0.10.40.tar.gz
+# From upstream URL: http://nodejs.org/dist/v0.10.41/SHASUMS256.txt
+sha256	79f694e2a5c42543b75d0c69f6860499d7593136d0f6b59e7163b9e66fb2c995  node-v0.10.41.tar.gz
 
 # From upstream URL: http://nodejs.org/dist/v0.12.7/SHASUMS256.txt
 sha256	b23d64df051c9c969b0c583f802d5d71de342e53067127a5061415be7e12f39d  node-v0.12.7.tar.gz
