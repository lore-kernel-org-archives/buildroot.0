From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Wed, 20 Feb 2019 22:21:22 +0100
Subject: [Buildroot] [git commit] package/luvi: bump to version 2.9.0 to fix
 build with OpenSSL 1.1.1a
Message-ID: <20190220211927.2FFBA8C609@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=040ab815554267753779d4ed53e82c78f48f182e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Bump to latest release that bundles lua-openssl 0.7.4 to fix compatibility
with OpenSSL 1.1.1a.

Drop patches 0001 and 0002 that are included in the new release.

Successfully build and runtime tested on Banana Pro, note that version string
for lua-openssl does not match the tag name (0.7.4):

```
luvi v2.9.0
zlib: 1.2.11
libuv: 1.25.0
ssl: OpenSSL 1.1.1a  20 Nov 2018, lua-openssl 0.7.3
```

Fixes:
http://autobuild.buildroot.net/results/e87994a3dc987f5aa101a5e721ac927e21453373
http://autobuild.buildroot.net/results/ea725ad90cfcd3c5e242268a593dcabd7297fe70
http://autobuild.buildroot.net/results/f2fb9eea0044e4a5f674742d29ea95af49cf5a45
http://autobuild.buildroot.net/results/de4daa1b930f907f06640dc98a708016217ddea5
.. and many more.

Signed-off-by: J??rg Krause <joerg.krause@embedded.rocks>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 ...issing-define-for-luaL_newlib-for-Lua-5.1.patch | 61 ----------------------
 ...2-luvi-executable-needs-to-export-symbols.patch | 53 -------------------
 package/luvi/luvi.hash                             |  2 +-
 package/luvi/luvi.mk                               |  4 +-
 4 files changed, 2 insertions(+), 118 deletions(-)

diff --git a/package/luvi/0001-Add-missing-define-for-luaL_newlib-for-Lua-5.1.patch b/package/luvi/0001-Add-missing-define-for-luaL_newlib-for-Lua-5.1.patch
deleted file mode 100644
index 903b9d6a69..0000000000
--- a/package/luvi/0001-Add-missing-define-for-luaL_newlib-for-Lua-5.1.patch
+++ /dev/null
@@ -1,61 +0,0 @@
-From 7f9fcbd827295df72b15466fd3c47589d52117b9 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
-Date: Wed, 31 Oct 2018 18:22:31 +0100
-Subject: [PATCH] Add missing define for luaL_newlib for Lua 5.1
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Since commit c286f3b741d0968fd1c49c28da83bc723468ecba, which bumped the
-library luv to version 1.22.0-1, building luvi fails.
-
-The reason for this error is, that instead of defining Lua 5.3 API itself,
-luv now [1] uses lua-compat-5.3 [1,2] for providing a Lua 5.3 API.
-
-Unfortunately, upstreams "luv.h" now exposes "compat-5.3.h" directly, causing
-redefinition errors when building luvi 2.7.6 (as well as latest release 2.8.0)
-with luv 1.22.0-1. Instead, "compat-5.3.h" should only be included in "luv.c",
-which is addressed in patching luv (Patch: "Do not include compat-5.3.h in luv
-header file").
-
-Patching luv reveals an issue in luvi itself, as it is using the Lua 5.3 API,
-without defining the Lua 5.3 itself, nor using lua-compat-5.3. Instead, it was
-using the definition provided by the "luv.h" file in luv versions before 1.22.0.
-
-Correctly, luvi should define the necessary Lua 5.3 itself, which is done by
-this patch, by providing a definition for `luaL_newlib`.
-
-Note, that this patch is not upstreamable, as upstream already switched to
-using lua-compat-5.3 [3,4]. However, backporting this patch set is to much of a
-burden, so we keep it simple, by just defining `luaL_newlib`.
-
-[1] https://github.com/luvit/luv/commit/34ada3e1d75796d2295ec54f3f20b3e2abf93406
-[2] https://github.com/keplerproject/lua-compat-5.3
-[3] https://github.com/luvit/luvi/commit/3a444d183d2fde91b6c2f3798b37881cdaa29691
-[4] https://github.com/luvit/luvi/commit/0376894bae7c1c3bee42ddad65e824da9cccdada
-
-Signed-off-by: J??rg Krause <joerg.krause@embedded.rocks>
----
- src/luvi.h | 6 ++++++
- 1 file changed, 6 insertions(+)
-
-diff --git a/src/luvi.h b/src/luvi.h
-index e7558b3..ceca2b9 100644
---- a/src/luvi.h
-+++ b/src/luvi.h
-@@ -52,6 +52,12 @@ int luaopen_lpeg(lua_State* L);
- #endif
- #endif
- 
-+#if LUA_VERSION_NUM < 502
-+#ifndef luaL_newlib
-+# define luaL_newlib(L,l) (lua_newtable(L), luaL_register(L,NULL,l))
-+#endif
-+#endif
-+
- #if (LUA_VERSION_NUM >= 502)
- # undef luaL_register
- # define luaL_register(L,n,f) \
--- 
-2.19.1
-
diff --git a/package/luvi/0002-luvi-executable-needs-to-export-symbols.patch b/package/luvi/0002-luvi-executable-needs-to-export-symbols.patch
deleted file mode 100644
index 74b6537f9b..0000000000
--- a/package/luvi/0002-luvi-executable-needs-to-export-symbols.patch
+++ /dev/null
@@ -1,53 +0,0 @@
-From 1ea2c1e372ab59b9a633a51f0dcefc24328528f1 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
-Date: Mon, 10 Sep 2018 08:18:38 +0200
-Subject: [PATCH] luvi executable needs to export symbols
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Using CMake 3.12 running luvi fails with:
-
-```
-[string "return require('init')(...)"]:1: module 'init' not found:
-	no field package.preload['init']
-	no file './init.lua'
-	no file '/usr/share/luajit-2.0.5/init.lua'
-	no file '/usr/local/share/lua/5.1/init.lua'
-	no file '/usr/local/share/lua/5.1/init/init.lua'
-	no file '/usr/share/lua/5.1/init.lua'
-	no file '/usr/share/lua/5.1/init/init.lua'
-	no file './init.so'
-	no file '/usr/local/lib/lua/5.1/init.so'
-	no file '/usr/lib/lua/5.1/init.so'
-	no file '/usr/local/lib/lua/5.1/loadall.so'
-```
-
-Looking at link.txt for the luvi executable shows that `-rdynamic` is
-not set anymore in CMake 3.12. This has the effect, that symbols are
-missing in the `.dynsym` section.
-
-Therefore, set `ENABLE_EXPORTS` to true which set `-rdynamic` explicitly.
-
-Upstream status: b8781653dcb8815a3019a77baf4f3b7f7a255ebe
-
-Signed-off-by: J??rg Krause <joerg.krause@embedded.rocks>
----
- CMakeLists.txt | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index e141f8e..8219d0b 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -158,6 +158,7 @@ if("${CMAKE_SYSTEM_NAME}" MATCHES "Linux")
- endif()
- 
- target_link_libraries(luvi ${LUVI_LIBRARIES} ${EXTRA_LIBS} ${CMAKE_THREAD_LIBS_INIT})
-+set_target_properties(luvi PROPERTIES ENABLE_EXPORTS ON)
- 
- ###############################################################################
- ## Installation Targets
--- 
-2.19.1
-
diff --git a/package/luvi/luvi.hash b/package/luvi/luvi.hash
index 22e5cfa7bf..084f3a42cd 100644
--- a/package/luvi/luvi.hash
+++ b/package/luvi/luvi.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  ce9a1fb762e61267618ddea9ea129170fd543bb918c382b71cb35985d0024c42  luvi-src-v2.7.6.tar.gz
+sha256  81e898dc67b8166222716f763d8d0e0307132edc999167259d28ad0b54e20a7f  luvi-src-v2.9.0.tar.gz
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE.txt
diff --git a/package/luvi/luvi.mk b/package/luvi/luvi.mk
index 4b693e23a2..c43033f4f3 100644
--- a/package/luvi/luvi.mk
+++ b/package/luvi/luvi.mk
@@ -4,9 +4,7 @@
 #
 ################################################################################
 
-# we keep version 2.7.6 because 2.8.0 causes build errors and only
-# contains updates to submodules we do not need
-LUVI_VERSION = v2.7.6
+LUVI_VERSION = v2.9.0
 LUVI_SOURCE = luvi-src-$(LUVI_VERSION).tar.gz
 LUVI_SITE = https://github.com/luvit/luvi/releases/download/$(LUVI_VERSION)
 LUVI_LICENSE = Apache-2.0
