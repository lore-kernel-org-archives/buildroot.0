From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 8 Nov 2016 09:37:17 +0100
Subject: [Buildroot] [git commit] mpv: fix build on powerpc64 w/ altivec
Message-ID: <20161108083834.EC3ED7FDEB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=64904f0f6d691cfea5ae1c8f58e2d61aac0684c2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes
http://autobuild.buildroot.net/results/77f/77f00633b0b25f001cd4ca54ed3a12aee301c287

Add a patch to work around a name collision between bool and altivec's
bool apparent when using sdl2.

Signed-off-by: Sam Bobroff <sam.bobroff@au1.ibm.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../mpv/0002-Fix-build-on-powerpc64-altivec.patch  | 28 ++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/package/mpv/0002-Fix-build-on-powerpc64-altivec.patch b/package/mpv/0002-Fix-build-on-powerpc64-altivec.patch
new file mode 100644
index 0000000..6db911d
--- /dev/null
+++ b/package/mpv/0002-Fix-build-on-powerpc64-altivec.patch
@@ -0,0 +1,28 @@
+Subject: [PATCH] Work around bool type redefinition by altivec
+
+On powerpc64le, the SDL header from SDL2 may include altivec.h and this
+(combined with -std=c99) will cause a compile failure due to bool being
+redefined as a vector type.
+
+Re-include stdbool.h after SDL.h to restore the normal bool type.
+
+Signed-off-by: Sam Bobroff <sam.bobroff@au1.ibm.com>
+---
+ audio/out/ao_sdl.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/audio/out/ao_sdl.c b/audio/out/ao_sdl.c
+index d9d0062..0cb80d6 100644
+--- a/audio/out/ao_sdl.c
++++ b/audio/out/ao_sdl.c
+@@ -29,6 +29,7 @@
+ #include "osdep/timer.h"
+ 
+ #include <SDL.h>
++#include <stdbool.h>
+ 
+ struct priv
+ {
+-- 
+2.10.0.297.gf6727b0
+
