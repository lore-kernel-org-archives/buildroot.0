From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 19 Feb 2017 11:09:12 +0100
Subject: [Buildroot] [PATCH] package/mpv: fix build on ppc64
Message-ID: <1487498952-30688-1-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Our current patch was done on a previous version of mpv. Since then, the
include-path has changed, and stdbool is already included earlier. So,
including it again will serve no purpose...

So, the bool type defined in the altivec case is back to bite, and it is
not any happier than before.

We fix our patch to simply redefine bool to the correct type, but just
in the altivec case.

Fixes:
    http://autobuild.buildroot.org/results/e91/e914bc0f955e4ba740614f93cbfa401b673b754b/
    http://autobuild.buildroot.org/results/4c1/4c150fedc74530d09e8ecd678dcf5664251606e7/
    and countless others...

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/mpv/0002-Fix-build-on-powerpc64-altivec.patch | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/package/mpv/0002-Fix-build-on-powerpc64-altivec.patch b/package/mpv/0002-Fix-build-on-powerpc64-altivec.patch
index 6db911d..6ce689a 100644
--- a/package/mpv/0002-Fix-build-on-powerpc64-altivec.patch
+++ b/package/mpv/0002-Fix-build-on-powerpc64-altivec.patch
@@ -4,9 +4,14 @@ On powerpc64le, the SDL header from SDL2 may include altivec.h and this
 (combined with -std=c99) will cause a compile failure due to bool being
 redefined as a vector type.
 
-Re-include stdbool.h after SDL.h to restore the normal bool type.
+We can't (re-)include stdbool.h because it is already included earlier.
+
+So we just redefine it to the correct type, but only in the altivec
+case.
 
 Signed-off-by: Sam Bobroff <sam.bobroff@au1.ibm.com>
+[yann.morin.1998 at free.fr: really fix it]
+Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
 ---
  audio/out/ao_sdl.c | 1 +
  1 file changed, 1 insertion(+)
@@ -15,11 +20,15 @@ diff --git a/audio/out/ao_sdl.c b/audio/out/ao_sdl.c
 index d9d0062..0cb80d6 100644
 --- a/audio/out/ao_sdl.c
 +++ b/audio/out/ao_sdl.c
-@@ -29,6 +29,7 @@
+@@ -29,6 +29,11 @@
  #include "osdep/timer.h"
  
  #include <SDL.h>
-+#include <stdbool.h>
++#ifdef _ALTIVEC_H
++/* Undo altivec (incorrectly) redefining bool */
++#undef bool
++#define bool _Bool
++#endif
  
  struct priv
  {
-- 
2.7.4
