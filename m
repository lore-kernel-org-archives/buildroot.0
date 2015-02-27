From: Peter Seiderer <ps.report@gmx.net>
Date: Fri, 27 Feb 2015 23:25:50 +0100
Subject: [Buildroot] [PATCH v2 5/7] directfb: fix Blackfin.uclinux.org
	2014R1 toolchain compile errors
In-Reply-To: <1425075952-24699-1-git-send-email-ps.report@gmx.net>
References: <1425075952-24699-1-git-send-email-ps.report@gmx.net>
Message-ID: <1425075952-24699-5-git-send-email-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 .../0005-workaround-missing-va_copy-bug.patch      |  34 +++
 ...ion-constructor-error-for-legacy-c-compil.patch | 227 +++++++++++++++++++++
 ...-missing-pthread_getattr_np-linking-error.patch |  36 ++++
 3 files changed, 297 insertions(+)
 create mode 100644 package/directfb/0005-workaround-missing-va_copy-bug.patch
 create mode 100644 package/directfb/0006-Fix-conversion-constructor-error-for-legacy-c-compil.patch
 create mode 100644 package/directfb/0007-Fix-missing-pthread_getattr_np-linking-error.patch

diff --git a/package/directfb/0005-workaround-missing-va_copy-bug.patch b/package/directfb/0005-workaround-missing-va_copy-bug.patch
new file mode 100644
index 0000000..189800d
--- /dev/null
+++ b/package/directfb/0005-workaround-missing-va_copy-bug.patch
@@ -0,0 +1,34 @@
+From 62585b44ec5a811b4c7a8088f91b635dda1a4dbd Mon Sep 17 00:00:00 2001
+From: Peter Seiderer <ps.report@gmx.net>
+Date: Thu, 26 Feb 2015 22:46:59 +0100
+Subject: [PATCH] workaround missing va_copy bug
+
+See [1] for reference.
+
+[1] https://gcc.gnu.org/bugzilla/show_bug.cgi?id=36799
+
+Signed-off-by: Peter Seiderer <ps.report@gmx.net>
+---
+ lib/direct/String.cpp | 5 ++++-
+ 1 file changed, 4 insertions(+), 1 deletion(-)
+
+diff --git a/lib/direct/String.cpp b/lib/direct/String.cpp
+index a7558ba..eca4664 100644
+--- a/lib/direct/String.cpp
++++ b/lib/direct/String.cpp
+@@ -117,8 +117,11 @@ String::PrintF( const char *format, va_list args, size_t stack_buffer )
+ 
+ #ifdef __GNUC__
+      va_list ap2;
+-
++#ifdef va_copy
+      va_copy( ap2, args );
++#else
++     __va_copy( ap2, args );
++#endif
+      len = direct_vsnprintf( buf, sizeof(buf), format, ap2 );
+      va_end( ap2 );
+ #else
+-- 
+2.1.4
+
diff --git a/package/directfb/0006-Fix-conversion-constructor-error-for-legacy-c-compil.patch b/package/directfb/0006-Fix-conversion-constructor-error-for-legacy-c-compil.patch
new file mode 100644
index 0000000..8fb54da
--- /dev/null
+++ b/package/directfb/0006-Fix-conversion-constructor-error-for-legacy-c-compil.patch
@@ -0,0 +1,227 @@
+From 6284abc8309542e0e6b845fd41624c2be7de0515 Mon Sep 17 00:00:00 2001
+From: Peter Seiderer <ps.report@gmx.net>
+Date: Thu, 26 Feb 2015 22:48:57 +0100
+Subject: [PATCH] Fix conversion/constructor error for legacy c++ compiler.
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Fixes the following compile error with legacy c++
+compiler, e.g. bfin-uclinux-c++ (ADI-2014R1-RC2) 4.3.5:
+
+error: too many initializers for ?DFBRectangle?
+error: conversion from ?int? to non-scalar type ?DFBRectangle? requested
+
+Signed-off-by: Peter Seiderer <ps.report@gmx.net>
+---
+ include/directfb_util.h              |  8 ++++++++
+ src/core/CoreGraphicsStateClient.cpp |  4 ++--
+ src/core/Renderer.cpp                |  2 +-
+ src/gfx/generic/GenefxEngine.cpp     |  6 +++---
+ src/gfx/util.cpp                     | 16 ++++++++--------
+ tests/coretest_task.cpp              |  6 +++---
+ tests/coretest_task_fillrect.cpp     |  2 +-
+ 7 files changed, 26 insertions(+), 18 deletions(-)
+
+diff --git a/include/directfb_util.h b/include/directfb_util.h
+index 3734248..479c5de 100644
+--- a/include/directfb_util.h
++++ b/include/directfb_util.h
+@@ -103,7 +103,11 @@ void DIRECTFB_API dfb_rectangle_union ( DFBRectangle       *rect1,
+ #define DFB_RECTANGLE_INIT_FROM_DIMENSION_VALS(w,h)    (DFBRectangle){ DFB_RECTANGLE_VALS_FROM_DIMENSION_VALS(w,h) }
+ 
+ #define DFB_RECTANGLE_VALS_FROM_REGION(r)              (r)->x1, (r)->y1, (r)->x2-(r)->x1+1, (r)->y2-(r)->y1+1
++#ifdef __cplusplus
++#define DFB_RECTANGLE_INIT_FROM_REGION(r)              (DFBRectangle_C){ DFB_RECTANGLE_VALS_FROM_REGION(r) }
++#else
+ #define DFB_RECTANGLE_INIT_FROM_REGION(r)              (DFBRectangle){ DFB_RECTANGLE_VALS_FROM_REGION(r) }
++#endif
+ 
+ #define DFB_RECTANGLE_VALS_FROM_REGION_TRANSLATED(r,x,y)    (r)->x1 + (x), (r)->y1 + (y), (r)->x2-(r)->x1+1, (r)->y2-(r)->y1+1
+ #define DFB_RECTANGLE_INIT_FROM_REGION_TRANSLATED(r,x,y)    (DFBRectangle){ DFB_RECTANGLE_VALS_FROM_REGION_TRANSLATED(r,x,y) }
+@@ -144,7 +148,11 @@ void DIRECTFB_API dfb_rectangle_union ( DFBRectangle       *rect1,
+ #define DFB_REGION_INIT_FROM_RECTANGLE(r)              (DFBRegion){ DFB_REGION_VALS_FROM_RECTANGLE(r) }
+ 
+ #define DFB_REGION_VALS_FROM_RECTANGLE_VALS(x,y,w,h)   (x), (y), (x)+(w)-1, (y)+(h)-1
++#ifdef __cplusplus
++#define DFB_REGION_INIT_FROM_RECTANGLE_VALS(x,y,w,h)   (DFBRegion_C){ DFB_REGION_VALS_FROM_RECTANGLE_VALS(x,y,w,h) }
++#else
+ #define DFB_REGION_INIT_FROM_RECTANGLE_VALS(x,y,w,h)   (DFBRegion){ DFB_REGION_VALS_FROM_RECTANGLE_VALS(x,y,w,h) }
++#endif
+ 
+ #define DFB_REGION_VALS_FROM_BOX(b)                    (b)->x1, (b)->y1, (b)->x2-1, (b)->y2-1
+ #define DFB_REGION_INIT_FROM_BOX(b)                    (DFBRegion){ DFB_REGION_VALS_FROM_BOX(b) }
+diff --git a/src/core/CoreGraphicsStateClient.cpp b/src/core/CoreGraphicsStateClient.cpp
+index 5d46f0e..3a44a6d 100644
+--- a/src/core/CoreGraphicsStateClient.cpp
++++ b/src/core/CoreGraphicsStateClient.cpp
+@@ -1137,7 +1137,7 @@ CoreGraphicsStateClient_StretchBlit( CoreGraphicsStateClient *client,
+      else {
+           if (!dfb_config->call_nodirect && (dfb_core_is_master( client->core ) || !fusion_config->secure_fusion)) {
+                if (num == 1 && srects[0].w == drects[0].w && srects[0].h == drects[0].h) {
+-                    DFBPoint point = { drects[0].x, drects[0].y };
++                    DFBPoint point = (DFBPoint_C){ drects[0].x, drects[0].y };
+ 
+                     // FIXME: will overwrite rects, points
+                     dfb_gfxcard_batchblit( (DFBRectangle*) srects, &point, 1, client->state );
+@@ -1155,7 +1155,7 @@ CoreGraphicsStateClient_StretchBlit( CoreGraphicsStateClient *client,
+                if (num == 1 && srects[0].w == drects[0].w && srects[0].h == drects[0].h) {
+                     CoreGraphicsStateClient_Update( client, DFXL_BLIT, client->state );
+ 
+-                    DFBPoint point = { drects[0].x, drects[0].y };
++                    DFBPoint point = (DFBPoint_C){ drects[0].x, drects[0].y };
+                     ret = requestor->Blit( srects, &point, 1 );
+                     if (ret)
+                          return ret;
+diff --git a/src/core/Renderer.cpp b/src/core/Renderer.cpp
+index 3811b09..63d4c09 100644
+--- a/src/core/Renderer.cpp
++++ b/src/core/Renderer.cpp
+@@ -2844,7 +2844,7 @@ Renderer::StretchBlit( const DFBRectangle     *srects,
+ 
+      if (num == 1) {
+           if (srects[0].w == drects[0].w && srects[0].h == drects[0].h) {
+-               DFBPoint          point = { drects[0].x, drects[0].y };
++               DFBPoint          point = (DFBPoint_C){ drects[0].x, drects[0].y };
+                Primitives::Blits primitives( srects, &point, 1, DFXL_BLIT );
+ 
+                render( &primitives );
+diff --git a/src/gfx/generic/GenefxEngine.cpp b/src/gfx/generic/GenefxEngine.cpp
+index 84615ec..5b9487b 100644
+--- a/src/gfx/generic/GenefxEngine.cpp
++++ b/src/gfx/generic/GenefxEngine.cpp
+@@ -1042,7 +1042,7 @@ GenefxTask::Run()
+ 
+                                    D_DEBUG_AT( DirectFB_GenefxTask, "  -> %4d,%4d-%4dx%4d\n", x, y, w, h );
+ 
+-                                   DFBRectangle rect = {
++                                   DFBRectangle rect = (DFBRectangle_C){
+                                         x, y, w, h
+                                    };
+ 
+@@ -1070,7 +1070,7 @@ GenefxTask::Run()
+ 
+                                    D_DEBUG_AT( DirectFB_GenefxTask, "  -> %4d,%4d-%4dx%4d\n", x1, y1, x2, y2 );
+ 
+-                                   DFBRegion line = {
++                                   DFBRegion line = (DFBRegion_C){
+                                         x1, y1, x2, y2
+                                    };
+ 
+@@ -1100,7 +1100,7 @@ GenefxTask::Run()
+ 
+                                    D_DEBUG_AT( DirectFB_GenefxTask, "  -> %4d,%4d-%4dx%4d -> %4d,%4d\n", x, y, w, h, dx, dy );
+ 
+-                                   DFBRectangle rect = {
++                                   DFBRectangle rect = (DFBRectangle_C){
+                                         x, y, w, h
+                                    };
+ 
+diff --git a/src/gfx/util.cpp b/src/gfx/util.cpp
+index 40032bc..0acc0b1 100644
+--- a/src/gfx/util.cpp
++++ b/src/gfx/util.cpp
+@@ -148,7 +148,7 @@ dfb_gfx_copy_stereo( CoreSurface         *source,
+                      int                  y,
+                      bool                 from_back )
+ {
+-     DFBRectangle sourcerect = { 0, 0, source->config.size.w, source->config.size.h };
++     DFBRectangle sourcerect = (DFBRectangle_C){ 0, 0, source->config.size.w, source->config.size.h };
+ 
+      StateClient *client = StateClient::Get();
+ 
+@@ -165,13 +165,13 @@ dfb_gfx_copy_stereo( CoreSurface         *source,
+ 
+      if (rect) {
+           if (dfb_rectangle_intersect( &sourcerect, rect )) {
+-               DFBPoint point = { x + sourcerect.x - rect->x, y + sourcerect.y - rect->y };
++               DFBPoint point = (DFBPoint_C){ x + sourcerect.x - rect->x, y + sourcerect.y - rect->y };
+ 
+                CoreGraphicsStateClient_Blit( &client->client, &sourcerect, &point, 1 );
+           }
+      }
+      else {
+-          DFBPoint point = { x, y };
++          DFBPoint point = (DFBPoint_C){ x, y };
+ 
+           CoreGraphicsStateClient_Blit( &client->client, &sourcerect, &point, 1 );
+      }
+@@ -188,7 +188,7 @@ dfb_gfx_copy_stereo( CoreSurface         *source,
+ void
+ dfb_gfx_clear( CoreSurface *surface, CoreSurfaceBufferRole role )
+ {
+-     DFBRectangle rect = { 0, 0, surface->config.size.w, surface->config.size.h };
++     DFBRectangle rect = (DFBRectangle_C){ 0, 0, surface->config.size.w, surface->config.size.h };
+ 
+      StateClient *client = StateClient::Get();
+ 
+@@ -230,8 +230,8 @@ void dfb_gfx_stretch_stereo( CoreSurface         *source,
+                              const DFBRectangle  *drect,
+                              bool                 from_back )
+ {
+-     DFBRectangle sourcerect = { 0, 0, source->config.size.w, source->config.size.h };
+-     DFBRectangle destrect =   { 0, 0, destination->config.size.w, destination->config.size.h };
++     DFBRectangle sourcerect = (DFBRectangle_C){ 0, 0, source->config.size.w, source->config.size.h };
++     DFBRectangle destrect =   (DFBRectangle_C){ 0, 0, destination->config.size.w, destination->config.size.h };
+ 
+      if (srect) {
+           if (!dfb_rectangle_intersect( &sourcerect, srect ))
+@@ -293,7 +293,7 @@ dfb_gfx_copy_regions_stereo( CoreSurface           *source,
+                              int                    y )
+ {
+      unsigned int i, n = 0;
+-     DFBRectangle rect = { 0, 0, source->config.size.w, source->config.size.h };
++     DFBRectangle rect = (DFBRectangle_C){ 0, 0, source->config.size.w, source->config.size.h };
+      DFBRectangle rects[num];
+      DFBPoint     points[num];
+ 
+@@ -350,7 +350,7 @@ dfb_gfx_copy_regions_client( CoreSurface             *source,
+                              CoreGraphicsStateClient *_client )
+ {
+      unsigned int             i, n = 0;
+-     DFBRectangle             rect = { 0, 0, source->config.size.w, source->config.size.h };
++     DFBRectangle             rect = (DFBRectangle_C){ 0, 0, source->config.size.w, source->config.size.h };
+      DFBRectangle             rects[num];
+      DFBPoint                 points[num];
+      CoreGraphicsStateClient *client = _client ? _client : &StateClient::Get()->client;
+diff --git a/tests/coretest_task.cpp b/tests/coretest_task.cpp
+index cbbde0d..b74591b 100644
+--- a/tests/coretest_task.cpp
++++ b/tests/coretest_task.cpp
+@@ -219,17 +219,17 @@ main( int argc, char *argv[] )
+                dfb_state_set_color( &state, &color );
+ 
+ 
+-               DFBRectangle rect = {
++               DFBRectangle rect = (DFBRectangle_C){
+                     rand()%100, rand()%100, rand()%100, rand()%100
+                };
+ 
+                renderer->FillRectangles( &rect, 1 );
+           }
+ 
+-          DFBRectangle rect = {
++          DFBRectangle rect = (DFBRectangle_C){
+                rand()%100, rand()%100, rand()%100, rand()%100
+           };
+-          DFBPoint point = {
++          DFBPoint point = (DFBPoint_C){
+                rand()%100, rand()%100
+           };
+           renderer->Blit( &rect, &point, 1 );
+diff --git a/tests/coretest_task_fillrect.cpp b/tests/coretest_task_fillrect.cpp
+index 1829a12..796a535 100644
+--- a/tests/coretest_task_fillrect.cpp
++++ b/tests/coretest_task_fillrect.cpp
+@@ -220,7 +220,7 @@ main( int argc, char *argv[] )
+                dfb_state_set_color( &state, &color );
+ 
+ 
+-               DFBRectangle rect = {
++               DFBRectangle rect = (DFBRectangle_C){
+                     (u8)rand()%100, (u8)rand()%100, (u8)rand()%100, (u8)rand()%100
+                };
+ 
+-- 
+2.1.4
+
diff --git a/package/directfb/0007-Fix-missing-pthread_getattr_np-linking-error.patch b/package/directfb/0007-Fix-missing-pthread_getattr_np-linking-error.patch
new file mode 100644
index 0000000..57378b0
--- /dev/null
+++ b/package/directfb/0007-Fix-missing-pthread_getattr_np-linking-error.patch
@@ -0,0 +1,36 @@
+From 246ae872f8c2e4b597b7518236b2f8abda63b69d Mon Sep 17 00:00:00 2001
+From: Peter Seiderer <ps.report@gmx.net>
+Date: Thu, 26 Feb 2015 23:16:16 +0100
+Subject: [PATCH] Fix missing pthread_getattr_np linking error.
+
+Disable thread attribute read back in case of
+uclibc.
+
+Signed-off-by: Peter Seiderer <ps.report@gmx.net>
+---
+ lib/direct/os/linux/glibc/thread.c | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/lib/direct/os/linux/glibc/thread.c b/lib/direct/os/linux/glibc/thread.c
+index c3cf92c..2a3df80 100644
+--- a/lib/direct/os/linux/glibc/thread.c
++++ b/lib/direct/os/linux/glibc/thread.c
+@@ -152,12 +152,15 @@ direct_thread_init( DirectThread *thread )
+ 
+      pthread_attr_destroy( &attr );
+ 
++/* versions of uClibc 0.9.32 and below do not have pthread_getattr_np */
++#if !defined(__UCLIBC__)
+      /* Read (back) value. */
+      pthread_getattr_np( thread->handle.thread, &attr );
+      pthread_attr_getstacksize( &attr, &thread->stack_size );
+      pthread_attr_getschedparam( &attr, &param );
+      thread->priority = param.sched_priority;
+      pthread_attr_destroy( &attr );
++#endif
+ 
+      return DR_OK;
+ }
+-- 
+2.1.4
+
-- 
2.1.4
