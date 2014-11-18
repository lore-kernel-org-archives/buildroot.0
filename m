From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 18 Nov 2014 22:02:48 +0100
Subject: [Buildroot] [git commit] package/nodejs: fix build error without
	OpenSSL support
Message-ID: <20141118210654.8FE6DB48EA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=3bc199871e577827b2daad71c1734e3e7e317078
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add a patch to fix broken build of nodejs without OpenSSL support.

Version 0.10.33 of nodejs introduced a bug which prevents us from building
nodejs without OpenSSL support. The bug is reported upstream:
https://github.com/joyent/node/issues/8676

This bug caused some build errors:
  * http://autobuild.buildroot.net/results/0bf/0bf17bf710db051d491123482c90f2f72810804b/
  * http://autobuild.buildroot.net/results/e1f/e1fb34818ff1167aa008b4011befb9fd14c81293/

and more...

Signed-off-by: J??rg Krause <jkrause@posteo.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...4-fix-build-error-without-OpenSSL-support.patch |   54 ++++++++++++++++++++
 1 files changed, 54 insertions(+), 0 deletions(-)

diff --git a/package/nodejs/nodejs-0004-fix-build-error-without-OpenSSL-support.patch b/package/nodejs/nodejs-0004-fix-build-error-without-OpenSSL-support.patch
new file mode 100644
index 0000000..9d41516
--- /dev/null
+++ b/package/nodejs/nodejs-0004-fix-build-error-without-OpenSSL-support.patch
@@ -0,0 +1,54 @@
+From d9acdddb42aef48a9504368019beb1ad91c9a0c4 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?J=C3=B6rg=20Krause?= <jkrause@posteo.de>
+Date: Mon, 17 Nov 2014 12:34:05 +0100
+Subject: [PATCH 1/1] src/node.cc: fix build error without OpenSSL support
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Signed-off-by: J??rg Krause <jkrause@posteo.de>
+---
+ src/node.cc | 5 ++++-
+ 1 file changed, 4 insertions(+), 1 deletion(-)
+
+diff --git a/src/node.cc b/src/node.cc
+index 18c743f..cb77f08 100644
+--- a/src/node.cc
++++ b/src/node.cc
+@@ -82,7 +82,6 @@ typedef int mode_t;
+ #include "node_script.h"
+ #include "v8_typed_array.h"
+ 
+-#include "node_crypto.h"
+ #include "util.h"
+ 
+ using namespace v8;
+@@ -2544,8 +2543,10 @@ static void PrintHelp() {
+          "  --trace-deprecation  show stack traces on deprecations\n"
+          "  --v8-options         print v8 command line options\n"
+          "  --max-stack-size=val set max v8 stack size (bytes)\n"
++#if HAVE_OPENSSL
+          "  --enable-ssl2        enable ssl2\n"
+          "  --enable-ssl3        enable ssl3\n"
++#endif
+          "\n"
+          "Environment variables:\n"
+ #ifdef _WIN32
+@@ -2579,12 +2580,14 @@ static void ParseArgs(int argc, char **argv) {
+       p = 1 + strchr(arg, '=');
+       max_stack_size = atoi(p);
+       argv[i] = const_cast<char*>("");
++#if HAVE_OPENSSL
+     } else if (strcmp(arg, "--enable-ssl2") == 0) {
+       SSL2_ENABLE = true;
+       argv[i] = const_cast<char*>("");
+     } else if (strcmp(arg, "--enable-ssl3") == 0) {
+       SSL3_ENABLE = true;
+       argv[i] = const_cast<char*>("");
++#endif
+     } else if (strcmp(arg, "--help") == 0 || strcmp(arg, "-h") == 0) {
+       PrintHelp();
+       exit(0);
+-- 
+2.1.3
+
