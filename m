From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 23 Nov 2018 11:10:56 +0100
Subject: [Buildroot] [git commit] package/luvi: add patch to fix build issue
Message-ID: <20181202071557.8DDB681583@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a9293fd786eb19e3bcb10bef2d2249c4832d3e91
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since bumping luv from version 1.9.1 to 1.22.0, building luvi fails, as
"luv.h" now includes "compat-5.3.h", which is locally shipped as a
dependency to lua-compat-5.3.

Fixing the issue reveals, that luvi is using `luaL_newlib` which is not
available in the Lua 5.1 API. Building luvi with luv 1.9.1 was not an
issue before, because luv 1.9.1 defined `luaL_newlib` in luv.h, which
was removed in 1.22.0 in favour of using lua-compat-5.3.

Therefore, add a patch which defines `luaL_newlib` in luvi.h.

Signed-off-by: J??rg Krause <joerg.krause@embedded.rocks>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...issing-define-for-luaL_newlib-for-Lua-5.1.patch | 61 ++++++++++++++++++++++
 1 file changed, 61 insertions(+)

diff --git a/package/luvi/0001-Add-missing-define-for-luaL_newlib-for-Lua-5.1.patch b/package/luvi/0001-Add-missing-define-for-luaL_newlib-for-Lua-5.1.patch
new file mode 100644
index 0000000000..903b9d6a69
--- /dev/null
+++ b/package/luvi/0001-Add-missing-define-for-luaL_newlib-for-Lua-5.1.patch
@@ -0,0 +1,61 @@
+From 7f9fcbd827295df72b15466fd3c47589d52117b9 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
+Date: Wed, 31 Oct 2018 18:22:31 +0100
+Subject: [PATCH] Add missing define for luaL_newlib for Lua 5.1
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Since commit c286f3b741d0968fd1c49c28da83bc723468ecba, which bumped the
+library luv to version 1.22.0-1, building luvi fails.
+
+The reason for this error is, that instead of defining Lua 5.3 API itself,
+luv now [1] uses lua-compat-5.3 [1,2] for providing a Lua 5.3 API.
+
+Unfortunately, upstreams "luv.h" now exposes "compat-5.3.h" directly, causing
+redefinition errors when building luvi 2.7.6 (as well as latest release 2.8.0)
+with luv 1.22.0-1. Instead, "compat-5.3.h" should only be included in "luv.c",
+which is addressed in patching luv (Patch: "Do not include compat-5.3.h in luv
+header file").
+
+Patching luv reveals an issue in luvi itself, as it is using the Lua 5.3 API,
+without defining the Lua 5.3 itself, nor using lua-compat-5.3. Instead, it was
+using the definition provided by the "luv.h" file in luv versions before 1.22.0.
+
+Correctly, luvi should define the necessary Lua 5.3 itself, which is done by
+this patch, by providing a definition for `luaL_newlib`.
+
+Note, that this patch is not upstreamable, as upstream already switched to
+using lua-compat-5.3 [3,4]. However, backporting this patch set is to much of a
+burden, so we keep it simple, by just defining `luaL_newlib`.
+
+[1] https://github.com/luvit/luv/commit/34ada3e1d75796d2295ec54f3f20b3e2abf93406
+[2] https://github.com/keplerproject/lua-compat-5.3
+[3] https://github.com/luvit/luvi/commit/3a444d183d2fde91b6c2f3798b37881cdaa29691
+[4] https://github.com/luvit/luvi/commit/0376894bae7c1c3bee42ddad65e824da9cccdada
+
+Signed-off-by: J??rg Krause <joerg.krause@embedded.rocks>
+---
+ src/luvi.h | 6 ++++++
+ 1 file changed, 6 insertions(+)
+
+diff --git a/src/luvi.h b/src/luvi.h
+index e7558b3..ceca2b9 100644
+--- a/src/luvi.h
++++ b/src/luvi.h
+@@ -52,6 +52,12 @@ int luaopen_lpeg(lua_State* L);
+ #endif
+ #endif
+ 
++#if LUA_VERSION_NUM < 502
++#ifndef luaL_newlib
++# define luaL_newlib(L,l) (lua_newtable(L), luaL_register(L,NULL,l))
++#endif
++#endif
++
+ #if (LUA_VERSION_NUM >= 502)
+ # undef luaL_register
+ # define luaL_register(L,n,f) \
+-- 
+2.19.1
+
