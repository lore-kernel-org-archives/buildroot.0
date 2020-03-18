From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
Date: Wed, 18 Mar 2020 09:02:57 +0100
Subject: [Buildroot] [PATCH 1/1] package/luv: bump to version 1.34.2-2
Message-ID: <20200318080257.7268-1-joerg.krause@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Drop pathch 0001 which was applied upstream.

Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
---
 ...01-src-lreq.c-fix-build-with-gcc-4.8.patch | 43 -------------------
 package/luv/luv.hash                          |  2 +-
 package/luv/luv.mk                            |  2 +-
 3 files changed, 2 insertions(+), 45 deletions(-)
 delete mode 100644 package/luv/0001-src-lreq.c-fix-build-with-gcc-4.8.patch

diff --git a/package/luv/0001-src-lreq.c-fix-build-with-gcc-4.8.patch b/package/luv/0001-src-lreq.c-fix-build-with-gcc-4.8.patch
deleted file mode 100644
index 7f7c480ca5..0000000000
--- a/package/luv/0001-src-lreq.c-fix-build-with-gcc-4.8.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-From d05134115ec8fcfc87188899cec336a8b4df7e62 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Sat, 22 Feb 2020 22:17:19 +0100
-Subject: [PATCH] src/lreq.c: fix build with gcc 4.8
-
-Since commit 3e34390cc15101d7fc46ea26f5adf9ac022c2029, build fails with
-gcc 4.8.3 on:
-
-In file included from /usr/lfs/hdd_v1/rc-buildroot-test/scripts/instance-0/output/build/luv-1.34.1-1/src/luv.c:27:0:
-/usr/lfs/hdd_v1/rc-buildroot-test/scripts/instance-0/output/build/luv-1.34.1-1/src/lreq.c: In function 'luv_cleanup_req':
-/usr/lfs/hdd_v1/rc-buildroot-test/scripts/instance-0/output/build/luv-1.34.1-1/src/lreq.c:70:5: error: 'for' loop initial declarations are only allowed in C99 mode
-     for (int i = 0; ((int*)(data->data))[i] != LUA_NOREF; i++) {
-     ^
-
-Fixes:
- - http://autobuild.buildroot.org/results/83b34e606b128546da8a70836d039090e334a1ec
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Accepted status: https://github.com/luvit/luv/pull/456]
----
- src/lreq.c | 3 ++-
- 1 file changed, 2 insertions(+), 1 deletion(-)
-
-diff --git a/src/lreq.c b/src/lreq.c
-index c8e07eb..b12ec4f 100644
---- a/src/lreq.c
-+++ b/src/lreq.c
-@@ -64,10 +64,11 @@ static void luv_fulfill_req(lua_State* L, luv_req_t* data, int nargs) {
- }
- 
- static void luv_cleanup_req(lua_State* L, luv_req_t* data) {
-+  int i;
-   luaL_unref(L, LUA_REGISTRYINDEX, data->req_ref);
-   luaL_unref(L, LUA_REGISTRYINDEX, data->callback_ref);
-   if (data->data_ref == LUV_REQ_MULTIREF) {
--    for (int i = 0; ((int*)(data->data))[i] != LUA_NOREF; i++) {
-+    for (i = 0; ((int*)(data->data))[i] != LUA_NOREF; i++) {
-       luaL_unref(L, LUA_REGISTRYINDEX, ((int*)(data->data))[i]);
-     }
-   }
--- 
-2.25.0
-
diff --git a/package/luv/luv.hash b/package/luv/luv.hash
index 388bba9ebd..f41325c8c5 100644
--- a/package/luv/luv.hash
+++ b/package/luv/luv.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 e8267a65149a16ea279bc767c554b1441f8b52ec5ee48fe7d60b3f4106592aba  luv-1.34.1-1.tar.gz
+sha256 7aff212985527248522411c3830234fe7b5e98593a4cc439b962c17da46681d5  luv-1.34.2-2.tar.gz
 sha256 cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE.txt
diff --git a/package/luv/luv.mk b/package/luv/luv.mk
index c1af508562..d028519fe7 100644
--- a/package/luv/luv.mk
+++ b/package/luv/luv.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LUV_VERSION = 1.34.1-1
+LUV_VERSION = 1.34.2-2
 LUV_SITE = https://github.com/luvit/luv/releases/download/$(LUV_VERSION)
 LUV_LICENSE = Apache-2.0
 LUV_LICENSE_FILES = LICENSE.txt
-- 
2.25.2
