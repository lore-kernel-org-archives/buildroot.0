From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 19 Feb 2017 22:44:30 +0100
Subject: [Buildroot] [git commit] package/mpv: fixup fix build on powerpc64
	w/ altivec
Message-ID: <20170219214543.EC58681EA3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=49ca0b9ce9a2110c0a68089a28b9bf61318cc2ac
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The initial fix for this issue, re-including stdbool.h, is not
working.

Instead, fix using the method used for other packages with a similar
problem: add -std=gnu99, which prevents bool from being redefined and
removes the need for any source code change.

Fixes: 64904f0f6d691cfea5ae1c8f58e2d61aac0684c2

Signed-off-by: Sam Bobroff <sam.bobroff@au1.ibm.com>
Tested-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../mpv/0002-Fix-build-on-powerpc64-altivec.patch  | 28 -------------------
 package/mpv/0002-fix-powerpc64-altivec.patch       | 32 ++++++++++++++++++++++
 2 files changed, 32 insertions(+), 28 deletions(-)

diff --git a/package/mpv/0002-Fix-build-on-powerpc64-altivec.patch b/package/mpv/0002-Fix-build-on-powerpc64-altivec.patch
deleted file mode 100644
index 6db911d..0000000
--- a/package/mpv/0002-Fix-build-on-powerpc64-altivec.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-Subject: [PATCH] Work around bool type redefinition by altivec
-
-On powerpc64le, the SDL header from SDL2 may include altivec.h and this
-(combined with -std=c99) will cause a compile failure due to bool being
-redefined as a vector type.
-
-Re-include stdbool.h after SDL.h to restore the normal bool type.
-
-Signed-off-by: Sam Bobroff <sam.bobroff@au1.ibm.com>
----
- audio/out/ao_sdl.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/audio/out/ao_sdl.c b/audio/out/ao_sdl.c
-index d9d0062..0cb80d6 100644
---- a/audio/out/ao_sdl.c
-+++ b/audio/out/ao_sdl.c
-@@ -29,6 +29,7 @@
- #include "osdep/timer.h"
- 
- #include <SDL.h>
-+#include <stdbool.h>
- 
- struct priv
- {
--- 
-2.10.0.297.gf6727b0
-
diff --git a/package/mpv/0002-fix-powerpc64-altivec.patch b/package/mpv/0002-fix-powerpc64-altivec.patch
new file mode 100644
index 0000000..45983fe
--- /dev/null
+++ b/package/mpv/0002-fix-powerpc64-altivec.patch
@@ -0,0 +1,32 @@
+Subject: [PATCH] Work around bool type redefinition by altivec
+
+On powerpc64le, the SDL header may include altivec.h and this
+(combined with -std=c99) will cause a compile failure due to bool
+being redefined as a vector type.
+
+Adjust the compiler flags to add -std=gnu99 (which is compatible with
+altivec) when using gcc. The generic flag '-std=c99' is left in place for other
+compilers (in the gcc case it is overridden by the (later) gnu flag).
+
+Signed-off-by: Sam Bobroff <sam.bobroff@au1.ibm.com>
+---
+ waftools/detections/compiler.py | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/waftools/detections/compiler.py b/waftools/detections/compiler.py
+index 5bbba87..50836a2 100644
+--- a/waftools/detections/compiler.py
++++ b/waftools/detections/compiler.py
+@@ -43,7 +43,8 @@ def __add_gcc_flags__(ctx):
+                        "-Wno-switch", "-Wparentheses", "-Wpointer-arith",
+                        "-Wno-pointer-sign",
+                        # GCC bug 66425
+-                       "-Wno-unused-result"]
++                       "-Wno-unused-result",
++                       "-std=gnu99"]
+ 
+ def __add_clang_flags__(ctx):
+     ctx.env.CFLAGS += ["-Wno-logical-op-parentheses", "-fcolor-diagnostics",
+-- 
+2.10.0.297.gf6727b0
+
