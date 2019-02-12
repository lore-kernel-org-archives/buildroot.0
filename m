From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
Date: Tue, 12 Feb 2019 09:33:51 +0100
Subject: [Buildroot] [PATCH] package/luv: bump to version 1.25.0-0
Message-ID: <20190212083351.376-1-joerg.krause@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Remove upstream patch which is included in the new release.

Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
---
 ...lude-compat-5.3.h-in-luv-header-file.patch | 62 -------------------
 package/luv/luv.hash                          |  2 +-
 package/luv/luv.mk                            |  2 +-
 3 files changed, 2 insertions(+), 64 deletions(-)
 delete mode 100644 package/luv/0001-Do-not-include-compat-5.3.h-in-luv-header-file.patch

diff --git a/package/luv/0001-Do-not-include-compat-5.3.h-in-luv-header-file.patch b/package/luv/0001-Do-not-include-compat-5.3.h-in-luv-header-file.patch
deleted file mode 100644
index 22428c98f7..0000000000
--- a/package/luv/0001-Do-not-include-compat-5.3.h-in-luv-header-file.patch
+++ /dev/null
@@ -1,62 +0,0 @@
-From 0b541b828142dab6c23b0f4415dd2fd052d69ff1 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
-Date: Wed, 31 Oct 2018 18:14:18 +0100
-Subject: [PATCH] Do not include compat-5.3.h in luv header file
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Do not include compat-5.3.h in luv header file
-
-Exposing the compat-5.3.h header file directly in the luv.h header file
-is not a good idea, because it causes redefinition errors when building,
-for example latest luvi version 2.8.0, with a shared luv library and
-LuaJIT 2.0.5.
-
-Therefore, include the compat header file in the luv.c source file.
-
-Note, that luvi version 2.8.0 (and 2.7.6) still fails to build against the
-shared luv library using LuaJIT 2.0.5, as it does use `luaL_newlib` which is
-not available in Lua 5.1. However, this is unrelated to the luv library as
-luvi itself should define the macro for Lua 5.1.
-
-Upstream status: https://github.com/luvit/luv/pull/310
-
-Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
----
- src/luv.c | 3 +++
- src/luv.h | 4 ----
- 2 files changed, 3 insertions(+), 4 deletions(-)
-
-diff --git a/src/luv.c b/src/luv.c
-index c4c7cb7..4af7582 100644
---- a/src/luv.c
-+++ b/src/luv.c
-@@ -15,6 +15,9 @@
-  *
-  */
- 
-+#if (LUA_VERSION_NUM != 503)
-+#include "c-api/compat-5.3.h"
-+#endif
- #include "luv.h"
- #include "util.c"
- #include "lhandle.c"
-diff --git a/src/luv.h b/src/luv.h
-index 27c8c94..4fedd3f 100644
---- a/src/luv.h
-+++ b/src/luv.h
-@@ -50,10 +50,6 @@
- #define MAX_TITLE_LENGTH (8192)
- #endif
- 
--#if (LUA_VERSION_NUM != 503)
--#include "c-api/compat-5.3.h"
--#endif
--
- #if defined(__clang__)
- #pragma clang diagnostic push
- #pragma clang diagnostic ignored "-Wunused-function"
--- 
-2.19.1
-
diff --git a/package/luv/luv.hash b/package/luv/luv.hash
index 24440bef8e..125e7c5f03 100644
--- a/package/luv/luv.hash
+++ b/package/luv/luv.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 27886acb3d3f531a3d6ca70360d2593ddf1a8d4daf94ca3beea14d9381227ff7  luv-1.22.0-1.tar.gz
+sha256 6003b271170a6cef1056725f3a3b9faf56e7ebf83f1d1cc05e272be808a46206  luv-1.25.0-0.tar.gz
 sha256 cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE.txt
diff --git a/package/luv/luv.mk b/package/luv/luv.mk
index 87158b72ed..4901088a3d 100644
--- a/package/luv/luv.mk
+++ b/package/luv/luv.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LUV_VERSION = 1.22.0-1
+LUV_VERSION = 1.25.0-0
 LUV_SITE = https://github.com/luvit/luv/releases/download/$(LUV_VERSION)
 LUV_LICENSE = Apache-2.0
 LUV_LICENSE_FILES = LICENSE.txt
-- 
2.20.1
