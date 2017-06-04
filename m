From: Martin Bark <martin@barkynet.com>
Date: Sun,  4 Jun 2017 23:16:01 +0100
Subject: [Buildroot] [PATCH 1/1] package/nodejs: bump version to 8.0.0
Message-ID: <1496614561-15136-1-git-send-email-martin@barkynet.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

See https://nodejs.org/en/blog/release/v8.0.0/

Signed-off-by: Martin Bark <martin@barkynet.com>
---
 .../nodejs/0002-add-missing-stdarg-includes.patch  | 34 ++++++++++++++++
 ...-HAVE_OPENSSL-directive-to-openssl_config.patch | 47 ----------------------
 package/nodejs/nodejs.hash                         |  4 +-
 package/nodejs/nodejs.mk                           |  2 +-
 4 files changed, 37 insertions(+), 50 deletions(-)
 create mode 100644 package/nodejs/0002-add-missing-stdarg-includes.patch
 delete mode 100644 package/nodejs/0002-src-add-HAVE_OPENSSL-directive-to-openssl_config.patch

diff --git a/package/nodejs/0002-add-missing-stdarg-includes.patch b/package/nodejs/0002-add-missing-stdarg-includes.patch
new file mode 100644
index 0000000..d3af3a8
--- /dev/null
+++ b/package/nodejs/0002-add-missing-stdarg-includes.patch
@@ -0,0 +1,34 @@
+From fa4d8468907aa41cb08964e82eb3c7d82a7270bf Mon Sep 17 00:00:00 2001
+From: Martin Bark <martin@barkynet.com>
+Date: Sun, 4 Jun 2017 23:11:54 +0100
+Subject: [PATCH] add missing stdarg includes
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Fixes error when using uclibc
+../deps/v8/src/wasm/wasm-result.h:118:70: error: ?va_list? has not been declared
+
+This has been fixed upstream in v8, see
+https://codereview.chromium.org/2780913002
+
+Signed-off-by: Martin Bark <martin@barkynet.com>
+---
+ deps/v8/src/wasm/wasm-result.h | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/deps/v8/src/wasm/wasm-result.h b/deps/v8/src/wasm/wasm-result.h
+index 004ac22..eac307c 100644
+--- a/deps/v8/src/wasm/wasm-result.h
++++ b/deps/v8/src/wasm/wasm-result.h
+@@ -5,6 +5,7 @@
+ #ifndef V8_WASM_RESULT_H_
+ #define V8_WASM_RESULT_H_
+ 
++#include <cstdarg>
+ #include <memory>
+ 
+ #include "src/base/compiler-specific.h"
+-- 
+2.7.4
+
diff --git a/package/nodejs/0002-src-add-HAVE_OPENSSL-directive-to-openssl_config.patch b/package/nodejs/0002-src-add-HAVE_OPENSSL-directive-to-openssl_config.patch
deleted file mode 100644
index c28b967..0000000
--- a/package/nodejs/0002-src-add-HAVE_OPENSSL-directive-to-openssl_config.patch
+++ /dev/null
@@ -1,47 +0,0 @@
-From bfc6d25318e3bbf3d9c0389b33ad45ae1bc401f0 Mon Sep 17 00:00:00 2001
-From: Daniel Bevenius <daniel.bevenius@gmail.com>
-Date: Tue, 28 Feb 2017 20:04:12 +0100
-Subject: [PATCH] src: add HAVE_OPENSSL directive to openssl_config
-
-Currently when building with the following configuration options:
-$ ./configure --without-ssl && make
-
-The following link error is reported:
-
-Undefined symbols for architecture x86_64:
-  "node::openssl_config", referenced from:
-      node::Init(int*, char const**, int*, char const***) in node.o
-ld: symbol(s) not found for architecture x86_64
-clang: error: linker command failed with exit code 1 (use -v to see
-invocation)
-
-Adding an HAVE_OPENSSL directive around this code allows the build to
-pass.
-
-PR-URL: https://github.com/nodejs/node/pull/11618
-Reviewed-By: Anna Henningsen <anna@addaleax.net>
-Reviewed-By: James M Snell <jasnell@gmail.com>
-Reviewed-By: Colin Ihrig <cjihrig@gmail.com>
-Reviewed-By: Ben Noordhuis <info@bnoordhuis.nl>
-Reviewed-By: Sam Roberts <vieuxtech@gmail.com>
-[Martin: patch from https://github.com/nodejs/node/pull/11734]
-Signed-off-by: Martin Bark <martin@barkynet.com>
----
- src/node.cc | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/src/node.cc b/src/node.cc
-index 35d29bd..68362a7 100644
---- a/src/node.cc
-+++ b/src/node.cc
-@@ -4203,8 +4203,10 @@ void Init(int* argc,
-         SafeGetenv("NODE_PRESERVE_SYMLINKS", &text) && text[0] == '1';
-   }
- 
-+#if HAVE_OPENSSL
-   if (openssl_config.empty())
-     SafeGetenv("OPENSSL_CONF", &openssl_config);
-+#endif
- 
-   // Parse a few arguments which are specific to Node.
-   int v8_argc;
diff --git a/package/nodejs/nodejs.hash b/package/nodejs/nodejs.hash
index 73869e9..0246ce0 100644
--- a/package/nodejs/nodejs.hash
+++ b/package/nodejs/nodejs.hash
@@ -1,2 +1,2 @@
-# From upstream URL: http://nodejs.org/dist/v7.10.0/SHASUMS256.txt
-sha256  dc34dd15524ba821ffcae7b245eabe8631e2614d5e3cb8ff08fbfdadf5919f21  node-v7.10.0.tar.xz
+# From upstream URL: http://nodejs.org/dist/v8.0.0/SHASUMS256.txt
+sha256  258d3aa3632bbbf2a447c5d524bd7074e23aa26e2b698774ff452954f6174f1c  node-v8.0.0.tar.xz
diff --git a/package/nodejs/nodejs.mk b/package/nodejs/nodejs.mk
index 05c42ab..90ca722 100644
--- a/package/nodejs/nodejs.mk
+++ b/package/nodejs/nodejs.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NODEJS_VERSION = 7.10.0
+NODEJS_VERSION = 8.0.0
 NODEJS_SOURCE = node-v$(NODEJS_VERSION).tar.xz
 NODEJS_SITE = http://nodejs.org/dist/v$(NODEJS_VERSION)
 NODEJS_DEPENDENCIES = host-python host-nodejs zlib \
-- 
2.7.4
