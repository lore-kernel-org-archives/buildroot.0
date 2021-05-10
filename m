From: Peter Seiderer <ps.report@gmx.net>
Date: Mon, 10 May 2021 21:53:52 +0200
Subject: [Buildroot] [RFC v1] package/rpi-userland: add GLint64,
 GLuint64 and GLsync typedefs to GLES2/gl2ext.h
Message-ID: <20210510195352.13205-1-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:

  - https://bugs.busybox.net/show_bug.cgi?id=13796

.../host/arm-linucleus-linux-gnueabihf/sysroot/usr/include/gstreamer-1.0/gst/gl/glprototypes/gstgl_compat.h:40:18: error: conflicting declaration ?typedef void* GLsync?
   40 | typedef gpointer GLsync;
      |                  ^~~~~~

.../host/arm-linucleus-linux-gnueabihf/sysroot/usr/include/qt5/QtGui/qopengles2ext.h:24:26: note: previous declaration as ?typedef struct __GLsync* GLsync?
   24 | typedef struct __GLsync *GLsync;
      |                          ^~~~~~

File gstgl_compat.h:

 39 #if !GST_GL_HAVE_GLSYNC
 40 typedef gpointer GLsync;
 41 #endif

File qopengles2ext.h:

   1 #ifndef __gles2_gl2ext_h_
   2 #define __gles2_gl2ext_h_ 1
   3
   4 #if 0
   5 #pragma qt_no_master_include
   6 #pragma qt_sync_skip_header_check
   7 #pragma qt_sync_stop_processing
   8 #endif
   9
  10 #ifdef __cplusplus
  11 extern "C" {
  12 #endif
  13
  14 #ifndef __gl3_h_
  15 /* These types are defined with reference to <inttypes.h>
  16  * in the Apple extension spec, but here we use the Khronos
  17  * portable types in khrplatform.h, and assume those types
  18  * are always defined.
  19  * If any other extensions using these types are defined,
  20  * the typedefs must move out of this block and be shared.
  21  */
  22 typedef khronos_int64_t GLint64;
  23 typedef khronos_uint64_t GLuint64;
  24 typedef struct __GLsync *GLsync;
  25 #endif

The problem is that gstreamer sees the original gl2ext.h file from
rpi-userland (rpi-userland-093b30bbc2fd083d68cc3ee07e6e555c6e592d11/interface/khronos/include/GLES2/gl2ext.h)
without the additional GLint64, GLuint64 and GLsync typedef definitions but
checks for existance and if not found enables its own versions in gstgl_compat.h,
incompatible with the later ones used from Qt (qopengles2ext.h).

Fix this by adding the same typedef definitions already to the
rpi-userland header version.

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
Notes:
  - only compile tested, no run time test done yet
---
 ...dd-GLint64-GLuint64-and-GLsync-typed.patch | 93 +++++++++++++++++++
 1 file changed, 93 insertions(+)
 create mode 100644 package/rpi-userland/0006-GLES2-gl2ext.h-add-GLint64-GLuint64-and-GLsync-typed.patch

diff --git a/package/rpi-userland/0006-GLES2-gl2ext.h-add-GLint64-GLuint64-and-GLsync-typed.patch b/package/rpi-userland/0006-GLES2-gl2ext.h-add-GLint64-GLuint64-and-GLsync-typed.patch
new file mode 100644
index 0000000000..135eecab10
--- /dev/null
+++ b/package/rpi-userland/0006-GLES2-gl2ext.h-add-GLint64-GLuint64-and-GLsync-typed.patch
@@ -0,0 +1,93 @@
+From ffb8eafe2d745ddf2f44101ffc4e6599ed096e69 Mon Sep 17 00:00:00 2001
+From: Peter Seiderer <ps.report@gmx.net>
+Date: Mon, 10 May 2021 19:15:48 +0200
+Subject: [PATCH] GLES2/gl2ext.h: add GLint64, GLuint64 and GLsync typedefs
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Fixes:
+
+.../host/arm-linucleus-linux-gnueabihf/sysroot/usr/include/gstreamer-1.0/gst/gl/glprototypes/gstgl_compat.h:40:18: error: conflicting declaration ?typedef void* GLsync?
+   40 | typedef gpointer GLsync;
+      |                  ^~~~~~
+
+.../host/arm-linucleus-linux-gnueabihf/sysroot/usr/include/qt5/QtGui/qopengles2ext.h:24:26: note: previous declaration as ?typedef struct __GLsync* GLsync?
+   24 | typedef struct __GLsync *GLsync;
+      |                          ^~~~~~
+
+File gstgl_compat.h:
+
+ 39 #if !GST_GL_HAVE_GLSYNC
+ 40 typedef gpointer GLsync;
+ 41 #endif
+
+File qopengles2ext.h:
+
+   1 #ifndef __gles2_gl2ext_h_
+   2 #define __gles2_gl2ext_h_ 1
+   3
+   4 #if 0
+   5 #pragma qt_no_master_include
+   6 #pragma qt_sync_skip_header_check
+   7 #pragma qt_sync_stop_processing
+   8 #endif
+   9
+  10 #ifdef __cplusplus
+  11 extern "C" {
+  12 #endif
+  13
+  14 #ifndef __gl3_h_
+  15 /* These types are defined with reference to <inttypes.h>
+  16  * in the Apple extension spec, but here we use the Khronos
+  17  * portable types in khrplatform.h, and assume those types
+  18  * are always defined.
+  19  * If any other extensions using these types are defined,
+  20  * the typedefs must move out of this block and be shared.
+  21  */
+  22 typedef khronos_int64_t GLint64;
+  23 typedef khronos_uint64_t GLuint64;
+  24 typedef struct __GLsync *GLsync;
+  25 #endif
+
+The problem is that gstreamer sees the original gl2ext.h file from
+rpi-userland (rpi-userland-093b30bbc2fd083d68cc3ee07e6e555c6e592d11/interface/khronos/include/GLES2/gl2ext.h)
+without the additional GLint64, GLuint64 and GLsync typedef definitions but
+checks for existance and if not found enables its own versions in gstgl_compat.h,
+incompatible with the later ones used from Qt (qopengles2ext.h).
+
+Fix this by adding the same typedef definitions already to the
+rpi-userland header version.
+
+Signed-off-by: Peter Seiderer <ps.report@gmx.net>
+---
+ interface/khronos/include/GLES2/gl2ext.h | 13 +++++++++++++
+ 1 file changed, 13 insertions(+)
+
+diff --git a/interface/khronos/include/GLES2/gl2ext.h b/interface/khronos/include/GLES2/gl2ext.h
+index 4eacf7f..96e87ec 100644
+--- a/interface/khronos/include/GLES2/gl2ext.h
++++ b/interface/khronos/include/GLES2/gl2ext.h
+@@ -33,6 +33,19 @@ SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
+ extern "C" {
+ #endif
+ 
++#ifndef __gl3_h_
++/* These types are defined with reference to <inttypes.h>
++ * in the Apple extension spec, but here we use the Khronos
++ * portable types in khrplatform.h, and assume those types
++ * are always defined.
++ * If any other extensions using these types are defined,
++ * the typedefs must move out of this block and be shared.
++ */
++typedef khronos_int64_t GLint64;
++typedef khronos_uint64_t GLuint64;
++typedef struct __GLsync *GLsync;
++#endif
++
+ /* We want this */
+ #ifndef GL_GLEXT_PROTOTYPES
+ #define GL_GLEXT_PROTOTYPES
+-- 
+2.31.1
+
-- 
2.31.1
