From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 6 Sep 2017 22:06:55 +0200
Subject: [Buildroot] [git commit] package/nodejs: bump version to 8.4.0
Message-ID: <20170906200442.49BFA8047F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a4478b7dcd0e037ab51e568790e5e80a79e9a69d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

See https://nodejs.org/en/blog/release/v8.4.0/

An update to v8 6.0.286 has removed the need for mkpeephole and
0002-add-missing-stdarg-includes.patch

Signed-off-by: Martin Bark <martin@barkynet.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../nodejs/0002-add-missing-stdarg-includes.patch  | 34 ----------------------
 package/nodejs/nodejs.hash                         |  4 +--
 package/nodejs/nodejs.mk                           |  7 +----
 3 files changed, 3 insertions(+), 42 deletions(-)

diff --git a/package/nodejs/0002-add-missing-stdarg-includes.patch b/package/nodejs/0002-add-missing-stdarg-includes.patch
deleted file mode 100644
index d3af3a8..0000000
--- a/package/nodejs/0002-add-missing-stdarg-includes.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From fa4d8468907aa41cb08964e82eb3c7d82a7270bf Mon Sep 17 00:00:00 2001
-From: Martin Bark <martin@barkynet.com>
-Date: Sun, 4 Jun 2017 23:11:54 +0100
-Subject: [PATCH] add missing stdarg includes
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Fixes error when using uclibc
-../deps/v8/src/wasm/wasm-result.h:118:70: error: ???va_list??? has not been declared
-
-This has been fixed upstream in v8, see
-https://codereview.chromium.org/2780913002
-
-Signed-off-by: Martin Bark <martin@barkynet.com>
----
- deps/v8/src/wasm/wasm-result.h | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/deps/v8/src/wasm/wasm-result.h b/deps/v8/src/wasm/wasm-result.h
-index 004ac22..eac307c 100644
---- a/deps/v8/src/wasm/wasm-result.h
-+++ b/deps/v8/src/wasm/wasm-result.h
-@@ -5,6 +5,7 @@
- #ifndef V8_WASM_RESULT_H_
- #define V8_WASM_RESULT_H_
- 
-+#include <cstdarg>
- #include <memory>
- 
- #include "src/base/compiler-specific.h"
--- 
-2.7.4
-
diff --git a/package/nodejs/nodejs.hash b/package/nodejs/nodejs.hash
index 6a79f02..a0643b5 100644
--- a/package/nodejs/nodejs.hash
+++ b/package/nodejs/nodejs.hash
@@ -1,2 +1,2 @@
-# From upstream URL: http://nodejs.org/dist/v8.2.1/SHASUMS256.txt
-sha256  02c46d8914540eea73d0ad33bf9f371a28aa0dc8c5d740948491fef044ad8c8b  node-v8.2.1.tar.xz
+# From upstream URL: http://nodejs.org/dist/v8.4.0/SHASUMS256.txt
+sha256  5d5aa2a101dcc617231a475812eb8ed87cac21491f1dcc7997b9dd463563f361  node-v8.4.0.tar.xz
diff --git a/package/nodejs/nodejs.mk b/package/nodejs/nodejs.mk
index 3b80371..3570a8f 100644
--- a/package/nodejs/nodejs.mk
+++ b/package/nodejs/nodejs.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NODEJS_VERSION = 8.2.1
+NODEJS_VERSION = 8.4.0
 NODEJS_SOURCE = node-v$(NODEJS_VERSION).tar.xz
 NODEJS_SITE = http://nodejs.org/dist/v$(NODEJS_VERSION)
 NODEJS_DEPENDENCIES = host-python host-nodejs c-ares \
@@ -82,8 +82,6 @@ define HOST_NODEJS_INSTALL_CMDS
 		$(HOST_CONFIGURE_OPTS) \
 		NO_LOAD=cctest.target.mk \
 		PATH=$(@D)/bin:$(BR_PATH)
-
-	$(INSTALL) -m755 -D $(@D)/out/Release/mkpeephole $(HOST_DIR)/bin/mkpeephole
 endef
 
 ifeq ($(BR2_i386),y)
@@ -131,9 +129,6 @@ define NODEJS_CONFIGURE_CMDS
 		$(if $(NODEJS_MIPS_FPU_MODE),--with-mips-fpu-mode=$(NODEJS_MIPS_FPU_MODE)) \
 		$(NODEJS_CONF_OPTS) \
 	)
-
-	# use host version of mkpeephole
-	sed "s#<(mkpeephole_exec)#$(HOST_DIR)/bin/mkpeephole#g" -i $(@D)/deps/v8/src/v8.gyp
 endef
 
 define NODEJS_BUILD_CMDS
