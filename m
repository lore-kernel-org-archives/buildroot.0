From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 10 May 2021 20:00:57 +0000
Subject: [Buildroot] [Bug 13796] Problems compiling package gst-plugins-good
In-Reply-To: <bug-13796-163@https.bugs.busybox.net/>
References: <bug-13796-163@https.bugs.busybox.net/>
Message-ID: <bug-13796-163-5HTAHi4u47@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=13796

--- Comment #1 from Peter Seiderer <ps.report@gmx.net> ---
(In reply to Alfredo Pons Menargues from comment #0)

The failure is:

.../host/arm-linucleus-linux-gnueabihf/sysroot/usr/include/gstreamer-1.0/gst/gl/glprototypes/gstgl_compat.h:40:18:
error: conflicting declaration ?typedef void* GLsync?
   40 | typedef gpointer GLsync;
      |                  ^~~~~~

.../host/arm-linucleus-linux-gnueabihf/sysroot/usr/include/qt5/QtGui/qopengles2ext.h:24:26:
note: previous declaration as ?typedef struct __GLsync* GLsync?
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
rpi-userland
(rpi-userland-093b30bbc2fd083d68cc3ee07e6e555c6e592d11/interface/khronos/include/GLES2/gl2ext.h)
without the additional GLint64, GLuint64 and GLsync typedef definitions but
checks for existance and if not found enables its own versions in
gstgl_compat.h,
incompatible with the later ones used from Qt (qopengles2ext.h).

An RFC patch suggested, see:

https://patchwork.ozlabs.org/project/buildroot/patch/20210510195352.13205-1-ps.report at gmx.net/

Only compile tested (yet)...

-- 
You are receiving this mail because:
You are on the CC list for the bug.
