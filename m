From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 24 Mar 2020 22:12:57 +0100
Subject: [Buildroot] [git commit] package/sdl2: fix build with directfb
Message-ID: <20200324210147.7440A8816E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=830bbc0a9aa444b894c245728bf1616e9d7f6811
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
 - http://autobuild.buildroot.org/results/83ccefee68c2800c0544e6f40fa8bc8ee6b67b77

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 ...-directfb-SDL_DirectFB_render.c-fix-build.patch | 46 ++++++++++++++++++++++
 1 file changed, 46 insertions(+)

diff --git a/package/sdl2/0001-src-video-directfb-SDL_DirectFB_render.c-fix-build.patch b/package/sdl2/0001-src-video-directfb-SDL_DirectFB_render.c-fix-build.patch
new file mode 100644
index 0000000000..2fbad97402
--- /dev/null
+++ b/package/sdl2/0001-src-video-directfb-SDL_DirectFB_render.c-fix-build.patch
@@ -0,0 +1,46 @@
+From 7c6d466d98910a2896680351cc5cea1b7fb37ab9 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Tue, 24 Mar 2020 13:33:40 +0100
+Subject: [PATCH] src/video/directfb/SDL_DirectFB_render.c: fix build
+
+Build with directfb is broken due to a spurious '}' and a missing 'E'
+since version 2.0.12 and https://hg.libsdl.org/SDL/rev/2d5b5a5ccbfb:
+
+/home/buildroot/autobuild/run/instance-2/output-1/build/sdl2-2.0.12/src/video/directfb/SDL_DirectFB_render.c: In function 'SetBlendMode':
+/home/buildroot/autobuild/run/instance-2/output-1/build/sdl2-2.0.12/src/video/directfb/SDL_DirectFB_render.c:202:9: error: case label not within a switch statement
+  202 |         case SDL_BLENDMODE_MUL:
+      |         ^~~~
+
+/home/buildroot/autobuild/run/instance-2/output-1/build/sdl2-2.0.12/src/video/directfb/SDL_DirectFB_render.c:205:67: error: 'DSBF_DSTCOLOR' undeclared (first use in this function); did you mean 'DSBF_DESTCOLOR'?
+  205 |             SDL_DFB_CHECK(destsurf->SetSrcBlendFunction(destsurf, DSBF_DSTCOLOR));
+      |                                                                   ^~~~~~~~~~~~~
+
+Fixes:
+ - http://autobuild.buildroot.org/results/83ccefee68c2800c0544e6f40fa8bc8ee6b67b77
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Retrieved from: https://hg.libsdl.org/SDL/rev/769f80095217]
+---
+ src/video/directfb/SDL_DirectFB_render.c | 3 +--
+ 1 file changed, 1 insertion(+), 2 deletions(-)
+
+diff --git a/src/video/directfb/SDL_DirectFB_render.c b/src/video/directfb/SDL_DirectFB_render.c
+index 618009850..cc31fb8f4 100644
+--- a/src/video/directfb/SDL_DirectFB_render.c
++++ b/src/video/directfb/SDL_DirectFB_render.c
+@@ -198,11 +198,10 @@ SetBlendMode(DirectFB_RenderData * data, int blendMode,
+             SDL_DFB_CHECK(destsurf->SetDstBlendFunction(destsurf, DSBF_SRCCOLOR));
+ 
+             break;
+-        }
+         case SDL_BLENDMODE_MUL:
+             data->blitFlags = DSBLIT_BLEND_ALPHACHANNEL;
+             data->drawFlags = DSDRAW_BLEND;
+-            SDL_DFB_CHECK(destsurf->SetSrcBlendFunction(destsurf, DSBF_DSTCOLOR));
++            SDL_DFB_CHECK(destsurf->SetSrcBlendFunction(destsurf, DSBF_DESTCOLOR));
+             SDL_DFB_CHECK(destsurf->SetDstBlendFunction(destsurf, DSBF_INVSRCALPHA));
+ 
+             break;
+-- 
+2.25.1
+
