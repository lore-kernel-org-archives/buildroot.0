From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 23 Nov 2018 11:10:51 +0100
Subject: [Buildroot] [git commit] package/luv: add patch to fix build issue
 with luvi
Message-ID: <20181202071557.85F5C81583@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6239dee485aceacdbb9937da126bf71bf1293495
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add a patch to fix a build issue with luvi after bumping luv from
version 1.9.1 to 1.22.0.

The problem is that luv now uses lua-compat-5.3 instead of defining the
Lua 5.3 API itself. Unfortunately, luv.h now includes compat-5.3.h in the
header file, which causes the build issue with luvi, as luvi does not
find this local header file. Note, that luv ships lua-compat-5.3 as a
dependency.

Therefore, the patch includes compat-5.3.h in the source file luv.c, so
it isn't exposed to external programs.

Fixes:
http://autobuild.buildroot.net/results/2244cd30986aff29b763fb7183f6fc27a82bd7fa
http://autobuild.buildroot.net/results/01938f7f018dc69d564c22489933647b1daf62f3
http://autobuild.buildroot.net/results/8217e863c2776d299cb90b90f1a2ed8233ec82ba
.. and many more

Note, that fixing this issue reveals another issue in luvi, which is
fixed by the follow up patch.

Signed-off-by: J??rg Krause <joerg.krause@embedded.rocks>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...t-include-compat-5.3.h-in-luv-header-file.patch | 62 ++++++++++++++++++++++
 1 file changed, 62 insertions(+)

diff --git a/package/luv/0001-Do-not-include-compat-5.3.h-in-luv-header-file.patch b/package/luv/0001-Do-not-include-compat-5.3.h-in-luv-header-file.patch
new file mode 100644
index 0000000000..22428c98f7
--- /dev/null
+++ b/package/luv/0001-Do-not-include-compat-5.3.h-in-luv-header-file.patch
@@ -0,0 +1,62 @@
+From 0b541b828142dab6c23b0f4415dd2fd052d69ff1 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
+Date: Wed, 31 Oct 2018 18:14:18 +0100
+Subject: [PATCH] Do not include compat-5.3.h in luv header file
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Do not include compat-5.3.h in luv header file
+
+Exposing the compat-5.3.h header file directly in the luv.h header file
+is not a good idea, because it causes redefinition errors when building,
+for example latest luvi version 2.8.0, with a shared luv library and
+LuaJIT 2.0.5.
+
+Therefore, include the compat header file in the luv.c source file.
+
+Note, that luvi version 2.8.0 (and 2.7.6) still fails to build against the
+shared luv library using LuaJIT 2.0.5, as it does use `luaL_newlib` which is
+not available in Lua 5.1. However, this is unrelated to the luv library as
+luvi itself should define the macro for Lua 5.1.
+
+Upstream status: https://github.com/luvit/luv/pull/310
+
+Signed-off-by: J??rg Krause <joerg.krause@embedded.rocks>
+---
+ src/luv.c | 3 +++
+ src/luv.h | 4 ----
+ 2 files changed, 3 insertions(+), 4 deletions(-)
+
+diff --git a/src/luv.c b/src/luv.c
+index c4c7cb7..4af7582 100644
+--- a/src/luv.c
++++ b/src/luv.c
+@@ -15,6 +15,9 @@
+  *
+  */
+ 
++#if (LUA_VERSION_NUM != 503)
++#include "c-api/compat-5.3.h"
++#endif
+ #include "luv.h"
+ #include "util.c"
+ #include "lhandle.c"
+diff --git a/src/luv.h b/src/luv.h
+index 27c8c94..4fedd3f 100644
+--- a/src/luv.h
++++ b/src/luv.h
+@@ -50,10 +50,6 @@
+ #define MAX_TITLE_LENGTH (8192)
+ #endif
+ 
+-#if (LUA_VERSION_NUM != 503)
+-#include "c-api/compat-5.3.h"
+-#endif
+-
+ #if defined(__clang__)
+ #pragma clang diagnostic push
+ #pragma clang diagnostic ignored "-Wunused-function"
+-- 
+2.19.1
+
