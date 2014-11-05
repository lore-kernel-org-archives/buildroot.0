From: Nicolas Serafini <nicolas.serafini@sensefly.com>
Date: Wed, 5 Nov 2014 16:52:13 +0100
Subject: [Buildroot] [PATCH 1/1] nvidia-tegra23: new package
Message-ID: <1415202733-13295-1-git-send-email-nicolas.serafini@sensefly.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch adds a new package for all libraries, drivers and codecs
provided by Nvidia Linux 4 Tegra release 16.4.0.

Signed-off-by: Nicolas Serafini <nicolas.serafini@sensefly.com>
---
 package/Config.in                                  |     1 +
 package/jpeg/Config.in                             |    10 +
 package/nvidia-tegra23/Config.in                   |     2 +
 .../nvidia-tegra23-binaries/Config.in              |   119 +
 .../nvidia-tegra23-binaries-000-headers.patch      | 14047 +++++++++++++++++++
 .../nvidia-tegra23-binaries-001-pkgconfig.patch    |    42 +
 .../nvidia-tegra23-binaries.hash                   |     3 +
 .../nvidia-tegra23-binaries.mk                     |   187 +
 .../nvidia-tegra23/nvidia-tegra23-codecs/Config.in |     9 +
 .../nvidia-tegra23-codecs.hash                     |     3 +
 .../nvidia-tegra23-codecs/nvidia-tegra23-codecs.mk |    42 +
 package/nvidia-tegra23/nvidia-tegra23.mk           |    10 +
 12 files changed, 14475 insertions(+)
 create mode 100644 package/nvidia-tegra23/Config.in
 create mode 100644 package/nvidia-tegra23/nvidia-tegra23-binaries/Config.in
 create mode 100644 package/nvidia-tegra23/nvidia-tegra23-binaries/nvidia-tegra23-binaries-000-headers.patch
 create mode 100644 package/nvidia-tegra23/nvidia-tegra23-binaries/nvidia-tegra23-binaries-001-pkgconfig.patch
 create mode 100644 package/nvidia-tegra23/nvidia-tegra23-binaries/nvidia-tegra23-binaries.hash
 create mode 100644 package/nvidia-tegra23/nvidia-tegra23-binaries/nvidia-tegra23-binaries.mk
 create mode 100644 package/nvidia-tegra23/nvidia-tegra23-codecs/Config.in
 create mode 100644 package/nvidia-tegra23/nvidia-tegra23-codecs/nvidia-tegra23-codecs.hash
 create mode 100644 package/nvidia-tegra23/nvidia-tegra23-codecs/nvidia-tegra23-codecs.mk
 create mode 100644 package/nvidia-tegra23/nvidia-tegra23.mk

diff --git a/package/Config.in b/package/Config.in
index 28cf703..47d2dcd 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -344,6 +344,7 @@ endif
 	source "package/minicom/Config.in"
 	source "package/nanocom/Config.in"
 	source "package/neard/Config.in"
+	source "package/nvidia-tegra23/Config.in"
 	source "package/ofono/Config.in"
 	source "package/ola/Config.in"
 	source "package/on2-8170-modules/Config.in"
diff --git a/package/jpeg/Config.in b/package/jpeg/Config.in
index f337aeb..a1a99aa 100644
--- a/package/jpeg/Config.in
+++ b/package/jpeg/Config.in
@@ -30,6 +30,15 @@ config BR2_PACKAGE_JPEG_TURBO
 
 	  http://www.libjpeg-turbo.org
 
+config BR2_PACKAGE_JPEG_TEGRA23
+	bool "jpeg accelerated for tegra2 or tegra3"
+	depends on BR2_PACKAGE_NVIDIA_TEGRA23_BINARIES
+	select BR2_PACKAGE_HAS_JPEG
+	help
+	  Accelerated libjpeg for tegra
+
+	  https://developer.nvidia.com/linux-tegra
+
 endchoice
 
 config BR2_PACKAGE_HAS_JPEG
@@ -39,5 +48,6 @@ config BR2_PACKAGE_PROVIDES_JPEG
 	string
 	default "libjpeg"    if BR2_PACKAGE_LIBJPEG
 	default "jpeg-turbo" if BR2_PACKAGE_JPEG_TURBO
+	default "nvidia-tegra23-binaries" if BR2_PACKAGE_JPEG_TEGRA23
 
 endif
diff --git a/package/nvidia-tegra23/Config.in b/package/nvidia-tegra23/Config.in
new file mode 100644
index 0000000..0bc28c2
--- /dev/null
+++ b/package/nvidia-tegra23/Config.in
@@ -0,0 +1,2 @@
+source "package/nvidia-tegra23/nvidia-tegra23-binaries/Config.in"
+source "package/nvidia-tegra23/nvidia-tegra23-codecs/Config.in"
diff --git a/package/nvidia-tegra23/nvidia-tegra23-binaries/Config.in b/package/nvidia-tegra23/nvidia-tegra23-binaries/Config.in
new file mode 100644
index 0000000..a5a0681
--- /dev/null
+++ b/package/nvidia-tegra23/nvidia-tegra23-binaries/Config.in
@@ -0,0 +1,119 @@
+config BR2_PACKAGE_NVIDIA_TEGRA23_BINARIES
+	bool "nvidia-tegra23"
+	depends on BR2_arm && BR2_cortex_a9
+	depends on BR2_ARM_EABIHF && BR2_TOOLCHAIN_USES_GLIBC
+	depends on BR2_PACKAGE_XORG7
+	select BR2_PACKAGE_XLIB_LIBXT
+	select BR2_PACKAGE_XLIB_LIBXEXT
+	select BR2_PACKAGE_XLIB_LIBXV
+	select BR2_PACKAGE_HAS_LIBEGL
+	select BR2_PACKAGE_HAS_LIBGLES
+	select BR2_PACKAGE_HAS_LIBOPENMAX
+	help
+	  Those packages provide libraries, drivers and firmware that comes from
+	  NVIDIA Linux For Tegra.
+
+	  https://developer.nvidia.com/linux-tegra
+
+if BR2_PACKAGE_NVIDIA_TEGRA23_BINARIES
+
+config BR2_PACKAGE_PROVIDES_LIBEGL
+	default "nvidia-tegra23-binaries"
+
+config BR2_PACKAGE_PROVIDES_LIBGLES
+	default "nvidia-tegra23-binaries"
+
+config BR2_PACKAGE_PROVIDES_LIBOPENMAX
+	default "nvidia-tegra23-binaries"
+
+config BR2_PACKAGE_NVIDIA_TEGRA23_BINARIES_GSTREAMER_PLUGINS
+	bool "GStreamer 0.10.x plugins"
+	select BR2_PACKAGE_GSTREAMER
+	help
+	  GStreamer 0.10.x plugins
+
+config BR2_PACKAGE_NVIDIA_TEGRA23_BINARIES_NV_SAMPLE_APPS
+	bool "NVIDIA multimedia sample apps"
+	depends on BR2_PACKAGE_NVIDIA_TEGRA23_BINARIES_GSTREAMER_PLUGINS
+	help
+	  nvgstplayer and nvgstcapture multimedia test applications.
+
+choice
+	prompt "Tegra platform"
+	help
+	  Select the SOC platform.
+
+config BR2_PACKAGE_NVIDIA_TEGRA23_BINARIES_TEGRA2
+	bool "Tegra 2"
+	depends on !BR2_ARM_CPU_HAS_NEON
+	help
+	  NVIDIA Tegra 2 is a dual cores Cortex-A9 without NEON.
+
+config BR2_PACKAGE_NVIDIA_TEGRA23_BINARIES_TEGRA3
+	bool "Tegra 3"
+	help
+	  NVIDIA Tegra 3 is a quad cores Cortex-A9 with NEON.
+
+endchoice
+
+choice
+	prompt "X11 ABI version"
+	default BR2_PACKAGE_NVIDIA_TEGRA23_BINARIES_X11ABI_V11
+	help
+	  Select Tegra X11 ABI version.
+
+config BR2_PACKAGE_NVIDIA_TEGRA23_BINARIES_X11ABI_V5
+	bool "X11 ABI 5"
+	help
+	  Tegra X11 ABI 5.
+
+config BR2_PACKAGE_NVIDIA_TEGRA23_BINARIES_X11ABI_V6
+	bool "X11 ABI 6"
+	help
+	  Tegra X11 ABI 6.
+
+config BR2_PACKAGE_NVIDIA_TEGRA23_BINARIES_X11ABI_V7
+	bool "X11 ABI 7"
+	help
+	  Tegra X11 ABI 7.
+
+config BR2_PACKAGE_NVIDIA_TEGRA23_BINARIES_X11ABI_V8
+	bool "X11 ABI 8"
+	help
+	  Tegra X11 ABI 8.
+
+config BR2_PACKAGE_NVIDIA_TEGRA23_BINARIES_X11ABI_V10
+	bool "X11 ABI 10"
+	help
+	  Tegra X11 ABI 10.
+
+config BR2_PACKAGE_NVIDIA_TEGRA23_BINARIES_X11ABI_V11
+	bool "X11 ABI 11"
+	help
+	  Tegra X11 ABI 11.
+
+config BR2_PACKAGE_NVIDIA_TEGRA23_BINARIES_X11ABI_V12
+	bool "X11 ABI 12"
+	help
+	  Tegra X11 ABI 12.
+
+config BR2_PACKAGE_NVIDIA_TEGRA23_BINARIES_X11ABI_V13
+	bool "X11 ABI 13"
+	help
+	  Tegra X11 ABI 13.
+
+config BR2_PACKAGE_NVIDIA_TEGRA23_BINARIES_X11ABI_V14
+	bool "X11 ABI 14"
+	help
+	  Tegra X11 ABI 14.
+
+endchoice
+
+comment "tegra2 platform need NEON SIMD disabled"
+	depends on BR2_ARM_CPU_HAS_NEON
+
+endif
+
+comment "nvidia-tegra23-binaries needs a (e)glibc toolchain w/ EABIhf"
+	depends on BR2_arm && BR2_cortex_a9
+	depends on !(BR2_ARM_EABIHF && BR2_TOOLCHAIN_USES_GLIBC)
diff --git a/package/nvidia-tegra23/nvidia-tegra23-binaries/nvidia-tegra23-binaries-000-headers.patch b/package/nvidia-tegra23/nvidia-tegra23-binaries/nvidia-tegra23-binaries-000-headers.patch
new file mode 100644
index 0000000..e7fb106
--- /dev/null
+++ b/package/nvidia-tegra23/nvidia-tegra23-binaries/nvidia-tegra23-binaries-000-headers.patch
@@ -0,0 +1,14047 @@
+diff -rupN a/usr/include/EGL/eglext.h b/usr/include/EGL/eglext.h
+--- a/usr/include/EGL/eglext.h	1970-01-01 01:00:00.000000000 +0100
++++ b/usr/include/EGL/eglext.h	2013-10-09 09:57:33.000000000 +0200
+@@ -0,0 +1,618 @@
++#ifndef __eglext_h_
++#define __eglext_h_ 1
++
++#ifdef __cplusplus
++extern "C" {
++#endif
++
++/*
++** Copyright (c) 2013 The Khronos Group Inc.
++**
++** Permission is hereby granted, free of charge, to any person obtaining a
++** copy of this software and/or associated documentation files (the
++** "Materials"), to deal in the Materials without restriction, including
++** without limitation the rights to use, copy, modify, merge, publish,
++** distribute, sublicense, and/or sell copies of the Materials, and to
++** permit persons to whom the Materials are furnished to do so, subject to
++** the following conditions:
++**
++** The above copyright notice and this permission notice shall be included
++** in all copies or substantial portions of the Materials.
++**
++** THE MATERIALS ARE PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
++** EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
++** MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
++** IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
++** CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
++** TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
++** MATERIALS OR THE USE OR OTHER DEALINGS IN THE MATERIALS.
++*/
++/*
++** This header is generated from the Khronos OpenGL / OpenGL ES XML
++** API Registry. The current version of the Registry, generator scripts
++** used to make the header, and the header can be found at
++**   http://www.opengl.org/registry/
++**
++** Khronos $Revision: 23328 $ on $Date: 2013-10-02 02:28:28 -0700 (Wed, 02 Oct 2013) $
++*/
++
++#include <EGL/eglplatform.h>
++
++#define EGL_EGLEXT_VERSION 20130917
++
++/* Generated C header for:
++ * API: egl
++ * Versions considered: .*
++ * Versions emitted: _nomatch_^
++ * Default extensions included: egl
++ * Additional extensions included: _nomatch_^
++ * Extensions removed: _nomatch_^
++ */
++
++#ifndef EGL_KHR_cl_event
++#define EGL_KHR_cl_event 1
++#define EGL_CL_EVENT_HANDLE_KHR           0x309C
++#define EGL_SYNC_CL_EVENT_KHR             0x30FE
++#define EGL_SYNC_CL_EVENT_COMPLETE_KHR    0x30FF
++#endif /* EGL_KHR_cl_event */
++
++#ifndef EGL_KHR_client_get_all_proc_addresses
++#define EGL_KHR_client_get_all_proc_addresses 1
++#endif /* EGL_KHR_client_get_all_proc_addresses */
++
++#ifndef EGL_KHR_config_attribs
++#define EGL_KHR_config_attribs 1
++#define EGL_CONFORMANT_KHR                0x3042
++#define EGL_VG_COLORSPACE_LINEAR_BIT_KHR  0x0020
++#define EGL_VG_ALPHA_FORMAT_PRE_BIT_KHR   0x0040
++#endif /* EGL_KHR_config_attribs */
++
++#ifndef EGL_KHR_create_context
++#define EGL_KHR_create_context 1
++#define EGL_CONTEXT_MAJOR_VERSION_KHR     0x3098
++#define EGL_CONTEXT_MINOR_VERSION_KHR     0x30FB
++#define EGL_CONTEXT_FLAGS_KHR             0x30FC
++#define EGL_CONTEXT_OPENGL_PROFILE_MASK_KHR 0x30FD
++#define EGL_CONTEXT_OPENGL_RESET_NOTIFICATION_STRATEGY_KHR 0x31BD
++#define EGL_NO_RESET_NOTIFICATION_KHR     0x31BE
++#define EGL_LOSE_CONTEXT_ON_RESET_KHR     0x31BF
++#define EGL_CONTEXT_OPENGL_DEBUG_BIT_KHR  0x00000001
++#define EGL_CONTEXT_OPENGL_FORWARD_COMPATIBLE_BIT_KHR 0x00000002
++#define EGL_CONTEXT_OPENGL_ROBUST_ACCESS_BIT_KHR 0x00000004
++#define EGL_CONTEXT_OPENGL_CORE_PROFILE_BIT_KHR 0x00000001
++#define EGL_CONTEXT_OPENGL_COMPATIBILITY_PROFILE_BIT_KHR 0x00000002
++#define EGL_OPENGL_ES3_BIT_KHR            0x00000040
++#endif /* EGL_KHR_create_context */
++
++#ifndef EGL_KHR_fence_sync
++#define EGL_KHR_fence_sync 1
++#ifdef KHRONOS_SUPPORT_INT64
++#define EGL_SYNC_PRIOR_COMMANDS_COMPLETE_KHR 0x30F0
++#define EGL_SYNC_CONDITION_KHR            0x30F8
++#define EGL_SYNC_FENCE_KHR                0x30F9
++#endif /* KHRONOS_SUPPORT_INT64 */
++#endif /* EGL_KHR_fence_sync */
++
++#ifndef EGL_KHR_get_all_proc_addresses
++#define EGL_KHR_get_all_proc_addresses 1
++#endif /* EGL_KHR_get_all_proc_addresses */
++
++#ifndef EGL_KHR_gl_renderbuffer_image
++#define EGL_KHR_gl_renderbuffer_image 1
++#define EGL_GL_RENDERBUFFER_KHR           0x30B9
++#endif /* EGL_KHR_gl_renderbuffer_image */
++
++#ifndef EGL_KHR_gl_texture_2D_image
++#define EGL_KHR_gl_texture_2D_image 1
++#define EGL_GL_TEXTURE_2D_KHR             0x30B1
++#define EGL_GL_TEXTURE_LEVEL_KHR          0x30BC
++#endif /* EGL_KHR_gl_texture_2D_image */
++
++#ifndef EGL_KHR_gl_texture_3D_image
++#define EGL_KHR_gl_texture_3D_image 1
++#define EGL_GL_TEXTURE_3D_KHR             0x30B2
++#define EGL_GL_TEXTURE_ZOFFSET_KHR        0x30BD
++#endif /* EGL_KHR_gl_texture_3D_image */
++
++#ifndef EGL_KHR_gl_texture_cubemap_image
++#define EGL_KHR_gl_texture_cubemap_image 1
++#define EGL_GL_TEXTURE_CUBE_MAP_POSITIVE_X_KHR 0x30B3
++#define EGL_GL_TEXTURE_CUBE_MAP_NEGATIVE_X_KHR 0x30B4
++#define EGL_GL_TEXTURE_CUBE_MAP_POSITIVE_Y_KHR 0x30B5
++#define EGL_GL_TEXTURE_CUBE_MAP_NEGATIVE_Y_KHR 0x30B6
++#define EGL_GL_TEXTURE_CUBE_MAP_POSITIVE_Z_KHR 0x30B7
++#define EGL_GL_TEXTURE_CUBE_MAP_NEGATIVE_Z_KHR 0x30B8
++#endif /* EGL_KHR_gl_texture_cubemap_image */
++
++#ifndef EGL_KHR_image
++#define EGL_KHR_image 1
++typedef void *EGLImageKHR;
++#define EGL_NATIVE_PIXMAP_KHR             0x30B0
++#define EGL_NO_IMAGE_KHR                  ((EGLImageKHR)0)
++typedef EGLImageKHR (EGLAPIENTRYP PFNEGLCREATEIMAGEKHRPROC) (EGLDisplay dpy, EGLContext ctx, EGLenum target, EGLClientBuffer buffer, const EGLint *attrib_list);
++typedef EGLBoolean (EGLAPIENTRYP PFNEGLDESTROYIMAGEKHRPROC) (EGLDisplay dpy, EGLImageKHR image);
++#ifdef EGL_EGLEXT_PROTOTYPES
++EGLAPI EGLImageKHR EGLAPIENTRY eglCreateImageKHR (EGLDisplay dpy, EGLContext ctx, EGLenum target, EGLClientBuffer buffer, const EGLint *attrib_list);
++EGLAPI EGLBoolean EGLAPIENTRY eglDestroyImageKHR (EGLDisplay dpy, EGLImageKHR image);
++#endif
++#endif /* EGL_KHR_image */
++
++#ifndef EGL_KHR_image_base
++#define EGL_KHR_image_base 1
++#define EGL_IMAGE_PRESERVED_KHR           0x30D2
++#endif /* EGL_KHR_image_base */
++
++#ifndef EGL_KHR_image_pixmap
++#define EGL_KHR_image_pixmap 1
++#endif /* EGL_KHR_image_pixmap */
++
++#ifndef EGL_KHR_lock_surface
++#define EGL_KHR_lock_surface 1
++#define EGL_READ_SURFACE_BIT_KHR          0x0001
++#define EGL_WRITE_SURFACE_BIT_KHR         0x0002
++#define EGL_LOCK_SURFACE_BIT_KHR          0x0080
++#define EGL_OPTIMAL_FORMAT_BIT_KHR        0x0100
++#define EGL_MATCH_FORMAT_KHR              0x3043
++#define EGL_FORMAT_RGB_565_EXACT_KHR      0x30C0
++#define EGL_FORMAT_RGB_565_KHR            0x30C1
++#define EGL_FORMAT_RGBA_8888_EXACT_KHR    0x30C2
++#define EGL_FORMAT_RGBA_8888_KHR          0x30C3
++#define EGL_MAP_PRESERVE_PIXELS_KHR       0x30C4
++#define EGL_LOCK_USAGE_HINT_KHR           0x30C5
++#define EGL_BITMAP_POINTER_KHR            0x30C6
++#define EGL_BITMAP_PITCH_KHR              0x30C7
++#define EGL_BITMAP_ORIGIN_KHR             0x30C8
++#define EGL_BITMAP_PIXEL_RED_OFFSET_KHR   0x30C9
++#define EGL_BITMAP_PIXEL_GREEN_OFFSET_KHR 0x30CA
++#define EGL_BITMAP_PIXEL_BLUE_OFFSET_KHR  0x30CB
++#define EGL_BITMAP_PIXEL_ALPHA_OFFSET_KHR 0x30CC
++#define EGL_BITMAP_PIXEL_LUMINANCE_OFFSET_KHR 0x30CD
++#define EGL_LOWER_LEFT_KHR                0x30CE
++#define EGL_UPPER_LEFT_KHR                0x30CF
++typedef EGLBoolean (EGLAPIENTRYP PFNEGLLOCKSURFACEKHRPROC) (EGLDisplay display, EGLSurface surface, const EGLint *attrib_list);
++typedef EGLBoolean (EGLAPIENTRYP PFNEGLUNLOCKSURFACEKHRPROC) (EGLDisplay display, EGLSurface surface);
++#ifdef EGL_EGLEXT_PROTOTYPES
++EGLAPI EGLBoolean EGLAPIENTRY eglLockSurfaceKHR (EGLDisplay display, EGLSurface surface, const EGLint *attrib_list);
++EGLAPI EGLBoolean EGLAPIENTRY eglUnlockSurfaceKHR (EGLDisplay display, EGLSurface surface);
++#endif
++#endif /* EGL_KHR_lock_surface */
++
++#ifndef EGL_KHR_lock_surface2
++#define EGL_KHR_lock_surface2 1
++#define EGL_BITMAP_PIXEL_SIZE_KHR         0x3110
++#endif /* EGL_KHR_lock_surface2 */
++
++#ifndef EGL_KHR_reusable_sync
++#define EGL_KHR_reusable_sync 1
++typedef void *EGLSyncKHR;
++typedef khronos_utime_nanoseconds_t EGLTimeKHR;
++#ifdef KHRONOS_SUPPORT_INT64
++#define EGL_SYNC_STATUS_KHR               0x30F1
++#define EGL_SIGNALED_KHR                  0x30F2
++#define EGL_UNSIGNALED_KHR                0x30F3
++#define EGL_TIMEOUT_EXPIRED_KHR           0x30F5
++#define EGL_CONDITION_SATISFIED_KHR       0x30F6
++#define EGL_SYNC_TYPE_KHR                 0x30F7
++#define EGL_SYNC_REUSABLE_KHR             0x30FA
++#define EGL_SYNC_FLUSH_COMMANDS_BIT_KHR   0x0001
++#define EGL_FOREVER_KHR                   0xFFFFFFFFFFFFFFFFull
++#define EGL_NO_SYNC_KHR                   ((EGLSyncKHR)0)
++typedef EGLSyncKHR (EGLAPIENTRYP PFNEGLCREATESYNCKHRPROC) (EGLDisplay dpy, EGLenum type, const EGLint *attrib_list);
++typedef EGLBoolean (EGLAPIENTRYP PFNEGLDESTROYSYNCKHRPROC) (EGLDisplay dpy, EGLSyncKHR sync);
++typedef EGLint (EGLAPIENTRYP PFNEGLCLIENTWAITSYNCKHRPROC) (EGLDisplay dpy, EGLSyncKHR sync, EGLint flags, EGLTimeKHR timeout);
++typedef EGLBoolean (EGLAPIENTRYP PFNEGLSIGNALSYNCKHRPROC) (EGLDisplay dpy, EGLSyncKHR sync, EGLenum mode);
++typedef EGLBoolean (EGLAPIENTRYP PFNEGLGETSYNCATTRIBKHRPROC) (EGLDisplay dpy, EGLSyncKHR sync, EGLint attribute, EGLint *value);
++#ifdef EGL_EGLEXT_PROTOTYPES
++EGLAPI EGLSyncKHR EGLAPIENTRY eglCreateSyncKHR (EGLDisplay dpy, EGLenum type, const EGLint *attrib_list);
++EGLAPI EGLBoolean EGLAPIENTRY eglDestroySyncKHR (EGLDisplay dpy, EGLSyncKHR sync);
++EGLAPI EGLint EGLAPIENTRY eglClientWaitSyncKHR (EGLDisplay dpy, EGLSyncKHR sync, EGLint flags, EGLTimeKHR timeout);
++EGLAPI EGLBoolean EGLAPIENTRY eglSignalSyncKHR (EGLDisplay dpy, EGLSyncKHR sync, EGLenum mode);
++EGLAPI EGLBoolean EGLAPIENTRY eglGetSyncAttribKHR (EGLDisplay dpy, EGLSyncKHR sync, EGLint attribute, EGLint *value);
++#endif
++#endif /* KHRONOS_SUPPORT_INT64 */
++#endif /* EGL_KHR_reusable_sync */
++
++#ifndef EGL_KHR_stream
++#define EGL_KHR_stream 1
++typedef void *EGLStreamKHR;
++typedef khronos_uint64_t EGLuint64KHR;
++#ifdef KHRONOS_SUPPORT_INT64
++#define EGL_NO_STREAM_KHR                 ((EGLStreamKHR)0)
++#define EGL_CONSUMER_LATENCY_USEC_KHR     0x3210
++#define EGL_PRODUCER_FRAME_KHR            0x3212
++#define EGL_CONSUMER_FRAME_KHR            0x3213
++#define EGL_STREAM_STATE_KHR              0x3214
++#define EGL_STREAM_STATE_CREATED_KHR      0x3215
++#define EGL_STREAM_STATE_CONNECTING_KHR   0x3216
++#define EGL_STREAM_STATE_EMPTY_KHR        0x3217
++#define EGL_STREAM_STATE_NEW_FRAME_AVAILABLE_KHR 0x3218
++#define EGL_STREAM_STATE_OLD_FRAME_AVAILABLE_KHR 0x3219
++#define EGL_STREAM_STATE_DISCONNECTED_KHR 0x321A
++#define EGL_BAD_STREAM_KHR                0x321B
++#define EGL_BAD_STATE_KHR                 0x321C
++typedef EGLStreamKHR (EGLAPIENTRYP PFNEGLCREATESTREAMKHRPROC) (EGLDisplay dpy, const EGLint *attrib_list);
++typedef EGLBoolean (EGLAPIENTRYP PFNEGLDESTROYSTREAMKHRPROC) (EGLDisplay dpy, EGLStreamKHR stream);
++typedef EGLBoolean (EGLAPIENTRYP PFNEGLSTREAMATTRIBKHRPROC) (EGLDisplay dpy, EGLStreamKHR stream, EGLenum attribute, EGLint value);
++typedef EGLBoolean (EGLAPIENTRYP PFNEGLQUERYSTREAMKHRPROC) (EGLDisplay dpy, EGLStreamKHR stream, EGLenum attribute, EGLint *value);
++typedef EGLBoolean (EGLAPIENTRYP PFNEGLQUERYSTREAMU64KHRPROC) (EGLDisplay dpy, EGLStreamKHR stream, EGLenum attribute, EGLuint64KHR *value);
++#ifdef EGL_EGLEXT_PROTOTYPES
++EGLAPI EGLStreamKHR EGLAPIENTRY eglCreateStreamKHR (EGLDisplay dpy, const EGLint *attrib_list);
++EGLAPI EGLBoolean EGLAPIENTRY eglDestroyStreamKHR (EGLDisplay dpy, EGLStreamKHR stream);
++EGLAPI EGLBoolean EGLAPIENTRY eglStreamAttribKHR (EGLDisplay dpy, EGLStreamKHR stream, EGLenum attribute, EGLint value);
++EGLAPI EGLBoolean EGLAPIENTRY eglQueryStreamKHR (EGLDisplay dpy, EGLStreamKHR stream, EGLenum attribute, EGLint *value);
++EGLAPI EGLBoolean EGLAPIENTRY eglQueryStreamu64KHR (EGLDisplay dpy, EGLStreamKHR stream, EGLenum attribute, EGLuint64KHR *value);
++#endif
++#endif /* KHRONOS_SUPPORT_INT64 */
++#endif /* EGL_KHR_stream */
++
++#ifndef EGL_KHR_stream_consumer_gltexture
++#define EGL_KHR_stream_consumer_gltexture 1
++#ifdef EGL_KHR_stream
++#define EGL_CONSUMER_ACQUIRE_TIMEOUT_USEC_KHR 0x321E
++typedef EGLBoolean (EGLAPIENTRYP PFNEGLSTREAMCONSUMERGLTEXTUREEXTERNALKHRPROC) (EGLDisplay dpy, EGLStreamKHR stream);
++typedef EGLBoolean (EGLAPIENTRYP PFNEGLSTREAMCONSUMERACQUIREKHRPROC) (EGLDisplay dpy, EGLStreamKHR stream);
++typedef EGLBoolean (EGLAPIENTRYP PFNEGLSTREAMCONSUMERRELEASEKHRPROC) (EGLDisplay dpy, EGLStreamKHR stream);
++#ifdef EGL_EGLEXT_PROTOTYPES
++EGLAPI EGLBoolean EGLAPIENTRY eglStreamConsumerGLTextureExternalKHR (EGLDisplay dpy, EGLStreamKHR stream);
++EGLAPI EGLBoolean EGLAPIENTRY eglStreamConsumerAcquireKHR (EGLDisplay dpy, EGLStreamKHR stream);
++EGLAPI EGLBoolean EGLAPIENTRY eglStreamConsumerReleaseKHR (EGLDisplay dpy, EGLStreamKHR stream);
++#endif
++#endif /* EGL_KHR_stream */
++#endif /* EGL_KHR_stream_consumer_gltexture */
++
++#ifndef EGL_KHR_stream_cross_process_fd
++#define EGL_KHR_stream_cross_process_fd 1
++typedef int EGLNativeFileDescriptorKHR;
++#ifdef EGL_KHR_stream
++#define EGL_NO_FILE_DESCRIPTOR_KHR        ((EGLNativeFileDescriptorKHR)(-1))
++typedef EGLNativeFileDescriptorKHR (EGLAPIENTRYP PFNEGLGETSTREAMFILEDESCRIPTORKHRPROC) (EGLDisplay dpy, EGLStreamKHR stream);
++typedef EGLStreamKHR (EGLAPIENTRYP PFNEGLCREATESTREAMFROMFILEDESCRIPTORKHRPROC) (EGLDisplay dpy, EGLNativeFileDescriptorKHR file_descriptor);
++#ifdef EGL_EGLEXT_PROTOTYPES
++EGLAPI EGLNativeFileDescriptorKHR EGLAPIENTRY eglGetStreamFileDescriptorKHR (EGLDisplay dpy, EGLStreamKHR stream);
++EGLAPI EGLStreamKHR EGLAPIENTRY eglCreateStreamFromFileDescriptorKHR (EGLDisplay dpy, EGLNativeFileDescriptorKHR file_descriptor);
++#endif
++#endif /* EGL_KHR_stream */
++#endif /* EGL_KHR_stream_cross_process_fd */
++
++#ifndef EGL_KHR_stream_fifo
++#define EGL_KHR_stream_fifo 1
++#ifdef EGL_KHR_stream
++#define EGL_STREAM_FIFO_LENGTH_KHR        0x31FC
++#define EGL_STREAM_TIME_NOW_KHR           0x31FD
++#define EGL_STREAM_TIME_CONSUMER_KHR      0x31FE
++#define EGL_STREAM_TIME_PRODUCER_KHR      0x31FF
++typedef EGLBoolean (EGLAPIENTRYP PFNEGLQUERYSTREAMTIMEKHRPROC) (EGLDisplay dpy, EGLStreamKHR stream, EGLenum attribute, EGLTimeKHR *value);
++#ifdef EGL_EGLEXT_PROTOTYPES
++EGLAPI EGLBoolean EGLAPIENTRY eglQueryStreamTimeKHR (EGLDisplay dpy, EGLStreamKHR stream, EGLenum attribute, EGLTimeKHR *value);
++#endif
++#endif /* EGL_KHR_stream */
++#endif /* EGL_KHR_stream_fifo */
++
++#ifndef EGL_KHR_stream_producer_aldatalocator
++#define EGL_KHR_stream_producer_aldatalocator 1
++#ifdef EGL_KHR_stream
++#endif /* EGL_KHR_stream */
++#endif /* EGL_KHR_stream_producer_aldatalocator */
++
++#ifndef EGL_KHR_stream_producer_eglsurface
++#define EGL_KHR_stream_producer_eglsurface 1
++#ifdef EGL_KHR_stream
++#define EGL_STREAM_BIT_KHR                0x0800
++typedef EGLSurface (EGLAPIENTRYP PFNEGLCREATESTREAMPRODUCERSURFACEKHRPROC) (EGLDisplay dpy, EGLConfig config, EGLStreamKHR stream, const EGLint *attrib_list);
++#ifdef EGL_EGLEXT_PROTOTYPES
++EGLAPI EGLSurface EGLAPIENTRY eglCreateStreamProducerSurfaceKHR (EGLDisplay dpy, EGLConfig config, EGLStreamKHR stream, const EGLint *attrib_list);
++#endif
++#endif /* EGL_KHR_stream */
++#endif /* EGL_KHR_stream_producer_eglsurface */
++
++#ifndef EGL_KHR_surfaceless_context
++#define EGL_KHR_surfaceless_context 1
++#endif /* EGL_KHR_surfaceless_context */
++
++#ifndef EGL_KHR_vg_parent_image
++#define EGL_KHR_vg_parent_image 1
++#define EGL_VG_PARENT_IMAGE_KHR           0x30BA
++#endif /* EGL_KHR_vg_parent_image */
++
++#ifndef EGL_KHR_wait_sync
++#define EGL_KHR_wait_sync 1
++typedef EGLint (EGLAPIENTRYP PFNEGLWAITSYNCKHRPROC) (EGLDisplay dpy, EGLSyncKHR sync, EGLint flags);
++#ifdef EGL_EGLEXT_PROTOTYPES
++EGLAPI EGLint EGLAPIENTRY eglWaitSyncKHR (EGLDisplay dpy, EGLSyncKHR sync, EGLint flags);
++#endif
++#endif /* EGL_KHR_wait_sync */
++
++#ifndef EGL_ANDROID_blob_cache
++#define EGL_ANDROID_blob_cache 1
++typedef khronos_ssize_t EGLsizeiANDROID;
++typedef void (*EGLSetBlobFuncANDROID) (const void *key, EGLsizeiANDROID keySize, const void *value, EGLsizeiANDROID valueSize);
++typedef EGLsizeiANDROID (*EGLGetBlobFuncANDROID) (const void *key, EGLsizeiANDROID keySize, void *value, EGLsizeiANDROID valueSize);
++typedef void (EGLAPIENTRYP PFNEGLSETBLOBCACHEFUNCSANDROIDPROC) (EGLDisplay dpy, EGLSetBlobFuncANDROID set, EGLGetBlobFuncANDROID get);
++#ifdef EGL_EGLEXT_PROTOTYPES
++EGLAPI void EGLAPIENTRY eglSetBlobCacheFuncsANDROID (EGLDisplay dpy, EGLSetBlobFuncANDROID set, EGLGetBlobFuncANDROID get);
++#endif
++#endif /* EGL_ANDROID_blob_cache */
++
++#ifndef EGL_ANDROID_framebuffer_target
++#define EGL_ANDROID_framebuffer_target 1
++#define EGL_FRAMEBUFFER_TARGET_ANDROID    0x3147
++#endif /* EGL_ANDROID_framebuffer_target */
++
++#ifndef EGL_ANDROID_image_native_buffer
++#define EGL_ANDROID_image_native_buffer 1
++#define EGL_NATIVE_BUFFER_ANDROID         0x3140
++#endif /* EGL_ANDROID_image_native_buffer */
++
++#ifndef EGL_ANDROID_native_fence_sync
++#define EGL_ANDROID_native_fence_sync 1
++#define EGL_SYNC_NATIVE_FENCE_ANDROID     0x3144
++#define EGL_SYNC_NATIVE_FENCE_FD_ANDROID  0x3145
++#define EGL_SYNC_NATIVE_FENCE_SIGNALED_ANDROID 0x3146
++#define EGL_NO_NATIVE_FENCE_FD_ANDROID    -1
++typedef EGLint (EGLAPIENTRYP PFNEGLDUPNATIVEFENCEFDANDROIDPROC) (EGLDisplay dpy, EGLSyncKHR sync);
++#ifdef EGL_EGLEXT_PROTOTYPES
++EGLAPI EGLint EGLAPIENTRY eglDupNativeFenceFDANDROID (EGLDisplay dpy, EGLSyncKHR sync);
++#endif
++#endif /* EGL_ANDROID_native_fence_sync */
++
++#ifndef EGL_ANDROID_recordable
++#define EGL_ANDROID_recordable 1
++#define EGL_RECORDABLE_ANDROID            0x3142
++#endif /* EGL_ANDROID_recordable */
++
++#ifndef EGL_ANGLE_d3d_share_handle_client_buffer
++#define EGL_ANGLE_d3d_share_handle_client_buffer 1
++#define EGL_D3D_TEXTURE_2D_SHARE_HANDLE_ANGLE 0x3200
++#endif /* EGL_ANGLE_d3d_share_handle_client_buffer */
++
++#ifndef EGL_ANGLE_query_surface_pointer
++#define EGL_ANGLE_query_surface_pointer 1
++typedef EGLBoolean (EGLAPIENTRYP PFNEGLQUERYSURFACEPOINTERANGLEPROC) (EGLDisplay dpy, EGLSurface surface, EGLint attribute, void **value);
++#ifdef EGL_EGLEXT_PROTOTYPES
++EGLAPI EGLBoolean EGLAPIENTRY eglQuerySurfacePointerANGLE (EGLDisplay dpy, EGLSurface surface, EGLint attribute, void **value);
++#endif
++#endif /* EGL_ANGLE_query_surface_pointer */
++
++#ifndef EGL_ANGLE_surface_d3d_texture_2d_share_handle
++#define EGL_ANGLE_surface_d3d_texture_2d_share_handle 1
++#endif /* EGL_ANGLE_surface_d3d_texture_2d_share_handle */
++
++#ifndef EGL_ARM_pixmap_multisample_discard
++#define EGL_ARM_pixmap_multisample_discard 1
++#define EGL_DISCARD_SAMPLES_ARM           0x3286
++#endif /* EGL_ARM_pixmap_multisample_discard */
++
++#ifndef EGL_EXT_buffer_age
++#define EGL_EXT_buffer_age 1
++#define EGL_BUFFER_AGE_EXT                0x313D
++#endif /* EGL_EXT_buffer_age */
++
++#ifndef EGL_EXT_client_extensions
++#define EGL_EXT_client_extensions 1
++#endif /* EGL_EXT_client_extensions */
++
++#ifndef EGL_EXT_create_context_robustness
++#define EGL_EXT_create_context_robustness 1
++#define EGL_CONTEXT_OPENGL_ROBUST_ACCESS_EXT 0x30BF
++#define EGL_CONTEXT_OPENGL_RESET_NOTIFICATION_STRATEGY_EXT 0x3138
++#define EGL_NO_RESET_NOTIFICATION_EXT     0x31BE
++#define EGL_LOSE_CONTEXT_ON_RESET_EXT     0x31BF
++#endif /* EGL_EXT_create_context_robustness */
++
++#ifndef EGL_EXT_image_dma_buf_import
++#define EGL_EXT_image_dma_buf_import 1
++#define EGL_LINUX_DMA_BUF_EXT             0x3270
++#define EGL_LINUX_DRM_FOURCC_EXT          0x3271
++#define EGL_DMA_BUF_PLANE0_FD_EXT         0x3272
++#define EGL_DMA_BUF_PLANE0_OFFSET_EXT     0x3273
++#define EGL_DMA_BUF_PLANE0_PITCH_EXT      0x3274
++#define EGL_DMA_BUF_PLANE1_FD_EXT         0x3275
++#define EGL_DMA_BUF_PLANE1_OFFSET_EXT     0x3276
++#define EGL_DMA_BUF_PLANE1_PITCH_EXT      0x3277
++#define EGL_DMA_BUF_PLANE2_FD_EXT         0x3278
++#define EGL_DMA_BUF_PLANE2_OFFSET_EXT     0x3279
++#define EGL_DMA_BUF_PLANE2_PITCH_EXT      0x327A
++#define EGL_YUV_COLOR_SPACE_HINT_EXT      0x327B
++#define EGL_SAMPLE_RANGE_HINT_EXT         0x327C
++#define EGL_YUV_CHROMA_HORIZONTAL_SITING_HINT_EXT 0x327D
++#define EGL_YUV_CHROMA_VERTICAL_SITING_HINT_EXT 0x327E
++#define EGL_ITU_REC601_EXT                0x327F
++#define EGL_ITU_REC709_EXT                0x3280
++#define EGL_ITU_REC2020_EXT               0x3281
++#define EGL_YUV_FULL_RANGE_EXT            0x3282
++#define EGL_YUV_NARROW_RANGE_EXT          0x3283
++#define EGL_YUV_CHROMA_SITING_0_EXT       0x3284
++#define EGL_YUV_CHROMA_SITING_0_5_EXT     0x3285
++#endif /* EGL_EXT_image_dma_buf_import */
++
++#ifndef EGL_EXT_multiview_window
++#define EGL_EXT_multiview_window 1
++#define EGL_MULTIVIEW_VIEW_COUNT_EXT      0x3134
++#endif /* EGL_EXT_multiview_window */
++
++#ifndef EGL_EXT_platform_base
++#define EGL_EXT_platform_base 1
++typedef EGLDisplay (EGLAPIENTRYP PFNEGLGETPLATFORMDISPLAYEXTPROC) (EGLenum platform, void *native_display, const EGLint *attrib_list);
++typedef EGLSurface (EGLAPIENTRYP PFNEGLCREATEPLATFORMWINDOWSURFACEEXTPROC) (EGLDisplay dpy, EGLConfig config, void *native_window, const EGLint *attrib_list);
++typedef EGLSurface (EGLAPIENTRYP PFNEGLCREATEPLATFORMPIXMAPSURFACEEXTPROC) (EGLDisplay dpy, EGLConfig config, void *native_pixmap, const EGLint *attrib_list);
++#ifdef EGL_EGLEXT_PROTOTYPES
++EGLAPI EGLDisplay EGLAPIENTRY eglGetPlatformDisplayEXT (EGLenum platform, void *native_display, const EGLint *attrib_list);
++EGLAPI EGLSurface EGLAPIENTRY eglCreatePlatformWindowSurfaceEXT (EGLDisplay dpy, EGLConfig config, void *native_window, const EGLint *attrib_list);
++EGLAPI EGLSurface EGLAPIENTRY eglCreatePlatformPixmapSurfaceEXT (EGLDisplay dpy, EGLConfig config, void *native_pixmap, const EGLint *attrib_list);
++#endif
++#endif /* EGL_EXT_platform_base */
++
++#ifndef EGL_EXT_platform_x11
++#define EGL_EXT_platform_x11 1
++#define EGL_PLATFORM_X11_EXT              0x31D5
++#define EGL_PLATFORM_X11_SCREEN_EXT       0x31D6
++#endif /* EGL_EXT_platform_x11 */
++
++#ifndef EGL_EXT_swap_buffers_with_damage
++#define EGL_EXT_swap_buffers_with_damage 1
++typedef EGLBoolean (EGLAPIENTRYP PFNEGLSWAPBUFFERSWITHDAMAGEEXTPROC) (EGLDisplay dpy, EGLSurface surface, EGLint *rects, EGLint n_rects);
++#ifdef EGL_EGLEXT_PROTOTYPES
++EGLAPI EGLBoolean EGLAPIENTRY eglSwapBuffersWithDamageEXT (EGLDisplay dpy, EGLSurface surface, EGLint *rects, EGLint n_rects);
++#endif
++#endif /* EGL_EXT_swap_buffers_with_damage */
++
++#ifndef EGL_HI_clientpixmap
++#define EGL_HI_clientpixmap 1
++struct EGLClientPixmapHI {
++    void  *pData;
++    EGLint iWidth;
++    EGLint iHeight;
++    EGLint iStride;
++};
++#define EGL_CLIENT_PIXMAP_POINTER_HI      0x8F74
++typedef EGLSurface (EGLAPIENTRYP PFNEGLCREATEPIXMAPSURFACEHIPROC) (EGLDisplay dpy, EGLConfig config, struct EGLClientPixmapHI *pixmap);
++#ifdef EGL_EGLEXT_PROTOTYPES
++EGLAPI EGLSurface EGLAPIENTRY eglCreatePixmapSurfaceHI (EGLDisplay dpy, EGLConfig config, struct EGLClientPixmapHI *pixmap);
++#endif
++#endif /* EGL_HI_clientpixmap */
++
++#ifndef EGL_HI_colorformats
++#define EGL_HI_colorformats 1
++#define EGL_COLOR_FORMAT_HI               0x8F70
++#define EGL_COLOR_RGB_HI                  0x8F71
++#define EGL_COLOR_RGBA_HI                 0x8F72
++#define EGL_COLOR_ARGB_HI                 0x8F73
++#endif /* EGL_HI_colorformats */
++
++#ifndef EGL_IMG_context_priority
++#define EGL_IMG_context_priority 1
++#define EGL_CONTEXT_PRIORITY_LEVEL_IMG    0x3100
++#define EGL_CONTEXT_PRIORITY_HIGH_IMG     0x3101
++#define EGL_CONTEXT_PRIORITY_MEDIUM_IMG   0x3102
++#define EGL_CONTEXT_PRIORITY_LOW_IMG      0x3103
++#endif /* EGL_IMG_context_priority */
++
++#ifndef EGL_MESA_drm_image
++#define EGL_MESA_drm_image 1
++#define EGL_DRM_BUFFER_FORMAT_MESA        0x31D0
++#define EGL_DRM_BUFFER_USE_MESA           0x31D1
++#define EGL_DRM_BUFFER_FORMAT_ARGB32_MESA 0x31D2
++#define EGL_DRM_BUFFER_MESA               0x31D3
++#define EGL_DRM_BUFFER_STRIDE_MESA        0x31D4
++#define EGL_DRM_BUFFER_USE_SCANOUT_MESA   0x00000001
++#define EGL_DRM_BUFFER_USE_SHARE_MESA     0x00000002
++typedef EGLImageKHR (EGLAPIENTRYP PFNEGLCREATEDRMIMAGEMESAPROC) (EGLDisplay dpy, const EGLint *attrib_list);
++typedef EGLBoolean (EGLAPIENTRYP PFNEGLEXPORTDRMIMAGEMESAPROC) (EGLDisplay dpy, EGLImageKHR image, EGLint *name, EGLint *handle, EGLint *stride);
++#ifdef EGL_EGLEXT_PROTOTYPES
++EGLAPI EGLImageKHR EGLAPIENTRY eglCreateDRMImageMESA (EGLDisplay dpy, const EGLint *attrib_list);
++EGLAPI EGLBoolean EGLAPIENTRY eglExportDRMImageMESA (EGLDisplay dpy, EGLImageKHR image, EGLint *name, EGLint *handle, EGLint *stride);
++#endif
++#endif /* EGL_MESA_drm_image */
++
++#ifndef EGL_NV_3dvision_surface
++#define EGL_NV_3dvision_surface 1
++#define EGL_AUTO_STEREO_NV                0x3136
++#endif /* EGL_NV_3dvision_surface */
++
++#ifndef EGL_NV_coverage_sample
++#define EGL_NV_coverage_sample 1
++#define EGL_COVERAGE_BUFFERS_NV           0x30E0
++#define EGL_COVERAGE_SAMPLES_NV           0x30E1
++#endif /* EGL_NV_coverage_sample */
++
++#ifndef EGL_NV_coverage_sample_resolve
++#define EGL_NV_coverage_sample_resolve 1
++#define EGL_COVERAGE_SAMPLE_RESOLVE_NV    0x3131
++#define EGL_COVERAGE_SAMPLE_RESOLVE_DEFAULT_NV 0x3132
++#define EGL_COVERAGE_SAMPLE_RESOLVE_NONE_NV 0x3133
++#endif /* EGL_NV_coverage_sample_resolve */
++
++#ifndef EGL_NV_depth_nonlinear
++#define EGL_NV_depth_nonlinear 1
++#define EGL_DEPTH_ENCODING_NV             0x30E2
++#define EGL_DEPTH_ENCODING_NONE_NV        0
++#define EGL_DEPTH_ENCODING_NONLINEAR_NV   0x30E3
++#endif /* EGL_NV_depth_nonlinear */
++
++#ifndef EGL_NV_native_query
++#define EGL_NV_native_query 1
++typedef EGLBoolean (EGLAPIENTRYP PFNEGLQUERYNATIVEDISPLAYNVPROC) (EGLDisplay dpy, EGLNativeDisplayType *display_id);
++typedef EGLBoolean (EGLAPIENTRYP PFNEGLQUERYNATIVEWINDOWNVPROC) (EGLDisplay dpy, EGLSurface surf, EGLNativeWindowType *window);
++typedef EGLBoolean (EGLAPIENTRYP PFNEGLQUERYNATIVEPIXMAPNVPROC) (EGLDisplay dpy, EGLSurface surf, EGLNativePixmapType *pixmap);
++#ifdef EGL_EGLEXT_PROTOTYPES
++EGLAPI EGLBoolean EGLAPIENTRY eglQueryNativeDisplayNV (EGLDisplay dpy, EGLNativeDisplayType *display_id);
++EGLAPI EGLBoolean EGLAPIENTRY eglQueryNativeWindowNV (EGLDisplay dpy, EGLSurface surf, EGLNativeWindowType *window);
++EGLAPI EGLBoolean EGLAPIENTRY eglQueryNativePixmapNV (EGLDisplay dpy, EGLSurface surf, EGLNativePixmapType *pixmap);
++#endif
++#endif /* EGL_NV_native_query */
++
++#ifndef EGL_NV_post_convert_rounding
++#define EGL_NV_post_convert_rounding 1
++#endif /* EGL_NV_post_convert_rounding */
++
++#ifndef EGL_NV_post_sub_buffer
++#define EGL_NV_post_sub_buffer 1
++#define EGL_POST_SUB_BUFFER_SUPPORTED_NV  0x30BE
++typedef EGLBoolean (EGLAPIENTRYP PFNEGLPOSTSUBBUFFERNVPROC) (EGLDisplay dpy, EGLSurface surface, EGLint x, EGLint y, EGLint width, EGLint height);
++#ifdef EGL_EGLEXT_PROTOTYPES
++EGLAPI EGLBoolean EGLAPIENTRY eglPostSubBufferNV (EGLDisplay dpy, EGLSurface surface, EGLint x, EGLint y, EGLint width, EGLint height);
++#endif
++#endif /* EGL_NV_post_sub_buffer */
++
++#ifndef EGL_NV_stream_sync
++#define EGL_NV_stream_sync 1
++#define EGL_SYNC_NEW_FRAME_NV             0x321F
++typedef EGLSyncKHR (EGLAPIENTRYP PFNEGLCREATESTREAMSYNCNVPROC) (EGLDisplay dpy, EGLStreamKHR stream, EGLenum type, const EGLint *attrib_list);
++#ifdef EGL_EGLEXT_PROTOTYPES
++EGLAPI EGLSyncKHR EGLAPIENTRY eglCreateStreamSyncNV (EGLDisplay dpy, EGLStreamKHR stream, EGLenum type, const EGLint *attrib_list);
++#endif
++#endif /* EGL_NV_stream_sync */
++
++#ifndef EGL_NV_sync
++#define EGL_NV_sync 1
++typedef void *EGLSyncNV;
++typedef khronos_utime_nanoseconds_t EGLTimeNV;
++#ifdef KHRONOS_SUPPORT_INT64
++#define EGL_SYNC_PRIOR_COMMANDS_COMPLETE_NV 0x30E6
++#define EGL_SYNC_STATUS_NV                0x30E7
++#define EGL_SIGNALED_NV                   0x30E8
++#define EGL_UNSIGNALED_NV                 0x30E9
++#define EGL_SYNC_FLUSH_COMMANDS_BIT_NV    0x0001
++#define EGL_FOREVER_NV                    0xFFFFFFFFFFFFFFFFull
++#define EGL_ALREADY_SIGNALED_NV           0x30EA
++#define EGL_TIMEOUT_EXPIRED_NV            0x30EB
++#define EGL_CONDITION_SATISFIED_NV        0x30EC
++#define EGL_SYNC_TYPE_NV                  0x30ED
++#define EGL_SYNC_CONDITION_NV             0x30EE
++#define EGL_SYNC_FENCE_NV                 0x30EF
++#define EGL_NO_SYNC_NV                    ((EGLSyncNV)0)
++typedef EGLSyncNV (EGLAPIENTRYP PFNEGLCREATEFENCESYNCNVPROC) (EGLDisplay dpy, EGLenum condition, const EGLint *attrib_list);
++typedef EGLBoolean (EGLAPIENTRYP PFNEGLDESTROYSYNCNVPROC) (EGLSyncNV sync);
++typedef EGLBoolean (EGLAPIENTRYP PFNEGLFENCENVPROC) (EGLSyncNV sync);
++typedef EGLint (EGLAPIENTRYP PFNEGLCLIENTWAITSYNCNVPROC) (EGLSyncNV sync, EGLint flags, EGLTimeNV timeout);
++typedef EGLBoolean (EGLAPIENTRYP PFNEGLSIGNALSYNCNVPROC) (EGLSyncNV sync, EGLenum mode);
++typedef EGLBoolean (EGLAPIENTRYP PFNEGLGETSYNCATTRIBNVPROC) (EGLSyncNV sync, EGLint attribute, EGLint *value);
++#ifdef EGL_EGLEXT_PROTOTYPES
++EGLAPI EGLSyncNV EGLAPIENTRY eglCreateFenceSyncNV (EGLDisplay dpy, EGLenum condition, const EGLint *attrib_list);
++EGLAPI EGLBoolean EGLAPIENTRY eglDestroySyncNV (EGLSyncNV sync);
++EGLAPI EGLBoolean EGLAPIENTRY eglFenceNV (EGLSyncNV sync);
++EGLAPI EGLint EGLAPIENTRY eglClientWaitSyncNV (EGLSyncNV sync, EGLint flags, EGLTimeNV timeout);
++EGLAPI EGLBoolean EGLAPIENTRY eglSignalSyncNV (EGLSyncNV sync, EGLenum mode);
++EGLAPI EGLBoolean EGLAPIENTRY eglGetSyncAttribNV (EGLSyncNV sync, EGLint attribute, EGLint *value);
++#endif
++#endif /* KHRONOS_SUPPORT_INT64 */
++#endif /* EGL_NV_sync */
++
++#ifndef EGL_NV_system_time
++#define EGL_NV_system_time 1
++typedef khronos_utime_nanoseconds_t EGLuint64NV;
++#ifdef KHRONOS_SUPPORT_INT64
++typedef EGLuint64NV (EGLAPIENTRYP PFNEGLGETSYSTEMTIMEFREQUENCYNVPROC) (void);
++typedef EGLuint64NV (EGLAPIENTRYP PFNEGLGETSYSTEMTIMENVPROC) (void);
++#ifdef EGL_EGLEXT_PROTOTYPES
++EGLAPI EGLuint64NV EGLAPIENTRY eglGetSystemTimeFrequencyNV (void);
++EGLAPI EGLuint64NV EGLAPIENTRY eglGetSystemTimeNV (void);
++#endif
++#endif /* KHRONOS_SUPPORT_INT64 */
++#endif /* EGL_NV_system_time */
++
++#ifdef __cplusplus
++}
++#endif
++
++#endif
+diff -rupN a/usr/include/EGL/egl.h b/usr/include/EGL/egl.h
+--- a/usr/include/EGL/egl.h	1970-01-01 01:00:00.000000000 +0100
++++ b/usr/include/EGL/egl.h	2013-10-09 09:57:33.000000000 +0200
+@@ -0,0 +1,329 @@
++/* -*- mode: c; tab-width: 8; -*- */
++/* vi: set sw=4 ts=8: */
++/* Reference version of egl.h for EGL 1.4.
++ * $Revision: 9356 $ on $Date: 2009-10-21 02:52:25 -0700 (Wed, 21 Oct 2009) $
++ */
++
++/*
++** Copyright (c) 2007-2009 The Khronos Group Inc.
++**
++** Permission is hereby granted, free of charge, to any person obtaining a
++** copy of this software and/or associated documentation files (the
++** "Materials"), to deal in the Materials without restriction, including
++** without limitation the rights to use, copy, modify, merge, publish,
++** distribute, sublicense, and/or sell copies of the Materials, and to
++** permit persons to whom the Materials are furnished to do so, subject to
++** the following conditions:
++**
++** The above copyright notice and this permission notice shall be included
++** in all copies or substantial portions of the Materials.
++**
++** THE MATERIALS ARE PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
++** EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
++** MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
++** IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
++** CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
++** TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
++** MATERIALS OR THE USE OR OTHER DEALINGS IN THE MATERIALS.
++*/
++
++#ifndef __egl_h_
++#define __egl_h_
++
++/* All platform-dependent types and macro boilerplate (such as EGLAPI
++ * and EGLAPIENTRY) should go in eglplatform.h.
++ */
++#include <EGL/eglplatform.h>
++
++#ifdef __cplusplus
++extern "C" {
++#endif
++
++/* EGL Types */
++/* EGLint is defined in eglplatform.h */
++typedef unsigned int EGLBoolean;
++typedef unsigned int EGLenum;
++typedef void *EGLConfig;
++typedef void *EGLContext;
++typedef void *EGLDisplay;
++typedef void *EGLSurface;
++typedef void *EGLClientBuffer;
++
++/* EGL Versioning */
++#define EGL_VERSION_1_0			1
++#define EGL_VERSION_1_1			1
++#define EGL_VERSION_1_2			1
++#define EGL_VERSION_1_3			1
++#define EGL_VERSION_1_4			1
++
++/* EGL Enumerants. Bitmasks and other exceptional cases aside, most
++ * enums are assigned unique values starting at 0x3000.
++ */
++
++/* EGL aliases */
++#define EGL_FALSE			0
++#define EGL_TRUE			1
++
++/* Out-of-band handle values */
++#define EGL_DEFAULT_DISPLAY		((EGLNativeDisplayType)0)
++#define EGL_NO_CONTEXT			((EGLContext)0)
++#define EGL_NO_DISPLAY			((EGLDisplay)0)
++#define EGL_NO_SURFACE			((EGLSurface)0)
++
++/* Out-of-band attribute value */
++#define EGL_DONT_CARE			((EGLint)-1)
++
++/* Errors / GetError return values */
++#define EGL_SUCCESS			0x3000
++#define EGL_NOT_INITIALIZED		0x3001
++#define EGL_BAD_ACCESS			0x3002
++#define EGL_BAD_ALLOC			0x3003
++#define EGL_BAD_ATTRIBUTE		0x3004
++#define EGL_BAD_CONFIG			0x3005
++#define EGL_BAD_CONTEXT			0x3006
++#define EGL_BAD_CURRENT_SURFACE		0x3007
++#define EGL_BAD_DISPLAY			0x3008
++#define EGL_BAD_MATCH			0x3009
++#define EGL_BAD_NATIVE_PIXMAP		0x300A
++#define EGL_BAD_NATIVE_WINDOW		0x300B
++#define EGL_BAD_PARAMETER		0x300C
++#define EGL_BAD_SURFACE			0x300D
++#define EGL_CONTEXT_LOST		0x300E	/* EGL 1.1 - IMG_power_management */
++
++/* Reserved 0x300F-0x301F for additional errors */
++
++/* Config attributes */
++#define EGL_BUFFER_SIZE			0x3020
++#define EGL_ALPHA_SIZE			0x3021
++#define EGL_BLUE_SIZE			0x3022
++#define EGL_GREEN_SIZE			0x3023
++#define EGL_RED_SIZE			0x3024
++#define EGL_DEPTH_SIZE			0x3025
++#define EGL_STENCIL_SIZE		0x3026
++#define EGL_CONFIG_CAVEAT		0x3027
++#define EGL_CONFIG_ID			0x3028
++#define EGL_LEVEL			0x3029
++#define EGL_MAX_PBUFFER_HEIGHT		0x302A
++#define EGL_MAX_PBUFFER_PIXELS		0x302B
++#define EGL_MAX_PBUFFER_WIDTH		0x302C
++#define EGL_NATIVE_RENDERABLE		0x302D
++#define EGL_NATIVE_VISUAL_ID		0x302E
++#define EGL_NATIVE_VISUAL_TYPE		0x302F
++#define EGL_SAMPLES			0x3031
++#define EGL_SAMPLE_BUFFERS		0x3032
++#define EGL_SURFACE_TYPE		0x3033
++#define EGL_TRANSPARENT_TYPE		0x3034
++#define EGL_TRANSPARENT_BLUE_VALUE	0x3035
++#define EGL_TRANSPARENT_GREEN_VALUE	0x3036
++#define EGL_TRANSPARENT_RED_VALUE	0x3037
++#define EGL_NONE			0x3038	/* Attrib list terminator */
++#define EGL_BIND_TO_TEXTURE_RGB		0x3039
++#define EGL_BIND_TO_TEXTURE_RGBA	0x303A
++#define EGL_MIN_SWAP_INTERVAL		0x303B
++#define EGL_MAX_SWAP_INTERVAL		0x303C
++#define EGL_LUMINANCE_SIZE		0x303D
++#define EGL_ALPHA_MASK_SIZE		0x303E
++#define EGL_COLOR_BUFFER_TYPE		0x303F
++#define EGL_RENDERABLE_TYPE		0x3040
++#define EGL_MATCH_NATIVE_PIXMAP		0x3041	/* Pseudo-attribute (not queryable) */
++#define EGL_CONFORMANT			0x3042
++
++/* Reserved 0x3041-0x304F for additional config attributes */
++
++/* Config attribute values */
++#define EGL_SLOW_CONFIG			0x3050	/* EGL_CONFIG_CAVEAT value */
++#define EGL_NON_CONFORMANT_CONFIG	0x3051	/* EGL_CONFIG_CAVEAT value */
++#define EGL_TRANSPARENT_RGB		0x3052	/* EGL_TRANSPARENT_TYPE value */
++#define EGL_RGB_BUFFER			0x308E	/* EGL_COLOR_BUFFER_TYPE value */
++#define EGL_LUMINANCE_BUFFER		0x308F	/* EGL_COLOR_BUFFER_TYPE value */
++
++/* More config attribute values, for EGL_TEXTURE_FORMAT */
++#define EGL_NO_TEXTURE			0x305C
++#define EGL_TEXTURE_RGB			0x305D
++#define EGL_TEXTURE_RGBA		0x305E
++#define EGL_TEXTURE_2D			0x305F
++
++/* Config attribute mask bits */
++#define EGL_PBUFFER_BIT			0x0001	/* EGL_SURFACE_TYPE mask bits */
++#define EGL_PIXMAP_BIT			0x0002	/* EGL_SURFACE_TYPE mask bits */
++#define EGL_WINDOW_BIT			0x0004	/* EGL_SURFACE_TYPE mask bits */
++#define EGL_VG_COLORSPACE_LINEAR_BIT	0x0020	/* EGL_SURFACE_TYPE mask bits */
++#define EGL_VG_ALPHA_FORMAT_PRE_BIT	0x0040	/* EGL_SURFACE_TYPE mask bits */
++#define EGL_MULTISAMPLE_RESOLVE_BOX_BIT 0x0200	/* EGL_SURFACE_TYPE mask bits */
++#define EGL_SWAP_BEHAVIOR_PRESERVED_BIT 0x0400	/* EGL_SURFACE_TYPE mask bits */
++
++#define EGL_OPENGL_ES_BIT		0x0001	/* EGL_RENDERABLE_TYPE mask bits */
++#define EGL_OPENVG_BIT			0x0002	/* EGL_RENDERABLE_TYPE mask bits */
++#define EGL_OPENGL_ES2_BIT		0x0004	/* EGL_RENDERABLE_TYPE mask bits */
++#define EGL_OPENGL_BIT			0x0008	/* EGL_RENDERABLE_TYPE mask bits */
++
++/* QueryString targets */
++#define EGL_VENDOR			0x3053
++#define EGL_VERSION			0x3054
++#define EGL_EXTENSIONS			0x3055
++#define EGL_CLIENT_APIS			0x308D
++
++/* QuerySurface / SurfaceAttrib / CreatePbufferSurface targets */
++#define EGL_HEIGHT			0x3056
++#define EGL_WIDTH			0x3057
++#define EGL_LARGEST_PBUFFER		0x3058
++#define EGL_TEXTURE_FORMAT		0x3080
++#define EGL_TEXTURE_TARGET		0x3081
++#define EGL_MIPMAP_TEXTURE		0x3082
++#define EGL_MIPMAP_LEVEL		0x3083
++#define EGL_RENDER_BUFFER		0x3086
++#define EGL_VG_COLORSPACE		0x3087
++#define EGL_VG_ALPHA_FORMAT		0x3088
++#define EGL_HORIZONTAL_RESOLUTION	0x3090
++#define EGL_VERTICAL_RESOLUTION		0x3091
++#define EGL_PIXEL_ASPECT_RATIO		0x3092
++#define EGL_SWAP_BEHAVIOR		0x3093
++#define EGL_MULTISAMPLE_RESOLVE		0x3099
++
++/* EGL_RENDER_BUFFER values / BindTexImage / ReleaseTexImage buffer targets */
++#define EGL_BACK_BUFFER			0x3084
++#define EGL_SINGLE_BUFFER		0x3085
++
++/* OpenVG color spaces */
++#define EGL_VG_COLORSPACE_sRGB		0x3089	/* EGL_VG_COLORSPACE value */
++#define EGL_VG_COLORSPACE_LINEAR	0x308A	/* EGL_VG_COLORSPACE value */
++
++/* OpenVG alpha formats */
++#define EGL_VG_ALPHA_FORMAT_NONPRE	0x308B	/* EGL_ALPHA_FORMAT value */
++#define EGL_VG_ALPHA_FORMAT_PRE		0x308C	/* EGL_ALPHA_FORMAT value */
++
++/* Constant scale factor by which fractional display resolutions &
++ * aspect ratio are scaled when queried as integer values.
++ */
++#define EGL_DISPLAY_SCALING		10000
++
++/* Unknown display resolution/aspect ratio */
++#define EGL_UNKNOWN			((EGLint)-1)
++
++/* Back buffer swap behaviors */
++#define EGL_BUFFER_PRESERVED		0x3094	/* EGL_SWAP_BEHAVIOR value */
++#define EGL_BUFFER_DESTROYED		0x3095	/* EGL_SWAP_BEHAVIOR value */
++
++/* CreatePbufferFromClientBuffer buffer types */
++#define EGL_OPENVG_IMAGE		0x3096
++
++/* QueryContext targets */
++#define EGL_CONTEXT_CLIENT_TYPE		0x3097
++
++/* CreateContext attributes */
++#define EGL_CONTEXT_CLIENT_VERSION	0x3098
++
++/* Multisample resolution behaviors */
++#define EGL_MULTISAMPLE_RESOLVE_DEFAULT 0x309A	/* EGL_MULTISAMPLE_RESOLVE value */
++#define EGL_MULTISAMPLE_RESOLVE_BOX	0x309B	/* EGL_MULTISAMPLE_RESOLVE value */
++
++/* BindAPI/QueryAPI targets */
++#define EGL_OPENGL_ES_API		0x30A0
++#define EGL_OPENVG_API			0x30A1
++#define EGL_OPENGL_API			0x30A2
++
++/* GetCurrentSurface targets */
++#define EGL_DRAW			0x3059
++#define EGL_READ			0x305A
++
++/* WaitNative engines */
++#define EGL_CORE_NATIVE_ENGINE		0x305B
++
++/* EGL 1.2 tokens renamed for consistency in EGL 1.3 */
++#define EGL_COLORSPACE			EGL_VG_COLORSPACE
++#define EGL_ALPHA_FORMAT		EGL_VG_ALPHA_FORMAT
++#define EGL_COLORSPACE_sRGB		EGL_VG_COLORSPACE_sRGB
++#define EGL_COLORSPACE_LINEAR		EGL_VG_COLORSPACE_LINEAR
++#define EGL_ALPHA_FORMAT_NONPRE		EGL_VG_ALPHA_FORMAT_NONPRE
++#define EGL_ALPHA_FORMAT_PRE		EGL_VG_ALPHA_FORMAT_PRE
++
++/* EGL extensions must request enum blocks from the Khronos
++ * API Registrar, who maintains the enumerant registry. Submit
++ * a bug in Khronos Bugzilla against task "Registry".
++ */
++
++
++
++/* EGL Functions */
++
++EGLAPI EGLint EGLAPIENTRY eglGetError(void);
++
++EGLAPI EGLDisplay EGLAPIENTRY eglGetDisplay(EGLNativeDisplayType display_id);
++EGLAPI EGLBoolean EGLAPIENTRY eglInitialize(EGLDisplay dpy, EGLint *major, EGLint *minor);
++EGLAPI EGLBoolean EGLAPIENTRY eglTerminate(EGLDisplay dpy);
++
++EGLAPI const char * EGLAPIENTRY eglQueryString(EGLDisplay dpy, EGLint name);
++
++EGLAPI EGLBoolean EGLAPIENTRY eglGetConfigs(EGLDisplay dpy, EGLConfig *configs,
++			 EGLint config_size, EGLint *num_config);
++EGLAPI EGLBoolean EGLAPIENTRY eglChooseConfig(EGLDisplay dpy, const EGLint *attrib_list,
++			   EGLConfig *configs, EGLint config_size,
++			   EGLint *num_config);
++EGLAPI EGLBoolean EGLAPIENTRY eglGetConfigAttrib(EGLDisplay dpy, EGLConfig config,
++			      EGLint attribute, EGLint *value);
++
++EGLAPI EGLSurface EGLAPIENTRY eglCreateWindowSurface(EGLDisplay dpy, EGLConfig config,
++				  EGLNativeWindowType win,
++				  const EGLint *attrib_list);
++EGLAPI EGLSurface EGLAPIENTRY eglCreatePbufferSurface(EGLDisplay dpy, EGLConfig config,
++				   const EGLint *attrib_list);
++EGLAPI EGLSurface EGLAPIENTRY eglCreatePixmapSurface(EGLDisplay dpy, EGLConfig config,
++				  EGLNativePixmapType pixmap,
++				  const EGLint *attrib_list);
++EGLAPI EGLBoolean EGLAPIENTRY eglDestroySurface(EGLDisplay dpy, EGLSurface surface);
++EGLAPI EGLBoolean EGLAPIENTRY eglQuerySurface(EGLDisplay dpy, EGLSurface surface,
++			   EGLint attribute, EGLint *value);
++
++EGLAPI EGLBoolean EGLAPIENTRY eglBindAPI(EGLenum api);
++EGLAPI EGLenum EGLAPIENTRY eglQueryAPI(void);
++
++EGLAPI EGLBoolean EGLAPIENTRY eglWaitClient(void);
++
++EGLAPI EGLBoolean EGLAPIENTRY eglReleaseThread(void);
++
++EGLAPI EGLSurface EGLAPIENTRY eglCreatePbufferFromClientBuffer(
++	      EGLDisplay dpy, EGLenum buftype, EGLClientBuffer buffer,
++	      EGLConfig config, const EGLint *attrib_list);
++
++EGLAPI EGLBoolean EGLAPIENTRY eglSurfaceAttrib(EGLDisplay dpy, EGLSurface surface,
++			    EGLint attribute, EGLint value);
++EGLAPI EGLBoolean EGLAPIENTRY eglBindTexImage(EGLDisplay dpy, EGLSurface surface, EGLint buffer);
++EGLAPI EGLBoolean EGLAPIENTRY eglReleaseTexImage(EGLDisplay dpy, EGLSurface surface, EGLint buffer);
++
++
++EGLAPI EGLBoolean EGLAPIENTRY eglSwapInterval(EGLDisplay dpy, EGLint interval);
++
++
++EGLAPI EGLContext EGLAPIENTRY eglCreateContext(EGLDisplay dpy, EGLConfig config,
++			    EGLContext share_context,
++			    const EGLint *attrib_list);
++EGLAPI EGLBoolean EGLAPIENTRY eglDestroyContext(EGLDisplay dpy, EGLContext ctx);
++EGLAPI EGLBoolean EGLAPIENTRY eglMakeCurrent(EGLDisplay dpy, EGLSurface draw,
++			  EGLSurface read, EGLContext ctx);
++
++EGLAPI EGLContext EGLAPIENTRY eglGetCurrentContext(void);
++EGLAPI EGLSurface EGLAPIENTRY eglGetCurrentSurface(EGLint readdraw);
++EGLAPI EGLDisplay EGLAPIENTRY eglGetCurrentDisplay(void);
++EGLAPI EGLBoolean EGLAPIENTRY eglQueryContext(EGLDisplay dpy, EGLContext ctx,
++			   EGLint attribute, EGLint *value);
++
++EGLAPI EGLBoolean EGLAPIENTRY eglWaitGL(void);
++EGLAPI EGLBoolean EGLAPIENTRY eglWaitNative(EGLint engine);
++EGLAPI EGLBoolean EGLAPIENTRY eglSwapBuffers(EGLDisplay dpy, EGLSurface surface);
++EGLAPI EGLBoolean EGLAPIENTRY eglCopyBuffers(EGLDisplay dpy, EGLSurface surface,
++			  EGLNativePixmapType target);
++
++/* This is a generic function pointer type, whose name indicates it must
++ * be cast to the proper type *and calling convention* before use.
++ */
++typedef void (*__eglMustCastToProperFunctionPointerType)(void);
++
++/* Now, define eglGetProcAddress using the generic function ptr. type */
++EGLAPI __eglMustCastToProperFunctionPointerType EGLAPIENTRY
++       eglGetProcAddress(const char *procname);
++
++#ifdef __cplusplus
++}
++#endif
++
++#endif /* __egl_h_ */
+diff -rupN a/usr/include/EGL/eglplatform.h b/usr/include/EGL/eglplatform.h
+--- a/usr/include/EGL/eglplatform.h	1970-01-01 01:00:00.000000000 +0100
++++ b/usr/include/EGL/eglplatform.h	2014-11-03 15:56:55.376739000 +0100
+@@ -0,0 +1,146 @@
++#ifndef __eglplatform_h_
++#define __eglplatform_h_
++
++/*
++** Copyright (c) 2007-2009 The Khronos Group Inc.
++**
++** Permission is hereby granted, free of charge, to any person obtaining a
++** copy of this software and/or associated documentation files (the
++** "Materials"), to deal in the Materials without restriction, including
++** without limitation the rights to use, copy, modify, merge, publish,
++** distribute, sublicense, and/or sell copies of the Materials, and to
++** permit persons to whom the Materials are furnished to do so, subject to
++** the following conditions:
++**
++** The above copyright notice and this permission notice shall be included
++** in all copies or substantial portions of the Materials.
++**
++** THE MATERIALS ARE PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
++** EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
++** MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
++** IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
++** CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
++** TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
++** MATERIALS OR THE USE OR OTHER DEALINGS IN THE MATERIALS.
++*/
++
++/* Platform-specific types and definitions for egl.h
++ * $Revision: 12306 $ on $Date: 2010-08-25 09:51:28 -0700 (Wed, 25 Aug 2010) $
++ *
++ * Adopters may modify khrplatform.h and this file to suit their platform.
++ * You are encouraged to submit all modifications to the Khronos group so that
++ * they can be included in future versions of this file.  Please submit changes
++ * by sending them to the public Khronos Bugzilla (http://khronos.org/bugzilla)
++ * by filing a bug against product "EGL" component "Registry".
++ */
++
++#include <KHR/khrplatform.h>
++
++/* Macros used in EGL function prototype declarations.
++ *
++ * EGL functions should be prototyped as:
++ *
++ * EGLAPI return-type EGLAPIENTRY eglFunction(arguments);
++ * typedef return-type (EXPAPIENTRYP PFNEGLFUNCTIONPROC) (arguments);
++ *
++ * KHRONOS_APICALL and KHRONOS_APIENTRY are defined in KHR/khrplatform.h
++ */
++
++#ifndef EGLAPI
++#define EGLAPI KHRONOS_APICALL
++#endif
++
++#ifndef EGLAPIENTRY
++#define EGLAPIENTRY  KHRONOS_APIENTRY
++#endif
++#define EGLAPIENTRYP EGLAPIENTRY*
++
++/* The types NativeDisplayType, NativeWindowType, and NativePixmapType
++ * are aliases of window-system-dependent types, such as X Display * or
++ * Windows Device Context. They must be defined in platform-specific
++ * code below. The EGL-prefixed versions of Native*Type are the same
++ * types, renamed in EGL 1.3 so all types in the API start with "EGL".
++ *
++ * Khronos STRONGLY RECOMMENDS that you use the default definitions
++ * provided below, since these changes affect both binary and source
++ * portability of applications using EGL running on different EGL
++ * implementations.
++ */
++
++#if defined(_WIN32) || defined(__VC32__) && !defined(__CYGWIN__) && !defined(__SCITECH_SNAP__) /* Win32 and WinCE */
++#ifndef WIN32_LEAN_AND_MEAN
++#define WIN32_LEAN_AND_MEAN 1
++#endif
++#include <windows.h>
++
++typedef HDC     EGLNativeDisplayType;
++typedef HBITMAP EGLNativePixmapType;
++typedef HWND    EGLNativeWindowType;
++
++#elif defined(__WINSCW__) || defined(__SYMBIAN32__)  /* Symbian */
++
++typedef int   EGLNativeDisplayType;
++typedef void *EGLNativeWindowType;
++typedef void *EGLNativePixmapType;
++
++#elif defined(WL_EGL_PLATFORM)
++
++typedef struct wl_display     *EGLNativeDisplayType;
++typedef struct wl_egl_pixmap  *EGLNativePixmapType;
++typedef struct wl_egl_window  *EGLNativeWindowType;
++
++#elif defined(__GBM__)
++
++typedef struct gbm_device  *EGLNativeDisplayType;
++typedef struct gbm_bo      *EGLNativePixmapType;
++typedef void               *EGLNativeWindowType;
++
++#elif defined(ANDROID) /* Android */
++
++struct ANativeWindow;
++struct egl_native_pixmap_t;
++
++typedef struct ANativeWindow        *EGLNativeWindowType;
++typedef struct egl_native_pixmap_t  *EGLNativePixmapType;
++typedef void                        *EGLNativeDisplayType;
++
++#elif defined(__unix__)
++
++#if 1
++
++typedef void            *EGLNativeDisplayType;
++typedef khronos_uint32_t EGLNativePixmapType;
++typedef khronos_uint32_t EGLNativeWindowType;
++
++#else
++
++/* X11 (tentative)  */
++#include <X11/Xlib.h>
++#include <X11/Xutil.h>
++
++typedef Display *EGLNativeDisplayType;
++typedef Pixmap   EGLNativePixmapType;
++typedef Window   EGLNativeWindowType;
++
++#endif /* MESA_EGL_NO_X11_HEADERS */
++
++#else
++#error "Platform not recognized"
++#endif
++
++/* EGL 1.2 types, renamed for consistency in EGL 1.3 */
++typedef EGLNativeDisplayType NativeDisplayType;
++typedef EGLNativePixmapType  NativePixmapType;
++typedef EGLNativeWindowType  NativeWindowType;
++
++
++/* Define EGLint. This must be a signed integral type large enough to contain
++ * all legal attribute names and values passed into and out of EGL, whether
++ * their type is boolean, bitmask, enumerant (symbolic constant), integer,
++ * handle, or other.  While in general a 32-bit integer will suffice, if
++ * handles are 64 bit types, then EGLint should be defined as a signed 64-bit
++ * integer type.
++ */
++typedef khronos_int32_t EGLint;
++
++#endif /* __eglplatform_h */
+diff -rupN a/usr/include/GLES/egl.h b/usr/include/GLES/egl.h
+--- a/usr/include/GLES/egl.h	1970-01-01 01:00:00.000000000 +0100
++++ b/usr/include/GLES/egl.h	2013-10-12 03:05:04.000000000 +0200
+@@ -0,0 +1,15 @@
++/*
++ * Skeleton egl.h to provide compatibility for early GLES 1.0
++ * applications. Several early implementations included gl.h
++ * in egl.h leading applications to include only egl.h
++ *
++ * $Revision: 6252 $ on $Date:: 2008-08-06 16:35:08 -0700 #$
++ */
++
++#ifndef __legacy_egl_h_
++#define __legacy_egl_h_
++
++#include <EGL/egl.h>
++#include <GLES/gl.h>
++
++#endif /* __legacy_egl_h_ */
+diff -rupN a/usr/include/GLES/glext.h b/usr/include/GLES/glext.h
+--- a/usr/include/GLES/glext.h	1970-01-01 01:00:00.000000000 +0100
++++ b/usr/include/GLES/glext.h	2013-10-12 03:05:04.000000000 +0200
+@@ -0,0 +1,1278 @@
++#ifndef __glext_h_
++#define __glext_h_
++
++/* $Revision: 20798 $ on $Date:: 2013-03-07 01:19:34 -0800 #$ */
++
++#ifdef __cplusplus
++extern "C" {
++#endif
++
++/*
++ * This document is licensed under the SGI Free Software B License Version
++ * 2.0. For details, see http://oss.sgi.com/projects/FreeB/ .
++ */
++
++#ifndef GL_APIENTRYP
++#   define GL_APIENTRYP GL_APIENTRY*
++#endif
++
++/*------------------------------------------------------------------------*
++ * OES extension tokens
++ *------------------------------------------------------------------------*/
++
++/* GL_OES_blend_equation_separate */
++#ifndef GL_OES_blend_equation_separate
++/* BLEND_EQUATION_RGB_OES same as BLEND_EQUATION_OES */
++#define GL_BLEND_EQUATION_RGB_OES                               0x8009
++#define GL_BLEND_EQUATION_ALPHA_OES                             0x883D
++#endif
++
++/* GL_OES_blend_func_separate */
++#ifndef GL_OES_blend_func_separate
++#define GL_BLEND_DST_RGB_OES                                    0x80C8
++#define GL_BLEND_SRC_RGB_OES                                    0x80C9
++#define GL_BLEND_DST_ALPHA_OES                                  0x80CA
++#define GL_BLEND_SRC_ALPHA_OES                                  0x80CB
++#endif
++
++/* GL_OES_blend_subtract */
++#ifndef GL_OES_blend_subtract
++#define GL_BLEND_EQUATION_OES                                   0x8009
++#define GL_FUNC_ADD_OES                                         0x8006
++#define GL_FUNC_SUBTRACT_OES                                    0x800A
++#define GL_FUNC_REVERSE_SUBTRACT_OES                            0x800B
++#endif
++
++/* GL_OES_compressed_ETC1_RGB8_texture */
++#ifndef GL_OES_compressed_ETC1_RGB8_texture
++#define GL_ETC1_RGB8_OES                                        0x8D64
++#endif
++
++/* GL_OES_depth24 */
++#ifndef GL_OES_depth24
++#define GL_DEPTH_COMPONENT24_OES                                0x81A6
++#endif
++
++/* GL_OES_depth32 */
++#ifndef GL_OES_depth32
++#define GL_DEPTH_COMPONENT32_OES                                0x81A7
++#endif
++
++/* GL_OES_draw_texture */
++#ifndef GL_OES_draw_texture
++#define GL_TEXTURE_CROP_RECT_OES                                0x8B9D
++#endif
++
++/* GL_OES_EGL_image */
++#ifndef GL_OES_EGL_image
++typedef void* GLeglImageOES;
++#endif
++
++/* GL_OES_EGL_image_external */
++#ifndef GL_OES_EGL_image_external
++/* GLeglImageOES defined in GL_OES_EGL_image already. */
++#define GL_TEXTURE_EXTERNAL_OES                                 0x8D65
++#define GL_TEXTURE_BINDING_EXTERNAL_OES                         0x8D67
++#define GL_REQUIRED_TEXTURE_IMAGE_UNITS_OES                     0x8D68
++#endif
++
++/* GL_OES_element_index_uint */
++#ifndef GL_OES_element_index_uint
++#define GL_UNSIGNED_INT                                         0x1405
++#endif
++
++/* GL_OES_fixed_point */
++#ifndef GL_OES_fixed_point
++#define GL_FIXED_OES                                            0x140C
++#endif
++
++/* GL_OES_framebuffer_object */
++#ifndef GL_OES_framebuffer_object
++#define GL_NONE_OES                                             0
++#define GL_FRAMEBUFFER_OES                                      0x8D40
++#define GL_RENDERBUFFER_OES                                     0x8D41
++#define GL_RGBA4_OES                                            0x8056
++#define GL_RGB5_A1_OES                                          0x8057
++#define GL_RGB565_OES                                           0x8D62
++#define GL_DEPTH_COMPONENT16_OES                                0x81A5
++#define GL_RENDERBUFFER_WIDTH_OES                               0x8D42
++#define GL_RENDERBUFFER_HEIGHT_OES                              0x8D43
++#define GL_RENDERBUFFER_INTERNAL_FORMAT_OES                     0x8D44
++#define GL_RENDERBUFFER_RED_SIZE_OES                            0x8D50
++#define GL_RENDERBUFFER_GREEN_SIZE_OES                          0x8D51
++#define GL_RENDERBUFFER_BLUE_SIZE_OES                           0x8D52
++#define GL_RENDERBUFFER_ALPHA_SIZE_OES                          0x8D53
++#define GL_RENDERBUFFER_DEPTH_SIZE_OES                          0x8D54
++#define GL_RENDERBUFFER_STENCIL_SIZE_OES                        0x8D55
++#define GL_FRAMEBUFFER_ATTACHMENT_OBJECT_TYPE_OES               0x8CD0
++#define GL_FRAMEBUFFER_ATTACHMENT_OBJECT_NAME_OES               0x8CD1
++#define GL_FRAMEBUFFER_ATTACHMENT_TEXTURE_LEVEL_OES             0x8CD2
++#define GL_FRAMEBUFFER_ATTACHMENT_TEXTURE_CUBE_MAP_FACE_OES     0x8CD3
++#define GL_COLOR_ATTACHMENT0_OES                                0x8CE0
++#define GL_DEPTH_ATTACHMENT_OES                                 0x8D00
++#define GL_STENCIL_ATTACHMENT_OES                               0x8D20
++#define GL_FRAMEBUFFER_COMPLETE_OES                             0x8CD5
++#define GL_FRAMEBUFFER_INCOMPLETE_ATTACHMENT_OES                0x8CD6
++#define GL_FRAMEBUFFER_INCOMPLETE_MISSING_ATTACHMENT_OES        0x8CD7
++#define GL_FRAMEBUFFER_INCOMPLETE_DIMENSIONS_OES                0x8CD9
++#define GL_FRAMEBUFFER_INCOMPLETE_FORMATS_OES                   0x8CDA
++#define GL_FRAMEBUFFER_UNSUPPORTED_OES                          0x8CDD
++#define GL_FRAMEBUFFER_BINDING_OES                              0x8CA6
++#define GL_RENDERBUFFER_BINDING_OES                             0x8CA7
++#define GL_MAX_RENDERBUFFER_SIZE_OES                            0x84E8
++#define GL_INVALID_FRAMEBUFFER_OPERATION_OES                    0x0506
++#endif
++
++/* GL_OES_mapbuffer */
++#ifndef GL_OES_mapbuffer
++#define GL_WRITE_ONLY_OES                                       0x88B9
++#define GL_BUFFER_ACCESS_OES                                    0x88BB
++#define GL_BUFFER_MAPPED_OES                                    0x88BC
++#define GL_BUFFER_MAP_POINTER_OES                               0x88BD
++#endif
++
++/* GL_OES_matrix_get */
++#ifndef GL_OES_matrix_get
++#define GL_MODELVIEW_MATRIX_FLOAT_AS_INT_BITS_OES               0x898D
++#define GL_PROJECTION_MATRIX_FLOAT_AS_INT_BITS_OES              0x898E
++#define GL_TEXTURE_MATRIX_FLOAT_AS_INT_BITS_OES                 0x898F
++#endif
++
++/* GL_OES_matrix_palette */
++#ifndef GL_OES_matrix_palette
++#define GL_MAX_VERTEX_UNITS_OES                                 0x86A4
++#define GL_MAX_PALETTE_MATRICES_OES                             0x8842
++#define GL_MATRIX_PALETTE_OES                                   0x8840
++#define GL_MATRIX_INDEX_ARRAY_OES                               0x8844
++#define GL_WEIGHT_ARRAY_OES                                     0x86AD
++#define GL_CURRENT_PALETTE_MATRIX_OES                           0x8843
++#define GL_MATRIX_INDEX_ARRAY_SIZE_OES                          0x8846
++#define GL_MATRIX_INDEX_ARRAY_TYPE_OES                          0x8847
++#define GL_MATRIX_INDEX_ARRAY_STRIDE_OES                        0x8848
++#define GL_MATRIX_INDEX_ARRAY_POINTER_OES                       0x8849
++#define GL_MATRIX_INDEX_ARRAY_BUFFER_BINDING_OES                0x8B9E
++#define GL_WEIGHT_ARRAY_SIZE_OES                                0x86AB
++#define GL_WEIGHT_ARRAY_TYPE_OES                                0x86A9
++#define GL_WEIGHT_ARRAY_STRIDE_OES                              0x86AA
++#define GL_WEIGHT_ARRAY_POINTER_OES                             0x86AC
++#define GL_WEIGHT_ARRAY_BUFFER_BINDING_OES                      0x889E
++#endif
++
++/* GL_OES_packed_depth_stencil */
++#ifndef GL_OES_packed_depth_stencil
++#define GL_DEPTH_STENCIL_OES                                    0x84F9
++#define GL_UNSIGNED_INT_24_8_OES                                0x84FA
++#define GL_DEPTH24_STENCIL8_OES                                 0x88F0
++#endif
++
++/* GL_OES_required_internalformat */
++/* No new tokens introduced by this extension. */
++
++/* GL_OES_rgb8_rgba8 */
++#ifndef GL_OES_rgb8_rgba8
++#define GL_RGB8_OES                                             0x8051
++#define GL_RGBA8_OES                                            0x8058
++#endif
++
++/* GL_OES_stencil1 */
++#ifndef GL_OES_stencil1
++#define GL_STENCIL_INDEX1_OES                                   0x8D46
++#endif
++
++/* GL_OES_stencil4 */
++#ifndef GL_OES_stencil4
++#define GL_STENCIL_INDEX4_OES                                   0x8D47
++#endif
++
++/* GL_OES_stencil8 */
++#ifndef GL_OES_stencil8
++#define GL_STENCIL_INDEX8_OES                                   0x8D48
++#endif
++
++/* GL_OES_stencil_wrap */
++#ifndef GL_OES_stencil_wrap
++#define GL_INCR_WRAP_OES                                        0x8507
++#define GL_DECR_WRAP_OES                                        0x8508
++#endif
++
++/* GL_OES_texture_cube_map */
++#ifndef GL_OES_texture_cube_map
++#define GL_NORMAL_MAP_OES                                       0x8511
++#define GL_REFLECTION_MAP_OES                                   0x8512
++#define GL_TEXTURE_CUBE_MAP_OES                                 0x8513
++#define GL_TEXTURE_BINDING_CUBE_MAP_OES                         0x8514
++#define GL_TEXTURE_CUBE_MAP_POSITIVE_X_OES                      0x8515
++#define GL_TEXTURE_CUBE_MAP_NEGATIVE_X_OES                      0x8516
++#define GL_TEXTURE_CUBE_MAP_POSITIVE_Y_OES                      0x8517
++#define GL_TEXTURE_CUBE_MAP_NEGATIVE_Y_OES                      0x8518
++#define GL_TEXTURE_CUBE_MAP_POSITIVE_Z_OES                      0x8519
++#define GL_TEXTURE_CUBE_MAP_NEGATIVE_Z_OES                      0x851A
++#define GL_MAX_CUBE_MAP_TEXTURE_SIZE_OES                        0x851C
++#define GL_TEXTURE_GEN_MODE_OES                                 0x2500
++#define GL_TEXTURE_GEN_STR_OES                                  0x8D60
++#endif
++
++/* GL_OES_texture_mirrored_repeat */
++#ifndef GL_OES_texture_mirrored_repeat
++#define GL_MIRRORED_REPEAT_OES                                  0x8370
++#endif
++
++/* GL_OES_vertex_array_object */
++#ifndef GL_OES_vertex_array_object
++#define GL_VERTEX_ARRAY_BINDING_OES                             0x85B5
++#endif
++
++/*------------------------------------------------------------------------*
++ * AMD extension tokens
++ *------------------------------------------------------------------------*/
++
++/* GL_AMD_compressed_3DC_texture */
++#ifndef GL_AMD_compressed_3DC_texture
++#define GL_3DC_X_AMD                                            0x87F9
++#define GL_3DC_XY_AMD                                           0x87FA
++#endif
++
++/* GL_AMD_compressed_ATC_texture */
++#ifndef GL_AMD_compressed_ATC_texture
++#define GL_ATC_RGB_AMD                                          0x8C92
++#define GL_ATC_RGBA_EXPLICIT_ALPHA_AMD                          0x8C93
++#define GL_ATC_RGBA_INTERPOLATED_ALPHA_AMD                      0x87EE
++#endif
++
++/*------------------------------------------------------------------------*
++ * APPLE extension tokens
++ *------------------------------------------------------------------------*/
++
++/* GL_APPLE_copy_texture_levels */
++/* No new tokens introduced by this extension. */
++
++/* GL_APPLE_framebuffer_multisample */
++#ifndef GL_APPLE_framebuffer_multisample
++#define GL_RENDERBUFFER_SAMPLES_APPLE                           0x8CAB
++#define GL_FRAMEBUFFER_INCOMPLETE_MULTISAMPLE_APPLE             0x8D56
++#define GL_MAX_SAMPLES_APPLE                                    0x8D57
++#define GL_READ_FRAMEBUFFER_APPLE                               0x8CA8
++#define GL_DRAW_FRAMEBUFFER_APPLE                               0x8CA9
++#define GL_DRAW_FRAMEBUFFER_BINDING_APPLE                       0x8CA6
++#define GL_READ_FRAMEBUFFER_BINDING_APPLE                       0x8CAA
++#endif
++
++/* GL_APPLE_sync */
++#ifndef GL_APPLE_sync
++
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
++
++#define GL_SYNC_OBJECT_APPLE                                    0x8A53
++#define GL_MAX_SERVER_WAIT_TIMEOUT_APPLE                        0x9111
++#define GL_OBJECT_TYPE_APPLE                                    0x9112
++#define GL_SYNC_CONDITION_APPLE                                 0x9113
++#define GL_SYNC_STATUS_APPLE                                    0x9114
++#define GL_SYNC_FLAGS_APPLE                                     0x9115
++#define GL_SYNC_FENCE_APPLE                                     0x9116
++#define GL_SYNC_GPU_COMMANDS_COMPLETE_APPLE                     0x9117
++#define GL_UNSIGNALED_APPLE                                     0x9118
++#define GL_SIGNALED_APPLE                                       0x9119
++#define GL_ALREADY_SIGNALED_APPLE                               0x911A
++#define GL_TIMEOUT_EXPIRED_APPLE                                0x911B
++#define GL_CONDITION_SATISFIED_APPLE                            0x911C
++#define GL_WAIT_FAILED_APPLE                                    0x911D
++#define GL_SYNC_FLUSH_COMMANDS_BIT_APPLE                        0x00000001
++#define GL_TIMEOUT_IGNORED_APPLE                                0xFFFFFFFFFFFFFFFFull
++#endif
++
++/* GL_APPLE_texture_2D_limited_npot */
++/* No new tokens introduced by this extension. */
++
++/* GL_APPLE_texture_format_BGRA8888 */
++#ifndef GL_APPLE_texture_format_BGRA8888
++#define GL_BGRA_EXT                                             0x80E1
++#endif
++
++/* GL_APPLE_texture_max_level */
++#ifndef GL_APPLE_texture_max_level
++#define GL_TEXTURE_MAX_LEVEL_APPLE                              0x813D
++#endif
++
++/*------------------------------------------------------------------------*
++ * ARM extension tokens
++ *------------------------------------------------------------------------*/
++
++/* GL_ARM_rgba8 */
++/* No new tokens introduced by this extension. */
++
++/*------------------------------------------------------------------------*
++ * EXT extension tokens
++ *------------------------------------------------------------------------*/
++
++/* GL_EXT_blend_minmax */
++#ifndef GL_EXT_blend_minmax
++#define GL_MIN_EXT                                              0x8007
++#define GL_MAX_EXT                                              0x8008
++#endif
++
++/* GL_EXT_discard_framebuffer */
++#ifndef GL_EXT_discard_framebuffer
++#define GL_COLOR_EXT                                            0x1800
++#define GL_DEPTH_EXT                                            0x1801
++#define GL_STENCIL_EXT                                          0x1802
++#endif
++
++/* GL_EXT_map_buffer_range */
++#ifndef GL_EXT_map_buffer_range
++#define GL_MAP_READ_BIT_EXT                                     0x0001
++#define GL_MAP_WRITE_BIT_EXT                                    0x0002
++#define GL_MAP_INVALIDATE_RANGE_BIT_EXT                         0x0004
++#define GL_MAP_INVALIDATE_BUFFER_BIT_EXT                        0x0008
++#define GL_MAP_FLUSH_EXPLICIT_BIT_EXT                           0x0010
++#define GL_MAP_UNSYNCHRONIZED_BIT_EXT                           0x0020
++#endif
++
++/* GL_EXT_multisampled_render_to_texture */
++#ifndef GL_EXT_multisampled_render_to_texture
++#define GL_FRAMEBUFFER_ATTACHMENT_TEXTURE_SAMPLES_EXT           0x8D6C
++/* reuse values from GL_EXT_framebuffer_multisample (desktop extension) */
++#define GL_RENDERBUFFER_SAMPLES_EXT                             0x8CAB
++#define GL_FRAMEBUFFER_INCOMPLETE_MULTISAMPLE_EXT               0x8D56
++#define GL_MAX_SAMPLES_EXT                                      0x8D57
++#endif
++
++/* GL_EXT_multi_draw_arrays */
++/* No new tokens introduced by this extension. */
++
++/* GL_EXT_read_format_bgra */
++#ifndef GL_EXT_read_format_bgra
++#define GL_BGRA_EXT                                             0x80E1
++#define GL_UNSIGNED_SHORT_4_4_4_4_REV_EXT                       0x8365
++#define GL_UNSIGNED_SHORT_1_5_5_5_REV_EXT                       0x8366
++#endif
++
++/* GL_EXT_robustness */
++#ifndef GL_EXT_robustness
++/* reuse GL_NO_ERROR */
++#define GL_GUILTY_CONTEXT_RESET_EXT                             0x8253
++#define GL_INNOCENT_CONTEXT_RESET_EXT                           0x8254
++#define GL_UNKNOWN_CONTEXT_RESET_EXT                            0x8255
++#define GL_CONTEXT_ROBUST_ACCESS_EXT                            0x90F3
++#define GL_RESET_NOTIFICATION_STRATEGY_EXT                      0x8256
++#define GL_LOSE_CONTEXT_ON_RESET_EXT                            0x8252
++#define GL_NO_RESET_NOTIFICATION_EXT                            0x8261
++#endif
++
++/* GL_EXT_sRGB */
++#ifndef GL_EXT_sRGB
++#define GL_SRGB_EXT                                             0x8C40
++#define GL_SRGB_ALPHA_EXT                                       0x8C42
++#define GL_SRGB8_ALPHA8_EXT                                     0x8C43
++#define GL_FRAMEBUFFER_ATTACHMENT_COLOR_ENCODING_EXT            0x8210
++#endif
++
++/* GL_EXT_texture_compression_dxt1 */
++#ifndef GL_EXT_texture_compression_dxt1
++#define GL_COMPRESSED_RGB_S3TC_DXT1_EXT                         0x83F0
++#define GL_COMPRESSED_RGBA_S3TC_DXT1_EXT                        0x83F1
++#endif
++
++/* GL_EXT_texture_filter_anisotropic */
++#ifndef GL_EXT_texture_filter_anisotropic
++#define GL_TEXTURE_MAX_ANISOTROPY_EXT                           0x84FE
++#define GL_MAX_TEXTURE_MAX_ANISOTROPY_EXT                       0x84FF
++#endif
++
++/* GL_EXT_texture_format_BGRA8888 */
++#ifndef GL_EXT_texture_format_BGRA8888
++#define GL_BGRA_EXT                                             0x80E1
++#endif
++
++/* GL_EXT_texture_lod_bias */
++#ifndef GL_EXT_texture_lod_bias
++#define GL_MAX_TEXTURE_LOD_BIAS_EXT                             0x84FD
++#define GL_TEXTURE_FILTER_CONTROL_EXT                           0x8500
++#define GL_TEXTURE_LOD_BIAS_EXT                                 0x8501
++#endif
++
++/* GL_EXT_texture_storage */
++#ifndef GL_EXT_texture_storage
++#define GL_TEXTURE_IMMUTABLE_FORMAT_EXT                         0x912F
++#define GL_ALPHA8_EXT                                           0x803C
++#define GL_LUMINANCE8_EXT                                       0x8040
++#define GL_LUMINANCE8_ALPHA8_EXT                                0x8045
++#define GL_RGBA32F_EXT                                          0x8814
++#define GL_RGB32F_EXT                                           0x8815
++#define GL_ALPHA32F_EXT                                         0x8816
++#define GL_LUMINANCE32F_EXT                                     0x8818
++#define GL_LUMINANCE_ALPHA32F_EXT                               0x8819
++/* reuse GL_RGBA16F_EXT */
++#define GL_RGB16F_EXT                                           0x881B
++#define GL_ALPHA16F_EXT                                         0x881C
++#define GL_LUMINANCE16F_EXT                                     0x881E
++#define GL_LUMINANCE_ALPHA16F_EXT                               0x881F
++#define GL_RGB10_A2_EXT                                         0x8059
++#define GL_RGB10_EXT                                            0x8052
++#define GL_BGRA8_EXT                                            0x93A1
++#endif
++
++/*------------------------------------------------------------------------*
++ * IMG extension tokens
++ *------------------------------------------------------------------------*/
++
++/* GL_IMG_read_format */
++#ifndef GL_IMG_read_format
++#define GL_BGRA_IMG                                             0x80E1
++#define GL_UNSIGNED_SHORT_4_4_4_4_REV_IMG                       0x8365
++#endif
++
++/* GL_IMG_texture_compression_pvrtc */
++#ifndef GL_IMG_texture_compression_pvrtc
++#define GL_COMPRESSED_RGB_PVRTC_4BPPV1_IMG                      0x8C00
++#define GL_COMPRESSED_RGB_PVRTC_2BPPV1_IMG                      0x8C01
++#define GL_COMPRESSED_RGBA_PVRTC_4BPPV1_IMG                     0x8C02
++#define GL_COMPRESSED_RGBA_PVRTC_2BPPV1_IMG                     0x8C03
++#endif
++
++/* GL_IMG_texture_env_enhanced_fixed_function */
++#ifndef GL_IMG_texture_env_enhanced_fixed_function
++#define GL_MODULATE_COLOR_IMG                                   0x8C04
++#define GL_RECIP_ADD_SIGNED_ALPHA_IMG                           0x8C05
++#define GL_TEXTURE_ALPHA_MODULATE_IMG                           0x8C06
++#define GL_FACTOR_ALPHA_MODULATE_IMG                            0x8C07
++#define GL_FRAGMENT_ALPHA_MODULATE_IMG                          0x8C08
++#define GL_ADD_BLEND_IMG                                        0x8C09
++#define GL_DOT3_RGBA_IMG                                        0x86AF
++#endif
++
++/* GL_IMG_user_clip_plane */
++#ifndef GL_IMG_user_clip_plane
++#define GL_CLIP_PLANE0_IMG                                      0x3000
++#define GL_CLIP_PLANE1_IMG                                      0x3001
++#define GL_CLIP_PLANE2_IMG                                      0x3002
++#define GL_CLIP_PLANE3_IMG                                      0x3003
++#define GL_CLIP_PLANE4_IMG                                      0x3004
++#define GL_CLIP_PLANE5_IMG                                      0x3005
++#define GL_MAX_CLIP_PLANES_IMG                                  0x0D32
++#endif
++
++/* GL_IMG_multisampled_render_to_texture */
++#ifndef GL_IMG_multisampled_render_to_texture
++#define GL_RENDERBUFFER_SAMPLES_IMG                             0x9133
++#define GL_FRAMEBUFFER_INCOMPLETE_MULTISAMPLE_IMG               0x9134
++#define GL_MAX_SAMPLES_IMG                                      0x9135
++#define GL_TEXTURE_SAMPLES_IMG                                  0x9136
++#endif
++
++/*------------------------------------------------------------------------*
++ * NV extension tokens
++ *------------------------------------------------------------------------*/
++
++/* GL_NV_fence */
++#ifndef GL_NV_fence
++#define GL_ALL_COMPLETED_NV                                     0x84F2
++#define GL_FENCE_STATUS_NV                                      0x84F3
++#define GL_FENCE_CONDITION_NV                                   0x84F4
++#endif
++
++/*------------------------------------------------------------------------*
++ * QCOM extension tokens
++ *------------------------------------------------------------------------*/
++
++/* GL_QCOM_driver_control */
++/* No new tokens introduced by this extension. */
++
++/* GL_QCOM_extended_get */
++#ifndef GL_QCOM_extended_get
++#define GL_TEXTURE_WIDTH_QCOM                                   0x8BD2
++#define GL_TEXTURE_HEIGHT_QCOM                                  0x8BD3
++#define GL_TEXTURE_DEPTH_QCOM                                   0x8BD4
++#define GL_TEXTURE_INTERNAL_FORMAT_QCOM                         0x8BD5
++#define GL_TEXTURE_FORMAT_QCOM                                  0x8BD6
++#define GL_TEXTURE_TYPE_QCOM                                    0x8BD7
++#define GL_TEXTURE_IMAGE_VALID_QCOM                             0x8BD8
++#define GL_TEXTURE_NUM_LEVELS_QCOM                              0x8BD9
++#define GL_TEXTURE_TARGET_QCOM                                  0x8BDA
++#define GL_TEXTURE_OBJECT_VALID_QCOM                            0x8BDB
++#define GL_STATE_RESTORE                                        0x8BDC
++#endif
++
++/* GL_QCOM_extended_get2 */
++/* No new tokens introduced by this extension. */
++
++/* GL_QCOM_perfmon_global_mode */
++#ifndef GL_QCOM_perfmon_global_mode
++#define GL_PERFMON_GLOBAL_MODE_QCOM                             0x8FA0
++#endif
++
++/* GL_QCOM_writeonly_rendering */
++#ifndef GL_QCOM_writeonly_rendering
++#define GL_WRITEONLY_RENDERING_QCOM                             0x8823
++#endif
++
++/* GL_QCOM_tiled_rendering */
++#ifndef GL_QCOM_tiled_rendering
++#define GL_COLOR_BUFFER_BIT0_QCOM                               0x00000001
++#define GL_COLOR_BUFFER_BIT1_QCOM                               0x00000002
++#define GL_COLOR_BUFFER_BIT2_QCOM                               0x00000004
++#define GL_COLOR_BUFFER_BIT3_QCOM                               0x00000008
++#define GL_COLOR_BUFFER_BIT4_QCOM                               0x00000010
++#define GL_COLOR_BUFFER_BIT5_QCOM                               0x00000020
++#define GL_COLOR_BUFFER_BIT6_QCOM                               0x00000040
++#define GL_COLOR_BUFFER_BIT7_QCOM                               0x00000080
++#define GL_DEPTH_BUFFER_BIT0_QCOM                               0x00000100
++#define GL_DEPTH_BUFFER_BIT1_QCOM                               0x00000200
++#define GL_DEPTH_BUFFER_BIT2_QCOM                               0x00000400
++#define GL_DEPTH_BUFFER_BIT3_QCOM                               0x00000800
++#define GL_DEPTH_BUFFER_BIT4_QCOM                               0x00001000
++#define GL_DEPTH_BUFFER_BIT5_QCOM                               0x00002000
++#define GL_DEPTH_BUFFER_BIT6_QCOM                               0x00004000
++#define GL_DEPTH_BUFFER_BIT7_QCOM                               0x00008000
++#define GL_STENCIL_BUFFER_BIT0_QCOM                             0x00010000
++#define GL_STENCIL_BUFFER_BIT1_QCOM                             0x00020000
++#define GL_STENCIL_BUFFER_BIT2_QCOM                             0x00040000
++#define GL_STENCIL_BUFFER_BIT3_QCOM                             0x00080000
++#define GL_STENCIL_BUFFER_BIT4_QCOM                             0x00100000
++#define GL_STENCIL_BUFFER_BIT5_QCOM                             0x00200000
++#define GL_STENCIL_BUFFER_BIT6_QCOM                             0x00400000
++#define GL_STENCIL_BUFFER_BIT7_QCOM                             0x00800000
++#define GL_MULTISAMPLE_BUFFER_BIT0_QCOM                         0x01000000
++#define GL_MULTISAMPLE_BUFFER_BIT1_QCOM                         0x02000000
++#define GL_MULTISAMPLE_BUFFER_BIT2_QCOM                         0x04000000
++#define GL_MULTISAMPLE_BUFFER_BIT3_QCOM                         0x08000000
++#define GL_MULTISAMPLE_BUFFER_BIT4_QCOM                         0x10000000
++#define GL_MULTISAMPLE_BUFFER_BIT5_QCOM                         0x20000000
++#define GL_MULTISAMPLE_BUFFER_BIT6_QCOM                         0x40000000
++#define GL_MULTISAMPLE_BUFFER_BIT7_QCOM                         0x80000000
++#endif
++
++/*------------------------------------------------------------------------*
++ * End of extension tokens, start of corresponding extension functions
++ *------------------------------------------------------------------------*/
++
++/*------------------------------------------------------------------------*
++ * OES extension functions
++ *------------------------------------------------------------------------*/
++
++/* GL_OES_blend_equation_separate */
++#ifndef GL_OES_blend_equation_separate
++#define GL_OES_blend_equation_separate 1
++#ifdef GL_GLEXT_PROTOTYPES
++GL_API void GL_APIENTRY glBlendEquationSeparateOES (GLenum modeRGB, GLenum modeAlpha);
++#endif
++typedef void (GL_APIENTRYP PFNGLBLENDEQUATIONSEPARATEOESPROC) (GLenum modeRGB, GLenum modeAlpha);
++#endif
++
++/* GL_OES_blend_func_separate */
++#ifndef GL_OES_blend_func_separate
++#define GL_OES_blend_func_separate 1
++#ifdef GL_GLEXT_PROTOTYPES
++GL_API void GL_APIENTRY glBlendFuncSeparateOES (GLenum srcRGB, GLenum dstRGB, GLenum srcAlpha, GLenum dstAlpha);
++#endif
++typedef void (GL_APIENTRYP PFNGLBLENDFUNCSEPARATEOESPROC) (GLenum srcRGB, GLenum dstRGB, GLenum srcAlpha, GLenum dstAlpha);
++#endif
++
++/* GL_OES_blend_subtract */
++#ifndef GL_OES_blend_subtract
++#define GL_OES_blend_subtract 1
++#ifdef GL_GLEXT_PROTOTYPES
++GL_API void GL_APIENTRY glBlendEquationOES (GLenum mode);
++#endif
++typedef void (GL_APIENTRYP PFNGLBLENDEQUATIONOESPROC) (GLenum mode);
++#endif
++
++/* GL_OES_byte_coordinates */
++#ifndef GL_OES_byte_coordinates
++#define GL_OES_byte_coordinates 1
++#endif
++
++/* GL_OES_compressed_ETC1_RGB8_texture */
++#ifndef GL_OES_compressed_ETC1_RGB8_texture
++#define GL_OES_compressed_ETC1_RGB8_texture 1
++#endif
++
++/* GL_OES_depth24 */
++#ifndef GL_OES_depth24
++#define GL_OES_depth24 1
++#endif
++
++/* GL_OES_depth32 */
++#ifndef GL_OES_depth32
++#define GL_OES_depth32 1
++#endif
++
++/* GL_OES_draw_texture */
++#ifndef GL_OES_draw_texture
++#define GL_OES_draw_texture 1
++#ifdef GL_GLEXT_PROTOTYPES
++GL_API void GL_APIENTRY glDrawTexsOES (GLshort x, GLshort y, GLshort z, GLshort width, GLshort height);
++GL_API void GL_APIENTRY glDrawTexiOES (GLint x, GLint y, GLint z, GLint width, GLint height);
++GL_API void GL_APIENTRY glDrawTexxOES (GLfixed x, GLfixed y, GLfixed z, GLfixed width, GLfixed height);
++GL_API void GL_APIENTRY glDrawTexsvOES (const GLshort *coords);
++GL_API void GL_APIENTRY glDrawTexivOES (const GLint *coords);
++GL_API void GL_APIENTRY glDrawTexxvOES (const GLfixed *coords);
++GL_API void GL_APIENTRY glDrawTexfOES (GLfloat x, GLfloat y, GLfloat z, GLfloat width, GLfloat height);
++GL_API void GL_APIENTRY glDrawTexfvOES (const GLfloat *coords);
++#endif
++typedef void (GL_APIENTRYP PFNGLDRAWTEXSOESPROC) (GLshort x, GLshort y, GLshort z, GLshort width, GLshort height);
++typedef void (GL_APIENTRYP PFNGLDRAWTEXIOESPROC) (GLint x, GLint y, GLint z, GLint width, GLint height);
++typedef void (GL_APIENTRYP PFNGLDRAWTEXXOESPROC) (GLfixed x, GLfixed y, GLfixed z, GLfixed width, GLfixed height);
++typedef void (GL_APIENTRYP PFNGLDRAWTEXSVOESPROC) (const GLshort *coords);
++typedef void (GL_APIENTRYP PFNGLDRAWTEXIVOESPROC) (const GLint *coords);
++typedef void (GL_APIENTRYP PFNGLDRAWTEXXVOESPROC) (const GLfixed *coords);
++typedef void (GL_APIENTRYP PFNGLDRAWTEXFOESPROC) (GLfloat x, GLfloat y, GLfloat z, GLfloat width, GLfloat height);
++typedef void (GL_APIENTRYP PFNGLDRAWTEXFVOESPROC) (const GLfloat *coords);
++#endif
++
++/* GL_OES_EGL_image */
++#ifndef GL_OES_EGL_image
++#define GL_OES_EGL_image 1
++#ifdef GL_GLEXT_PROTOTYPES
++GL_API void GL_APIENTRY glEGLImageTargetTexture2DOES (GLenum target, GLeglImageOES image);
++GL_API void GL_APIENTRY glEGLImageTargetRenderbufferStorageOES (GLenum target, GLeglImageOES image);
++#endif
++typedef void (GL_APIENTRYP PFNGLEGLIMAGETARGETTEXTURE2DOESPROC) (GLenum target, GLeglImageOES image);
++typedef void (GL_APIENTRYP PFNGLEGLIMAGETARGETRENDERBUFFERSTORAGEOESPROC) (GLenum target, GLeglImageOES image);
++#endif
++
++/* GL_OES_EGL_image_external */
++#ifndef GL_OES_EGL_image_external
++#define GL_OES_EGL_image_external 1
++/* glEGLImageTargetTexture2DOES defined in GL_OES_EGL_image already. */
++#endif
++
++/* GL_OES_element_index_uint */
++#ifndef GL_OES_element_index_uint
++#define GL_OES_element_index_uint 1
++#endif
++
++/* GL_OES_extended_matrix_palette */
++#ifndef GL_OES_extended_matrix_palette
++#define GL_OES_extended_matrix_palette 1
++#endif
++
++/* GL_OES_fbo_render_mipmap */
++#ifndef GL_OES_fbo_render_mipmap
++#define GL_OES_fbo_render_mipmap 1
++#endif
++
++/* GL_OES_fixed_point */
++#ifndef GL_OES_fixed_point
++#define GL_OES_fixed_point 1
++#ifdef GL_GLEXT_PROTOTYPES
++GL_API void GL_APIENTRY glAlphaFuncxOES (GLenum func, GLclampx ref);
++GL_API void GL_APIENTRY glClearColorxOES (GLclampx red, GLclampx green, GLclampx blue, GLclampx alpha);
++GL_API void GL_APIENTRY glClearDepthxOES (GLclampx depth);
++GL_API void GL_APIENTRY glClipPlanexOES (GLenum plane, const GLfixed *equation);
++GL_API void GL_APIENTRY glColor4xOES (GLfixed red, GLfixed green, GLfixed blue, GLfixed alpha);
++GL_API void GL_APIENTRY glDepthRangexOES (GLclampx zNear, GLclampx zFar);
++GL_API void GL_APIENTRY glFogxOES (GLenum pname, GLfixed param);
++GL_API void GL_APIENTRY glFogxvOES (GLenum pname, const GLfixed *params);
++GL_API void GL_APIENTRY glFrustumxOES (GLfixed left, GLfixed right, GLfixed bottom, GLfixed top, GLfixed zNear, GLfixed zFar);
++GL_API void GL_APIENTRY glGetClipPlanexOES (GLenum pname, GLfixed eqn[4]);
++GL_API void GL_APIENTRY glGetFixedvOES (GLenum pname, GLfixed *params);
++GL_API void GL_APIENTRY glGetLightxvOES (GLenum light, GLenum pname, GLfixed *params);
++GL_API void GL_APIENTRY glGetMaterialxvOES (GLenum face, GLenum pname, GLfixed *params);
++GL_API void GL_APIENTRY glGetTexEnvxvOES (GLenum env, GLenum pname, GLfixed *params);
++GL_API void GL_APIENTRY glGetTexParameterxvOES (GLenum target, GLenum pname, GLfixed *params);
++GL_API void GL_APIENTRY glLightModelxOES (GLenum pname, GLfixed param);
++GL_API void GL_APIENTRY glLightModelxvOES (GLenum pname, const GLfixed *params);
++GL_API void GL_APIENTRY glLightxOES (GLenum light, GLenum pname, GLfixed param);
++GL_API void GL_APIENTRY glLightxvOES (GLenum light, GLenum pname, const GLfixed *params);
++GL_API void GL_APIENTRY glLineWidthxOES (GLfixed width);
++GL_API void GL_APIENTRY glLoadMatrixxOES (const GLfixed *m);
++GL_API void GL_APIENTRY glMaterialxOES (GLenum face, GLenum pname, GLfixed param);
++GL_API void GL_APIENTRY glMaterialxvOES (GLenum face, GLenum pname, const GLfixed *params);
++GL_API void GL_APIENTRY glMultMatrixxOES (const GLfixed *m);
++GL_API void GL_APIENTRY glMultiTexCoord4xOES (GLenum target, GLfixed s, GLfixed t, GLfixed r, GLfixed q);
++GL_API void GL_APIENTRY glNormal3xOES (GLfixed nx, GLfixed ny, GLfixed nz);
++GL_API void GL_APIENTRY glOrthoxOES (GLfixed left, GLfixed right, GLfixed bottom, GLfixed top, GLfixed zNear, GLfixed zFar);
++GL_API void GL_APIENTRY glPointParameterxOES (GLenum pname, GLfixed param);
++GL_API void GL_APIENTRY glPointParameterxvOES (GLenum pname, const GLfixed *params);
++GL_API void GL_APIENTRY glPointSizexOES (GLfixed size);
++GL_API void GL_APIENTRY glPolygonOffsetxOES (GLfixed factor, GLfixed units);
++GL_API void GL_APIENTRY glRotatexOES (GLfixed angle, GLfixed x, GLfixed y, GLfixed z);
++GL_API void GL_APIENTRY glSampleCoveragexOES (GLclampx value, GLboolean invert);
++GL_API void GL_APIENTRY glScalexOES (GLfixed x, GLfixed y, GLfixed z);
++GL_API void GL_APIENTRY glTexEnvxOES (GLenum target, GLenum pname, GLfixed param);
++GL_API void GL_APIENTRY glTexEnvxvOES (GLenum target, GLenum pname, const GLfixed *params);
++GL_API void GL_APIENTRY glTexParameterxOES (GLenum target, GLenum pname, GLfixed param);
++GL_API void GL_APIENTRY glTexParameterxvOES (GLenum target, GLenum pname, const GLfixed *params);
++GL_API void GL_APIENTRY glTranslatexOES (GLfixed x, GLfixed y, GLfixed z);
++#endif
++typedef void (GL_APIENTRYP PFNGLALPHAFUNCXOESPROC) (GLenum func, GLclampx ref);
++typedef void (GL_APIENTRYP PFNGLCLEARCOLORXOESPROC) (GLclampx red, GLclampx green, GLclampx blue, GLclampx alpha);
++typedef void (GL_APIENTRYP PFNGLCLEARDEPTHXOESPROC) (GLclampx depth);
++typedef void (GL_APIENTRYP PFNGLCLIPPLANEXOESPROC) (GLenum plane, const GLfixed *equation);
++typedef void (GL_APIENTRYP PFNGLCOLOR4XOESPROC) (GLfixed red, GLfixed green, GLfixed blue, GLfixed alpha);
++typedef void (GL_APIENTRYP PFNGLDEPTHRANGEXOESPROC) (GLclampx zNear, GLclampx zFar);
++typedef void (GL_APIENTRYP PFNGLFOGXOESPROC) (GLenum pname, GLfixed param);
++typedef void (GL_APIENTRYP PFNGLFOGXVOESPROC) (GLenum pname, const GLfixed *params);
++typedef void (GL_APIENTRYP PFNGLFRUSTUMXOESPROC) (GLfixed left, GLfixed right, GLfixed bottom, GLfixed top, GLfixed zNear, GLfixed zFar);
++typedef void (GL_APIENTRYP PFNGLGETCLIPPLANEXOESPROC) (GLenum pname, GLfixed eqn[4]);
++typedef void (GL_APIENTRYP PFNGLGETFIXEDVOESPROC) (GLenum pname, GLfixed *params);
++typedef void (GL_APIENTRYP PFNGLGETLIGHTXVOESPROC) (GLenum light, GLenum pname, GLfixed *params);
++typedef void (GL_APIENTRYP PFNGLGETMATERIALXVOESPROC) (GLenum face, GLenum pname, GLfixed *params);
++typedef void (GL_APIENTRYP PFNGLGETTEXENVXVOESPROC) (GLenum env, GLenum pname, GLfixed *params);
++typedef void (GL_APIENTRYP PFNGLGETTEXPARAMETERXVOESPROC) (GLenum target, GLenum pname, GLfixed *params);
++typedef void (GL_APIENTRYP PFNGLLIGHTMODELXOESPROC) (GLenum pname, GLfixed param);
++typedef void (GL_APIENTRYP PFNGLLIGHTMODELXVOESPROC) (GLenum pname, const GLfixed *params);
++typedef void (GL_APIENTRYP PFNGLLIGHTXOESPROC) (GLenum light, GLenum pname, GLfixed param);
++typedef void (GL_APIENTRYP PFNGLLIGHTXVOESPROC) (GLenum light, GLenum pname, const GLfixed *params);
++typedef void (GL_APIENTRYP PFNGLLINEWIDTHXOESPROC) (GLfixed width);
++typedef void (GL_APIENTRYP PFNGLLOADMATRIXXOESPROC) (const GLfixed *m);
++typedef void (GL_APIENTRYP PFNGLMATERIALXOESPROC) (GLenum face, GLenum pname, GLfixed param);
++typedef void (GL_APIENTRYP PFNGLMATERIALXVOESPROC) (GLenum face, GLenum pname, const GLfixed *params);
++typedef void (GL_APIENTRYP PFNGLMULTMATRIXXOESPROC) (const GLfixed *m);
++typedef void (GL_APIENTRYP PFNGLMULTITEXCOORD4XOESPROC) (GLenum target, GLfixed s, GLfixed t, GLfixed r, GLfixed q);
++typedef void (GL_APIENTRYP PFNGLNORMAL3XOESPROC) (GLfixed nx, GLfixed ny, GLfixed nz);
++typedef void (GL_APIENTRYP PFNGLORTHOXOESPROC) (GLfixed left, GLfixed right, GLfixed bottom, GLfixed top, GLfixed zNear, GLfixed zFar);
++typedef void (GL_APIENTRYP PFNGLPOINTPARAMETERXOESPROC) (GLenum pname, GLfixed param);
++typedef void (GL_APIENTRYP PFNGLPOINTPARAMETERXVOESPROC) (GLenum pname, const GLfixed *params);
++typedef void (GL_APIENTRYP PFNGLPOINTSIZEXOESPROC) (GLfixed size);
++typedef void (GL_APIENTRYP PFNGLPOLYGONOFFSETXOESPROC) (GLfixed factor, GLfixed units);
++typedef void (GL_APIENTRYP PFNGLROTATEXOESPROC) (GLfixed angle, GLfixed x, GLfixed y, GLfixed z);
++typedef void (GL_APIENTRYP PFNGLSAMPLECOVERAGEXOESPROC) (GLclampx value, GLboolean invert);
++typedef void (GL_APIENTRYP PFNGLSCALEXOESPROC) (GLfixed x, GLfixed y, GLfixed z);
++typedef void (GL_APIENTRYP PFNGLTEXENVXOESPROC) (GLenum target, GLenum pname, GLfixed param);
++typedef void (GL_APIENTRYP PFNGLTEXENVXVOESPROC) (GLenum target, GLenum pname, const GLfixed *params);
++typedef void (GL_APIENTRYP PFNGLTEXPARAMETERXOESPROC) (GLenum target, GLenum pname, GLfixed param);
++typedef void (GL_APIENTRYP PFNGLTEXPARAMETERXVOESPROC) (GLenum target, GLenum pname, const GLfixed *params);
++typedef void (GL_APIENTRYP PFNGLTRANSLATEXOESPROC) (GLfixed x, GLfixed y, GLfixed z);
++#endif
++
++/* GL_OES_framebuffer_object */
++#ifndef GL_OES_framebuffer_object
++#define GL_OES_framebuffer_object 1
++#ifdef GL_GLEXT_PROTOTYPES
++GL_API GLboolean GL_APIENTRY glIsRenderbufferOES (GLuint renderbuffer);
++GL_API void GL_APIENTRY glBindRenderbufferOES (GLenum target, GLuint renderbuffer);
++GL_API void GL_APIENTRY glDeleteRenderbuffersOES (GLsizei n, const GLuint* renderbuffers);
++GL_API void GL_APIENTRY glGenRenderbuffersOES (GLsizei n, GLuint* renderbuffers);
++GL_API void GL_APIENTRY glRenderbufferStorageOES (GLenum target, GLenum internalformat, GLsizei width, GLsizei height);
++GL_API void GL_APIENTRY glGetRenderbufferParameterivOES (GLenum target, GLenum pname, GLint* params);
++GL_API GLboolean GL_APIENTRY glIsFramebufferOES (GLuint framebuffer);
++GL_API void GL_APIENTRY glBindFramebufferOES (GLenum target, GLuint framebuffer);
++GL_API void GL_APIENTRY glDeleteFramebuffersOES (GLsizei n, const GLuint* framebuffers);
++GL_API void GL_APIENTRY glGenFramebuffersOES (GLsizei n, GLuint* framebuffers);
++GL_API GLenum GL_APIENTRY glCheckFramebufferStatusOES (GLenum target);
++GL_API void GL_APIENTRY glFramebufferRenderbufferOES (GLenum target, GLenum attachment, GLenum renderbuffertarget, GLuint renderbuffer);
++GL_API void GL_APIENTRY glFramebufferTexture2DOES (GLenum target, GLenum attachment, GLenum textarget, GLuint texture, GLint level);
++GL_API void GL_APIENTRY glGetFramebufferAttachmentParameterivOES (GLenum target, GLenum attachment, GLenum pname, GLint* params);
++GL_API void GL_APIENTRY glGenerateMipmapOES (GLenum target);
++#endif
++typedef GLboolean (GL_APIENTRYP PFNGLISRENDERBUFFEROESPROC) (GLuint renderbuffer);
++typedef void (GL_APIENTRYP PFNGLBINDRENDERBUFFEROESPROC) (GLenum target, GLuint renderbuffer);
++typedef void (GL_APIENTRYP PFNGLDELETERENDERBUFFERSOESPROC) (GLsizei n, const GLuint* renderbuffers);
++typedef void (GL_APIENTRYP PFNGLGENRENDERBUFFERSOESPROC) (GLsizei n, GLuint* renderbuffers);
++typedef void (GL_APIENTRYP PFNGLRENDERBUFFERSTORAGEOESPROC) (GLenum target, GLenum internalformat, GLsizei width, GLsizei height);
++typedef void (GL_APIENTRYP PFNGLGETRENDERBUFFERPARAMETERIVOESPROC) (GLenum target, GLenum pname, GLint* params);
++typedef GLboolean (GL_APIENTRYP PFNGLISFRAMEBUFFEROESPROC) (GLuint framebuffer);
++typedef void (GL_APIENTRYP PFNGLBINDFRAMEBUFFEROESPROC) (GLenum target, GLuint framebuffer);
++typedef void (GL_APIENTRYP PFNGLDELETEFRAMEBUFFERSOESPROC) (GLsizei n, const GLuint* framebuffers);
++typedef void (GL_APIENTRYP PFNGLGENFRAMEBUFFERSOESPROC) (GLsizei n, GLuint* framebuffers);
++typedef GLenum (GL_APIENTRYP PFNGLCHECKFRAMEBUFFERSTATUSOESPROC) (GLenum target);
++typedef void (GL_APIENTRYP PFNGLFRAMEBUFFERRENDERBUFFEROESPROC) (GLenum target, GLenum attachment, GLenum renderbuffertarget, GLuint renderbuffer);
++typedef void (GL_APIENTRYP PFNGLFRAMEBUFFERTEXTURE2DOESPROC) (GLenum target, GLenum attachment, GLenum textarget, GLuint texture, GLint level);
++typedef void (GL_APIENTRYP PFNGLGETFRAMEBUFFERATTACHMENTPARAMETERIVOESPROC) (GLenum target, GLenum attachment, GLenum pname, GLint* params);
++typedef void (GL_APIENTRYP PFNGLGENERATEMIPMAPOESPROC) (GLenum target);
++#endif
++
++/* GL_OES_mapbuffer */
++#ifndef GL_OES_mapbuffer
++#define GL_OES_mapbuffer 1
++#ifdef GL_GLEXT_PROTOTYPES
++GL_API void* GL_APIENTRY glMapBufferOES (GLenum target, GLenum access);
++GL_API GLboolean GL_APIENTRY glUnmapBufferOES (GLenum target);
++GL_API void GL_APIENTRY glGetBufferPointervOES (GLenum target, GLenum pname, GLvoid ** params);
++#endif
++typedef void* (GL_APIENTRYP PFNGLMAPBUFFEROESPROC) (GLenum target, GLenum access);
++typedef GLboolean (GL_APIENTRYP PFNGLUNMAPBUFFEROESPROC) (GLenum target);
++typedef void (GL_APIENTRYP PFNGLGETBUFFERPOINTERVOESPROC) (GLenum target, GLenum pname, GLvoid ** params);
++#endif
++
++/* GL_OES_matrix_get */
++#ifndef GL_OES_matrix_get
++#define GL_OES_matrix_get 1
++#endif
++
++/* GL_OES_matrix_palette */
++#ifndef GL_OES_matrix_palette
++#define GL_OES_matrix_palette 1
++#ifdef GL_GLEXT_PROTOTYPES
++GL_API void GL_APIENTRY glCurrentPaletteMatrixOES (GLuint matrixpaletteindex);
++GL_API void GL_APIENTRY glLoadPaletteFromModelViewMatrixOES (void);
++GL_API void GL_APIENTRY glMatrixIndexPointerOES (GLint size, GLenum type, GLsizei stride, const GLvoid *pointer);
++GL_API void GL_APIENTRY glWeightPointerOES (GLint size, GLenum type, GLsizei stride, const GLvoid *pointer);
++#endif
++typedef void (GL_APIENTRYP PFNGLCURRENTPALETTEMATRIXOESPROC) (GLuint matrixpaletteindex);
++typedef void (GL_APIENTRYP PFNGLLOADPALETTEFROMMODELVIEWMATRIXOESPROC) (void);
++typedef void (GL_APIENTRYP PFNGLMATRIXINDEXPOINTEROESPROC) (GLint size, GLenum type, GLsizei stride, const GLvoid *pointer);
++typedef void (GL_APIENTRYP PFNGLWEIGHTPOINTEROESPROC) (GLint size, GLenum type, GLsizei stride, const GLvoid *pointer);
++#endif
++
++/* GL_OES_packed_depth_stencil */
++#ifndef GL_OES_packed_depth_stencil
++#define GL_OES_packed_depth_stencil 1
++#endif
++
++/* GL_OES_required_internalformat */
++#ifndef GL_OES_required_internalformat
++#define GL_OES_required_internalformat 1
++#endif
++
++/* GL_OES_query_matrix */
++#ifndef GL_OES_query_matrix
++#define GL_OES_query_matrix 1
++#ifdef GL_GLEXT_PROTOTYPES
++GL_API GLbitfield GL_APIENTRY glQueryMatrixxOES (GLfixed mantissa[16], GLint exponent[16]);
++#endif
++typedef GLbitfield (GL_APIENTRYP PFNGLQUERYMATRIXXOESPROC) (GLfixed mantissa[16], GLint exponent[16]);
++#endif
++
++/* GL_OES_rgb8_rgba8 */
++#ifndef GL_OES_rgb8_rgba8
++#define GL_OES_rgb8_rgba8 1
++#endif
++
++/* GL_OES_single_precision */
++#ifndef GL_OES_single_precision
++#define GL_OES_single_precision 1
++#ifdef GL_GLEXT_PROTOTYPES
++GL_API void GL_APIENTRY glDepthRangefOES (GLclampf zNear, GLclampf zFar);
++GL_API void GL_APIENTRY glFrustumfOES (GLfloat left, GLfloat right, GLfloat bottom, GLfloat top, GLfloat zNear, GLfloat zFar);
++GL_API void GL_APIENTRY glOrthofOES (GLfloat left, GLfloat right, GLfloat bottom, GLfloat top, GLfloat zNear, GLfloat zFar);
++GL_API void GL_APIENTRY glClipPlanefOES (GLenum plane, const GLfloat *equation);
++GL_API void GL_APIENTRY glGetClipPlanefOES (GLenum pname, GLfloat eqn[4]);
++GL_API void GL_APIENTRY glClearDepthfOES (GLclampf depth);
++#endif
++typedef void (GL_APIENTRYP PFNGLDEPTHRANGEFOESPROC) (GLclampf zNear, GLclampf zFar);
++typedef void (GL_APIENTRYP PFNGLFRUSTUMFOESPROC) (GLfloat left, GLfloat right, GLfloat bottom, GLfloat top, GLfloat zNear, GLfloat zFar);
++typedef void (GL_APIENTRYP PFNGLORTHOFOESPROC) (GLfloat left, GLfloat right, GLfloat bottom, GLfloat top, GLfloat zNear, GLfloat zFar);
++typedef void (GL_APIENTRYP PFNGLCLIPPLANEFOESPROC) (GLenum plane, const GLfloat *equation);
++typedef void (GL_APIENTRYP PFNGLGETCLIPPLANEFOESPROC) (GLenum pname, GLfloat eqn[4]);
++typedef void (GL_APIENTRYP PFNGLCLEARDEPTHFOESPROC) (GLclampf depth);
++#endif
++
++/* GL_OES_stencil1 */
++#ifndef GL_OES_stencil1
++#define GL_OES_stencil1 1
++#endif
++
++/* GL_OES_stencil4 */
++#ifndef GL_OES_stencil4
++#define GL_OES_stencil4 1
++#endif
++
++/* GL_OES_stencil8 */
++#ifndef GL_OES_stencil8
++#define GL_OES_stencil8 1
++#endif
++
++/* GL_OES_stencil_wrap */
++#ifndef GL_OES_stencil_wrap
++#define GL_OES_stencil_wrap 1
++#endif
++
++/* GL_OES_texture_cube_map */
++#ifndef GL_OES_texture_cube_map
++#define GL_OES_texture_cube_map 1
++#ifdef GL_GLEXT_PROTOTYPES
++GL_API void GL_APIENTRY glTexGenfOES (GLenum coord, GLenum pname, GLfloat param);
++GL_API void GL_APIENTRY glTexGenfvOES (GLenum coord, GLenum pname, const GLfloat *params);
++GL_API void GL_APIENTRY glTexGeniOES (GLenum coord, GLenum pname, GLint param);
++GL_API void GL_APIENTRY glTexGenivOES (GLenum coord, GLenum pname, const GLint *params);
++GL_API void GL_APIENTRY glTexGenxOES (GLenum coord, GLenum pname, GLfixed param);
++GL_API void GL_APIENTRY glTexGenxvOES (GLenum coord, GLenum pname, const GLfixed *params);
++GL_API void GL_APIENTRY glGetTexGenfvOES (GLenum coord, GLenum pname, GLfloat *params);
++GL_API void GL_APIENTRY glGetTexGenivOES (GLenum coord, GLenum pname, GLint *params);
++GL_API void GL_APIENTRY glGetTexGenxvOES (GLenum coord, GLenum pname, GLfixed *params);
++#endif
++typedef void (GL_APIENTRYP PFNGLTEXGENFOESPROC) (GLenum coord, GLenum pname, GLfloat param);
++typedef void (GL_APIENTRYP PFNGLTEXGENFVOESPROC) (GLenum coord, GLenum pname, const GLfloat *params);
++typedef void (GL_APIENTRYP PFNGLTEXGENIOESPROC) (GLenum coord, GLenum pname, GLint param);
++typedef void (GL_APIENTRYP PFNGLTEXGENIVOESPROC) (GLenum coord, GLenum pname, const GLint *params);
++typedef void (GL_APIENTRYP PFNGLTEXGENXOESPROC) (GLenum coord, GLenum pname, GLfixed param);
++typedef void (GL_APIENTRYP PFNGLTEXGENXVOESPROC) (GLenum coord, GLenum pname, const GLfixed *params);
++typedef void (GL_APIENTRYP PFNGLGETTEXGENFVOESPROC) (GLenum coord, GLenum pname, GLfloat *params);
++typedef void (GL_APIENTRYP PFNGLGETTEXGENIVOESPROC) (GLenum coord, GLenum pname, GLint *params);
++typedef void (GL_APIENTRYP PFNGLGETTEXGENXVOESPROC) (GLenum coord, GLenum pname, GLfixed *params);
++#endif
++
++/* GL_OES_texture_env_crossbar */
++#ifndef GL_OES_texture_env_crossbar
++#define GL_OES_texture_env_crossbar 1
++#endif
++
++/* GL_OES_texture_mirrored_repeat */
++#ifndef GL_OES_texture_mirrored_repeat
++#define GL_OES_texture_mirrored_repeat 1
++#endif
++
++/* GL_OES_vertex_array_object */
++#ifndef GL_OES_vertex_array_object
++#define GL_OES_vertex_array_object 1
++#ifdef GL_GLEXT_PROTOTYPES
++GL_API void GL_APIENTRY glBindVertexArrayOES (GLuint array);
++GL_API void GL_APIENTRY glDeleteVertexArraysOES (GLsizei n, const GLuint *arrays);
++GL_API void GL_APIENTRY glGenVertexArraysOES (GLsizei n, GLuint *arrays);
++GL_API GLboolean GL_APIENTRY glIsVertexArrayOES (GLuint array);
++#endif
++typedef void (GL_APIENTRYP PFNGLBINDVERTEXARRAYOESPROC) (GLuint array);
++typedef void (GL_APIENTRYP PFNGLDELETEVERTEXARRAYSOESPROC) (GLsizei n, const GLuint *arrays);
++typedef void (GL_APIENTRYP PFNGLGENVERTEXARRAYSOESPROC) (GLsizei n, GLuint *arrays);
++typedef GLboolean (GL_APIENTRYP PFNGLISVERTEXARRAYOESPROC) (GLuint array);
++#endif
++
++/*------------------------------------------------------------------------*
++ * AMD extension functions
++ *------------------------------------------------------------------------*/
++
++/* GL_AMD_compressed_3DC_texture */
++#ifndef GL_AMD_compressed_3DC_texture
++#define GL_AMD_compressed_3DC_texture 1
++#endif
++
++/* GL_AMD_compressed_ATC_texture */
++#ifndef GL_AMD_compressed_ATC_texture
++#define GL_AMD_compressed_ATC_texture 1
++#endif
++
++/*------------------------------------------------------------------------*
++ * APPLE extension functions
++ *------------------------------------------------------------------------*/
++
++/* GL_APPLE_copy_texture_levels */
++#ifndef GL_APPLE_copy_texture_levels
++#define GL_APPLE_copy_texture_levels 1
++#ifdef GL_GLEXT_PROTOTYPES
++GL_API void GL_APIENTRY glCopyTextureLevelsAPPLE (GLuint destinationTexture, GLuint sourceTexture, GLint sourceBaseLevel, GLsizei sourceLevelCount);
++#endif
++typedef void (GL_APIENTRYP PFNGLCOPYTEXTURELEVELSAPPLEPROC) (GLuint destinationTexture, GLuint sourceTexture, GLint sourceBaseLevel, GLsizei sourceLevelCount);
++#endif
++
++/* GL_APPLE_framebuffer_multisample */
++#ifndef GL_APPLE_framebuffer_multisample
++#define GL_APPLE_framebuffer_multisample 1
++#ifdef GL_GLEXT_PROTOTYPES
++GL_API void GL_APIENTRY glRenderbufferStorageMultisampleAPPLE (GLenum, GLsizei, GLenum, GLsizei, GLsizei);
++GL_API void GL_APIENTRY glResolveMultisampleFramebufferAPPLE (void);
++#endif /* GL_GLEXT_PROTOTYPES */
++typedef void (GL_APIENTRYP PFNGLRENDERBUFFERSTORAGEMULTISAMPLEAPPLEPROC) (GLenum target, GLsizei samples, GLenum internalformat, GLsizei width, GLsizei height);
++typedef void (GL_APIENTRYP PFNGLRESOLVEMULTISAMPLEFRAMEBUFFERAPPLEPROC) (void);
++#endif
++
++/* GL_APPLE_sync */
++#ifndef GL_APPLE_sync
++#define GL_APPLE_sync 1
++#ifdef GL_GLEXT_PROTOTYPES
++GL_API GLsync GL_APIENTRY glFenceSyncAPPLE (GLenum condition, GLbitfield flags);
++GL_API GLboolean GL_APIENTRY glIsSyncAPPLE (GLsync sync);
++GL_API void GL_APIENTRY glDeleteSyncAPPLE (GLsync sync);
++GL_API GLenum GL_APIENTRY glClientWaitSyncAPPLE (GLsync sync, GLbitfield flags, GLuint64 timeout);
++GL_API void GL_APIENTRY glWaitSyncAPPLE (GLsync sync, GLbitfield flags, GLuint64 timeout);
++GL_API void GL_APIENTRY glGetInteger64vAPPLE (GLenum pname, GLint64 *params);
++GL_API void GL_APIENTRY glGetSyncivAPPLE (GLsync sync, GLenum pname, GLsizei bufSize, GLsizei *length, GLint *values);
++#endif
++typedef GLsync (GL_APIENTRYP PFNGLFENCESYNCAPPLEPROC) (GLenum condition, GLbitfield flags);
++typedef GLboolean (GL_APIENTRYP PFNGLISSYNCAPPLEPROC) (GLsync sync);
++typedef void (GL_APIENTRYP PFNGLDELETESYNCAPPLEPROC) (GLsync sync);
++typedef GLenum (GL_APIENTRYP PFNGLCLIENTWAITSYNCAPPLEPROC) (GLsync sync, GLbitfield flags, GLuint64 timeout);
++typedef void (GL_APIENTRYP PFNGLWAITSYNCAPPLEPROC) (GLsync sync, GLbitfield flags, GLuint64 timeout);
++typedef void (GL_APIENTRYP PFNGLGETINTEGER64VAPPLEPROC) (GLenum pname, GLint64 *params);
++typedef void (GL_APIENTRYP PFNGLGETSYNCIVAPPLEPROC) (GLsync sync, GLenum pname, GLsizei bufSize, GLsizei *length, GLint *values);
++#endif
++
++/* GL_APPLE_texture_2D_limited_npot */
++#ifndef GL_APPLE_texture_2D_limited_npot
++#define GL_APPLE_texture_2D_limited_npot 1
++#endif
++
++/* GL_APPLE_texture_format_BGRA8888 */
++#ifndef GL_APPLE_texture_format_BGRA8888
++#define GL_APPLE_texture_format_BGRA8888 1
++#endif
++
++/* GL_APPLE_texture_max_level */
++#ifndef GL_APPLE_texture_max_level
++#define GL_APPLE_texture_max_level 1
++#endif
++
++/*------------------------------------------------------------------------*
++ * ARM extension functions
++ *------------------------------------------------------------------------*/
++
++/* GL_ARM_rgba8 */
++#ifndef GL_ARM_rgba8
++#define GL_ARM_rgba8 1
++#endif
++
++/*------------------------------------------------------------------------*
++ * EXT extension functions
++ *------------------------------------------------------------------------*/
++
++/* GL_EXT_blend_minmax */
++#ifndef GL_EXT_blend_minmax
++#define GL_EXT_blend_minmax 1
++#endif
++
++/* GL_EXT_discard_framebuffer */
++#ifndef GL_EXT_discard_framebuffer
++#define GL_EXT_discard_framebuffer 1
++#ifdef GL_GLEXT_PROTOTYPES
++GL_API void GL_APIENTRY glDiscardFramebufferEXT (GLenum target, GLsizei numAttachments, const GLenum *attachments);
++#endif
++typedef void (GL_APIENTRYP PFNGLDISCARDFRAMEBUFFEREXTPROC) (GLenum target, GLsizei numAttachments, const GLenum *attachments);
++#endif
++
++/* GL_EXT_map_buffer_range */
++#ifndef GL_EXT_map_buffer_range
++#define GL_EXT_map_buffer_range 1
++#ifdef GL_GLEXT_PROTOTYPES
++GL_API void GL_APIENTRY *glMapBufferRangeEXT (GLenum target, GLintptr offset, GLsizeiptr length, GLbitfield access);
++GL_API void GL_APIENTRY glFlushMappedBufferRangeEXT (GLenum target, GLintptr offset, GLsizeiptr length);
++#endif
++typedef void* (GL_APIENTRYP PFNGLMAPBUFFERRANGEEXTPROC) (GLenum target, GLintptr offset, GLsizeiptr length, GLbitfield access);
++typedef void (GL_APIENTRYP PFNGLFLUSHMAPPEDBUFFERRANGEEXTPROC) (GLenum target, GLintptr offset, GLsizeiptr length);
++#endif
++
++/* GL_EXT_multisampled_render_to_texture */
++#ifndef GL_EXT_multisampled_render_to_texture
++#define GL_EXT_multisampled_render_to_texture 1
++#ifdef GL_GLEXT_PROTOTYPES
++GL_API void GL_APIENTRY glRenderbufferStorageMultisampleEXT (GLenum, GLsizei, GLenum, GLsizei, GLsizei);
++GL_API void GL_APIENTRY glFramebufferTexture2DMultisampleEXT (GLenum, GLenum, GLenum, GLuint, GLint, GLsizei);
++#endif
++typedef void (GL_APIENTRYP PFNGLRENDERBUFFERSTORAGEMULTISAMPLEEXTPROC) (GLenum target, GLsizei samples, GLenum internalformat, GLsizei width, GLsizei height);
++typedef void (GL_APIENTRYP PFNGLFRAMEBUFFERTEXTURE2DMULTISAMPLEEXTPROC) (GLenum target, GLenum attachment, GLenum textarget, GLuint texture, GLint level, GLsizei samples);
++#endif
++
++/* GL_EXT_multi_draw_arrays */
++#ifndef GL_EXT_multi_draw_arrays
++#define GL_EXT_multi_draw_arrays 1
++#ifdef GL_GLEXT_PROTOTYPES
++GL_API void GL_APIENTRY glMultiDrawArraysEXT (GLenum, const GLint *, const GLsizei *, GLsizei);
++GL_API void GL_APIENTRY glMultiDrawElementsEXT (GLenum, const GLsizei *, GLenum, const GLvoid* *, GLsizei);
++#endif /* GL_GLEXT_PROTOTYPES */
++typedef void (GL_APIENTRYP PFNGLMULTIDRAWARRAYSEXTPROC) (GLenum mode, const GLint *first, const GLsizei *count, GLsizei primcount);
++typedef void (GL_APIENTRYP PFNGLMULTIDRAWELEMENTSEXTPROC) (GLenum mode, const GLsizei *count, GLenum type, const GLvoid* *indices, GLsizei primcount);
++#endif
++
++/* GL_EXT_read_format_bgra */
++#ifndef GL_EXT_read_format_bgra
++#define GL_EXT_read_format_bgra 1
++#endif
++
++/* GL_EXT_robustness */
++#ifndef GL_EXT_robustness
++#define GL_EXT_robustness 1
++#ifdef GL_GLEXT_PROTOTYPES
++GL_API GLenum GL_APIENTRY glGetGraphicsResetStatusEXT (void);
++GL_API void GL_APIENTRY glReadnPixelsEXT (GLint x, GLint y, GLsizei width, GLsizei height, GLenum format, GLenum type, GLsizei bufSize, void *data);
++GL_API void GL_APIENTRY glGetnUniformfvEXT (GLuint program, GLint location, GLsizei bufSize, float *params);
++GL_API void GL_APIENTRY glGetnUniformivEXT (GLuint program, GLint location, GLsizei bufSize, GLint *params);
++#endif
++typedef GLenum (GL_APIENTRYP PFNGLGETGRAPHICSRESETSTATUSEXTPROC) (void);
++typedef void (GL_APIENTRYP PFNGLREADNPIXELSEXTPROC) (GLint x, GLint y, GLsizei width, GLsizei height, GLenum format, GLenum type, GLsizei bufSize, void *data);
++typedef void (GL_APIENTRYP PFNGLGETNUNIFORMFVEXTPROC) (GLuint program, GLint location, GLsizei bufSize, float *params);
++typedef void (GL_APIENTRYP PFNGLGETNUNIFORMIVEXTPROC) (GLuint program, GLint location, GLsizei bufSize, GLint *params);
++#endif
++
++/* GL_EXT_sRGB */
++#ifndef GL_EXT_sRGB
++#define GL_EXT_sRGB 1
++#endif
++
++/* GL_EXT_texture_compression_dxt1 */
++#ifndef GL_EXT_texture_compression_dxt1
++#define GL_EXT_texture_compression_dxt1 1
++#endif
++
++/* GL_EXT_texture_filter_anisotropic */
++#ifndef GL_EXT_texture_filter_anisotropic
++#define GL_EXT_texture_filter_anisotropic 1
++#endif
++
++/* GL_EXT_texture_format_BGRA8888 */
++#ifndef GL_EXT_texture_format_BGRA8888
++#define GL_EXT_texture_format_BGRA8888 1
++#endif
++
++/* GL_EXT_texture_lod_bias */
++#ifndef GL_EXT_texture_lod_bias
++#define GL_EXT_texture_lod_bias 1
++#endif
++
++/* GL_EXT_texture_storage */
++#ifndef GL_EXT_texture_storage
++#define GL_EXT_texture_storage 1
++#ifdef GL_GLEXT_PROTOTYPES
++GL_API void GL_APIENTRY glTexStorage1DEXT (GLenum target, GLsizei levels, GLenum internalformat, GLsizei width);
++GL_API void GL_APIENTRY glTexStorage2DEXT (GLenum target, GLsizei levels, GLenum internalformat, GLsizei width, GLsizei height);
++GL_API void GL_APIENTRY glTexStorage3DEXT (GLenum target, GLsizei levels, GLenum internalformat, GLsizei width, GLsizei height, GLsizei depth);
++GL_API void GL_APIENTRY glTextureStorage1DEXT (GLuint texture, GLenum target, GLsizei levels, GLenum internalformat, GLsizei width);
++GL_API void GL_APIENTRY glTextureStorage2DEXT (GLuint texture, GLenum target, GLsizei levels, GLenum internalformat, GLsizei width, GLsizei height);
++GL_API void GL_APIENTRY glTextureStorage3DEXT (GLuint texture, GLenum target, GLsizei levels, GLenum internalformat, GLsizei width, GLsizei height, GLsizei depth);
++#endif
++typedef void (GL_APIENTRYP PFNGLTEXSTORAGE1DEXTPROC) (GLenum target, GLsizei levels, GLenum internalformat, GLsizei width);
++typedef void (GL_APIENTRYP PFNGLTEXSTORAGE2DEXTPROC) (GLenum target, GLsizei levels, GLenum internalformat, GLsizei width, GLsizei height);
++typedef void (GL_APIENTRYP PFNGLTEXSTORAGE3DEXTPROC) (GLenum target, GLsizei levels, GLenum internalformat, GLsizei width, GLsizei height, GLsizei depth);
++typedef void (GL_APIENTRYP PFNGLTEXTURESTORAGE1DEXTPROC) (GLuint texture, GLenum target, GLsizei levels, GLenum internalformat, GLsizei width);
++typedef void (GL_APIENTRYP PFNGLTEXTURESTORAGE2DEXTPROC) (GLuint texture, GLenum target, GLsizei levels, GLenum internalformat, GLsizei width, GLsizei height);
++typedef void (GL_APIENTRYP PFNGLTEXTURESTORAGE3DEXTPROC) (GLuint texture, GLenum target, GLsizei levels, GLenum internalformat, GLsizei width, GLsizei height, GLsizei depth);
++#endif
++
++/*------------------------------------------------------------------------*
++ * IMG extension functions
++ *------------------------------------------------------------------------*/
++
++/* GL_IMG_read_format */
++#ifndef GL_IMG_read_format
++#define GL_IMG_read_format 1
++#endif
++
++/* GL_IMG_texture_compression_pvrtc */
++#ifndef GL_IMG_texture_compression_pvrtc
++#define GL_IMG_texture_compression_pvrtc 1
++#endif
++
++/* GL_IMG_texture_env_enhanced_fixed_function */
++#ifndef GL_IMG_texture_env_enhanced_fixed_function
++#define GL_IMG_texture_env_enhanced_fixed_function 1
++#endif
++
++/* GL_IMG_user_clip_plane */
++#ifndef GL_IMG_user_clip_plane
++#define GL_IMG_user_clip_plane 1
++#ifdef GL_GLEXT_PROTOTYPES
++GL_API void GL_APIENTRY glClipPlanefIMG (GLenum, const GLfloat *);
++GL_API void GL_APIENTRY glClipPlanexIMG (GLenum, const GLfixed *);
++#endif
++typedef void (GL_APIENTRYP PFNGLCLIPPLANEFIMGPROC) (GLenum p, const GLfloat *eqn);
++typedef void (GL_APIENTRYP PFNGLCLIPPLANEXIMGPROC) (GLenum p, const GLfixed *eqn);
++#endif
++
++/* GL_IMG_multisampled_render_to_texture */
++#ifndef GL_IMG_multisampled_render_to_texture
++#define GL_IMG_multisampled_render_to_texture 1
++#ifdef GL_GLEXT_PROTOTYPES
++GL_API void GL_APIENTRY glRenderbufferStorageMultisampleIMG (GLenum, GLsizei, GLenum, GLsizei, GLsizei);
++GL_API void GL_APIENTRY glFramebufferTexture2DMultisampleIMG (GLenum, GLenum, GLenum, GLuint, GLint, GLsizei);
++#endif
++typedef void (GL_APIENTRYP PFNGLRENDERBUFFERSTORAGEMULTISAMPLEIMGPROC) (GLenum target, GLsizei samples, GLenum internalformat, GLsizei width, GLsizei height);
++typedef void (GL_APIENTRYP PFNGLFRAMEBUFFERTEXTURE2DMULTISAMPLEIMGPROC) (GLenum target, GLenum attachment, GLenum textarget, GLuint texture, GLint level, GLsizei samples);
++#endif
++
++/*------------------------------------------------------------------------*
++ * NV extension functions
++ *------------------------------------------------------------------------*/
++
++/* NV_fence */
++#ifndef GL_NV_fence
++#define GL_NV_fence 1
++#ifdef GL_GLEXT_PROTOTYPES
++GL_API void GL_APIENTRY glDeleteFencesNV (GLsizei, const GLuint *);
++GL_API void GL_APIENTRY glGenFencesNV (GLsizei, GLuint *);
++GL_API GLboolean GL_APIENTRY glIsFenceNV (GLuint);
++GL_API GLboolean GL_APIENTRY glTestFenceNV (GLuint);
++GL_API void GL_APIENTRY glGetFenceivNV (GLuint, GLenum, GLint *);
++GL_API void GL_APIENTRY glFinishFenceNV (GLuint);
++GL_API void GL_APIENTRY glSetFenceNV (GLuint, GLenum);
++#endif
++typedef void (GL_APIENTRYP PFNGLDELETEFENCESNVPROC) (GLsizei n, const GLuint *fences);
++typedef void (GL_APIENTRYP PFNGLGENFENCESNVPROC) (GLsizei n, GLuint *fences);
++typedef GLboolean (GL_APIENTRYP PFNGLISFENCENVPROC) (GLuint fence);
++typedef GLboolean (GL_APIENTRYP PFNGLTESTFENCENVPROC) (GLuint fence);
++typedef void (GL_APIENTRYP PFNGLGETFENCEIVNVPROC) (GLuint fence, GLenum pname, GLint *params);
++typedef void (GL_APIENTRYP PFNGLFINISHFENCENVPROC) (GLuint fence);
++typedef void (GL_APIENTRYP PFNGLSETFENCENVPROC) (GLuint fence, GLenum condition);
++#endif
++
++/*------------------------------------------------------------------------*
++ * QCOM extension functions
++ *------------------------------------------------------------------------*/
++
++/* GL_QCOM_driver_control */
++#ifndef GL_QCOM_driver_control
++#define GL_QCOM_driver_control 1
++#ifdef GL_GLEXT_PROTOTYPES
++GL_API void GL_APIENTRY glGetDriverControlsQCOM (GLint *num, GLsizei size, GLuint *driverControls);
++GL_API void GL_APIENTRY glGetDriverControlStringQCOM (GLuint driverControl, GLsizei bufSize, GLsizei *length, GLchar *driverControlString);
++GL_API void GL_APIENTRY glEnableDriverControlQCOM (GLuint driverControl);
++GL_API void GL_APIENTRY glDisableDriverControlQCOM (GLuint driverControl);
++#endif
++typedef void (GL_APIENTRYP PFNGLGETDRIVERCONTROLSQCOMPROC) (GLint *num, GLsizei size, GLuint *driverControls);
++typedef void (GL_APIENTRYP PFNGLGETDRIVERCONTROLSTRINGQCOMPROC) (GLuint driverControl, GLsizei bufSize, GLsizei *length, GLchar *driverControlString);
++typedef void (GL_APIENTRYP PFNGLENABLEDRIVERCONTROLQCOMPROC) (GLuint driverControl);
++typedef void (GL_APIENTRYP PFNGLDISABLEDRIVERCONTROLQCOMPROC) (GLuint driverControl);
++#endif
++
++/* GL_QCOM_extended_get */
++#ifndef GL_QCOM_extended_get
++#define GL_QCOM_extended_get 1
++#ifdef GL_GLEXT_PROTOTYPES
++GL_API void GL_APIENTRY glExtGetTexturesQCOM (GLuint *textures, GLint maxTextures, GLint *numTextures);
++GL_API void GL_APIENTRY glExtGetBuffersQCOM (GLuint *buffers, GLint maxBuffers, GLint *numBuffers);
++GL_API void GL_APIENTRY glExtGetRenderbuffersQCOM (GLuint *renderbuffers, GLint maxRenderbuffers, GLint *numRenderbuffers);
++GL_API void GL_APIENTRY glExtGetFramebuffersQCOM (GLuint *framebuffers, GLint maxFramebuffers, GLint *numFramebuffers);
++GL_API void GL_APIENTRY glExtGetTexLevelParameterivQCOM (GLuint texture, GLenum face, GLint level, GLenum pname, GLint *params);
++GL_API void GL_APIENTRY glExtTexObjectStateOverrideiQCOM (GLenum target, GLenum pname, GLint param);
++GL_API void GL_APIENTRY glExtGetTexSubImageQCOM (GLenum target, GLint level, GLint xoffset, GLint yoffset, GLint zoffset, GLsizei width, GLsizei height, GLsizei depth, GLenum format, GLenum type, GLvoid *texels);
++GL_API void GL_APIENTRY glExtGetBufferPointervQCOM (GLenum target, GLvoid **params);
++#endif
++typedef void (GL_APIENTRYP PFNGLEXTGETTEXTURESQCOMPROC) (GLuint *textures, GLint maxTextures, GLint *numTextures);
++typedef void (GL_APIENTRYP PFNGLEXTGETBUFFERSQCOMPROC) (GLuint *buffers, GLint maxBuffers, GLint *numBuffers);
++typedef void (GL_APIENTRYP PFNGLEXTGETRENDERBUFFERSQCOMPROC) (GLuint *renderbuffers, GLint maxRenderbuffers, GLint *numRenderbuffers);
++typedef void (GL_APIENTRYP PFNGLEXTGETFRAMEBUFFERSQCOMPROC) (GLuint *framebuffers, GLint maxFramebuffers, GLint *numFramebuffers);
++typedef void (GL_APIENTRYP PFNGLEXTGETTEXLEVELPARAMETERIVQCOMPROC) (GLuint texture, GLenum face, GLint level, GLenum pname, GLint *params);
++typedef void (GL_APIENTRYP PFNGLEXTTEXOBJECTSTATEOVERRIDEIQCOMPROC) (GLenum target, GLenum pname, GLint param);
++typedef void (GL_APIENTRYP PFNGLEXTGETTEXSUBIMAGEQCOMPROC) (GLenum target, GLint level, GLint xoffset, GLint yoffset, GLint zoffset, GLsizei width, GLsizei height, GLsizei depth, GLenum format, GLenum type, GLvoid *texels);
++typedef void (GL_APIENTRYP PFNGLEXTGETBUFFERPOINTERVQCOMPROC) (GLenum target, GLvoid **params);
++#endif
++
++/* GL_QCOM_extended_get2 */
++#ifndef GL_QCOM_extended_get2
++#define GL_QCOM_extended_get2 1
++#ifdef GL_GLEXT_PROTOTYPES
++GL_API void GL_APIENTRY glExtGetShadersQCOM (GLuint *shaders, GLint maxShaders, GLint *numShaders);
++GL_API void GL_APIENTRY glExtGetProgramsQCOM (GLuint *programs, GLint maxPrograms, GLint *numPrograms);
++GL_API GLboolean GL_APIENTRY glExtIsProgramBinaryQCOM (GLuint program);
++GL_API void GL_APIENTRY glExtGetProgramBinarySourceQCOM (GLuint program, GLenum shadertype, GLchar *source, GLint *length);
++#endif
++typedef void (GL_APIENTRYP PFNGLEXTGETSHADERSQCOMPROC) (GLuint *shaders, GLint maxShaders, GLint *numShaders);
++typedef void (GL_APIENTRYP PFNGLEXTGETPROGRAMSQCOMPROC) (GLuint *programs, GLint maxPrograms, GLint *numPrograms);
++typedef GLboolean (GL_APIENTRYP PFNGLEXTISPROGRAMBINARYQCOMPROC) (GLuint program);
++typedef void (GL_APIENTRYP PFNGLEXTGETPROGRAMBINARYSOURCEQCOMPROC) (GLuint program, GLenum shadertype, GLchar *source, GLint *length);
++#endif
++
++/* GL_QCOM_perfmon_global_mode */
++#ifndef GL_QCOM_perfmon_global_mode
++#define GL_QCOM_perfmon_global_mode 1
++#endif
++
++/* GL_QCOM_writeonly_rendering */
++#ifndef GL_QCOM_writeonly_rendering
++#define GL_QCOM_writeonly_rendering 1
++#endif
++
++/* GL_QCOM_tiled_rendering */
++#ifndef GL_QCOM_tiled_rendering
++#define GL_QCOM_tiled_rendering 1
++#ifdef GL_GLEXT_PROTOTYPES
++GL_API void GL_APIENTRY glStartTilingQCOM (GLuint x, GLuint y, GLuint width, GLuint height, GLbitfield preserveMask);
++GL_API void GL_APIENTRY glEndTilingQCOM (GLbitfield preserveMask);
++#endif
++typedef void (GL_APIENTRYP PFNGLSTARTTILINGQCOMPROC) (GLuint x, GLuint y, GLuint width, GLuint height, GLbitfield preserveMask);
++typedef void (GL_APIENTRYP PFNGLENDTILINGQCOMPROC) (GLbitfield preserveMask);
++#endif
++
++#ifdef __cplusplus
++}
++#endif
++
++#endif /* __glext_h_ */
++
+diff -rupN a/usr/include/GLES/gl.h b/usr/include/GLES/gl.h
+--- a/usr/include/GLES/gl.h	1970-01-01 01:00:00.000000000 +0100
++++ b/usr/include/GLES/gl.h	2013-10-12 03:05:04.000000000 +0200
+@@ -0,0 +1,770 @@
++#ifndef __gl_h_
++#define __gl_h_
++
++/* $Revision: 10601 $ on $Date:: 2010-03-04 22:15:27 -0800 #$ */
++
++#include <GLES/glplatform.h>
++
++#ifdef __cplusplus
++extern "C" {
++#endif
++
++/*
++ * This document is licensed under the SGI Free Software B License Version
++ * 2.0. For details, see http://oss.sgi.com/projects/FreeB/ .
++ */
++
++typedef void             GLvoid;
++typedef char             GLchar;
++typedef unsigned int     GLenum;
++typedef unsigned char    GLboolean;
++typedef unsigned int     GLbitfield;
++typedef khronos_int8_t   GLbyte;
++typedef short            GLshort;
++typedef int              GLint;
++typedef int              GLsizei;
++typedef khronos_uint8_t  GLubyte;
++typedef unsigned short   GLushort;
++typedef unsigned int     GLuint;
++typedef khronos_float_t  GLfloat;
++typedef khronos_float_t  GLclampf;
++typedef khronos_int32_t  GLfixed;
++typedef khronos_int32_t  GLclampx;
++
++typedef khronos_intptr_t GLintptr;
++typedef khronos_ssize_t  GLsizeiptr;
++
++
++/*************************************************************/
++
++/* OpenGL ES core versions */
++#define GL_VERSION_ES_CM_1_0          1
++#define GL_VERSION_ES_CL_1_0          1
++#define GL_VERSION_ES_CM_1_1          1
++#define GL_VERSION_ES_CL_1_1          1
++
++/* ClearBufferMask */
++#define GL_DEPTH_BUFFER_BIT               0x00000100
++#define GL_STENCIL_BUFFER_BIT             0x00000400
++#define GL_COLOR_BUFFER_BIT               0x00004000
++
++/* Boolean */
++#define GL_FALSE                          0
++#define GL_TRUE                           1
++
++/* BeginMode */
++#define GL_POINTS                         0x0000
++#define GL_LINES                          0x0001
++#define GL_LINE_LOOP                      0x0002
++#define GL_LINE_STRIP                     0x0003
++#define GL_TRIANGLES                      0x0004
++#define GL_TRIANGLE_STRIP                 0x0005
++#define GL_TRIANGLE_FAN                   0x0006
++
++/* AlphaFunction */
++#define GL_NEVER                          0x0200
++#define GL_LESS                           0x0201
++#define GL_EQUAL                          0x0202
++#define GL_LEQUAL                         0x0203
++#define GL_GREATER                        0x0204
++#define GL_NOTEQUAL                       0x0205
++#define GL_GEQUAL                         0x0206
++#define GL_ALWAYS                         0x0207
++
++/* BlendingFactorDest */
++#define GL_ZERO                           0
++#define GL_ONE                            1
++#define GL_SRC_COLOR                      0x0300
++#define GL_ONE_MINUS_SRC_COLOR            0x0301
++#define GL_SRC_ALPHA                      0x0302
++#define GL_ONE_MINUS_SRC_ALPHA            0x0303
++#define GL_DST_ALPHA                      0x0304
++#define GL_ONE_MINUS_DST_ALPHA            0x0305
++
++/* BlendingFactorSrc */
++/*      GL_ZERO */
++/*      GL_ONE */
++#define GL_DST_COLOR                      0x0306
++#define GL_ONE_MINUS_DST_COLOR            0x0307
++#define GL_SRC_ALPHA_SATURATE             0x0308
++/*      GL_SRC_ALPHA */
++/*      GL_ONE_MINUS_SRC_ALPHA */
++/*      GL_DST_ALPHA */
++/*      GL_ONE_MINUS_DST_ALPHA */
++
++/* ClipPlaneName */
++#define GL_CLIP_PLANE0                    0x3000
++#define GL_CLIP_PLANE1                    0x3001
++#define GL_CLIP_PLANE2                    0x3002
++#define GL_CLIP_PLANE3                    0x3003
++#define GL_CLIP_PLANE4                    0x3004
++#define GL_CLIP_PLANE5                    0x3005
++
++/* ColorMaterialFace */
++/*      GL_FRONT_AND_BACK */
++
++/* ColorMaterialParameter */
++/*      GL_AMBIENT_AND_DIFFUSE */
++
++/* ColorPointerType */
++/*      GL_UNSIGNED_BYTE */
++/*      GL_FLOAT */
++/*      GL_FIXED */
++
++/* CullFaceMode */
++#define GL_FRONT                          0x0404
++#define GL_BACK                           0x0405
++#define GL_FRONT_AND_BACK                 0x0408
++
++/* DepthFunction */
++/*      GL_NEVER */
++/*      GL_LESS */
++/*      GL_EQUAL */
++/*      GL_LEQUAL */
++/*      GL_GREATER */
++/*      GL_NOTEQUAL */
++/*      GL_GEQUAL */
++/*      GL_ALWAYS */
++
++/* EnableCap */
++#define GL_FOG                            0x0B60
++#define GL_LIGHTING                       0x0B50
++#define GL_TEXTURE_2D                     0x0DE1
++#define GL_CULL_FACE                      0x0B44
++#define GL_ALPHA_TEST                     0x0BC0
++#define GL_BLEND                          0x0BE2
++#define GL_COLOR_LOGIC_OP                 0x0BF2
++#define GL_DITHER                         0x0BD0
++#define GL_STENCIL_TEST                   0x0B90
++#define GL_DEPTH_TEST                     0x0B71
++/*      GL_LIGHT0 */
++/*      GL_LIGHT1 */
++/*      GL_LIGHT2 */
++/*      GL_LIGHT3 */
++/*      GL_LIGHT4 */
++/*      GL_LIGHT5 */
++/*      GL_LIGHT6 */
++/*      GL_LIGHT7 */
++#define GL_POINT_SMOOTH                   0x0B10
++#define GL_LINE_SMOOTH                    0x0B20
++#define GL_SCISSOR_TEST                   0x0C11
++#define GL_COLOR_MATERIAL                 0x0B57
++#define GL_NORMALIZE                      0x0BA1
++#define GL_RESCALE_NORMAL                 0x803A
++#define GL_POLYGON_OFFSET_FILL            0x8037
++#define GL_VERTEX_ARRAY                   0x8074
++#define GL_NORMAL_ARRAY                   0x8075
++#define GL_COLOR_ARRAY                    0x8076
++#define GL_TEXTURE_COORD_ARRAY            0x8078
++#define GL_MULTISAMPLE                    0x809D
++#define GL_SAMPLE_ALPHA_TO_COVERAGE       0x809E
++#define GL_SAMPLE_ALPHA_TO_ONE            0x809F
++#define GL_SAMPLE_COVERAGE                0x80A0
++
++/* ErrorCode */
++#define GL_NO_ERROR                       0
++#define GL_INVALID_ENUM                   0x0500
++#define GL_INVALID_VALUE                  0x0501
++#define GL_INVALID_OPERATION              0x0502
++#define GL_STACK_OVERFLOW                 0x0503
++#define GL_STACK_UNDERFLOW                0x0504
++#define GL_OUT_OF_MEMORY                  0x0505
++
++/* FogMode */
++/*      GL_LINEAR */
++#define GL_EXP                            0x0800
++#define GL_EXP2                           0x0801
++
++/* FogParameter */
++#define GL_FOG_DENSITY                    0x0B62
++#define GL_FOG_START                      0x0B63
++#define GL_FOG_END                        0x0B64
++#define GL_FOG_MODE                       0x0B65
++#define GL_FOG_COLOR                      0x0B66
++
++/* FrontFaceDirection */
++#define GL_CW                             0x0900
++#define GL_CCW                            0x0901
++
++/* GetPName */
++#define GL_CURRENT_COLOR                  0x0B00
++#define GL_CURRENT_NORMAL                 0x0B02
++#define GL_CURRENT_TEXTURE_COORDS         0x0B03
++#define GL_POINT_SIZE                     0x0B11
++#define GL_POINT_SIZE_MIN                 0x8126
++#define GL_POINT_SIZE_MAX                 0x8127
++#define GL_POINT_FADE_THRESHOLD_SIZE      0x8128
++#define GL_POINT_DISTANCE_ATTENUATION     0x8129
++#define GL_SMOOTH_POINT_SIZE_RANGE        0x0B12
++#define GL_LINE_WIDTH                     0x0B21
++#define GL_SMOOTH_LINE_WIDTH_RANGE        0x0B22
++#define GL_ALIASED_POINT_SIZE_RANGE       0x846D
++#define GL_ALIASED_LINE_WIDTH_RANGE       0x846E
++#define GL_CULL_FACE_MODE                 0x0B45
++#define GL_FRONT_FACE                     0x0B46
++#define GL_SHADE_MODEL                    0x0B54
++#define GL_DEPTH_RANGE                    0x0B70
++#define GL_DEPTH_WRITEMASK                0x0B72
++#define GL_DEPTH_CLEAR_VALUE              0x0B73
++#define GL_DEPTH_FUNC                     0x0B74
++#define GL_STENCIL_CLEAR_VALUE            0x0B91
++#define GL_STENCIL_FUNC                   0x0B92
++#define GL_STENCIL_VALUE_MASK             0x0B93
++#define GL_STENCIL_FAIL                   0x0B94
++#define GL_STENCIL_PASS_DEPTH_FAIL        0x0B95
++#define GL_STENCIL_PASS_DEPTH_PASS        0x0B96
++#define GL_STENCIL_REF                    0x0B97
++#define GL_STENCIL_WRITEMASK              0x0B98
++#define GL_MATRIX_MODE                    0x0BA0
++#define GL_VIEWPORT                       0x0BA2
++#define GL_MODELVIEW_STACK_DEPTH          0x0BA3
++#define GL_PROJECTION_STACK_DEPTH         0x0BA4
++#define GL_TEXTURE_STACK_DEPTH            0x0BA5
++#define GL_MODELVIEW_MATRIX               0x0BA6
++#define GL_PROJECTION_MATRIX              0x0BA7
++#define GL_TEXTURE_MATRIX                 0x0BA8
++#define GL_ALPHA_TEST_FUNC                0x0BC1
++#define GL_ALPHA_TEST_REF                 0x0BC2
++#define GL_BLEND_DST                      0x0BE0
++#define GL_BLEND_SRC                      0x0BE1
++#define GL_LOGIC_OP_MODE                  0x0BF0
++#define GL_SCISSOR_BOX                    0x0C10
++#define GL_SCISSOR_TEST                   0x0C11
++#define GL_COLOR_CLEAR_VALUE              0x0C22
++#define GL_COLOR_WRITEMASK                0x0C23
++#define GL_UNPACK_ALIGNMENT               0x0CF5
++#define GL_PACK_ALIGNMENT                 0x0D05
++#define GL_MAX_LIGHTS                     0x0D31
++#define GL_MAX_CLIP_PLANES                0x0D32
++#define GL_MAX_TEXTURE_SIZE               0x0D33
++#define GL_MAX_MODELVIEW_STACK_DEPTH      0x0D36
++#define GL_MAX_PROJECTION_STACK_DEPTH     0x0D38
++#define GL_MAX_TEXTURE_STACK_DEPTH        0x0D39
++#define GL_MAX_VIEWPORT_DIMS              0x0D3A
++#define GL_MAX_TEXTURE_UNITS              0x84E2
++#define GL_SUBPIXEL_BITS                  0x0D50
++#define GL_RED_BITS                       0x0D52
++#define GL_GREEN_BITS                     0x0D53
++#define GL_BLUE_BITS                      0x0D54
++#define GL_ALPHA_BITS                     0x0D55
++#define GL_DEPTH_BITS                     0x0D56
++#define GL_STENCIL_BITS                   0x0D57
++#define GL_POLYGON_OFFSET_UNITS           0x2A00
++#define GL_POLYGON_OFFSET_FILL            0x8037
++#define GL_POLYGON_OFFSET_FACTOR          0x8038
++#define GL_TEXTURE_BINDING_2D             0x8069
++#define GL_VERTEX_ARRAY_SIZE              0x807A
++#define GL_VERTEX_ARRAY_TYPE              0x807B
++#define GL_VERTEX_ARRAY_STRIDE            0x807C
++#define GL_NORMAL_ARRAY_TYPE              0x807E
++#define GL_NORMAL_ARRAY_STRIDE            0x807F
++#define GL_COLOR_ARRAY_SIZE               0x8081
++#define GL_COLOR_ARRAY_TYPE               0x8082
++#define GL_COLOR_ARRAY_STRIDE             0x8083
++#define GL_TEXTURE_COORD_ARRAY_SIZE       0x8088
++#define GL_TEXTURE_COORD_ARRAY_TYPE       0x8089
++#define GL_TEXTURE_COORD_ARRAY_STRIDE     0x808A
++#define GL_VERTEX_ARRAY_POINTER           0x808E
++#define GL_NORMAL_ARRAY_POINTER           0x808F
++#define GL_COLOR_ARRAY_POINTER            0x8090
++#define GL_TEXTURE_COORD_ARRAY_POINTER    0x8092
++#define GL_SAMPLE_BUFFERS                 0x80A8
++#define GL_SAMPLES                        0x80A9
++#define GL_SAMPLE_COVERAGE_VALUE          0x80AA
++#define GL_SAMPLE_COVERAGE_INVERT         0x80AB
++
++/* GetTextureParameter */
++/*      GL_TEXTURE_MAG_FILTER */
++/*      GL_TEXTURE_MIN_FILTER */
++/*      GL_TEXTURE_WRAP_S */
++/*      GL_TEXTURE_WRAP_T */
++
++#define GL_NUM_COMPRESSED_TEXTURE_FORMATS 0x86A2
++#define GL_COMPRESSED_TEXTURE_FORMATS     0x86A3
++
++/* HintMode */
++#define GL_DONT_CARE                      0x1100
++#define GL_FASTEST                        0x1101
++#define GL_NICEST                         0x1102
++
++/* HintTarget */
++#define GL_PERSPECTIVE_CORRECTION_HINT    0x0C50
++#define GL_POINT_SMOOTH_HINT              0x0C51
++#define GL_LINE_SMOOTH_HINT               0x0C52
++#define GL_FOG_HINT                       0x0C54
++#define GL_GENERATE_MIPMAP_HINT           0x8192
++
++/* LightModelParameter */
++#define GL_LIGHT_MODEL_AMBIENT            0x0B53
++#define GL_LIGHT_MODEL_TWO_SIDE           0x0B52
++
++/* LightParameter */
++#define GL_AMBIENT                        0x1200
++#define GL_DIFFUSE                        0x1201
++#define GL_SPECULAR                       0x1202
++#define GL_POSITION                       0x1203
++#define GL_SPOT_DIRECTION                 0x1204
++#define GL_SPOT_EXPONENT                  0x1205
++#define GL_SPOT_CUTOFF                    0x1206
++#define GL_CONSTANT_ATTENUATION           0x1207
++#define GL_LINEAR_ATTENUATION             0x1208
++#define GL_QUADRATIC_ATTENUATION          0x1209
++
++/* DataType */
++#define GL_BYTE                           0x1400
++#define GL_UNSIGNED_BYTE                  0x1401
++#define GL_SHORT                          0x1402
++#define GL_UNSIGNED_SHORT                 0x1403
++#define GL_FLOAT                          0x1406
++#define GL_FIXED                          0x140C
++
++/* LogicOp */
++#define GL_CLEAR                          0x1500
++#define GL_AND                            0x1501
++#define GL_AND_REVERSE                    0x1502
++#define GL_COPY                           0x1503
++#define GL_AND_INVERTED                   0x1504
++#define GL_NOOP                           0x1505
++#define GL_XOR                            0x1506
++#define GL_OR                             0x1507
++#define GL_NOR                            0x1508
++#define GL_EQUIV                          0x1509
++#define GL_INVERT                         0x150A
++#define GL_OR_REVERSE                     0x150B
++#define GL_COPY_INVERTED                  0x150C
++#define GL_OR_INVERTED                    0x150D
++#define GL_NAND                           0x150E
++#define GL_SET                            0x150F
++
++/* MaterialFace */
++/*      GL_FRONT_AND_BACK */
++
++/* MaterialParameter */
++#define GL_EMISSION                       0x1600
++#define GL_SHININESS                      0x1601
++#define GL_AMBIENT_AND_DIFFUSE            0x1602
++/*      GL_AMBIENT */
++/*      GL_DIFFUSE */
++/*      GL_SPECULAR */
++
++/* MatrixMode */
++#define GL_MODELVIEW                      0x1700
++#define GL_PROJECTION                     0x1701
++#define GL_TEXTURE                        0x1702
++
++/* NormalPointerType */
++/*      GL_BYTE */
++/*      GL_SHORT */
++/*      GL_FLOAT */
++/*      GL_FIXED */
++
++/* PixelFormat */
++#define GL_ALPHA                          0x1906
++#define GL_RGB                            0x1907
++#define GL_RGBA                           0x1908
++#define GL_LUMINANCE                      0x1909
++#define GL_LUMINANCE_ALPHA                0x190A
++
++/* PixelStoreParameter */
++#define GL_UNPACK_ALIGNMENT               0x0CF5
++#define GL_PACK_ALIGNMENT                 0x0D05
++
++/* PixelType */
++/*      GL_UNSIGNED_BYTE */
++#define GL_UNSIGNED_SHORT_4_4_4_4         0x8033
++#define GL_UNSIGNED_SHORT_5_5_5_1         0x8034
++#define GL_UNSIGNED_SHORT_5_6_5           0x8363
++
++/* ShadingModel */
++#define GL_FLAT                           0x1D00
++#define GL_SMOOTH                         0x1D01
++
++/* StencilFunction */
++/*      GL_NEVER */
++/*      GL_LESS */
++/*      GL_EQUAL */
++/*      GL_LEQUAL */
++/*      GL_GREATER */
++/*      GL_NOTEQUAL */
++/*      GL_GEQUAL */
++/*      GL_ALWAYS */
++
++/* StencilOp */
++/*      GL_ZERO */
++#define GL_KEEP                           0x1E00
++#define GL_REPLACE                        0x1E01
++#define GL_INCR                           0x1E02
++#define GL_DECR                           0x1E03
++/*      GL_INVERT */
++
++/* StringName */
++#define GL_VENDOR                         0x1F00
++#define GL_RENDERER                       0x1F01
++#define GL_VERSION                        0x1F02
++#define GL_EXTENSIONS                     0x1F03
++
++/* TexCoordPointerType */
++/*      GL_SHORT */
++/*      GL_FLOAT */
++/*      GL_FIXED */
++/*      GL_BYTE */
++
++/* TextureEnvMode */
++#define GL_MODULATE                       0x2100
++#define GL_DECAL                          0x2101
++/*      GL_BLEND */
++#define GL_ADD                            0x0104
++/*      GL_REPLACE */
++
++/* TextureEnvParameter */
++#define GL_TEXTURE_ENV_MODE               0x2200
++#define GL_TEXTURE_ENV_COLOR              0x2201
++
++/* TextureEnvTarget */
++#define GL_TEXTURE_ENV                    0x2300
++
++/* TextureMagFilter */
++#define GL_NEAREST                        0x2600
++#define GL_LINEAR                         0x2601
++
++/* TextureMinFilter */
++/*      GL_NEAREST */
++/*      GL_LINEAR */
++#define GL_NEAREST_MIPMAP_NEAREST         0x2700
++#define GL_LINEAR_MIPMAP_NEAREST          0x2701
++#define GL_NEAREST_MIPMAP_LINEAR          0x2702
++#define GL_LINEAR_MIPMAP_LINEAR           0x2703
++
++/* TextureParameterName */
++#define GL_TEXTURE_MAG_FILTER             0x2800
++#define GL_TEXTURE_MIN_FILTER             0x2801
++#define GL_TEXTURE_WRAP_S                 0x2802
++#define GL_TEXTURE_WRAP_T                 0x2803
++#define GL_GENERATE_MIPMAP                0x8191
++
++/* TextureTarget */
++/*      GL_TEXTURE_2D */
++
++/* TextureUnit */
++#define GL_TEXTURE0                       0x84C0
++#define GL_TEXTURE1                       0x84C1
++#define GL_TEXTURE2                       0x84C2
++#define GL_TEXTURE3                       0x84C3
++#define GL_TEXTURE4                       0x84C4
++#define GL_TEXTURE5                       0x84C5
++#define GL_TEXTURE6                       0x84C6
++#define GL_TEXTURE7                       0x84C7
++#define GL_TEXTURE8                       0x84C8
++#define GL_TEXTURE9                       0x84C9
++#define GL_TEXTURE10                      0x84CA
++#define GL_TEXTURE11                      0x84CB
++#define GL_TEXTURE12                      0x84CC
++#define GL_TEXTURE13                      0x84CD
++#define GL_TEXTURE14                      0x84CE
++#define GL_TEXTURE15                      0x84CF
++#define GL_TEXTURE16                      0x84D0
++#define GL_TEXTURE17                      0x84D1
++#define GL_TEXTURE18                      0x84D2
++#define GL_TEXTURE19                      0x84D3
++#define GL_TEXTURE20                      0x84D4
++#define GL_TEXTURE21                      0x84D5
++#define GL_TEXTURE22                      0x84D6
++#define GL_TEXTURE23                      0x84D7
++#define GL_TEXTURE24                      0x84D8
++#define GL_TEXTURE25                      0x84D9
++#define GL_TEXTURE26                      0x84DA
++#define GL_TEXTURE27                      0x84DB
++#define GL_TEXTURE28                      0x84DC
++#define GL_TEXTURE29                      0x84DD
++#define GL_TEXTURE30                      0x84DE
++#define GL_TEXTURE31                      0x84DF
++#define GL_ACTIVE_TEXTURE                 0x84E0
++#define GL_CLIENT_ACTIVE_TEXTURE          0x84E1
++
++/* TextureWrapMode */
++#define GL_REPEAT                         0x2901
++#define GL_CLAMP_TO_EDGE                  0x812F
++
++/* VertexPointerType */
++/*      GL_SHORT */
++/*      GL_FLOAT */
++/*      GL_FIXED */
++/*      GL_BYTE */
++
++/* LightName */
++#define GL_LIGHT0                         0x4000
++#define GL_LIGHT1                         0x4001
++#define GL_LIGHT2                         0x4002
++#define GL_LIGHT3                         0x4003
++#define GL_LIGHT4                         0x4004
++#define GL_LIGHT5                         0x4005
++#define GL_LIGHT6                         0x4006
++#define GL_LIGHT7                         0x4007
++
++/* Buffer Objects */
++#define GL_ARRAY_BUFFER                   0x8892
++#define GL_ELEMENT_ARRAY_BUFFER           0x8893
++
++#define GL_ARRAY_BUFFER_BINDING               0x8894
++#define GL_ELEMENT_ARRAY_BUFFER_BINDING       0x8895
++#define GL_VERTEX_ARRAY_BUFFER_BINDING        0x8896
++#define GL_NORMAL_ARRAY_BUFFER_BINDING        0x8897
++#define GL_COLOR_ARRAY_BUFFER_BINDING         0x8898
++#define GL_TEXTURE_COORD_ARRAY_BUFFER_BINDING 0x889A
++
++#define GL_STATIC_DRAW                    0x88E4
++#define GL_DYNAMIC_DRAW                   0x88E8
++
++#define GL_BUFFER_SIZE                    0x8764
++#define GL_BUFFER_USAGE                   0x8765
++
++/* Texture combine + dot3 */
++#define GL_SUBTRACT                       0x84E7
++#define GL_COMBINE                        0x8570
++#define GL_COMBINE_RGB                    0x8571
++#define GL_COMBINE_ALPHA                  0x8572
++#define GL_RGB_SCALE                      0x8573
++#define GL_ADD_SIGNED                     0x8574
++#define GL_INTERPOLATE                    0x8575
++#define GL_CONSTANT                       0x8576
++#define GL_PRIMARY_COLOR                  0x8577
++#define GL_PREVIOUS                       0x8578
++#define GL_OPERAND0_RGB                   0x8590
++#define GL_OPERAND1_RGB                   0x8591
++#define GL_OPERAND2_RGB                   0x8592
++#define GL_OPERAND0_ALPHA                 0x8598
++#define GL_OPERAND1_ALPHA                 0x8599
++#define GL_OPERAND2_ALPHA                 0x859A
++
++#define GL_ALPHA_SCALE                    0x0D1C
++
++#define GL_SRC0_RGB                       0x8580
++#define GL_SRC1_RGB                       0x8581
++#define GL_SRC2_RGB                       0x8582
++#define GL_SRC0_ALPHA                     0x8588
++#define GL_SRC1_ALPHA                     0x8589
++#define GL_SRC2_ALPHA                     0x858A
++
++#define GL_DOT3_RGB                       0x86AE
++#define GL_DOT3_RGBA                      0x86AF
++
++/*------------------------------------------------------------------------*
++ * required OES extension tokens
++ *------------------------------------------------------------------------*/
++
++/* OES_read_format */
++#ifndef GL_OES_read_format
++#define GL_IMPLEMENTATION_COLOR_READ_TYPE_OES                   0x8B9A
++#define GL_IMPLEMENTATION_COLOR_READ_FORMAT_OES                 0x8B9B
++#endif
++
++/* GL_OES_compressed_paletted_texture */
++#ifndef GL_OES_compressed_paletted_texture
++#define GL_PALETTE4_RGB8_OES                                    0x8B90
++#define GL_PALETTE4_RGBA8_OES                                   0x8B91
++#define GL_PALETTE4_R5_G6_B5_OES                                0x8B92
++#define GL_PALETTE4_RGBA4_OES                                   0x8B93
++#define GL_PALETTE4_RGB5_A1_OES                                 0x8B94
++#define GL_PALETTE8_RGB8_OES                                    0x8B95
++#define GL_PALETTE8_RGBA8_OES                                   0x8B96
++#define GL_PALETTE8_R5_G6_B5_OES                                0x8B97
++#define GL_PALETTE8_RGBA4_OES                                   0x8B98
++#define GL_PALETTE8_RGB5_A1_OES                                 0x8B99
++#endif
++
++/* OES_point_size_array */
++#ifndef GL_OES_point_size_array
++#define GL_POINT_SIZE_ARRAY_OES                                 0x8B9C
++#define GL_POINT_SIZE_ARRAY_TYPE_OES                            0x898A
++#define GL_POINT_SIZE_ARRAY_STRIDE_OES                          0x898B
++#define GL_POINT_SIZE_ARRAY_POINTER_OES                         0x898C
++#define GL_POINT_SIZE_ARRAY_BUFFER_BINDING_OES                  0x8B9F
++#endif
++
++/* GL_OES_point_sprite */
++#ifndef GL_OES_point_sprite
++#define GL_POINT_SPRITE_OES                                     0x8861
++#define GL_COORD_REPLACE_OES                                    0x8862
++#endif
++
++/*************************************************************/
++
++/* Available only in Common profile */
++GL_API void GL_APIENTRY glAlphaFunc (GLenum func, GLclampf ref);
++GL_API void GL_APIENTRY glClearColor (GLclampf red, GLclampf green, GLclampf blue, GLclampf alpha);
++GL_API void GL_APIENTRY glClearDepthf (GLclampf depth);
++GL_API void GL_APIENTRY glClipPlanef (GLenum plane, const GLfloat *equation);
++GL_API void GL_APIENTRY glColor4f (GLfloat red, GLfloat green, GLfloat blue, GLfloat alpha);
++GL_API void GL_APIENTRY glDepthRangef (GLclampf zNear, GLclampf zFar);
++GL_API void GL_APIENTRY glFogf (GLenum pname, GLfloat param);
++GL_API void GL_APIENTRY glFogfv (GLenum pname, const GLfloat *params);
++GL_API void GL_APIENTRY glFrustumf (GLfloat left, GLfloat right, GLfloat bottom, GLfloat top, GLfloat zNear, GLfloat zFar);
++GL_API void GL_APIENTRY glGetClipPlanef (GLenum pname, GLfloat eqn[4]);
++GL_API void GL_APIENTRY glGetFloatv (GLenum pname, GLfloat *params);
++GL_API void GL_APIENTRY glGetLightfv (GLenum light, GLenum pname, GLfloat *params);
++GL_API void GL_APIENTRY glGetMaterialfv (GLenum face, GLenum pname, GLfloat *params);
++GL_API void GL_APIENTRY glGetTexEnvfv (GLenum env, GLenum pname, GLfloat *params);
++GL_API void GL_APIENTRY glGetTexParameterfv (GLenum target, GLenum pname, GLfloat *params);
++GL_API void GL_APIENTRY glLightModelf (GLenum pname, GLfloat param);
++GL_API void GL_APIENTRY glLightModelfv (GLenum pname, const GLfloat *params);
++GL_API void GL_APIENTRY glLightf (GLenum light, GLenum pname, GLfloat param);
++GL_API void GL_APIENTRY glLightfv (GLenum light, GLenum pname, const GLfloat *params);
++GL_API void GL_APIENTRY glLineWidth (GLfloat width);
++GL_API void GL_APIENTRY glLoadMatrixf (const GLfloat *m);
++GL_API void GL_APIENTRY glMaterialf (GLenum face, GLenum pname, GLfloat param);
++GL_API void GL_APIENTRY glMaterialfv (GLenum face, GLenum pname, const GLfloat *params);
++GL_API void GL_APIENTRY glMultMatrixf (const GLfloat *m);
++GL_API void GL_APIENTRY glMultiTexCoord4f (GLenum target, GLfloat s, GLfloat t, GLfloat r, GLfloat q);
++GL_API void GL_APIENTRY glNormal3f (GLfloat nx, GLfloat ny, GLfloat nz);
++GL_API void GL_APIENTRY glOrthof (GLfloat left, GLfloat right, GLfloat bottom, GLfloat top, GLfloat zNear, GLfloat zFar);
++GL_API void GL_APIENTRY glPointParameterf (GLenum pname, GLfloat param);
++GL_API void GL_APIENTRY glPointParameterfv (GLenum pname, const GLfloat *params);
++GL_API void GL_APIENTRY glPointSize (GLfloat size);
++GL_API void GL_APIENTRY glPolygonOffset (GLfloat factor, GLfloat units);
++GL_API void GL_APIENTRY glRotatef (GLfloat angle, GLfloat x, GLfloat y, GLfloat z);
++GL_API void GL_APIENTRY glScalef (GLfloat x, GLfloat y, GLfloat z);
++GL_API void GL_APIENTRY glTexEnvf (GLenum target, GLenum pname, GLfloat param);
++GL_API void GL_APIENTRY glTexEnvfv (GLenum target, GLenum pname, const GLfloat *params);
++GL_API void GL_APIENTRY glTexParameterf (GLenum target, GLenum pname, GLfloat param);
++GL_API void GL_APIENTRY glTexParameterfv (GLenum target, GLenum pname, const GLfloat *params);
++GL_API void GL_APIENTRY glTranslatef (GLfloat x, GLfloat y, GLfloat z);
++
++/* Available in both Common and Common-Lite profiles */
++GL_API void GL_APIENTRY glActiveTexture (GLenum texture);
++GL_API void GL_APIENTRY glAlphaFuncx (GLenum func, GLclampx ref);
++GL_API void GL_APIENTRY glBindBuffer (GLenum target, GLuint buffer);
++GL_API void GL_APIENTRY glBindTexture (GLenum target, GLuint texture);
++GL_API void GL_APIENTRY glBlendFunc (GLenum sfactor, GLenum dfactor);
++GL_API void GL_APIENTRY glBufferData (GLenum target, GLsizeiptr size, const GLvoid *data, GLenum usage);
++GL_API void GL_APIENTRY glBufferSubData (GLenum target, GLintptr offset, GLsizeiptr size, const GLvoid *data);
++GL_API void GL_APIENTRY glClear (GLbitfield mask);
++GL_API void GL_APIENTRY glClearColorx (GLclampx red, GLclampx green, GLclampx blue, GLclampx alpha);
++GL_API void GL_APIENTRY glClearDepthx (GLclampx depth);
++GL_API void GL_APIENTRY glClearStencil (GLint s);
++GL_API void GL_APIENTRY glClientActiveTexture (GLenum texture);
++GL_API void GL_APIENTRY glClipPlanex (GLenum plane, const GLfixed *equation);
++GL_API void GL_APIENTRY glColor4ub (GLubyte red, GLubyte green, GLubyte blue, GLubyte alpha);
++GL_API void GL_APIENTRY glColor4x (GLfixed red, GLfixed green, GLfixed blue, GLfixed alpha);
++GL_API void GL_APIENTRY glColorMask (GLboolean red, GLboolean green, GLboolean blue, GLboolean alpha);
++GL_API void GL_APIENTRY glColorPointer (GLint size, GLenum type, GLsizei stride, const GLvoid *pointer);
++GL_API void GL_APIENTRY glCompressedTexImage2D (GLenum target, GLint level, GLenum internalformat, GLsizei width, GLsizei height, GLint border, GLsizei imageSize, const GLvoid *data);
++GL_API void GL_APIENTRY glCompressedTexSubImage2D (GLenum target, GLint level, GLint xoffset, GLint yoffset, GLsizei width, GLsizei height, GLenum format, GLsizei imageSize, const GLvoid *data);
++GL_API void GL_APIENTRY glCopyTexImage2D (GLenum target, GLint level, GLenum internalformat, GLint x, GLint y, GLsizei width, GLsizei height, GLint border);
++GL_API void GL_APIENTRY glCopyTexSubImage2D (GLenum target, GLint level, GLint xoffset, GLint yoffset, GLint x, GLint y, GLsizei width, GLsizei height);
++GL_API void GL_APIENTRY glCullFace (GLenum mode);
++GL_API void GL_APIENTRY glDeleteBuffers (GLsizei n, const GLuint *buffers);
++GL_API void GL_APIENTRY glDeleteTextures (GLsizei n, const GLuint *textures);
++GL_API void GL_APIENTRY glDepthFunc (GLenum func);
++GL_API void GL_APIENTRY glDepthMask (GLboolean flag);
++GL_API void GL_APIENTRY glDepthRangex (GLclampx zNear, GLclampx zFar);
++GL_API void GL_APIENTRY glDisable (GLenum cap);
++GL_API void GL_APIENTRY glDisableClientState (GLenum array);
++GL_API void GL_APIENTRY glDrawArrays (GLenum mode, GLint first, GLsizei count);
++GL_API void GL_APIENTRY glDrawElements (GLenum mode, GLsizei count, GLenum type, const GLvoid *indices);
++GL_API void GL_APIENTRY glEnable (GLenum cap);
++GL_API void GL_APIENTRY glEnableClientState (GLenum array);
++GL_API void GL_APIENTRY glFinish (void);
++GL_API void GL_APIENTRY glFlush (void);
++GL_API void GL_APIENTRY glFogx (GLenum pname, GLfixed param);
++GL_API void GL_APIENTRY glFogxv (GLenum pname, const GLfixed *params);
++GL_API void GL_APIENTRY glFrontFace (GLenum mode);
++GL_API void GL_APIENTRY glFrustumx (GLfixed left, GLfixed right, GLfixed bottom, GLfixed top, GLfixed zNear, GLfixed zFar);
++GL_API void GL_APIENTRY glGetBooleanv (GLenum pname, GLboolean *params);
++GL_API void GL_APIENTRY glGetBufferParameteriv (GLenum target, GLenum pname, GLint *params);
++GL_API void GL_APIENTRY glGetClipPlanex (GLenum pname, GLfixed eqn[4]);
++GL_API void GL_APIENTRY glGenBuffers (GLsizei n, GLuint *buffers);
++GL_API void GL_APIENTRY glGenTextures (GLsizei n, GLuint *textures);
++GL_API GLenum GL_APIENTRY glGetError (void);
++GL_API void GL_APIENTRY glGetFixedv (GLenum pname, GLfixed *params);
++GL_API void GL_APIENTRY glGetIntegerv (GLenum pname, GLint *params);
++GL_API void GL_APIENTRY glGetLightxv (GLenum light, GLenum pname, GLfixed *params);
++GL_API void GL_APIENTRY glGetMaterialxv (GLenum face, GLenum pname, GLfixed *params);
++GL_API void GL_APIENTRY glGetPointerv (GLenum pname, GLvoid **params);
++GL_API const GLubyte * GL_APIENTRY glGetString (GLenum name);
++GL_API void GL_APIENTRY glGetTexEnviv (GLenum env, GLenum pname, GLint *params);
++GL_API void GL_APIENTRY glGetTexEnvxv (GLenum env, GLenum pname, GLfixed *params);
++GL_API void GL_APIENTRY glGetTexParameteriv (GLenum target, GLenum pname, GLint *params);
++GL_API void GL_APIENTRY glGetTexParameterxv (GLenum target, GLenum pname, GLfixed *params);
++GL_API void GL_APIENTRY glHint (GLenum target, GLenum mode);
++GL_API GLboolean GL_APIENTRY glIsBuffer (GLuint buffer);
++GL_API GLboolean GL_APIENTRY glIsEnabled (GLenum cap);
++GL_API GLboolean GL_APIENTRY glIsTexture (GLuint texture);
++GL_API void GL_APIENTRY glLightModelx (GLenum pname, GLfixed param);
++GL_API void GL_APIENTRY glLightModelxv (GLenum pname, const GLfixed *params);
++GL_API void GL_APIENTRY glLightx (GLenum light, GLenum pname, GLfixed param);
++GL_API void GL_APIENTRY glLightxv (GLenum light, GLenum pname, const GLfixed *params);
++GL_API void GL_APIENTRY glLineWidthx (GLfixed width);
++GL_API void GL_APIENTRY glLoadIdentity (void);
++GL_API void GL_APIENTRY glLoadMatrixx (const GLfixed *m);
++GL_API void GL_APIENTRY glLogicOp (GLenum opcode);
++GL_API void GL_APIENTRY glMaterialx (GLenum face, GLenum pname, GLfixed param);
++GL_API void GL_APIENTRY glMaterialxv (GLenum face, GLenum pname, const GLfixed *params);
++GL_API void GL_APIENTRY glMatrixMode (GLenum mode);
++GL_API void GL_APIENTRY glMultMatrixx (const GLfixed *m);
++GL_API void GL_APIENTRY glMultiTexCoord4x (GLenum target, GLfixed s, GLfixed t, GLfixed r, GLfixed q);
++GL_API void GL_APIENTRY glNormal3x (GLfixed nx, GLfixed ny, GLfixed nz);
++GL_API void GL_APIENTRY glNormalPointer (GLenum type, GLsizei stride, const GLvoid *pointer);
++GL_API void GL_APIENTRY glOrthox (GLfixed left, GLfixed right, GLfixed bottom, GLfixed top, GLfixed zNear, GLfixed zFar);
++GL_API void GL_APIENTRY glPixelStorei (GLenum pname, GLint param);
++GL_API void GL_APIENTRY glPointParameterx (GLenum pname, GLfixed param);
++GL_API void GL_APIENTRY glPointParameterxv (GLenum pname, const GLfixed *params);
++GL_API void GL_APIENTRY glPointSizex (GLfixed size);
++GL_API void GL_APIENTRY glPolygonOffsetx (GLfixed factor, GLfixed units);
++GL_API void GL_APIENTRY glPopMatrix (void);
++GL_API void GL_APIENTRY glPushMatrix (void);
++GL_API void GL_APIENTRY glReadPixels (GLint x, GLint y, GLsizei width, GLsizei height, GLenum format, GLenum type, GLvoid *pixels);
++GL_API void GL_APIENTRY glRotatex (GLfixed angle, GLfixed x, GLfixed y, GLfixed z);
++GL_API void GL_APIENTRY glSampleCoverage (GLclampf value, GLboolean invert);
++GL_API void GL_APIENTRY glSampleCoveragex (GLclampx value, GLboolean invert);
++GL_API void GL_APIENTRY glScalex (GLfixed x, GLfixed y, GLfixed z);
++GL_API void GL_APIENTRY glScissor (GLint x, GLint y, GLsizei width, GLsizei height);
++GL_API void GL_APIENTRY glShadeModel (GLenum mode);
++GL_API void GL_APIENTRY glStencilFunc (GLenum func, GLint ref, GLuint mask);
++GL_API void GL_APIENTRY glStencilMask (GLuint mask);
++GL_API void GL_APIENTRY glStencilOp (GLenum fail, GLenum zfail, GLenum zpass);
++GL_API void GL_APIENTRY glTexCoordPointer (GLint size, GLenum type, GLsizei stride, const GLvoid *pointer);
++GL_API void GL_APIENTRY glTexEnvi (GLenum target, GLenum pname, GLint param);
++GL_API void GL_APIENTRY glTexEnvx (GLenum target, GLenum pname, GLfixed param);
++GL_API void GL_APIENTRY glTexEnviv (GLenum target, GLenum pname, const GLint *params);
++GL_API void GL_APIENTRY glTexEnvxv (GLenum target, GLenum pname, const GLfixed *params);
++GL_API void GL_APIENTRY glTexImage2D (GLenum target, GLint level, GLint internalformat, GLsizei width, GLsizei height, GLint border, GLenum format, GLenum type, const GLvoid *pixels);
++GL_API void GL_APIENTRY glTexParameteri (GLenum target, GLenum pname, GLint param);
++GL_API void GL_APIENTRY glTexParameterx (GLenum target, GLenum pname, GLfixed param);
++GL_API void GL_APIENTRY glTexParameteriv (GLenum target, GLenum pname, const GLint *params);
++GL_API void GL_APIENTRY glTexParameterxv (GLenum target, GLenum pname, const GLfixed *params);
++GL_API void GL_APIENTRY glTexSubImage2D (GLenum target, GLint level, GLint xoffset, GLint yoffset, GLsizei width, GLsizei height, GLenum format, GLenum type, const GLvoid *pixels);
++GL_API void GL_APIENTRY glTranslatex (GLfixed x, GLfixed y, GLfixed z);
++GL_API void GL_APIENTRY glVertexPointer (GLint size, GLenum type, GLsizei stride, const GLvoid *pointer);
++GL_API void GL_APIENTRY glViewport (GLint x, GLint y, GLsizei width, GLsizei height);
++
++/*------------------------------------------------------------------------*
++ * Required OES extension functions
++ *------------------------------------------------------------------------*/
++
++/* GL_OES_read_format */
++#ifndef GL_OES_read_format
++#define GL_OES_read_format 1
++#endif
++
++/* GL_OES_compressed_paletted_texture */
++#ifndef GL_OES_compressed_paletted_texture
++#define GL_OES_compressed_paletted_texture 1
++#endif
++
++/* GL_OES_point_size_array */
++#ifndef GL_OES_point_size_array
++#define GL_OES_point_size_array 1
++GL_API void GL_APIENTRY glPointSizePointerOES (GLenum type, GLsizei stride, const GLvoid *pointer);
++#endif
++
++/* GL_OES_point_sprite */
++#ifndef GL_OES_point_sprite
++#define GL_OES_point_sprite 1
++#endif
++
++#ifdef __cplusplus
++}
++#endif
++
++#endif /* __gl_h_ */
++
+diff -rupN a/usr/include/GLES/glplatform.h b/usr/include/GLES/glplatform.h
+--- a/usr/include/GLES/glplatform.h	1970-01-01 01:00:00.000000000 +0100
++++ b/usr/include/GLES/glplatform.h	2013-10-12 03:05:04.000000000 +0200
+@@ -0,0 +1,30 @@
++#ifndef __glplatform_h_
++#define __glplatform_h_
++
++/* $Revision: 10601 $ on $Date:: 2010-03-04 22:15:27 -0800 #$ */
++
++/*
++ * This document is licensed under the SGI Free Software B License Version
++ * 2.0. For details, see http://oss.sgi.com/projects/FreeB/ .
++ */
++
++/* Platform-specific types and definitions for OpenGL ES 1.X  gl.h
++ *
++ * Adopters may modify khrplatform.h and this file to suit their platform.
++ * You are encouraged to submit all modifications to the Khronos group so that
++ * they can be included in future versions of this file.  Please submit changes
++ * by sending them to the public Khronos Bugzilla (http://khronos.org/bugzilla)
++ * by filing a bug against product "OpenGL-ES" component "Registry".
++ */
++
++#include <KHR/khrplatform.h>
++
++#ifndef GL_API
++#define GL_API      KHRONOS_APICALL
++#endif
++
++#ifndef GL_APIENTRY
++#define GL_APIENTRY KHRONOS_APIENTRY
++#endif
++
++#endif /* __glplatform_h_ */
+diff -rupN a/usr/include/GLES2/gl2ext.h b/usr/include/GLES2/gl2ext.h
+--- a/usr/include/GLES2/gl2ext.h	1970-01-01 01:00:00.000000000 +0100
++++ b/usr/include/GLES2/gl2ext.h	2013-10-12 03:05:04.000000000 +0200
+@@ -0,0 +1,1494 @@
++#ifndef __gl2ext_h_
++#define __gl2ext_h_ 1
++
++#ifdef __cplusplus
++extern "C" {
++#endif
++
++/*
++** Copyright (c) 2013 The Khronos Group Inc.
++**
++** Permission is hereby granted, free of charge, to any person obtaining a
++** copy of this software and/or associated documentation files (the
++** "Materials"), to deal in the Materials without restriction, including
++** without limitation the rights to use, copy, modify, merge, publish,
++** distribute, sublicense, and/or sell copies of the Materials, and to
++** permit persons to whom the Materials are furnished to do so, subject to
++** the following conditions:
++**
++** The above copyright notice and this permission notice shall be included
++** in all copies or substantial portions of the Materials.
++**
++** THE MATERIALS ARE PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
++** EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
++** MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
++** IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
++** CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
++** TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
++** MATERIALS OR THE USE OR OTHER DEALINGS IN THE MATERIALS.
++*/
++/*
++** This header is generated from the Khronos OpenGL / OpenGL ES XML
++** API Registry. The current version of the Registry, generator scripts
++** used to make the header, and the header can be found at
++**   http://www.opengl.org/registry/
++**
++** Khronos $Revision: 23422 $ on $Date: 2013-10-08 15:40:45 -0700 (Tue, 08 Oct 2013) $
++*/
++
++#ifndef GL_APIENTRYP
++#define GL_APIENTRYP GL_APIENTRY*
++#endif
++
++/* Generated C header for:
++ * API: gles2
++ * Profile: common
++ * Versions considered: 2\.[0-9]
++ * Versions emitted: _nomatch_^
++ * Default extensions included: gles2
++ * Additional extensions included: _nomatch_^
++ * Extensions removed: _nomatch_^
++ */
++
++#ifndef GL_KHR_debug
++#define GL_KHR_debug 1
++typedef void (GL_APIENTRY  *GLDEBUGPROCKHR)(GLenum source,GLenum type,GLuint id,GLenum severity,GLsizei length,const GLchar *message,const void *userParam);
++#define GL_SAMPLER                        0x82E6
++#define GL_DEBUG_OUTPUT_SYNCHRONOUS_KHR   0x8242
++#define GL_DEBUG_NEXT_LOGGED_MESSAGE_LENGTH_KHR 0x8243
++#define GL_DEBUG_CALLBACK_FUNCTION_KHR    0x8244
++#define GL_DEBUG_CALLBACK_USER_PARAM_KHR  0x8245
++#define GL_DEBUG_SOURCE_API_KHR           0x8246
++#define GL_DEBUG_SOURCE_WINDOW_SYSTEM_KHR 0x8247
++#define GL_DEBUG_SOURCE_SHADER_COMPILER_KHR 0x8248
++#define GL_DEBUG_SOURCE_THIRD_PARTY_KHR   0x8249
++#define GL_DEBUG_SOURCE_APPLICATION_KHR   0x824A
++#define GL_DEBUG_SOURCE_OTHER_KHR         0x824B
++#define GL_DEBUG_TYPE_ERROR_KHR           0x824C
++#define GL_DEBUG_TYPE_DEPRECATED_BEHAVIOR_KHR 0x824D
++#define GL_DEBUG_TYPE_UNDEFINED_BEHAVIOR_KHR 0x824E
++#define GL_DEBUG_TYPE_PORTABILITY_KHR     0x824F
++#define GL_DEBUG_TYPE_PERFORMANCE_KHR     0x8250
++#define GL_DEBUG_TYPE_OTHER_KHR           0x8251
++#define GL_DEBUG_TYPE_MARKER_KHR          0x8268
++#define GL_DEBUG_TYPE_PUSH_GROUP_KHR      0x8269
++#define GL_DEBUG_TYPE_POP_GROUP_KHR       0x826A
++#define GL_DEBUG_SEVERITY_NOTIFICATION_KHR 0x826B
++#define GL_MAX_DEBUG_GROUP_STACK_DEPTH_KHR 0x826C
++#define GL_DEBUG_GROUP_STACK_DEPTH_KHR    0x826D
++#define GL_BUFFER_KHR                     0x82E0
++#define GL_SHADER_KHR                     0x82E1
++#define GL_PROGRAM_KHR                    0x82E2
++#define GL_VERTEX_ARRAY_KHR               0x8074
++#define GL_QUERY_KHR                      0x82E3
++#define GL_SAMPLER_KHR                    0x82E6
++#define GL_MAX_LABEL_LENGTH_KHR           0x82E8
++#define GL_MAX_DEBUG_MESSAGE_LENGTH_KHR   0x9143
++#define GL_MAX_DEBUG_LOGGED_MESSAGES_KHR  0x9144
++#define GL_DEBUG_LOGGED_MESSAGES_KHR      0x9145
++#define GL_DEBUG_SEVERITY_HIGH_KHR        0x9146
++#define GL_DEBUG_SEVERITY_MEDIUM_KHR      0x9147
++#define GL_DEBUG_SEVERITY_LOW_KHR         0x9148
++#define GL_DEBUG_OUTPUT_KHR               0x92E0
++#define GL_CONTEXT_FLAG_DEBUG_BIT_KHR     0x00000002
++#define GL_STACK_OVERFLOW_KHR             0x0503
++#define GL_STACK_UNDERFLOW_KHR            0x0504
++typedef void (GL_APIENTRYP PFNGLDEBUGMESSAGECONTROLKHRPROC) (GLenum source, GLenum type, GLenum severity, GLsizei count, const GLuint *ids, GLboolean enabled);
++typedef void (GL_APIENTRYP PFNGLDEBUGMESSAGEINSERTKHRPROC) (GLenum source, GLenum type, GLuint id, GLenum severity, GLsizei length, const GLchar *buf);
++typedef void (GL_APIENTRYP PFNGLDEBUGMESSAGECALLBACKKHRPROC) (GLDEBUGPROCKHR callback, const void *userParam);
++typedef GLuint (GL_APIENTRYP PFNGLGETDEBUGMESSAGELOGKHRPROC) (GLuint count, GLsizei bufSize, GLenum *sources, GLenum *types, GLuint *ids, GLenum *severities, GLsizei *lengths, GLchar *messageLog);
++typedef void (GL_APIENTRYP PFNGLPUSHDEBUGGROUPKHRPROC) (GLenum source, GLuint id, GLsizei length, const GLchar *message);
++typedef void (GL_APIENTRYP PFNGLPOPDEBUGGROUPKHRPROC) (void);
++typedef void (GL_APIENTRYP PFNGLOBJECTLABELKHRPROC) (GLenum identifier, GLuint name, GLsizei length, const GLchar *label);
++typedef void (GL_APIENTRYP PFNGLGETOBJECTLABELKHRPROC) (GLenum identifier, GLuint name, GLsizei bufSize, GLsizei *length, GLchar *label);
++typedef void (GL_APIENTRYP PFNGLOBJECTPTRLABELKHRPROC) (const void *ptr, GLsizei length, const GLchar *label);
++typedef void (GL_APIENTRYP PFNGLGETOBJECTPTRLABELKHRPROC) (const void *ptr, GLsizei bufSize, GLsizei *length, GLchar *label);
++typedef void (GL_APIENTRYP PFNGLGETPOINTERVKHRPROC) (GLenum pname, void **params);
++#ifdef GL_GLEXT_PROTOTYPES
++GL_APICALL void GL_APIENTRY glDebugMessageControlKHR (GLenum source, GLenum type, GLenum severity, GLsizei count, const GLuint *ids, GLboolean enabled);
++GL_APICALL void GL_APIENTRY glDebugMessageInsertKHR (GLenum source, GLenum type, GLuint id, GLenum severity, GLsizei length, const GLchar *buf);
++GL_APICALL void GL_APIENTRY glDebugMessageCallbackKHR (GLDEBUGPROCKHR callback, const void *userParam);
++GL_APICALL GLuint GL_APIENTRY glGetDebugMessageLogKHR (GLuint count, GLsizei bufSize, GLenum *sources, GLenum *types, GLuint *ids, GLenum *severities, GLsizei *lengths, GLchar *messageLog);
++GL_APICALL void GL_APIENTRY glPushDebugGroupKHR (GLenum source, GLuint id, GLsizei length, const GLchar *message);
++GL_APICALL void GL_APIENTRY glPopDebugGroupKHR (void);
++GL_APICALL void GL_APIENTRY glObjectLabelKHR (GLenum identifier, GLuint name, GLsizei length, const GLchar *label);
++GL_APICALL void GL_APIENTRY glGetObjectLabelKHR (GLenum identifier, GLuint name, GLsizei bufSize, GLsizei *length, GLchar *label);
++GL_APICALL void GL_APIENTRY glObjectPtrLabelKHR (const void *ptr, GLsizei length, const GLchar *label);
++GL_APICALL void GL_APIENTRY glGetObjectPtrLabelKHR (const void *ptr, GLsizei bufSize, GLsizei *length, GLchar *label);
++GL_APICALL void GL_APIENTRY glGetPointervKHR (GLenum pname, void **params);
++#endif
++#endif /* GL_KHR_debug */
++
++#ifndef GL_KHR_texture_compression_astc_hdr
++#define GL_KHR_texture_compression_astc_hdr 1
++#define GL_COMPRESSED_RGBA_ASTC_4x4_KHR   0x93B0
++#define GL_COMPRESSED_RGBA_ASTC_5x4_KHR   0x93B1
++#define GL_COMPRESSED_RGBA_ASTC_5x5_KHR   0x93B2
++#define GL_COMPRESSED_RGBA_ASTC_6x5_KHR   0x93B3
++#define GL_COMPRESSED_RGBA_ASTC_6x6_KHR   0x93B4
++#define GL_COMPRESSED_RGBA_ASTC_8x5_KHR   0x93B5
++#define GL_COMPRESSED_RGBA_ASTC_8x6_KHR   0x93B6
++#define GL_COMPRESSED_RGBA_ASTC_8x8_KHR   0x93B7
++#define GL_COMPRESSED_RGBA_ASTC_10x5_KHR  0x93B8
++#define GL_COMPRESSED_RGBA_ASTC_10x6_KHR  0x93B9
++#define GL_COMPRESSED_RGBA_ASTC_10x8_KHR  0x93BA
++#define GL_COMPRESSED_RGBA_ASTC_10x10_KHR 0x93BB
++#define GL_COMPRESSED_RGBA_ASTC_12x10_KHR 0x93BC
++#define GL_COMPRESSED_RGBA_ASTC_12x12_KHR 0x93BD
++#define GL_COMPRESSED_SRGB8_ALPHA8_ASTC_4x4_KHR 0x93D0
++#define GL_COMPRESSED_SRGB8_ALPHA8_ASTC_5x4_KHR 0x93D1
++#define GL_COMPRESSED_SRGB8_ALPHA8_ASTC_5x5_KHR 0x93D2
++#define GL_COMPRESSED_SRGB8_ALPHA8_ASTC_6x5_KHR 0x93D3
++#define GL_COMPRESSED_SRGB8_ALPHA8_ASTC_6x6_KHR 0x93D4
++#define GL_COMPRESSED_SRGB8_ALPHA8_ASTC_8x5_KHR 0x93D5
++#define GL_COMPRESSED_SRGB8_ALPHA8_ASTC_8x6_KHR 0x93D6
++#define GL_COMPRESSED_SRGB8_ALPHA8_ASTC_8x8_KHR 0x93D7
++#define GL_COMPRESSED_SRGB8_ALPHA8_ASTC_10x5_KHR 0x93D8
++#define GL_COMPRESSED_SRGB8_ALPHA8_ASTC_10x6_KHR 0x93D9
++#define GL_COMPRESSED_SRGB8_ALPHA8_ASTC_10x8_KHR 0x93DA
++#define GL_COMPRESSED_SRGB8_ALPHA8_ASTC_10x10_KHR 0x93DB
++#define GL_COMPRESSED_SRGB8_ALPHA8_ASTC_12x10_KHR 0x93DC
++#define GL_COMPRESSED_SRGB8_ALPHA8_ASTC_12x12_KHR 0x93DD
++#endif /* GL_KHR_texture_compression_astc_hdr */
++
++#ifndef GL_KHR_texture_compression_astc_ldr
++#define GL_KHR_texture_compression_astc_ldr 1
++#endif /* GL_KHR_texture_compression_astc_ldr */
++
++#ifndef GL_OES_EGL_image
++#define GL_OES_EGL_image 1
++typedef void *GLeglImageOES;
++typedef void (GL_APIENTRYP PFNGLEGLIMAGETARGETTEXTURE2DOESPROC) (GLenum target, GLeglImageOES image);
++typedef void (GL_APIENTRYP PFNGLEGLIMAGETARGETRENDERBUFFERSTORAGEOESPROC) (GLenum target, GLeglImageOES image);
++#ifdef GL_GLEXT_PROTOTYPES
++GL_APICALL void GL_APIENTRY glEGLImageTargetTexture2DOES (GLenum target, GLeglImageOES image);
++GL_APICALL void GL_APIENTRY glEGLImageTargetRenderbufferStorageOES (GLenum target, GLeglImageOES image);
++#endif
++#endif /* GL_OES_EGL_image */
++
++#ifndef GL_OES_EGL_image_external
++#define GL_OES_EGL_image_external 1
++#define GL_TEXTURE_EXTERNAL_OES           0x8D65
++#define GL_TEXTURE_BINDING_EXTERNAL_OES   0x8D67
++#define GL_REQUIRED_TEXTURE_IMAGE_UNITS_OES 0x8D68
++#define GL_SAMPLER_EXTERNAL_OES           0x8D66
++#endif /* GL_OES_EGL_image_external */
++
++#ifndef GL_OES_compressed_ETC1_RGB8_texture
++#define GL_OES_compressed_ETC1_RGB8_texture 1
++#define GL_ETC1_RGB8_OES                  0x8D64
++#endif /* GL_OES_compressed_ETC1_RGB8_texture */
++
++#ifndef GL_OES_compressed_paletted_texture
++#define GL_OES_compressed_paletted_texture 1
++#define GL_PALETTE4_RGB8_OES              0x8B90
++#define GL_PALETTE4_RGBA8_OES             0x8B91
++#define GL_PALETTE4_R5_G6_B5_OES          0x8B92
++#define GL_PALETTE4_RGBA4_OES             0x8B93
++#define GL_PALETTE4_RGB5_A1_OES           0x8B94
++#define GL_PALETTE8_RGB8_OES              0x8B95
++#define GL_PALETTE8_RGBA8_OES             0x8B96
++#define GL_PALETTE8_R5_G6_B5_OES          0x8B97
++#define GL_PALETTE8_RGBA4_OES             0x8B98
++#define GL_PALETTE8_RGB5_A1_OES           0x8B99
++#endif /* GL_OES_compressed_paletted_texture */
++
++#ifndef GL_OES_depth24
++#define GL_OES_depth24 1
++#define GL_DEPTH_COMPONENT24_OES          0x81A6
++#endif /* GL_OES_depth24 */
++
++#ifndef GL_OES_depth32
++#define GL_OES_depth32 1
++#define GL_DEPTH_COMPONENT32_OES          0x81A7
++#endif /* GL_OES_depth32 */
++
++#ifndef GL_OES_depth_texture
++#define GL_OES_depth_texture 1
++#endif /* GL_OES_depth_texture */
++
++#ifndef GL_OES_element_index_uint
++#define GL_OES_element_index_uint 1
++#endif /* GL_OES_element_index_uint */
++
++#ifndef GL_OES_fbo_render_mipmap
++#define GL_OES_fbo_render_mipmap 1
++#endif /* GL_OES_fbo_render_mipmap */
++
++#ifndef GL_OES_fragment_precision_high
++#define GL_OES_fragment_precision_high 1
++#endif /* GL_OES_fragment_precision_high */
++
++#ifndef GL_OES_get_program_binary
++#define GL_OES_get_program_binary 1
++#define GL_PROGRAM_BINARY_LENGTH_OES      0x8741
++#define GL_NUM_PROGRAM_BINARY_FORMATS_OES 0x87FE
++#define GL_PROGRAM_BINARY_FORMATS_OES     0x87FF
++typedef void (GL_APIENTRYP PFNGLGETPROGRAMBINARYOESPROC) (GLuint program, GLsizei bufSize, GLsizei *length, GLenum *binaryFormat, void *binary);
++typedef void (GL_APIENTRYP PFNGLPROGRAMBINARYOESPROC) (GLuint program, GLenum binaryFormat, const void *binary, GLint length);
++#ifdef GL_GLEXT_PROTOTYPES
++GL_APICALL void GL_APIENTRY glGetProgramBinaryOES (GLuint program, GLsizei bufSize, GLsizei *length, GLenum *binaryFormat, void *binary);
++GL_APICALL void GL_APIENTRY glProgramBinaryOES (GLuint program, GLenum binaryFormat, const void *binary, GLint length);
++#endif
++#endif /* GL_OES_get_program_binary */
++
++#ifndef GL_OES_mapbuffer
++#define GL_OES_mapbuffer 1
++#define GL_WRITE_ONLY_OES                 0x88B9
++#define GL_BUFFER_ACCESS_OES              0x88BB
++#define GL_BUFFER_MAPPED_OES              0x88BC
++#define GL_BUFFER_MAP_POINTER_OES         0x88BD
++typedef void *(GL_APIENTRYP PFNGLMAPBUFFEROESPROC) (GLenum target, GLenum access);
++typedef GLboolean (GL_APIENTRYP PFNGLUNMAPBUFFEROESPROC) (GLenum target);
++typedef void (GL_APIENTRYP PFNGLGETBUFFERPOINTERVOESPROC) (GLenum target, GLenum pname, void **params);
++#ifdef GL_GLEXT_PROTOTYPES
++GL_APICALL void *GL_APIENTRY glMapBufferOES (GLenum target, GLenum access);
++GL_APICALL GLboolean GL_APIENTRY glUnmapBufferOES (GLenum target);
++GL_APICALL void GL_APIENTRY glGetBufferPointervOES (GLenum target, GLenum pname, void **params);
++#endif
++#endif /* GL_OES_mapbuffer */
++
++#ifndef GL_OES_packed_depth_stencil
++#define GL_OES_packed_depth_stencil 1
++#define GL_DEPTH_STENCIL_OES              0x84F9
++#define GL_UNSIGNED_INT_24_8_OES          0x84FA
++#define GL_DEPTH24_STENCIL8_OES           0x88F0
++#endif /* GL_OES_packed_depth_stencil */
++
++#ifndef GL_OES_required_internalformat
++#define GL_OES_required_internalformat 1
++#define GL_ALPHA8_OES                     0x803C
++#define GL_DEPTH_COMPONENT16_OES          0x81A5
++#define GL_LUMINANCE4_ALPHA4_OES          0x8043
++#define GL_LUMINANCE8_ALPHA8_OES          0x8045
++#define GL_LUMINANCE8_OES                 0x8040
++#define GL_RGBA4_OES                      0x8056
++#define GL_RGB5_A1_OES                    0x8057
++#define GL_RGB565_OES                     0x8D62
++#define GL_RGB8_OES                       0x8051
++#define GL_RGBA8_OES                      0x8058
++#define GL_RGB10_EXT                      0x8052
++#define GL_RGB10_A2_EXT                   0x8059
++#endif /* GL_OES_required_internalformat */
++
++#ifndef GL_OES_rgb8_rgba8
++#define GL_OES_rgb8_rgba8 1
++#endif /* GL_OES_rgb8_rgba8 */
++
++#ifndef GL_OES_standard_derivatives
++#define GL_OES_standard_derivatives 1
++#define GL_FRAGMENT_SHADER_DERIVATIVE_HINT_OES 0x8B8B
++#endif /* GL_OES_standard_derivatives */
++
++#ifndef GL_OES_stencil1
++#define GL_OES_stencil1 1
++#define GL_STENCIL_INDEX1_OES             0x8D46
++#endif /* GL_OES_stencil1 */
++
++#ifndef GL_OES_stencil4
++#define GL_OES_stencil4 1
++#define GL_STENCIL_INDEX4_OES             0x8D47
++#endif /* GL_OES_stencil4 */
++
++#ifndef GL_OES_surfaceless_context
++#define GL_OES_surfaceless_context 1
++#define GL_FRAMEBUFFER_UNDEFINED_OES      0x8219
++#endif /* GL_OES_surfaceless_context */
++
++#ifndef GL_OES_texture_3D
++#define GL_OES_texture_3D 1
++#define GL_TEXTURE_WRAP_R_OES             0x8072
++#define GL_TEXTURE_3D_OES                 0x806F
++#define GL_TEXTURE_BINDING_3D_OES         0x806A
++#define GL_MAX_3D_TEXTURE_SIZE_OES        0x8073
++#define GL_SAMPLER_3D_OES                 0x8B5F
++#define GL_FRAMEBUFFER_ATTACHMENT_TEXTURE_3D_ZOFFSET_OES 0x8CD4
++typedef void (GL_APIENTRYP PFNGLTEXIMAGE3DOESPROC) (GLenum target, GLint level, GLenum internalformat, GLsizei width, GLsizei height, GLsizei depth, GLint border, GLenum format, GLenum type, const void *pixels);
++typedef void (GL_APIENTRYP PFNGLTEXSUBIMAGE3DOESPROC) (GLenum target, GLint level, GLint xoffset, GLint yoffset, GLint zoffset, GLsizei width, GLsizei height, GLsizei depth, GLenum format, GLenum type, const void *pixels);
++typedef void (GL_APIENTRYP PFNGLCOPYTEXSUBIMAGE3DOESPROC) (GLenum target, GLint level, GLint xoffset, GLint yoffset, GLint zoffset, GLint x, GLint y, GLsizei width, GLsizei height);
++typedef void (GL_APIENTRYP PFNGLCOMPRESSEDTEXIMAGE3DOESPROC) (GLenum target, GLint level, GLenum internalformat, GLsizei width, GLsizei height, GLsizei depth, GLint border, GLsizei imageSize, const void *data);
++typedef void (GL_APIENTRYP PFNGLCOMPRESSEDTEXSUBIMAGE3DOESPROC) (GLenum target, GLint level, GLint xoffset, GLint yoffset, GLint zoffset, GLsizei width, GLsizei height, GLsizei depth, GLenum format, GLsizei imageSize, const void *data);
++typedef void (GL_APIENTRYP PFNGLFRAMEBUFFERTEXTURE3DOESPROC) (GLenum target, GLenum attachment, GLenum textarget, GLuint texture, GLint level, GLint zoffset);
++#ifdef GL_GLEXT_PROTOTYPES
++GL_APICALL void GL_APIENTRY glTexImage3DOES (GLenum target, GLint level, GLenum internalformat, GLsizei width, GLsizei height, GLsizei depth, GLint border, GLenum format, GLenum type, const void *pixels);
++GL_APICALL void GL_APIENTRY glTexSubImage3DOES (GLenum target, GLint level, GLint xoffset, GLint yoffset, GLint zoffset, GLsizei width, GLsizei height, GLsizei depth, GLenum format, GLenum type, const void *pixels);
++GL_APICALL void GL_APIENTRY glCopyTexSubImage3DOES (GLenum target, GLint level, GLint xoffset, GLint yoffset, GLint zoffset, GLint x, GLint y, GLsizei width, GLsizei height);
++GL_APICALL void GL_APIENTRY glCompressedTexImage3DOES (GLenum target, GLint level, GLenum internalformat, GLsizei width, GLsizei height, GLsizei depth, GLint border, GLsizei imageSize, const void *data);
++GL_APICALL void GL_APIENTRY glCompressedTexSubImage3DOES (GLenum target, GLint level, GLint xoffset, GLint yoffset, GLint zoffset, GLsizei width, GLsizei height, GLsizei depth, GLenum format, GLsizei imageSize, const void *data);
++GL_APICALL void GL_APIENTRY glFramebufferTexture3DOES (GLenum target, GLenum attachment, GLenum textarget, GLuint texture, GLint level, GLint zoffset);
++#endif
++#endif /* GL_OES_texture_3D */
++
++#ifndef GL_OES_texture_compression_astc
++#define GL_OES_texture_compression_astc 1
++#endif /* GL_OES_texture_compression_astc */
++
++#ifndef GL_OES_texture_float
++#define GL_OES_texture_float 1
++#endif /* GL_OES_texture_float */
++
++#ifndef GL_OES_texture_float_linear
++#define GL_OES_texture_float_linear 1
++#endif /* GL_OES_texture_float_linear */
++
++#ifndef GL_OES_texture_half_float
++#define GL_OES_texture_half_float 1
++#define GL_HALF_FLOAT_OES                 0x8D61
++#endif /* GL_OES_texture_half_float */
++
++#ifndef GL_OES_texture_half_float_linear
++#define GL_OES_texture_half_float_linear 1
++#endif /* GL_OES_texture_half_float_linear */
++
++#ifndef GL_OES_texture_npot
++#define GL_OES_texture_npot 1
++#endif /* GL_OES_texture_npot */
++
++#ifndef GL_OES_vertex_array_object
++#define GL_OES_vertex_array_object 1
++#define GL_VERTEX_ARRAY_BINDING_OES       0x85B5
++typedef void (GL_APIENTRYP PFNGLBINDVERTEXARRAYOESPROC) (GLuint array);
++typedef void (GL_APIENTRYP PFNGLDELETEVERTEXARRAYSOESPROC) (GLsizei n, const GLuint *arrays);
++typedef void (GL_APIENTRYP PFNGLGENVERTEXARRAYSOESPROC) (GLsizei n, GLuint *arrays);
++typedef GLboolean (GL_APIENTRYP PFNGLISVERTEXARRAYOESPROC) (GLuint array);
++#ifdef GL_GLEXT_PROTOTYPES
++GL_APICALL void GL_APIENTRY glBindVertexArrayOES (GLuint array);
++GL_APICALL void GL_APIENTRY glDeleteVertexArraysOES (GLsizei n, const GLuint *arrays);
++GL_APICALL void GL_APIENTRY glGenVertexArraysOES (GLsizei n, GLuint *arrays);
++GL_APICALL GLboolean GL_APIENTRY glIsVertexArrayOES (GLuint array);
++#endif
++#endif /* GL_OES_vertex_array_object */
++
++#ifndef GL_OES_vertex_half_float
++#define GL_OES_vertex_half_float 1
++#endif /* GL_OES_vertex_half_float */
++
++#ifndef GL_OES_vertex_type_10_10_10_2
++#define GL_OES_vertex_type_10_10_10_2 1
++#define GL_UNSIGNED_INT_10_10_10_2_OES    0x8DF6
++#define GL_INT_10_10_10_2_OES             0x8DF7
++#endif /* GL_OES_vertex_type_10_10_10_2 */
++
++#ifndef GL_AMD_compressed_3DC_texture
++#define GL_AMD_compressed_3DC_texture 1
++#define GL_3DC_X_AMD                      0x87F9
++#define GL_3DC_XY_AMD                     0x87FA
++#endif /* GL_AMD_compressed_3DC_texture */
++
++#ifndef GL_AMD_compressed_ATC_texture
++#define GL_AMD_compressed_ATC_texture 1
++#define GL_ATC_RGB_AMD                    0x8C92
++#define GL_ATC_RGBA_EXPLICIT_ALPHA_AMD    0x8C93
++#define GL_ATC_RGBA_INTERPOLATED_ALPHA_AMD 0x87EE
++#endif /* GL_AMD_compressed_ATC_texture */
++
++#ifndef GL_AMD_performance_monitor
++#define GL_AMD_performance_monitor 1
++#define GL_COUNTER_TYPE_AMD               0x8BC0
++#define GL_COUNTER_RANGE_AMD              0x8BC1
++#define GL_UNSIGNED_INT64_AMD             0x8BC2
++#define GL_PERCENTAGE_AMD                 0x8BC3
++#define GL_PERFMON_RESULT_AVAILABLE_AMD   0x8BC4
++#define GL_PERFMON_RESULT_SIZE_AMD        0x8BC5
++#define GL_PERFMON_RESULT_AMD             0x8BC6
++typedef void (GL_APIENTRYP PFNGLGETPERFMONITORGROUPSAMDPROC) (GLint *numGroups, GLsizei groupsSize, GLuint *groups);
++typedef void (GL_APIENTRYP PFNGLGETPERFMONITORCOUNTERSAMDPROC) (GLuint group, GLint *numCounters, GLint *maxActiveCounters, GLsizei counterSize, GLuint *counters);
++typedef void (GL_APIENTRYP PFNGLGETPERFMONITORGROUPSTRINGAMDPROC) (GLuint group, GLsizei bufSize, GLsizei *length, GLchar *groupString);
++typedef void (GL_APIENTRYP PFNGLGETPERFMONITORCOUNTERSTRINGAMDPROC) (GLuint group, GLuint counter, GLsizei bufSize, GLsizei *length, GLchar *counterString);
++typedef void (GL_APIENTRYP PFNGLGETPERFMONITORCOUNTERINFOAMDPROC) (GLuint group, GLuint counter, GLenum pname, void *data);
++typedef void (GL_APIENTRYP PFNGLGENPERFMONITORSAMDPROC) (GLsizei n, GLuint *monitors);
++typedef void (GL_APIENTRYP PFNGLDELETEPERFMONITORSAMDPROC) (GLsizei n, GLuint *monitors);
++typedef void (GL_APIENTRYP PFNGLSELECTPERFMONITORCOUNTERSAMDPROC) (GLuint monitor, GLboolean enable, GLuint group, GLint numCounters, GLuint *counterList);
++typedef void (GL_APIENTRYP PFNGLBEGINPERFMONITORAMDPROC) (GLuint monitor);
++typedef void (GL_APIENTRYP PFNGLENDPERFMONITORAMDPROC) (GLuint monitor);
++typedef void (GL_APIENTRYP PFNGLGETPERFMONITORCOUNTERDATAAMDPROC) (GLuint monitor, GLenum pname, GLsizei dataSize, GLuint *data, GLint *bytesWritten);
++#ifdef GL_GLEXT_PROTOTYPES
++GL_APICALL void GL_APIENTRY glGetPerfMonitorGroupsAMD (GLint *numGroups, GLsizei groupsSize, GLuint *groups);
++GL_APICALL void GL_APIENTRY glGetPerfMonitorCountersAMD (GLuint group, GLint *numCounters, GLint *maxActiveCounters, GLsizei counterSize, GLuint *counters);
++GL_APICALL void GL_APIENTRY glGetPerfMonitorGroupStringAMD (GLuint group, GLsizei bufSize, GLsizei *length, GLchar *groupString);
++GL_APICALL void GL_APIENTRY glGetPerfMonitorCounterStringAMD (GLuint group, GLuint counter, GLsizei bufSize, GLsizei *length, GLchar *counterString);
++GL_APICALL void GL_APIENTRY glGetPerfMonitorCounterInfoAMD (GLuint group, GLuint counter, GLenum pname, void *data);
++GL_APICALL void GL_APIENTRY glGenPerfMonitorsAMD (GLsizei n, GLuint *monitors);
++GL_APICALL void GL_APIENTRY glDeletePerfMonitorsAMD (GLsizei n, GLuint *monitors);
++GL_APICALL void GL_APIENTRY glSelectPerfMonitorCountersAMD (GLuint monitor, GLboolean enable, GLuint group, GLint numCounters, GLuint *counterList);
++GL_APICALL void GL_APIENTRY glBeginPerfMonitorAMD (GLuint monitor);
++GL_APICALL void GL_APIENTRY glEndPerfMonitorAMD (GLuint monitor);
++GL_APICALL void GL_APIENTRY glGetPerfMonitorCounterDataAMD (GLuint monitor, GLenum pname, GLsizei dataSize, GLuint *data, GLint *bytesWritten);
++#endif
++#endif /* GL_AMD_performance_monitor */
++
++#ifndef GL_AMD_program_binary_Z400
++#define GL_AMD_program_binary_Z400 1
++#define GL_Z400_BINARY_AMD                0x8740
++#endif /* GL_AMD_program_binary_Z400 */
++
++#ifndef GL_ANGLE_depth_texture
++#define GL_ANGLE_depth_texture 1
++#endif /* GL_ANGLE_depth_texture */
++
++#ifndef GL_ANGLE_framebuffer_blit
++#define GL_ANGLE_framebuffer_blit 1
++#define GL_READ_FRAMEBUFFER_ANGLE         0x8CA8
++#define GL_DRAW_FRAMEBUFFER_ANGLE         0x8CA9
++#define GL_DRAW_FRAMEBUFFER_BINDING_ANGLE 0x8CA6
++#define GL_READ_FRAMEBUFFER_BINDING_ANGLE 0x8CAA
++typedef void (GL_APIENTRYP PFNGLBLITFRAMEBUFFERANGLEPROC) (GLint srcX0, GLint srcY0, GLint srcX1, GLint srcY1, GLint dstX0, GLint dstY0, GLint dstX1, GLint dstY1, GLbitfield mask, GLenum filter);
++#ifdef GL_GLEXT_PROTOTYPES
++GL_APICALL void GL_APIENTRY glBlitFramebufferANGLE (GLint srcX0, GLint srcY0, GLint srcX1, GLint srcY1, GLint dstX0, GLint dstY0, GLint dstX1, GLint dstY1, GLbitfield mask, GLenum filter);
++#endif
++#endif /* GL_ANGLE_framebuffer_blit */
++
++#ifndef GL_ANGLE_framebuffer_multisample
++#define GL_ANGLE_framebuffer_multisample 1
++#define GL_RENDERBUFFER_SAMPLES_ANGLE     0x8CAB
++#define GL_FRAMEBUFFER_INCOMPLETE_MULTISAMPLE_ANGLE 0x8D56
++#define GL_MAX_SAMPLES_ANGLE              0x8D57
++typedef void (GL_APIENTRYP PFNGLRENDERBUFFERSTORAGEMULTISAMPLEANGLEPROC) (GLenum target, GLsizei samples, GLenum internalformat, GLsizei width, GLsizei height);
++#ifdef GL_GLEXT_PROTOTYPES
++GL_APICALL void GL_APIENTRY glRenderbufferStorageMultisampleANGLE (GLenum target, GLsizei samples, GLenum internalformat, GLsizei width, GLsizei height);
++#endif
++#endif /* GL_ANGLE_framebuffer_multisample */
++
++#ifndef GL_ANGLE_instanced_arrays
++#define GL_ANGLE_instanced_arrays 1
++#define GL_VERTEX_ATTRIB_ARRAY_DIVISOR_ANGLE 0x88FE
++typedef void (GL_APIENTRYP PFNGLDRAWARRAYSINSTANCEDANGLEPROC) (GLenum mode, GLint first, GLsizei count, GLsizei primcount);
++typedef void (GL_APIENTRYP PFNGLDRAWELEMENTSINSTANCEDANGLEPROC) (GLenum mode, GLsizei count, GLenum type, const void *indices, GLsizei primcount);
++typedef void (GL_APIENTRYP PFNGLVERTEXATTRIBDIVISORANGLEPROC) (GLuint index, GLuint divisor);
++#ifdef GL_GLEXT_PROTOTYPES
++GL_APICALL void GL_APIENTRY glDrawArraysInstancedANGLE (GLenum mode, GLint first, GLsizei count, GLsizei primcount);
++GL_APICALL void GL_APIENTRY glDrawElementsInstancedANGLE (GLenum mode, GLsizei count, GLenum type, const void *indices, GLsizei primcount);
++GL_APICALL void GL_APIENTRY glVertexAttribDivisorANGLE (GLuint index, GLuint divisor);
++#endif
++#endif /* GL_ANGLE_instanced_arrays */
++
++#ifndef GL_ANGLE_pack_reverse_row_order
++#define GL_ANGLE_pack_reverse_row_order 1
++#define GL_PACK_REVERSE_ROW_ORDER_ANGLE   0x93A4
++#endif /* GL_ANGLE_pack_reverse_row_order */
++
++#ifndef GL_ANGLE_program_binary
++#define GL_ANGLE_program_binary 1
++#define GL_PROGRAM_BINARY_ANGLE           0x93A6
++#endif /* GL_ANGLE_program_binary */
++
++#ifndef GL_ANGLE_texture_compression_dxt3
++#define GL_ANGLE_texture_compression_dxt3 1
++#define GL_COMPRESSED_RGBA_S3TC_DXT3_ANGLE 0x83F2
++#endif /* GL_ANGLE_texture_compression_dxt3 */
++
++#ifndef GL_ANGLE_texture_compression_dxt5
++#define GL_ANGLE_texture_compression_dxt5 1
++#define GL_COMPRESSED_RGBA_S3TC_DXT5_ANGLE 0x83F3
++#endif /* GL_ANGLE_texture_compression_dxt5 */
++
++#ifndef GL_ANGLE_texture_usage
++#define GL_ANGLE_texture_usage 1
++#define GL_TEXTURE_USAGE_ANGLE            0x93A2
++#define GL_FRAMEBUFFER_ATTACHMENT_ANGLE   0x93A3
++#endif /* GL_ANGLE_texture_usage */
++
++#ifndef GL_ANGLE_translated_shader_source
++#define GL_ANGLE_translated_shader_source 1
++#define GL_TRANSLATED_SHADER_SOURCE_LENGTH_ANGLE 0x93A0
++typedef void (GL_APIENTRYP PFNGLGETTRANSLATEDSHADERSOURCEANGLEPROC) (GLuint shader, GLsizei bufsize, GLsizei *length, GLchar *source);
++#ifdef GL_GLEXT_PROTOTYPES
++GL_APICALL void GL_APIENTRY glGetTranslatedShaderSourceANGLE (GLuint shader, GLsizei bufsize, GLsizei *length, GLchar *source);
++#endif
++#endif /* GL_ANGLE_translated_shader_source */
++
++#ifndef GL_APPLE_copy_texture_levels
++#define GL_APPLE_copy_texture_levels 1
++typedef void (GL_APIENTRYP PFNGLCOPYTEXTURELEVELSAPPLEPROC) (GLuint destinationTexture, GLuint sourceTexture, GLint sourceBaseLevel, GLsizei sourceLevelCount);
++#ifdef GL_GLEXT_PROTOTYPES
++GL_APICALL void GL_APIENTRY glCopyTextureLevelsAPPLE (GLuint destinationTexture, GLuint sourceTexture, GLint sourceBaseLevel, GLsizei sourceLevelCount);
++#endif
++#endif /* GL_APPLE_copy_texture_levels */
++
++#ifndef GL_APPLE_framebuffer_multisample
++#define GL_APPLE_framebuffer_multisample 1
++#define GL_RENDERBUFFER_SAMPLES_APPLE     0x8CAB
++#define GL_FRAMEBUFFER_INCOMPLETE_MULTISAMPLE_APPLE 0x8D56
++#define GL_MAX_SAMPLES_APPLE              0x8D57
++#define GL_READ_FRAMEBUFFER_APPLE         0x8CA8
++#define GL_DRAW_FRAMEBUFFER_APPLE         0x8CA9
++#define GL_DRAW_FRAMEBUFFER_BINDING_APPLE 0x8CA6
++#define GL_READ_FRAMEBUFFER_BINDING_APPLE 0x8CAA
++typedef void (GL_APIENTRYP PFNGLRENDERBUFFERSTORAGEMULTISAMPLEAPPLEPROC) (GLenum target, GLsizei samples, GLenum internalformat, GLsizei width, GLsizei height);
++typedef void (GL_APIENTRYP PFNGLRESOLVEMULTISAMPLEFRAMEBUFFERAPPLEPROC) (void);
++#ifdef GL_GLEXT_PROTOTYPES
++GL_APICALL void GL_APIENTRY glRenderbufferStorageMultisampleAPPLE (GLenum target, GLsizei samples, GLenum internalformat, GLsizei width, GLsizei height);
++GL_APICALL void GL_APIENTRY glResolveMultisampleFramebufferAPPLE (void);
++#endif
++#endif /* GL_APPLE_framebuffer_multisample */
++
++#ifndef GL_APPLE_rgb_422
++#define GL_APPLE_rgb_422 1
++#define GL_RGB_422_APPLE                  0x8A1F
++#define GL_UNSIGNED_SHORT_8_8_APPLE       0x85BA
++#define GL_UNSIGNED_SHORT_8_8_REV_APPLE   0x85BB
++#define GL_RGB_RAW_422_APPLE              0x8A51
++#endif /* GL_APPLE_rgb_422 */
++
++#ifndef GL_APPLE_sync
++#define GL_APPLE_sync 1
++#define GL_SYNC_OBJECT_APPLE              0x8A53
++#define GL_MAX_SERVER_WAIT_TIMEOUT_APPLE  0x9111
++#define GL_OBJECT_TYPE_APPLE              0x9112
++#define GL_SYNC_CONDITION_APPLE           0x9113
++#define GL_SYNC_STATUS_APPLE              0x9114
++#define GL_SYNC_FLAGS_APPLE               0x9115
++#define GL_SYNC_FENCE_APPLE               0x9116
++#define GL_SYNC_GPU_COMMANDS_COMPLETE_APPLE 0x9117
++#define GL_UNSIGNALED_APPLE               0x9118
++#define GL_SIGNALED_APPLE                 0x9119
++#define GL_ALREADY_SIGNALED_APPLE         0x911A
++#define GL_TIMEOUT_EXPIRED_APPLE          0x911B
++#define GL_CONDITION_SATISFIED_APPLE      0x911C
++#define GL_WAIT_FAILED_APPLE              0x911D
++#define GL_SYNC_FLUSH_COMMANDS_BIT_APPLE  0x00000001
++#define GL_TIMEOUT_IGNORED_APPLE          0xFFFFFFFFFFFFFFFFull
++typedef GLsync (GL_APIENTRYP PFNGLFENCESYNCAPPLEPROC) (GLenum condition, GLbitfield flags);
++typedef GLboolean (GL_APIENTRYP PFNGLISSYNCAPPLEPROC) (GLsync sync);
++typedef void (GL_APIENTRYP PFNGLDELETESYNCAPPLEPROC) (GLsync sync);
++typedef GLenum (GL_APIENTRYP PFNGLCLIENTWAITSYNCAPPLEPROC) (GLsync sync, GLbitfield flags, GLuint64 timeout);
++typedef void (GL_APIENTRYP PFNGLWAITSYNCAPPLEPROC) (GLsync sync, GLbitfield flags, GLuint64 timeout);
++typedef void (GL_APIENTRYP PFNGLGETINTEGER64VAPPLEPROC) (GLenum pname, GLint64 *params);
++typedef void (GL_APIENTRYP PFNGLGETSYNCIVAPPLEPROC) (GLsync sync, GLenum pname, GLsizei bufSize, GLsizei *length, GLint *values);
++#ifdef GL_GLEXT_PROTOTYPES
++GL_APICALL GLsync GL_APIENTRY glFenceSyncAPPLE (GLenum condition, GLbitfield flags);
++GL_APICALL GLboolean GL_APIENTRY glIsSyncAPPLE (GLsync sync);
++GL_APICALL void GL_APIENTRY glDeleteSyncAPPLE (GLsync sync);
++GL_APICALL GLenum GL_APIENTRY glClientWaitSyncAPPLE (GLsync sync, GLbitfield flags, GLuint64 timeout);
++GL_APICALL void GL_APIENTRY glWaitSyncAPPLE (GLsync sync, GLbitfield flags, GLuint64 timeout);
++GL_APICALL void GL_APIENTRY glGetInteger64vAPPLE (GLenum pname, GLint64 *params);
++GL_APICALL void GL_APIENTRY glGetSyncivAPPLE (GLsync sync, GLenum pname, GLsizei bufSize, GLsizei *length, GLint *values);
++#endif
++#endif /* GL_APPLE_sync */
++
++#ifndef GL_APPLE_texture_format_BGRA8888
++#define GL_APPLE_texture_format_BGRA8888 1
++#define GL_BGRA_EXT                       0x80E1
++#define GL_BGRA8_EXT                      0x93A1
++#endif /* GL_APPLE_texture_format_BGRA8888 */
++
++#ifndef GL_APPLE_texture_max_level
++#define GL_APPLE_texture_max_level 1
++#define GL_TEXTURE_MAX_LEVEL_APPLE        0x813D
++#endif /* GL_APPLE_texture_max_level */
++
++#ifndef GL_ARM_mali_program_binary
++#define GL_ARM_mali_program_binary 1
++#define GL_MALI_PROGRAM_BINARY_ARM        0x8F61
++#endif /* GL_ARM_mali_program_binary */
++
++#ifndef GL_ARM_mali_shader_binary
++#define GL_ARM_mali_shader_binary 1
++#define GL_MALI_SHADER_BINARY_ARM         0x8F60
++#endif /* GL_ARM_mali_shader_binary */
++
++#ifndef GL_ARM_rgba8
++#define GL_ARM_rgba8 1
++#endif /* GL_ARM_rgba8 */
++
++#ifndef GL_DMP_shader_binary
++#define GL_DMP_shader_binary 1
++#define GL_SHADER_BINARY_DMP              0x9250
++#endif /* GL_DMP_shader_binary */
++
++#ifndef GL_EXT_blend_minmax
++#define GL_EXT_blend_minmax 1
++#define GL_MIN_EXT                        0x8007
++#define GL_MAX_EXT                        0x8008
++#endif /* GL_EXT_blend_minmax */
++
++#ifndef GL_EXT_color_buffer_half_float
++#define GL_EXT_color_buffer_half_float 1
++#define GL_RGBA16F_EXT                    0x881A
++#define GL_RGB16F_EXT                     0x881B
++#define GL_RG16F_EXT                      0x822F
++#define GL_R16F_EXT                       0x822D
++#define GL_FRAMEBUFFER_ATTACHMENT_COMPONENT_TYPE_EXT 0x8211
++#define GL_UNSIGNED_NORMALIZED_EXT        0x8C17
++#endif /* GL_EXT_color_buffer_half_float */
++
++#ifndef GL_EXT_debug_label
++#define GL_EXT_debug_label 1
++#define GL_PROGRAM_PIPELINE_OBJECT_EXT    0x8A4F
++#define GL_PROGRAM_OBJECT_EXT             0x8B40
++#define GL_SHADER_OBJECT_EXT              0x8B48
++#define GL_BUFFER_OBJECT_EXT              0x9151
++#define GL_QUERY_OBJECT_EXT               0x9153
++#define GL_VERTEX_ARRAY_OBJECT_EXT        0x9154
++#define GL_TRANSFORM_FEEDBACK             0x8E22
++typedef void (GL_APIENTRYP PFNGLLABELOBJECTEXTPROC) (GLenum type, GLuint object, GLsizei length, const GLchar *label);
++typedef void (GL_APIENTRYP PFNGLGETOBJECTLABELEXTPROC) (GLenum type, GLuint object, GLsizei bufSize, GLsizei *length, GLchar *label);
++#ifdef GL_GLEXT_PROTOTYPES
++GL_APICALL void GL_APIENTRY glLabelObjectEXT (GLenum type, GLuint object, GLsizei length, const GLchar *label);
++GL_APICALL void GL_APIENTRY glGetObjectLabelEXT (GLenum type, GLuint object, GLsizei bufSize, GLsizei *length, GLchar *label);
++#endif
++#endif /* GL_EXT_debug_label */
++
++#ifndef GL_EXT_debug_marker
++#define GL_EXT_debug_marker 1
++typedef void (GL_APIENTRYP PFNGLINSERTEVENTMARKEREXTPROC) (GLsizei length, const GLchar *marker);
++typedef void (GL_APIENTRYP PFNGLPUSHGROUPMARKEREXTPROC) (GLsizei length, const GLchar *marker);
++typedef void (GL_APIENTRYP PFNGLPOPGROUPMARKEREXTPROC) (void);
++#ifdef GL_GLEXT_PROTOTYPES
++GL_APICALL void GL_APIENTRY glInsertEventMarkerEXT (GLsizei length, const GLchar *marker);
++GL_APICALL void GL_APIENTRY glPushGroupMarkerEXT (GLsizei length, const GLchar *marker);
++GL_APICALL void GL_APIENTRY glPopGroupMarkerEXT (void);
++#endif
++#endif /* GL_EXT_debug_marker */
++
++#ifndef GL_EXT_discard_framebuffer
++#define GL_EXT_discard_framebuffer 1
++#define GL_COLOR_EXT                      0x1800
++#define GL_DEPTH_EXT                      0x1801
++#define GL_STENCIL_EXT                    0x1802
++typedef void (GL_APIENTRYP PFNGLDISCARDFRAMEBUFFEREXTPROC) (GLenum target, GLsizei numAttachments, const GLenum *attachments);
++#ifdef GL_GLEXT_PROTOTYPES
++GL_APICALL void GL_APIENTRY glDiscardFramebufferEXT (GLenum target, GLsizei numAttachments, const GLenum *attachments);
++#endif
++#endif /* GL_EXT_discard_framebuffer */
++
++#ifndef GL_EXT_disjoint_timer_query
++#define GL_EXT_disjoint_timer_query 1
++#define GL_QUERY_COUNTER_BITS_EXT         0x8864
++#define GL_CURRENT_QUERY_EXT              0x8865
++#define GL_QUERY_RESULT_EXT               0x8866
++#define GL_QUERY_RESULT_AVAILABLE_EXT     0x8867
++#define GL_TIME_ELAPSED_EXT               0x88BF
++#define GL_TIMESTAMP_EXT                  0x8E28
++#define GL_GPU_DISJOINT_EXT               0x8FBB
++typedef void (GL_APIENTRYP PFNGLGENQUERIESEXTPROC) (GLsizei n, GLuint *ids);
++typedef void (GL_APIENTRYP PFNGLDELETEQUERIESEXTPROC) (GLsizei n, const GLuint *ids);
++typedef GLboolean (GL_APIENTRYP PFNGLISQUERYEXTPROC) (GLuint id);
++typedef void (GL_APIENTRYP PFNGLBEGINQUERYEXTPROC) (GLenum target, GLuint id);
++typedef void (GL_APIENTRYP PFNGLENDQUERYEXTPROC) (GLenum target);
++typedef void (GL_APIENTRYP PFNGLQUERYCOUNTEREXTPROC) (GLuint id, GLenum target);
++typedef void (GL_APIENTRYP PFNGLGETQUERYIVEXTPROC) (GLenum target, GLenum pname, GLint *params);
++typedef void (GL_APIENTRYP PFNGLGETQUERYOBJECTIVEXTPROC) (GLuint id, GLenum pname, GLint *params);
++typedef void (GL_APIENTRYP PFNGLGETQUERYOBJECTUIVEXTPROC) (GLuint id, GLenum pname, GLuint *params);
++typedef void (GL_APIENTRYP PFNGLGETQUERYOBJECTI64VEXTPROC) (GLuint id, GLenum pname, GLint64 *params);
++typedef void (GL_APIENTRYP PFNGLGETQUERYOBJECTUI64VEXTPROC) (GLuint id, GLenum pname, GLuint64 *params);
++#ifdef GL_GLEXT_PROTOTYPES
++GL_APICALL void GL_APIENTRY glGenQueriesEXT (GLsizei n, GLuint *ids);
++GL_APICALL void GL_APIENTRY glDeleteQueriesEXT (GLsizei n, const GLuint *ids);
++GL_APICALL GLboolean GL_APIENTRY glIsQueryEXT (GLuint id);
++GL_APICALL void GL_APIENTRY glBeginQueryEXT (GLenum target, GLuint id);
++GL_APICALL void GL_APIENTRY glEndQueryEXT (GLenum target);
++GL_APICALL void GL_APIENTRY glQueryCounterEXT (GLuint id, GLenum target);
++GL_APICALL void GL_APIENTRY glGetQueryivEXT (GLenum target, GLenum pname, GLint *params);
++GL_APICALL void GL_APIENTRY glGetQueryObjectivEXT (GLuint id, GLenum pname, GLint *params);
++GL_APICALL void GL_APIENTRY glGetQueryObjectuivEXT (GLuint id, GLenum pname, GLuint *params);
++GL_APICALL void GL_APIENTRY glGetQueryObjecti64vEXT (GLuint id, GLenum pname, GLint64 *params);
++GL_APICALL void GL_APIENTRY glGetQueryObjectui64vEXT (GLuint id, GLenum pname, GLuint64 *params);
++#endif
++#endif /* GL_EXT_disjoint_timer_query */
++
++#ifndef GL_EXT_draw_buffers
++#define GL_EXT_draw_buffers 1
++#define GL_MAX_COLOR_ATTACHMENTS_EXT      0x8CDF
++#define GL_MAX_DRAW_BUFFERS_EXT           0x8824
++#define GL_DRAW_BUFFER0_EXT               0x8825
++#define GL_DRAW_BUFFER1_EXT               0x8826
++#define GL_DRAW_BUFFER2_EXT               0x8827
++#define GL_DRAW_BUFFER3_EXT               0x8828
++#define GL_DRAW_BUFFER4_EXT               0x8829
++#define GL_DRAW_BUFFER5_EXT               0x882A
++#define GL_DRAW_BUFFER6_EXT               0x882B
++#define GL_DRAW_BUFFER7_EXT               0x882C
++#define GL_DRAW_BUFFER8_EXT               0x882D
++#define GL_DRAW_BUFFER9_EXT               0x882E
++#define GL_DRAW_BUFFER10_EXT              0x882F
++#define GL_DRAW_BUFFER11_EXT              0x8830
++#define GL_DRAW_BUFFER12_EXT              0x8831
++#define GL_DRAW_BUFFER13_EXT              0x8832
++#define GL_DRAW_BUFFER14_EXT              0x8833
++#define GL_DRAW_BUFFER15_EXT              0x8834
++#define GL_COLOR_ATTACHMENT0_EXT          0x8CE0
++#define GL_COLOR_ATTACHMENT1_EXT          0x8CE1
++#define GL_COLOR_ATTACHMENT2_EXT          0x8CE2
++#define GL_COLOR_ATTACHMENT3_EXT          0x8CE3
++#define GL_COLOR_ATTACHMENT4_EXT          0x8CE4
++#define GL_COLOR_ATTACHMENT5_EXT          0x8CE5
++#define GL_COLOR_ATTACHMENT6_EXT          0x8CE6
++#define GL_COLOR_ATTACHMENT7_EXT          0x8CE7
++#define GL_COLOR_ATTACHMENT8_EXT          0x8CE8
++#define GL_COLOR_ATTACHMENT9_EXT          0x8CE9
++#define GL_COLOR_ATTACHMENT10_EXT         0x8CEA
++#define GL_COLOR_ATTACHMENT11_EXT         0x8CEB
++#define GL_COLOR_ATTACHMENT12_EXT         0x8CEC
++#define GL_COLOR_ATTACHMENT13_EXT         0x8CED
++#define GL_COLOR_ATTACHMENT14_EXT         0x8CEE
++#define GL_COLOR_ATTACHMENT15_EXT         0x8CEF
++typedef void (GL_APIENTRYP PFNGLDRAWBUFFERSEXTPROC) (GLsizei n, const GLenum *bufs);
++#ifdef GL_GLEXT_PROTOTYPES
++GL_APICALL void GL_APIENTRY glDrawBuffersEXT (GLsizei n, const GLenum *bufs);
++#endif
++#endif /* GL_EXT_draw_buffers */
++
++#ifndef GL_EXT_draw_instanced
++#define GL_EXT_draw_instanced 1
++typedef void (GL_APIENTRYP PFNGLDRAWARRAYSINSTANCEDEXTPROC) (GLenum mode, GLint start, GLsizei count, GLsizei primcount);
++typedef void (GL_APIENTRYP PFNGLDRAWELEMENTSINSTANCEDEXTPROC) (GLenum mode, GLsizei count, GLenum type, const void *indices, GLsizei primcount);
++#ifdef GL_GLEXT_PROTOTYPES
++GL_APICALL void GL_APIENTRY glDrawArraysInstancedEXT (GLenum mode, GLint start, GLsizei count, GLsizei primcount);
++GL_APICALL void GL_APIENTRY glDrawElementsInstancedEXT (GLenum mode, GLsizei count, GLenum type, const void *indices, GLsizei primcount);
++#endif
++#endif /* GL_EXT_draw_instanced */
++
++#ifndef GL_EXT_instanced_arrays
++#define GL_EXT_instanced_arrays 1
++#define GL_VERTEX_ATTRIB_ARRAY_DIVISOR_EXT 0x88FE
++typedef void (GL_APIENTRYP PFNGLVERTEXATTRIBDIVISOREXTPROC) (GLuint index, GLuint divisor);
++#ifdef GL_GLEXT_PROTOTYPES
++GL_APICALL void GL_APIENTRY glVertexAttribDivisorEXT (GLuint index, GLuint divisor);
++#endif
++#endif /* GL_EXT_instanced_arrays */
++
++#ifndef GL_EXT_map_buffer_range
++#define GL_EXT_map_buffer_range 1
++#define GL_MAP_READ_BIT_EXT               0x0001
++#define GL_MAP_WRITE_BIT_EXT              0x0002
++#define GL_MAP_INVALIDATE_RANGE_BIT_EXT   0x0004
++#define GL_MAP_INVALIDATE_BUFFER_BIT_EXT  0x0008
++#define GL_MAP_FLUSH_EXPLICIT_BIT_EXT     0x0010
++#define GL_MAP_UNSYNCHRONIZED_BIT_EXT     0x0020
++typedef void *(GL_APIENTRYP PFNGLMAPBUFFERRANGEEXTPROC) (GLenum target, GLintptr offset, GLsizeiptr length, GLbitfield access);
++typedef void (GL_APIENTRYP PFNGLFLUSHMAPPEDBUFFERRANGEEXTPROC) (GLenum target, GLintptr offset, GLsizeiptr length);
++#ifdef GL_GLEXT_PROTOTYPES
++GL_APICALL void *GL_APIENTRY glMapBufferRangeEXT (GLenum target, GLintptr offset, GLsizeiptr length, GLbitfield access);
++GL_APICALL void GL_APIENTRY glFlushMappedBufferRangeEXT (GLenum target, GLintptr offset, GLsizeiptr length);
++#endif
++#endif /* GL_EXT_map_buffer_range */
++
++#ifndef GL_EXT_multi_draw_arrays
++#define GL_EXT_multi_draw_arrays 1
++typedef void (GL_APIENTRYP PFNGLMULTIDRAWARRAYSEXTPROC) (GLenum mode, const GLint *first, const GLsizei *count, GLsizei primcount);
++typedef void (GL_APIENTRYP PFNGLMULTIDRAWELEMENTSEXTPROC) (GLenum mode, const GLsizei *count, GLenum type, const void *const*indices, GLsizei primcount);
++#ifdef GL_GLEXT_PROTOTYPES
++GL_APICALL void GL_APIENTRY glMultiDrawArraysEXT (GLenum mode, const GLint *first, const GLsizei *count, GLsizei primcount);
++GL_APICALL void GL_APIENTRY glMultiDrawElementsEXT (GLenum mode, const GLsizei *count, GLenum type, const void *const*indices, GLsizei primcount);
++#endif
++#endif /* GL_EXT_multi_draw_arrays */
++
++#ifndef GL_EXT_multisampled_render_to_texture
++#define GL_EXT_multisampled_render_to_texture 1
++#define GL_FRAMEBUFFER_ATTACHMENT_TEXTURE_SAMPLES_EXT 0x8D6C
++#define GL_RENDERBUFFER_SAMPLES_EXT       0x8CAB
++#define GL_FRAMEBUFFER_INCOMPLETE_MULTISAMPLE_EXT 0x8D56
++#define GL_MAX_SAMPLES_EXT                0x8D57
++typedef void (GL_APIENTRYP PFNGLRENDERBUFFERSTORAGEMULTISAMPLEEXTPROC) (GLenum target, GLsizei samples, GLenum internalformat, GLsizei width, GLsizei height);
++typedef void (GL_APIENTRYP PFNGLFRAMEBUFFERTEXTURE2DMULTISAMPLEEXTPROC) (GLenum target, GLenum attachment, GLenum textarget, GLuint texture, GLint level, GLsizei samples);
++#ifdef GL_GLEXT_PROTOTYPES
++GL_APICALL void GL_APIENTRY glRenderbufferStorageMultisampleEXT (GLenum target, GLsizei samples, GLenum internalformat, GLsizei width, GLsizei height);
++GL_APICALL void GL_APIENTRY glFramebufferTexture2DMultisampleEXT (GLenum target, GLenum attachment, GLenum textarget, GLuint texture, GLint level, GLsizei samples);
++#endif
++#endif /* GL_EXT_multisampled_render_to_texture */
++
++#ifndef GL_EXT_multiview_draw_buffers
++#define GL_EXT_multiview_draw_buffers 1
++#define GL_COLOR_ATTACHMENT_EXT           0x90F0
++#define GL_MULTIVIEW_EXT                  0x90F1
++#define GL_DRAW_BUFFER_EXT                0x0C01
++#define GL_READ_BUFFER_EXT                0x0C02
++#define GL_MAX_MULTIVIEW_BUFFERS_EXT      0x90F2
++typedef void (GL_APIENTRYP PFNGLREADBUFFERINDEXEDEXTPROC) (GLenum src, GLint index);
++typedef void (GL_APIENTRYP PFNGLDRAWBUFFERSINDEXEDEXTPROC) (GLint n, const GLenum *location, const GLint *indices);
++typedef void (GL_APIENTRYP PFNGLGETINTEGERI_VEXTPROC) (GLenum target, GLuint index, GLint *data);
++#ifdef GL_GLEXT_PROTOTYPES
++GL_APICALL void GL_APIENTRY glReadBufferIndexedEXT (GLenum src, GLint index);
++GL_APICALL void GL_APIENTRY glDrawBuffersIndexedEXT (GLint n, const GLenum *location, const GLint *indices);
++GL_APICALL void GL_APIENTRY glGetIntegeri_vEXT (GLenum target, GLuint index, GLint *data);
++#endif
++#endif /* GL_EXT_multiview_draw_buffers */
++
++#ifndef GL_EXT_occlusion_query_boolean
++#define GL_EXT_occlusion_query_boolean 1
++#define GL_ANY_SAMPLES_PASSED_EXT         0x8C2F
++#define GL_ANY_SAMPLES_PASSED_CONSERVATIVE_EXT 0x8D6A
++#endif /* GL_EXT_occlusion_query_boolean */
++
++#ifndef GL_EXT_pvrtc_sRGB
++#define GL_EXT_pvrtc_sRGB 1
++#define GL_COMPRESSED_SRGB_PVRTC_2BPPV1_EXT 0x8A54
++#define GL_COMPRESSED_SRGB_PVRTC_4BPPV1_EXT 0x8A55
++#define GL_COMPRESSED_SRGB_ALPHA_PVRTC_2BPPV1_EXT 0x8A56
++#define GL_COMPRESSED_SRGB_ALPHA_PVRTC_4BPPV1_EXT 0x8A57
++#endif /* GL_EXT_pvrtc_sRGB */
++
++#ifndef GL_EXT_read_format_bgra
++#define GL_EXT_read_format_bgra 1
++#define GL_UNSIGNED_SHORT_4_4_4_4_REV_EXT 0x8365
++#define GL_UNSIGNED_SHORT_1_5_5_5_REV_EXT 0x8366
++#endif /* GL_EXT_read_format_bgra */
++
++#ifndef GL_EXT_robustness
++#define GL_EXT_robustness 1
++#define GL_GUILTY_CONTEXT_RESET_EXT       0x8253
++#define GL_INNOCENT_CONTEXT_RESET_EXT     0x8254
++#define GL_UNKNOWN_CONTEXT_RESET_EXT      0x8255
++#define GL_CONTEXT_ROBUST_ACCESS_EXT      0x90F3
++#define GL_RESET_NOTIFICATION_STRATEGY_EXT 0x8256
++#define GL_LOSE_CONTEXT_ON_RESET_EXT      0x8252
++#define GL_NO_RESET_NOTIFICATION_EXT      0x8261
++typedef GLenum (GL_APIENTRYP PFNGLGETGRAPHICSRESETSTATUSEXTPROC) (void);
++typedef void (GL_APIENTRYP PFNGLREADNPIXELSEXTPROC) (GLint x, GLint y, GLsizei width, GLsizei height, GLenum format, GLenum type, GLsizei bufSize, void *data);
++typedef void (GL_APIENTRYP PFNGLGETNUNIFORMFVEXTPROC) (GLuint program, GLint location, GLsizei bufSize, GLfloat *params);
++typedef void (GL_APIENTRYP PFNGLGETNUNIFORMIVEXTPROC) (GLuint program, GLint location, GLsizei bufSize, GLint *params);
++#ifdef GL_GLEXT_PROTOTYPES
++GL_APICALL GLenum GL_APIENTRY glGetGraphicsResetStatusEXT (void);
++GL_APICALL void GL_APIENTRY glReadnPixelsEXT (GLint x, GLint y, GLsizei width, GLsizei height, GLenum format, GLenum type, GLsizei bufSize, void *data);
++GL_APICALL void GL_APIENTRY glGetnUniformfvEXT (GLuint program, GLint location, GLsizei bufSize, GLfloat *params);
++GL_APICALL void GL_APIENTRY glGetnUniformivEXT (GLuint program, GLint location, GLsizei bufSize, GLint *params);
++#endif
++#endif /* GL_EXT_robustness */
++
++#ifndef GL_EXT_sRGB
++#define GL_EXT_sRGB 1
++#define GL_SRGB_EXT                       0x8C40
++#define GL_SRGB_ALPHA_EXT                 0x8C42
++#define GL_SRGB8_ALPHA8_EXT               0x8C43
++#define GL_FRAMEBUFFER_ATTACHMENT_COLOR_ENCODING_EXT 0x8210
++#endif /* GL_EXT_sRGB */
++
++#ifndef GL_EXT_sRGB_write_control
++#define GL_EXT_sRGB_write_control 1
++#define GL_FRAMEBUFFER_SRGB_EXT           0x8DB9
++#endif /* GL_EXT_sRGB_write_control */
++
++#ifndef GL_EXT_separate_shader_objects
++#define GL_EXT_separate_shader_objects 1
++#define GL_ACTIVE_PROGRAM_EXT             0x8259
++#define GL_VERTEX_SHADER_BIT_EXT          0x00000001
++#define GL_FRAGMENT_SHADER_BIT_EXT        0x00000002
++#define GL_ALL_SHADER_BITS_EXT            0xFFFFFFFF
++#define GL_PROGRAM_SEPARABLE_EXT          0x8258
++#define GL_PROGRAM_PIPELINE_BINDING_EXT   0x825A
++typedef void (GL_APIENTRYP PFNGLACTIVESHADERPROGRAMEXTPROC) (GLuint pipeline, GLuint program);
++typedef void (GL_APIENTRYP PFNGLBINDPROGRAMPIPELINEEXTPROC) (GLuint pipeline);
++typedef GLuint (GL_APIENTRYP PFNGLCREATESHADERPROGRAMVEXTPROC) (GLenum type, GLsizei count, const GLchar **strings);
++typedef void (GL_APIENTRYP PFNGLDELETEPROGRAMPIPELINESEXTPROC) (GLsizei n, const GLuint *pipelines);
++typedef void (GL_APIENTRYP PFNGLGENPROGRAMPIPELINESEXTPROC) (GLsizei n, GLuint *pipelines);
++typedef void (GL_APIENTRYP PFNGLGETPROGRAMPIPELINEINFOLOGEXTPROC) (GLuint pipeline, GLsizei bufSize, GLsizei *length, GLchar *infoLog);
++typedef void (GL_APIENTRYP PFNGLGETPROGRAMPIPELINEIVEXTPROC) (GLuint pipeline, GLenum pname, GLint *params);
++typedef GLboolean (GL_APIENTRYP PFNGLISPROGRAMPIPELINEEXTPROC) (GLuint pipeline);
++typedef void (GL_APIENTRYP PFNGLPROGRAMPARAMETERIEXTPROC) (GLuint program, GLenum pname, GLint value);
++typedef void (GL_APIENTRYP PFNGLPROGRAMUNIFORM1FEXTPROC) (GLuint program, GLint location, GLfloat v0);
++typedef void (GL_APIENTRYP PFNGLPROGRAMUNIFORM1FVEXTPROC) (GLuint program, GLint location, GLsizei count, const GLfloat *value);
++typedef void (GL_APIENTRYP PFNGLPROGRAMUNIFORM1IEXTPROC) (GLuint program, GLint location, GLint v0);
++typedef void (GL_APIENTRYP PFNGLPROGRAMUNIFORM1IVEXTPROC) (GLuint program, GLint location, GLsizei count, const GLint *value);
++typedef void (GL_APIENTRYP PFNGLPROGRAMUNIFORM2FEXTPROC) (GLuint program, GLint location, GLfloat v0, GLfloat v1);
++typedef void (GL_APIENTRYP PFNGLPROGRAMUNIFORM2FVEXTPROC) (GLuint program, GLint location, GLsizei count, const GLfloat *value);
++typedef void (GL_APIENTRYP PFNGLPROGRAMUNIFORM2IEXTPROC) (GLuint program, GLint location, GLint v0, GLint v1);
++typedef void (GL_APIENTRYP PFNGLPROGRAMUNIFORM2IVEXTPROC) (GLuint program, GLint location, GLsizei count, const GLint *value);
++typedef void (GL_APIENTRYP PFNGLPROGRAMUNIFORM3FEXTPROC) (GLuint program, GLint location, GLfloat v0, GLfloat v1, GLfloat v2);
++typedef void (GL_APIENTRYP PFNGLPROGRAMUNIFORM3FVEXTPROC) (GLuint program, GLint location, GLsizei count, const GLfloat *value);
++typedef void (GL_APIENTRYP PFNGLPROGRAMUNIFORM3IEXTPROC) (GLuint program, GLint location, GLint v0, GLint v1, GLint v2);
++typedef void (GL_APIENTRYP PFNGLPROGRAMUNIFORM3IVEXTPROC) (GLuint program, GLint location, GLsizei count, const GLint *value);
++typedef void (GL_APIENTRYP PFNGLPROGRAMUNIFORM4FEXTPROC) (GLuint program, GLint location, GLfloat v0, GLfloat v1, GLfloat v2, GLfloat v3);
++typedef void (GL_APIENTRYP PFNGLPROGRAMUNIFORM4FVEXTPROC) (GLuint program, GLint location, GLsizei count, const GLfloat *value);
++typedef void (GL_APIENTRYP PFNGLPROGRAMUNIFORM4IEXTPROC) (GLuint program, GLint location, GLint v0, GLint v1, GLint v2, GLint v3);
++typedef void (GL_APIENTRYP PFNGLPROGRAMUNIFORM4IVEXTPROC) (GLuint program, GLint location, GLsizei count, const GLint *value);
++typedef void (GL_APIENTRYP PFNGLPROGRAMUNIFORMMATRIX2FVEXTPROC) (GLuint program, GLint location, GLsizei count, GLboolean transpose, const GLfloat *value);
++typedef void (GL_APIENTRYP PFNGLPROGRAMUNIFORMMATRIX3FVEXTPROC) (GLuint program, GLint location, GLsizei count, GLboolean transpose, const GLfloat *value);
++typedef void (GL_APIENTRYP PFNGLPROGRAMUNIFORMMATRIX4FVEXTPROC) (GLuint program, GLint location, GLsizei count, GLboolean transpose, const GLfloat *value);
++typedef void (GL_APIENTRYP PFNGLUSEPROGRAMSTAGESEXTPROC) (GLuint pipeline, GLbitfield stages, GLuint program);
++typedef void (GL_APIENTRYP PFNGLVALIDATEPROGRAMPIPELINEEXTPROC) (GLuint pipeline);
++typedef void (GL_APIENTRYP PFNGLPROGRAMUNIFORM1UIEXTPROC) (GLuint program, GLint location, GLuint v0);
++typedef void (GL_APIENTRYP PFNGLPROGRAMUNIFORM2UIEXTPROC) (GLuint program, GLint location, GLuint v0, GLuint v1);
++typedef void (GL_APIENTRYP PFNGLPROGRAMUNIFORM3UIEXTPROC) (GLuint program, GLint location, GLuint v0, GLuint v1, GLuint v2);
++typedef void (GL_APIENTRYP PFNGLPROGRAMUNIFORM4UIEXTPROC) (GLuint program, GLint location, GLuint v0, GLuint v1, GLuint v2, GLuint v3);
++typedef void (GL_APIENTRYP PFNGLPROGRAMUNIFORM1UIVEXTPROC) (GLuint program, GLint location, GLsizei count, const GLuint *value);
++typedef void (GL_APIENTRYP PFNGLPROGRAMUNIFORM2UIVEXTPROC) (GLuint program, GLint location, GLsizei count, const GLuint *value);
++typedef void (GL_APIENTRYP PFNGLPROGRAMUNIFORM3UIVEXTPROC) (GLuint program, GLint location, GLsizei count, const GLuint *value);
++typedef void (GL_APIENTRYP PFNGLPROGRAMUNIFORM4UIVEXTPROC) (GLuint program, GLint location, GLsizei count, const GLuint *value);
++typedef void (GL_APIENTRYP PFNGLPROGRAMUNIFORMMATRIX2X3FVEXTPROC) (GLuint program, GLint location, GLsizei count, GLboolean transpose, const GLfloat *value);
++typedef void (GL_APIENTRYP PFNGLPROGRAMUNIFORMMATRIX3X2FVEXTPROC) (GLuint program, GLint location, GLsizei count, GLboolean transpose, const GLfloat *value);
++typedef void (GL_APIENTRYP PFNGLPROGRAMUNIFORMMATRIX2X4FVEXTPROC) (GLuint program, GLint location, GLsizei count, GLboolean transpose, const GLfloat *value);
++typedef void (GL_APIENTRYP PFNGLPROGRAMUNIFORMMATRIX4X2FVEXTPROC) (GLuint program, GLint location, GLsizei count, GLboolean transpose, const GLfloat *value);
++typedef void (GL_APIENTRYP PFNGLPROGRAMUNIFORMMATRIX3X4FVEXTPROC) (GLuint program, GLint location, GLsizei count, GLboolean transpose, const GLfloat *value);
++typedef void (GL_APIENTRYP PFNGLPROGRAMUNIFORMMATRIX4X3FVEXTPROC) (GLuint program, GLint location, GLsizei count, GLboolean transpose, const GLfloat *value);
++#ifdef GL_GLEXT_PROTOTYPES
++GL_APICALL void GL_APIENTRY glActiveShaderProgramEXT (GLuint pipeline, GLuint program);
++GL_APICALL void GL_APIENTRY glBindProgramPipelineEXT (GLuint pipeline);
++GL_APICALL GLuint GL_APIENTRY glCreateShaderProgramvEXT (GLenum type, GLsizei count, const GLchar **strings);
++GL_APICALL void GL_APIENTRY glDeleteProgramPipelinesEXT (GLsizei n, const GLuint *pipelines);
++GL_APICALL void GL_APIENTRY glGenProgramPipelinesEXT (GLsizei n, GLuint *pipelines);
++GL_APICALL void GL_APIENTRY glGetProgramPipelineInfoLogEXT (GLuint pipeline, GLsizei bufSize, GLsizei *length, GLchar *infoLog);
++GL_APICALL void GL_APIENTRY glGetProgramPipelineivEXT (GLuint pipeline, GLenum pname, GLint *params);
++GL_APICALL GLboolean GL_APIENTRY glIsProgramPipelineEXT (GLuint pipeline);
++GL_APICALL void GL_APIENTRY glProgramParameteriEXT (GLuint program, GLenum pname, GLint value);
++GL_APICALL void GL_APIENTRY glProgramUniform1fEXT (GLuint program, GLint location, GLfloat v0);
++GL_APICALL void GL_APIENTRY glProgramUniform1fvEXT (GLuint program, GLint location, GLsizei count, const GLfloat *value);
++GL_APICALL void GL_APIENTRY glProgramUniform1iEXT (GLuint program, GLint location, GLint v0);
++GL_APICALL void GL_APIENTRY glProgramUniform1ivEXT (GLuint program, GLint location, GLsizei count, const GLint *value);
++GL_APICALL void GL_APIENTRY glProgramUniform2fEXT (GLuint program, GLint location, GLfloat v0, GLfloat v1);
++GL_APICALL void GL_APIENTRY glProgramUniform2fvEXT (GLuint program, GLint location, GLsizei count, const GLfloat *value);
++GL_APICALL void GL_APIENTRY glProgramUniform2iEXT (GLuint program, GLint location, GLint v0, GLint v1);
++GL_APICALL void GL_APIENTRY glProgramUniform2ivEXT (GLuint program, GLint location, GLsizei count, const GLint *value);
++GL_APICALL void GL_APIENTRY glProgramUniform3fEXT (GLuint program, GLint location, GLfloat v0, GLfloat v1, GLfloat v2);
++GL_APICALL void GL_APIENTRY glProgramUniform3fvEXT (GLuint program, GLint location, GLsizei count, const GLfloat *value);
++GL_APICALL void GL_APIENTRY glProgramUniform3iEXT (GLuint program, GLint location, GLint v0, GLint v1, GLint v2);
++GL_APICALL void GL_APIENTRY glProgramUniform3ivEXT (GLuint program, GLint location, GLsizei count, const GLint *value);
++GL_APICALL void GL_APIENTRY glProgramUniform4fEXT (GLuint program, GLint location, GLfloat v0, GLfloat v1, GLfloat v2, GLfloat v3);
++GL_APICALL void GL_APIENTRY glProgramUniform4fvEXT (GLuint program, GLint location, GLsizei count, const GLfloat *value);
++GL_APICALL void GL_APIENTRY glProgramUniform4iEXT (GLuint program, GLint location, GLint v0, GLint v1, GLint v2, GLint v3);
++GL_APICALL void GL_APIENTRY glProgramUniform4ivEXT (GLuint program, GLint location, GLsizei count, const GLint *value);
++GL_APICALL void GL_APIENTRY glProgramUniformMatrix2fvEXT (GLuint program, GLint location, GLsizei count, GLboolean transpose, const GLfloat *value);
++GL_APICALL void GL_APIENTRY glProgramUniformMatrix3fvEXT (GLuint program, GLint location, GLsizei count, GLboolean transpose, const GLfloat *value);
++GL_APICALL void GL_APIENTRY glProgramUniformMatrix4fvEXT (GLuint program, GLint location, GLsizei count, GLboolean transpose, const GLfloat *value);
++GL_APICALL void GL_APIENTRY glUseProgramStagesEXT (GLuint pipeline, GLbitfield stages, GLuint program);
++GL_APICALL void GL_APIENTRY glValidateProgramPipelineEXT (GLuint pipeline);
++GL_APICALL void GL_APIENTRY glProgramUniform1uiEXT (GLuint program, GLint location, GLuint v0);
++GL_APICALL void GL_APIENTRY glProgramUniform2uiEXT (GLuint program, GLint location, GLuint v0, GLuint v1);
++GL_APICALL void GL_APIENTRY glProgramUniform3uiEXT (GLuint program, GLint location, GLuint v0, GLuint v1, GLuint v2);
++GL_APICALL void GL_APIENTRY glProgramUniform4uiEXT (GLuint program, GLint location, GLuint v0, GLuint v1, GLuint v2, GLuint v3);
++GL_APICALL void GL_APIENTRY glProgramUniform1uivEXT (GLuint program, GLint location, GLsizei count, const GLuint *value);
++GL_APICALL void GL_APIENTRY glProgramUniform2uivEXT (GLuint program, GLint location, GLsizei count, const GLuint *value);
++GL_APICALL void GL_APIENTRY glProgramUniform3uivEXT (GLuint program, GLint location, GLsizei count, const GLuint *value);
++GL_APICALL void GL_APIENTRY glProgramUniform4uivEXT (GLuint program, GLint location, GLsizei count, const GLuint *value);
++GL_APICALL void GL_APIENTRY glProgramUniformMatrix2x3fvEXT (GLuint program, GLint location, GLsizei count, GLboolean transpose, const GLfloat *value);
++GL_APICALL void GL_APIENTRY glProgramUniformMatrix3x2fvEXT (GLuint program, GLint location, GLsizei count, GLboolean transpose, const GLfloat *value);
++GL_APICALL void GL_APIENTRY glProgramUniformMatrix2x4fvEXT (GLuint program, GLint location, GLsizei count, GLboolean transpose, const GLfloat *value);
++GL_APICALL void GL_APIENTRY glProgramUniformMatrix4x2fvEXT (GLuint program, GLint location, GLsizei count, GLboolean transpose, const GLfloat *value);
++GL_APICALL void GL_APIENTRY glProgramUniformMatrix3x4fvEXT (GLuint program, GLint location, GLsizei count, GLboolean transpose, const GLfloat *value);
++GL_APICALL void GL_APIENTRY glProgramUniformMatrix4x3fvEXT (GLuint program, GLint location, GLsizei count, GLboolean transpose, const GLfloat *value);
++#endif
++#endif /* GL_EXT_separate_shader_objects */
++
++#ifndef GL_EXT_shader_framebuffer_fetch
++#define GL_EXT_shader_framebuffer_fetch 1
++#define GL_FRAGMENT_SHADER_DISCARDS_SAMPLES_EXT 0x8A52
++#endif /* GL_EXT_shader_framebuffer_fetch */
++
++#ifndef GL_EXT_shader_integer_mix
++#define GL_EXT_shader_integer_mix 1
++#endif /* GL_EXT_shader_integer_mix */
++
++#ifndef GL_EXT_shader_texture_lod
++#define GL_EXT_shader_texture_lod 1
++#endif /* GL_EXT_shader_texture_lod */
++
++#ifndef GL_EXT_shadow_samplers
++#define GL_EXT_shadow_samplers 1
++#define GL_TEXTURE_COMPARE_MODE_EXT       0x884C
++#define GL_TEXTURE_COMPARE_FUNC_EXT       0x884D
++#define GL_COMPARE_REF_TO_TEXTURE_EXT     0x884E
++#define GL_SAMPLER_2D_SHADOW_EXT          0x8B62
++#endif /* GL_EXT_shadow_samplers */
++
++#ifndef GL_EXT_texture_compression_dxt1
++#define GL_EXT_texture_compression_dxt1 1
++#define GL_COMPRESSED_RGB_S3TC_DXT1_EXT   0x83F0
++#define GL_COMPRESSED_RGBA_S3TC_DXT1_EXT  0x83F1
++#endif /* GL_EXT_texture_compression_dxt1 */
++
++#ifndef GL_EXT_texture_compression_s3tc
++#define GL_EXT_texture_compression_s3tc 1
++#define GL_COMPRESSED_RGBA_S3TC_DXT3_EXT  0x83F2
++#define GL_COMPRESSED_RGBA_S3TC_DXT5_EXT  0x83F3
++#endif /* GL_EXT_texture_compression_s3tc */
++
++#ifndef GL_EXT_texture_filter_anisotropic
++#define GL_EXT_texture_filter_anisotropic 1
++#define GL_TEXTURE_MAX_ANISOTROPY_EXT     0x84FE
++#define GL_MAX_TEXTURE_MAX_ANISOTROPY_EXT 0x84FF
++#endif /* GL_EXT_texture_filter_anisotropic */
++
++#ifndef GL_EXT_texture_format_BGRA8888
++#define GL_EXT_texture_format_BGRA8888 1
++#endif /* GL_EXT_texture_format_BGRA8888 */
++
++#ifndef GL_EXT_texture_rg
++#define GL_EXT_texture_rg 1
++#define GL_RED_EXT                        0x1903
++#define GL_RG_EXT                         0x8227
++#define GL_R8_EXT                         0x8229
++#define GL_RG8_EXT                        0x822B
++#endif /* GL_EXT_texture_rg */
++
++#ifndef GL_EXT_texture_sRGB_decode
++#define GL_EXT_texture_sRGB_decode 1
++#define GL_TEXTURE_SRGB_DECODE_EXT        0x8A48
++#define GL_DECODE_EXT                     0x8A49
++#define GL_SKIP_DECODE_EXT                0x8A4A
++#endif /* GL_EXT_texture_sRGB_decode */
++
++#ifndef GL_EXT_texture_storage
++#define GL_EXT_texture_storage 1
++#define GL_TEXTURE_IMMUTABLE_FORMAT_EXT   0x912F
++#define GL_ALPHA8_EXT                     0x803C
++#define GL_LUMINANCE8_EXT                 0x8040
++#define GL_LUMINANCE8_ALPHA8_EXT          0x8045
++#define GL_RGBA32F_EXT                    0x8814
++#define GL_RGB32F_EXT                     0x8815
++#define GL_ALPHA32F_EXT                   0x8816
++#define GL_LUMINANCE32F_EXT               0x8818
++#define GL_LUMINANCE_ALPHA32F_EXT         0x8819
++#define GL_ALPHA16F_EXT                   0x881C
++#define GL_LUMINANCE16F_EXT               0x881E
++#define GL_LUMINANCE_ALPHA16F_EXT         0x881F
++#define GL_R32F_EXT                       0x822E
++#define GL_RG32F_EXT                      0x8230
++typedef void (GL_APIENTRYP PFNGLTEXSTORAGE1DEXTPROC) (GLenum target, GLsizei levels, GLenum internalformat, GLsizei width);
++typedef void (GL_APIENTRYP PFNGLTEXSTORAGE2DEXTPROC) (GLenum target, GLsizei levels, GLenum internalformat, GLsizei width, GLsizei height);
++typedef void (GL_APIENTRYP PFNGLTEXSTORAGE3DEXTPROC) (GLenum target, GLsizei levels, GLenum internalformat, GLsizei width, GLsizei height, GLsizei depth);
++typedef void (GL_APIENTRYP PFNGLTEXTURESTORAGE1DEXTPROC) (GLuint texture, GLenum target, GLsizei levels, GLenum internalformat, GLsizei width);
++typedef void (GL_APIENTRYP PFNGLTEXTURESTORAGE2DEXTPROC) (GLuint texture, GLenum target, GLsizei levels, GLenum internalformat, GLsizei width, GLsizei height);
++typedef void (GL_APIENTRYP PFNGLTEXTURESTORAGE3DEXTPROC) (GLuint texture, GLenum target, GLsizei levels, GLenum internalformat, GLsizei width, GLsizei height, GLsizei depth);
++#ifdef GL_GLEXT_PROTOTYPES
++GL_APICALL void GL_APIENTRY glTexStorage1DEXT (GLenum target, GLsizei levels, GLenum internalformat, GLsizei width);
++GL_APICALL void GL_APIENTRY glTexStorage2DEXT (GLenum target, GLsizei levels, GLenum internalformat, GLsizei width, GLsizei height);
++GL_APICALL void GL_APIENTRY glTexStorage3DEXT (GLenum target, GLsizei levels, GLenum internalformat, GLsizei width, GLsizei height, GLsizei depth);
++GL_APICALL void GL_APIENTRY glTextureStorage1DEXT (GLuint texture, GLenum target, GLsizei levels, GLenum internalformat, GLsizei width);
++GL_APICALL void GL_APIENTRY glTextureStorage2DEXT (GLuint texture, GLenum target, GLsizei levels, GLenum internalformat, GLsizei width, GLsizei height);
++GL_APICALL void GL_APIENTRY glTextureStorage3DEXT (GLuint texture, GLenum target, GLsizei levels, GLenum internalformat, GLsizei width, GLsizei height, GLsizei depth);
++#endif
++#endif /* GL_EXT_texture_storage */
++
++#ifndef GL_EXT_texture_type_2_10_10_10_REV
++#define GL_EXT_texture_type_2_10_10_10_REV 1
++#define GL_UNSIGNED_INT_2_10_10_10_REV_EXT 0x8368
++#endif /* GL_EXT_texture_type_2_10_10_10_REV */
++
++#ifndef GL_EXT_unpack_subimage
++#define GL_EXT_unpack_subimage 1
++#define GL_UNPACK_ROW_LENGTH_EXT          0x0CF2
++#define GL_UNPACK_SKIP_ROWS_EXT           0x0CF3
++#define GL_UNPACK_SKIP_PIXELS_EXT         0x0CF4
++#endif /* GL_EXT_unpack_subimage */
++
++#ifndef GL_FJ_shader_binary_GCCSO
++#define GL_FJ_shader_binary_GCCSO 1
++#define GL_GCCSO_SHADER_BINARY_FJ         0x9260
++#endif /* GL_FJ_shader_binary_GCCSO */
++
++#ifndef GL_IMG_multisampled_render_to_texture
++#define GL_IMG_multisampled_render_to_texture 1
++#define GL_RENDERBUFFER_SAMPLES_IMG       0x9133
++#define GL_FRAMEBUFFER_INCOMPLETE_MULTISAMPLE_IMG 0x9134
++#define GL_MAX_SAMPLES_IMG                0x9135
++#define GL_TEXTURE_SAMPLES_IMG            0x9136
++typedef void (GL_APIENTRYP PFNGLRENDERBUFFERSTORAGEMULTISAMPLEIMGPROC) (GLenum target, GLsizei samples, GLenum internalformat, GLsizei width, GLsizei height);
++typedef void (GL_APIENTRYP PFNGLFRAMEBUFFERTEXTURE2DMULTISAMPLEIMGPROC) (GLenum target, GLenum attachment, GLenum textarget, GLuint texture, GLint level, GLsizei samples);
++#ifdef GL_GLEXT_PROTOTYPES
++GL_APICALL void GL_APIENTRY glRenderbufferStorageMultisampleIMG (GLenum target, GLsizei samples, GLenum internalformat, GLsizei width, GLsizei height);
++GL_APICALL void GL_APIENTRY glFramebufferTexture2DMultisampleIMG (GLenum target, GLenum attachment, GLenum textarget, GLuint texture, GLint level, GLsizei samples);
++#endif
++#endif /* GL_IMG_multisampled_render_to_texture */
++
++#ifndef GL_IMG_program_binary
++#define GL_IMG_program_binary 1
++#define GL_SGX_PROGRAM_BINARY_IMG         0x9130
++#endif /* GL_IMG_program_binary */
++
++#ifndef GL_IMG_read_format
++#define GL_IMG_read_format 1
++#define GL_BGRA_IMG                       0x80E1
++#define GL_UNSIGNED_SHORT_4_4_4_4_REV_IMG 0x8365
++#endif /* GL_IMG_read_format */
++
++#ifndef GL_IMG_shader_binary
++#define GL_IMG_shader_binary 1
++#define GL_SGX_BINARY_IMG                 0x8C0A
++#endif /* GL_IMG_shader_binary */
++
++#ifndef GL_IMG_texture_compression_pvrtc
++#define GL_IMG_texture_compression_pvrtc 1
++#define GL_COMPRESSED_RGB_PVRTC_4BPPV1_IMG 0x8C00
++#define GL_COMPRESSED_RGB_PVRTC_2BPPV1_IMG 0x8C01
++#define GL_COMPRESSED_RGBA_PVRTC_4BPPV1_IMG 0x8C02
++#define GL_COMPRESSED_RGBA_PVRTC_2BPPV1_IMG 0x8C03
++#endif /* GL_IMG_texture_compression_pvrtc */
++
++#ifndef GL_IMG_texture_compression_pvrtc2
++#define GL_IMG_texture_compression_pvrtc2 1
++#define GL_COMPRESSED_RGBA_PVRTC_2BPPV2_IMG 0x9137
++#define GL_COMPRESSED_RGBA_PVRTC_4BPPV2_IMG 0x9138
++#endif /* GL_IMG_texture_compression_pvrtc2 */
++
++#ifndef GL_NV_copy_buffer
++#define GL_NV_copy_buffer 1
++#define GL_COPY_READ_BUFFER_NV            0x8F36
++#define GL_COPY_WRITE_BUFFER_NV           0x8F37
++typedef void (GL_APIENTRYP PFNGLCOPYBUFFERSUBDATANVPROC) (GLenum readTarget, GLenum writeTarget, GLintptr readOffset, GLintptr writeOffset, GLsizeiptr size);
++#ifdef GL_GLEXT_PROTOTYPES
++GL_APICALL void GL_APIENTRY glCopyBufferSubDataNV (GLenum readTarget, GLenum writeTarget, GLintptr readOffset, GLintptr writeOffset, GLsizeiptr size);
++#endif
++#endif /* GL_NV_copy_buffer */
++
++#ifndef GL_NV_coverage_sample
++#define GL_NV_coverage_sample 1
++#define GL_COVERAGE_COMPONENT_NV          0x8ED0
++#define GL_COVERAGE_COMPONENT4_NV         0x8ED1
++#define GL_COVERAGE_ATTACHMENT_NV         0x8ED2
++#define GL_COVERAGE_BUFFERS_NV            0x8ED3
++#define GL_COVERAGE_SAMPLES_NV            0x8ED4
++#define GL_COVERAGE_ALL_FRAGMENTS_NV      0x8ED5
++#define GL_COVERAGE_EDGE_FRAGMENTS_NV     0x8ED6
++#define GL_COVERAGE_AUTOMATIC_NV          0x8ED7
++#define GL_COVERAGE_BUFFER_BIT_NV         0x00008000
++typedef void (GL_APIENTRYP PFNGLCOVERAGEMASKNVPROC) (GLboolean mask);
++typedef void (GL_APIENTRYP PFNGLCOVERAGEOPERATIONNVPROC) (GLenum operation);
++#ifdef GL_GLEXT_PROTOTYPES
++GL_APICALL void GL_APIENTRY glCoverageMaskNV (GLboolean mask);
++GL_APICALL void GL_APIENTRY glCoverageOperationNV (GLenum operation);
++#endif
++#endif /* GL_NV_coverage_sample */
++
++#ifndef GL_NV_depth_nonlinear
++#define GL_NV_depth_nonlinear 1
++#define GL_DEPTH_COMPONENT16_NONLINEAR_NV 0x8E2C
++#endif /* GL_NV_depth_nonlinear */
++
++#ifndef GL_NV_draw_buffers
++#define GL_NV_draw_buffers 1
++#define GL_MAX_DRAW_BUFFERS_NV            0x8824
++#define GL_DRAW_BUFFER0_NV                0x8825
++#define GL_DRAW_BUFFER1_NV                0x8826
++#define GL_DRAW_BUFFER2_NV                0x8827
++#define GL_DRAW_BUFFER3_NV                0x8828
++#define GL_DRAW_BUFFER4_NV                0x8829
++#define GL_DRAW_BUFFER5_NV                0x882A
++#define GL_DRAW_BUFFER6_NV                0x882B
++#define GL_DRAW_BUFFER7_NV                0x882C
++#define GL_DRAW_BUFFER8_NV                0x882D
++#define GL_DRAW_BUFFER9_NV                0x882E
++#define GL_DRAW_BUFFER10_NV               0x882F
++#define GL_DRAW_BUFFER11_NV               0x8830
++#define GL_DRAW_BUFFER12_NV               0x8831
++#define GL_DRAW_BUFFER13_NV               0x8832
++#define GL_DRAW_BUFFER14_NV               0x8833
++#define GL_DRAW_BUFFER15_NV               0x8834
++#define GL_COLOR_ATTACHMENT0_NV           0x8CE0
++#define GL_COLOR_ATTACHMENT1_NV           0x8CE1
++#define GL_COLOR_ATTACHMENT2_NV           0x8CE2
++#define GL_COLOR_ATTACHMENT3_NV           0x8CE3
++#define GL_COLOR_ATTACHMENT4_NV           0x8CE4
++#define GL_COLOR_ATTACHMENT5_NV           0x8CE5
++#define GL_COLOR_ATTACHMENT6_NV           0x8CE6
++#define GL_COLOR_ATTACHMENT7_NV           0x8CE7
++#define GL_COLOR_ATTACHMENT8_NV           0x8CE8
++#define GL_COLOR_ATTACHMENT9_NV           0x8CE9
++#define GL_COLOR_ATTACHMENT10_NV          0x8CEA
++#define GL_COLOR_ATTACHMENT11_NV          0x8CEB
++#define GL_COLOR_ATTACHMENT12_NV          0x8CEC
++#define GL_COLOR_ATTACHMENT13_NV          0x8CED
++#define GL_COLOR_ATTACHMENT14_NV          0x8CEE
++#define GL_COLOR_ATTACHMENT15_NV          0x8CEF
++typedef void (GL_APIENTRYP PFNGLDRAWBUFFERSNVPROC) (GLsizei n, const GLenum *bufs);
++#ifdef GL_GLEXT_PROTOTYPES
++GL_APICALL void GL_APIENTRY glDrawBuffersNV (GLsizei n, const GLenum *bufs);
++#endif
++#endif /* GL_NV_draw_buffers */
++
++#ifndef GL_NV_draw_instanced
++#define GL_NV_draw_instanced 1
++typedef void (GL_APIENTRYP PFNGLDRAWARRAYSINSTANCEDNVPROC) (GLenum mode, GLint first, GLsizei count, GLsizei primcount);
++typedef void (GL_APIENTRYP PFNGLDRAWELEMENTSINSTANCEDNVPROC) (GLenum mode, GLsizei count, GLenum type, const void *indices, GLsizei primcount);
++#ifdef GL_GLEXT_PROTOTYPES
++GL_APICALL void GL_APIENTRY glDrawArraysInstancedNV (GLenum mode, GLint first, GLsizei count, GLsizei primcount);
++GL_APICALL void GL_APIENTRY glDrawElementsInstancedNV (GLenum mode, GLsizei count, GLenum type, const void *indices, GLsizei primcount);
++#endif
++#endif /* GL_NV_draw_instanced */
++
++#ifndef GL_NV_explicit_attrib_location
++#define GL_NV_explicit_attrib_location 1
++#endif /* GL_NV_explicit_attrib_location */
++
++#ifndef GL_NV_fbo_color_attachments
++#define GL_NV_fbo_color_attachments 1
++#define GL_MAX_COLOR_ATTACHMENTS_NV       0x8CDF
++#endif /* GL_NV_fbo_color_attachments */
++
++#ifndef GL_NV_fence
++#define GL_NV_fence 1
++#define GL_ALL_COMPLETED_NV               0x84F2
++#define GL_FENCE_STATUS_NV                0x84F3
++#define GL_FENCE_CONDITION_NV             0x84F4
++typedef void (GL_APIENTRYP PFNGLDELETEFENCESNVPROC) (GLsizei n, const GLuint *fences);
++typedef void (GL_APIENTRYP PFNGLGENFENCESNVPROC) (GLsizei n, GLuint *fences);
++typedef GLboolean (GL_APIENTRYP PFNGLISFENCENVPROC) (GLuint fence);
++typedef GLboolean (GL_APIENTRYP PFNGLTESTFENCENVPROC) (GLuint fence);
++typedef void (GL_APIENTRYP PFNGLGETFENCEIVNVPROC) (GLuint fence, GLenum pname, GLint *params);
++typedef void (GL_APIENTRYP PFNGLFINISHFENCENVPROC) (GLuint fence);
++typedef void (GL_APIENTRYP PFNGLSETFENCENVPROC) (GLuint fence, GLenum condition);
++#ifdef GL_GLEXT_PROTOTYPES
++GL_APICALL void GL_APIENTRY glDeleteFencesNV (GLsizei n, const GLuint *fences);
++GL_APICALL void GL_APIENTRY glGenFencesNV (GLsizei n, GLuint *fences);
++GL_APICALL GLboolean GL_APIENTRY glIsFenceNV (GLuint fence);
++GL_APICALL GLboolean GL_APIENTRY glTestFenceNV (GLuint fence);
++GL_APICALL void GL_APIENTRY glGetFenceivNV (GLuint fence, GLenum pname, GLint *params);
++GL_APICALL void GL_APIENTRY glFinishFenceNV (GLuint fence);
++GL_APICALL void GL_APIENTRY glSetFenceNV (GLuint fence, GLenum condition);
++#endif
++#endif /* GL_NV_fence */
++
++#ifndef GL_NV_framebuffer_blit
++#define GL_NV_framebuffer_blit 1
++#define GL_READ_FRAMEBUFFER_NV            0x8CA8
++#define GL_DRAW_FRAMEBUFFER_NV            0x8CA9
++#define GL_DRAW_FRAMEBUFFER_BINDING_NV    0x8CA6
++#define GL_READ_FRAMEBUFFER_BINDING_NV    0x8CAA
++typedef void (GL_APIENTRYP PFNGLBLITFRAMEBUFFERNVPROC) (GLint srcX0, GLint srcY0, GLint srcX1, GLint srcY1, GLint dstX0, GLint dstY0, GLint dstX1, GLint dstY1, GLbitfield mask, GLenum filter);
++#ifdef GL_GLEXT_PROTOTYPES
++GL_APICALL void GL_APIENTRY glBlitFramebufferNV (GLint srcX0, GLint srcY0, GLint srcX1, GLint srcY1, GLint dstX0, GLint dstY0, GLint dstX1, GLint dstY1, GLbitfield mask, GLenum filter);
++#endif
++#endif /* GL_NV_framebuffer_blit */
++
++#ifndef GL_NV_framebuffer_multisample
++#define GL_NV_framebuffer_multisample 1
++#define GL_RENDERBUFFER_SAMPLES_NV        0x8CAB
++#define GL_FRAMEBUFFER_INCOMPLETE_MULTISAMPLE_NV 0x8D56
++#define GL_MAX_SAMPLES_NV                 0x8D57
++typedef void (GL_APIENTRYP PFNGLRENDERBUFFERSTORAGEMULTISAMPLENVPROC) (GLenum target, GLsizei samples, GLenum internalformat, GLsizei width, GLsizei height);
++#ifdef GL_GLEXT_PROTOTYPES
++GL_APICALL void GL_APIENTRY glRenderbufferStorageMultisampleNV (GLenum target, GLsizei samples, GLenum internalformat, GLsizei width, GLsizei height);
++#endif
++#endif /* GL_NV_framebuffer_multisample */
++
++#ifndef GL_NV_generate_mipmap_sRGB
++#define GL_NV_generate_mipmap_sRGB 1
++#endif /* GL_NV_generate_mipmap_sRGB */
++
++#ifndef GL_NV_instanced_arrays
++#define GL_NV_instanced_arrays 1
++#define GL_VERTEX_ATTRIB_ARRAY_DIVISOR_NV 0x88FE
++typedef void (GL_APIENTRYP PFNGLVERTEXATTRIBDIVISORNVPROC) (GLuint index, GLuint divisor);
++#ifdef GL_GLEXT_PROTOTYPES
++GL_APICALL void GL_APIENTRY glVertexAttribDivisorNV (GLuint index, GLuint divisor);
++#endif
++#endif /* GL_NV_instanced_arrays */
++
++#ifndef GL_NV_non_square_matrices
++#define GL_NV_non_square_matrices 1
++#define GL_FLOAT_MAT2x3_NV                0x8B65
++#define GL_FLOAT_MAT2x4_NV                0x8B66
++#define GL_FLOAT_MAT3x2_NV                0x8B67
++#define GL_FLOAT_MAT3x4_NV                0x8B68
++#define GL_FLOAT_MAT4x2_NV                0x8B69
++#define GL_FLOAT_MAT4x3_NV                0x8B6A
++typedef void (GL_APIENTRYP PFNGLUNIFORMMATRIX2X3FVNVPROC) (GLint location, GLsizei count, GLboolean transpose, const GLfloat *value);
++typedef void (GL_APIENTRYP PFNGLUNIFORMMATRIX3X2FVNVPROC) (GLint location, GLsizei count, GLboolean transpose, const GLfloat *value);
++typedef void (GL_APIENTRYP PFNGLUNIFORMMATRIX2X4FVNVPROC) (GLint location, GLsizei count, GLboolean transpose, const GLfloat *value);
++typedef void (GL_APIENTRYP PFNGLUNIFORMMATRIX4X2FVNVPROC) (GLint location, GLsizei count, GLboolean transpose, const GLfloat *value);
++typedef void (GL_APIENTRYP PFNGLUNIFORMMATRIX3X4FVNVPROC) (GLint location, GLsizei count, GLboolean transpose, const GLfloat *value);
++typedef void (GL_APIENTRYP PFNGLUNIFORMMATRIX4X3FVNVPROC) (GLint location, GLsizei count, GLboolean transpose, const GLfloat *value);
++#ifdef GL_GLEXT_PROTOTYPES
++GL_APICALL void GL_APIENTRY glUniformMatrix2x3fvNV (GLint location, GLsizei count, GLboolean transpose, const GLfloat *value);
++GL_APICALL void GL_APIENTRY glUniformMatrix3x2fvNV (GLint location, GLsizei count, GLboolean transpose, const GLfloat *value);
++GL_APICALL void GL_APIENTRY glUniformMatrix2x4fvNV (GLint location, GLsizei count, GLboolean transpose, const GLfloat *value);
++GL_APICALL void GL_APIENTRY glUniformMatrix4x2fvNV (GLint location, GLsizei count, GLboolean transpose, const GLfloat *value);
++GL_APICALL void GL_APIENTRY glUniformMatrix3x4fvNV (GLint location, GLsizei count, GLboolean transpose, const GLfloat *value);
++GL_APICALL void GL_APIENTRY glUniformMatrix4x3fvNV (GLint location, GLsizei count, GLboolean transpose, const GLfloat *value);
++#endif
++#endif /* GL_NV_non_square_matrices */
++
++#ifndef GL_NV_read_buffer
++#define GL_NV_read_buffer 1
++#define GL_READ_BUFFER_NV                 0x0C02
++typedef void (GL_APIENTRYP PFNGLREADBUFFERNVPROC) (GLenum mode);
++#ifdef GL_GLEXT_PROTOTYPES
++GL_APICALL void GL_APIENTRY glReadBufferNV (GLenum mode);
++#endif
++#endif /* GL_NV_read_buffer */
++
++#ifndef GL_NV_read_buffer_front
++#define GL_NV_read_buffer_front 1
++#endif /* GL_NV_read_buffer_front */
++
++#ifndef GL_NV_read_depth
++#define GL_NV_read_depth 1
++#endif /* GL_NV_read_depth */
++
++#ifndef GL_NV_read_depth_stencil
++#define GL_NV_read_depth_stencil 1
++#endif /* GL_NV_read_depth_stencil */
++
++#ifndef GL_NV_read_stencil
++#define GL_NV_read_stencil 1
++#endif /* GL_NV_read_stencil */
++
++#ifndef GL_NV_sRGB_formats
++#define GL_NV_sRGB_formats 1
++#define GL_SLUMINANCE_NV                  0x8C46
++#define GL_SLUMINANCE_ALPHA_NV            0x8C44
++#define GL_SRGB8_NV                       0x8C41
++#define GL_SLUMINANCE8_NV                 0x8C47
++#define GL_SLUMINANCE8_ALPHA8_NV          0x8C45
++#define GL_COMPRESSED_SRGB_S3TC_DXT1_NV   0x8C4C
++#define GL_COMPRESSED_SRGB_ALPHA_S3TC_DXT1_NV 0x8C4D
++#define GL_COMPRESSED_SRGB_ALPHA_S3TC_DXT3_NV 0x8C4E
++#define GL_COMPRESSED_SRGB_ALPHA_S3TC_DXT5_NV 0x8C4F
++#define GL_ETC1_SRGB8_NV                  0x88EE
++#endif /* GL_NV_sRGB_formats */
++
++#ifndef GL_NV_shadow_samplers_array
++#define GL_NV_shadow_samplers_array 1
++#define GL_SAMPLER_2D_ARRAY_SHADOW_NV     0x8DC4
++#endif /* GL_NV_shadow_samplers_array */
++
++#ifndef GL_NV_shadow_samplers_cube
++#define GL_NV_shadow_samplers_cube 1
++#define GL_SAMPLER_CUBE_SHADOW_NV         0x8DC5
++#endif /* GL_NV_shadow_samplers_cube */
++
++#ifndef GL_NV_texture_border_clamp
++#define GL_NV_texture_border_clamp 1
++#define GL_TEXTURE_BORDER_COLOR_NV        0x1004
++#define GL_CLAMP_TO_BORDER_NV             0x812D
++#endif /* GL_NV_texture_border_clamp */
++
++#ifndef GL_NV_texture_compression_s3tc_update
++#define GL_NV_texture_compression_s3tc_update 1
++#endif /* GL_NV_texture_compression_s3tc_update */
++
++#ifndef GL_NV_texture_npot_2D_mipmap
++#define GL_NV_texture_npot_2D_mipmap 1
++#endif /* GL_NV_texture_npot_2D_mipmap */
++
++#ifndef GL_QCOM_alpha_test
++#define GL_QCOM_alpha_test 1
++#define GL_ALPHA_TEST_QCOM                0x0BC0
++#define GL_ALPHA_TEST_FUNC_QCOM           0x0BC1
++#define GL_ALPHA_TEST_REF_QCOM            0x0BC2
++typedef void (GL_APIENTRYP PFNGLALPHAFUNCQCOMPROC) (GLenum func, GLclampf ref);
++#ifdef GL_GLEXT_PROTOTYPES
++GL_APICALL void GL_APIENTRY glAlphaFuncQCOM (GLenum func, GLclampf ref);
++#endif
++#endif /* GL_QCOM_alpha_test */
++
++#ifndef GL_QCOM_binning_control
++#define GL_QCOM_binning_control 1
++#define GL_BINNING_CONTROL_HINT_QCOM      0x8FB0
++#define GL_CPU_OPTIMIZED_QCOM             0x8FB1
++#define GL_GPU_OPTIMIZED_QCOM             0x8FB2
++#define GL_RENDER_DIRECT_TO_FRAMEBUFFER_QCOM 0x8FB3
++#endif /* GL_QCOM_binning_control */
++
++#ifndef GL_QCOM_driver_control
++#define GL_QCOM_driver_control 1
++typedef void (GL_APIENTRYP PFNGLGETDRIVERCONTROLSQCOMPROC) (GLint *num, GLsizei size, GLuint *driverControls);
++typedef void (GL_APIENTRYP PFNGLGETDRIVERCONTROLSTRINGQCOMPROC) (GLuint driverControl, GLsizei bufSize, GLsizei *length, GLchar *driverControlString);
++typedef void (GL_APIENTRYP PFNGLENABLEDRIVERCONTROLQCOMPROC) (GLuint driverControl);
++typedef void (GL_APIENTRYP PFNGLDISABLEDRIVERCONTROLQCOMPROC) (GLuint driverControl);
++#ifdef GL_GLEXT_PROTOTYPES
++GL_APICALL void GL_APIENTRY glGetDriverControlsQCOM (GLint *num, GLsizei size, GLuint *driverControls);
++GL_APICALL void GL_APIENTRY glGetDriverControlStringQCOM (GLuint driverControl, GLsizei bufSize, GLsizei *length, GLchar *driverControlString);
++GL_APICALL void GL_APIENTRY glEnableDriverControlQCOM (GLuint driverControl);
++GL_APICALL void GL_APIENTRY glDisableDriverControlQCOM (GLuint driverControl);
++#endif
++#endif /* GL_QCOM_driver_control */
++
++#ifndef GL_QCOM_extended_get
++#define GL_QCOM_extended_get 1
++#define GL_TEXTURE_WIDTH_QCOM             0x8BD2
++#define GL_TEXTURE_HEIGHT_QCOM            0x8BD3
++#define GL_TEXTURE_DEPTH_QCOM             0x8BD4
++#define GL_TEXTURE_INTERNAL_FORMAT_QCOM   0x8BD5
++#define GL_TEXTURE_FORMAT_QCOM            0x8BD6
++#define GL_TEXTURE_TYPE_QCOM              0x8BD7
++#define GL_TEXTURE_IMAGE_VALID_QCOM       0x8BD8
++#define GL_TEXTURE_NUM_LEVELS_QCOM        0x8BD9
++#define GL_TEXTURE_TARGET_QCOM            0x8BDA
++#define GL_TEXTURE_OBJECT_VALID_QCOM      0x8BDB
++#define GL_STATE_RESTORE                  0x8BDC
++typedef void (GL_APIENTRYP PFNGLEXTGETTEXTURESQCOMPROC) (GLuint *textures, GLint maxTextures, GLint *numTextures);
++typedef void (GL_APIENTRYP PFNGLEXTGETBUFFERSQCOMPROC) (GLuint *buffers, GLint maxBuffers, GLint *numBuffers);
++typedef void (GL_APIENTRYP PFNGLEXTGETRENDERBUFFERSQCOMPROC) (GLuint *renderbuffers, GLint maxRenderbuffers, GLint *numRenderbuffers);
++typedef void (GL_APIENTRYP PFNGLEXTGETFRAMEBUFFERSQCOMPROC) (GLuint *framebuffers, GLint maxFramebuffers, GLint *numFramebuffers);
++typedef void (GL_APIENTRYP PFNGLEXTGETTEXLEVELPARAMETERIVQCOMPROC) (GLuint texture, GLenum face, GLint level, GLenum pname, GLint *params);
++typedef void (GL_APIENTRYP PFNGLEXTTEXOBJECTSTATEOVERRIDEIQCOMPROC) (GLenum target, GLenum pname, GLint param);
++typedef void (GL_APIENTRYP PFNGLEXTGETTEXSUBIMAGEQCOMPROC) (GLenum target, GLint level, GLint xoffset, GLint yoffset, GLint zoffset, GLsizei width, GLsizei height, GLsizei depth, GLenum format, GLenum type, void *texels);
++typedef void (GL_APIENTRYP PFNGLEXTGETBUFFERPOINTERVQCOMPROC) (GLenum target, void **params);
++#ifdef GL_GLEXT_PROTOTYPES
++GL_APICALL void GL_APIENTRY glExtGetTexturesQCOM (GLuint *textures, GLint maxTextures, GLint *numTextures);
++GL_APICALL void GL_APIENTRY glExtGetBuffersQCOM (GLuint *buffers, GLint maxBuffers, GLint *numBuffers);
++GL_APICALL void GL_APIENTRY glExtGetRenderbuffersQCOM (GLuint *renderbuffers, GLint maxRenderbuffers, GLint *numRenderbuffers);
++GL_APICALL void GL_APIENTRY glExtGetFramebuffersQCOM (GLuint *framebuffers, GLint maxFramebuffers, GLint *numFramebuffers);
++GL_APICALL void GL_APIENTRY glExtGetTexLevelParameterivQCOM (GLuint texture, GLenum face, GLint level, GLenum pname, GLint *params);
++GL_APICALL void GL_APIENTRY glExtTexObjectStateOverrideiQCOM (GLenum target, GLenum pname, GLint param);
++GL_APICALL void GL_APIENTRY glExtGetTexSubImageQCOM (GLenum target, GLint level, GLint xoffset, GLint yoffset, GLint zoffset, GLsizei width, GLsizei height, GLsizei depth, GLenum format, GLenum type, void *texels);
++GL_APICALL void GL_APIENTRY glExtGetBufferPointervQCOM (GLenum target, void **params);
++#endif
++#endif /* GL_QCOM_extended_get */
++
++#ifndef GL_QCOM_extended_get2
++#define GL_QCOM_extended_get2 1
++typedef void (GL_APIENTRYP PFNGLEXTGETSHADERSQCOMPROC) (GLuint *shaders, GLint maxShaders, GLint *numShaders);
++typedef void (GL_APIENTRYP PFNGLEXTGETPROGRAMSQCOMPROC) (GLuint *programs, GLint maxPrograms, GLint *numPrograms);
++typedef GLboolean (GL_APIENTRYP PFNGLEXTISPROGRAMBINARYQCOMPROC) (GLuint program);
++typedef void (GL_APIENTRYP PFNGLEXTGETPROGRAMBINARYSOURCEQCOMPROC) (GLuint program, GLenum shadertype, GLchar *source, GLint *length);
++#ifdef GL_GLEXT_PROTOTYPES
++GL_APICALL void GL_APIENTRY glExtGetShadersQCOM (GLuint *shaders, GLint maxShaders, GLint *numShaders);
++GL_APICALL void GL_APIENTRY glExtGetProgramsQCOM (GLuint *programs, GLint maxPrograms, GLint *numPrograms);
++GL_APICALL GLboolean GL_APIENTRY glExtIsProgramBinaryQCOM (GLuint program);
++GL_APICALL void GL_APIENTRY glExtGetProgramBinarySourceQCOM (GLuint program, GLenum shadertype, GLchar *source, GLint *length);
++#endif
++#endif /* GL_QCOM_extended_get2 */
++
++#ifndef GL_QCOM_perfmon_global_mode
++#define GL_QCOM_perfmon_global_mode 1
++#define GL_PERFMON_GLOBAL_MODE_QCOM       0x8FA0
++#endif /* GL_QCOM_perfmon_global_mode */
++
++#ifndef GL_QCOM_tiled_rendering
++#define GL_QCOM_tiled_rendering 1
++#define GL_COLOR_BUFFER_BIT0_QCOM         0x00000001
++#define GL_COLOR_BUFFER_BIT1_QCOM         0x00000002
++#define GL_COLOR_BUFFER_BIT2_QCOM         0x00000004
++#define GL_COLOR_BUFFER_BIT3_QCOM         0x00000008
++#define GL_COLOR_BUFFER_BIT4_QCOM         0x00000010
++#define GL_COLOR_BUFFER_BIT5_QCOM         0x00000020
++#define GL_COLOR_BUFFER_BIT6_QCOM         0x00000040
++#define GL_COLOR_BUFFER_BIT7_QCOM         0x00000080
++#define GL_DEPTH_BUFFER_BIT0_QCOM         0x00000100
++#define GL_DEPTH_BUFFER_BIT1_QCOM         0x00000200
++#define GL_DEPTH_BUFFER_BIT2_QCOM         0x00000400
++#define GL_DEPTH_BUFFER_BIT3_QCOM         0x00000800
++#define GL_DEPTH_BUFFER_BIT4_QCOM         0x00001000
++#define GL_DEPTH_BUFFER_BIT5_QCOM         0x00002000
++#define GL_DEPTH_BUFFER_BIT6_QCOM         0x00004000
++#define GL_DEPTH_BUFFER_BIT7_QCOM         0x00008000
++#define GL_STENCIL_BUFFER_BIT0_QCOM       0x00010000
++#define GL_STENCIL_BUFFER_BIT1_QCOM       0x00020000
++#define GL_STENCIL_BUFFER_BIT2_QCOM       0x00040000
++#define GL_STENCIL_BUFFER_BIT3_QCOM       0x00080000
++#define GL_STENCIL_BUFFER_BIT4_QCOM       0x00100000
++#define GL_STENCIL_BUFFER_BIT5_QCOM       0x00200000
++#define GL_STENCIL_BUFFER_BIT6_QCOM       0x00400000
++#define GL_STENCIL_BUFFER_BIT7_QCOM       0x00800000
++#define GL_MULTISAMPLE_BUFFER_BIT0_QCOM   0x01000000
++#define GL_MULTISAMPLE_BUFFER_BIT1_QCOM   0x02000000
++#define GL_MULTISAMPLE_BUFFER_BIT2_QCOM   0x04000000
++#define GL_MULTISAMPLE_BUFFER_BIT3_QCOM   0x08000000
++#define GL_MULTISAMPLE_BUFFER_BIT4_QCOM   0x10000000
++#define GL_MULTISAMPLE_BUFFER_BIT5_QCOM   0x20000000
++#define GL_MULTISAMPLE_BUFFER_BIT6_QCOM   0x40000000
++#define GL_MULTISAMPLE_BUFFER_BIT7_QCOM   0x80000000
++typedef void (GL_APIENTRYP PFNGLSTARTTILINGQCOMPROC) (GLuint x, GLuint y, GLuint width, GLuint height, GLbitfield preserveMask);
++typedef void (GL_APIENTRYP PFNGLENDTILINGQCOMPROC) (GLbitfield preserveMask);
++#ifdef GL_GLEXT_PROTOTYPES
++GL_APICALL void GL_APIENTRY glStartTilingQCOM (GLuint x, GLuint y, GLuint width, GLuint height, GLbitfield preserveMask);
++GL_APICALL void GL_APIENTRY glEndTilingQCOM (GLbitfield preserveMask);
++#endif
++#endif /* GL_QCOM_tiled_rendering */
++
++#ifndef GL_QCOM_writeonly_rendering
++#define GL_QCOM_writeonly_rendering 1
++#define GL_WRITEONLY_RENDERING_QCOM       0x8823
++#endif /* GL_QCOM_writeonly_rendering */
++
++#ifndef GL_VIV_shader_binary
++#define GL_VIV_shader_binary 1
++#define GL_SHADER_BINARY_VIV              0x8FC4
++#endif /* GL_VIV_shader_binary */
++
++#ifdef __cplusplus
++}
++#endif
++
++#endif
+diff -rupN a/usr/include/GLES2/gl2.h b/usr/include/GLES2/gl2.h
+--- a/usr/include/GLES2/gl2.h	1970-01-01 01:00:00.000000000 +0100
++++ b/usr/include/GLES2/gl2.h	2013-10-12 03:05:04.000000000 +0200
+@@ -0,0 +1,523 @@
++#ifndef __gl2_h_
++#define __gl2_h_ 1
++
++#ifdef __cplusplus
++extern "C" {
++#endif
++
++/*
++** Copyright (c) 2013 The Khronos Group Inc.
++**
++** Permission is hereby granted, free of charge, to any person obtaining a
++** copy of this software and/or associated documentation files (the
++** "Materials"), to deal in the Materials without restriction, including
++** without limitation the rights to use, copy, modify, merge, publish,
++** distribute, sublicense, and/or sell copies of the Materials, and to
++** permit persons to whom the Materials are furnished to do so, subject to
++** the following conditions:
++**
++** The above copyright notice and this permission notice shall be included
++** in all copies or substantial portions of the Materials.
++**
++** THE MATERIALS ARE PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
++** EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
++** MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
++** IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
++** CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
++** TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
++** MATERIALS OR THE USE OR OTHER DEALINGS IN THE MATERIALS.
++*/
++/*
++** This header is generated from the Khronos OpenGL / OpenGL ES XML
++** API Registry. The current version of the Registry, generator scripts
++** used to make the header, and the header can be found at
++**   http://www.opengl.org/registry/
++**
++** Khronos $Revision: 23422 $ on $Date: 2013-10-08 15:40:45 -0700 (Tue, 08 Oct 2013) $
++*/
++
++#include <GLES2/gl2platform.h>
++
++/* Generated C header for:
++ * API: gles2
++ * Profile: common
++ * Versions considered: 2\.[0-9]
++ * Versions emitted: .*
++ * Default extensions included: None
++ * Additional extensions included: _nomatch_^
++ * Extensions removed: _nomatch_^
++ */
++
++#ifndef GL_ES_VERSION_2_0
++#define GL_ES_VERSION_2_0 1
++#include <KHR/khrplatform.h>
++typedef khronos_int8_t GLbyte;
++typedef khronos_float_t GLclampf;
++typedef khronos_int32_t GLfixed;
++typedef short GLshort;
++typedef unsigned short GLushort;
++typedef void GLvoid;
++typedef struct __GLsync *GLsync;
++typedef khronos_int64_t GLint64;
++typedef khronos_uint64_t GLuint64;
++typedef unsigned int GLenum;
++typedef unsigned int GLuint;
++typedef char GLchar;
++typedef khronos_float_t GLfloat;
++typedef khronos_ssize_t GLsizeiptr;
++typedef khronos_intptr_t GLintptr;
++typedef unsigned int GLbitfield;
++typedef int GLint;
++typedef unsigned char GLboolean;
++typedef int GLsizei;
++typedef khronos_uint8_t GLubyte;
++#define GL_DEPTH_BUFFER_BIT               0x00000100
++#define GL_STENCIL_BUFFER_BIT             0x00000400
++#define GL_COLOR_BUFFER_BIT               0x00004000
++#define GL_FALSE                          0
++#define GL_TRUE                           1
++#define GL_POINTS                         0x0000
++#define GL_LINES                          0x0001
++#define GL_LINE_LOOP                      0x0002
++#define GL_LINE_STRIP                     0x0003
++#define GL_TRIANGLES                      0x0004
++#define GL_TRIANGLE_STRIP                 0x0005
++#define GL_TRIANGLE_FAN                   0x0006
++#define GL_ZERO                           0
++#define GL_ONE                            1
++#define GL_SRC_COLOR                      0x0300
++#define GL_ONE_MINUS_SRC_COLOR            0x0301
++#define GL_SRC_ALPHA                      0x0302
++#define GL_ONE_MINUS_SRC_ALPHA            0x0303
++#define GL_DST_ALPHA                      0x0304
++#define GL_ONE_MINUS_DST_ALPHA            0x0305
++#define GL_DST_COLOR                      0x0306
++#define GL_ONE_MINUS_DST_COLOR            0x0307
++#define GL_SRC_ALPHA_SATURATE             0x0308
++#define GL_FUNC_ADD                       0x8006
++#define GL_BLEND_EQUATION                 0x8009
++#define GL_BLEND_EQUATION_RGB             0x8009
++#define GL_BLEND_EQUATION_ALPHA           0x883D
++#define GL_FUNC_SUBTRACT                  0x800A
++#define GL_FUNC_REVERSE_SUBTRACT          0x800B
++#define GL_BLEND_DST_RGB                  0x80C8
++#define GL_BLEND_SRC_RGB                  0x80C9
++#define GL_BLEND_DST_ALPHA                0x80CA
++#define GL_BLEND_SRC_ALPHA                0x80CB
++#define GL_CONSTANT_COLOR                 0x8001
++#define GL_ONE_MINUS_CONSTANT_COLOR       0x8002
++#define GL_CONSTANT_ALPHA                 0x8003
++#define GL_ONE_MINUS_CONSTANT_ALPHA       0x8004
++#define GL_BLEND_COLOR                    0x8005
++#define GL_ARRAY_BUFFER                   0x8892
++#define GL_ELEMENT_ARRAY_BUFFER           0x8893
++#define GL_ARRAY_BUFFER_BINDING           0x8894
++#define GL_ELEMENT_ARRAY_BUFFER_BINDING   0x8895
++#define GL_STREAM_DRAW                    0x88E0
++#define GL_STATIC_DRAW                    0x88E4
++#define GL_DYNAMIC_DRAW                   0x88E8
++#define GL_BUFFER_SIZE                    0x8764
++#define GL_BUFFER_USAGE                   0x8765
++#define GL_CURRENT_VERTEX_ATTRIB          0x8626
++#define GL_FRONT                          0x0404
++#define GL_BACK                           0x0405
++#define GL_FRONT_AND_BACK                 0x0408
++#define GL_TEXTURE_2D                     0x0DE1
++#define GL_CULL_FACE                      0x0B44
++#define GL_BLEND                          0x0BE2
++#define GL_DITHER                         0x0BD0
++#define GL_STENCIL_TEST                   0x0B90
++#define GL_DEPTH_TEST                     0x0B71
++#define GL_SCISSOR_TEST                   0x0C11
++#define GL_POLYGON_OFFSET_FILL            0x8037
++#define GL_SAMPLE_ALPHA_TO_COVERAGE       0x809E
++#define GL_SAMPLE_COVERAGE                0x80A0
++#define GL_NO_ERROR                       0
++#define GL_INVALID_ENUM                   0x0500
++#define GL_INVALID_VALUE                  0x0501
++#define GL_INVALID_OPERATION              0x0502
++#define GL_OUT_OF_MEMORY                  0x0505
++#define GL_CW                             0x0900
++#define GL_CCW                            0x0901
++#define GL_LINE_WIDTH                     0x0B21
++#define GL_ALIASED_POINT_SIZE_RANGE       0x846D
++#define GL_ALIASED_LINE_WIDTH_RANGE       0x846E
++#define GL_CULL_FACE_MODE                 0x0B45
++#define GL_FRONT_FACE                     0x0B46
++#define GL_DEPTH_RANGE                    0x0B70
++#define GL_DEPTH_WRITEMASK                0x0B72
++#define GL_DEPTH_CLEAR_VALUE              0x0B73
++#define GL_DEPTH_FUNC                     0x0B74
++#define GL_STENCIL_CLEAR_VALUE            0x0B91
++#define GL_STENCIL_FUNC                   0x0B92
++#define GL_STENCIL_FAIL                   0x0B94
++#define GL_STENCIL_PASS_DEPTH_FAIL        0x0B95
++#define GL_STENCIL_PASS_DEPTH_PASS        0x0B96
++#define GL_STENCIL_REF                    0x0B97
++#define GL_STENCIL_VALUE_MASK             0x0B93
++#define GL_STENCIL_WRITEMASK              0x0B98
++#define GL_STENCIL_BACK_FUNC              0x8800
++#define GL_STENCIL_BACK_FAIL              0x8801
++#define GL_STENCIL_BACK_PASS_DEPTH_FAIL   0x8802
++#define GL_STENCIL_BACK_PASS_DEPTH_PASS   0x8803
++#define GL_STENCIL_BACK_REF               0x8CA3
++#define GL_STENCIL_BACK_VALUE_MASK        0x8CA4
++#define GL_STENCIL_BACK_WRITEMASK         0x8CA5
++#define GL_VIEWPORT                       0x0BA2
++#define GL_SCISSOR_BOX                    0x0C10
++#define GL_COLOR_CLEAR_VALUE              0x0C22
++#define GL_COLOR_WRITEMASK                0x0C23
++#define GL_UNPACK_ALIGNMENT               0x0CF5
++#define GL_PACK_ALIGNMENT                 0x0D05
++#define GL_MAX_TEXTURE_SIZE               0x0D33
++#define GL_MAX_VIEWPORT_DIMS              0x0D3A
++#define GL_SUBPIXEL_BITS                  0x0D50
++#define GL_RED_BITS                       0x0D52
++#define GL_GREEN_BITS                     0x0D53
++#define GL_BLUE_BITS                      0x0D54
++#define GL_ALPHA_BITS                     0x0D55
++#define GL_DEPTH_BITS                     0x0D56
++#define GL_STENCIL_BITS                   0x0D57
++#define GL_POLYGON_OFFSET_UNITS           0x2A00
++#define GL_POLYGON_OFFSET_FACTOR          0x8038
++#define GL_TEXTURE_BINDING_2D             0x8069
++#define GL_SAMPLE_BUFFERS                 0x80A8
++#define GL_SAMPLES                        0x80A9
++#define GL_SAMPLE_COVERAGE_VALUE          0x80AA
++#define GL_SAMPLE_COVERAGE_INVERT         0x80AB
++#define GL_NUM_COMPRESSED_TEXTURE_FORMATS 0x86A2
++#define GL_COMPRESSED_TEXTURE_FORMATS     0x86A3
++#define GL_DONT_CARE                      0x1100
++#define GL_FASTEST                        0x1101
++#define GL_NICEST                         0x1102
++#define GL_GENERATE_MIPMAP_HINT           0x8192
++#define GL_BYTE                           0x1400
++#define GL_UNSIGNED_BYTE                  0x1401
++#define GL_SHORT                          0x1402
++#define GL_UNSIGNED_SHORT                 0x1403
++#define GL_INT                            0x1404
++#define GL_UNSIGNED_INT                   0x1405
++#define GL_FLOAT                          0x1406
++#define GL_FIXED                          0x140C
++#define GL_DEPTH_COMPONENT                0x1902
++#define GL_ALPHA                          0x1906
++#define GL_RGB                            0x1907
++#define GL_RGBA                           0x1908
++#define GL_LUMINANCE                      0x1909
++#define GL_LUMINANCE_ALPHA                0x190A
++#define GL_UNSIGNED_SHORT_4_4_4_4         0x8033
++#define GL_UNSIGNED_SHORT_5_5_5_1         0x8034
++#define GL_UNSIGNED_SHORT_5_6_5           0x8363
++#define GL_FRAGMENT_SHADER                0x8B30
++#define GL_VERTEX_SHADER                  0x8B31
++#define GL_MAX_VERTEX_ATTRIBS             0x8869
++#define GL_MAX_VERTEX_UNIFORM_VECTORS     0x8DFB
++#define GL_MAX_VARYING_VECTORS            0x8DFC
++#define GL_MAX_COMBINED_TEXTURE_IMAGE_UNITS 0x8B4D
++#define GL_MAX_VERTEX_TEXTURE_IMAGE_UNITS 0x8B4C
++#define GL_MAX_TEXTURE_IMAGE_UNITS        0x8872
++#define GL_MAX_FRAGMENT_UNIFORM_VECTORS   0x8DFD
++#define GL_SHADER_TYPE                    0x8B4F
++#define GL_DELETE_STATUS                  0x8B80
++#define GL_LINK_STATUS                    0x8B82
++#define GL_VALIDATE_STATUS                0x8B83
++#define GL_ATTACHED_SHADERS               0x8B85
++#define GL_ACTIVE_UNIFORMS                0x8B86
++#define GL_ACTIVE_UNIFORM_MAX_LENGTH      0x8B87
++#define GL_ACTIVE_ATTRIBUTES              0x8B89
++#define GL_ACTIVE_ATTRIBUTE_MAX_LENGTH    0x8B8A
++#define GL_SHADING_LANGUAGE_VERSION       0x8B8C
++#define GL_CURRENT_PROGRAM                0x8B8D
++#define GL_NEVER                          0x0200
++#define GL_LESS                           0x0201
++#define GL_EQUAL                          0x0202
++#define GL_LEQUAL                         0x0203
++#define GL_GREATER                        0x0204
++#define GL_NOTEQUAL                       0x0205
++#define GL_GEQUAL                         0x0206
++#define GL_ALWAYS                         0x0207
++#define GL_KEEP                           0x1E00
++#define GL_REPLACE                        0x1E01
++#define GL_INCR                           0x1E02
++#define GL_DECR                           0x1E03
++#define GL_INVERT                         0x150A
++#define GL_INCR_WRAP                      0x8507
++#define GL_DECR_WRAP                      0x8508
++#define GL_VENDOR                         0x1F00
++#define GL_RENDERER                       0x1F01
++#define GL_VERSION                        0x1F02
++#define GL_EXTENSIONS                     0x1F03
++#define GL_NEAREST                        0x2600
++#define GL_LINEAR                         0x2601
++#define GL_NEAREST_MIPMAP_NEAREST         0x2700
++#define GL_LINEAR_MIPMAP_NEAREST          0x2701
++#define GL_NEAREST_MIPMAP_LINEAR          0x2702
++#define GL_LINEAR_MIPMAP_LINEAR           0x2703
++#define GL_TEXTURE_MAG_FILTER             0x2800
++#define GL_TEXTURE_MIN_FILTER             0x2801
++#define GL_TEXTURE_WRAP_S                 0x2802
++#define GL_TEXTURE_WRAP_T                 0x2803
++#define GL_TEXTURE                        0x1702
++#define GL_TEXTURE_CUBE_MAP               0x8513
++#define GL_TEXTURE_BINDING_CUBE_MAP       0x8514
++#define GL_TEXTURE_CUBE_MAP_POSITIVE_X    0x8515
++#define GL_TEXTURE_CUBE_MAP_NEGATIVE_X    0x8516
++#define GL_TEXTURE_CUBE_MAP_POSITIVE_Y    0x8517
++#define GL_TEXTURE_CUBE_MAP_NEGATIVE_Y    0x8518
++#define GL_TEXTURE_CUBE_MAP_POSITIVE_Z    0x8519
++#define GL_TEXTURE_CUBE_MAP_NEGATIVE_Z    0x851A
++#define GL_MAX_CUBE_MAP_TEXTURE_SIZE      0x851C
++#define GL_TEXTURE0                       0x84C0
++#define GL_TEXTURE1                       0x84C1
++#define GL_TEXTURE2                       0x84C2
++#define GL_TEXTURE3                       0x84C3
++#define GL_TEXTURE4                       0x84C4
++#define GL_TEXTURE5                       0x84C5
++#define GL_TEXTURE6                       0x84C6
++#define GL_TEXTURE7                       0x84C7
++#define GL_TEXTURE8                       0x84C8
++#define GL_TEXTURE9                       0x84C9
++#define GL_TEXTURE10                      0x84CA
++#define GL_TEXTURE11                      0x84CB
++#define GL_TEXTURE12                      0x84CC
++#define GL_TEXTURE13                      0x84CD
++#define GL_TEXTURE14                      0x84CE
++#define GL_TEXTURE15                      0x84CF
++#define GL_TEXTURE16                      0x84D0
++#define GL_TEXTURE17                      0x84D1
++#define GL_TEXTURE18                      0x84D2
++#define GL_TEXTURE19                      0x84D3
++#define GL_TEXTURE20                      0x84D4
++#define GL_TEXTURE21                      0x84D5
++#define GL_TEXTURE22                      0x84D6
++#define GL_TEXTURE23                      0x84D7
++#define GL_TEXTURE24                      0x84D8
++#define GL_TEXTURE25                      0x84D9
++#define GL_TEXTURE26                      0x84DA
++#define GL_TEXTURE27                      0x84DB
++#define GL_TEXTURE28                      0x84DC
++#define GL_TEXTURE29                      0x84DD
++#define GL_TEXTURE30                      0x84DE
++#define GL_TEXTURE31                      0x84DF
++#define GL_ACTIVE_TEXTURE                 0x84E0
++#define GL_REPEAT                         0x2901
++#define GL_CLAMP_TO_EDGE                  0x812F
++#define GL_MIRRORED_REPEAT                0x8370
++#define GL_FLOAT_VEC2                     0x8B50
++#define GL_FLOAT_VEC3                     0x8B51
++#define GL_FLOAT_VEC4                     0x8B52
++#define GL_INT_VEC2                       0x8B53
++#define GL_INT_VEC3                       0x8B54
++#define GL_INT_VEC4                       0x8B55
++#define GL_BOOL                           0x8B56
++#define GL_BOOL_VEC2                      0x8B57
++#define GL_BOOL_VEC3                      0x8B58
++#define GL_BOOL_VEC4                      0x8B59
++#define GL_FLOAT_MAT2                     0x8B5A
++#define GL_FLOAT_MAT3                     0x8B5B
++#define GL_FLOAT_MAT4                     0x8B5C
++#define GL_SAMPLER_2D                     0x8B5E
++#define GL_SAMPLER_CUBE                   0x8B60
++#define GL_VERTEX_ATTRIB_ARRAY_ENABLED    0x8622
++#define GL_VERTEX_ATTRIB_ARRAY_SIZE       0x8623
++#define GL_VERTEX_ATTRIB_ARRAY_STRIDE     0x8624
++#define GL_VERTEX_ATTRIB_ARRAY_TYPE       0x8625
++#define GL_VERTEX_ATTRIB_ARRAY_NORMALIZED 0x886A
++#define GL_VERTEX_ATTRIB_ARRAY_POINTER    0x8645
++#define GL_VERTEX_ATTRIB_ARRAY_BUFFER_BINDING 0x889F
++#define GL_IMPLEMENTATION_COLOR_READ_TYPE 0x8B9A
++#define GL_IMPLEMENTATION_COLOR_READ_FORMAT 0x8B9B
++#define GL_COMPILE_STATUS                 0x8B81
++#define GL_INFO_LOG_LENGTH                0x8B84
++#define GL_SHADER_SOURCE_LENGTH           0x8B88
++#define GL_SHADER_COMPILER                0x8DFA
++#define GL_SHADER_BINARY_FORMATS          0x8DF8
++#define GL_NUM_SHADER_BINARY_FORMATS      0x8DF9
++#define GL_LOW_FLOAT                      0x8DF0
++#define GL_MEDIUM_FLOAT                   0x8DF1
++#define GL_HIGH_FLOAT                     0x8DF2
++#define GL_LOW_INT                        0x8DF3
++#define GL_MEDIUM_INT                     0x8DF4
++#define GL_HIGH_INT                       0x8DF5
++#define GL_FRAMEBUFFER                    0x8D40
++#define GL_RENDERBUFFER                   0x8D41
++#define GL_RGBA4                          0x8056
++#define GL_RGB5_A1                        0x8057
++#define GL_RGB565                         0x8D62
++#define GL_DEPTH_COMPONENT16              0x81A5
++#define GL_STENCIL_INDEX8                 0x8D48
++#define GL_RENDERBUFFER_WIDTH             0x8D42
++#define GL_RENDERBUFFER_HEIGHT            0x8D43
++#define GL_RENDERBUFFER_INTERNAL_FORMAT   0x8D44
++#define GL_RENDERBUFFER_RED_SIZE          0x8D50
++#define GL_RENDERBUFFER_GREEN_SIZE        0x8D51
++#define GL_RENDERBUFFER_BLUE_SIZE         0x8D52
++#define GL_RENDERBUFFER_ALPHA_SIZE        0x8D53
++#define GL_RENDERBUFFER_DEPTH_SIZE        0x8D54
++#define GL_RENDERBUFFER_STENCIL_SIZE      0x8D55
++#define GL_FRAMEBUFFER_ATTACHMENT_OBJECT_TYPE 0x8CD0
++#define GL_FRAMEBUFFER_ATTACHMENT_OBJECT_NAME 0x8CD1
++#define GL_FRAMEBUFFER_ATTACHMENT_TEXTURE_LEVEL 0x8CD2
++#define GL_FRAMEBUFFER_ATTACHMENT_TEXTURE_CUBE_MAP_FACE 0x8CD3
++#define GL_COLOR_ATTACHMENT0              0x8CE0
++#define GL_DEPTH_ATTACHMENT               0x8D00
++#define GL_STENCIL_ATTACHMENT             0x8D20
++#define GL_NONE                           0
++#define GL_FRAMEBUFFER_COMPLETE           0x8CD5
++#define GL_FRAMEBUFFER_INCOMPLETE_ATTACHMENT 0x8CD6
++#define GL_FRAMEBUFFER_INCOMPLETE_MISSING_ATTACHMENT 0x8CD7
++#define GL_FRAMEBUFFER_INCOMPLETE_DIMENSIONS 0x8CD9
++#define GL_FRAMEBUFFER_UNSUPPORTED        0x8CDD
++#define GL_FRAMEBUFFER_BINDING            0x8CA6
++#define GL_RENDERBUFFER_BINDING           0x8CA7
++#define GL_MAX_RENDERBUFFER_SIZE          0x84E8
++#define GL_INVALID_FRAMEBUFFER_OPERATION  0x0506
++GL_APICALL void GL_APIENTRY glActiveTexture (GLenum texture);
++GL_APICALL void GL_APIENTRY glAttachShader (GLuint program, GLuint shader);
++GL_APICALL void GL_APIENTRY glBindAttribLocation (GLuint program, GLuint index, const GLchar *name);
++GL_APICALL void GL_APIENTRY glBindBuffer (GLenum target, GLuint buffer);
++GL_APICALL void GL_APIENTRY glBindFramebuffer (GLenum target, GLuint framebuffer);
++GL_APICALL void GL_APIENTRY glBindRenderbuffer (GLenum target, GLuint renderbuffer);
++GL_APICALL void GL_APIENTRY glBindTexture (GLenum target, GLuint texture);
++GL_APICALL void GL_APIENTRY glBlendColor (GLfloat red, GLfloat green, GLfloat blue, GLfloat alpha);
++GL_APICALL void GL_APIENTRY glBlendEquation (GLenum mode);
++GL_APICALL void GL_APIENTRY glBlendEquationSeparate (GLenum modeRGB, GLenum modeAlpha);
++GL_APICALL void GL_APIENTRY glBlendFunc (GLenum sfactor, GLenum dfactor);
++GL_APICALL void GL_APIENTRY glBlendFuncSeparate (GLenum sfactorRGB, GLenum dfactorRGB, GLenum sfactorAlpha, GLenum dfactorAlpha);
++GL_APICALL void GL_APIENTRY glBufferData (GLenum target, GLsizeiptr size, const void *data, GLenum usage);
++GL_APICALL void GL_APIENTRY glBufferSubData (GLenum target, GLintptr offset, GLsizeiptr size, const void *data);
++GL_APICALL GLenum GL_APIENTRY glCheckFramebufferStatus (GLenum target);
++GL_APICALL void GL_APIENTRY glClear (GLbitfield mask);
++GL_APICALL void GL_APIENTRY glClearColor (GLfloat red, GLfloat green, GLfloat blue, GLfloat alpha);
++GL_APICALL void GL_APIENTRY glClearDepthf (GLfloat d);
++GL_APICALL void GL_APIENTRY glClearStencil (GLint s);
++GL_APICALL void GL_APIENTRY glColorMask (GLboolean red, GLboolean green, GLboolean blue, GLboolean alpha);
++GL_APICALL void GL_APIENTRY glCompileShader (GLuint shader);
++GL_APICALL void GL_APIENTRY glCompressedTexImage2D (GLenum target, GLint level, GLenum internalformat, GLsizei width, GLsizei height, GLint border, GLsizei imageSize, const void *data);
++GL_APICALL void GL_APIENTRY glCompressedTexSubImage2D (GLenum target, GLint level, GLint xoffset, GLint yoffset, GLsizei width, GLsizei height, GLenum format, GLsizei imageSize, const void *data);
++GL_APICALL void GL_APIENTRY glCopyTexImage2D (GLenum target, GLint level, GLenum internalformat, GLint x, GLint y, GLsizei width, GLsizei height, GLint border);
++GL_APICALL void GL_APIENTRY glCopyTexSubImage2D (GLenum target, GLint level, GLint xoffset, GLint yoffset, GLint x, GLint y, GLsizei width, GLsizei height);
++GL_APICALL GLuint GL_APIENTRY glCreateProgram (void);
++GL_APICALL GLuint GL_APIENTRY glCreateShader (GLenum type);
++GL_APICALL void GL_APIENTRY glCullFace (GLenum mode);
++GL_APICALL void GL_APIENTRY glDeleteBuffers (GLsizei n, const GLuint *buffers);
++GL_APICALL void GL_APIENTRY glDeleteFramebuffers (GLsizei n, const GLuint *framebuffers);
++GL_APICALL void GL_APIENTRY glDeleteProgram (GLuint program);
++GL_APICALL void GL_APIENTRY glDeleteRenderbuffers (GLsizei n, const GLuint *renderbuffers);
++GL_APICALL void GL_APIENTRY glDeleteShader (GLuint shader);
++GL_APICALL void GL_APIENTRY glDeleteTextures (GLsizei n, const GLuint *textures);
++GL_APICALL void GL_APIENTRY glDepthFunc (GLenum func);
++GL_APICALL void GL_APIENTRY glDepthMask (GLboolean flag);
++GL_APICALL void GL_APIENTRY glDepthRangef (GLfloat n, GLfloat f);
++GL_APICALL void GL_APIENTRY glDetachShader (GLuint program, GLuint shader);
++GL_APICALL void GL_APIENTRY glDisable (GLenum cap);
++GL_APICALL void GL_APIENTRY glDisableVertexAttribArray (GLuint index);
++GL_APICALL void GL_APIENTRY glDrawArrays (GLenum mode, GLint first, GLsizei count);
++GL_APICALL void GL_APIENTRY glDrawElements (GLenum mode, GLsizei count, GLenum type, const void *indices);
++GL_APICALL void GL_APIENTRY glEnable (GLenum cap);
++GL_APICALL void GL_APIENTRY glEnableVertexAttribArray (GLuint index);
++GL_APICALL void GL_APIENTRY glFinish (void);
++GL_APICALL void GL_APIENTRY glFlush (void);
++GL_APICALL void GL_APIENTRY glFramebufferRenderbuffer (GLenum target, GLenum attachment, GLenum renderbuffertarget, GLuint renderbuffer);
++GL_APICALL void GL_APIENTRY glFramebufferTexture2D (GLenum target, GLenum attachment, GLenum textarget, GLuint texture, GLint level);
++GL_APICALL void GL_APIENTRY glFrontFace (GLenum mode);
++GL_APICALL void GL_APIENTRY glGenBuffers (GLsizei n, GLuint *buffers);
++GL_APICALL void GL_APIENTRY glGenerateMipmap (GLenum target);
++GL_APICALL void GL_APIENTRY glGenFramebuffers (GLsizei n, GLuint *framebuffers);
++GL_APICALL void GL_APIENTRY glGenRenderbuffers (GLsizei n, GLuint *renderbuffers);
++GL_APICALL void GL_APIENTRY glGenTextures (GLsizei n, GLuint *textures);
++GL_APICALL void GL_APIENTRY glGetActiveAttrib (GLuint program, GLuint index, GLsizei bufSize, GLsizei *length, GLint *size, GLenum *type, GLchar *name);
++GL_APICALL void GL_APIENTRY glGetActiveUniform (GLuint program, GLuint index, GLsizei bufSize, GLsizei *length, GLint *size, GLenum *type, GLchar *name);
++GL_APICALL void GL_APIENTRY glGetAttachedShaders (GLuint program, GLsizei maxCount, GLsizei *count, GLuint *shaders);
++GL_APICALL GLint GL_APIENTRY glGetAttribLocation (GLuint program, const GLchar *name);
++GL_APICALL void GL_APIENTRY glGetBooleanv (GLenum pname, GLboolean *params);
++GL_APICALL void GL_APIENTRY glGetBufferParameteriv (GLenum target, GLenum pname, GLint *params);
++GL_APICALL GLenum GL_APIENTRY glGetError (void);
++GL_APICALL void GL_APIENTRY glGetFloatv (GLenum pname, GLfloat *params);
++GL_APICALL void GL_APIENTRY glGetFramebufferAttachmentParameteriv (GLenum target, GLenum attachment, GLenum pname, GLint *params);
++GL_APICALL void GL_APIENTRY glGetIntegerv (GLenum pname, GLint *params);
++GL_APICALL void GL_APIENTRY glGetProgramiv (GLuint program, GLenum pname, GLint *params);
++GL_APICALL void GL_APIENTRY glGetProgramInfoLog (GLuint program, GLsizei bufSize, GLsizei *length, GLchar *infoLog);
++GL_APICALL void GL_APIENTRY glGetRenderbufferParameteriv (GLenum target, GLenum pname, GLint *params);
++GL_APICALL void GL_APIENTRY glGetShaderiv (GLuint shader, GLenum pname, GLint *params);
++GL_APICALL void GL_APIENTRY glGetShaderInfoLog (GLuint shader, GLsizei bufSize, GLsizei *length, GLchar *infoLog);
++GL_APICALL void GL_APIENTRY glGetShaderPrecisionFormat (GLenum shadertype, GLenum precisiontype, GLint *range, GLint *precision);
++GL_APICALL void GL_APIENTRY glGetShaderSource (GLuint shader, GLsizei bufSize, GLsizei *length, GLchar *source);
++GL_APICALL const GLubyte *GL_APIENTRY glGetString (GLenum name);
++GL_APICALL void GL_APIENTRY glGetTexParameterfv (GLenum target, GLenum pname, GLfloat *params);
++GL_APICALL void GL_APIENTRY glGetTexParameteriv (GLenum target, GLenum pname, GLint *params);
++GL_APICALL void GL_APIENTRY glGetUniformfv (GLuint program, GLint location, GLfloat *params);
++GL_APICALL void GL_APIENTRY glGetUniformiv (GLuint program, GLint location, GLint *params);
++GL_APICALL GLint GL_APIENTRY glGetUniformLocation (GLuint program, const GLchar *name);
++GL_APICALL void GL_APIENTRY glGetVertexAttribfv (GLuint index, GLenum pname, GLfloat *params);
++GL_APICALL void GL_APIENTRY glGetVertexAttribiv (GLuint index, GLenum pname, GLint *params);
++GL_APICALL void GL_APIENTRY glGetVertexAttribPointerv (GLuint index, GLenum pname, void **pointer);
++GL_APICALL void GL_APIENTRY glHint (GLenum target, GLenum mode);
++GL_APICALL GLboolean GL_APIENTRY glIsBuffer (GLuint buffer);
++GL_APICALL GLboolean GL_APIENTRY glIsEnabled (GLenum cap);
++GL_APICALL GLboolean GL_APIENTRY glIsFramebuffer (GLuint framebuffer);
++GL_APICALL GLboolean GL_APIENTRY glIsProgram (GLuint program);
++GL_APICALL GLboolean GL_APIENTRY glIsRenderbuffer (GLuint renderbuffer);
++GL_APICALL GLboolean GL_APIENTRY glIsShader (GLuint shader);
++GL_APICALL GLboolean GL_APIENTRY glIsTexture (GLuint texture);
++GL_APICALL void GL_APIENTRY glLineWidth (GLfloat width);
++GL_APICALL void GL_APIENTRY glLinkProgram (GLuint program);
++GL_APICALL void GL_APIENTRY glPixelStorei (GLenum pname, GLint param);
++GL_APICALL void GL_APIENTRY glPolygonOffset (GLfloat factor, GLfloat units);
++GL_APICALL void GL_APIENTRY glReadPixels (GLint x, GLint y, GLsizei width, GLsizei height, GLenum format, GLenum type, void *pixels);
++GL_APICALL void GL_APIENTRY glReleaseShaderCompiler (void);
++GL_APICALL void GL_APIENTRY glRenderbufferStorage (GLenum target, GLenum internalformat, GLsizei width, GLsizei height);
++GL_APICALL void GL_APIENTRY glSampleCoverage (GLfloat value, GLboolean invert);
++GL_APICALL void GL_APIENTRY glScissor (GLint x, GLint y, GLsizei width, GLsizei height);
++GL_APICALL void GL_APIENTRY glShaderBinary (GLsizei count, const GLuint *shaders, GLenum binaryformat, const void *binary, GLsizei length);
++GL_APICALL void GL_APIENTRY glShaderSource (GLuint shader, GLsizei count, const GLchar *const*string, const GLint *length);
++GL_APICALL void GL_APIENTRY glStencilFunc (GLenum func, GLint ref, GLuint mask);
++GL_APICALL void GL_APIENTRY glStencilFuncSeparate (GLenum face, GLenum func, GLint ref, GLuint mask);
++GL_APICALL void GL_APIENTRY glStencilMask (GLuint mask);
++GL_APICALL void GL_APIENTRY glStencilMaskSeparate (GLenum face, GLuint mask);
++GL_APICALL void GL_APIENTRY glStencilOp (GLenum fail, GLenum zfail, GLenum zpass);
++GL_APICALL void GL_APIENTRY glStencilOpSeparate (GLenum face, GLenum sfail, GLenum dpfail, GLenum dppass);
++GL_APICALL void GL_APIENTRY glTexImage2D (GLenum target, GLint level, GLint internalformat, GLsizei width, GLsizei height, GLint border, GLenum format, GLenum type, const void *pixels);
++GL_APICALL void GL_APIENTRY glTexParameterf (GLenum target, GLenum pname, GLfloat param);
++GL_APICALL void GL_APIENTRY glTexParameterfv (GLenum target, GLenum pname, const GLfloat *params);
++GL_APICALL void GL_APIENTRY glTexParameteri (GLenum target, GLenum pname, GLint param);
++GL_APICALL void GL_APIENTRY glTexParameteriv (GLenum target, GLenum pname, const GLint *params);
++GL_APICALL void GL_APIENTRY glTexSubImage2D (GLenum target, GLint level, GLint xoffset, GLint yoffset, GLsizei width, GLsizei height, GLenum format, GLenum type, const void *pixels);
++GL_APICALL void GL_APIENTRY glUniform1f (GLint location, GLfloat v0);
++GL_APICALL void GL_APIENTRY glUniform1fv (GLint location, GLsizei count, const GLfloat *value);
++GL_APICALL void GL_APIENTRY glUniform1i (GLint location, GLint v0);
++GL_APICALL void GL_APIENTRY glUniform1iv (GLint location, GLsizei count, const GLint *value);
++GL_APICALL void GL_APIENTRY glUniform2f (GLint location, GLfloat v0, GLfloat v1);
++GL_APICALL void GL_APIENTRY glUniform2fv (GLint location, GLsizei count, const GLfloat *value);
++GL_APICALL void GL_APIENTRY glUniform2i (GLint location, GLint v0, GLint v1);
++GL_APICALL void GL_APIENTRY glUniform2iv (GLint location, GLsizei count, const GLint *value);
++GL_APICALL void GL_APIENTRY glUniform3f (GLint location, GLfloat v0, GLfloat v1, GLfloat v2);
++GL_APICALL void GL_APIENTRY glUniform3fv (GLint location, GLsizei count, const GLfloat *value);
++GL_APICALL void GL_APIENTRY glUniform3i (GLint location, GLint v0, GLint v1, GLint v2);
++GL_APICALL void GL_APIENTRY glUniform3iv (GLint location, GLsizei count, const GLint *value);
++GL_APICALL void GL_APIENTRY glUniform4f (GLint location, GLfloat v0, GLfloat v1, GLfloat v2, GLfloat v3);
++GL_APICALL void GL_APIENTRY glUniform4fv (GLint location, GLsizei count, const GLfloat *value);
++GL_APICALL void GL_APIENTRY glUniform4i (GLint location, GLint v0, GLint v1, GLint v2, GLint v3);
++GL_APICALL void GL_APIENTRY glUniform4iv (GLint location, GLsizei count, const GLint *value);
++GL_APICALL void GL_APIENTRY glUniformMatrix2fv (GLint location, GLsizei count, GLboolean transpose, const GLfloat *value);
++GL_APICALL void GL_APIENTRY glUniformMatrix3fv (GLint location, GLsizei count, GLboolean transpose, const GLfloat *value);
++GL_APICALL void GL_APIENTRY glUniformMatrix4fv (GLint location, GLsizei count, GLboolean transpose, const GLfloat *value);
++GL_APICALL void GL_APIENTRY glUseProgram (GLuint program);
++GL_APICALL void GL_APIENTRY glValidateProgram (GLuint program);
++GL_APICALL void GL_APIENTRY glVertexAttrib1f (GLuint index, GLfloat x);
++GL_APICALL void GL_APIENTRY glVertexAttrib1fv (GLuint index, const GLfloat *v);
++GL_APICALL void GL_APIENTRY glVertexAttrib2f (GLuint index, GLfloat x, GLfloat y);
++GL_APICALL void GL_APIENTRY glVertexAttrib2fv (GLuint index, const GLfloat *v);
++GL_APICALL void GL_APIENTRY glVertexAttrib3f (GLuint index, GLfloat x, GLfloat y, GLfloat z);
++GL_APICALL void GL_APIENTRY glVertexAttrib3fv (GLuint index, const GLfloat *v);
++GL_APICALL void GL_APIENTRY glVertexAttrib4f (GLuint index, GLfloat x, GLfloat y, GLfloat z, GLfloat w);
++GL_APICALL void GL_APIENTRY glVertexAttrib4fv (GLuint index, const GLfloat *v);
++GL_APICALL void GL_APIENTRY glVertexAttribPointer (GLuint index, GLint size, GLenum type, GLboolean normalized, GLsizei stride, const void *pointer);
++GL_APICALL void GL_APIENTRY glViewport (GLint x, GLint y, GLsizei width, GLsizei height);
++#endif /* GL_ES_VERSION_2_0 */
++
++#ifdef __cplusplus
++}
++#endif
++
++#endif
+diff -rupN a/usr/include/GLES2/gl2platform.h b/usr/include/GLES2/gl2platform.h
+--- a/usr/include/GLES2/gl2platform.h	1970-01-01 01:00:00.000000000 +0100
++++ b/usr/include/GLES2/gl2platform.h	2013-10-12 03:05:04.000000000 +0200
+@@ -0,0 +1,30 @@
++#ifndef __gl2platform_h_
++#define __gl2platform_h_
++
++/* $Revision: 23328 $ on $Date:: 2013-10-02 02:28:28 -0700 #$ */
++
++/*
++ * This document is licensed under the SGI Free Software B License Version
++ * 2.0. For details, see http://oss.sgi.com/projects/FreeB/ .
++ */
++
++/* Platform-specific types and definitions for OpenGL ES 2.X  gl2.h
++ *
++ * Adopters may modify khrplatform.h and this file to suit their platform.
++ * You are encouraged to submit all modifications to the Khronos group so that
++ * they can be included in future versions of this file.  Please submit changes
++ * by sending them to the public Khronos Bugzilla (http://khronos.org/bugzilla)
++ * by filing a bug against product "OpenGL-ES" component "Registry".
++ */
++
++#include <KHR/khrplatform.h>
++
++#ifndef GL_APICALL
++#define GL_APICALL  KHRONOS_APICALL
++#endif
++
++#ifndef GL_APIENTRY
++#define GL_APIENTRY KHRONOS_APIENTRY
++#endif
++
++#endif /* __gl2platform_h_ */
+diff -rupN a/usr/include/KD/kd.h b/usr/include/KD/kd.h
+--- a/usr/include/KD/kd.h	1970-01-01 01:00:00.000000000 +0100
++++ b/usr/include/KD/kd.h	2013-10-02 03:16:58.000000000 +0200
+@@ -0,0 +1,991 @@
++/* Reference KD/kd.h for OpenKODE Core 1.0.3  */
++#ifndef __kd_h_
++#define __kd_h_
++
++#ifdef __cplusplus
++extern "C" {
++#endif
++
++#include "kdplatform.h"
++
++
++
++/*******************************************************
++ * Introduction
++ *******************************************************/
++
++/*******************************************************
++ * OpenKODE conformance
++ *******************************************************/
++
++/*******************************************************
++ * Overview
++ *******************************************************/
++
++/*******************************************************
++ * Programming environment
++ *******************************************************/
++#define KD_VERSION_1_0 1
++typedef char KDchar;
++typedef signed char KDint8;
++typedef unsigned char KDuint8;
++typedef int KDint;
++typedef unsigned int KDuint;
++typedef float KDfloat32;
++typedef KDint KDboolean;
++typedef KDint64 KDtime;
++typedef KDint64 KDust;
++typedef KDint64 KDoff;
++typedef KDuint32 KDmode;
++#define KDINT32_MIN (-0x7fffffff-1)
++#define KDINT32_MAX 0x7fffffff
++#define KDUINT32_MAX 0xffffffffU
++#define KD_TRUE 1
++#define KD_FALSE 0
++#ifdef __cplusplus
++  const int KD_NULL = 0; /* Yes, int. See Stroustrup 3rd edition. */
++#else
++  #define KD_NULL ((void *)0)
++#endif
++
++/*******************************************************
++ * Errors
++ *******************************************************/
++#define KD_EACCES 1
++#define KD_EADDRINUSE 2
++#define KD_EADDRNOTAVAIL 3
++#define KD_EAFNOSUPPORT 4
++#define KD_EAGAIN (5)
++#define KD_EALREADY 6
++#define KD_EBADF 7
++#define KD_EBUSY 8
++#define KD_ECONNREFUSED 9
++#define KD_ECONNRESET 10
++#define KD_EDEADLK 11
++#define KD_EDESTADDRREQ 12
++#define KD_EEXIST 13
++#define KD_EFBIG 14
++#define KD_EHOSTUNREACH 15
++#define KD_EHOST_NOT_FOUND 16
++#define KD_EINVAL 17
++#define KD_EIO 18
++#define KD_EILSEQ 19
++#define KD_EISCONN 20
++#define KD_EISDIR 21
++#define KD_EMFILE 22
++#define KD_ENAMETOOLONG 23
++#define KD_ENOENT 24
++#define KD_ENOMEM 25
++#define KD_ENOSPC 26
++#define KD_ENOSYS 27
++#define KD_ENOTCONN 28
++#define KD_ENO_DATA 29
++#define KD_ENO_RECOVERY 30
++#define KD_EOPNOTSUPP 31
++#define KD_EOVERFLOW 32
++#define KD_EPERM 33
++#define KD_ERANGE 35
++#define KD_ETIMEDOUT (36)
++#define KD_ETRY_AGAIN 37
++
++/* kdGetError: Get last error indication. */
++KD_API KDint KD_APIENTRY kdGetError(void);
++
++/* kdSetError: Set last error indication. */
++KD_API void KD_APIENTRY kdSetError(KDint error);
++
++/*******************************************************
++ * Versioning and attribute queries
++ *******************************************************/
++
++/* kdQueryAttribi: Obtain the value of a numeric OpenKODE Core attribute. */
++KD_API KDint KD_APIENTRY kdQueryAttribi(KDint attribute, KDint *value);
++
++/* kdQueryAttribcv: Obtain the value of a string OpenKODE Core attribute. */
++KD_API const KDchar *KD_APIENTRY kdQueryAttribcv(KDint attribute);
++#define KD_ATTRIB_VENDOR 39
++#define KD_ATTRIB_VERSION 40
++#define KD_ATTRIB_PLATFORM 41
++
++/* kdQueryIndexedAttribcv: Obtain the value of an indexed string OpenKODE Core attribute. */
++KD_API const KDchar *KD_APIENTRY kdQueryIndexedAttribcv(KDint attribute, KDint index);
++
++/*******************************************************
++ * Threads and synchronization
++ *******************************************************/
++
++/* kdThreadAttrCreate: Create a thread attribute object. */
++typedef struct KDThreadAttr KDThreadAttr;
++KD_API KDThreadAttr *KD_APIENTRY kdThreadAttrCreate(void);
++
++/* kdThreadAttrFree: Free a thread attribute object. */
++KD_API KDint KD_APIENTRY kdThreadAttrFree(KDThreadAttr *attr);
++
++/* kdThreadAttrSetDetachState: Set detachstate attribute. */
++#define KD_THREAD_CREATE_JOINABLE 0
++#define KD_THREAD_CREATE_DETACHED 1
++KD_API KDint KD_APIENTRY kdThreadAttrSetDetachState(KDThreadAttr *attr, KDint detachstate);
++
++/* kdThreadAttrSetStackSize: Set stacksize attribute. */
++KD_API KDint KD_APIENTRY kdThreadAttrSetStackSize(KDThreadAttr *attr, KDsize stacksize);
++
++/* kdThreadCreate: Create a new thread. */
++typedef struct KDThread KDThread;
++KD_API KDThread *KD_APIENTRY kdThreadCreate(const KDThreadAttr *attr, void *(*start_routine)(void *), void *arg);
++
++/* kdThreadExit: Terminate this thread. */
++KD_API KD_NORETURN void KD_APIENTRY kdThreadExit(void *retval);
++
++/* kdThreadJoin: Wait for termination of another thread. */
++KD_API KDint KD_APIENTRY kdThreadJoin(KDThread *thread, void **retval);
++
++/* kdThreadDetach: Allow resources to be freed as soon as a thread terminates. */
++KD_API KDint KD_APIENTRY kdThreadDetach(KDThread *thread);
++
++/* kdThreadSelf: Return calling thread&#8217;s ID. */
++KD_API KDThread *KD_APIENTRY kdThreadSelf(void);
++
++/* kdThreadOnce: Wrap initialization code so it is executed only once. */
++#ifndef KD_NO_STATIC_DATA
++typedef struct KDThreadOnce {
++    void *impl;
++} KDThreadOnce;
++#define KD_THREAD_ONCE_INIT { 0 }
++KD_API KDint KD_APIENTRY kdThreadOnce(KDThreadOnce *once_control, void (*init_routine)(void));
++#endif /* ndef KD_NO_STATIC_DATA */
++
++/* kdThreadMutexCreate: Create a mutex. */
++typedef struct KDThreadMutex KDThreadMutex;
++KD_API KDThreadMutex *KD_APIENTRY kdThreadMutexCreate(const void *mutexattr);
++
++/* kdThreadMutexFree: Free a mutex. */
++KD_API KDint KD_APIENTRY kdThreadMutexFree(KDThreadMutex *mutex);
++
++/* kdThreadMutexLock: Lock a mutex. */
++KD_API KDint KD_APIENTRY kdThreadMutexLock(KDThreadMutex *mutex);
++
++/* kdThreadMutexUnlock: Unlock a mutex. */
++KD_API KDint KD_APIENTRY kdThreadMutexUnlock(KDThreadMutex *mutex);
++
++/* kdThreadCondCreate: Create a condition variable. */
++typedef struct KDThreadCond KDThreadCond;
++KD_API KDThreadCond *KD_APIENTRY kdThreadCondCreate(const void *attr);
++
++/* kdThreadCondFree: Free a condition variable. */
++KD_API KDint KD_APIENTRY kdThreadCondFree(KDThreadCond *cond);
++
++/* kdThreadCondSignal, kdThreadCondBroadcast: Signal a condition variable. */
++KD_API KDint KD_APIENTRY kdThreadCondSignal(KDThreadCond *cond);
++KD_API KDint KD_APIENTRY kdThreadCondBroadcast(KDThreadCond *cond);
++
++/* kdThreadCondWait: Wait for a condition variable to be signalled. */
++KD_API KDint KD_APIENTRY kdThreadCondWait(KDThreadCond *cond, KDThreadMutex *mutex);
++
++/* kdThreadSemCreate: Create a semaphore. */
++typedef struct KDThreadSem KDThreadSem;
++KD_API KDThreadSem *KD_APIENTRY kdThreadSemCreate(KDuint value);
++
++/* kdThreadSemFree: Free a semaphore. */
++KD_API KDint KD_APIENTRY kdThreadSemFree(KDThreadSem *sem);
++
++/* kdThreadSemWait: Lock a semaphore. */
++KD_API KDint KD_APIENTRY kdThreadSemWait(KDThreadSem *sem);
++
++/* kdThreadSemPost: Unlock a semaphore. */
++KD_API KDint KD_APIENTRY kdThreadSemPost(KDThreadSem *sem);
++
++/*******************************************************
++ * Events
++ *******************************************************/
++
++/* KDEvent: Struct type containing an event. */
++typedef struct KDEvent KDEvent;
++#define KD_EVENT_USER 0x40000000
++
++/* kdWaitEvent: Get next event from thread&#8217;s event queue. */
++KD_API const KDEvent *KD_APIENTRY kdWaitEvent(KDust timeout);
++
++/* kdSetEventUserptr: Set the userptr for global events. */
++KD_API void KD_APIENTRY kdSetEventUserptr(void *userptr);
++
++/* kdDefaultEvent: Perform default processing on an unrecognized event. */
++KD_API void KD_APIENTRY kdDefaultEvent(const KDEvent *event);
++
++/* kdPumpEvents: Pump the thread&#8217;s event queue, performing callbacks. */
++KD_API KDint KD_APIENTRY kdPumpEvents(void);
++
++/* kdInstallCallback: Install or remove a callback function for event processing. */
++typedef void (KD_APIENTRY KDCallbackFunc)(const KDEvent *event);
++KD_API KDint KD_APIENTRY kdInstallCallback(KDCallbackFunc *func, KDint eventtype, void *eventuserptr);
++
++/* kdCreateEvent: Create an event for posting. */
++KD_API KDEvent *KD_APIENTRY kdCreateEvent(void);
++
++/* kdPostEvent, kdPostThreadEvent: Post an event into a queue. */
++KD_API KDint KD_APIENTRY kdPostEvent(KDEvent *event);
++KD_API KDint KD_APIENTRY kdPostThreadEvent(KDEvent *event, KDThread *thread);
++typedef struct KDEventUser {
++    union {
++        KDint64 i64;
++        void *p;
++        struct {
++            KDint32 a;
++            KDint32 b;
++        } i32pair;
++    } value1;
++    union {
++        KDint64 i64;
++        struct {
++            union {
++                KDint32 i32;
++                void *p;
++            } value2;
++            union {
++                KDint32 i32;
++                void *p;
++            } value3;
++        } i32orp;
++    } value23;
++} KDEventUser;
++
++/* kdFreeEvent: Abandon an event instead of posting it. */
++KD_API void KD_APIENTRY kdFreeEvent(KDEvent *event);
++
++/*******************************************************
++ * System events
++ *******************************************************/
++
++/* KD_EVENT_QUIT: Event to request to quit application. */
++#define KD_EVENT_QUIT 43
++
++/* KD_EVENT_PAUSE: Application pause event. */
++#define KD_EVENT_PAUSE 45
++
++/* KD_EVENT_RESUME: Application resume event. */
++#define KD_EVENT_RESUME 46
++
++/* KD_EVENT_ORIENTATION: Orientation change event. */
++#define KD_EVENT_ORIENTATION 48
++
++/* KD_IOGROUP_EVENT: I/O group for OpenKODE Core system events implemented as state values. */
++#define KD_IOGROUP_EVENT 0x100
++#define KD_STATE_EVENT_USING_BATTERY       (KD_IOGROUP_EVENT + 0)
++#define KD_STATE_EVENT_LOW_BATTERY         (KD_IOGROUP_EVENT + 1)
++
++
++/* KD_IOGROUP_ORIENTATION: I/O group for OpenKODE Core orientation state. */
++#define KD_IOGROUP_ORIENTATION 0x200
++#define KD_STATE_ORIENTATION_OVERALL       (KD_IOGROUP_ORIENTATION + 0)
++#define KD_STATE_ORIENTATION_SCREEN        (KD_IOGROUP_ORIENTATION + 1)
++#define KD_STATE_ORIENTATION_RENDERING     (KD_IOGROUP_ORIENTATION + 2)
++#define KD_STATE_ORIENTATION_LOCKSURFACE   (KD_IOGROUP_ORIENTATION + 3)
++
++
++/*******************************************************
++ * Application startup and exit.
++ *******************************************************/
++
++/* kdMain: The application-defined main function. */
++KDint KD_APIENTRY kdMain(KDint argc, const KDchar *const *argv);
++
++/* kdExit: Exit the application. */
++KD_API KD_NORETURN void KD_APIENTRY kdExit(KDint status);
++
++/*******************************************************
++ * Utility library functions
++ *******************************************************/
++
++/* kdAbs: Compute the absolute value of an integer. */
++KD_API KDint KD_APIENTRY kdAbs(KDint i);
++
++/* kdStrtof: Convert a string to a floating point number. */
++KD_API KDfloat32 KD_APIENTRY kdStrtof(const KDchar *s, KDchar **endptr);
++
++/* kdStrtol, kdStrtoul: Convert a string to an integer. */
++KD_API KDint KD_APIENTRY kdStrtol(const KDchar *s, KDchar **endptr, KDint base);
++KD_API KDuint KD_APIENTRY kdStrtoul(const KDchar *s, KDchar **endptr, KDint base);
++
++/* kdLtostr, kdUltostr: Convert an integer to a string. */
++#define KD_LTOSTR_MAXLEN ((sizeof(KDint)*8*3+6)/10+2)
++#define KD_ULTOSTR_MAXLEN ((sizeof(KDint)*8+2)/3+1)
++KD_API KDssize KD_APIENTRY kdLtostr(KDchar *buffer, KDsize buflen, KDint number);
++KD_API KDssize KD_APIENTRY kdUltostr(KDchar *buffer, KDsize buflen, KDuint number, KDint base);
++
++/* kdFtostr: Convert a float to a string. */
++#define KD_FTOSTR_MAXLEN 16
++KD_API KDssize KD_APIENTRY kdFtostr(KDchar *buffer, KDsize buflen, KDfloat32 number);
++
++/* kdCryptoRandom: Return random data. */
++KD_API KDint KD_APIENTRY kdCryptoRandom(KDuint8 *buf, KDsize buflen);
++
++/*******************************************************
++ * Locale specific functions
++ *******************************************************/
++
++/* kdGetLocale: Determine the current language and locale. */
++KD_API const KDchar *KD_APIENTRY kdGetLocale(void);
++
++/*******************************************************
++ * Memory allocation
++ *******************************************************/
++
++/* kdMalloc: Allocate memory. */
++KD_API void *KD_APIENTRY kdMalloc(KDsize size);
++
++/* kdFree: Free allocated memory block. */
++KD_API void KD_APIENTRY kdFree(void *ptr);
++
++/* kdRealloc: Resize memory block. */
++KD_API void *KD_APIENTRY kdRealloc(void *ptr, KDsize size);
++
++/*******************************************************
++ * Thread-local storage.
++ *******************************************************/
++
++/* kdGetTLS: Get the thread-local storage pointer. */
++KD_API void *KD_APIENTRY kdGetTLS(void);
++
++/* kdSetTLS: Set the thread-local storage pointer. */
++KD_API void KD_APIENTRY kdSetTLS(void *ptr);
++
++/*******************************************************
++ * Mathematical functions
++ *******************************************************/
++#define KD_E_F 2.71828175F
++#define KD_PI_F 3.14159274F
++#define KD_PI_2_F 1.57079637F
++#define KD_2PI_F 6.28318548F
++#define KD_LOG2E_F 1.44269502F
++#define KD_LOG10E_F 0.434294492F
++#define KD_LN2_F 0.693147182F
++#define KD_LN10_F 2.30258512F
++#define KD_PI_4_F 0.785398185F
++#define KD_1_PI_F 0.318309873F
++#define KD_2_PI_F 0.636619747F
++#define KD_2_SQRTPI_F 1.12837923F
++#define KD_SQRT2_F 1.41421354F
++#define KD_SQRT1_2_F 0.707106769F
++#define KD_FLT_EPSILON 1.19209290E-07F
++#define KD_FLT_MAX 3.40282346638528860e+38F
++#define KD_FLT_MIN 1.17549435e-38F
++/* KD_INFINITY is defined in kdplatform.h since no portable definition
++ * is possible. */
++#define kdIsNan(x) (((x) != (x)) ? 1 : 0)
++#define KD_HUGE_VALF KD_INFINITY
++#define KD_DEG_TO_RAD_F 0.0174532924F
++#define KD_RAD_TO_DEG_F 57.2957802F
++
++/* kdAcosf: Arc cosine function. */
++KD_API KDfloat32 KD_APIENTRY kdAcosf(KDfloat32 x);
++
++/* kdAsinf: Arc sine function. */
++KD_API KDfloat32 KD_APIENTRY kdAsinf(KDfloat32 x);
++
++/* kdAtanf: Arc tangent function. */
++KD_API KDfloat32 KD_APIENTRY kdAtanf(KDfloat32 x);
++
++/* kdAtan2f: Arc tangent function. */
++KD_API KDfloat32 KD_APIENTRY kdAtan2f(KDfloat32 y, KDfloat32 x);
++
++/* kdCosf: Cosine function. */
++KD_API KDfloat32 KD_APIENTRY kdCosf(KDfloat32 x);
++
++/* kdSinf: Sine function. */
++KD_API KDfloat32 KD_APIENTRY kdSinf(KDfloat32 x);
++
++/* kdTanf: Tangent function. */
++KD_API KDfloat32 KD_APIENTRY kdTanf(KDfloat32 x);
++
++/* kdExpf: Exponential function. */
++KD_API KDfloat32 KD_APIENTRY kdExpf(KDfloat32 x);
++
++/* kdLogf: Natural logarithm function. */
++KD_API KDfloat32 KD_APIENTRY kdLogf(KDfloat32 x);
++
++/* kdFabsf: Absolute value. */
++KD_API KDfloat32 KD_APIENTRY kdFabsf(KDfloat32 x);
++
++/* kdPowf: Power function. */
++KD_API KDfloat32 KD_APIENTRY kdPowf(KDfloat32 x, KDfloat32 y);
++
++/* kdSqrtf: Square root function. */
++KD_API KDfloat32 KD_APIENTRY kdSqrtf(KDfloat32 x);
++
++/* kdCeilf: Return ceiling value. */
++KD_API KDfloat32 KD_APIENTRY kdCeilf(KDfloat32 x);
++
++/* kdFloorf: Return floor value. */
++KD_API KDfloat32 KD_APIENTRY kdFloorf(KDfloat32 x);
++
++/* kdRoundf: Round value to nearest integer. */
++KD_API KDfloat32 KD_APIENTRY kdRoundf(KDfloat32 x);
++
++/* kdInvsqrtf: Inverse square root function. */
++KD_API KDfloat32 KD_APIENTRY kdInvsqrtf(KDfloat32 x);
++
++/* kdFmodf: Calculate floating point remainder. */
++KD_API KDfloat32 KD_APIENTRY kdFmodf(KDfloat32 x, KDfloat32 y);
++
++/*******************************************************
++ * String and memory functions
++ *******************************************************/
++
++/* kdMemchr: Scan memory for a byte value. */
++KD_API void *KD_APIENTRY kdMemchr(const void *src, KDint byte, KDsize len);
++
++/* kdMemcmp: Compare two memory regions. */
++KD_API KDint KD_APIENTRY kdMemcmp(const void *src1, const void *src2, KDsize len);
++
++/* kdMemcpy: Copy a memory region, no overlapping. */
++KD_API void *KD_APIENTRY kdMemcpy(void *buf, const void *src, KDsize len);
++
++/* kdMemmove: Copy a memory region, overlapping allowed. */
++KD_API void *KD_APIENTRY kdMemmove(void *buf, const void *src, KDsize len);
++
++/* kdMemset: Set bytes in memory to a value. */
++KD_API void *KD_APIENTRY kdMemset(void *buf, KDint byte, KDsize len);
++
++/* kdStrchr: Scan string for a byte value. */
++KD_API KDchar *KD_APIENTRY kdStrchr(const KDchar *str, KDint ch);
++
++/* kdStrcmp: Compares two strings. */
++KD_API KDint KD_APIENTRY kdStrcmp(const KDchar *str1, const KDchar *str2);
++
++/* kdStrlen: Determine the length of a string. */
++KD_API KDsize KD_APIENTRY kdStrlen(const KDchar *str);
++
++/* kdStrnlen: Determine the length of a string. */
++KD_API KDsize KD_APIENTRY kdStrnlen(const KDchar *str, KDsize maxlen);
++
++/* kdStrncat_s: Concatenate two strings. */
++KD_API KDint KD_APIENTRY kdStrncat_s(KDchar *buf, KDsize buflen, const KDchar *src, KDsize srcmaxlen);
++
++/* kdStrncmp: Compares two strings with length limit. */
++KD_API KDint KD_APIENTRY kdStrncmp(const KDchar *str1, const KDchar *str2, KDsize maxlen);
++
++/* kdStrcpy_s: Copy a string with an overrun check. */
++KD_API KDint KD_APIENTRY kdStrcpy_s(KDchar *buf, KDsize buflen, const KDchar *src);
++
++/* kdStrncpy_s: Copy a string with an overrun check. */
++KD_API KDint KD_APIENTRY kdStrncpy_s(KDchar *buf, KDsize buflen, const KDchar *src, KDsize srclen);
++
++/*******************************************************
++ * Time functions
++ *******************************************************/
++
++/* kdGetTimeUST: Get the current unadjusted system time. */
++KD_API KDust KD_APIENTRY kdGetTimeUST(void);
++
++/* kdTime: Get the current wall clock time. */
++KD_API KDtime KD_APIENTRY kdTime(KDtime *timep);
++
++/* kdGmtime_r, kdLocaltime_r: Convert a seconds-since-epoch time into broken-down time. */
++typedef struct KDTm {
++    KDint32 tm_sec;
++    KDint32 tm_min;
++    KDint32 tm_hour;
++    KDint32 tm_mday;
++    KDint32 tm_mon;
++    KDint32 tm_year;
++    KDint32 tm_wday;
++    KDint32 tm_yday;
++} KDTm;
++KD_API KDTm *KD_APIENTRY kdGmtime_r(const KDtime *timep, KDTm *result);
++KD_API KDTm *KD_APIENTRY kdLocaltime_r(const KDtime *timep, KDTm *result);
++
++/* kdUSTAtEpoch: Get the UST corresponding to KDtime 0. */
++KD_API KDust KD_APIENTRY kdUSTAtEpoch(void);
++
++/*******************************************************
++ * Timer functions
++ *******************************************************/
++
++/* kdSetTimer: Set timer. */
++#define KD_TIMER_ONESHOT 61
++#define KD_TIMER_PERIODIC_AVERAGE 62
++#define KD_TIMER_PERIODIC_MINIMUM 63
++typedef struct KDTimer KDTimer;
++KD_API KDTimer *KD_APIENTRY kdSetTimer(KDint64 interval, KDint periodic, void *eventuserptr);
++
++/* kdCancelTimer: Cancel and free a timer. */
++KD_API KDint KD_APIENTRY kdCancelTimer(KDTimer *timer);
++
++/* KD_EVENT_TIMER: Timer fire event. */
++#define KD_EVENT_TIMER 42
++
++/*******************************************************
++ * File system
++ *******************************************************/
++#define KD_EOF (-1)
++
++/* kdFopen: Open a file from the file system. */
++typedef struct KDFile KDFile;
++KD_API KDFile *KD_APIENTRY kdFopen(const KDchar *pathname, const KDchar *mode);
++
++/* kdFclose: Close an open file. */
++KD_API KDint KD_APIENTRY kdFclose(KDFile *file);
++
++/* kdFflush: Flush an open file. */
++KD_API KDint KD_APIENTRY kdFflush(KDFile *file);
++
++/* kdFread: Read from a file. */
++KD_API KDsize KD_APIENTRY kdFread(void *buffer, KDsize size, KDsize count, KDFile *file);
++
++/* kdFwrite: Write to a file. */
++KD_API KDsize KD_APIENTRY kdFwrite(const void *buffer, KDsize size, KDsize count, KDFile *file);
++
++/* kdGetc: Read next byte from an open file. */
++KD_API KDint KD_APIENTRY kdGetc(KDFile *file);
++
++/* kdPutc: Write a byte to an open file. */
++KD_API KDint KD_APIENTRY kdPutc(KDint c, KDFile *file);
++
++/* kdFgets: Read a line of text from an open file. */
++KD_API KDchar *KD_APIENTRY kdFgets(KDchar *buffer, KDsize buflen, KDFile *file);
++
++/* kdFEOF: Check for end of file. */
++KD_API KDint KD_APIENTRY kdFEOF(KDFile *file);
++
++/* kdFerror: Check for an error condition on an open file. */
++KD_API KDint KD_APIENTRY kdFerror(KDFile *file);
++
++/* kdClearerr: Clear a file&#8217;s error and end-of-file indicators. */
++KD_API void KD_APIENTRY kdClearerr(KDFile *file);
++
++/* kdFseek: Reposition the file position indicator in a file. */
++typedef enum {
++    KD_SEEK_SET =  0,
++    KD_SEEK_CUR =  1,
++    KD_SEEK_END =  2
++} KDfileSeekOrigin;
++KD_API KDint KD_APIENTRY kdFseek(KDFile *file, KDoff offset, KDfileSeekOrigin origin);
++
++/* kdFtell: Get the file position of an open file. */
++KD_API KDoff KD_APIENTRY kdFtell(KDFile *file);
++
++/* kdMkdir: Create new directory. */
++KD_API KDint KD_APIENTRY kdMkdir(const KDchar *pathname);
++
++/* kdRmdir: Delete a directory. */
++KD_API KDint KD_APIENTRY kdRmdir(const KDchar *pathname);
++
++/* kdRename: Rename a file. */
++KD_API KDint KD_APIENTRY kdRename(const KDchar *src, const KDchar *dest);
++
++/* kdRemove: Delete a file. */
++KD_API KDint KD_APIENTRY kdRemove(const KDchar *pathname);
++
++/* kdTruncate: Truncate or extend a file. */
++KD_API KDint KD_APIENTRY kdTruncate(const KDchar *pathname, KDoff length);
++
++/* kdStat, kdFstat: Return information about a file. */
++typedef struct KDStat {
++    KDmode st_mode;
++    KDoff st_size;
++    KDtime st_mtime;
++} KDStat;
++KD_API KDint KD_APIENTRY kdStat(const KDchar *pathname, struct KDStat *buf);
++KD_API KDint KD_APIENTRY kdFstat(KDFile *file, struct KDStat *buf);
++#define KD_ISREG(m) ((m) & 0x8000)
++#define KD_ISDIR(m) ((m) & 0x4000)
++
++/* kdAccess: Determine whether the application can access a file or directory. */
++KD_API KDint KD_APIENTRY kdAccess(const KDchar *pathname, KDint amode);
++#define KD_R_OK 4
++#define KD_W_OK 2
++#define KD_X_OK 1
++
++/* kdOpenDir: Open a directory ready for listing. */
++typedef struct KDDir KDDir;
++KD_API KDDir *KD_APIENTRY kdOpenDir(const KDchar *pathname);
++
++/* kdReadDir: Return the next file in a directory. */
++typedef struct KDDirent {
++    const KDchar *d_name;
++} KDDirent;
++KD_API KDDirent *KD_APIENTRY kdReadDir(KDDir *dir);
++
++/* kdCloseDir: Close a directory. */
++KD_API KDint KD_APIENTRY kdCloseDir(KDDir *dir);
++
++/* kdGetFree: Get free space on a drive. */
++KD_API KDoff KD_APIENTRY kdGetFree(const KDchar *pathname);
++
++/*******************************************************
++ * Network sockets
++ *******************************************************/
++
++/* KDSockaddr: Struct type for socket address. */
++typedef struct KDSockaddr {
++    KDuint16 family;
++    union {
++#define KD_AF_INET 70
++        struct {
++            KDuint16 port;
++            KDuint32 address;
++        } sin;
++    } data;
++} KDSockaddr;
++
++/* kdNameLookup: Look up a hostname. */
++KD_API KDint KD_APIENTRY kdNameLookup(KDint af, const KDchar *hostname, void *eventuserptr);
++
++/* kdNameLookupCancel: Selectively cancels ongoing kdNameLookup operations. */
++KD_API void KD_APIENTRY kdNameLookupCancel(void *eventuserptr);
++
++/* kdSocketCreate: Creates a socket. */
++typedef struct KDSocket KDSocket;
++KD_API KDSocket *KD_APIENTRY kdSocketCreate(KDint type, void *eventuserptr);
++#define KD_SOCK_TCP 64
++#define KD_SOCK_UDP 65
++
++/* kdSocketClose: Closes a socket. */
++KD_API KDint KD_APIENTRY kdSocketClose(KDSocket *socket);
++
++/* kdSocketBind: Bind a socket. */
++KD_API KDint KD_APIENTRY kdSocketBind(KDSocket *socket, const struct KDSockaddr *addr, KDboolean reuse);
++#define KD_INADDR_ANY 0
++
++/* kdSocketGetName: Get the local address of a socket. */
++KD_API KDint KD_APIENTRY kdSocketGetName(KDSocket *socket, struct KDSockaddr *addr);
++
++/* kdSocketConnect: Connects a socket. */
++KD_API KDint KD_APIENTRY kdSocketConnect(KDSocket *socket, const KDSockaddr *addr);
++
++/* kdSocketListen: Listen on a socket. */
++KD_API KDint KD_APIENTRY kdSocketListen(KDSocket *socket, KDint backlog);
++
++/* kdSocketAccept: Accept an incoming connection. */
++KD_API KDSocket *KD_APIENTRY kdSocketAccept(KDSocket *socket, KDSockaddr *addr, void *eventuserptr);
++
++/* kdSocketSend, kdSocketSendTo: Send data to a socket. */
++KD_API KDint KD_APIENTRY kdSocketSend(KDSocket *socket, const void *buf, KDint len);
++KD_API KDint KD_APIENTRY kdSocketSendTo(KDSocket *socket, const void *buf, KDint len, const KDSockaddr *addr);
++
++/* kdSocketRecv, kdSocketRecvFrom: Receive data from a socket. */
++KD_API KDint KD_APIENTRY kdSocketRecv(KDSocket *socket, void *buf, KDint len);
++KD_API KDint KD_APIENTRY kdSocketRecvFrom(KDSocket *socket, void *buf, KDint len, KDSockaddr *addr);
++
++/* kdHtonl: Convert a 32-bit integer from host to network byte order. */
++KD_API KDuint32 KD_APIENTRY kdHtonl(KDuint32 hostlong);
++
++/* kdHtons: Convert a 16-bit integer from host to network byte order. */
++KD_API KDuint16 KD_APIENTRY kdHtons(KDuint16 hostshort);
++
++/* kdNtohl: Convert a 32-bit integer from network to host byte order. */
++KD_API KDuint32 KD_APIENTRY kdNtohl(KDuint32 netlong);
++
++/* kdNtohs: Convert a 16-bit integer from network to host byte order. */
++KD_API KDuint16 KD_APIENTRY kdNtohs(KDuint16 netshort);
++
++/* kdInetAton: Convert a &#8220;dotted quad&#8221; format address to an integer. */
++KD_API KDint KD_APIENTRY kdInetAton(const KDchar *cp, KDuint32 *inp);
++
++/* kdInetNtop: Convert a network address to textual form. */
++#define KD_INET_ADDRSTRLEN 16
++typedef struct KDInAddr {
++    KDuint32 s_addr;
++} KDInAddr;
++KD_API const KDchar *KD_APIENTRY kdInetNtop(KDuint af, const void *src, KDchar *dst, KDsize cnt);
++
++/* KD_EVENT_SOCKET_READABLE: Event to indicate that a socket is readable. */
++#define KD_EVENT_SOCKET_READABLE 49
++typedef struct KDEventSocketReadable {
++    KDSocket *socket;
++} KDEventSocketReadable;
++
++/* KD_EVENT_SOCKET_WRITABLE: Event to indicate that a socket is writable. */
++#define KD_EVENT_SOCKET_WRITABLE 50
++typedef struct KDEventSocketWritable {
++    KDSocket *socket;
++} KDEventSocketWritable;
++
++/* KD_EVENT_SOCKET_CONNECT_COMPLETE: Event generated when a socket connect is complete */
++#define KD_EVENT_SOCKET_CONNECT_COMPLETE 51
++typedef struct KDEventSocketConnect {
++    KDSocket *socket;
++    KDint32 error;
++} KDEventSocketConnect;
++
++/* KD_EVENT_SOCKET_INCOMING: Event generated when a listening socket detects an incoming connection or an error. */
++#define KD_EVENT_SOCKET_INCOMING 52
++typedef struct KDEventSocketIncoming {
++    KDSocket *socket;
++} KDEventSocketIncoming;
++
++/* KD_EVENT_NAME_LOOKUP_COMPLETE: kdNameLookup complete event. */
++#define KD_EVENT_NAME_LOOKUP_COMPLETE 53
++typedef struct KDEventNameLookup {
++    KDint32 error;
++    KDint32 resultlen;
++    const KDSockaddr *result;
++    KDboolean more;
++} KDEventNameLookup;
++
++/*******************************************************
++ * Input/output
++ *******************************************************/
++
++/* KD_EVENT_STATE: State changed event. */
++#define KD_EVENT_STATE 55
++
++typedef struct KDEventState {
++    KDint32 index;
++    union {
++        KDint32 i;
++        KDint64 l;
++        KDfloat32 f;
++    } value;
++} KDEventState;
++
++/* KD_EVENT_INPUT: Input changed event. */
++#define KD_EVENT_INPUT 56
++
++typedef struct KDEventInput {
++    KDint32 index;
++    union {
++        KDint32 i;
++        KDint64 l;
++        KDfloat32 f;
++    } value;
++} KDEventInput;
++
++/* KD_EVENT_INPUT_JOG: Jogdial jog event. */
++#define KD_EVENT_INPUT_JOG 71
++typedef struct KDEventInputJog {
++    KDint32 index;
++    KDint32 count;
++} KDEventInputJog;
++
++/* KD_EVENT_INPUT_POINTER: Pointer input changed event. */
++#define KD_EVENT_INPUT_POINTER 57
++typedef struct KDEventInputPointer {
++    KDint32 index;
++    KDint32 select;
++    KDint32 x;
++    KDint32 y;
++} KDEventInputPointer;
++
++/* KD_EVENT_INPUT_STICK: Joystick stick changed event. */
++#define KD_EVENT_INPUT_STICK 58
++typedef struct KDEventInputStick {
++    KDint32 index;
++    KDint32 x;
++    KDint32 y;
++    KDint32 z;
++} KDEventInputStick;
++
++/* kdStateGeti, kdStateGetl, kdStateGetf: get state value(s) */
++KD_API KDint KD_APIENTRY kdStateGeti(KDint startidx, KDuint numidxs, KDint32 *buffer);
++KD_API KDint KD_APIENTRY kdStateGetl(KDint startidx, KDuint numidxs, KDint64 *buffer);
++KD_API KDint KD_APIENTRY kdStateGetf(KDint startidx, KDuint numidxs, KDfloat32 *buffer);
++
++/* kdOutputSeti, kdOutputSetf: set outputs */
++KD_API KDint KD_APIENTRY kdOutputSeti(KDint startidx, KDuint numidxs, const KDint32 *buffer);
++KD_API KDint KD_APIENTRY kdOutputSetf(KDint startidx, KDuint numidxs, const KDfloat32 *buffer);
++#define KD_IO_CONTROLLER_STRIDE 64
++
++/* KD_IOGROUP_GAMEKEYS: I/O group for game keys. */
++#define KD_IOGROUP_GAMEKEYS 0x1000
++#define KD_STATE_GAMEKEYS_AVAILABILITY    (KD_IOGROUP_GAMEKEYS + 0)
++#define KD_INPUT_GAMEKEYS_UP              (KD_IOGROUP_GAMEKEYS + 1)
++#define KD_INPUT_GAMEKEYS_LEFT            (KD_IOGROUP_GAMEKEYS + 2)
++#define KD_INPUT_GAMEKEYS_RIGHT           (KD_IOGROUP_GAMEKEYS + 3)
++#define KD_INPUT_GAMEKEYS_DOWN            (KD_IOGROUP_GAMEKEYS + 4)
++#define KD_INPUT_GAMEKEYS_FIRE            (KD_IOGROUP_GAMEKEYS + 5)
++#define KD_INPUT_GAMEKEYS_A               (KD_IOGROUP_GAMEKEYS + 6)
++#define KD_INPUT_GAMEKEYS_B               (KD_IOGROUP_GAMEKEYS + 7)
++#define KD_INPUT_GAMEKEYS_C               (KD_IOGROUP_GAMEKEYS + 8)
++#define KD_INPUT_GAMEKEYS_D               (KD_IOGROUP_GAMEKEYS + 9)
++
++/* KD_IOGROUP_GAMEKEYSNC: I/O group for game keys, no chording. */
++#define KD_IOGROUP_GAMEKEYSNC 0x1100
++#define KD_STATE_GAMEKEYSNC_AVAILABILITY  (KD_IOGROUP_GAMEKEYSNC + 0)
++#define KD_INPUT_GAMEKEYSNC_UP            (KD_IOGROUP_GAMEKEYSNC + 1)
++#define KD_INPUT_GAMEKEYSNC_LEFT          (KD_IOGROUP_GAMEKEYSNC + 2)
++#define KD_INPUT_GAMEKEYSNC_RIGHT         (KD_IOGROUP_GAMEKEYSNC + 3)
++#define KD_INPUT_GAMEKEYSNC_DOWN          (KD_IOGROUP_GAMEKEYSNC + 4)
++#define KD_INPUT_GAMEKEYSNC_FIRE          (KD_IOGROUP_GAMEKEYSNC + 5)
++#define KD_INPUT_GAMEKEYSNC_A             (KD_IOGROUP_GAMEKEYSNC + 6)
++#define KD_INPUT_GAMEKEYSNC_B             (KD_IOGROUP_GAMEKEYSNC + 7)
++#define KD_INPUT_GAMEKEYSNC_C             (KD_IOGROUP_GAMEKEYSNC + 8)
++#define KD_INPUT_GAMEKEYSNC_D             (KD_IOGROUP_GAMEKEYSNC + 9)
++
++/* KD_IOGROUP_PHONEKEYPAD: I/O group for phone keypad. */
++#define KD_IOGROUP_PHONEKEYPAD 0x2000
++#define KD_STATE_PHONEKEYPAD_AVAILABILITY  (KD_IOGROUP_PHONEKEYPAD + 0)
++#define KD_INPUT_PHONEKEYPAD_0             (KD_IOGROUP_PHONEKEYPAD + 1)
++#define KD_INPUT_PHONEKEYPAD_1             (KD_IOGROUP_PHONEKEYPAD + 2)
++#define KD_INPUT_PHONEKEYPAD_2             (KD_IOGROUP_PHONEKEYPAD + 3)
++#define KD_INPUT_PHONEKEYPAD_3             (KD_IOGROUP_PHONEKEYPAD + 4)
++#define KD_INPUT_PHONEKEYPAD_4             (KD_IOGROUP_PHONEKEYPAD + 5)
++#define KD_INPUT_PHONEKEYPAD_5             (KD_IOGROUP_PHONEKEYPAD + 6)
++#define KD_INPUT_PHONEKEYPAD_6             (KD_IOGROUP_PHONEKEYPAD + 7)
++#define KD_INPUT_PHONEKEYPAD_7             (KD_IOGROUP_PHONEKEYPAD + 8)
++#define KD_INPUT_PHONEKEYPAD_8             (KD_IOGROUP_PHONEKEYPAD + 9)
++#define KD_INPUT_PHONEKEYPAD_9             (KD_IOGROUP_PHONEKEYPAD + 10)
++#define KD_INPUT_PHONEKEYPAD_STAR          (KD_IOGROUP_PHONEKEYPAD + 11)
++#define KD_INPUT_PHONEKEYPAD_HASH          (KD_IOGROUP_PHONEKEYPAD + 12)
++#define KD_INPUT_PHONEKEYPAD_LEFTSOFT      (KD_IOGROUP_PHONEKEYPAD + 13)
++#define KD_INPUT_PHONEKEYPAD_RIGHTSOFT     (KD_IOGROUP_PHONEKEYPAD + 14)
++#define KD_STATE_PHONEKEYPAD_ORIENTATION   (KD_IOGROUP_PHONEKEYPAD + 15)
++
++/* KD_IOGROUP_VIBRATE: I/O group for vibrate. */
++#define KD_IOGROUP_VIBRATE 0x3000
++#define KD_STATE_VIBRATE_AVAILABILITY  (KD_IOGROUP_VIBRATE + 0)
++#define KD_STATE_VIBRATE_MINFREQUENCY  (KD_IOGROUP_VIBRATE + 1)
++#define KD_STATE_VIBRATE_MAXFREQUENCY  (KD_IOGROUP_VIBRATE + 2)
++#define KD_OUTPUT_VIBRATE_VOLUME        (KD_IOGROUP_VIBRATE + 3)
++#define KD_OUTPUT_VIBRATE_FREQUENCY     (KD_IOGROUP_VIBRATE + 4)
++
++/* KD_IOGROUP_POINTER: I/O group for pointer. */
++#define KD_IOGROUP_POINTER 0x4000
++#define KD_STATE_POINTER_AVAILABILITY  (KD_IOGROUP_POINTER + 0)
++#define KD_INPUT_POINTER_X             (KD_IOGROUP_POINTER + 1)
++#define KD_INPUT_POINTER_Y             (KD_IOGROUP_POINTER + 2)
++#define KD_INPUT_POINTER_SELECT        (KD_IOGROUP_POINTER + 3)
++
++/* KD_IOGROUP_BACKLIGHT: I/O group for backlight. */
++#define KD_IOGROUP_BACKLIGHT 0x5000
++#define KD_STATE_BACKLIGHT_AVAILABILITY (KD_IOGROUP_BACKLIGHT + 0)
++#define KD_OUTPUT_BACKLIGHT_FORCE (KD_IOGROUP_BACKLIGHT + 1)
++
++/* KD_IOGROUP_JOGDIAL: I/O group for a jog dial. */
++#define KD_IOGROUP_JOGDIAL 0x6000
++#define KD_STATE_JOGDIAL_AVAILABILITY  (KD_IOGROUP_JOGDIAL + 0)
++#define KD_INPUT_JOGDIAL_UP            (KD_IOGROUP_JOGDIAL + 1)
++#define KD_INPUT_JOGDIAL_LEFT          (KD_IOGROUP_JOGDIAL + 2)
++#define KD_INPUT_JOGDIAL_RIGHT         (KD_IOGROUP_JOGDIAL + 3)
++#define KD_INPUT_JOGDIAL_DOWN          (KD_IOGROUP_JOGDIAL + 4)
++#define KD_INPUT_JOGDIAL_SELECT        (KD_IOGROUP_JOGDIAL + 5)
++
++/* KD_IOGROUP_STICK: I/O group for joystick. */
++#define KD_IOGROUP_STICK 0x7000
++#define KD_STATE_STICK_AVAILABILITY    (KD_IOGROUP_STICK + 0)
++#define KD_INPUT_STICK_X               (KD_IOGROUP_STICK + 1)
++#define KD_INPUT_STICK_Y               (KD_IOGROUP_STICK + 2)
++#define KD_INPUT_STICK_Z               (KD_IOGROUP_STICK + 3)
++#define KD_INPUT_STICK_BUTTON          (KD_IOGROUP_STICK + 4)
++#define KD_IO_STICK_STRIDE 8
++
++/* KD_IOGROUP_DPAD: I/O group for D-pad. */
++#define KD_IOGROUP_DPAD 0x8000
++#define KD_STATE_DPAD_AVAILABILITY     (KD_IOGROUP_DPAD + 0)
++#define KD_STATE_DPAD_COPY             (KD_IOGROUP_DPAD + 1)
++#define KD_INPUT_DPAD_UP               (KD_IOGROUP_DPAD + 2)
++#define KD_INPUT_DPAD_LEFT             (KD_IOGROUP_DPAD + 3)
++#define KD_INPUT_DPAD_RIGHT            (KD_IOGROUP_DPAD + 4)
++#define KD_INPUT_DPAD_DOWN             (KD_IOGROUP_DPAD + 5)
++#define KD_INPUT_DPAD_SELECT           (KD_IOGROUP_DPAD + 6)
++#define KD_IO_DPAD_STRIDE 8
++
++/* KD_IOGROUP_BUTTONS: I/O group for buttons associated with joystick or D-pad. */
++#define KD_IOGROUP_BUTTONS 0x9000
++#define KD_STATE_BUTTONS_AVAILABILITY  (KD_IOGROUP_BUTTONS + 0)
++#define KD_INPUT_BUTTONS_0             (KD_IOGROUP_BUTTONS + 1)
++
++/* KD_IO_UNDEFINED: I/O items reserved for implementation-dependent use. */
++#define KD_IO_UNDEFINED 0x40000000
++
++/*******************************************************
++ * Windowing
++ *******************************************************/
++#ifdef KD_WINDOW_SUPPORTED
++#include <EGL/egl.h>
++typedef struct KDWindow KDWindow;
++
++/* kdCreateWindow: Create a window. */
++KD_API KDWindow *KD_APIENTRY kdCreateWindow(EGLDisplay display, EGLConfig config, void *eventuserptr);
++
++/* kdDestroyWindow: Destroy a window. */
++KD_API KDint KD_APIENTRY kdDestroyWindow(KDWindow *window);
++
++/* kdSetWindowPropertybv, kdSetWindowPropertyiv, kdSetWindowPropertycv: Set a window property to request a change in the on-screen representation of the window. */
++KD_API KDint KD_APIENTRY kdSetWindowPropertybv(KDWindow *window, KDint pname, const KDboolean *param);
++KD_API KDint KD_APIENTRY kdSetWindowPropertyiv(KDWindow *window, KDint pname, const KDint32 *param);
++KD_API KDint KD_APIENTRY kdSetWindowPropertycv(KDWindow *window, KDint pname, const KDchar *param);
++
++/* kdGetWindowPropertybv, kdGetWindowPropertyiv, kdGetWindowPropertycv: Get the current value of a window property. */
++KD_API KDint KD_APIENTRY kdGetWindowPropertybv(KDWindow *window, KDint pname, KDboolean *param);
++KD_API KDint KD_APIENTRY kdGetWindowPropertyiv(KDWindow *window, KDint pname, KDint32 *param);
++KD_API KDint KD_APIENTRY kdGetWindowPropertycv(KDWindow *window, KDint pname, KDchar *param, KDsize *size);
++
++/* kdRealizeWindow: Realize the window as a displayable entity and get the native window handle for passing to EGL. */
++KD_API KDint KD_APIENTRY kdRealizeWindow(KDWindow *window, EGLNativeWindowType *nativewindow);
++
++/* KD_WINDOWPROPERTY_SIZE: Window client area width and height. */
++#define KD_WINDOWPROPERTY_SIZE 66
++
++/* KD_WINDOWPROPERTY_VISIBILITY: Window visibility status. */
++#define KD_WINDOWPROPERTY_VISIBILITY 67
++
++/* KD_WINDOWPROPERTY_FOCUS: Window input focus status. */
++#define KD_WINDOWPROPERTY_FOCUS 68
++
++/* KD_WINDOWPROPERTY_CAPTION: Window caption. */
++#define KD_WINDOWPROPERTY_CAPTION 69
++
++/* KD_EVENT_WINDOW_CLOSE: Event to request to close window. */
++#define KD_EVENT_WINDOW_CLOSE 44
++
++/* KD_EVENT_WINDOWPROPERTY_CHANGE: Notification about realized window property change. */
++#define KD_EVENT_WINDOWPROPERTY_CHANGE 47
++typedef struct KDEventWindowProperty {
++    KDint32 pname;
++} KDEventWindowProperty;
++
++/* KD_EVENT_WINDOW_FOCUS: Event for change of window&#8217;s focus state. */
++#define KD_EVENT_WINDOW_FOCUS 60
++typedef struct KDEventWindowFocus {
++    KDint32 focusstate;
++} KDEventWindowFocus;
++
++/* KD_EVENT_WINDOW_REDRAW: Event to notify need to redraw the window. */
++#define KD_EVENT_WINDOW_REDRAW 59
++#endif /* KD_WINDOW_SUPPORTED */
++
++/*******************************************************
++ * Assertions and logging
++ *******************************************************/
++
++/* kdHandleAssertion: Handle assertion failure. */
++KD_API void KD_APIENTRY kdHandleAssertion(const KDchar *condition, const KDchar *filename, KDint linenumber);
++
++/* kdLogMessage: Output a log message. */
++#ifdef KD_NDEBUG
++#define kdLogMessage(s)
++#else
++KD_API void KD_APIENTRY kdLogMessage(const KDchar *string);
++#endif
++
++/* struct KDEvent delayed to the end as it uses event data structs from
++ * other parts of the .h file. */
++struct KDEvent {
++    KDust timestamp;
++    KDint32 type;
++    void *userptr;
++    union KDEventData {
++        KDEventState state;
++        KDEventInput input;
++        KDEventInputJog inputjog;
++        KDEventInputPointer inputpointer;
++        KDEventInputStick inputstick;
++        KDEventSocketReadable socketreadable;
++        KDEventSocketWritable socketwritable;
++        KDEventSocketConnect socketconnect;
++        KDEventSocketIncoming socketincoming;
++        KDEventNameLookup namelookup;
++#ifdef KD_WINDOW_SUPPORTED
++        KDEventWindowProperty windowproperty;
++        KDEventWindowFocus windowfocus;
++#endif /* KD_WINDOW_SUPPORTED */
++        KDEventUser user;
++    } data;
++};
++
++#ifdef __cplusplus
++}
++#endif
++
++#endif /* __kd_h_ */
++
+diff -rupN a/usr/include/KD/kdplatform.h b/usr/include/KD/kdplatform.h
+--- a/usr/include/KD/kdplatform.h	1970-01-01 01:00:00.000000000 +0100
++++ b/usr/include/KD/kdplatform.h	2013-10-02 03:16:58.000000000 +0200
+@@ -0,0 +1,37 @@
++/* Sample KD/kdplatform.h for OpenKODE Core 1.0.3  */
++#ifndef __kdplatform_h_
++#define __kdplatform_h_
++
++#define KD_API
++#define KD_APIENTRY
++
++typedef int KDint32;
++typedef unsigned int KDuint32;
++typedef long long KDint64;
++typedef unsigned long long KDuint64;
++typedef short KDint16;
++typedef unsigned short KDuint16;
++typedef unsigned long KDuintptr;
++typedef unsigned long KDsize;
++typedef long KDssize;
++#define KDINT_MIN (-0x7fffffff-1)
++#define KDINT_MAX 0x7fffffff
++#define KDUINT_MAX 0xffffffffU
++#define KDINT64_MIN (-0x7fffffffffffffffLL-1)
++#define KDINT64_MAX 0x7fffffffffffffffLL
++#define KDUINT64_MAX 0xffffffffffffffffULL
++#define KDSSIZE_MIN (-0x7fffffff-1)
++#define KDSSIZE_MAX 0x7fffffff
++#define KDSIZE_MAX 0xffffffffU
++#define KDUINTPTR_MAX 0xffffffffU
++#define KD_NORETURN
++#define KD_INFINITY (1.0F/0.0F)
++#define KD_WINDOW_SUPPORTED
++#ifdef KD_NDEBUG
++#define kdAssert(c)
++#else
++#define kdAssert(c) ((void)( (c) ? 0 : (kdHandleAssertion(#c, __FILE__, __LINE__), 0)))
++#endif
++
++#endif /* __kdplatform_h_ */
++
+diff -rupN a/usr/include/KD/KHR_float64.h b/usr/include/KD/KHR_float64.h
+--- a/usr/include/KD/KHR_float64.h	1970-01-01 01:00:00.000000000 +0100
++++ b/usr/include/KD/KHR_float64.h	2013-10-02 03:16:58.000000000 +0200
+@@ -0,0 +1,66 @@
++
++/*******************************************************
++ * OpenKODE Core extension: KD_KHR_float64
++ *******************************************************/
++/* Sample KD/KHR_float64.h for OpenKODE Core */
++#ifndef __kd_KHR_float64_h_
++#define __kd_KHR_float64_h_
++#include <KD/kd.h>
++
++#ifdef __cplusplus
++extern "C" {
++#endif
++
++
++typedef double KDfloat64KHR;
++#define KD_E_KHR 2.718281828459045235
++#define KD_PI_KHR 3.141592653589793239
++#define KD_PI_2_KHR 1.570796326794896619
++#define KD_2PI_KHR 6.283185307179586477
++#define KD_LOG2E_KHR 1.442695040888963407
++#define KD_LOG10E_KHR 0.4342944819032518276
++#define KD_LN2_KHR 0.6931471805599453094
++#define KD_LN10_KHR 2.302585092994045684
++#define KD_PI_4_KHR 0.7853981633974483096
++#define KD_1_PI_KHR 0.3183098861837906715
++#define KD_2_PI_KHR 0.6366197723675813431
++#define KD_2_SQRTPI_KHR 1.128379167095512574
++#define KD_SQRT2_KHR 1.414213562373095049
++#define KD_SQRT1_2_KHR 0.7071067811865475244
++#define KD_DBL_EPSILON_KHR 2.2204460492503131e-16
++#define KD_DBL_MAX_KHR 1.7976931348623157e+308
++#define KD_DBL_MIN_KHR 2.2250738585072014e-308
++#define KD_HUGE_VAL_KHR (1.0/0.0)
++#define KD_DEG_TO_RAD_KHR 0.01745329251994329577
++#define KD_RAD_TO_DEG_KHR 57.29577951308232088
++KD_API KDfloat64KHR KD_APIENTRY kdAcosKHR(KDfloat64KHR x);
++KD_API KDfloat64KHR KD_APIENTRY kdAsinKHR(KDfloat64KHR x);
++KD_API KDfloat64KHR KD_APIENTRY kdAtanKHR(KDfloat64KHR x);
++KD_API KDfloat64KHR KD_APIENTRY kdAtan2KHR(KDfloat64KHR y, KDfloat64KHR x);
++KD_API KDfloat64KHR KD_APIENTRY kdCosKHR(KDfloat64KHR x);
++KD_API KDfloat64KHR KD_APIENTRY kdSinKHR(KDfloat64KHR x);
++KD_API KDfloat64KHR KD_APIENTRY kdTanKHR(KDfloat64KHR x);
++KD_API KDfloat64KHR KD_APIENTRY kdExpKHR(KDfloat64KHR x);
++KD_API KDfloat64KHR KD_APIENTRY kdLogKHR(KDfloat64KHR x);
++KD_API KDfloat64KHR KD_APIENTRY kdFabsKHR(KDfloat64KHR x);
++KD_API KDfloat64KHR KD_APIENTRY kdPowKHR(KDfloat64KHR x, KDfloat64KHR y);
++KD_API KDfloat64KHR KD_APIENTRY kdSqrtKHR(KDfloat64KHR x);
++KD_API KDfloat64KHR KD_APIENTRY kdCeilKHR(KDfloat64KHR x);
++KD_API KDfloat64KHR KD_APIENTRY kdFloorKHR(KDfloat64KHR x);
++KD_API KDfloat64KHR KD_APIENTRY kdRoundKHR(KDfloat64KHR x);
++KD_API KDfloat64KHR KD_APIENTRY kdInvsqrtKHR(KDfloat64KHR x);
++KD_API KDfloat64KHR KD_APIENTRY kdFmodKHR(KDfloat64KHR x, KDfloat64KHR y);
++
++/* kdStrtodKHR: Convert a string to a 64-bit floating point number. */
++KD_API KDfloat64KHR KD_APIENTRY kdStrtodKHR(const KDchar *s, KDchar **endptr);
++
++/* kdDtostrKHR: Convert a 64-bit float to a string. */
++#define KD_DTOSTR_MAXLEN_KHR 25
++KD_API KDssize KD_APIENTRY kdDtostrKHR(KDchar *buffer, KDsize buflen, KDfloat64KHR number);
++
++#ifdef __cplusplus
++}
++#endif
++
++#endif /* __kd_KHR_float64_h_ */
++
+diff -rupN a/usr/include/KD/KHR_formatted.h b/usr/include/KD/KHR_formatted.h
+--- a/usr/include/KD/KHR_formatted.h	1970-01-01 01:00:00.000000000 +0100
++++ b/usr/include/KD/KHR_formatted.h	2013-10-02 03:16:58.000000000 +0200
+@@ -0,0 +1,43 @@
++
++/*******************************************************
++ * OpenKODE Core extension: KD_KHR_formatted
++ *******************************************************/
++/* Sample KD/KHR_formatted.h for OpenKODE Core */
++#ifndef __kd_KHR_formatted_h_
++#define __kd_KHR_formatted_h_
++#include <KD/kd.h>
++
++#ifdef __cplusplus
++extern "C" {
++#endif
++
++
++typedef void *KDVaListKHR; /* example implementation only */
++
++/* kdSnprintfKHR, kdVsnprintfKHR, kdSprintfKHR, kdVsprintfKHR: Formatted output to a buffer. */
++KD_API KDint KD_APIENTRY kdSnprintfKHR(KDchar *buf, KDsize bufsize, const KDchar *format, ...);
++KD_API KDint KD_APIENTRY kdVsnprintfKHR(KDchar *buf, KDsize bufsize, const KDchar *format, KDVaListKHR ap);
++KD_API KDint KD_APIENTRY kdSprintfKHR(KDchar *buf, const KDchar *format, ...);
++KD_API KDint KD_APIENTRY kdVsprintfKHR(KDchar *buf, const KDchar *format, KDVaListKHR ap);
++
++/* kdFprintfKHR, kdVfprintfKHR: Formatted output to an open file. */
++KD_API KDint KD_APIENTRY kdFprintfKHR(KDFile *file, const KDchar *format, ...);
++KD_API KDint KD_APIENTRY kdVfprintfKHR(KDFile *file, const KDchar *format, KDVaListKHR ap);
++
++/* kdLogMessagefKHR: Formatted output to the platform&#8217;s debug logging facility. */
++KD_API KDint KD_APIENTRY kdLogMessagefKHR(const KDchar *format, ...);
++
++/* kdSscanfKHR, kdVsscanfKHR: Read formatted input from a buffer. */
++KD_API KDint KD_APIENTRY kdSscanfKHR(const KDchar *str, const KDchar *format, ...);
++KD_API KDint KD_APIENTRY kdVsscanfKHR(const KDchar *str, const KDchar *format, KDVaListKHR ap);
++
++/* kdFscanfKHR, kdVfscanfKHR: Read formatted input from a file. */
++KD_API KDint KD_APIENTRY kdFscanfKHR(KDFile *file, const KDchar *format, ...);
++KD_API KDint KD_APIENTRY kdVfscanfKHR(KDFile *file, const KDchar *format, KDVaListKHR ap);
++
++#ifdef __cplusplus
++}
++#endif
++
++#endif /* __kd_KHR_formatted_h_ */
++
+diff -rupN a/usr/include/KD/KHR_perfcounter.h b/usr/include/KD/KHR_perfcounter.h
+--- a/usr/include/KD/KHR_perfcounter.h	1970-01-01 01:00:00.000000000 +0100
++++ b/usr/include/KD/KHR_perfcounter.h	2013-10-02 03:16:58.000000000 +0200
+@@ -0,0 +1,54 @@
++
++/*******************************************************
++ * OpenKODE Core extension: KD_KHR_perfcounter
++ *******************************************************/
++/* Sample KD/KHR_perfcounter.h for OpenKODE Core */
++#ifndef __kd_KHR_perfcounter_h_
++#define __kd_KHR_perfcounter_h_
++#include <KD/kd.h>
++
++#ifdef __cplusplus
++extern "C" {
++#endif
++
++
++#define KD_INFINITE_COUNTER_VAL_KHR (KDINT64_MAX)
++#define KD_UNKNOWN_COUNTER_VAL_KHR (-1)
++
++/* KDCounterInfoKHR: Information on a single performance counter. */
++typedef struct KDCounterInfoKHR {
++    const KDchar *vendorName;
++    const KDchar *name;
++    const KDchar *description;
++    KDint64 minValue;
++    KDint64 maxValue;
++    KDfloat32 defaultScale;
++} KDCounterInfoKHR;
++
++/* kdGetNumberOfCountersKHR: Return the number of performance counters. */
++KD_API KDint KD_APIENTRY kdGetNumberOfCountersKHR(void);
++
++/* kdGetCounterInformationKHR: Retrieve information on a performance counter. */
++KD_API const KDCounterInfoKHR *KD_APIENTRY kdGetCounterInformationKHR(KDint index);
++
++/* kdActivateCountersKHR: Make counters active. */
++KD_API KDint KD_APIENTRY kdActivateCountersKHR(const KDint *indexes, KDint numindexes);
++
++/* kdDeactivateCountersKHR: Makes counters inactive. */
++KD_API KDint KD_APIENTRY kdDeactivateCountersKHR(const KDint *indexes, KDint numindexes);
++
++/* kdStartSamplingKHR: Start the performance counters sampling. */
++KD_API KDint KD_APIENTRY kdStartSamplingKHR(void);
++
++/* kdStopSamplingKHR: Stop the performance counters sampling. */
++KD_API KDint KD_APIENTRY kdStopSamplingKHR(void);
++
++/* kdGetCounterValuesKHR: Retrieves list of counter values. */
++KD_API KDint KD_APIENTRY kdGetCounterValuesKHR(const KDint *indexes, KDint numindexes, KDint64 *values);
++
++#ifdef __cplusplus
++}
++#endif
++
++#endif /* __kd_KHR_perfcounter_h_ */
++
+diff -rupN a/usr/include/KD/KHR_thread_storage.h b/usr/include/KD/KHR_thread_storage.h
+--- a/usr/include/KD/KHR_thread_storage.h	1970-01-01 01:00:00.000000000 +0100
++++ b/usr/include/KD/KHR_thread_storage.h	2013-10-02 03:16:58.000000000 +0200
+@@ -0,0 +1,33 @@
++
++/*******************************************************
++ * OpenKODE Core extension: KD_KHR_thread_storage
++ *******************************************************/
++/* Sample KD/KHR_thread_storage.h for OpenKODE Core */
++#ifndef __kd_KHR_thread_storage_h_
++#define __kd_KHR_thread_storage_h_
++#include <KD/kd.h>
++
++#ifdef __cplusplus
++extern "C" {
++#endif
++
++
++
++/* KDThreadStorageKeyKHR: The representation of a thread storage key. */
++typedef KDuint32 KDThreadStorageKeyKHR;
++
++/* kdMapThreadStorageKHR: Maps an arbitrary pointer to a global thread storage key. */
++KD_API KDThreadStorageKeyKHR KD_APIENTRY KD_APIENTRY kdMapThreadStorageKHR(const void * id);
++
++/* kdSetThreadStorageKHR: Stores thread-local data. */
++KD_API KDint KD_APIENTRY KD_APIENTRY kdSetThreadStorageKHR(KDThreadStorageKeyKHR key, void * data);
++
++/* kdGetThreadStorageKHR: Retrieves previously stored thread-local data. */
++KD_API void * KD_APIENTRY KD_APIENTRY kdGetThreadStorageKHR(KDThreadStorageKeyKHR key);
++
++#ifdef __cplusplus
++}
++#endif
++
++#endif /* __kd_KHR_thread_storage_h_ */
++
+diff -rupN a/usr/include/KHR/khrplatform.h b/usr/include/KHR/khrplatform.h
+--- a/usr/include/KHR/khrplatform.h	1970-01-01 01:00:00.000000000 +0100
++++ b/usr/include/KHR/khrplatform.h	2013-10-09 09:57:33.000000000 +0200
+@@ -0,0 +1,282 @@
++#ifndef __khrplatform_h_
++#define __khrplatform_h_
++
++/*
++** Copyright (c) 2008-2009 The Khronos Group Inc.
++**
++** Permission is hereby granted, free of charge, to any person obtaining a
++** copy of this software and/or associated documentation files (the
++** "Materials"), to deal in the Materials without restriction, including
++** without limitation the rights to use, copy, modify, merge, publish,
++** distribute, sublicense, and/or sell copies of the Materials, and to
++** permit persons to whom the Materials are furnished to do so, subject to
++** the following conditions:
++**
++** The above copyright notice and this permission notice shall be included
++** in all copies or substantial portions of the Materials.
++**
++** THE MATERIALS ARE PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
++** EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
++** MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
++** IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
++** CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
++** TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
++** MATERIALS OR THE USE OR OTHER DEALINGS IN THE MATERIALS.
++*/
++
++/* Khronos platform-specific types and definitions.
++ *
++ * $Revision: 23298 $ on $Date: 2013-09-30 17:07:13 -0700 (Mon, 30 Sep 2013) $
++ *
++ * Adopters may modify this file to suit their platform. Adopters are
++ * encouraged to submit platform specific modifications to the Khronos
++ * group so that they can be included in future versions of this file.
++ * Please submit changes by sending them to the public Khronos Bugzilla
++ * (http://khronos.org/bugzilla) by filing a bug against product
++ * "Khronos (general)" component "Registry".
++ *
++ * A predefined template which fills in some of the bug fields can be
++ * reached using http://tinyurl.com/khrplatform-h-bugreport, but you
++ * must create a Bugzilla login first.
++ *
++ *
++ * See the Implementer's Guidelines for information about where this file
++ * should be located on your system and for more details of its use:
++ *    http://www.khronos.org/registry/implementers_guide.pdf
++ *
++ * This file should be included as
++ *        #include <KHR/khrplatform.h>
++ * by Khronos client API header files that use its types and defines.
++ *
++ * The types in khrplatform.h should only be used to define API-specific types.
++ *
++ * Types defined in khrplatform.h:
++ *    khronos_int8_t              signed   8  bit
++ *    khronos_uint8_t             unsigned 8  bit
++ *    khronos_int16_t             signed   16 bit
++ *    khronos_uint16_t            unsigned 16 bit
++ *    khronos_int32_t             signed   32 bit
++ *    khronos_uint32_t            unsigned 32 bit
++ *    khronos_int64_t             signed   64 bit
++ *    khronos_uint64_t            unsigned 64 bit
++ *    khronos_intptr_t            signed   same number of bits as a pointer
++ *    khronos_uintptr_t           unsigned same number of bits as a pointer
++ *    khronos_ssize_t             signed   size
++ *    khronos_usize_t             unsigned size
++ *    khronos_float_t             signed   32 bit floating point
++ *    khronos_time_ns_t           unsigned 64 bit time in nanoseconds
++ *    khronos_utime_nanoseconds_t unsigned time interval or absolute time in
++ *                                         nanoseconds
++ *    khronos_stime_nanoseconds_t signed time interval in nanoseconds
++ *    khronos_boolean_enum_t      enumerated boolean type. This should
++ *      only be used as a base type when a client API's boolean type is
++ *      an enum. Client APIs which use an integer or other type for
++ *      booleans cannot use this as the base type for their boolean.
++ *
++ * Tokens defined in khrplatform.h:
++ *
++ *    KHRONOS_FALSE, KHRONOS_TRUE Enumerated boolean false/true values.
++ *
++ *    KHRONOS_SUPPORT_INT64 is 1 if 64 bit integers are supported; otherwise 0.
++ *    KHRONOS_SUPPORT_FLOAT is 1 if floats are supported; otherwise 0.
++ *
++ * Calling convention macros defined in this file:
++ *    KHRONOS_APICALL
++ *    KHRONOS_APIENTRY
++ *    KHRONOS_APIATTRIBUTES
++ *
++ * These may be used in function prototypes as:
++ *
++ *      KHRONOS_APICALL void KHRONOS_APIENTRY funcname(
++ *                                  int arg1,
++ *                                  int arg2) KHRONOS_APIATTRIBUTES;
++ */
++
++/*-------------------------------------------------------------------------
++ * Definition of KHRONOS_APICALL
++ *-------------------------------------------------------------------------
++ * This precedes the return type of the function in the function prototype.
++ */
++#if defined(_WIN32) && !defined(__SCITECH_SNAP__)
++#   define KHRONOS_APICALL __declspec(dllimport)
++#elif defined (__SYMBIAN32__)
++#   define KHRONOS_APICALL IMPORT_C
++#else
++#   define KHRONOS_APICALL
++#endif
++
++/*-------------------------------------------------------------------------
++ * Definition of KHRONOS_APIENTRY
++ *-------------------------------------------------------------------------
++ * This follows the return type of the function  and precedes the function
++ * name in the function prototype.
++ */
++#if defined(_WIN32) && !defined(_WIN32_WCE) && !defined(__SCITECH_SNAP__)
++    /* Win32 but not WinCE */
++#   define KHRONOS_APIENTRY __stdcall
++#else
++#   define KHRONOS_APIENTRY
++#endif
++
++/*-------------------------------------------------------------------------
++ * Definition of KHRONOS_APIATTRIBUTES
++ *-------------------------------------------------------------------------
++ * This follows the closing parenthesis of the function prototype arguments.
++ */
++#if defined (__ARMCC_2__)
++#define KHRONOS_APIATTRIBUTES __softfp
++#else
++#define KHRONOS_APIATTRIBUTES
++#endif
++
++/*-------------------------------------------------------------------------
++ * basic type definitions
++ *-----------------------------------------------------------------------*/
++#if (defined(__STDC_VERSION__) && __STDC_VERSION__ >= 199901L) || defined(__GNUC__) || defined(__SCO__) || defined(__USLC__)
++
++
++/*
++ * Using <stdint.h>
++ */
++#include <stdint.h>
++typedef int32_t                 khronos_int32_t;
++typedef uint32_t                khronos_uint32_t;
++typedef int64_t                 khronos_int64_t;
++typedef uint64_t                khronos_uint64_t;
++#define KHRONOS_SUPPORT_INT64   1
++#define KHRONOS_SUPPORT_FLOAT   1
++
++#elif defined(__VMS ) || defined(__sgi)
++
++/*
++ * Using <inttypes.h>
++ */
++#include <inttypes.h>
++typedef int32_t                 khronos_int32_t;
++typedef uint32_t                khronos_uint32_t;
++typedef int64_t                 khronos_int64_t;
++typedef uint64_t                khronos_uint64_t;
++#define KHRONOS_SUPPORT_INT64   1
++#define KHRONOS_SUPPORT_FLOAT   1
++
++#elif defined(_WIN32) && !defined(__SCITECH_SNAP__)
++
++/*
++ * Win32
++ */
++typedef __int32                 khronos_int32_t;
++typedef unsigned __int32        khronos_uint32_t;
++typedef __int64                 khronos_int64_t;
++typedef unsigned __int64        khronos_uint64_t;
++#define KHRONOS_SUPPORT_INT64   1
++#define KHRONOS_SUPPORT_FLOAT   1
++
++#elif defined(__sun__) || defined(__digital__)
++
++/*
++ * Sun or Digital
++ */
++typedef int                     khronos_int32_t;
++typedef unsigned int            khronos_uint32_t;
++#if defined(__arch64__) || defined(_LP64)
++typedef long int                khronos_int64_t;
++typedef unsigned long int       khronos_uint64_t;
++#else
++typedef long long int           khronos_int64_t;
++typedef unsigned long long int  khronos_uint64_t;
++#endif /* __arch64__ */
++#define KHRONOS_SUPPORT_INT64   1
++#define KHRONOS_SUPPORT_FLOAT   1
++
++#elif 0
++
++/*
++ * Hypothetical platform with no float or int64 support
++ */
++typedef int                     khronos_int32_t;
++typedef unsigned int            khronos_uint32_t;
++#define KHRONOS_SUPPORT_INT64   0
++#define KHRONOS_SUPPORT_FLOAT   0
++
++#else
++
++/*
++ * Generic fallback
++ */
++#include <stdint.h>
++typedef int32_t                 khronos_int32_t;
++typedef uint32_t                khronos_uint32_t;
++typedef int64_t                 khronos_int64_t;
++typedef uint64_t                khronos_uint64_t;
++#define KHRONOS_SUPPORT_INT64   1
++#define KHRONOS_SUPPORT_FLOAT   1
++
++#endif
++
++
++/*
++ * Types that are (so far) the same on all platforms
++ */
++typedef signed   char          khronos_int8_t;
++typedef unsigned char          khronos_uint8_t;
++typedef signed   short int     khronos_int16_t;
++typedef unsigned short int     khronos_uint16_t;
++
++/*
++ * Types that differ between LLP64 and LP64 architectures - in LLP64,
++ * pointers are 64 bits, but 'long' is still 32 bits. Win64 appears
++ * to be the only LLP64 architecture in current use.
++ */
++#ifdef _WIN64
++typedef signed   long long int khronos_intptr_t;
++typedef unsigned long long int khronos_uintptr_t;
++typedef signed   long long int khronos_ssize_t;
++typedef unsigned long long int khronos_usize_t;
++#else
++typedef signed   long  int     khronos_intptr_t;
++typedef unsigned long  int     khronos_uintptr_t;
++typedef signed   long  int     khronos_ssize_t;
++typedef unsigned long  int     khronos_usize_t;
++#endif
++
++#if KHRONOS_SUPPORT_FLOAT
++/*
++ * Float type
++ */
++typedef          float         khronos_float_t;
++#endif
++
++#if KHRONOS_SUPPORT_INT64
++/* Time types
++ *
++ * These types can be used to represent a time interval in nanoseconds or
++ * an absolute Unadjusted System Time.  Unadjusted System Time is the number
++ * of nanoseconds since some arbitrary system event (e.g. since the last
++ * time the system booted).  The Unadjusted System Time is an unsigned
++ * 64 bit value that wraps back to 0 every 584 years.  Time intervals
++ * may be either signed or unsigned.
++ */
++typedef khronos_uint64_t       khronos_utime_nanoseconds_t;
++typedef khronos_int64_t        khronos_stime_nanoseconds_t;
++#endif
++
++/*
++ * Dummy value used to pad enum types to 32 bits.
++ */
++#ifndef KHRONOS_MAX_ENUM
++#define KHRONOS_MAX_ENUM 0x7FFFFFFF
++#endif
++
++/*
++ * Enumerated boolean type
++ *
++ * Values other than zero should be considered to be true.  Therefore
++ * comparisons should not be made against KHRONOS_TRUE.
++ */
++typedef enum {
++    KHRONOS_FALSE = 0,
++    KHRONOS_TRUE  = 1,
++    KHRONOS_BOOLEAN_ENUM_FORCE_SIZE = KHRONOS_MAX_ENUM
++} khronos_boolean_enum_t;
++
++#endif /* __khrplatform_h_ */
+diff -rupN a/usr/include/OpenMAX/il/OMX_Audio.h b/usr/include/OpenMAX/il/OMX_Audio.h
+--- a/usr/include/OpenMAX/il/OMX_Audio.h	1970-01-01 01:00:00.000000000 +0100
++++ b/usr/include/OpenMAX/il/OMX_Audio.h	2011-08-09 09:08:06.000000000 +0200
+@@ -0,0 +1,1311 @@
++/*
++ * Copyright (c) 2008 The Khronos Group Inc.
++ *
++ * Permission is hereby granted, free of charge, to any person obtaining
++ * a copy of this software and associated documentation files (the
++ * "Software"), to deal in the Software without restriction, including
++ * without limitation the rights to use, copy, modify, merge, publish,
++ * distribute, sublicense, and/or sell copies of the Software, and to
++ * permit persons to whom the Software is furnished to do so, subject
++ * to the following conditions:
++ * The above copyright notice and this permission notice shall be included
++ * in all copies or substantial portions of the Software.
++ *
++ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS
++ * OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
++ * MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
++ * IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
++ * CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
++ * TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
++ * SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
++ *
++ */
++
++/** @file OMX_Audio.h - OpenMax IL version 1.1.2
++ *  The structures needed by Audio components to exchange
++ *  parameters and configuration data with the componenmilts.
++ */
++
++#ifndef OMX_Audio_h
++#define OMX_Audio_h
++
++#ifdef __cplusplus
++extern "C" {
++#endif /* __cplusplus */
++
++
++/* Each OMX header must include all required header files to allow the
++ *  header to compile without errors.  The includes below are required
++ *  for this header file to compile successfully
++ */
++
++#include <OMX_Core.h>
++
++/** @defgroup midi MIDI
++ * @ingroup audio
++ */
++
++/** @defgroup effects Audio effects
++ * @ingroup audio
++ */
++
++/** @defgroup audio OpenMAX IL Audio Domain
++ * Structures for OpenMAX IL Audio domain
++ * @{
++ */
++
++/** Enumeration used to define the possible audio codings.
++ *  If "OMX_AUDIO_CodingUnused" is selected, the coding selection must
++ *  be done in a vendor specific way.  Since this is for an audio
++ *  processing element this enum is relevant.  However, for another
++ *  type of component other enums would be in this area.
++ */
++typedef enum OMX_AUDIO_CODINGTYPE {
++    OMX_AUDIO_CodingUnused = 0,  /**< Placeholder value when coding is N/A  */
++    OMX_AUDIO_CodingAutoDetect,  /**< auto detection of audio format */
++    OMX_AUDIO_CodingPCM,         /**< Any variant of PCM coding */
++    OMX_AUDIO_CodingADPCM,       /**< Any variant of ADPCM encoded data */
++    OMX_AUDIO_CodingAMR,         /**< Any variant of AMR encoded data */
++    OMX_AUDIO_CodingGSMFR,       /**< Any variant of GSM fullrate (i.e. GSM610) */
++    OMX_AUDIO_CodingGSMEFR,      /**< Any variant of GSM Enhanced Fullrate encoded data*/
++    OMX_AUDIO_CodingGSMHR,       /**< Any variant of GSM Halfrate encoded data */
++    OMX_AUDIO_CodingPDCFR,       /**< Any variant of PDC Fullrate encoded data */
++    OMX_AUDIO_CodingPDCEFR,      /**< Any variant of PDC Enhanced Fullrate encoded data */
++    OMX_AUDIO_CodingPDCHR,       /**< Any variant of PDC Halfrate encoded data */
++    OMX_AUDIO_CodingTDMAFR,      /**< Any variant of TDMA Fullrate encoded data (TIA/EIA-136-420) */
++    OMX_AUDIO_CodingTDMAEFR,     /**< Any variant of TDMA Enhanced Fullrate encoded data (TIA/EIA-136-410) */
++    OMX_AUDIO_CodingQCELP8,      /**< Any variant of QCELP 8kbps encoded data */
++    OMX_AUDIO_CodingQCELP13,     /**< Any variant of QCELP 13kbps encoded data */
++    OMX_AUDIO_CodingEVRC,        /**< Any variant of EVRC encoded data */
++    OMX_AUDIO_CodingSMV,         /**< Any variant of SMV encoded data */
++    OMX_AUDIO_CodingG711,        /**< Any variant of G.711 encoded data */
++    OMX_AUDIO_CodingG723,        /**< Any variant of G.723 dot 1 encoded data */
++    OMX_AUDIO_CodingG726,        /**< Any variant of G.726 encoded data */
++    OMX_AUDIO_CodingG729,        /**< Any variant of G.729 encoded data */
++    OMX_AUDIO_CodingAAC,         /**< Any variant of AAC encoded data */
++    OMX_AUDIO_CodingMP3,         /**< Any variant of MP3 encoded data */
++    OMX_AUDIO_CodingSBC,         /**< Any variant of SBC encoded data */
++    OMX_AUDIO_CodingVORBIS,      /**< Any variant of VORBIS encoded data */
++    OMX_AUDIO_CodingWMA,         /**< Any variant of WMA encoded data */
++    OMX_AUDIO_CodingRA,          /**< Any variant of RA encoded data */
++    OMX_AUDIO_CodingMIDI,        /**< Any variant of MIDI encoded data */
++    OMX_AUDIO_CodingKhronosExtensions = 0x6F000000, /**< Reserved region for introducing Khronos Standard Extensions */
++    OMX_AUDIO_CodingVendorStartUnused = 0x7F000000, /**< Reserved region for introducing Vendor Extensions */
++    OMX_AUDIO_CodingMax = 0x7FFFFFFF
++} OMX_AUDIO_CODINGTYPE;
++
++
++/** The PortDefinition structure is used to define all of the parameters
++ *  necessary for the compliant component to setup an input or an output audio
++ *  path.  If additional information is needed to define the parameters of the
++ *  port (such as frequency), additional structures must be sent such as the
++ *  OMX_AUDIO_PARAM_PCMMODETYPE structure to supply the extra parameters for the port.
++ */
++typedef struct OMX_AUDIO_PORTDEFINITIONTYPE {
++    OMX_STRING cMIMEType;            /**< MIME type of data for the port */
++    OMX_NATIVE_DEVICETYPE pNativeRender; /** < platform specific reference
++                                               for an output device,
++                                               otherwise this field is 0 */
++    OMX_BOOL bFlagErrorConcealment;  /**< Turns on error concealment if it is
++                                          supported by the OMX component */
++    OMX_AUDIO_CODINGTYPE eEncoding;  /**< Type of data expected for this
++                                          port (e.g. PCM, AMR, MP3, etc) */
++} OMX_AUDIO_PORTDEFINITIONTYPE;
++
++
++/**  Port format parameter.  This structure is used to enumerate
++  *  the various data input/output format supported by the port.
++  */
++typedef struct OMX_AUDIO_PARAM_PORTFORMATTYPE {
++    OMX_U32 nSize;                  /**< size of the structure in bytes */
++    OMX_VERSIONTYPE nVersion;       /**< OMX specification version information */
++    OMX_U32 nPortIndex;             /**< Indicates which port to set */
++    OMX_U32 nIndex;                 /**< Indicates the enumeration index for the format from 0x0 to N-1 */
++    OMX_AUDIO_CODINGTYPE eEncoding; /**< Type of data expected for this port (e.g. PCM, AMR, MP3, etc) */
++} OMX_AUDIO_PARAM_PORTFORMATTYPE;
++
++
++/** PCM mode type  */
++typedef enum OMX_AUDIO_PCMMODETYPE {
++    OMX_AUDIO_PCMModeLinear = 0,  /**< Linear PCM encoded data */
++    OMX_AUDIO_PCMModeALaw,        /**< A law PCM encoded data (G.711) */
++    OMX_AUDIO_PCMModeMULaw,       /**< Mu law PCM encoded data (G.711)  */
++    OMX_AUDIO_PCMModeKhronosExtensions = 0x6F000000, /**< Reserved region for introducing Khronos Standard Extensions */
++    OMX_AUDIO_PCMModeVendorStartUnused = 0x7F000000, /**< Reserved region for introducing Vendor Extensions */
++    OMX_AUDIO_PCMModeMax = 0x7FFFFFFF
++} OMX_AUDIO_PCMMODETYPE;
++
++
++typedef enum OMX_AUDIO_CHANNELTYPE {
++    OMX_AUDIO_ChannelNone = 0x0,    /**< Unused or empty */
++    OMX_AUDIO_ChannelLF   = 0x1,    /**< Left front */
++    OMX_AUDIO_ChannelRF   = 0x2,    /**< Right front */
++    OMX_AUDIO_ChannelCF   = 0x3,    /**< Center front */
++    OMX_AUDIO_ChannelLS   = 0x4,    /**< Left surround */
++    OMX_AUDIO_ChannelRS   = 0x5,    /**< Right surround */
++    OMX_AUDIO_ChannelLFE  = 0x6,    /**< Low frequency effects */
++    OMX_AUDIO_ChannelCS   = 0x7,    /**< Back surround */
++    OMX_AUDIO_ChannelLR   = 0x8,    /**< Left rear. */
++    OMX_AUDIO_ChannelRR   = 0x9,    /**< Right rear. */
++    OMX_AUDIO_ChannelKhronosExtensions = 0x6F000000, /**< Reserved region for introducing Khronos Standard Extensions */
++    OMX_AUDIO_ChannelVendorStartUnused = 0x7F000000, /**< Reserved region for introducing Vendor Extensions */
++    OMX_AUDIO_ChannelMax  = 0x7FFFFFFF
++} OMX_AUDIO_CHANNELTYPE;
++
++#define OMX_AUDIO_MAXCHANNELS 16  /**< maximum number distinct audio channels that a buffer may contain */
++#define OMX_MIN_PCMPAYLOAD_MSEC 5 /**< Minimum audio buffer payload size for uncompressed (PCM) audio */
++
++/** PCM format description */
++typedef struct OMX_AUDIO_PARAM_PCMMODETYPE {
++    OMX_U32 nSize;                    /**< Size of this structure, in Bytes */
++    OMX_VERSIONTYPE nVersion;         /**< OMX specification version information */
++    OMX_U32 nPortIndex;               /**< port that this structure applies to */
++    OMX_U32 nChannels;                /**< Number of channels (e.g. 2 for stereo) */
++    OMX_NUMERICALDATATYPE eNumData;   /**< indicates PCM data as signed or unsigned */
++    OMX_ENDIANTYPE eEndian;           /**< indicates PCM data as little or big endian */
++    OMX_BOOL bInterleaved;            /**< True for normal interleaved data; false for
++                                           non-interleaved data (e.g. block data) */
++    OMX_U32 nBitPerSample;            /**< Bit per sample */
++    OMX_U32 nSamplingRate;            /**< Sampling rate of the source data.  Use 0 for
++                                           variable or unknown sampling rate. */
++    OMX_AUDIO_PCMMODETYPE ePCMMode;   /**< PCM mode enumeration */
++    OMX_AUDIO_CHANNELTYPE eChannelMapping[OMX_AUDIO_MAXCHANNELS]; /**< Slot i contains channel defined by eChannelMap[i] */
++
++} OMX_AUDIO_PARAM_PCMMODETYPE;
++
++
++/** Audio channel mode.  This is used by both AAC and MP3, although the names are more appropriate
++ * for the MP3.  For example, JointStereo for MP3 is CouplingChannels for AAC.
++ */
++typedef enum OMX_AUDIO_CHANNELMODETYPE {
++    OMX_AUDIO_ChannelModeStereo = 0,  /**< 2 channels, the bitrate allocation between those
++                                          two channels changes accordingly to each channel information */
++    OMX_AUDIO_ChannelModeJointStereo, /**< mode that takes advantage of what is common between
++                                           2 channels for higher compression gain */
++    OMX_AUDIO_ChannelModeDual,        /**< 2 mono-channels, each channel is encoded with half
++                                           the bitrate of the overall bitrate */
++    OMX_AUDIO_ChannelModeMono,        /**< Mono channel mode */
++    OMX_AUDIO_ChannelModeKhronosExtensions = 0x6F000000, /**< Reserved region for introducing Khronos Standard Extensions */
++    OMX_AUDIO_ChannelModeVendorStartUnused = 0x7F000000, /**< Reserved region for introducing Vendor Extensions */
++    OMX_AUDIO_ChannelModeMax = 0x7FFFFFFF
++} OMX_AUDIO_CHANNELMODETYPE;
++
++
++typedef enum OMX_AUDIO_MP3STREAMFORMATTYPE {
++    OMX_AUDIO_MP3StreamFormatMP1Layer3 = 0, /**< MP3 Audio MPEG 1 Layer 3 Stream format */
++    OMX_AUDIO_MP3StreamFormatMP2Layer3,     /**< MP3 Audio MPEG 2 Layer 3 Stream format */
++    OMX_AUDIO_MP3StreamFormatMP2_5Layer3,   /**< MP3 Audio MPEG2.5 Layer 3 Stream format */
++    OMX_AUDIO_MP3StreamFormatKhronosExtensions = 0x6F000000, /**< Reserved region for introducing Khronos Standard Extensions */
++    OMX_AUDIO_MP3StreamFormatVendorStartUnused = 0x7F000000, /**< Reserved region for introducing Vendor Extensions */
++    OMX_AUDIO_MP3StreamFormatMax = 0x7FFFFFFF
++} OMX_AUDIO_MP3STREAMFORMATTYPE;
++
++/** MP3 params */
++typedef struct OMX_AUDIO_PARAM_MP3TYPE {
++    OMX_U32 nSize;                 /**< size of the structure in bytes */
++    OMX_VERSIONTYPE nVersion;      /**< OMX specification version information */
++    OMX_U32 nPortIndex;            /**< port that this structure applies to */
++    OMX_U32 nChannels;             /**< Number of channels */
++    OMX_U32 nBitRate;              /**< Bit rate of the input data.  Use 0 for variable
++                                        rate or unknown bit rates */
++    OMX_U32 nSampleRate;           /**< Sampling rate of the source data.  Use 0 for
++                                        variable or unknown sampling rate. */
++    OMX_U32 nAudioBandWidth;       /**< Audio band width (in Hz) to which an encoder should
++                                        limit the audio signal. Use 0 to let encoder decide */
++    OMX_AUDIO_CHANNELMODETYPE eChannelMode;   /**< Channel mode enumeration */
++    OMX_AUDIO_MP3STREAMFORMATTYPE eFormat;  /**< MP3 stream format */
++} OMX_AUDIO_PARAM_MP3TYPE;
++
++
++typedef enum OMX_AUDIO_AACSTREAMFORMATTYPE {
++    OMX_AUDIO_AACStreamFormatMP2ADTS = 0, /**< AAC Audio Data Transport Stream 2 format */
++    OMX_AUDIO_AACStreamFormatMP4ADTS,     /**< AAC Audio Data Transport Stream 4 format */
++    OMX_AUDIO_AACStreamFormatMP4LOAS,     /**< AAC Low Overhead Audio Stream format */
++    OMX_AUDIO_AACStreamFormatMP4LATM,     /**< AAC Low overhead Audio Transport Multiplex */
++    OMX_AUDIO_AACStreamFormatADIF,        /**< AAC Audio Data Interchange Format */
++    OMX_AUDIO_AACStreamFormatMP4FF,       /**< AAC inside MPEG-4/ISO File Format */
++    OMX_AUDIO_AACStreamFormatRAW,         /**< AAC Raw Format */
++    OMX_AUDIO_AACStreamFormatKhronosExtensions = 0x6F000000, /**< Reserved region for introducing Khronos Standard Extensions */
++    OMX_AUDIO_AACStreamFormatVendorStartUnused = 0x7F000000, /**< Reserved region for introducing Vendor Extensions */
++    OMX_AUDIO_AACStreamFormatMax = 0x7FFFFFFF
++} OMX_AUDIO_AACSTREAMFORMATTYPE;
++
++
++/** AAC mode type.  Note that the term profile is used with the MPEG-2
++ * standard and the term object type and profile is used with MPEG-4 */
++typedef enum OMX_AUDIO_AACPROFILETYPE{
++  OMX_AUDIO_AACObjectNull = 0,      /**< Null, not used */
++  OMX_AUDIO_AACObjectMain = 1,      /**< AAC Main object */
++  OMX_AUDIO_AACObjectLC,            /**< AAC Low Complexity object (AAC profile) */
++  OMX_AUDIO_AACObjectSSR,           /**< AAC Scalable Sample Rate object */
++  OMX_AUDIO_AACObjectLTP,           /**< AAC Long Term Prediction object */
++  OMX_AUDIO_AACObjectHE,            /**< AAC High Efficiency (object type SBR, HE-AAC profile) */
++  OMX_AUDIO_AACObjectScalable,      /**< AAC Scalable object */
++  OMX_AUDIO_AACObjectERLC = 17,     /**< ER AAC Low Complexity object (Error Resilient AAC-LC) */
++  OMX_AUDIO_AACObjectLD = 23,       /**< AAC Low Delay object (Error Resilient) */
++  OMX_AUDIO_AACObjectHE_PS = 29,    /**< AAC High Efficiency with Parametric Stereo coding (HE-AAC v2, object type PS) */
++  OMX_AUDIO_AACObjectKhronosExtensions = 0x6F000000, /**< Reserved region for introducing Khronos Standard Extensions */
++  OMX_AUDIO_AACObjectVendorStartUnused = 0x7F000000, /**< Reserved region for introducing Vendor Extensions */
++  OMX_AUDIO_AACObjectMax = 0x7FFFFFFF
++} OMX_AUDIO_AACPROFILETYPE;
++
++
++/** AAC tool usage (for nAACtools in OMX_AUDIO_PARAM_AACPROFILETYPE).
++ * Required for encoder configuration and optional as decoder info output.
++ * For MP3, OMX_AUDIO_CHANNELMODETYPE is sufficient. */
++#define OMX_AUDIO_AACToolNone 0x00000000 /**< no AAC tools allowed (encoder config) or active (decoder info output) */
++#define OMX_AUDIO_AACToolMS   0x00000001 /**< MS: Mid/side joint coding tool allowed or active */
++#define OMX_AUDIO_AACToolIS   0x00000002 /**< IS: Intensity stereo tool allowed or active */
++#define OMX_AUDIO_AACToolTNS  0x00000004 /**< TNS: Temporal Noise Shaping tool allowed or active */
++#define OMX_AUDIO_AACToolPNS  0x00000008 /**< PNS: MPEG-4 Perceptual Noise substitution tool allowed or active */
++#define OMX_AUDIO_AACToolLTP  0x00000010 /**< LTP: MPEG-4 Long Term Prediction tool allowed or active */
++#define OMX_AUDIO_AACToolAll  0x7FFFFFFF /**< all AAC tools allowed or active (*/
++
++/** MPEG-4 AAC error resilience (ER) tool usage (for nAACERtools in OMX_AUDIO_PARAM_AACPROFILETYPE).
++ * Required for ER encoder configuration and optional as decoder info output */
++#define OMX_AUDIO_AACERNone  0x00000000  /**< no AAC ER tools allowed/used */
++#define OMX_AUDIO_AACERVCB11 0x00000001  /**< VCB11: Virtual Code Books for AAC section data */
++#define OMX_AUDIO_AACERRVLC  0x00000002  /**< RVLC: Reversible Variable Length Coding */
++#define OMX_AUDIO_AACERHCR   0x00000004  /**< HCR: Huffman Codeword Reordering */
++#define OMX_AUDIO_AACERAll   0x7FFFFFFF  /**< all AAC ER tools allowed/used */
++
++
++/** AAC params */
++typedef struct OMX_AUDIO_PARAM_AACPROFILETYPE {
++    OMX_U32 nSize;                 /**< Size of this structure, in Bytes */
++    OMX_VERSIONTYPE nVersion;      /**< OMX specification version information */
++    OMX_U32 nPortIndex;            /**< Port that this structure applies to */
++    OMX_U32 nChannels;             /**< Number of channels */
++    OMX_U32 nSampleRate;           /**< Sampling rate of the source data.  Use 0 for
++                                        variable or unknown sampling rate. */
++    OMX_U32 nBitRate;              /**< Bit rate of the input data.  Use 0 for variable
++                                        rate or unknown bit rates */
++    OMX_U32 nAudioBandWidth;       /**< Audio band width (in Hz) to which an encoder should
++                                        limit the audio signal. Use 0 to let encoder decide */
++    OMX_U32 nFrameLength;          /**< Frame length (in audio samples per channel) of the codec.
++                                        Can be 1024 or 960 (AAC-LC), 2048 (HE-AAC), 480 or 512 (AAC-LD).
++                                        Use 0 to let encoder decide */
++    OMX_U32 nAACtools;             /**< AAC tool usage */
++    OMX_U32 nAACERtools;           /**< MPEG-4 AAC error resilience tool usage */
++    OMX_AUDIO_AACPROFILETYPE eAACProfile;   /**< AAC profile enumeration */
++    OMX_AUDIO_AACSTREAMFORMATTYPE eAACStreamFormat; /**< AAC stream format enumeration */
++    OMX_AUDIO_CHANNELMODETYPE eChannelMode;   /**< Channel mode enumeration */
++} OMX_AUDIO_PARAM_AACPROFILETYPE;
++
++
++/** VORBIS params */
++typedef struct OMX_AUDIO_PARAM_VORBISTYPE {
++    OMX_U32 nSize;            /**< size of the structure in bytes */
++    OMX_VERSIONTYPE nVersion; /**< OMX specification version information */
++    OMX_U32 nPortIndex;       /**< port that this structure applies to */
++    OMX_U32 nChannels;        /**< Number of channels */
++    OMX_U32 nBitRate;         /**< Bit rate of the encoded data data.  Use 0 for variable
++                                   rate or unknown bit rates. Encoding is set to the
++                                   bitrate closest to specified  value (in bps) */
++    OMX_U32 nMinBitRate;      /**< Sets minimum bitrate (in bps). */
++    OMX_U32 nMaxBitRate;      /**< Sets maximum bitrate (in bps). */
++
++    OMX_U32 nSampleRate;      /**< Sampling rate of the source data.  Use 0 for
++                                   variable or unknown sampling rate. */
++    OMX_U32 nAudioBandWidth;  /**< Audio band width (in Hz) to which an encoder should
++                                   limit the audio signal. Use 0 to let encoder decide */
++    OMX_S32 nQuality;		  /**< Sets encoding quality to n, between -1 (low) and 10 (high).
++                                   In the default mode of operation, teh quality level is 3.
++                                   Normal quality range is 0 - 10. */
++    OMX_BOOL bManaged;		  /**< Set  bitrate  management  mode. This turns off the
++                                   normal VBR encoding, but allows hard or soft bitrate
++                                   constraints to be enforced by the encoder. This mode can
++                                   be slower, and may also be lower quality. It is
++                                   primarily useful for streaming. */
++    OMX_BOOL bDownmix;		  /**< Downmix input from stereo to mono (has no effect on
++                                   non-stereo streams). Useful for lower-bitrate encoding. */
++} OMX_AUDIO_PARAM_VORBISTYPE;
++
++
++/** WMA Version */
++typedef enum OMX_AUDIO_WMAFORMATTYPE {
++  OMX_AUDIO_WMAFormatUnused = 0, /**< format unused or unknown */
++  OMX_AUDIO_WMAFormat7,          /**< Windows Media Audio format 7 */
++  OMX_AUDIO_WMAFormat8,          /**< Windows Media Audio format 8 */
++  OMX_AUDIO_WMAFormat9,          /**< Windows Media Audio format 9 */
++  OMX_AUDIO_WMAFormatKhronosExtensions = 0x6F000000, /**< Reserved region for introducing Khronos Standard Extensions */
++  OMX_AUDIO_WMAFormatVendorStartUnused = 0x7F000000, /**< Reserved region for introducing Vendor Extensions */
++  OMX_AUDIO_WMAFormatMax = 0x7FFFFFFF
++} OMX_AUDIO_WMAFORMATTYPE;
++
++
++/** WMA Profile */
++typedef enum OMX_AUDIO_WMAPROFILETYPE {
++  OMX_AUDIO_WMAProfileUnused = 0,  /**< profile unused or unknown */
++  OMX_AUDIO_WMAProfileL1,          /**< Windows Media audio version 9 profile L1 */
++  OMX_AUDIO_WMAProfileL2,          /**< Windows Media audio version 9 profile L2 */
++  OMX_AUDIO_WMAProfileL3,          /**< Windows Media audio version 9 profile L3 */
++  OMX_AUDIO_WMAProfileKhronosExtensions = 0x6F000000, /**< Reserved region for introducing Khronos Standard Extensions */
++  OMX_AUDIO_WMAProfileVendorStartUnused = 0x7F000000, /**< Reserved region for introducing Vendor Extensions */
++  OMX_AUDIO_WMAProfileMax = 0x7FFFFFFF
++} OMX_AUDIO_WMAPROFILETYPE;
++
++
++/** WMA params */
++typedef struct OMX_AUDIO_PARAM_WMATYPE {
++    OMX_U32 nSize;            /**< size of the structure in bytes */
++    OMX_VERSIONTYPE nVersion; /**< OMX specification version information */
++    OMX_U32 nPortIndex;       /**< port that this structure applies to */
++    OMX_U16 nChannels;        /**< Number of channels */
++    OMX_U32 nBitRate;         /**< Bit rate of the input data.  Use 0 for variable
++                                   rate or unknown bit rates */
++    OMX_AUDIO_WMAFORMATTYPE eFormat; /**< Version of WMA stream / data */
++	OMX_AUDIO_WMAPROFILETYPE eProfile;  /**< Profile of WMA stream / data */
++    OMX_U32 nSamplingRate;    /**< Sampling rate of the source data */
++    OMX_U16 nBlockAlign;      /**< is the block alignment, or block size, in bytes of the audio codec */
++    OMX_U16 nEncodeOptions;   /**< WMA Type-specific data */
++    OMX_U32 nSuperBlockAlign; /**< WMA Type-specific data */
++} OMX_AUDIO_PARAM_WMATYPE;
++
++/**
++ * RealAudio format
++ */
++typedef enum OMX_AUDIO_RAFORMATTYPE {
++    OMX_AUDIO_RAFormatUnused = 0, /**< Format unused or unknown */
++    OMX_AUDIO_RA8,                /**< RealAudio 8 codec */
++    OMX_AUDIO_RA9,                /**< RealAudio 9 codec */
++    OMX_AUDIO_RA10_AAC,           /**< MPEG-4 AAC codec for bitrates of more than 128kbps */
++    OMX_AUDIO_RA10_CODEC,         /**< RealAudio codec for bitrates less than 128 kbps */
++    OMX_AUDIO_RA10_LOSSLESS,      /**< RealAudio Lossless */
++    OMX_AUDIO_RA10_MULTICHANNEL,  /**< RealAudio Multichannel */
++    OMX_AUDIO_RA10_VOICE,         /**< RealAudio Voice for bitrates below 15 kbps */
++    OMX_AUDIO_RAFormatKhronosExtensions = 0x6F000000, /**< Reserved region for introducing Khronos Standard Extensions */
++    OMX_AUDIO_RAFormatVendorStartUnused = 0x7F000000, /**< Reserved region for introducing Vendor Extensions */
++    OMX_VIDEO_RAFormatMax = 0x7FFFFFFF
++} OMX_AUDIO_RAFORMATTYPE;
++
++/** RA (Real Audio) params */
++typedef struct OMX_AUDIO_PARAM_RATYPE {
++    OMX_U32 nSize;              /**< Size of this structure, in Bytes */
++    OMX_VERSIONTYPE nVersion;   /**< OMX specification version information */
++    OMX_U32 nPortIndex;         /**< Port that this structure applies to */
++    OMX_U32 nChannels;          /**< Number of channels */
++    OMX_U32 nSamplingRate;      /**< is the sampling rate of the source data */
++    OMX_U32 nBitsPerFrame;      /**< is the value for bits per frame  */
++    OMX_U32 nSamplePerFrame;    /**< is the value for samples per frame */
++    OMX_U32 nCouplingQuantBits; /**< is the number of coupling quantization bits in the stream */
++    OMX_U32 nCouplingStartRegion;   /**< is the coupling start region in the stream  */
++    OMX_U32 nNumRegions;        /**< is the number of regions value */
++    OMX_AUDIO_RAFORMATTYPE eFormat; /**< is the RealAudio audio format */
++} OMX_AUDIO_PARAM_RATYPE;
++
++
++/** SBC Allocation Method Type */
++typedef enum OMX_AUDIO_SBCALLOCMETHODTYPE {
++  OMX_AUDIO_SBCAllocMethodLoudness, /**< Loudness allocation method */
++  OMX_AUDIO_SBCAllocMethodSNR,      /**< SNR allocation method */
++  OMX_AUDIO_SBCAllocMethodKhronosExtensions = 0x6F000000, /**< Reserved region for introducing Khronos Standard Extensions */
++  OMX_AUDIO_SBCAllocMethodVendorStartUnused = 0x7F000000, /**< Reserved region for introducing Vendor Extensions */
++  OMX_AUDIO_SBCAllocMethodMax = 0x7FFFFFFF
++} OMX_AUDIO_SBCALLOCMETHODTYPE;
++
++
++/** SBC params */
++typedef struct OMX_AUDIO_PARAM_SBCTYPE {
++    OMX_U32 nSize;             /**< size of the structure in bytes */
++    OMX_VERSIONTYPE nVersion;  /**< OMX specification version information */
++    OMX_U32 nPortIndex;        /**< port that this structure applies to */
++    OMX_U32 nChannels;         /**< Number of channels */
++    OMX_U32 nBitRate;          /**< Bit rate of the input data.  Use 0 for variable
++                                    rate or unknown bit rates */
++    OMX_U32 nSampleRate;       /**< Sampling rate of the source data.  Use 0 for
++                                    variable or unknown sampling rate. */
++    OMX_U32 nBlocks;           /**< Number of blocks */
++    OMX_U32 nSubbands;         /**< Number of subbands */
++    OMX_U32 nBitPool;          /**< Bitpool value */
++    OMX_BOOL bEnableBitrate;   /**< Use bitrate value instead of bitpool */
++    OMX_AUDIO_CHANNELMODETYPE eChannelMode; /**< Channel mode enumeration */
++    OMX_AUDIO_SBCALLOCMETHODTYPE eSBCAllocType;   /**< SBC Allocation method type */
++} OMX_AUDIO_PARAM_SBCTYPE;
++
++
++/** ADPCM stream format parameters */
++typedef struct OMX_AUDIO_PARAM_ADPCMTYPE {
++    OMX_U32 nSize;              /**< size of the structure in bytes */
++    OMX_VERSIONTYPE nVersion;   /**< OMX specification version information */
++    OMX_U32 nPortIndex;         /**< port that this structure applies to */
++    OMX_U32 nChannels;          /**< Number of channels in the data stream (not
++                                     necessarily the same as the number of channels
++                                     to be rendered. */
++    OMX_U32 nBitsPerSample;     /**< Number of bits in each sample */
++    OMX_U32 nSampleRate;        /**< Sampling rate of the source data.  Use 0 for
++                                    variable or unknown sampling rate. */
++} OMX_AUDIO_PARAM_ADPCMTYPE;
++
++
++/** G723 rate */
++typedef enum OMX_AUDIO_G723RATE {
++    OMX_AUDIO_G723ModeUnused = 0,  /**< AMRNB Mode unused / unknown */
++    OMX_AUDIO_G723ModeLow,         /**< 5300 bps */
++    OMX_AUDIO_G723ModeHigh,        /**< 6300 bps */
++    OMX_AUDIO_G723ModeKhronosExtensions = 0x6F000000, /**< Reserved region for introducing Khronos Standard Extensions */
++    OMX_AUDIO_G723ModeVendorStartUnused = 0x7F000000, /**< Reserved region for introducing Vendor Extensions */
++    OMX_AUDIO_G723ModeMax = 0x7FFFFFFF
++} OMX_AUDIO_G723RATE;
++
++
++/** G723 - Sample rate must be 8 KHz */
++typedef struct OMX_AUDIO_PARAM_G723TYPE {
++    OMX_U32 nSize;                /**< size of the structure in bytes */
++    OMX_VERSIONTYPE nVersion;     /**< OMX specification version information */
++    OMX_U32 nPortIndex;           /**< port that this structure applies to */
++    OMX_U32 nChannels;            /**< Number of channels in the data stream (not
++                                       necessarily the same as the number of channels
++                                       to be rendered. */
++    OMX_BOOL bDTX;                /**< Enable Discontinuous Transmisssion */
++    OMX_AUDIO_G723RATE eBitRate;  /**< todo: Should this be moved to a config? */
++    OMX_BOOL bHiPassFilter;       /**< Enable High Pass Filter */
++    OMX_BOOL bPostFilter;         /**< Enable Post Filter */
++} OMX_AUDIO_PARAM_G723TYPE;
++
++
++/** ITU G726 (ADPCM) rate */
++typedef enum OMX_AUDIO_G726MODE {
++    OMX_AUDIO_G726ModeUnused = 0,  /**< G726 Mode unused / unknown */
++    OMX_AUDIO_G726Mode16,          /**< 16 kbps */
++    OMX_AUDIO_G726Mode24,          /**< 24 kbps */
++    OMX_AUDIO_G726Mode32,          /**< 32 kbps, most common rate, also G721 */
++    OMX_AUDIO_G726Mode40,          /**< 40 kbps */
++    OMX_AUDIO_G726ModeKhronosExtensions = 0x6F000000, /**< Reserved region for introducing Khronos Standard Extensions */
++    OMX_AUDIO_G726ModeVendorStartUnused = 0x7F000000, /**< Reserved region for introducing Vendor Extensions */
++    OMX_AUDIO_G726ModeMax = 0x7FFFFFFF
++} OMX_AUDIO_G726MODE;
++
++
++/** G.726 stream format parameters - must be at 8KHz */
++typedef struct OMX_AUDIO_PARAM_G726TYPE {
++    OMX_U32 nSize;              /**< size of the structure in bytes */
++    OMX_VERSIONTYPE nVersion;   /**< OMX specification version information */
++    OMX_U32 nPortIndex;         /**< port that this structure applies to */
++    OMX_U32 nChannels;          /**< Number of channels in the data stream (not
++                                     necessarily the same as the number of channels
++                                     to be rendered. */
++     OMX_AUDIO_G726MODE eG726Mode;
++} OMX_AUDIO_PARAM_G726TYPE;
++
++
++/** G729 coder type */
++typedef enum OMX_AUDIO_G729TYPE {
++    OMX_AUDIO_G729 = 0,           /**< ITU G.729  encoded data */
++    OMX_AUDIO_G729A,              /**< ITU G.729 annex A  encoded data */
++    OMX_AUDIO_G729B,              /**< ITU G.729 with annex B encoded data */
++    OMX_AUDIO_G729AB,             /**< ITU G.729 annexes A and B encoded data */
++    OMX_AUDIO_G729KhronosExtensions = 0x6F000000, /**< Reserved region for introducing Khronos Standard Extensions */
++    OMX_AUDIO_G729VendorStartUnused = 0x7F000000, /**< Reserved region for introducing Vendor Extensions */
++    OMX_AUDIO_G729Max = 0x7FFFFFFF
++} OMX_AUDIO_G729TYPE;
++
++
++/** G729 stream format parameters - fixed 6KHz sample rate */
++typedef struct OMX_AUDIO_PARAM_G729TYPE {
++    OMX_U32 nSize;            /**< size of the structure in bytes */
++    OMX_VERSIONTYPE nVersion; /**< OMX specification version information */
++    OMX_U32 nPortIndex;       /**< port that this structure applies to */
++    OMX_U32 nChannels;        /**< Number of channels in the data stream (not
++                                   necessarily the same as the number of channels
++                                   to be rendered. */
++    OMX_BOOL bDTX;            /**< Enable Discontinuous Transmisssion */
++    OMX_AUDIO_G729TYPE eBitType;
++} OMX_AUDIO_PARAM_G729TYPE;
++
++
++/** AMR Frame format */
++typedef enum OMX_AUDIO_AMRFRAMEFORMATTYPE {
++    OMX_AUDIO_AMRFrameFormatConformance = 0,  /**< Frame Format is AMR Conformance
++                                                   (Standard) Format */
++    OMX_AUDIO_AMRFrameFormatIF1,              /**< Frame Format is AMR Interface
++                                                   Format 1 */
++    OMX_AUDIO_AMRFrameFormatIF2,              /**< Frame Format is AMR Interface
++                                                   Format 2*/
++    OMX_AUDIO_AMRFrameFormatFSF,              /**< Frame Format is AMR File Storage
++                                                   Format */
++    OMX_AUDIO_AMRFrameFormatRTPPayload,       /**< Frame Format is AMR Real-Time
++                                                   Transport Protocol Payload Format */
++    OMX_AUDIO_AMRFrameFormatITU,              /**< Frame Format is ITU Format (added at Motorola request) */
++    OMX_AUDIO_AMRFrameFormatKhronosExtensions = 0x6F000000, /**< Reserved region for introducing Khronos Standard Extensions */
++    OMX_AUDIO_AMRFrameFormatVendorStartUnused = 0x7F000000, /**< Reserved region for introducing Vendor Extensions */
++    OMX_AUDIO_AMRFrameFormatMax = 0x7FFFFFFF
++} OMX_AUDIO_AMRFRAMEFORMATTYPE;
++
++
++/** AMR band mode */
++typedef enum OMX_AUDIO_AMRBANDMODETYPE {
++    OMX_AUDIO_AMRBandModeUnused = 0,          /**< AMRNB Mode unused / unknown */
++    OMX_AUDIO_AMRBandModeNB0,                 /**< AMRNB Mode 0 =  4750 bps */
++    OMX_AUDIO_AMRBandModeNB1,                 /**< AMRNB Mode 1 =  5150 bps */
++    OMX_AUDIO_AMRBandModeNB2,                 /**< AMRNB Mode 2 =  5900 bps */
++    OMX_AUDIO_AMRBandModeNB3,                 /**< AMRNB Mode 3 =  6700 bps */
++    OMX_AUDIO_AMRBandModeNB4,                 /**< AMRNB Mode 4 =  7400 bps */
++    OMX_AUDIO_AMRBandModeNB5,                 /**< AMRNB Mode 5 =  7950 bps */
++    OMX_AUDIO_AMRBandModeNB6,                 /**< AMRNB Mode 6 = 10200 bps */
++    OMX_AUDIO_AMRBandModeNB7,                 /**< AMRNB Mode 7 = 12200 bps */
++    OMX_AUDIO_AMRBandModeWB0,                 /**< AMRWB Mode 0 =  6600 bps */
++    OMX_AUDIO_AMRBandModeWB1,                 /**< AMRWB Mode 1 =  8850 bps */
++    OMX_AUDIO_AMRBandModeWB2,                 /**< AMRWB Mode 2 = 12650 bps */
++    OMX_AUDIO_AMRBandModeWB3,                 /**< AMRWB Mode 3 = 14250 bps */
++    OMX_AUDIO_AMRBandModeWB4,                 /**< AMRWB Mode 4 = 15850 bps */
++    OMX_AUDIO_AMRBandModeWB5,                 /**< AMRWB Mode 5 = 18250 bps */
++    OMX_AUDIO_AMRBandModeWB6,                 /**< AMRWB Mode 6 = 19850 bps */
++    OMX_AUDIO_AMRBandModeWB7,                 /**< AMRWB Mode 7 = 23050 bps */
++    OMX_AUDIO_AMRBandModeWB8,                 /**< AMRWB Mode 8 = 23850 bps */
++    OMX_AUDIO_AMRBandModeKhronosExtensions = 0x6F000000, /**< Reserved region for introducing Khronos Standard Extensions */
++    OMX_AUDIO_AMRBandModeVendorStartUnused = 0x7F000000, /**< Reserved region for introducing Vendor Extensions */
++    OMX_AUDIO_AMRBandModeMax = 0x7FFFFFFF
++} OMX_AUDIO_AMRBANDMODETYPE;
++
++
++/** AMR Discontinuous Transmission mode */
++typedef enum OMX_AUDIO_AMRDTXMODETYPE {
++    OMX_AUDIO_AMRDTXModeOff = 0,        /**< AMR Discontinuous Transmission Mode is disabled */
++    OMX_AUDIO_AMRDTXModeOnVAD1,         /**< AMR Discontinuous Transmission Mode using
++                                             Voice Activity Detector 1 (VAD1) is enabled */
++    OMX_AUDIO_AMRDTXModeOnVAD2,         /**< AMR Discontinuous Transmission Mode using
++                                             Voice Activity Detector 2 (VAD2) is enabled */
++    OMX_AUDIO_AMRDTXModeOnAuto,         /**< The codec will automatically select between
++                                             Off, VAD1 or VAD2 modes */
++
++    OMX_AUDIO_AMRDTXasEFR,             /**< DTX as EFR instead of AMR standard (3GPP 26.101, frame type =8,9,10) */
++
++    OMX_AUDIO_AMRDTXModeKhronosExtensions = 0x6F000000, /**< Reserved region for introducing Khronos Standard Extensions */
++    OMX_AUDIO_AMRDTXModeVendorStartUnused = 0x7F000000, /**< Reserved region for introducing Vendor Extensions */
++    OMX_AUDIO_AMRDTXModeMax = 0x7FFFFFFF
++} OMX_AUDIO_AMRDTXMODETYPE;
++
++
++/** AMR params */
++typedef struct OMX_AUDIO_PARAM_AMRTYPE {
++    OMX_U32 nSize;                          /**< size of the structure in bytes */
++    OMX_VERSIONTYPE nVersion;               /**< OMX specification version information */
++    OMX_U32 nPortIndex;                     /**< port that this structure applies to */
++    OMX_U32 nChannels;                      /**< Number of channels */
++    OMX_U32 nBitRate;                       /**< Bit rate read only field */
++    OMX_AUDIO_AMRBANDMODETYPE eAMRBandMode; /**< AMR Band Mode enumeration */
++    OMX_AUDIO_AMRDTXMODETYPE  eAMRDTXMode;  /**< AMR DTX Mode enumeration */
++    OMX_AUDIO_AMRFRAMEFORMATTYPE eAMRFrameFormat; /**< AMR frame format enumeration */
++} OMX_AUDIO_PARAM_AMRTYPE;
++
++
++/** GSM_FR (ETSI 06.10, 3GPP 46.010) stream format parameters */
++typedef struct OMX_AUDIO_PARAM_GSMFRTYPE {
++    OMX_U32 nSize;            /**< size of the structure in bytes */
++    OMX_VERSIONTYPE nVersion; /**< OMX specification version information */
++    OMX_U32 nPortIndex;       /**< port that this structure applies to */
++    OMX_BOOL bDTX;            /**< Enable Discontinuous Transmisssion */
++    OMX_BOOL bHiPassFilter;   /**< Enable High Pass Filter */
++} OMX_AUDIO_PARAM_GSMFRTYPE;
++
++
++/** GSM-HR (ETSI 06.20, 3GPP 46.020) stream format parameters */
++typedef struct OMX_AUDIO_PARAM_GSMHRTYPE {
++    OMX_U32 nSize;            /**< size of the structure in bytes */
++    OMX_VERSIONTYPE nVersion; /**< OMX specification version information */
++    OMX_U32 nPortIndex;       /**< port that this structure applies to */
++    OMX_BOOL bDTX;            /**< Enable Discontinuous Transmisssion */
++    OMX_BOOL bHiPassFilter;   /**< Enable High Pass Filter */
++} OMX_AUDIO_PARAM_GSMHRTYPE;
++
++
++/** GSM-EFR (ETSI 06.60, 3GPP 46.060) stream format parameters */
++typedef struct OMX_AUDIO_PARAM_GSMEFRTYPE {
++    OMX_U32 nSize;            /**< size of the structure in bytes */
++    OMX_VERSIONTYPE nVersion; /**< OMX specification version information */
++    OMX_U32 nPortIndex;       /**< port that this structure applies to */
++    OMX_BOOL bDTX;            /**< Enable Discontinuous Transmisssion */
++    OMX_BOOL bHiPassFilter;   /**< Enable High Pass Filter */
++} OMX_AUDIO_PARAM_GSMEFRTYPE;
++
++
++/** TDMA FR (TIA/EIA-136-420, VSELP 7.95kbps coder) stream format parameters */
++typedef struct OMX_AUDIO_PARAM_TDMAFRTYPE {
++    OMX_U32 nSize;                /**< size of the structure in bytes */
++    OMX_VERSIONTYPE nVersion;     /**< OMX specification version information */
++    OMX_U32 nPortIndex;           /**< port that this structure applies to */
++    OMX_U32 nChannels;            /**< Number of channels in the data stream (not
++                                       necessarily the same as the number of channels
++                                       to be rendered. */
++    OMX_BOOL bDTX;                /**< Enable Discontinuous Transmisssion */
++    OMX_BOOL bHiPassFilter;       /**< Enable High Pass Filter */
++} OMX_AUDIO_PARAM_TDMAFRTYPE;
++
++
++/** TDMA EFR (TIA/EIA-136-410, ACELP 7.4kbps coder) stream format parameters */
++typedef struct OMX_AUDIO_PARAM_TDMAEFRTYPE {
++    OMX_U32 nSize;                /**< size of the structure in bytes */
++    OMX_VERSIONTYPE nVersion;     /**< OMX specification version information */
++    OMX_U32 nPortIndex;           /**< port that this structure applies to */
++    OMX_U32 nChannels;            /**< Number of channels in the data stream (not
++                                       necessarily the same as the number of channels
++                                       to be rendered. */
++    OMX_BOOL bDTX;                /**< Enable Discontinuous Transmisssion */
++    OMX_BOOL bHiPassFilter;       /**< Enable High Pass Filter */
++} OMX_AUDIO_PARAM_TDMAEFRTYPE;
++
++
++/** PDC FR ( RCR-27, VSELP 6.7kbps coder) stream format parameters */
++typedef struct OMX_AUDIO_PARAM_PDCFRTYPE {
++    OMX_U32 nSize;                /**< size of the structure in bytes */
++    OMX_VERSIONTYPE nVersion;     /**< OMX specification version information */
++    OMX_U32 nPortIndex;           /**< port that this structure applies to */
++    OMX_U32 nChannels;            /**< Number of channels in the data stream (not
++                                       necessarily the same as the number of channels
++                                       to be rendered. */
++    OMX_BOOL bDTX;                /**< Enable Discontinuous Transmisssion */
++    OMX_BOOL bHiPassFilter;       /**< Enable High Pass Filter */
++} OMX_AUDIO_PARAM_PDCFRTYPE;
++
++
++/** PDC EFR ( RCR-27, ACELP 6.7kbps coder) stream format parameters */
++typedef struct OMX_AUDIO_PARAM_PDCEFRTYPE {
++    OMX_U32 nSize;                /**< size of the structure in bytes */
++    OMX_VERSIONTYPE nVersion;     /**< OMX specification version information */
++    OMX_U32 nPortIndex;           /**< port that this structure applies to */
++    OMX_U32 nChannels;            /**< Number of channels in the data stream (not
++                                       necessarily the same as the number of channels
++                                       to be rendered. */
++    OMX_BOOL bDTX;                /**< Enable Discontinuous Transmisssion */
++    OMX_BOOL bHiPassFilter;       /**< Enable High Pass Filter */
++} OMX_AUDIO_PARAM_PDCEFRTYPE;
++
++/** PDC HR ( RCR-27, PSI-CELP 3.45kbps coder) stream format parameters */
++typedef struct OMX_AUDIO_PARAM_PDCHRTYPE {
++    OMX_U32 nSize;                /**< size of the structure in bytes */
++    OMX_VERSIONTYPE nVersion;     /**< OMX specification version information */
++    OMX_U32 nPortIndex;           /**< port that this structure applies to */
++    OMX_U32 nChannels;            /**< Number of channels in the data stream (not
++                                       necessarily the same as the number of channels
++                                       to be rendered. */
++    OMX_BOOL bDTX;                /**< Enable Discontinuous Transmisssion */
++    OMX_BOOL bHiPassFilter;       /**< Enable High Pass Filter */
++} OMX_AUDIO_PARAM_PDCHRTYPE;
++
++
++/** CDMA Rate types */
++typedef enum OMX_AUDIO_CDMARATETYPE {
++    OMX_AUDIO_CDMARateBlank = 0,          /**< CDMA encoded frame is blank */
++    OMX_AUDIO_CDMARateFull,               /**< CDMA encoded frame in full rate */
++    OMX_AUDIO_CDMARateHalf,               /**< CDMA encoded frame in half rate */
++    OMX_AUDIO_CDMARateQuarter,            /**< CDMA encoded frame in quarter rate */
++    OMX_AUDIO_CDMARateEighth,             /**< CDMA encoded frame in eighth rate (DTX)*/
++    OMX_AUDIO_CDMARateErasure,            /**< CDMA erasure frame */
++    OMX_AUDIO_CDMARateKhronosExtensions = 0x6F000000, /**< Reserved region for introducing Khronos Standard Extensions */
++    OMX_AUDIO_CDMARateVendorStartUnused = 0x7F000000, /**< Reserved region for introducing Vendor Extensions */
++    OMX_AUDIO_CDMARateMax = 0x7FFFFFFF
++} OMX_AUDIO_CDMARATETYPE;
++
++
++/** QCELP8 (TIA/EIA-96, up to 8kbps coder) stream format parameters */
++typedef struct OMX_AUDIO_PARAM_QCELP8TYPE {
++    OMX_U32 nSize;                /**< size of the structure in bytes */
++    OMX_VERSIONTYPE nVersion;     /**< OMX specification version information */
++    OMX_U32 nPortIndex;           /**< port that this structure applies to */
++    OMX_U32 nChannels;            /**< Number of channels in the data stream (not
++                                       necessarily the same as the number of channels
++                                       to be rendered. */
++    OMX_U32 nBitRate;             /**< Bit rate of the input data.  Use 0 for variable
++                                       rate or unknown bit rates */
++    OMX_AUDIO_CDMARATETYPE eCDMARate; /**< Frame rate */
++    OMX_U32 nMinBitRate;          /**< minmal rate for the encoder = 1,2,3,4, default = 1 */
++    OMX_U32 nMaxBitRate;          /**< maximal rate for the encoder = 1,2,3,4, default = 4 */
++} OMX_AUDIO_PARAM_QCELP8TYPE;
++
++
++/** QCELP13 ( CDMA, EIA/TIA-733, 13.3kbps coder) stream format parameters */
++typedef struct OMX_AUDIO_PARAM_QCELP13TYPE {
++    OMX_U32 nSize;                /**< size of the structure in bytes */
++    OMX_VERSIONTYPE nVersion;     /**< OMX specification version information */
++    OMX_U32 nPortIndex;           /**< port that this structure applies to */
++    OMX_U32 nChannels;            /**< Number of channels in the data stream (not
++                                       necessarily the same as the number of channels
++                                       to be rendered. */
++    OMX_AUDIO_CDMARATETYPE eCDMARate; /**< Frame rate */
++    OMX_U32 nMinBitRate;          /**< minmal rate for the encoder = 1,2,3,4, default = 1 */
++    OMX_U32 nMaxBitRate;          /**< maximal rate for the encoder = 1,2,3,4, default = 4 */
++} OMX_AUDIO_PARAM_QCELP13TYPE;
++
++
++/** EVRC ( CDMA, EIA/TIA-127, RCELP up to 8.55kbps coder) stream format parameters */
++typedef struct OMX_AUDIO_PARAM_EVRCTYPE {
++    OMX_U32 nSize;                /**< size of the structure in bytes */
++    OMX_VERSIONTYPE nVersion;     /**< OMX specification version information */
++    OMX_U32 nPortIndex;           /**< port that this structure applies to */
++    OMX_U32 nChannels;            /**< Number of channels in the data stream (not
++                                       necessarily the same as the number of channels
++                                       to be rendered. */
++    OMX_AUDIO_CDMARATETYPE eCDMARate; /**< actual Frame rate */
++    OMX_BOOL bRATE_REDUCon;       /**< RATE_REDUCtion is requested for this frame */
++    OMX_U32 nMinBitRate;          /**< minmal rate for the encoder = 1,2,3,4, default = 1 */
++    OMX_U32 nMaxBitRate;          /**< maximal rate for the encoder = 1,2,3,4, default = 4 */
++    OMX_BOOL bHiPassFilter;       /**< Enable encoder's High Pass Filter */
++    OMX_BOOL bNoiseSuppressor;    /**< Enable encoder's noise suppressor pre-processing */
++    OMX_BOOL bPostFilter;         /**< Enable decoder's post Filter */
++} OMX_AUDIO_PARAM_EVRCTYPE;
++
++
++/** SMV ( up to 8.55kbps coder) stream format parameters */
++typedef struct OMX_AUDIO_PARAM_SMVTYPE {
++    OMX_U32 nSize;                /**< size of the structure in bytes */
++    OMX_VERSIONTYPE nVersion;     /**< OMX specification version information */
++    OMX_U32 nPortIndex;           /**< port that this structure applies to */
++    OMX_U32 nChannels;            /**< Number of channels in the data stream (not
++                                       necessarily the same as the number of channels
++                                       to be rendered. */
++    OMX_AUDIO_CDMARATETYPE eCDMARate; /**< Frame rate */
++    OMX_BOOL bRATE_REDUCon;           /**< RATE_REDUCtion is requested for this frame */
++    OMX_U32 nMinBitRate;          /**< minmal rate for the encoder = 1,2,3,4, default = 1 ??*/
++    OMX_U32 nMaxBitRate;          /**< maximal rate for the encoder = 1,2,3,4, default = 4 ??*/
++    OMX_BOOL bHiPassFilter;       /**< Enable encoder's High Pass Filter ??*/
++    OMX_BOOL bNoiseSuppressor;    /**< Enable encoder's noise suppressor pre-processing */
++    OMX_BOOL bPostFilter;         /**< Enable decoder's post Filter ??*/
++} OMX_AUDIO_PARAM_SMVTYPE;
++
++
++/** MIDI Format
++ * @ingroup midi
++ */
++typedef enum OMX_AUDIO_MIDIFORMATTYPE
++{
++    OMX_AUDIO_MIDIFormatUnknown = 0, /**< MIDI Format unknown or don't care */
++    OMX_AUDIO_MIDIFormatSMF0,        /**< Standard MIDI File Type 0 */
++    OMX_AUDIO_MIDIFormatSMF1,        /**< Standard MIDI File Type 1 */
++    OMX_AUDIO_MIDIFormatSMF2,        /**< Standard MIDI File Type 2 */
++    OMX_AUDIO_MIDIFormatSPMIDI,      /**< SP-MIDI */
++    OMX_AUDIO_MIDIFormatXMF0,        /**< eXtensible Music Format type 0 */
++    OMX_AUDIO_MIDIFormatXMF1,        /**< eXtensible Music Format type 1 */
++    OMX_AUDIO_MIDIFormatMobileXMF,   /**< Mobile XMF (eXtensible Music Format type 2) */
++    OMX_AUDIO_MIDIFormatKhronosExtensions = 0x6F000000, /**< Reserved region for introducing Khronos Standard Extensions */
++    OMX_AUDIO_MIDIFormatVendorStartUnused = 0x7F000000, /**< Reserved region for introducing Vendor Extensions */
++    OMX_AUDIO_MIDIFormatMax = 0x7FFFFFFF
++} OMX_AUDIO_MIDIFORMATTYPE;
++
++
++/** MIDI params
++ * @ingroup midi
++ */
++typedef struct OMX_AUDIO_PARAM_MIDITYPE {
++    OMX_U32 nSize;                 /**< size of the structure in bytes */
++    OMX_VERSIONTYPE nVersion;      /**< OMX specification version information */
++    OMX_U32 nPortIndex;            /**< port that this structure applies to */
++    OMX_U32 nFileSize;             /**< size of the MIDI file in bytes, where the entire
++                                        MIDI file passed in, otherwise if 0x0, the MIDI data
++                                        is merged and streamed (instead of passed as an
++                                        entire MIDI file) */
++    OMX_BU32 sMaxPolyphony;        /**< Specifies the maximum simultaneous polyphonic
++                                        voices. A value of zero indicates that the default
++                                        polyphony of the device is used  */
++    OMX_BOOL bLoadDefaultSound;    /**< Whether to load default sound
++                                        bank at initialization */
++    OMX_AUDIO_MIDIFORMATTYPE eMidiFormat; /**< Version of the MIDI file */
++} OMX_AUDIO_PARAM_MIDITYPE;
++
++
++/** Type of the MIDI sound bank
++ * @ingroup midi
++ */
++typedef enum OMX_AUDIO_MIDISOUNDBANKTYPE {
++    OMX_AUDIO_MIDISoundBankUnused = 0,           /**< unused/unknown soundbank type */
++    OMX_AUDIO_MIDISoundBankDLS1,                 /**< DLS version 1 */
++    OMX_AUDIO_MIDISoundBankDLS2,                 /**< DLS version 2 */
++    OMX_AUDIO_MIDISoundBankMobileDLSBase,        /**< Mobile DLS, using the base functionality */
++    OMX_AUDIO_MIDISoundBankMobileDLSPlusOptions, /**< Mobile DLS, using the specification-defined optional feature set */
++    OMX_AUDIO_MIDISoundBankKhronosExtensions = 0x6F000000, /**< Reserved region for introducing Khronos Standard Extensions */
++    OMX_AUDIO_MIDISoundBankVendorStartUnused = 0x7F000000, /**< Reserved region for introducing Vendor Extensions */
++    OMX_AUDIO_MIDISoundBankMax = 0x7FFFFFFF
++} OMX_AUDIO_MIDISOUNDBANKTYPE;
++
++
++/** Bank Layout describes how bank MSB & LSB are used in the DLS instrument definitions sound bank
++ * @ingroup midi
++ */
++typedef enum OMX_AUDIO_MIDISOUNDBANKLAYOUTTYPE {
++   OMX_AUDIO_MIDISoundBankLayoutUnused = 0,   /**< unused/unknown soundbank type */
++   OMX_AUDIO_MIDISoundBankLayoutGM,           /**< GS layout (based on bank MSB 0x00) */
++   OMX_AUDIO_MIDISoundBankLayoutGM2,          /**< General MIDI 2 layout (using MSB 0x78/0x79, LSB 0x00) */
++   OMX_AUDIO_MIDISoundBankLayoutUser,         /**< Does not conform to any bank numbering standards */
++   OMX_AUDIO_MIDISoundBankLayoutKhronosExtensions = 0x6F000000, /**< Reserved region for introducing Khronos Standard Extensions */
++   OMX_AUDIO_MIDISoundBankLayoutVendorStartUnused = 0x7F000000, /**< Reserved region for introducing Vendor Extensions */
++   OMX_AUDIO_MIDISoundBankLayoutMax = 0x7FFFFFFF
++} OMX_AUDIO_MIDISOUNDBANKLAYOUTTYPE;
++
++
++/** MIDI params to load/unload user soundbank
++ * @ingroup midi
++ */
++typedef struct OMX_AUDIO_PARAM_MIDILOADUSERSOUNDTYPE {
++    OMX_U32 nSize;            /**< size of the structure in bytes */
++    OMX_VERSIONTYPE nVersion; /**< OMX specification version information */
++    OMX_U32 nPortIndex;       /**< port that this structure applies to */
++    OMX_U32 nDLSIndex;        /**< DLS file index to be loaded */
++    OMX_U32 nDLSSize;         /**< Size in bytes */
++    OMX_PTR pDLSData;         /**< Pointer to DLS file data */
++    OMX_AUDIO_MIDISOUNDBANKTYPE eMidiSoundBank;   /**< Midi sound bank type enumeration */
++    OMX_AUDIO_MIDISOUNDBANKLAYOUTTYPE eMidiSoundBankLayout; /**< Midi sound bank layout enumeration */
++} OMX_AUDIO_PARAM_MIDILOADUSERSOUNDTYPE;
++
++
++/** Structure for Live MIDI events and MIP messages.
++ * (MIP = Maximum Instantaneous Polyphony; part of the SP-MIDI standard.)
++ * @ingroup midi
++ */
++typedef struct OMX_AUDIO_CONFIG_MIDIIMMEDIATEEVENTTYPE {
++    OMX_U32 nSize;            /**< size of the structure in bytes */
++    OMX_VERSIONTYPE nVersion; /**< OMX specification version information */
++    OMX_U32 nPortIndex;       /**< Port that this structure applies to */
++    OMX_U32 nMidiEventSize;   /**< Size of immediate MIDI events or MIP message in bytes  */
++    OMX_U8 nMidiEvents[1];    /**< MIDI event array to be rendered immediately, or an
++                                   array for the MIP message buffer, where the size is
++                                   indicated by nMidiEventSize */
++} OMX_AUDIO_CONFIG_MIDIIMMEDIATEEVENTTYPE;
++
++
++/** MIDI sound bank/ program pair in a given channel
++ * @ingroup midi
++ */
++typedef struct OMX_AUDIO_CONFIG_MIDISOUNDBANKPROGRAMTYPE {
++    OMX_U32 nSize;              /**< size of the structure in bytes */
++    OMX_VERSIONTYPE nVersion;   /**< OMX specification version information */
++    OMX_U32 nPortIndex;         /**< Port that this structure applies to */
++    OMX_U32 nChannel;           /**< Valid channel values range from 1 to 16 */
++    OMX_U16 nIDProgram;         /**< Valid program ID range is 1 to 128 */
++    OMX_U16 nIDSoundBank;       /**< Sound bank ID */
++    OMX_U32 nUserSoundBankIndex;/**< User soundbank index, easier to access soundbanks
++                                     by index if multiple banks are present */
++} OMX_AUDIO_CONFIG_MIDISOUNDBANKPROGRAMTYPE;
++
++
++/** MIDI control
++ * @ingroup midi
++ */
++typedef struct OMX_AUDIO_CONFIG_MIDICONTROLTYPE {
++    OMX_U32 nSize;                /**< size of the structure in bytes */
++    OMX_VERSIONTYPE nVersion;     /**< OMX specification version information */
++    OMX_U32 nPortIndex;           /**< port that this structure applies to */
++    OMX_BS32 sPitchTransposition; /**< Pitch transposition in semitones, stored as Q22.10
++                                       format based on JAVA MMAPI (JSR-135) requirement */
++    OMX_BU32 sPlayBackRate;       /**< Relative playback rate, stored as Q14.17 fixed-point
++                                       number based on JSR-135 requirement */
++    OMX_BU32 sTempo ;             /**< Tempo in beats per minute (BPM), stored as Q22.10
++                                       fixed-point number based on JSR-135 requirement */
++    OMX_U32 nMaxPolyphony;        /**< Specifies the maximum simultaneous polyphonic
++                                       voices. A value of zero indicates that the default
++                                       polyphony of the device is used  */
++    OMX_U32 nNumRepeat;           /**< Number of times to repeat playback */
++    OMX_U32 nStopTime;            /**< Time in milliseconds to indicate when playback
++                                       will stop automatically.  Set to zero if not used */
++    OMX_U16 nChannelMuteMask;     /**< 16 bit mask for channel mute status */
++    OMX_U16 nChannelSoloMask;     /**< 16 bit mask for channel solo status */
++    OMX_U32 nTrack0031MuteMask;   /**< 32 bit mask for track mute status. Note: This is for tracks 0-31 */
++    OMX_U32 nTrack3263MuteMask;   /**< 32 bit mask for track mute status. Note: This is for tracks 32-63 */
++    OMX_U32 nTrack0031SoloMask;   /**< 32 bit mask for track solo status. Note: This is for tracks 0-31 */
++    OMX_U32 nTrack3263SoloMask;   /**< 32 bit mask for track solo status. Note: This is for tracks 32-63 */
++
++} OMX_AUDIO_CONFIG_MIDICONTROLTYPE;
++
++
++/** MIDI Playback States
++ * @ingroup midi
++ */
++typedef enum OMX_AUDIO_MIDIPLAYBACKSTATETYPE {
++  OMX_AUDIO_MIDIPlayBackStateUnknown = 0,      /**< Unknown state or state does not map to
++													other defined states */
++  OMX_AUDIO_MIDIPlayBackStateClosedEngaged,    /**< No MIDI resource is currently open.
++                                                    The MIDI engine is currently processing
++                                                    MIDI events. */
++  OMX_AUDIO_MIDIPlayBackStateParsing,          /**< A MIDI resource is open and is being
++                                                    primed. The MIDI engine is currently
++                                                    processing MIDI events. */
++  OMX_AUDIO_MIDIPlayBackStateOpenEngaged,      /**< A MIDI resource is open and primed but
++                                                    not playing. The MIDI engine is currently
++                                                    processing MIDI events. The transition to
++                                                    this state is only possible from the
++                                                    OMX_AUDIO_MIDIPlayBackStatePlaying state,
++                                                    when the 'playback head' reaches the end
++                                                    of media data or the playback stops due
++                                                    to stop time set.*/
++  OMX_AUDIO_MIDIPlayBackStatePlaying,          /**< A MIDI resource is open and currently
++                                                    playing. The MIDI engine is currently
++                                                    processing MIDI events.*/
++  OMX_AUDIO_MIDIPlayBackStatePlayingPartially, /**< Best-effort playback due to SP-MIDI/DLS
++                                                    resource constraints */
++  OMX_AUDIO_MIDIPlayBackStatePlayingSilently,  /**< Due to system resource constraints and
++                                                    SP-MIDI content constraints, there is
++                                                    no audible MIDI content during playback
++                                                    currently. The situation may change if
++                                                    resources are freed later.*/
++  OMX_AUDIO_MIDIPlayBackStateKhronosExtensions = 0x6F000000, /**< Reserved region for introducing Khronos Standard Extensions */
++  OMX_AUDIO_MIDIPlayBackStateVendorStartUnused = 0x7F000000, /**< Reserved region for introducing Vendor Extensions */
++  OMX_AUDIO_MIDIPlayBackStateMax = 0x7FFFFFFF
++} OMX_AUDIO_MIDIPLAYBACKSTATETYPE;
++
++
++/** MIDI status
++ * @ingroup midi
++ */
++typedef struct OMX_AUDIO_CONFIG_MIDISTATUSTYPE {
++    OMX_U32 nSize;              /**< size of the structure in bytes */
++    OMX_VERSIONTYPE nVersion;   /**< OMX specification version information */
++    OMX_U32 nPortIndex;         /**< port that this structure applies to */
++    OMX_U16 nNumTracks;         /**< Number of MIDI tracks in the file, read only field.
++                                     NOTE: May not return a meaningful value until the entire
++                                     file is parsed and buffered.  */
++    OMX_U32 nDuration;          /**< The length of the currently open MIDI resource
++                                     in milliseconds. NOTE: May not return a meaningful value
++                                     until the entire file is parsed and buffered.  */
++    OMX_U32 nPosition;          /**< Current Position of the MIDI resource being played
++                                     in milliseconds */
++    OMX_BOOL bVibra;            /**< Does Vibra track exist? NOTE: May not return a meaningful
++                                     value until the entire file is parsed and buffered. */
++    OMX_U32 nNumMetaEvents;     /**< Total number of MIDI Meta Events in the currently
++                                     open MIDI resource. NOTE: May not return a meaningful value
++                                     until the entire file is parsed and buffered.  */
++    OMX_U32 nNumActiveVoices;   /**< Number of active voices in the currently playing
++                                     MIDI resource. NOTE: May not return a meaningful value until
++                                     the entire file is parsed and buffered. */
++    OMX_AUDIO_MIDIPLAYBACKSTATETYPE eMIDIPlayBackState;  /**< MIDI playback state enumeration, read only field */
++} OMX_AUDIO_CONFIG_MIDISTATUSTYPE;
++
++
++/** MIDI Meta Event structure one per Meta Event.
++ *  MIDI Meta Events are like audio metadata, except that they are interspersed
++ *  with the MIDI content throughout the file and are not localized in the header.
++ *  As such, it is necessary to retrieve information about these Meta Events from
++ *  the engine, as it encounters these Meta Events within the MIDI content.
++ *  For example, SMF files can have up to 14 types of MIDI Meta Events (copyright,
++ *  author, default tempo, etc.) scattered throughout the file.
++ *  @ingroup midi
++ */
++typedef struct OMX_AUDIO_CONFIG_MIDIMETAEVENTTYPE{
++    OMX_U32 nSize;            /**< size of the structure in bytes */
++    OMX_VERSIONTYPE nVersion; /**< OMX specification version information */
++    OMX_U32 nPortIndex;       /**< port that this structure applies to */
++    OMX_U32 nIndex;           /**< Index of Meta Event */
++    OMX_U8 nMetaEventType;    /**< Meta Event Type, 7bits (i.e. 0 - 127) */
++    OMX_U32 nMetaEventSize;   /**< size of the Meta Event in bytes */
++    OMX_U32 nTrack;           /**< track number for the meta event */
++    OMX_U32 nPosition;        /**< Position of the meta-event in milliseconds */
++} OMX_AUDIO_CONFIG_MIDIMETAEVENTTYPE;
++
++
++/** MIDI Meta Event Data structure - one per Meta Event.
++ * @ingroup midi
++ */
++typedef struct OMX_AUDIO_CONFIG_MIDIMETAEVENTDATATYPE{
++    OMX_U32 nSize;            /**< size of the structure in bytes */
++    OMX_VERSIONTYPE nVersion; /**< OMX specification version information */
++    OMX_U32 nPortIndex;       /**< port that this structure applies to */
++    OMX_U32 nIndex;           /**< Index of Meta Event */
++    OMX_U32 nMetaEventSize;   /**< size of the Meta Event in bytes */
++    OMX_U8 nData[1];          /**< array of one or more bytes of meta data
++                                   as indicated by the nMetaEventSize field */
++} OMX_AUDIO_CONFIG__MIDIMETAEVENTDATATYPE;
++
++
++/** Audio Volume adjustment for a port */
++typedef struct OMX_AUDIO_CONFIG_VOLUMETYPE {
++    OMX_U32 nSize;              /**< size of the structure in bytes */
++    OMX_VERSIONTYPE nVersion;   /**< OMX specification version information */
++    OMX_U32 nPortIndex;         /**< Port index indicating which port to
++                                     set.  Select the input port to set
++                                     just that port's volume.  Select the
++                                     output port to adjust the master
++                                     volume. */
++    OMX_BOOL bLinear;           /**< Is the volume to be set in linear (0.100)
++                                     or logarithmic scale (mB) */
++    OMX_BS32 sVolume;           /**< Volume linear setting in the 0..100 range, OR
++                                     Volume logarithmic setting for this port.  The values
++                                     for volume are in mB (millibels = 1/100 dB) relative
++                                     to a gain of 1 (e.g. the output is the same as the
++                                     input level).  Values are in mB from nMax
++                                     (maximum volume) to nMin mB (typically negative).
++                                     Since the volume is "voltage"
++                                     and not a "power", it takes a setting of
++                                     -600 mB to decrease the volume by 1/2.  If
++                                     a component cannot accurately set the
++                                     volume to the requested value, it must
++                                     set the volume to the closest value BELOW
++                                     the requested value.  When getting the
++                                     volume setting, the current actual volume
++                                     must be returned. */
++} OMX_AUDIO_CONFIG_VOLUMETYPE;
++
++
++/** Audio Volume adjustment for a channel */
++typedef struct OMX_AUDIO_CONFIG_CHANNELVOLUMETYPE {
++    OMX_U32 nSize;              /**< size of the structure in bytes */
++    OMX_VERSIONTYPE nVersion;   /**< OMX specification version information */
++    OMX_U32 nPortIndex;         /**< Port index indicating which port to
++                                     set.  Select the input port to set
++                                     just that port's volume.  Select the
++                                     output port to adjust the master
++                                     volume. */
++    OMX_U32 nChannel;           /**< channel to select from 0 to N-1,
++                                     using OMX_ALL to apply volume settings
++                                     to all channels */
++    OMX_BOOL bLinear;           /**< Is the volume to be set in linear (0.100) or
++                                     logarithmic scale (mB) */
++    OMX_BS32 sVolume;           /**< Volume linear setting in the 0..100 range, OR
++                                     Volume logarithmic setting for this port.
++                                     The values for volume are in mB
++                                     (millibels = 1/100 dB) relative to a gain
++                                     of 1 (e.g. the output is the same as the
++                                     input level).  Values are in mB from nMax
++                                     (maximum volume) to nMin mB (typically negative).
++                                     Since the volume is "voltage"
++                                     and not a "power", it takes a setting of
++                                     -600 mB to decrease the volume by 1/2.  If
++                                     a component cannot accurately set the
++                                     volume to the requested value, it must
++                                     set the volume to the closest value BELOW
++                                     the requested value.  When getting the
++                                     volume setting, the current actual volume
++                                     must be returned. */
++    OMX_BOOL bIsMIDI;           /**< TRUE if nChannel refers to a MIDI channel,
++                                     FALSE otherwise */
++} OMX_AUDIO_CONFIG_CHANNELVOLUMETYPE;
++
++
++/** Audio balance setting */
++typedef struct OMX_AUDIO_CONFIG_BALANCETYPE {
++    OMX_U32 nSize;              /**< size of the structure in bytes */
++    OMX_VERSIONTYPE nVersion;   /**< OMX specification version information */
++    OMX_U32 nPortIndex;         /**< Port index indicating which port to
++                                     set.  Select the input port to set
++                                     just that port's balance.  Select the
++                                     output port to adjust the master
++                                     balance. */
++    OMX_S32 nBalance;           /**< balance setting for this port
++                                     (-100 to 100, where -100 indicates
++                                     all left, and no right */
++} OMX_AUDIO_CONFIG_BALANCETYPE;
++
++
++/** Audio Port mute */
++typedef struct OMX_AUDIO_CONFIG_MUTETYPE {
++    OMX_U32 nSize;              /**< size of the structure in bytes */
++    OMX_VERSIONTYPE nVersion;   /**< OMX specification version information */
++    OMX_U32 nPortIndex;         /**< Port index indicating which port to
++                                     set.  Select the input port to set
++                                     just that port's mute.  Select the
++                                     output port to adjust the master
++                                     mute. */
++    OMX_BOOL bMute;             /**< Mute setting for this port */
++} OMX_AUDIO_CONFIG_MUTETYPE;
++
++
++/** Audio Channel mute */
++typedef struct OMX_AUDIO_CONFIG_CHANNELMUTETYPE {
++    OMX_U32 nSize;              /**< size of the structure in bytes */
++    OMX_VERSIONTYPE nVersion;   /**< OMX specification version information */
++    OMX_U32 nPortIndex;         /**< port that this structure applies to */
++    OMX_U32 nChannel;           /**< channel to select from 0 to N-1,
++                                     using OMX_ALL to apply mute settings
++                                     to all channels */
++    OMX_BOOL bMute;             /**< Mute setting for this channel */
++    OMX_BOOL bIsMIDI;           /**< TRUE if nChannel refers to a MIDI channel,
++                                     FALSE otherwise */
++} OMX_AUDIO_CONFIG_CHANNELMUTETYPE;
++
++
++
++/** Enable / Disable for loudness control, which boosts bass and to a
++ *  smaller extent high end frequencies to compensate for hearing
++ *  ability at the extreme ends of the audio spectrum
++ */
++typedef struct OMX_AUDIO_CONFIG_LOUDNESSTYPE {
++    OMX_U32 nSize;             /**< size of the structure in bytes */
++    OMX_VERSIONTYPE nVersion;  /**< OMX specification version information */
++    OMX_U32 nPortIndex;        /**< port that this structure applies to */
++    OMX_BOOL bLoudness;        /**< Enable/disable for loudness */
++} OMX_AUDIO_CONFIG_LOUDNESSTYPE;
++
++
++/** Enable / Disable for bass, which controls low frequencies
++ */
++typedef struct OMX_AUDIO_CONFIG_BASSTYPE {
++    OMX_U32 nSize;             /**< size of the structure in bytes */
++    OMX_VERSIONTYPE nVersion;  /**< OMX specification version information */
++    OMX_U32 nPortIndex;        /**< port that this structure applies to */
++    OMX_BOOL bEnable;          /**< Enable/disable for bass control */
++    OMX_S32 nBass;             /**< bass setting for the port, as a
++                                    continuous value from -100 to 100
++                                    (0 means no change in bass level)*/
++} OMX_AUDIO_CONFIG_BASSTYPE;
++
++
++/** Enable / Disable for treble, which controls high frequencies tones
++ */
++typedef struct OMX_AUDIO_CONFIG_TREBLETYPE {
++    OMX_U32 nSize;             /**< size of the structure in bytes */
++    OMX_VERSIONTYPE nVersion;  /**< OMX specification version information */
++    OMX_U32 nPortIndex;        /**< port that this structure applies to */
++    OMX_BOOL bEnable;          /**< Enable/disable for treble control */
++    OMX_S32  nTreble;          /**< treble setting for the port, as a
++                                    continuous value from -100 to 100
++                                    (0 means no change in treble level) */
++} OMX_AUDIO_CONFIG_TREBLETYPE;
++
++
++/** An equalizer is typically used for two reasons: to compensate for an
++ *  sub-optimal frequency response of a system to make it sound more natural
++ *  or to create intentionally some unnatural coloring to the sound to create
++ *  an effect.
++ *  @ingroup effects
++ */
++typedef struct OMX_AUDIO_CONFIG_EQUALIZERTYPE {
++    OMX_U32 nSize;             /**< size of the structure in bytes */
++    OMX_VERSIONTYPE nVersion;  /**< OMX specification version information */
++    OMX_U32 nPortIndex;        /**< port that this structure applies to */
++    OMX_BOOL bEnable;          /**< Enable/disable for equalizer */
++    OMX_BU32 sBandIndex;       /**< Band number to be set.  Upper Limit is
++                                    N-1, where N is the number of bands, lower limit is 0 */
++    OMX_BU32 sCenterFreq;      /**< Center frequecies in Hz.  This is a
++                                    read only element and is used to determine
++                                    the lower, center and upper frequency of
++                                    this band.  */
++    OMX_BS32 sBandLevel;       /**< band level in millibels */
++} OMX_AUDIO_CONFIG_EQUALIZERTYPE;
++
++
++/** Stereo widening mode type
++ * @ingroup effects
++ */
++typedef enum OMX_AUDIO_STEREOWIDENINGTYPE {
++    OMX_AUDIO_StereoWideningHeadphones,    /**< Stereo widening for loudspeakers */
++    OMX_AUDIO_StereoWideningLoudspeakers,  /**< Stereo widening for closely spaced loudspeakers */
++    OMX_AUDIO_StereoWideningKhronosExtensions = 0x6F000000, /**< Reserved region for introducing Khronos Standard Extensions */
++    OMX_AUDIO_StereoWideningVendorStartUnused = 0x7F000000, /**< Reserved region for introducing Vendor Extensions */
++    OMX_AUDIO_StereoWideningMax = 0x7FFFFFFF
++} OMX_AUDIO_STEREOWIDENINGTYPE;
++
++
++/** Control for stereo widening, which is a special 2-channel
++ *  case of the audio virtualizer effect. For example, for 5.1-channel
++ *  output, it translates to virtual surround sound.
++ * @ingroup effects
++ */
++typedef struct OMX_AUDIO_CONFIG_STEREOWIDENINGTYPE {
++    OMX_U32 nSize;             /**< size of the structure in bytes */
++    OMX_VERSIONTYPE nVersion;  /**< OMX specification version information */
++    OMX_U32 nPortIndex;        /**< port that this structure applies to */
++    OMX_BOOL bEnable;          /**< Enable/disable for stereo widening control */
++    OMX_AUDIO_STEREOWIDENINGTYPE eWideningType; /**< Stereo widening algorithm type */
++    OMX_U32  nStereoWidening;  /**< stereo widening setting for the port,
++                                    as a continuous value from 0 to 100  */
++} OMX_AUDIO_CONFIG_STEREOWIDENINGTYPE;
++
++
++/** The chorus effect (or ``choralizer'') is any signal processor which makes
++ *  one sound source (such as a voice) sound like many such sources singing
++ *  (or playing) in unison. Since performance in unison is never exact, chorus
++ *  effects simulate this by making independently modified copies of the input
++ *  signal. Modifications may include (1) delay, (2) frequency shift, and
++ *  (3) amplitude modulation.
++ * @ingroup effects
++ */
++typedef struct OMX_AUDIO_CONFIG_CHORUSTYPE {
++    OMX_U32 nSize;             /**< size of the structure in bytes */
++    OMX_VERSIONTYPE nVersion;  /**< OMX specification version information */
++    OMX_U32 nPortIndex;        /**< port that this structure applies to */
++    OMX_BOOL bEnable;          /**< Enable/disable for chorus */
++    OMX_BU32 sDelay;           /**< average delay in milliseconds */
++    OMX_BU32 sModulationRate;  /**< rate of modulation in millihertz */
++    OMX_U32 nModulationDepth;  /**< depth of modulation as a percentage of
++                                    delay (i.e. 0 to 100) */
++    OMX_BU32 nFeedback;        /**< Feedback from chorus output to input in percentage */
++} OMX_AUDIO_CONFIG_CHORUSTYPE;
++
++
++/** Reverberation is part of the reflected sound that follows the early
++ *  reflections. In a typical room, this consists of a dense succession of
++ *  echoes whose energy decays exponentially. The reverberation effect structure
++ *  as defined here includes both (early) reflections as well as (late) reverberations.
++ * @ingroup effects
++ */
++typedef struct OMX_AUDIO_CONFIG_REVERBERATIONTYPE {
++    OMX_U32 nSize;                /**< size of the structure in bytes */
++    OMX_VERSIONTYPE nVersion;     /**< OMX specification version information */
++    OMX_U32 nPortIndex;           /**< port that this structure applies to */
++    OMX_BOOL bEnable;             /**< Enable/disable for reverberation control */
++    OMX_BS32 sRoomLevel;          /**< Intensity level for the whole room effect
++                                       (i.e. both early reflections and late
++                                       reverberation) in millibels */
++    OMX_BS32 sRoomHighFreqLevel;  /**< Attenuation at high frequencies
++                                       relative to the intensity at low
++                                       frequencies in millibels */
++    OMX_BS32 sReflectionsLevel;   /**< Intensity level of early reflections
++                                       (relative to room value), in millibels */
++    OMX_BU32 sReflectionsDelay;   /**< Delay time of the first reflection relative
++                                       to the direct path, in milliseconds */
++    OMX_BS32 sReverbLevel;        /**< Intensity level of late reverberation
++                                       relative to room level, in millibels */
++    OMX_BU32 sReverbDelay;        /**< Time delay from the first early reflection
++                                       to the beginning of the late reverberation
++                                       section, in milliseconds */
++    OMX_BU32 sDecayTime;          /**< Late reverberation decay time@low
++                                       frequencies, in milliseconds */
++    OMX_BU32 nDecayHighFreqRatio; /**< Ratio of high frequency decay time relative
++                                       to low frequency decay time in percent  */
++    OMX_U32 nDensity;             /**< Modal density in the late reverberation decay,
++                                       in percent (i.e. 0 - 100) */
++    OMX_U32 nDiffusion;           /**< Echo density in the late reverberation decay,
++                                       in percent (i.e. 0 - 100) */
++    OMX_BU32 sReferenceHighFreq;  /**< Reference high frequency in Hertz. This is
++                                       the frequency used as the reference for all
++                                       the high-frequency settings above */
++
++} OMX_AUDIO_CONFIG_REVERBERATIONTYPE;
++
++
++/** Possible settings for the Echo Cancelation structure to use
++ * @ingroup effects
++ */
++typedef enum OMX_AUDIO_ECHOCANTYPE {
++   OMX_AUDIO_EchoCanOff = 0,    /**< Echo Cancellation is disabled */
++   OMX_AUDIO_EchoCanNormal,     /**< Echo Cancellation normal operation -
++                                     echo from plastics and face */
++   OMX_AUDIO_EchoCanHFree,      /**< Echo Cancellation optimized for
++                                     Hands Free operation */
++   OMX_AUDIO_EchoCanCarKit,    /**< Echo Cancellation optimized for
++                                     Car Kit (longer echo) */
++   OMX_AUDIO_EchoCanKhronosExtensions = 0x6F000000, /**< Reserved region for introducing Khronos Standard Extensions */
++   OMX_AUDIO_EchoCanVendorStartUnused = 0x7F000000, /**< Reserved region for introducing Vendor Extensions */
++   OMX_AUDIO_EchoCanMax = 0x7FFFFFFF
++} OMX_AUDIO_ECHOCANTYPE;
++
++
++/** Enable / Disable for echo cancelation, which removes undesired echo's
++ *  from the audio
++ * @ingroup effects
++ */
++typedef struct OMX_AUDIO_CONFIG_ECHOCANCELATIONTYPE {
++    OMX_U32 nSize;             /**< size of the structure in bytes */
++    OMX_VERSIONTYPE nVersion;  /**< OMX specification version information */
++    OMX_U32 nPortIndex;        /**< port that this structure applies to */
++    OMX_AUDIO_ECHOCANTYPE eEchoCancelation; /**< Echo cancelation settings */
++} OMX_AUDIO_CONFIG_ECHOCANCELATIONTYPE;
++
++
++/** Enable / Disable for noise reduction, which undesired noise from
++ * the audio
++ * @ingroup effects
++ */
++typedef struct OMX_AUDIO_CONFIG_NOISEREDUCTIONTYPE {
++    OMX_U32 nSize;             /**< size of the structure in bytes */
++    OMX_VERSIONTYPE nVersion;  /**< OMX specification version information */
++    OMX_U32 nPortIndex;        /**< port that this structure applies to */
++    OMX_BOOL bNoiseReduction;  /**< Enable/disable for noise reduction */
++} OMX_AUDIO_CONFIG_NOISEREDUCTIONTYPE;
++
++/** @} */
++
++#ifdef __cplusplus
++}
++#endif /* __cplusplus */
++
++#endif
++/* File EOF */
++
+diff -rupN a/usr/include/OpenMAX/il/OMX_ComponentExt.h b/usr/include/OpenMAX/il/OMX_ComponentExt.h
+--- a/usr/include/OpenMAX/il/OMX_ComponentExt.h	1970-01-01 01:00:00.000000000 +0100
++++ b/usr/include/OpenMAX/il/OMX_ComponentExt.h	2011-08-09 09:07:36.000000000 +0200
+@@ -0,0 +1,61 @@
++/*
++ * Copyright (c) 2010 The Khronos Group Inc.
++ *
++ * Permission is hereby granted, free of charge, to any person obtaining
++ * a copy of this software and associated documentation files (the
++ * "Software"), to deal in the Software without restriction, including
++ * without limitation the rights to use, copy, modify, merge, publish,
++ * distribute, sublicense, and/or sell copies of the Software, and to
++ * permit persons to whom the Software is furnished to do so, subject
++ * to the following conditions:
++ * The above copyright notice and this permission notice shall be included
++ * in all copies or substantial portions of the Software.
++ *
++ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS
++ * OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
++ * MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
++ * IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
++ * CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
++ * TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
++ * SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
++ *
++ */
++
++/** OMX_ComponentExt.h - OpenMax IL version 1.1.2
++ * The OMX_ComponentExt header file contains extensions to the definitions used
++ * by both the application and the component to access common items.
++ */
++
++#ifndef OMX_ComponentExt_h
++#define OMX_ComponentExt_h
++
++#ifdef __cplusplus
++extern "C" {
++#endif /* __cplusplus */
++
++/* Each OMX header must include all required header files to allow the
++ * header to compile without errors.  The includes below are required
++ * for this header file to compile successfully 
++ */
++#include <OMX_Types.h>
++
++
++/** Set/query the commit mode */
++typedef struct OMX_CONFIG_COMMITMODETYPE {
++    OMX_U32 nSize;
++    OMX_VERSIONTYPE nVersion;
++    OMX_BOOL bDeferred;
++} OMX_CONFIG_COMMITMODETYPE;
++
++/** Explicit commit */
++typedef struct OMX_CONFIG_COMMITTYPE {
++    OMX_U32 nSize;
++    OMX_VERSIONTYPE nVersion;
++} OMX_CONFIG_COMMITTYPE;
++
++
++#ifdef __cplusplus
++}
++#endif /* __cplusplus */
++
++#endif /* OMX_ComponentExt_h */
+diff -rupN a/usr/include/OpenMAX/il/OMX_Component.h b/usr/include/OpenMAX/il/OMX_Component.h
+--- a/usr/include/OpenMAX/il/OMX_Component.h	1970-01-01 01:00:00.000000000 +0100
++++ b/usr/include/OpenMAX/il/OMX_Component.h	2011-08-09 09:08:06.000000000 +0200
+@@ -0,0 +1,579 @@
++/*
++ * Copyright (c) 2008 The Khronos Group Inc.
++ *
++ * Permission is hereby granted, free of charge, to any person obtaining
++ * a copy of this software and associated documentation files (the
++ * "Software"), to deal in the Software without restriction, including
++ * without limitation the rights to use, copy, modify, merge, publish,
++ * distribute, sublicense, and/or sell copies of the Software, and to
++ * permit persons to whom the Software is furnished to do so, subject
++ * to the following conditions:
++ * The above copyright notice and this permission notice shall be included
++ * in all copies or substantial portions of the Software.
++ *
++ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS
++ * OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
++ * MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
++ * IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
++ * CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
++ * TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
++ * SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
++ *
++ */
++
++/** OMX_Component.h - OpenMax IL version 1.1.2
++ *  The OMX_Component header file contains the definitions used to define
++ *  the public interface of a component.  This header file is intended to
++ *  be used by both the application and the component.
++ */
++
++#ifndef OMX_Component_h
++#define OMX_Component_h
++
++#ifdef __cplusplus
++extern "C" {
++#endif /* __cplusplus */
++
++
++
++/* Each OMX header must include all required header files to allow the
++ *  header to compile without errors.  The includes below are required
++ *  for this header file to compile successfully
++ */
++
++#include <OMX_Audio.h>
++#include <OMX_Video.h>
++#include <OMX_Image.h>
++#include <OMX_Other.h>
++
++/** @ingroup comp */
++typedef enum OMX_PORTDOMAINTYPE {
++    OMX_PortDomainAudio,
++    OMX_PortDomainVideo,
++    OMX_PortDomainImage,
++    OMX_PortDomainOther,
++    OMX_PortDomainKhronosExtensions = 0x6F000000, /**< Reserved region for introducing Khronos Standard Extensions */
++    OMX_PortDomainVendorStartUnused = 0x7F000000, /**< Reserved region for introducing Vendor Extensions */
++    OMX_PortDomainMax = 0x7ffffff
++} OMX_PORTDOMAINTYPE;
++
++/** @ingroup comp */
++typedef struct OMX_PARAM_PORTDEFINITIONTYPE {
++    OMX_U32 nSize;                 /**< Size of the structure in bytes */
++    OMX_VERSIONTYPE nVersion;      /**< OMX specification version information */
++    OMX_U32 nPortIndex;            /**< Port number the structure applies to */
++    OMX_DIRTYPE eDir;              /**< Direction (input or output) of this port */
++    OMX_U32 nBufferCountActual;    /**< The actual number of buffers allocated on this port */
++    OMX_U32 nBufferCountMin;       /**< The minimum number of buffers this port requires */
++    OMX_U32 nBufferSize;           /**< Size, in bytes, for buffers to be used for this channel */
++    OMX_BOOL bEnabled;             /**< Ports default to enabled and are enabled/disabled by
++                                        OMX_CommandPortEnable/OMX_CommandPortDisable.
++                                        When disabled a port is unpopulated. A disabled port
++                                        is not populated with buffers on a transition to IDLE. */
++    OMX_BOOL bPopulated;           /**< Port is populated with all of its buffers as indicated by
++                                        nBufferCountActual. A disabled port is always unpopulated.
++                                        An enabled port is populated on a transition to OMX_StateIdle
++                                        and unpopulated on a transition to loaded. */
++    OMX_PORTDOMAINTYPE eDomain;    /**< Domain of the port. Determines the contents of metadata below. */
++    union {
++        OMX_AUDIO_PORTDEFINITIONTYPE audio;
++        OMX_VIDEO_PORTDEFINITIONTYPE video;
++        OMX_IMAGE_PORTDEFINITIONTYPE image;
++        OMX_OTHER_PORTDEFINITIONTYPE other;
++    } format;
++    OMX_BOOL bBuffersContiguous;
++    OMX_U32 nBufferAlignment;
++} OMX_PARAM_PORTDEFINITIONTYPE;
++
++/** @ingroup comp */
++typedef struct OMX_PARAM_U32TYPE {
++    OMX_U32 nSize;                    /**< Size of this structure, in Bytes */
++    OMX_VERSIONTYPE nVersion;         /**< OMX specification version information */
++    OMX_U32 nPortIndex;               /**< port that this structure applies to */
++    OMX_U32 nU32;                     /**< U32 value */
++} OMX_PARAM_U32TYPE;
++
++/** @ingroup rpm */
++typedef enum OMX_SUSPENSIONPOLICYTYPE {
++    OMX_SuspensionDisabled, /**< No suspension; v1.0 behavior */
++    OMX_SuspensionEnabled,  /**< Suspension allowed */
++    OMX_SuspensionPolicyKhronosExtensions = 0x6F000000, /**< Reserved region for introducing Khronos Standard Extensions */
++    OMX_SuspensionPolicyStartUnused = 0x7F000000, /**< Reserved region for introducing Vendor Extensions */
++    OMX_SuspensionPolicyMax = 0x7fffffff
++} OMX_SUSPENSIONPOLICYTYPE;
++
++/** @ingroup rpm */
++typedef struct OMX_PARAM_SUSPENSIONPOLICYTYPE {
++    OMX_U32 nSize;
++    OMX_VERSIONTYPE nVersion;
++    OMX_SUSPENSIONPOLICYTYPE ePolicy;
++} OMX_PARAM_SUSPENSIONPOLICYTYPE;
++
++/** @ingroup rpm */
++typedef enum OMX_SUSPENSIONTYPE {
++    OMX_NotSuspended, /**< component is not suspended */
++    OMX_Suspended,    /**< component is suspended */
++    OMX_SuspensionKhronosExtensions = 0x6F000000, /**< Reserved region for introducing Khronos Standard Extensions */
++    OMX_SuspensionVendorStartUnused = 0x7F000000, /**< Reserved region for introducing Vendor Extensions */
++    OMX_SuspendMax = 0x7FFFFFFF
++} OMX_SUSPENSIONTYPE;
++
++/** @ingroup rpm */
++typedef struct OMX_PARAM_SUSPENSIONTYPE {
++    OMX_U32 nSize;
++    OMX_VERSIONTYPE nVersion;
++    OMX_SUSPENSIONTYPE eType;
++} OMX_PARAM_SUSPENSIONTYPE ;
++
++typedef struct OMX_CONFIG_BOOLEANTYPE {
++    OMX_U32 nSize;
++    OMX_VERSIONTYPE nVersion;
++    OMX_BOOL bEnabled;
++} OMX_CONFIG_BOOLEANTYPE;
++
++/* Parameter specifying the content uri to use. */
++/** @ingroup cp */
++typedef struct OMX_PARAM_CONTENTURITYPE
++{
++    OMX_U32 nSize;                      /**< size of the structure in bytes, including
++                                             actual URI name */
++    OMX_VERSIONTYPE nVersion;           /**< OMX specification version information */
++    OMX_U8 contentURI[1];               /**< The URI name */
++} OMX_PARAM_CONTENTURITYPE;
++
++/* Parameter specifying the pipe to use. */
++/** @ingroup cp */
++typedef struct OMX_PARAM_CONTENTPIPETYPE
++{
++    OMX_U32 nSize;              /**< size of the structure in bytes */
++    OMX_VERSIONTYPE nVersion;   /**< OMX specification version information */
++    OMX_HANDLETYPE hPipe;       /**< The pipe handle*/
++} OMX_PARAM_CONTENTPIPETYPE;
++
++/** @ingroup rpm */
++typedef struct OMX_RESOURCECONCEALMENTTYPE {
++    OMX_U32 nSize;             /**< size of the structure in bytes */
++    OMX_VERSIONTYPE nVersion;  /**< OMX specification version information */
++    OMX_BOOL bResourceConcealmentForbidden; /**< disallow the use of resource concealment
++                                            methods (like degrading algorithm quality to
++                                            lower resource consumption or functional bypass)
++                                            on a component as a resolution to resource conflicts. */
++} OMX_RESOURCECONCEALMENTTYPE;
++
++
++/** @ingroup metadata */
++typedef enum OMX_METADATACHARSETTYPE {
++    OMX_MetadataCharsetUnknown = 0,
++    OMX_MetadataCharsetASCII,
++    OMX_MetadataCharsetBinary,
++    OMX_MetadataCharsetCodePage1252,
++    OMX_MetadataCharsetUTF8,
++    OMX_MetadataCharsetJavaConformantUTF8,
++    OMX_MetadataCharsetUTF7,
++    OMX_MetadataCharsetImapUTF7,
++    OMX_MetadataCharsetUTF16LE,
++    OMX_MetadataCharsetUTF16BE,
++    OMX_MetadataCharsetGB12345,
++    OMX_MetadataCharsetHZGB2312,
++    OMX_MetadataCharsetGB2312,
++    OMX_MetadataCharsetGB18030,
++    OMX_MetadataCharsetGBK,
++    OMX_MetadataCharsetBig5,
++    OMX_MetadataCharsetISO88591,
++    OMX_MetadataCharsetISO88592,
++    OMX_MetadataCharsetISO88593,
++    OMX_MetadataCharsetISO88594,
++    OMX_MetadataCharsetISO88595,
++    OMX_MetadataCharsetISO88596,
++    OMX_MetadataCharsetISO88597,
++    OMX_MetadataCharsetISO88598,
++    OMX_MetadataCharsetISO88599,
++    OMX_MetadataCharsetISO885910,
++    OMX_MetadataCharsetISO885913,
++    OMX_MetadataCharsetISO885914,
++    OMX_MetadataCharsetISO885915,
++    OMX_MetadataCharsetShiftJIS,
++    OMX_MetadataCharsetISO2022JP,
++    OMX_MetadataCharsetISO2022JP1,
++    OMX_MetadataCharsetISOEUCJP,
++    OMX_MetadataCharsetSMS7Bit,
++    OMX_MetadataCharsetKhronosExtensions = 0x6F000000, /**< Reserved region for introducing Khronos Standard Extensions */
++    OMX_MetadataCharsetVendorStartUnused = 0x7F000000, /**< Reserved region for introducing Vendor Extensions */
++    OMX_MetadataCharsetTypeMax= 0x7FFFFFFF
++} OMX_METADATACHARSETTYPE;
++
++/** @ingroup metadata */
++typedef enum OMX_METADATASCOPETYPE
++{
++    OMX_MetadataScopeAllLevels,
++    OMX_MetadataScopeTopLevel,
++    OMX_MetadataScopePortLevel,
++    OMX_MetadataScopeNodeLevel,
++    OMX_MetadataScopeKhronosExtensions = 0x6F000000, /**< Reserved region for introducing Khronos Standard Extensions */
++    OMX_MetadataScopeVendorStartUnused = 0x7F000000, /**< Reserved region for introducing Vendor Extensions */
++    OMX_MetadataScopeTypeMax = 0x7fffffff
++} OMX_METADATASCOPETYPE;
++
++/** @ingroup metadata */
++typedef enum OMX_METADATASEARCHMODETYPE
++{
++    OMX_MetadataSearchValueSizeByIndex,
++    OMX_MetadataSearchItemByIndex,
++    OMX_MetadataSearchNextItemByKey,
++    OMX_MetadataSearchKhronosExtensions = 0x6F000000, /**< Reserved region for introducing Khronos Standard Extensions */
++    OMX_MetadataSearchVendorStartUnused = 0x7F000000, /**< Reserved region for introducing Vendor Extensions */
++    OMX_MetadataSearchTypeMax = 0x7fffffff
++} OMX_METADATASEARCHMODETYPE;
++/** @ingroup metadata */
++typedef struct OMX_CONFIG_METADATAITEMCOUNTTYPE
++{
++    OMX_U32 nSize;
++    OMX_VERSIONTYPE nVersion;
++    OMX_METADATASCOPETYPE eScopeMode;
++    OMX_U32 nScopeSpecifier;
++    OMX_U32 nMetadataItemCount;
++} OMX_CONFIG_METADATAITEMCOUNTTYPE;
++
++/** @ingroup metadata */
++typedef struct OMX_CONFIG_METADATAITEMTYPE
++{
++    OMX_U32 nSize;
++    OMX_VERSIONTYPE nVersion;
++    OMX_METADATASCOPETYPE eScopeMode;
++    OMX_U32 nScopeSpecifier;
++    OMX_U32 nMetadataItemIndex;
++    OMX_METADATASEARCHMODETYPE eSearchMode;
++    OMX_METADATACHARSETTYPE eKeyCharset;
++    OMX_U8 nKeySizeUsed;
++    OMX_U8 nKey[128];
++    OMX_METADATACHARSETTYPE eValueCharset;
++    OMX_STRING sLanguageCountry;
++    OMX_U32 nValueMaxSize;
++    OMX_U32 nValueSizeUsed;
++    OMX_U8 nValue[1];
++} OMX_CONFIG_METADATAITEMTYPE;
++
++/* @ingroup metadata */
++typedef struct OMX_CONFIG_CONTAINERNODECOUNTTYPE
++{
++    OMX_U32 nSize;
++    OMX_VERSIONTYPE nVersion;
++    OMX_BOOL bAllKeys;
++    OMX_U32 nParentNodeID;
++    OMX_U32 nNumNodes;
++} OMX_CONFIG_CONTAINERNODECOUNTTYPE;
++
++/** @ingroup metadata */
++typedef struct OMX_CONFIG_CONTAINERNODEIDTYPE
++{
++    OMX_U32 nSize;
++    OMX_VERSIONTYPE nVersion;
++    OMX_BOOL bAllKeys;
++    OMX_U32 nParentNodeID;
++    OMX_U32 nNodeIndex;
++    OMX_U32 nNodeID;
++    OMX_STRING cNodeName;
++    OMX_BOOL bIsLeafType;
++} OMX_CONFIG_CONTAINERNODEIDTYPE;
++
++/** @ingroup metadata */
++typedef struct OMX_PARAM_METADATAFILTERTYPE
++{
++    OMX_U32 nSize;
++    OMX_VERSIONTYPE nVersion;
++    OMX_BOOL bAllKeys;	/* if true then this structure refers to all keys and
++                         * the three key fields below are ignored */
++    OMX_METADATACHARSETTYPE eKeyCharset;
++    OMX_U32 nKeySizeUsed;
++    OMX_U8   nKey [128];
++    OMX_U32 nLanguageCountrySizeUsed;
++    OMX_U8 nLanguageCountry[128];
++    OMX_BOOL bEnabled;	/* if true then key is part of filter (e.g.
++                         * retained for query later). If false then
++                         * key is not part of filter */
++} OMX_PARAM_METADATAFILTERTYPE;
++
++/** The OMX_HANDLETYPE structure defines the component handle.  The component
++ *  handle is used to access all of the component's public methods and also
++ *  contains pointers to the component's private data area.  The component
++ *  handle is initialized by the OMX core (with help from the component)
++ *  during the process of loading the component.  After the component is
++ *  successfully loaded, the application can safely access any of the
++ *  component's public functions (although some may return an error because
++ *  the state is inappropriate for the access).
++ *
++ *  @ingroup comp
++ */
++typedef struct OMX_COMPONENTTYPE
++{
++    /** The size of this structure, in bytes.  It is the responsibility
++        of the allocator of this structure to fill in this value.  Since
++        this structure is allocated by the GetHandle function, this
++        function will fill in this value. */
++    OMX_U32 nSize;
++
++    /** nVersion is the version of the OMX specification that the structure
++        is built against.  It is the responsibility of the creator of this
++        structure to initialize this value and every user of this structure
++        should verify that it knows how to use the exact version of
++        this structure found herein. */
++    OMX_VERSIONTYPE nVersion;
++
++    /** pComponentPrivate is a pointer to the component private data area.
++        This member is allocated and initialized by the component when the
++        component is first loaded.  The application should not access this
++        data area. */
++    OMX_PTR pComponentPrivate;
++
++    /** pApplicationPrivate is a pointer that is a parameter to the
++        OMX_GetHandle method, and contains an application private value
++        provided by the IL client.  This application private data is
++        returned to the IL Client by OMX in all callbacks */
++    OMX_PTR pApplicationPrivate;
++
++    /** refer to OMX_GetComponentVersion in OMX_core.h or the OMX IL
++        specification for details on the GetComponentVersion method.
++     */
++    OMX_ERRORTYPE (*GetComponentVersion)(
++            OMX_IN  OMX_HANDLETYPE hComponent,
++            OMX_OUT OMX_STRING pComponentName,
++            OMX_OUT OMX_VERSIONTYPE* pComponentVersion,
++            OMX_OUT OMX_VERSIONTYPE* pSpecVersion,
++            OMX_OUT OMX_UUIDTYPE* pComponentUUID);
++
++    /** refer to OMX_SendCommand in OMX_core.h or the OMX IL
++        specification for details on the SendCommand method.
++     */
++    OMX_ERRORTYPE (*SendCommand)(
++            OMX_IN  OMX_HANDLETYPE hComponent,
++            OMX_IN  OMX_COMMANDTYPE Cmd,
++            OMX_IN  OMX_U32 nParam1,
++            OMX_IN  OMX_PTR pCmdData);
++
++    /** refer to OMX_GetParameter in OMX_core.h or the OMX IL
++        specification for details on the GetParameter method.
++     */
++    OMX_ERRORTYPE (*GetParameter)(
++            OMX_IN  OMX_HANDLETYPE hComponent,
++            OMX_IN  OMX_INDEXTYPE nParamIndex,
++            OMX_INOUT OMX_PTR pComponentParameterStructure);
++
++
++    /** refer to OMX_SetParameter in OMX_core.h or the OMX IL
++        specification for details on the SetParameter method.
++     */
++    OMX_ERRORTYPE (*SetParameter)(
++            OMX_IN  OMX_HANDLETYPE hComponent,
++            OMX_IN  OMX_INDEXTYPE nIndex,
++            OMX_IN  OMX_PTR pComponentParameterStructure);
++
++
++    /** refer to OMX_GetConfig in OMX_core.h or the OMX IL
++        specification for details on the GetConfig method.
++     */
++    OMX_ERRORTYPE (*GetConfig)(
++            OMX_IN  OMX_HANDLETYPE hComponent,
++            OMX_IN  OMX_INDEXTYPE nIndex,
++            OMX_INOUT OMX_PTR pComponentConfigStructure);
++
++
++    /** refer to OMX_SetConfig in OMX_core.h or the OMX IL
++        specification for details on the SetConfig method.
++     */
++    OMX_ERRORTYPE (*SetConfig)(
++            OMX_IN  OMX_HANDLETYPE hComponent,
++            OMX_IN  OMX_INDEXTYPE nIndex,
++            OMX_IN  OMX_PTR pComponentConfigStructure);
++
++
++    /** refer to OMX_GetExtensionIndex in OMX_core.h or the OMX IL
++        specification for details on the GetExtensionIndex method.
++     */
++    OMX_ERRORTYPE (*GetExtensionIndex)(
++            OMX_IN  OMX_HANDLETYPE hComponent,
++            OMX_IN  OMX_STRING cParameterName,
++            OMX_OUT OMX_INDEXTYPE* pIndexType);
++
++
++    /** refer to OMX_GetState in OMX_core.h or the OMX IL
++        specification for details on the GetState method.
++     */
++    OMX_ERRORTYPE (*GetState)(
++            OMX_IN  OMX_HANDLETYPE hComponent,
++            OMX_OUT OMX_STATETYPE* pState);
++
++
++    /** The ComponentTunnelRequest method will interact with another OMX
++        component to determine if tunneling is possible and to setup the
++        tunneling.  The return codes for this method can be used to
++        determine if tunneling is not possible, or if tunneling is not
++        supported.
++
++        Base profile components (i.e. non-interop) do not support this
++        method and should return OMX_ErrorNotImplemented
++
++        The interop profile component MUST support tunneling to another
++        interop profile component with a compatible port parameters.
++        A component may also support proprietary communication.
++
++        If proprietary communication is supported the negotiation of
++        proprietary communication is done outside of OMX in a vendor
++        specific way. It is only required that the proper result be
++        returned and the details of how the setup is done is left
++        to the component implementation.
++
++        When this method is invoked when nPort in an output port, the
++        component will:
++        1.  Populate the pTunnelSetup structure with the output port's
++            requirements and constraints for the tunnel.
++
++        When this method is invoked when nPort in an input port, the
++        component will:
++        1.  Query the necessary parameters from the output port to
++            determine if the ports are compatible for tunneling
++        2.  If the ports are compatible, the component should store
++            the tunnel step provided by the output port
++        3.  Determine which port (either input or output) is the buffer
++            supplier, and call OMX_SetParameter on the output port to
++            indicate this selection.
++
++        The component will return from this call within 5 msec.
++
++        @param [in] hComp
++            Handle of the component to be accessed.  This is the component
++            handle returned by the call to the OMX_GetHandle method.
++        @param [in] nPort
++            nPort is used to select the port on the component to be used
++            for tunneling.
++        @param [in] hTunneledComp
++            Handle of the component to tunnel with.  This is the component
++            handle returned by the call to the OMX_GetHandle method.  When
++            this parameter is 0x0 the component should setup the port for
++            communication with the application / IL Client.
++        @param [in] nPortOutput
++            nPortOutput is used indicate the port the component should
++            tunnel with.
++        @param [in] pTunnelSetup
++            Pointer to the tunnel setup structure.  When nPort is an output port
++            the component should populate the fields of this structure.  When
++            When nPort is an input port the component should review the setup
++            provided by the component with the output port.
++        @return OMX_ERRORTYPE
++            If the command successfully executes, the return code will be
++            OMX_ErrorNone.  Otherwise the appropriate OMX error will be returned.
++        @ingroup tun
++    */
++
++    OMX_ERRORTYPE (*ComponentTunnelRequest)(
++        OMX_IN  OMX_HANDLETYPE hComp,
++        OMX_IN  OMX_U32 nPort,
++        OMX_IN  OMX_HANDLETYPE hTunneledComp,
++        OMX_IN  OMX_U32 nTunneledPort,
++        OMX_INOUT  OMX_TUNNELSETUPTYPE* pTunnelSetup);
++
++    /** refer to OMX_UseBuffer in OMX_core.h or the OMX IL
++        specification for details on the UseBuffer method.
++        @ingroup buf
++     */
++    OMX_ERRORTYPE (*UseBuffer)(
++            OMX_IN OMX_HANDLETYPE hComponent,
++            OMX_INOUT OMX_BUFFERHEADERTYPE** ppBufferHdr,
++            OMX_IN OMX_U32 nPortIndex,
++            OMX_IN OMX_PTR pAppPrivate,
++            OMX_IN OMX_U32 nSizeBytes,
++            OMX_IN OMX_U8* pBuffer);
++
++    /** refer to OMX_AllocateBuffer in OMX_core.h or the OMX IL
++        specification for details on the AllocateBuffer method.
++        @ingroup buf
++     */
++    OMX_ERRORTYPE (*AllocateBuffer)(
++            OMX_IN OMX_HANDLETYPE hComponent,
++            OMX_INOUT OMX_BUFFERHEADERTYPE** ppBuffer,
++            OMX_IN OMX_U32 nPortIndex,
++            OMX_IN OMX_PTR pAppPrivate,
++            OMX_IN OMX_U32 nSizeBytes);
++
++    /** refer to OMX_FreeBuffer in OMX_core.h or the OMX IL
++        specification for details on the FreeBuffer method.
++        @ingroup buf
++     */
++    OMX_ERRORTYPE (*FreeBuffer)(
++            OMX_IN  OMX_HANDLETYPE hComponent,
++            OMX_IN  OMX_U32 nPortIndex,
++            OMX_IN  OMX_BUFFERHEADERTYPE* pBuffer);
++
++    /** refer to OMX_EmptyThisBuffer in OMX_core.h or the OMX IL
++        specification for details on the EmptyThisBuffer method.
++        @ingroup buf
++     */
++    OMX_ERRORTYPE (*EmptyThisBuffer)(
++            OMX_IN  OMX_HANDLETYPE hComponent,
++            OMX_IN  OMX_BUFFERHEADERTYPE* pBuffer);
++
++    /** refer to OMX_FillThisBuffer in OMX_core.h or the OMX IL
++        specification for details on the FillThisBuffer method.
++        @ingroup buf
++     */
++    OMX_ERRORTYPE (*FillThisBuffer)(
++            OMX_IN  OMX_HANDLETYPE hComponent,
++            OMX_IN  OMX_BUFFERHEADERTYPE* pBuffer);
++
++    /** The SetCallbacks method is used by the core to specify the callback
++        structure from the application to the component.  This is a blocking
++        call.  The component will return from this call within 5 msec.
++        @param [in] hComponent
++            Handle of the component to be accessed.  This is the component
++            handle returned by the call to the GetHandle function.
++        @param [in] pCallbacks
++            pointer to an OMX_CALLBACKTYPE structure used to provide the
++            callback information to the component
++        @param [in] pAppData
++            pointer to an application defined value.  It is anticipated that
++            the application will pass a pointer to a data structure or a "this
++            pointer" in this area to allow the callback (in the application)
++            to determine the context of the call
++        @return OMX_ERRORTYPE
++            If the command successfully executes, the return code will be
++            OMX_ErrorNone.  Otherwise the appropriate OMX error will be returned.
++     */
++    OMX_ERRORTYPE (*SetCallbacks)(
++            OMX_IN  OMX_HANDLETYPE hComponent,
++            OMX_IN  OMX_CALLBACKTYPE* pCallbacks,
++            OMX_IN  OMX_PTR pAppData);
++
++    /** ComponentDeInit method is used to deinitialize the component
++        providing a means to free any resources allocated at component
++        initialization.  NOTE:  After this call the component handle is
++        not valid for further use.
++        @param [in] hComponent
++            Handle of the component to be accessed.  This is the component
++            handle returned by the call to the GetHandle function.
++        @return OMX_ERRORTYPE
++            If the command successfully executes, the return code will be
++            OMX_ErrorNone.  Otherwise the appropriate OMX error will be returned.
++     */
++    OMX_ERRORTYPE (*ComponentDeInit)(
++            OMX_IN  OMX_HANDLETYPE hComponent);
++
++    /** @ingroup buf */
++    OMX_ERRORTYPE (*UseEGLImage)(
++            OMX_IN OMX_HANDLETYPE hComponent,
++            OMX_INOUT OMX_BUFFERHEADERTYPE** ppBufferHdr,
++            OMX_IN OMX_U32 nPortIndex,
++            OMX_IN OMX_PTR pAppPrivate,
++            OMX_IN void* eglImage);
++
++    OMX_ERRORTYPE (*ComponentRoleEnum)(
++        OMX_IN OMX_HANDLETYPE hComponent,
++		OMX_OUT OMX_U8 *cRole,
++		OMX_IN OMX_U32 nIndex);
++
++} OMX_COMPONENTTYPE;
++
++#ifdef __cplusplus
++}
++#endif /* __cplusplus */
++
++#endif
++/* File EOF */
+diff -rupN a/usr/include/OpenMAX/il/OMX_ContentPipe.h b/usr/include/OpenMAX/il/OMX_ContentPipe.h
+--- a/usr/include/OpenMAX/il/OMX_ContentPipe.h	1970-01-01 01:00:00.000000000 +0100
++++ b/usr/include/OpenMAX/il/OMX_ContentPipe.h	2011-08-09 09:08:06.000000000 +0200
+@@ -0,0 +1,195 @@
++/*
++ * Copyright (c) 2008 The Khronos Group Inc.
++ *
++ * Permission is hereby granted, free of charge, to any person obtaining
++ * a copy of this software and associated documentation files (the
++ * "Software"), to deal in the Software without restriction, including
++ * without limitation the rights to use, copy, modify, merge, publish,
++ * distribute, sublicense, and/or sell copies of the Software, and to
++ * permit persons to whom the Software is furnished to do so, subject
++ * to the following conditions:
++ * The above copyright notice and this permission notice shall be included
++ * in all copies or substantial portions of the Software.
++ *
++ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS
++ * OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
++ * MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
++ * IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
++ * CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
++ * TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
++ * SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
++ *
++ */
++
++/** OMX_ContentPipe.h - OpenMax IL version 1.1.2
++ *  The OMX_ContentPipe header file contains the definitions used to define
++ *  the public interface for content piples.  This header file is intended to
++ *  be used by the component.
++ */
++
++#ifndef OMX_CONTENTPIPE_H
++#define OMX_CONTENTPIPE_H
++
++#ifndef KD_EACCES
++/* OpenKODE error codes. CPResult values may be zero (indicating success
++   or one of the following values) */
++#define KD_EACCES (1)
++#define KD_EADDRINUSE (2)
++#define KD_EAGAIN (5)
++#define KD_EBADF (7)
++#define KD_EBUSY (8)
++#define KD_ECONNREFUSED (9)
++#define KD_ECONNRESET (10)
++#define KD_EDEADLK (11)
++#define KD_EDESTADDRREQ (12)
++#define KD_ERANGE (35)
++#define KD_EEXIST (13)
++#define KD_EFBIG (14)
++#define KD_EHOSTUNREACH (15)
++#define KD_EINVAL (17)
++#define KD_EIO (18)
++#define KD_EISCONN (20)
++#define KD_EISDIR (21)
++#define KD_EMFILE (22)
++#define KD_ENAMETOOLONG (23)
++#define KD_ENOENT (24)
++#define KD_ENOMEM (25)
++#define KD_ENOSPC (26)
++#define KD_ENOSYS (27)
++#define KD_ENOTCONN (28)
++#define KD_EPERM (33)
++#define KD_ETIMEDOUT (36)
++#define KD_EILSEQ (19)
++#endif
++
++/** Map types from OMX standard types only here so interface is as generic as possible. */
++typedef OMX_U32    CPresult;
++typedef char *     CPstring;
++typedef void *     CPhandle;
++typedef OMX_U32    CPuint;
++typedef OMX_S32    CPint;
++typedef char       CPbyte;
++typedef OMX_BOOL   CPbool;
++
++/** enumeration of origin types used in the CP_PIPETYPE's Seek function
++ * @ingroup cp
++ */
++typedef enum CP_ORIGINTYPE {
++    CP_OriginBegin,
++    CP_OriginCur,
++    CP_OriginEnd,
++    CP_OriginKhronosExtensions = 0x6F000000, /**< Reserved region for introducing Khronos Standard Extensions */
++    CP_OriginVendorStartUnused = 0x7F000000, /**< Reserved region for introducing Vendor Extensions */
++    CP_OriginMax = 0X7FFFFFFF
++} CP_ORIGINTYPE;
++
++/** enumeration of contact access types used in the CP_PIPETYPE's Open function
++ * @ingroup cp
++ */
++typedef enum CP_ACCESSTYPE {
++    CP_AccessRead,
++    CP_AccessWrite,
++    CP_AccessReadWrite ,
++    CP_AccessKhronosExtensions = 0x6F000000, /**< Reserved region for introducing Khronos Standard Extensions */
++    CP_AccessVendorStartUnused = 0x7F000000, /**< Reserved region for introducing Vendor Extensions */
++    CP_AccessMax = 0X7FFFFFFF
++} CP_ACCESSTYPE;
++
++/** enumeration of results returned by the CP_PIPETYPE's CheckAvailableBytes function
++ * @ingroup cp
++ */
++typedef enum CP_CHECKBYTESRESULTTYPE
++{
++    CP_CheckBytesOk,                    /**< There are@least the request number
++                                              of bytes available */
++    CP_CheckBytesNotReady,              /**< The pipe is still retrieving bytes
++                                              and presently lacks sufficient bytes.
++                                              Client will be called when they are
++                                              sufficient bytes are available. */
++    CP_CheckBytesInsufficientBytes  ,     /**< The pipe has retrieved all bytes
++                                              but those available are less than those
++                                              requested */
++    CP_CheckBytesAtEndOfStream,         /**< The pipe has reached the end of stream
++                                              and no more bytes are available. */
++    CP_CheckBytesOutOfBuffers,          /**< All read/write buffers are currently in use. */
++    CP_CheckBytesKhronosExtensions = 0x6F000000, /**< Reserved region for introducing Khronos Standard Extensions */
++    CP_CheckBytesVendorStartUnused = 0x7F000000, /**< Reserved region for introducing Vendor Extensions */
++    CP_CheckBytesMax = 0X7FFFFFFF
++} CP_CHECKBYTESRESULTTYPE;
++
++/** enumeration of content pipe events sent to the client callback.
++ * @ingroup cp
++ */
++typedef enum CP_EVENTTYPE{
++    CP_BytesAvailable,	    /** bytes requested in a CheckAvailableBytes call are now available*/
++    CP_Overflow,		           /** enumeration of content pipe events sent to the client callback*/
++    CP_PipeDisconnected  ,		    /** enumeration of content pipe events sent to the client callback*/
++    CP_EventKhronosExtensions = 0x6F000000, /**< Reserved region for introducing Khronos Standard Extensions */
++    CP_EventVendorStartUnused = 0x7F000000, /**< Reserved region for introducing Vendor Extensions */
++    CP_EventMax = 0X7FFFFFFF
++} CP_EVENTTYPE;
++
++/** content pipe definition
++ * @ingroup cp
++ */
++typedef struct CP_PIPETYPE
++{
++    /** Open a content stream for reading or writing. */
++    CPresult (*Open)( CPhandle* hContent, CPstring szURI, CP_ACCESSTYPE eAccess );
++
++    /** Close a content stream. */
++    CPresult (*Close)( CPhandle hContent );
++
++    /** Create a content source and open it for writing. */
++    CPresult (*Create)( CPhandle *hContent, CPstring szURI );
++
++    /** Check the that specified number of bytes are available for reading or writing (depending on access type).*/
++    CPresult (*CheckAvailableBytes)( CPhandle hContent, CPuint nBytesRequested, CP_CHECKBYTESRESULTTYPE *eResult );
++
++    /** Seek to certain position in the content relative to the specified origin. */
++    CPresult (*SetPosition)( CPhandle  hContent, CPint nOffset, CP_ORIGINTYPE eOrigin);
++
++    /** Retrieve the current position relative to the start of the content. */
++    CPresult (*GetPosition)( CPhandle hContent, CPuint *pPosition);
++
++    /** Retrieve data of the specified size from the content stream (advance content pointer by size of data).
++       Note: pipe client provides pointer. This function is appropriate for small high frequency reads. */
++    CPresult (*Read)( CPhandle hContent, CPbyte *pData, CPuint nSize);
++
++    /** Retrieve a buffer allocated by the pipe that contains the requested number of bytes.
++       Buffer contains the next block of bytes, as specified by nSize, of the content. nSize also
++       returns the size of the block actually read. Content pointer advances the by the returned size.
++       Note: pipe provides pointer. This function is appropriate for large reads. The client must call
++       ReleaseReadBuffer when done with buffer.
++
++       In some cases the requested block may not reside in contiguous memory within the
++       pipe implementation. For instance if the pipe leverages a circular buffer then the requested
++       block may straddle the boundary of the circular buffer. By default a pipe implementation
++       performs a copy in this case to provide the block to the pipe client in one contiguous buffer.
++       If, however, the client sets bForbidCopy, then the pipe returns only those bytes preceding the memory
++       boundary. Here the client may retrieve the data in segments over successive calls. */
++    CPresult (*ReadBuffer)( CPhandle hContent, CPbyte **ppBuffer, CPuint *nSize, CPbool bForbidCopy);
++
++    /** Release a buffer obtained by ReadBuffer back to the pipe. */
++    CPresult (*ReleaseReadBuffer)(CPhandle hContent, CPbyte *pBuffer);
++
++    /** Write data of the specified size to the content (advance content pointer by size of data).
++       Note: pipe client provides pointer. This function is appropriate for small high frequency writes. */
++    CPresult (*Write)( CPhandle hContent, CPbyte *data, CPuint nSize);
++
++    /** Retrieve a buffer allocated by the pipe used to write data to the content.
++       Client will fill buffer with output data. Note: pipe provides pointer. This function is appropriate
++       for large writes. The client must call WriteBuffer when done it has filled the buffer with data.*/
++    CPresult (*GetWriteBuffer)( CPhandle hContent, CPbyte **ppBuffer, CPuint nSize);
++
++    /** Deliver a buffer obtained via GetWriteBuffer to the pipe. Pipe will write the
++       the contents of the buffer to content and advance content pointer by the size of the buffer */
++    CPresult (*WriteBuffer)( CPhandle hContent, CPbyte *pBuffer, CPuint nFilledSize);
++
++    /** Register a per-handle client callback with the content pipe. */
++    CPresult (*RegisterCallback)( CPhandle hContent, CPresult (*ClientCallback)(CP_EVENTTYPE eEvent, CPuint iParam));
++
++} CP_PIPETYPE;
++
++#endif
++
+diff -rupN a/usr/include/OpenMAX/il/OMX_CoreExt.h b/usr/include/OpenMAX/il/OMX_CoreExt.h
+--- a/usr/include/OpenMAX/il/OMX_CoreExt.h	1970-01-01 01:00:00.000000000 +0100
++++ b/usr/include/OpenMAX/il/OMX_CoreExt.h	2011-08-09 09:07:36.000000000 +0200
+@@ -0,0 +1,73 @@
++/*
++ * Copyright (c) 2010 The Khronos Group Inc.
++ *
++ * Permission is hereby granted, free of charge, to any person obtaining
++ * a copy of this software and associated documentation files (the
++ * "Software"), to deal in the Software without restriction, including
++ * without limitation the rights to use, copy, modify, merge, publish,
++ * distribute, sublicense, and/or sell copies of the Software, and to
++ * permit persons to whom the Software is furnished to do so, subject
++ * to the following conditions:
++ * The above copyright notice and this permission notice shall be included
++ * in all copies or substantial portions of the Software.
++ *
++ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS
++ * OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
++ * MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
++ * IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
++ * CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
++ * TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
++ * SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
++ *
++ */
++
++/** OMX_CoreExt.h - OpenMax IL version 1.1.2
++ * The OMX_CoreExt header file contains extensions to the definitions used
++ * by both the application and the component to access common items.
++ */
++
++#ifndef OMX_CoreExt_h
++#define OMX_CoreExt_h
++
++#ifdef __cplusplus
++extern "C" {
++#endif /* __cplusplus */
++
++/* Each OMX header shall include all required header files to allow the
++ * header to compile without errors.  The includes below are required
++ * for this header file to compile successfully
++ */
++#include <OMX_Core.h>
++
++/** Extensions to the standard IL errors. */ 
++typedef enum OMX_ERROREXTTYPE 
++{
++    OMX_ErrorInvalidMode = (OMX_S32) (OMX_ErrorKhronosExtensions + 0x00000001),
++    OMX_ErrorExtMax = 0x7FFFFFFF
++} OMX_ERROREXTTYPE;
++
++
++/** Event type extensions. */
++typedef enum OMX_EVENTEXTTYPE
++{
++    OMX_EventIndexSettingChanged = OMX_EventKhronosExtensions, /**< component signals the IL client of a change
++                                                                    in a param, config, or extension */
++    OMX_EventExtMax = 0x7FFFFFFF
++} OMX_EVENTEXTTYPE;
++
++
++/** Enable or disable a callback event. */
++typedef struct OMX_CONFIG_CALLBACKREQUESTTYPE {
++    OMX_U32 nSize;              /**< size of the structure in bytes */
++    OMX_VERSIONTYPE nVersion;   /**< OMX specification version information */
++    OMX_U32 nPortIndex;         /**< port that this structure applies to */
++    OMX_INDEXTYPE nIndex;       /**< the index the callback is requested for */
++    OMX_BOOL bEnable;           /**< enable (OMX_TRUE) or disable (OMX_FALSE) the callback */
++} OMX_CONFIG_CALLBACKREQUESTTYPE;
++
++#ifdef __cplusplus
++}
++#endif /* __cplusplus */
++
++#endif /* OMX_CoreExt_h */
++/* File EOF */
+diff -rupN a/usr/include/OpenMAX/il/OMX_Core.h b/usr/include/OpenMAX/il/OMX_Core.h
+--- a/usr/include/OpenMAX/il/OMX_Core.h	1970-01-01 01:00:00.000000000 +0100
++++ b/usr/include/OpenMAX/il/OMX_Core.h	2011-08-09 09:08:06.000000000 +0200
+@@ -0,0 +1,1431 @@
++/*
++ * Copyright (c) 2008 The Khronos Group Inc.
++ *
++ * Permission is hereby granted, free of charge, to any person obtaining
++ * a copy of this software and associated documentation files (the
++ * "Software"), to deal in the Software without restriction, including
++ * without limitation the rights to use, copy, modify, merge, publish,
++ * distribute, sublicense, and/or sell copies of the Software, and to
++ * permit persons to whom the Software is furnished to do so, subject
++ * to the following conditions:
++ * The above copyright notice and this permission notice shall be included
++ * in all copies or substantial portions of the Software.
++ *
++ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS
++ * OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
++ * MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
++ * IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
++ * CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
++ * TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
++ * SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
++ *
++ */
++
++/** OMX_Core.h - OpenMax IL version 1.1.2
++ *  The OMX_Core header file contains the definitions used by both the
++ *  application and the component to access common items.
++ */
++
++#ifndef OMX_Core_h
++#define OMX_Core_h
++
++#ifdef __cplusplus
++extern "C" {
++#endif /* __cplusplus */
++
++
++/* Each OMX header shall include all required header files to allow the
++ *  header to compile without errors.  The includes below are required
++ *  for this header file to compile successfully
++ */
++
++#include <OMX_Index.h>
++
++
++/** The OMX_COMMANDTYPE enumeration is used to specify the action in the
++ *  OMX_SendCommand macro.
++ *  @ingroup core
++ */
++typedef enum OMX_COMMANDTYPE
++{
++    OMX_CommandStateSet,    /**< Change the component state */
++    OMX_CommandFlush,       /**< Flush the data queue(s) of a component */
++    OMX_CommandPortDisable, /**< Disable a port on a component. */
++    OMX_CommandPortEnable,  /**< Enable a port on a component. */
++    OMX_CommandMarkBuffer,  /**< Mark a component/buffer for observation */
++    OMX_CommandKhronosExtensions = 0x6F000000, /**< Reserved region for introducing Khronos Standard Extensions */
++    OMX_CommandVendorStartUnused = 0x7F000000, /**< Reserved region for introducing Vendor Extensions */
++    OMX_CommandMax = 0X7FFFFFFF
++} OMX_COMMANDTYPE;
++
++
++
++/** The OMX_STATETYPE enumeration is used to indicate or change the component
++ *  state.  This enumeration reflects the current state of the component when
++ *  used with the OMX_GetState macro or becomes the parameter in a state change
++ *  command when used with the OMX_SendCommand macro.
++ *
++ *  The component will be in the Loaded state after the component is initially
++ *  loaded into memory.  In the Loaded state, the component is not allowed to
++ *  allocate or hold resources other than to build it's internal parameter
++ *  and configuration tables.  The application will send one or more
++ *  SetParameters/GetParameters and SetConfig/GetConfig commands to the
++ *  component and the component will record each of these parameter and
++ *  configuration changes for use later.  When the application sends the
++ *  Idle command, the component will acquire the resources needed for the
++ *  specified configuration and will transition to the idle state if the
++ *  allocation is successful.  If the component cannot successfully
++ *  transition to the idle state for any reason, the state of the component
++ *  shall be fully rolled back to the Loaded state (e.g. all allocated
++ *  resources shall be released).  When the component receives the command
++ *  to go to the Executing state, it shall begin processing buffers by
++ *  sending all input buffers it holds to the application.  While
++ *  the component is in the Idle state, the application may also send the
++ *  Pause command.  If the component receives the pause command while in the
++ *  Idle state, the component shall send all input buffers it holds to the
++ *  application, but shall not begin processing buffers.  This will allow the
++ *  application to prefill buffers.
++ *
++ *  @ingroup comp
++ */
++
++typedef enum OMX_STATETYPE
++{
++    OMX_StateInvalid,      /**< component has detected that it's internal data
++                                structures are corrupted to the point that
++                                it cannot determine it's state properly */
++    OMX_StateLoaded,      /**< component has been loaded but has not completed
++                                initialization.  The OMX_SetParameter macro
++                                and the OMX_GetParameter macro are the only
++                                valid macros allowed to be sent to the
++                                component in this state. */
++    OMX_StateIdle,        /**< component initialization has been completed
++                                successfully and the component is ready to
++                                to start. */
++    OMX_StateExecuting,   /**< component has accepted the start command and
++                                is processing data (if data is available) */
++    OMX_StatePause,       /**< component has received pause command */
++    OMX_StateWaitForResources, /**< component is waiting for resources, either after
++                                preemption or before it gets the resources requested.
++                                See specification for complete details. */
++    OMX_StateKhronosExtensions = 0x6F000000, /**< Reserved region for introducing Khronos Standard Extensions */
++    OMX_StateVendorStartUnused = 0x7F000000, /**< Reserved region for introducing Vendor Extensions */
++    OMX_StateMax = 0X7FFFFFFF
++} OMX_STATETYPE;
++
++/** The OMX_ERRORTYPE enumeration defines the standard OMX Errors.  These
++ *  errors should cover most of the common failure cases.  However,
++ *  vendors are free to add additional error messages of their own as
++ *  long as they follow these rules:
++ *  1.  Vendor error messages shall be in the range of 0x90000000 to
++ *      0x9000FFFF.
++ *  2.  Vendor error messages shall be defined in a header file provided
++ *      with the component.  No error messages are allowed that are
++ *      not defined.
++ */
++typedef enum OMX_ERRORTYPE
++{
++  OMX_ErrorNone = 0,
++
++  /** There were insufficient resources to perform the requested operation */
++  OMX_ErrorInsufficientResources = (OMX_S32) 0x80001000,
++
++  /** There was an error, but the cause of the error could not be determined */
++  OMX_ErrorUndefined = (OMX_S32) 0x80001001,
++
++  /** The component name string was not valid */
++  OMX_ErrorInvalidComponentName = (OMX_S32) 0x80001002,
++
++  /** No component with the specified name string was found */
++  OMX_ErrorComponentNotFound = (OMX_S32) 0x80001003,
++
++  /** The component specified did not have a "OMX_ComponentInit" or
++      "OMX_ComponentDeInit entry point */
++  OMX_ErrorInvalidComponent = (OMX_S32) 0x80001004,
++
++  /** One or more parameters were not valid */
++  OMX_ErrorBadParameter = (OMX_S32) 0x80001005,
++
++  /** The requested function is not implemented */
++  OMX_ErrorNotImplemented = (OMX_S32) 0x80001006,
++
++  /** The buffer was emptied before the next buffer was ready */
++  OMX_ErrorUnderflow = (OMX_S32) 0x80001007,
++
++  /** The buffer was not available when it was needed */
++  OMX_ErrorOverflow = (OMX_S32) 0x80001008,
++
++  /** The hardware failed to respond as expected */
++  OMX_ErrorHardware = (OMX_S32) 0x80001009,
++
++  /** The component is in the state OMX_StateInvalid */
++  OMX_ErrorInvalidState = (OMX_S32) 0x8000100A,
++
++  /** Stream is found to be corrupt */
++  OMX_ErrorStreamCorrupt = (OMX_S32) 0x8000100B,
++
++  /** Ports being connected are not compatible */
++  OMX_ErrorPortsNotCompatible = (OMX_S32) 0x8000100C,
++
++  /** Resources allocated to an idle component have been
++      lost resulting in the component returning to the loaded state */
++  OMX_ErrorResourcesLost = (OMX_S32) 0x8000100D,
++
++  /** No more indicies can be enumerated */
++  OMX_ErrorNoMore = (OMX_S32) 0x8000100E,
++
++  /** The component detected a version mismatch */
++  OMX_ErrorVersionMismatch = (OMX_S32) 0x8000100F,
++
++  /** The component is not ready to return data at this time */
++  OMX_ErrorNotReady = (OMX_S32) 0x80001010,
++
++  /** There was a timeout that occurred */
++  OMX_ErrorTimeout = (OMX_S32) 0x80001011,
++
++  /** This error occurs when trying to transition into the state you are already in */
++  OMX_ErrorSameState = (OMX_S32) 0x80001012,
++
++  /** Resources allocated to an executing or paused component have been
++      preempted, causing the component to return to the idle state */
++  OMX_ErrorResourcesPreempted = (OMX_S32) 0x80001013,
++
++  /** A non-supplier port sends this error to the IL client (via the EventHandler callback)
++      during the allocation of buffers (on a transition from the LOADED to the IDLE state or
++      on a port restart) when it deems that it has waited an unusually long time for the supplier
++      to send it an allocated buffer via a UseBuffer call. */
++  OMX_ErrorPortUnresponsiveDuringAllocation = (OMX_S32) 0x80001014,
++
++  /** A non-supplier port sends this error to the IL client (via the EventHandler callback)
++      during the deallocation of buffers (on a transition from the IDLE to LOADED state or
++      on a port stop) when it deems that it has waited an unusually long time for the supplier
++      to request the deallocation of a buffer header via a FreeBuffer call. */
++  OMX_ErrorPortUnresponsiveDuringDeallocation = (OMX_S32) 0x80001015,
++
++  /** A supplier port sends this error to the IL client (via the EventHandler callback)
++      during the stopping of a port (either on a transition from the IDLE to LOADED
++      state or a port stop) when it deems that it has waited an unusually long time for
++      the non-supplier to return a buffer via an EmptyThisBuffer or FillThisBuffer call. */
++  OMX_ErrorPortUnresponsiveDuringStop = (OMX_S32) 0x80001016,
++
++  /** Attempting a state transtion that is not allowed */
++  OMX_ErrorIncorrectStateTransition = (OMX_S32) 0x80001017,
++
++  /* Attempting a command that is not allowed during the present state. */
++  OMX_ErrorIncorrectStateOperation = (OMX_S32) 0x80001018,
++
++  /** The values encapsulated in the parameter or config structure are not supported. */
++  OMX_ErrorUnsupportedSetting = (OMX_S32) 0x80001019,
++
++  /** The parameter or config indicated by the given index is not supported. */
++  OMX_ErrorUnsupportedIndex = (OMX_S32) 0x8000101A,
++
++  /** The port index supplied is incorrect. */
++  OMX_ErrorBadPortIndex = (OMX_S32) 0x8000101B,
++
++  /** The port has lost one or more of its buffers and it thus unpopulated. */
++  OMX_ErrorPortUnpopulated = (OMX_S32) 0x8000101C,
++
++  /** Component suspended due to temporary loss of resources */
++  OMX_ErrorComponentSuspended = (OMX_S32) 0x8000101D,
++
++  /** Component suspended due to an inability to acquire dynamic resources */
++  OMX_ErrorDynamicResourcesUnavailable = (OMX_S32) 0x8000101E,
++
++  /** When the macroblock error reporting is enabled the component returns new error
++  for every frame that has errors */
++  OMX_ErrorMbErrorsInFrame = (OMX_S32) 0x8000101F,
++
++  /** A component reports this error when it cannot parse or determine the format of an input stream. */
++  OMX_ErrorFormatNotDetected = (OMX_S32) 0x80001020,
++
++  /** The content open operation failed. */
++  OMX_ErrorContentPipeOpenFailed = (OMX_S32) 0x80001021,
++
++  /** The content creation operation failed. */
++  OMX_ErrorContentPipeCreationFailed = (OMX_S32) 0x80001022,
++
++  /** Separate table information is being used */
++  OMX_ErrorSeperateTablesUsed = (OMX_S32) 0x80001023,
++
++  /** Tunneling is unsupported by the component*/
++  OMX_ErrorTunnelingUnsupported = (OMX_S32) 0x80001024,
++
++  OMX_ErrorKhronosExtensions = (OMX_S32)0x8F000000, /**< Reserved region for introducing Khronos Standard Extensions */
++  OMX_ErrorVendorStartUnused = (OMX_S32)0x90000000, /**< Reserved region for introducing Vendor Extensions */
++  OMX_ErrorMax = 0x7FFFFFFF
++} OMX_ERRORTYPE;
++
++/** @ingroup core */
++typedef OMX_ERRORTYPE (* OMX_COMPONENTINITTYPE)(OMX_IN  OMX_HANDLETYPE hComponent);
++
++/** @ingroup core */
++typedef struct OMX_COMPONENTREGISTERTYPE
++{
++  const char          * pName;       /* Component name, 128 byte limit (including '\0') applies */
++  OMX_COMPONENTINITTYPE pInitialize; /* Component instance initialization function */
++} OMX_COMPONENTREGISTERTYPE;
++
++/** @ingroup core */
++extern OMX_COMPONENTREGISTERTYPE OMX_ComponentRegistered[];
++
++/** @ingroup rpm */
++typedef struct OMX_PRIORITYMGMTTYPE {
++ OMX_U32 nSize;             /**< size of the structure in bytes */
++ OMX_VERSIONTYPE nVersion;  /**< OMX specification version information */
++ OMX_U32 nGroupPriority;            /**< Priority of the component group */
++ OMX_U32 nGroupID;                  /**< ID of the component group */
++} OMX_PRIORITYMGMTTYPE;
++
++/* Component name and Role names are limited to 128 characters including the terminating '\0'. */
++#define OMX_MAX_STRINGNAME_SIZE 128
++
++/** @ingroup comp */
++typedef struct OMX_PARAM_COMPONENTROLETYPE {
++    OMX_U32 nSize;              /**< size of the structure in bytes */
++    OMX_VERSIONTYPE nVersion;   /**< OMX specification version information */
++    OMX_U8 cRole[OMX_MAX_STRINGNAME_SIZE];  /**< name of standard component which defines component role */
++} OMX_PARAM_COMPONENTROLETYPE;
++
++/** End of Stream Buffer Flag:
++  *
++  * A component sets EOS when it has no more data to emit on a particular
++  * output port. Thus an output port shall set EOS on the last buffer it
++  * emits. A component's determination of when an output port should
++  * cease sending data is implemenation specific.
++  * @ingroup buf
++  */
++
++#define OMX_BUFFERFLAG_EOS 0x00000001
++
++/** Start Time Buffer Flag:
++ *
++ * The source of a stream (e.g. a demux component) sets the STARTTIME
++ * flag on the buffer that contains the starting timestamp for the
++ * stream. The starting timestamp corresponds to the first data that
++ * should be displayed at startup or after a seek.
++ * The first timestamp of the stream is not necessarily the start time.
++ * For instance, in the case of a seek to a particular video frame,
++ * the target frame may be an interframe. Thus the first buffer of
++ * the stream will be the intra-frame preceding the target frame and
++ * the starttime will occur with the target frame (with any other
++ * required frames required to reconstruct the target intervening).
++ *
++ * The STARTTIME flag is directly associated with the buffer's
++ * timestamp ' thus its association to buffer data and its
++ * propagation is identical to the timestamp's.
++ *
++ * When a Sync Component client receives a buffer with the
++ * STARTTIME flag it shall perform a SetConfig on its sync port
++ * using OMX_ConfigTimeClientStartTime and passing the buffer's
++ * timestamp.
++ *
++ * @ingroup buf
++ */
++
++#define OMX_BUFFERFLAG_STARTTIME 0x00000002
++
++
++
++/** Decode Only Buffer Flag:
++ *
++ * The source of a stream (e.g. a demux component) sets the DECODEONLY
++ * flag on any buffer that should shall be decoded but should not be
++ * displayed. This flag is used, for instance, when a source seeks to
++ * a target interframe that requires the decode of frames preceding the
++ * target to facilitate the target's reconstruction. In this case the
++ * source would emit the frames preceding the target downstream
++ * but mark them as decode only.
++ *
++ * The DECODEONLY is associated with buffer data and propagated in a
++ * manner identical to the buffer timestamp.
++ *
++ * A component that renders data should ignore all buffers with
++ * the DECODEONLY flag set.
++ *
++ * @ingroup buf
++ */
++
++#define OMX_BUFFERFLAG_DECODEONLY 0x00000004
++
++
++/* Data Corrupt Flag: This flag is set when the IL client believes the data in the associated buffer is corrupt
++ * @ingroup buf
++ */
++
++#define OMX_BUFFERFLAG_DATACORRUPT 0x00000008
++
++/* End of Frame: The buffer contains exactly one end of frame and no data
++ *  occurs after the end of frame. This flag is an optional hint. The absence
++ *  of this flag does not imply the absence of an end of frame within the buffer.
++ * @ingroup buf
++*/
++#define OMX_BUFFERFLAG_ENDOFFRAME 0x00000010
++
++/* Sync Frame Flag: This flag is set when the buffer content contains a coded sync frame '
++ *  a frame that has no dependency on any other frame information
++ *  @ingroup buf
++ */
++#define OMX_BUFFERFLAG_SYNCFRAME 0x00000020
++
++/* Extra data present flag: there is extra data appended to the data stream
++ * residing in the buffer
++ * @ingroup buf
++ */
++#define OMX_BUFFERFLAG_EXTRADATA 0x00000040
++
++/** Codec Config Buffer Flag:
++* OMX_BUFFERFLAG_CODECCONFIG is an optional flag that is set by an
++* output port when all bytes in the buffer form part or all of a set of
++* codec specific configuration data.  Examples include SPS/PPS nal units
++* for OMX_VIDEO_CodingAVC or AudioSpecificConfig data for
++* OMX_AUDIO_CodingAAC.  Any component that for a given stream sets
++* OMX_BUFFERFLAG_CODECCONFIG shall not mix codec configuration bytes
++* with frame data in the same buffer, and shall send all buffers
++* containing codec configuration bytes before any buffers containing
++* frame data that those configurations bytes describe.
++* If the stream format for a particular codec has a frame specific
++* header at the start of each frame, for example OMX_AUDIO_CodingMP3 or
++* OMX_AUDIO_CodingAAC in ADTS mode, then these shall be presented as
++* normal without setting OMX_BUFFERFLAG_CODECCONFIG.
++ * @ingroup buf
++ */
++#define OMX_BUFFERFLAG_CODECCONFIG 0x00000080
++
++
++
++/** @ingroup buf */
++typedef struct OMX_BUFFERHEADERTYPE
++{
++    OMX_U32 nSize;              /**< size of the structure in bytes */
++    OMX_VERSIONTYPE nVersion;   /**< OMX specification version information */
++    OMX_U8* pBuffer;            /**< Pointer to actual block of memory
++                                     that is acting as the buffer */
++    OMX_U32 nAllocLen;          /**< size of the buffer allocated, in bytes */
++    OMX_U32 nFilledLen;         /**< number of bytes currently in the
++                                     buffer */
++    OMX_U32 nOffset;            /**< start offset of valid data in bytes from
++                                     the start of the buffer */
++    OMX_PTR pAppPrivate;        /**< pointer to any data the application
++                                     wants to associate with this buffer */
++    OMX_PTR pPlatformPrivate;   /**< pointer to any data the platform
++                                     wants to associate with this buffer */
++    OMX_PTR pInputPortPrivate;  /**< pointer to any data the input port
++                                     wants to associate with this buffer */
++    OMX_PTR pOutputPortPrivate; /**< pointer to any data the output port
++                                     wants to associate with this buffer */
++    OMX_HANDLETYPE hMarkTargetComponent; /**< The component that will generate a
++                                              mark event upon processing this buffer. */
++    OMX_PTR pMarkData;          /**< Application specific data associated with
++                                     the mark sent on a mark event to disambiguate
++                                     this mark from others. */
++    OMX_U32 nTickCount;         /**< Optional entry that the component and
++                                     application can update with a tick count
++                                     when they access the component.  This
++                                     value should be in microseconds.  Since
++                                     this is a value relative to an arbitrary
++                                     starting point, this value cannot be used
++                                     to determine absolute time.  This is an
++                                     optional entry and not all components
++                                     will update it.*/
++ OMX_TICKS nTimeStamp;          /**< Timestamp corresponding to the sample
++                                     starting@the first logical sample
++                                     boundary in the buffer. Timestamps of
++                                     successive samples within the buffer may
++                                     be inferred by adding the duration of the
++                                     of the preceding buffer to the timestamp
++                                     of the preceding buffer.*/
++  OMX_U32     nFlags;           /**< buffer specific flags */
++  OMX_U32 nOutputPortIndex;     /**< The index of the output port (if any) using
++                                     this buffer */
++  OMX_U32 nInputPortIndex;      /**< The index of the input port (if any) using
++                                     this buffer */
++} OMX_BUFFERHEADERTYPE;
++
++/** The OMX_EXTRADATATYPE enumeration is used to define the
++ * possible extra data payload types.
++ * NB: this enum is binary backwards compatible with the previous
++ * OMX_EXTRADATA_QUANT define.  This should be replaced with
++ * OMX_ExtraDataQuantization.
++ */
++typedef enum OMX_EXTRADATATYPE
++{
++   OMX_ExtraDataNone = 0,                       /**< Indicates that no more extra data sections follow */
++   OMX_ExtraDataQuantization,                   /**< The data payload contains quantization data */
++   OMX_ExtraDataKhronosExtensions = 0x6F000000, /**< Reserved region for introducing Khronos Standard Extensions */
++   OMX_ExtraDataVendorStartUnused = 0x7F000000, /**< Reserved region for introducing Vendor Extensions */
++   OMX_ExtraDataMax = 0x7FFFFFFF
++} OMX_EXTRADATATYPE;
++
++
++typedef struct OMX_OTHER_EXTRADATATYPE  {
++    OMX_U32 nSize;
++    OMX_VERSIONTYPE nVersion;
++    OMX_U32 nPortIndex;
++    OMX_EXTRADATATYPE eType;       /* Extra Data type */
++    OMX_U32 nDataSize;   /* Size of the supporting data to follow */
++    OMX_U8  data[1];     /* Supporting data hint  */
++} OMX_OTHER_EXTRADATATYPE;
++
++/** @ingroup comp */
++typedef struct OMX_PORT_PARAM_TYPE {
++    OMX_U32 nSize;              /**< size of the structure in bytes */
++    OMX_VERSIONTYPE nVersion;   /**< OMX specification version information */
++    OMX_U32 nPorts;             /**< The number of ports for this component */
++    OMX_U32 nStartPortNumber;   /** first port number for this type of port */
++} OMX_PORT_PARAM_TYPE;
++
++/** @ingroup comp */
++typedef enum OMX_EVENTTYPE
++{
++    OMX_EventCmdComplete,         /**< component has sucessfully completed a command */
++    OMX_EventError,               /**< component has detected an error condition */
++    OMX_EventMark,                /**< component has detected a buffer mark */
++    OMX_EventPortSettingsChanged, /**< component is reported a port settings change */
++    OMX_EventBufferFlag,          /**< component has detected an EOS */
++    OMX_EventResourcesAcquired,   /**< component has been granted resources and is
++                                       automatically starting the state change from
++                                       OMX_StateWaitForResources to OMX_StateIdle. */
++   OMX_EventComponentResumed,     /**< Component resumed due to reacquisition of resources */
++   OMX_EventDynamicResourcesAvailable, /**< Component has acquired previously unavailable dynamic resources */
++   OMX_EventPortFormatDetected,      /**< Component has detected a supported format. */
++   OMX_EventKhronosExtensions = 0x6F000000, /**< Reserved region for introducing Khronos Standard Extensions */
++   OMX_EventVendorStartUnused = 0x7F000000, /**< Reserved region for introducing Vendor Extensions */
++   OMX_EventMax = 0x7FFFFFFF
++} OMX_EVENTTYPE;
++
++typedef struct OMX_CALLBACKTYPE
++{
++    /** The EventHandler method is used to notify the application when an
++        event of interest occurs.  Events are defined in the OMX_EVENTTYPE
++        enumeration.  Please see that enumeration for details of what will
++        be returned for each type of event. Callbacks should not return
++        an error to the component, so if an error occurs, the application
++        shall handle it internally.  This is a blocking call.
++
++        The application should return from this call within 5 msec to avoid
++        blocking the component for an excessively long period of time.
++
++        @param hComponent
++            handle of the component to access.  This is the component
++            handle returned by the call to the GetHandle function.
++        @param pAppData
++            pointer to an application defined value that was provided in the
++            pAppData parameter to the OMX_GetHandle method for the component.
++            This application defined value is provided so that the application
++            can have a component specific context when receiving the callback.
++        @param eEvent
++            Event that the component wants to notify the application about.
++        @param nData1
++            nData will be the OMX_ERRORTYPE for an error event and will be
++            an OMX_COMMANDTYPE for a command complete event and OMX_INDEXTYPE for a OMX_PortSettingsChanged event.
++         @param nData2
++            nData2 will hold further information related to the event. Can be OMX_STATETYPE for
++            a OMX_CommandStateSet command or port index for a OMX_PortSettingsChanged event.
++            Default value is 0 if not used. )
++        @param pEventData
++            Pointer to additional event-specific data (see spec for meaning).
++      */
++
++   OMX_ERRORTYPE (*EventHandler)(
++        OMX_IN OMX_HANDLETYPE hComponent,
++        OMX_IN OMX_PTR pAppData,
++        OMX_IN OMX_EVENTTYPE eEvent,
++        OMX_IN OMX_U32 nData1,
++        OMX_IN OMX_U32 nData2,
++        OMX_IN OMX_PTR pEventData);
++
++    /** The EmptyBufferDone method is used to return emptied buffers from an
++        input port back to the application for reuse.  This is a blocking call
++        so the application should not attempt to refill the buffers during this
++        call, but should queue them and refill them in another thread.  There
++        is no error return, so the application shall handle any errors generated
++        internally.
++
++        The application should return from this call within 5 msec.
++
++        @param hComponent
++            handle of the component to access.  This is the component
++            handle returned by the call to the GetHandle function.
++        @param pAppData
++            pointer to an application defined value that was provided in the
++            pAppData parameter to the OMX_GetHandle method for the component.
++            This application defined value is provided so that the application
++            can have a component specific context when receiving the callback.
++        @param pBuffer
++            pointer to an OMX_BUFFERHEADERTYPE structure allocated with UseBuffer
++            or AllocateBuffer indicating the buffer that was emptied.
++        @ingroup buf
++     */
++    OMX_ERRORTYPE (*EmptyBufferDone)(
++        OMX_IN OMX_HANDLETYPE hComponent,
++        OMX_IN OMX_PTR pAppData,
++        OMX_IN OMX_BUFFERHEADERTYPE* pBuffer);
++
++    /** The FillBufferDone method is used to return filled buffers from an
++        output port back to the application for emptying and then reuse.
++        This is a blocking call so the application should not attempt to
++        empty the buffers during this call, but should queue the buffers
++        and empty them in another thread.  There is no error return, so
++        the application shall handle any errors generated internally.  The
++        application shall also update the buffer header to indicate the
++        number of bytes placed into the buffer.
++
++        The application should return from this call within 5 msec.
++
++        @param hComponent
++            handle of the component to access.  This is the component
++            handle returned by the call to the GetHandle function.
++        @param pAppData
++            pointer to an application defined value that was provided in the
++            pAppData parameter to the OMX_GetHandle method for the component.
++            This application defined value is provided so that the application
++            can have a component specific context when receiving the callback.
++        @param pBuffer
++            pointer to an OMX_BUFFERHEADERTYPE structure allocated with UseBuffer
++            or AllocateBuffer indicating the buffer that was filled.
++        @ingroup buf
++     */
++    OMX_ERRORTYPE (*FillBufferDone)(
++        OMX_OUT OMX_HANDLETYPE hComponent,
++        OMX_OUT OMX_PTR pAppData,
++        OMX_OUT OMX_BUFFERHEADERTYPE* pBuffer);
++
++} OMX_CALLBACKTYPE;
++
++/** The OMX_BUFFERSUPPLIERTYPE enumeration is used to dictate port supplier
++    preference when tunneling between two ports.
++    @ingroup tun buf
++*/
++typedef enum OMX_BUFFERSUPPLIERTYPE
++{
++    OMX_BufferSupplyUnspecified = 0x0, /**< port supplying the buffers is unspecified,
++                                              or don't care */
++    OMX_BufferSupplyInput,             /**< input port supplies the buffers */
++    OMX_BufferSupplyOutput,            /**< output port supplies the buffers */
++    OMX_BufferSupplyKhronosExtensions = 0x6F000000, /**< Reserved region for introducing Khronos Standard Extensions */
++    OMX_BufferSupplyVendorStartUnused = 0x7F000000, /**< Reserved region for introducing Vendor Extensions */
++    OMX_BufferSupplyMax = 0x7FFFFFFF
++} OMX_BUFFERSUPPLIERTYPE;
++
++
++/** buffer supplier parameter
++ * @ingroup tun
++ */
++typedef struct OMX_PARAM_BUFFERSUPPLIERTYPE {
++    OMX_U32 nSize; /**< size of the structure in bytes */
++    OMX_VERSIONTYPE nVersion; /**< OMX specification version information */
++    OMX_U32 nPortIndex; /**< port that this structure applies to */
++    OMX_BUFFERSUPPLIERTYPE eBufferSupplier; /**< buffer supplier */
++} OMX_PARAM_BUFFERSUPPLIERTYPE;
++
++
++/**< indicates that buffers received by an input port of a tunnel
++     may not modify the data in the buffers
++     @ingroup tun
++ */
++#define OMX_PORTTUNNELFLAG_READONLY 0x00000001
++
++
++/** The OMX_TUNNELSETUPTYPE structure is used to pass data from an output
++    port to an input port as part the two ComponentTunnelRequest calls
++    resulting from a OMX_SetupTunnel call from the IL Client.
++    @ingroup tun
++ */
++typedef struct OMX_TUNNELSETUPTYPE
++{
++    OMX_U32 nTunnelFlags;             /**< bit flags for tunneling */
++    OMX_BUFFERSUPPLIERTYPE eSupplier; /**< supplier preference */
++} OMX_TUNNELSETUPTYPE;
++
++/* OMX Component headers is included to enable the core to use
++   macros for functions into the component for OMX release 1.0.
++   Developers should not access any structures or data from within
++   the component header directly */
++/* TO BE REMOVED - #include <OMX_Component.h> */
++
++/** GetComponentVersion will return information about the component.
++    This is a blocking call.  This macro will go directly from the
++    application to the component (via a core macro).  The
++    component will return from this call within 5 msec.
++    @param [in] hComponent
++        handle of component to execute the command
++    @param [out] pComponentName
++        pointer to an empty string of length 128 bytes.  The component
++        will write its name into this string.  The name will be
++        terminated by a single zero byte.  The name of a component will
++        be 127 bytes or less to leave room for the trailing zero byte.
++        An example of a valid component name is "OMX.ABC.ChannelMixer\0".
++    @param [out] pComponentVersion
++        pointer to an OMX Version structure that the component will fill
++        in.  The component will fill in a value that indicates the
++        component version.  NOTE: the component version is NOT the same
++        as the OMX Specification version (found in all structures).  The
++        component version is defined by the vendor of the component and
++        its value is entirely up to the component vendor.
++    @param [out] pSpecVersion
++        pointer to an OMX Version structure that the component will fill
++        in.  The SpecVersion is the version of the specification that the
++        component was built against.  Please note that this value may or
++        may not match the structure's version.  For example, if the
++        component was built against the 2.0 specification, but the
++        application (which creates the structure is built against the
++        1.0 specification the versions would be different.
++    @param [out] pComponentUUID
++        pointer to the UUID of the component which will be filled in by
++        the component.  The UUID is a unique identifier that is set at
++        RUN time for the component and is unique to each instantion of
++        the component.
++    @return OMX_ERRORTYPE
++        If the command successfully executes, the return code will be
++        OMX_ErrorNone.  Otherwise the appropriate OMX error will be returned.
++    @ingroup comp
++ */
++#define OMX_GetComponentVersion(                            \
++        hComponent,                                         \
++        pComponentName,                                     \
++        pComponentVersion,                                  \
++        pSpecVersion,                                       \
++        pComponentUUID)                                     \
++    ((OMX_COMPONENTTYPE*)hComponent)->GetComponentVersion(  \
++        hComponent,                                         \
++        pComponentName,                                     \
++        pComponentVersion,                                  \
++        pSpecVersion,                                       \
++        pComponentUUID)                 /* Macro End */
++
++
++/** Send a command to the component.  This call is a non-blocking call.
++    The component should check the parameters and then queue the command
++    to the component thread to be executed.  The component thread shall
++    send the EventHandler() callback at the conclusion of the command.
++    This macro will go directly from the application to the component (via
++    a core macro).  The component will return from this call within 5 msec.
++
++    When the command is "OMX_CommandStateSet" the component will queue a
++    state transition to the new state idenfied in nParam.
++
++    When the command is "OMX_CommandFlush", to flush a port's buffer queues,
++    the command will force the component to return all buffers NOT CURRENTLY
++    BEING PROCESSED to the application, in the order in which the buffers
++    were received.
++
++    When the command is "OMX_CommandPortDisable" or
++    "OMX_CommandPortEnable", the component's port (given by the value of
++    nParam) will be stopped or restarted.
++
++    When the command "OMX_CommandMarkBuffer" is used to mark a buffer, the
++    pCmdData will point to a OMX_MARKTYPE structure containing the component
++    handle of the component to examine the buffer chain for the mark.  nParam1
++    contains the index of the port on which the buffer mark is applied.
++
++    Specification text for more details.
++
++    @param [in] hComponent
++        handle of component to execute the command
++    @param [in] Cmd
++        Command for the component to execute
++    @param [in] nParam
++        Parameter for the command to be executed.  When Cmd has the value
++        OMX_CommandStateSet, value is a member of OMX_STATETYPE.  When Cmd has
++        the value OMX_CommandFlush, value of nParam indicates which port(s)
++        to flush. -1 is used to flush all ports a single port index will
++        only flush that port.  When Cmd has the value "OMX_CommandPortDisable"
++        or "OMX_CommandPortEnable", the component's port is given by
++        the value of nParam.  When Cmd has the value "OMX_CommandMarkBuffer"
++        the components pot is given by the value of nParam.
++    @param [in] pCmdData
++        Parameter pointing to the OMX_MARKTYPE structure when Cmd has the value
++        "OMX_CommandMarkBuffer".
++    @return OMX_ERRORTYPE
++        If the command successfully executes, the return code will be
++        OMX_ErrorNone.  Otherwise the appropriate OMX error will be returned.
++    @ingroup comp
++ */
++#define OMX_SendCommand(                                    \
++         hComponent,                                        \
++         Cmd,                                               \
++         nParam,                                            \
++         pCmdData)                                          \
++     ((OMX_COMPONENTTYPE*)hComponent)->SendCommand(         \
++         hComponent,                                        \
++         Cmd,                                               \
++         nParam,                                            \
++         pCmdData)                          /* Macro End */
++
++
++/** The OMX_GetParameter macro will get one of the current parameter
++    settings from the component.  This macro cannot only be invoked when
++    the component is in the OMX_StateInvalid state.  The nParamIndex
++    parameter is used to indicate which structure is being requested from
++    the component.  The application shall allocate the correct structure
++    and shall fill in the structure size and version information before
++    invoking this macro.  When the parameter applies to a port, the
++    caller shall fill in the appropriate nPortIndex value indicating the
++    port on which the parameter applies. If the component has not had
++    any settings changed, then the component should return a set of
++    valid DEFAULT  parameters for the component.  This is a blocking
++    call.
++
++    The component should return from this call within 20 msec.
++
++    @param [in] hComponent
++        Handle of the component to be accessed.  This is the component
++        handle returned by the call to the OMX_GetHandle function.
++    @param [in] nParamIndex
++        Index of the structure to be filled.  This value is from the
++        OMX_INDEXTYPE enumeration.
++    @param [in,out] pComponentParameterStructure
++        Pointer to application allocated structure to be filled by the
++        component.
++    @return OMX_ERRORTYPE
++        If the command successfully executes, the return code will be
++        OMX_ErrorNone.  Otherwise the appropriate OMX error will be returned.
++    @ingroup comp
++ */
++#define OMX_GetParameter(                                   \
++        hComponent,                                         \
++        nParamIndex,                                        \
++        pComponentParameterStructure)                        \
++    ((OMX_COMPONENTTYPE*)hComponent)->GetParameter(         \
++        hComponent,                                         \
++        nParamIndex,                                        \
++        pComponentParameterStructure)    /* Macro End */
++
++
++/** The OMX_SetParameter macro will send an initialization parameter
++    structure to a component.  Each structure shall be sent one at a time,
++    in a separate invocation of the macro.  This macro can only be
++    invoked when the component is in the OMX_StateLoaded state, or the
++    port is disabled (when the parameter applies to a port). The
++    nParamIndex parameter is used to indicate which structure is being
++    passed to the component.  The application shall allocate the
++    correct structure and shall fill in the structure size and version
++    information (as well as the actual data) before invoking this macro.
++    The application is free to dispose of this structure after the call
++    as the component is required to copy any data it shall retain.  This
++    is a blocking call.
++
++    The component should return from this call within 20 msec.
++
++    @param [in] hComponent
++        Handle of the component to be accessed.  This is the component
++        handle returned by the call to the OMX_GetHandle function.
++    @param [in] nIndex
++        Index of the structure to be sent.  This value is from the
++        OMX_INDEXTYPE enumeration.
++    @param [in] pComponentParameterStructure
++        pointer to application allocated structure to be used for
++        initialization by the component.
++    @return OMX_ERRORTYPE
++        If the command successfully executes, the return code will be
++        OMX_ErrorNone.  Otherwise the appropriate OMX error will be returned.
++    @ingroup comp
++ */
++#define OMX_SetParameter(                                   \
++        hComponent,                                         \
++        nParamIndex,                                        \
++        pComponentParameterStructure)                        \
++    ((OMX_COMPONENTTYPE*)hComponent)->SetParameter(         \
++        hComponent,                                         \
++        nParamIndex,                                        \
++        pComponentParameterStructure)    /* Macro End */
++
++
++/** The OMX_GetConfig macro will get one of the configuration structures
++    from a component.  This macro can be invoked anytime after the
++    component has been loaded.  The nParamIndex call parameter is used to
++    indicate which structure is being requested from the component.  The
++    application shall allocate the correct structure and shall fill in the
++    structure size and version information before invoking this macro.
++    If the component has not had this configuration parameter sent before,
++    then the component should return a set of valid DEFAULT values for the
++    component.  This is a blocking call.
++
++    The component should return from this call within 5 msec.
++
++    @param [in] hComponent
++        Handle of the component to be accessed.  This is the component
++        handle returned by the call to the OMX_GetHandle function.
++    @param [in] nIndex
++        Index of the structure to be filled.  This value is from the
++        OMX_INDEXTYPE enumeration.
++    @param [in,out] pComponentConfigStructure
++        pointer to application allocated structure to be filled by the
++        component.
++    @return OMX_ERRORTYPE
++        If the command successfully executes, the return code will be
++        OMX_ErrorNone.  Otherwise the appropriate OMX error will be returned.
++    @ingroup comp
++*/
++#define OMX_GetConfig(                                      \
++        hComponent,                                         \
++        nConfigIndex,                                       \
++        pComponentConfigStructure)                           \
++    ((OMX_COMPONENTTYPE*)hComponent)->GetConfig(            \
++        hComponent,                                         \
++        nConfigIndex,                                       \
++        pComponentConfigStructure)       /* Macro End */
++
++
++/** The OMX_SetConfig macro will send one of the configuration
++    structures to a component.  Each structure shall be sent one at a time,
++    each in a separate invocation of the macro.  This macro can be invoked
++    anytime after the component has been loaded.  The application shall
++    allocate the correct structure and shall fill in the structure size
++    and version information (as well as the actual data) before invoking
++    this macro.  The application is free to dispose of this structure after
++    the call as the component is required to copy any data it shall retain.
++    This is a blocking call.
++
++    The component should return from this call within 5 msec.
++
++    @param [in] hComponent
++        Handle of the component to be accessed.  This is the component
++        handle returned by the call to the OMX_GetHandle function.
++    @param [in] nConfigIndex
++        Index of the structure to be sent.  This value is from the
++        OMX_INDEXTYPE enumeration above.
++    @param [in] pComponentConfigStructure
++        pointer to application allocated structure to be used for
++        initialization by the component.
++    @return OMX_ERRORTYPE
++        If the command successfully executes, the return code will be
++        OMX_ErrorNone.  Otherwise the appropriate OMX error will be returned.
++    @ingroup comp
++ */
++#define OMX_SetConfig(                                      \
++        hComponent,                                         \
++        nConfigIndex,                                       \
++        pComponentConfigStructure)                           \
++    ((OMX_COMPONENTTYPE*)hComponent)->SetConfig(            \
++        hComponent,                                         \
++        nConfigIndex,                                       \
++        pComponentConfigStructure)       /* Macro End */
++
++
++/** The OMX_GetExtensionIndex macro will invoke a component to translate
++    a vendor specific configuration or parameter string into an OMX
++    structure index.  There is no requirement for the vendor to support
++    this command for the indexes already found in the OMX_INDEXTYPE
++    enumeration (this is done to save space in small components).  The
++    component shall support all vendor supplied extension indexes not found
++    in the master OMX_INDEXTYPE enumeration.  This is a blocking call.
++
++    The component should return from this call within 5 msec.
++
++    @param [in] hComponent
++        Handle of the component to be accessed.  This is the component
++        handle returned by the call to the GetHandle function.
++    @param [in] cParameterName
++        OMX_STRING that shall be less than 128 characters long including
++        the trailing null byte.  This is the string that will get
++        translated by the component into a configuration index.
++    @param [out] pIndexType
++        a pointer to a OMX_INDEXTYPE to receive the index value.
++    @return OMX_ERRORTYPE
++        If the command successfully executes, the return code will be
++        OMX_ErrorNone.  Otherwise the appropriate OMX error will be returned.
++    @ingroup comp
++ */
++#define OMX_GetExtensionIndex(                              \
++        hComponent,                                         \
++        cParameterName,                                     \
++        pIndexType)                                         \
++    ((OMX_COMPONENTTYPE*)hComponent)->GetExtensionIndex(    \
++        hComponent,                                         \
++        cParameterName,                                     \
++        pIndexType)                     /* Macro End */
++
++
++/** The OMX_GetState macro will invoke the component to get the current
++    state of the component and place the state value into the location
++    pointed to by pState.
++
++    The component should return from this call within 5 msec.
++
++    @param [in] hComponent
++        Handle of the component to be accessed.  This is the component
++        handle returned by the call to the OMX_GetHandle function.
++    @param [out] pState
++        pointer to the location to receive the state.  The value returned
++        is one of the OMX_STATETYPE members
++    @return OMX_ERRORTYPE
++        If the command successfully executes, the return code will be
++        OMX_ErrorNone.  Otherwise the appropriate OMX error will be returned.
++    @ingroup comp
++ */
++#define OMX_GetState(                                       \
++        hComponent,                                         \
++        pState)                                             \
++    ((OMX_COMPONENTTYPE*)hComponent)->GetState(             \
++        hComponent,                                         \
++        pState)                         /* Macro End */
++
++
++/** The OMX_UseBuffer macro will request that the component use
++    a buffer (and allocate its own buffer header) already allocated
++    by another component, or by the IL Client. This is a blocking
++    call.
++
++    The component should return from this call within 20 msec.
++
++    @param [in] hComponent
++        Handle of the component to be accessed.  This is the component
++        handle returned by the call to the OMX_GetHandle function.
++    @param [out] ppBuffer
++        pointer to an OMX_BUFFERHEADERTYPE structure used to receive the
++        pointer to the buffer header
++    @return OMX_ERRORTYPE
++        If the command successfully executes, the return code will be
++        OMX_ErrorNone.  Otherwise the appropriate OMX error will be returned.
++    @ingroup comp buf
++ */
++
++#define OMX_UseBuffer(                                      \
++           hComponent,                                      \
++           ppBufferHdr,                                     \
++           nPortIndex,                                      \
++           pAppPrivate,                                     \
++           nSizeBytes,                                      \
++           pBuffer)                                         \
++    ((OMX_COMPONENTTYPE*)hComponent)->UseBuffer(            \
++           hComponent,                                      \
++           ppBufferHdr,                                     \
++           nPortIndex,                                      \
++           pAppPrivate,                                     \
++           nSizeBytes,                                      \
++           pBuffer)
++
++
++/** The OMX_AllocateBuffer macro will request that the component allocate
++    a new buffer and buffer header.  The component will allocate the
++    buffer and the buffer header and return a pointer to the buffer
++    header.  This is a blocking call.
++
++    The component should return from this call within 5 msec.
++
++    @param [in] hComponent
++        Handle of the component to be accessed.  This is the component
++        handle returned by the call to the OMX_GetHandle function.
++    @param [out] ppBuffer
++        pointer to an OMX_BUFFERHEADERTYPE structure used to receive
++        the pointer to the buffer header
++    @param [in] nPortIndex
++        nPortIndex is used to select the port on the component the buffer will
++        be used with.  The port can be found by using the nPortIndex
++        value as an index into the Port Definition array of the component.
++    @param [in] pAppPrivate
++        pAppPrivate is used to initialize the pAppPrivate member of the
++        buffer header structure.
++    @param [in] nSizeBytes
++        size of the buffer to allocate.  Used when bAllocateNew is true.
++    @return OMX_ERRORTYPE
++        If the command successfully executes, the return code will be
++        OMX_ErrorNone.  Otherwise the appropriate OMX error will be returned.
++    @ingroup comp buf
++ */
++#define OMX_AllocateBuffer(                                 \
++        hComponent,                                         \
++        ppBuffer,                                           \
++        nPortIndex,                                         \
++        pAppPrivate,                                        \
++        nSizeBytes)                                         \
++    ((OMX_COMPONENTTYPE*)hComponent)->AllocateBuffer(       \
++        hComponent,                                         \
++        ppBuffer,                                           \
++        nPortIndex,                                         \
++        pAppPrivate,                                        \
++        nSizeBytes)                     /* Macro End */
++
++
++/** The OMX_FreeBuffer macro will release a buffer header from the component
++    which was allocated using either OMX_AllocateBuffer or OMX_UseBuffer. If
++    the component allocated the buffer (see the OMX_UseBuffer macro) then
++    the component shall free the buffer and buffer header. This is a
++    blocking call.
++
++    The component should return from this call within 20 msec.
++
++    @param [in] hComponent
++        Handle of the component to be accessed.  This is the component
++        handle returned by the call to the OMX_GetHandle function.
++    @param [in] nPortIndex
++        nPortIndex is used to select the port on the component the buffer will
++        be used with.
++    @param [in] pBuffer
++        pointer to an OMX_BUFFERHEADERTYPE structure allocated with UseBuffer
++        or AllocateBuffer.
++    @return OMX_ERRORTYPE
++        If the command successfully executes, the return code will be
++        OMX_ErrorNone.  Otherwise the appropriate OMX error will be returned.
++    @ingroup comp buf
++ */
++#define OMX_FreeBuffer(                                     \
++        hComponent,                                         \
++        nPortIndex,                                         \
++        pBuffer)                                            \
++    ((OMX_COMPONENTTYPE*)hComponent)->FreeBuffer(           \
++        hComponent,                                         \
++        nPortIndex,                                         \
++        pBuffer)                        /* Macro End */
++
++
++/** The OMX_EmptyThisBuffer macro will send a buffer full of data to an
++    input port of a component.  The buffer will be emptied by the component
++    and returned to the application via the EmptyBufferDone call back.
++    This is a non-blocking call in that the component will record the buffer
++    and return immediately and then empty the buffer, later, at the proper
++    time.  As expected, this macro may be invoked only while the component
++    is in the OMX_StateExecuting.  If nPortIndex does not specify an input
++    port, the component shall return an error.
++
++    The component should return from this call within 5 msec.
++
++    @param [in] hComponent
++        Handle of the component to be accessed.  This is the component
++        handle returned by the call to the OMX_GetHandle function.
++    @param [in] pBuffer
++        pointer to an OMX_BUFFERHEADERTYPE structure allocated with UseBuffer
++        or AllocateBuffer.
++    @return OMX_ERRORTYPE
++        If the command successfully executes, the return code will be
++        OMX_ErrorNone.  Otherwise the appropriate OMX error will be returned.
++    @ingroup comp buf
++ */
++#define OMX_EmptyThisBuffer(                                \
++        hComponent,                                         \
++        pBuffer)                                            \
++    ((OMX_COMPONENTTYPE*)hComponent)->EmptyThisBuffer(      \
++        hComponent,                                         \
++        pBuffer)                        /* Macro End */
++
++
++/** The OMX_FillThisBuffer macro will send an empty buffer to an
++    output port of a component.  The buffer will be filled by the component
++    and returned to the application via the FillBufferDone call back.
++    This is a non-blocking call in that the component will record the buffer
++    and return immediately and then fill the buffer, later, at the proper
++    time.  As expected, this macro may be invoked only while the component
++    is in the OMX_ExecutingState.  If nPortIndex does not specify an output
++    port, the component shall return an error.
++
++    The component should return from this call within 5 msec.
++
++    @param [in] hComponent
++        Handle of the component to be accessed.  This is the component
++        handle returned by the call to the OMX_GetHandle function.
++    @param [in] pBuffer
++        pointer to an OMX_BUFFERHEADERTYPE structure allocated with UseBuffer
++        or AllocateBuffer.
++    @return OMX_ERRORTYPE
++        If the command successfully executes, the return code will be
++        OMX_ErrorNone.  Otherwise the appropriate OMX error will be returned.
++    @ingroup comp buf
++ */
++#define OMX_FillThisBuffer(                                 \
++        hComponent,                                         \
++        pBuffer)                                            \
++    ((OMX_COMPONENTTYPE*)hComponent)->FillThisBuffer(       \
++        hComponent,                                         \
++        pBuffer)                        /* Macro End */
++
++
++
++/** The OMX_UseEGLImage macro will request that the component use
++    a EGLImage provided by EGL (and allocate its own buffer header)
++    This is a blocking call.
++
++    The component should return from this call within 20 msec.
++
++    @param [in] hComponent
++        Handle of the component to be accessed.  This is the component
++        handle returned by the call to the OMX_GetHandle function.
++    @param [out] ppBuffer
++        pointer to an OMX_BUFFERHEADERTYPE structure used to receive the
++        pointer to the buffer header.  Note that the memory location used
++        for this buffer is NOT visible to the IL Client.
++    @param [in] nPortIndex
++        nPortIndex is used to select the port on the component the buffer will
++        be used with.  The port can be found by using the nPortIndex
++        value as an index into the Port Definition array of the component.
++    @param [in] pAppPrivate
++        pAppPrivate is used to initialize the pAppPrivate member of the
++        buffer header structure.
++    @param [in] eglImage
++        eglImage contains the handle of the EGLImage to use as a buffer on the
++        specified port.  The component is expected to validate properties of
++        the EGLImage against the configuration of the port to ensure the component
++        can use the EGLImage as a buffer.
++    @return OMX_ERRORTYPE
++        If the command successfully executes, the return code will be
++        OMX_ErrorNone.  Otherwise the appropriate OMX error will be returned.
++    @ingroup comp buf
++ */
++#define OMX_UseEGLImage(                                    \
++           hComponent,                                      \
++           ppBufferHdr,                                     \
++           nPortIndex,                                      \
++           pAppPrivate,                                     \
++           eglImage)                                        \
++    ((OMX_COMPONENTTYPE*)hComponent)->UseEGLImage(          \
++           hComponent,                                      \
++           ppBufferHdr,                                     \
++           nPortIndex,                                      \
++           pAppPrivate,                                     \
++           eglImage)
++
++/** The OMX_Init method is used to initialize the OMX core.  It shall be the
++    first call made into OMX and it should only be executed one time without
++    an interviening OMX_Deinit call.
++
++    The core should return from this call within 20 msec.
++
++    @return OMX_ERRORTYPE
++        If the command successfully executes, the return code will be
++        OMX_ErrorNone.  Otherwise the appropriate OMX error will be returned.
++    @ingroup core
++ */
++OMX_API OMX_ERRORTYPE OMX_APIENTRY OMX_Init(void);
++
++
++/** The OMX_Deinit method is used to deinitialize the OMX core.  It shall be
++    the last call made into OMX. In the event that the core determines that
++    thare are components loaded when this call is made, the core may return
++    with an error rather than try to unload the components.
++
++    The core should return from this call within 20 msec.
++
++    @return OMX_ERRORTYPE
++        If the command successfully executes, the return code will be
++        OMX_ErrorNone.  Otherwise the appropriate OMX error will be returned.
++    @ingroup core
++ */
++OMX_API OMX_ERRORTYPE OMX_APIENTRY OMX_Deinit(void);
++
++
++/** The OMX_ComponentNameEnum method will enumerate through all the names of
++    recognised valid components in the system. This function is provided
++    as a means to detect all the components in the system run-time. There is
++    no strict ordering to the enumeration order of component names, although
++    each name will only be enumerated once.  If the OMX core supports run-time
++    installation of new components, it is only requried to detect newly
++    installed components when the first call to enumerate component names
++    is made (i.e. when nIndex is 0x0).
++
++    The core should return from this call in 20 msec.
++
++    @param [out] cComponentName
++        pointer to a null terminated string with the component name.  The
++        names of the components are strings less than 127 bytes in length
++        plus the trailing null for a maximum size of 128 bytes.  An example
++        of a valid component name is "OMX.TI.AUDIO.DSP.MIXER\0".  Names are
++        assigned by the vendor, but shall start with "OMX." and then have
++        the Vendor designation next.
++    @param [in] nNameLength
++        number of characters in the cComponentName string.  With all
++        component name strings restricted to less than 128 characters
++        (including the trailing null) it is recomended that the caller
++        provide a input string for the cComponentName of 128 characters.
++    @param [in] nIndex
++        number containing the enumeration index for the component.
++        Multiple calls to OMX_ComponentNameEnum with increasing values
++        of nIndex will enumerate through the component names in the
++        system until OMX_ErrorNoMore is returned.  The value of nIndex
++        is 0 to (N-1), where N is the number of valid installed components
++        in the system.
++    @return OMX_ERRORTYPE
++        If the command successfully executes, the return code will be
++        OMX_ErrorNone.  When the value of nIndex exceeds the number of
++        components in the system minus 1, OMX_ErrorNoMore will be
++        returned. Otherwise the appropriate OMX error will be returned.
++    @ingroup core
++ */
++OMX_API OMX_ERRORTYPE OMX_APIENTRY OMX_ComponentNameEnum(
++    OMX_OUT OMX_STRING cComponentName,
++    OMX_IN  OMX_U32 nNameLength,
++    OMX_IN  OMX_U32 nIndex);
++
++
++/** The OMX_GetHandle method will locate the component specified by the
++    component name given, load that component into memory and then invoke
++    the component's methods to create an instance of the component.
++
++    The core should return from this call within 20 msec.
++
++    @param [out] pHandle
++        pointer to an OMX_HANDLETYPE pointer to be filled in by this method.
++    @param [in] cComponentName
++        pointer to a null terminated string with the component name.  The
++        names of the components are strings less than 127 bytes in length
++        plus the trailing null for a maximum size of 128 bytes.  An example
++        of a valid component name is "OMX.TI.AUDIO.DSP.MIXER\0".  Names are
++        assigned by the vendor, but shall start with "OMX." and then have
++        the Vendor designation next.
++    @param [in] pAppData
++        pointer to an application defined value that will be returned
++        during callbacks so that the application can identify the source
++        of the callback.
++    @param [in] pCallBacks
++        pointer to a OMX_CALLBACKTYPE structure that will be passed to the
++        component to initialize it with.
++    @return OMX_ERRORTYPE
++        If the command successfully executes, the return code will be
++        OMX_ErrorNone.  Otherwise the appropriate OMX error will be returned.
++    @ingroup core
++ */
++OMX_API OMX_ERRORTYPE OMX_APIENTRY OMX_GetHandle(
++    OMX_OUT OMX_HANDLETYPE* pHandle,
++    OMX_IN  OMX_STRING cComponentName,
++    OMX_IN  OMX_PTR pAppData,
++    OMX_IN  OMX_CALLBACKTYPE* pCallBacks);
++
++
++/** The OMX_FreeHandle method will free a handle allocated by the OMX_GetHandle
++    method.  If the component reference count goes to zero, the component will
++    be unloaded from memory.
++
++    The core should return from this call within 20 msec when the component is
++    in the OMX_StateLoaded state.
++
++    @param [in] hComponent
++        Handle of the component to be accessed.  This is the component
++        handle returned by the call to the GetHandle function.
++    @return OMX_ERRORTYPE
++        If the command successfully executes, the return code will be
++        OMX_ErrorNone.  Otherwise the appropriate OMX error will be returned.
++    @ingroup core
++ */
++OMX_API OMX_ERRORTYPE OMX_APIENTRY OMX_FreeHandle(
++    OMX_IN  OMX_HANDLETYPE hComponent);
++
++
++
++/** The OMX_SetupTunnel method will handle the necessary calls to the components
++    to setup the specified tunnel the two components.  NOTE: This is
++    an actual method (not a #define macro).  This method will make calls into
++    the component ComponentTunnelRequest method to do the actual tunnel
++    connection.
++
++    The ComponentTunnelRequest method on both components will be called.
++    This method shall not be called unless the component is in the
++    OMX_StateLoaded state except when the ports used for the tunnel are
++    disabled. In this case, the component may be in the OMX_StateExecuting,
++    OMX_StatePause, or OMX_StateIdle states.
++
++    The core should return from this call within 20 msec.
++
++    @param [in] hOutput
++        Handle of the component to be accessed.  Also this is the handle
++        of the component whose port, specified in the nPortOutput parameter
++        will be used the source for the tunnel. This is the component handle
++        returned by the call to the OMX_GetHandle function.  There is a
++        requirement that hOutput be the source for the data when
++        tunelling (i.e. nPortOutput is an output port).  If 0x0, the component
++        specified in hInput will have it's port specified in nPortInput
++        setup for communication with the application / IL client.
++    @param [in] nPortOutput
++        nPortOutput is used to select the source port on component to be
++        used in the tunnel.
++    @param [in] hInput
++        This is the component to setup the tunnel with. This is the handle
++        of the component whose port, specified in the nPortInput parameter
++        will be used the destination for the tunnel. This is the component handle
++        returned by the call to the OMX_GetHandle function.  There is a
++        requirement that hInput be the destination for the data when
++        tunelling (i.e. nPortInut is an input port).   If 0x0, the component
++        specified in hOutput will have it's port specified in nPortPOutput
++        setup for communication with the application / IL client.
++    @param [in] nPortInput
++        nPortInput is used to select the destination port on component to be
++        used in the tunnel.
++    @return OMX_ERRORTYPE
++        If the command successfully executes, the return code will be
++        OMX_ErrorNone.  Otherwise the appropriate OMX error will be returned.
++        When OMX_ErrorNotImplemented is returned, one or both components is
++        a non-interop component and does not support tunneling.
++
++        On failure, the ports of both components are setup for communication
++        with the application / IL Client.
++    @ingroup core tun
++ */
++OMX_API OMX_ERRORTYPE OMX_APIENTRY OMX_SetupTunnel(
++    OMX_IN  OMX_HANDLETYPE hOutput,
++    OMX_IN  OMX_U32 nPortOutput,
++    OMX_IN  OMX_HANDLETYPE hInput,
++    OMX_IN  OMX_U32 nPortInput);
++
++/** @ingroup cp */
++OMX_API OMX_ERRORTYPE   OMX_GetContentPipe(
++    OMX_OUT OMX_HANDLETYPE *hPipe,
++    OMX_IN OMX_STRING szURI);
++
++/** The OMX_GetComponentsOfRole method will return the number of components that support the given
++    role and (if the compNames field is non-NULL) the names of those components. The call will fail if
++    an insufficiently sized array of names is supplied. To ensure the array is sufficiently sized the
++    client should:
++        * first call this function with the compNames field NULL to determine the number of component names
++        * second call this function with the compNames field pointing to an array of names allocated
++          according to the number returned by the first call.
++
++    The core should return from this call within 5 msec.
++
++    @param [in] role
++        This is generic standard component name consisting only of component class
++        name and the type within that class (e.g. 'audio_decoder.aac').
++    @param [inout] pNumComps
++        This is used both as input and output.
++
++        If compNames is NULL, the input is ignored and the output specifies how many components support
++        the given role.
++
++        If compNames is not NULL, on input it bounds the size of the input structure and
++        on output, it specifies the number of components string names listed within the compNames parameter.
++    @param [inout] compNames
++        If NULL this field is ignored. If non-NULL this points to an array of 128-byte strings which accepts
++        a list of the names of all physical components that implement the specified standard component name.
++        Each name is NULL terminated. numComps indicates the number of names.
++    @ingroup core
++ */
++OMX_API OMX_ERRORTYPE OMX_GetComponentsOfRole (
++	OMX_IN      OMX_STRING role,
++    OMX_INOUT   OMX_U32 *pNumComps,
++    OMX_INOUT   OMX_U8  **compNames);
++
++/** The OMX_GetRolesOfComponent method will return the number of roles supported by the given
++    component and (if the roles field is non-NULL) the names of those roles. The call will fail if
++    an insufficiently sized array of names is supplied. To ensure the array is sufficiently sized the
++    client should:
++        * first call this function with the roles field NULL to determine the number of role names
++        * second call this function with the roles field pointing to an array of names allocated
++          according to the number returned by the first call.
++
++    The core should return from this call within 5 msec.
++
++    @param [in] compName
++        This is the name of the component being queried about.
++    @param [inout] pNumRoles
++        This is used both as input and output.
++
++        If roles is NULL, the input is ignored and the output specifies how many roles the component supports.
++
++        If compNames is not NULL, on input it bounds the size of the input structure and
++        on output, it specifies the number of roles string names listed within the roles parameter.
++    @param [out] roles
++        If NULL this field is ignored. If non-NULL this points to an array of 128-byte strings
++        which accepts a list of the names of all standard components roles implemented on the
++        specified component name. numComps indicates the number of names.
++    @ingroup core
++ */
++OMX_API OMX_ERRORTYPE OMX_GetRolesOfComponent (
++	OMX_IN      OMX_STRING compName,
++    OMX_INOUT   OMX_U32 *pNumRoles,
++    OMX_OUT     OMX_U8 **roles);
++
++#ifdef __cplusplus
++}
++#endif /* __cplusplus */
++
++#endif
++/* File EOF */
++
+diff -rupN a/usr/include/OpenMAX/il/OMX_ImageExt.h b/usr/include/OpenMAX/il/OMX_ImageExt.h
+--- a/usr/include/OpenMAX/il/OMX_ImageExt.h	1970-01-01 01:00:00.000000000 +0100
++++ b/usr/include/OpenMAX/il/OMX_ImageExt.h	2011-08-09 12:28:16.000000000 +0200
+@@ -0,0 +1,55 @@
++/*
++ * Copyright (c) 2011 The Khronos Group Inc.
++ *
++ * Permission is hereby granted, free of charge, to any person obtaining
++ * a copy of this software and associated documentation files (the
++ * "Software"), to deal in the Software without restriction, including
++ * without limitation the rights to use, copy, modify, merge, publish,
++ * distribute, sublicense, and/or sell copies of the Software, and to
++ * permit persons to whom the Software is furnished to do so, subject
++ * to the following conditions:
++ * The above copyright notice and this permission notice shall be included
++ * in all copies or substantial portions of the Software.
++ *
++ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS
++ * OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
++ * MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
++ * IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
++ * CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
++ * TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
++ * SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
++ *
++ */
++
++/** OMX_ImageExt.h - OpenMax IL version 1.1.2
++ * The OMX_ImageExt header file contains extensions to the
++ * definitions used by both the application and the component to
++ * access image items.
++ */
++
++#ifndef OMX_ImageExt_h
++#define OMX_ImageExt_h
++
++#ifdef __cplusplus
++extern "C" {
++#endif /* __cplusplus */
++
++/* Each OMX header shall include all required header files to allow the
++ * header to compile without errors.  The includes below are required
++ * for this header file to compile successfully
++ */
++#include <OMX_Core.h>
++
++/** Enum for standard image codingtype extensions */
++typedef enum OMX_IMAGE_CODINGEXTTYPE {
++    OMX_IMAGE_CodingExtUnused = OMX_IMAGE_CodingKhronosExtensions,
++    OMX_IMAGE_CodingWEBP,         /**< WebP image format */
++} OMX_IMAGE_CODINGEXTTYPE;
++
++
++#ifdef __cplusplus
++}
++#endif /* __cplusplus */
++
++#endif /* OMX_ImageExt_h */
++/* File EOF */
+diff -rupN a/usr/include/OpenMAX/il/OMX_Image.h b/usr/include/OpenMAX/il/OMX_Image.h
+--- a/usr/include/OpenMAX/il/OMX_Image.h	1970-01-01 01:00:00.000000000 +0100
++++ b/usr/include/OpenMAX/il/OMX_Image.h	2011-08-16 11:38:40.000000000 +0200
+@@ -0,0 +1,328 @@
++/**
++ * Copyright (c) 2008 The Khronos Group Inc.
++ *
++ * Permission is hereby granted, free of charge, to any person obtaining
++ * a copy of this software and associated documentation files (the
++ * "Software"), to deal in the Software without restriction, including
++ * without limitation the rights to use, copy, modify, merge, publish,
++ * distribute, sublicense, and/or sell copies of the Software, and to
++ * permit persons to whom the Software is furnished to do so, subject
++ * to the following conditions:
++ * The above copyright notice and this permission notice shall be included
++ * in all copies or substantial portions of the Software.
++ *
++ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS
++ * OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
++ * MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
++ * IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
++ * CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
++ * TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
++ * SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
++ */
++
++/**
++ * @file OMX_Image.h - OpenMax IL version 1.1.2
++ * The structures needed by Image components to exchange parameters and
++ * configuration data with the components.
++ */
++#ifndef OMX_Image_h
++#define OMX_Image_h
++
++#ifdef __cplusplus
++extern "C" {
++#endif /* __cplusplus */
++
++
++/**
++ * Each OMX header must include all required header files to allow the
++ * header to compile without errors.  The includes below are required
++ * for this header file to compile successfully
++ */
++
++#include <OMX_IVCommon.h>
++
++/** @defgroup imaging OpenMAX IL Imaging Domain
++ * @ingroup iv
++ * Structures for OpenMAX IL Imaging domain
++ * @{
++ */
++
++/**
++ * Enumeration used to define the possible image compression coding.
++ */
++typedef enum OMX_IMAGE_CODINGTYPE {
++    OMX_IMAGE_CodingUnused,      /**< Value when format is N/A */
++    OMX_IMAGE_CodingAutoDetect,  /**< Auto detection of image format */
++    OMX_IMAGE_CodingJPEG,        /**< JPEG/JFIF image format */
++    OMX_IMAGE_CodingJPEG2K,      /**< JPEG 2000 image format */
++    OMX_IMAGE_CodingEXIF,        /**< EXIF image format */
++    OMX_IMAGE_CodingTIFF,        /**< TIFF image format */
++    OMX_IMAGE_CodingGIF,         /**< Graphics image format */
++    OMX_IMAGE_CodingPNG,         /**< PNG image format */
++    OMX_IMAGE_CodingLZW,         /**< LZW image format */
++    OMX_IMAGE_CodingBMP,         /**< Windows Bitmap format */
++    OMX_IMAGE_CodingKhronosExtensions = 0x6F000000, /**< Reserved region for introducing Khronos Standard Extensions */
++    OMX_IMAGE_CodingVendorStartUnused = 0x7F000000, /**< Reserved region for introducing Vendor Extensions */
++    OMX_IMAGE_CodingMax = 0x7FFFFFFF
++} OMX_IMAGE_CODINGTYPE;
++
++
++/**
++ * Data structure used to define an image path. The number of image paths
++ * for input and output will vary by type of the image component.
++ *
++ *  Input (aka Source) : Zero Inputs, one Output,
++ *  Splitter           : One Input, 2 or more Outputs,
++ *  Processing Element : One Input, one output,
++ *  Mixer              : 2 or more inputs, one output,
++ *  Output (aka Sink)  : One Input, zero outputs.
++ *
++ * The PortDefinition structure is used to define all of the parameters
++ * necessary for the compliant component to setup an input or an output
++ * image path.  If additional vendor specific data is required, it should
++ * be transmitted to the component using the CustomCommand function.
++ * Compliant components will prepopulate this structure with optimal
++ * values during the OMX_GetParameter() command.
++ *
++ * STRUCT MEMBERS:
++ *  cMIMEType             : MIME type of data for the port
++ *  pNativeRender         : Platform specific reference for a display if a
++ *                          sync, otherwise this field is 0
++ *  nFrameWidth           : Width of frame to be used on port if
++ *                          uncompressed format is used.  Use 0 for
++ *                          unknown, don't care or variable
++ *  nFrameHeight          : Height of frame to be used on port if
++ *                          uncompressed format is used. Use 0 for
++ *                          unknown, don't care or variable
++ *  nStride               : Number of bytes per span of an image (i.e.
++ *                          indicates the number of bytes to get from
++ *                          span N to span N+1, where negative stride
++ *                          indicates the image is bottom up
++ *  nSliceHeight          : Height used when encoding in slices
++ *  bFlagErrorConcealment : Turns on error concealment if it is supported by
++ *                          the OMX component
++ *  eCompressionFormat    : Compression format used in this instance of
++ *                          the component. When OMX_IMAGE_CodingUnused is
++ *                          specified, eColorFormat is valid
++ *  eColorFormat          : Decompressed format used by this component
++ *  pNativeWindow         : Platform specific reference for a window object if a
++ *                          display sink , otherwise this field is 0x0.
++ */
++typedef struct OMX_IMAGE_PORTDEFINITIONTYPE {
++    OMX_STRING cMIMEType;
++    OMX_NATIVE_DEVICETYPE pNativeRender;
++    OMX_U32 nFrameWidth;
++    OMX_U32 nFrameHeight;
++    OMX_S32 nStride;
++    OMX_U32 nSliceHeight;
++    OMX_BOOL bFlagErrorConcealment;
++    OMX_IMAGE_CODINGTYPE eCompressionFormat;
++    OMX_COLOR_FORMATTYPE eColorFormat;
++    OMX_NATIVE_WINDOWTYPE pNativeWindow;
++} OMX_IMAGE_PORTDEFINITIONTYPE;
++
++
++/**
++ * Port format parameter.  This structure is used to enumerate the various
++ * data input/output format supported by the port.
++ *
++ * STRUCT MEMBERS:
++ *  nSize              : Size of the structure in bytes
++ *  nVersion           : OMX specification version information
++ *  nPortIndex         : Indicates which port to set
++ *  nIndex             : Indicates the enumeration index for the format from
++ *                       0x0 to N-1
++ *  eCompressionFormat : Compression format used in this instance of the
++ *                       component. When OMX_IMAGE_CodingUnused is specified,
++ *                       eColorFormat is valid
++ *  eColorFormat       : Decompressed format used by this component
++ */
++typedef struct OMX_IMAGE_PARAM_PORTFORMATTYPE {
++    OMX_U32 nSize;
++    OMX_VERSIONTYPE nVersion;
++    OMX_U32 nPortIndex;
++    OMX_U32 nIndex;
++    OMX_IMAGE_CODINGTYPE eCompressionFormat;
++    OMX_COLOR_FORMATTYPE eColorFormat;
++} OMX_IMAGE_PARAM_PORTFORMATTYPE;
++
++
++/**
++ * Flash control type
++ *
++ * ENUMS
++ *  Torch : Flash forced constantly on
++ */
++typedef enum OMX_IMAGE_FLASHCONTROLTYPE {
++    OMX_IMAGE_FlashControlOn = 0,
++    OMX_IMAGE_FlashControlOff,
++    OMX_IMAGE_FlashControlAuto,
++    OMX_IMAGE_FlashControlRedEyeReduction,
++    OMX_IMAGE_FlashControlFillin,
++    OMX_IMAGE_FlashControlTorch,
++    OMX_IMAGE_FlashControlKhronosExtensions = 0x6F000000, /**< Reserved region for introducing Khronos Standard Extensions */
++    OMX_IMAGE_FlashControlVendorStartUnused = 0x7F000000, /**< Reserved region for introducing Vendor Extensions */
++    OMX_IMAGE_FlashControlMax = 0x7FFFFFFF
++} OMX_IMAGE_FLASHCONTROLTYPE;
++
++
++/**
++ * Flash control configuration
++ *
++ * STRUCT MEMBERS:
++ *  nSize         : Size of the structure in bytes
++ *  nVersion      : OMX specification version information
++ *  nPortIndex    : Port that this structure applies to
++ *  eFlashControl : Flash control type
++ */
++typedef struct OMX_IMAGE_PARAM_FLASHCONTROLTYPE {
++    OMX_U32 nSize;
++    OMX_VERSIONTYPE nVersion;
++    OMX_U32 nPortIndex;
++    OMX_IMAGE_FLASHCONTROLTYPE eFlashControl;
++} OMX_IMAGE_PARAM_FLASHCONTROLTYPE;
++
++
++/**
++ * Focus control type
++ */
++typedef enum OMX_IMAGE_FOCUSCONTROLTYPE {
++    OMX_IMAGE_FocusControlOn = 0,
++    OMX_IMAGE_FocusControlOff,
++    OMX_IMAGE_FocusControlAuto,
++    OMX_IMAGE_FocusControlAutoLock,
++    OMX_IMAGE_FocusControlKhronosExtensions = 0x6F000000, /**< Reserved region for introducing Khronos Standard Extensions */
++    OMX_IMAGE_FocusControlVendorStartUnused = 0x7F000000, /**< Reserved region for introducing Vendor Extensions */
++    OMX_IMAGE_FocusControlMax = 0x7FFFFFFF
++} OMX_IMAGE_FOCUSCONTROLTYPE;
++
++
++/**
++ * Focus control configuration
++ *
++ * STRUCT MEMBERS:
++ *  nSize           : Size of the structure in bytes
++ *  nVersion        : OMX specification version information
++ *  nPortIndex      : Port that this structure applies to
++ *  eFocusControl   : Focus control
++ *  nFocusSteps     : Focus can take on values from 0 mm to infinity.
++ *                    Interest is only in number of steps over this range.
++ *  nFocusStepIndex : Current focus step index
++ */
++typedef struct OMX_IMAGE_CONFIG_FOCUSCONTROLTYPE {
++    OMX_U32 nSize;
++    OMX_VERSIONTYPE nVersion;
++    OMX_U32 nPortIndex;
++    OMX_IMAGE_FOCUSCONTROLTYPE eFocusControl;
++    OMX_U32 nFocusSteps;
++    OMX_U32 nFocusStepIndex;
++} OMX_IMAGE_CONFIG_FOCUSCONTROLTYPE;
++
++
++/**
++ * Q Factor for JPEG compression, which controls the tradeoff between image
++ * quality and size.  Q Factor provides a more simple means of controlling
++ * JPEG compression quality, without directly programming Quantization
++ * tables for chroma and luma
++ *
++ * STRUCT MEMBERS:
++ *  nSize      : Size of the structure in bytes
++ *  nVersion   : OMX specification version information
++ *  nPortIndex : Port that this structure applies to
++ *  nQFactor   : JPEG Q factor value in the range of 1-100. A factor of 1
++ *               produces the smallest, worst quality images, and a factor
++ *               of 100 produces the largest, best quality images.  A
++ *               typical default is 75 for small good quality images
++ */
++typedef struct OMX_IMAGE_PARAM_QFACTORTYPE {
++    OMX_U32 nSize;
++    OMX_VERSIONTYPE nVersion;
++    OMX_U32 nPortIndex;
++    OMX_U32 nQFactor;
++} OMX_IMAGE_PARAM_QFACTORTYPE;
++
++/**
++ * Quantization table type
++ */
++
++typedef enum OMX_IMAGE_QUANTIZATIONTABLETYPE {
++    OMX_IMAGE_QuantizationTableLuma = 0,
++    OMX_IMAGE_QuantizationTableChroma,
++    OMX_IMAGE_QuantizationTableChromaCb,
++    OMX_IMAGE_QuantizationTableChromaCr,
++    OMX_IMAGE_QuantizationTableKhronosExtensions = 0x6F000000, /**< Reserved region for introducing Khronos Standard Extensions */
++    OMX_IMAGE_QuantizationTableVendorStartUnused = 0x7F000000, /**< Reserved region for introducing Vendor Extensions */
++    OMX_IMAGE_QuantizationTableMax = 0x7FFFFFFF
++} OMX_IMAGE_QUANTIZATIONTABLETYPE;
++
++/**
++ * JPEG quantization tables are used to determine DCT compression for
++ * YUV data, as an alternative to specifying Q factor, providing exact
++ * control of compression
++ *
++ * STRUCT MEMBERS:
++ *  nSize                   : Size of the structure in bytes
++ *  nVersion                : OMX specification version information
++ *  nPortIndex              : Port that this structure applies to
++ *  eQuantizationTable      : Quantization table type
++ *  nQuantizationMatrix[64] : JPEG quantization table of coefficients stored
++ *                            in increasing columns then by rows of data (i.e.
++ *                            row 1, ... row 8). Quantization values are in
++ *                            the range 0-255 and stored in linear order
++ *                            (i.e. the component will zig-zag the
++ *                            quantization table data if required internally)
++ */
++typedef struct OMX_IMAGE_PARAM_QUANTIZATIONTABLETYPE {
++    OMX_U32 nSize;
++    OMX_VERSIONTYPE nVersion;
++    OMX_U32 nPortIndex;
++    OMX_IMAGE_QUANTIZATIONTABLETYPE eQuantizationTable;
++    OMX_U8 nQuantizationMatrix[64];
++} OMX_IMAGE_PARAM_QUANTIZATIONTABLETYPE;
++
++
++/**
++ * Huffman table type, the same Huffman table is applied for chroma and
++ * luma component
++ */
++typedef enum OMX_IMAGE_HUFFMANTABLETYPE {
++    OMX_IMAGE_HuffmanTableAC = 0,
++    OMX_IMAGE_HuffmanTableDC,
++    OMX_IMAGE_HuffmanTableACLuma,
++    OMX_IMAGE_HuffmanTableACChroma,
++    OMX_IMAGE_HuffmanTableDCLuma,
++    OMX_IMAGE_HuffmanTableDCChroma,
++    OMX_IMAGE_HuffmanTableKhronosExtensions = 0x6F000000, /**< Reserved region for introducing Khronos Standard Extensions */
++    OMX_IMAGE_HuffmanTableVendorStartUnused = 0x7F000000, /**< Reserved region for introducing Vendor Extensions */
++    OMX_IMAGE_HuffmanTableMax = 0x7FFFFFFF
++} OMX_IMAGE_HUFFMANTABLETYPE;
++
++/**
++ * JPEG Huffman table
++ *
++ * STRUCT MEMBERS:
++ *  nSize                            : Size of the structure in bytes
++ *  nVersion                         : OMX specification version information
++ *  nPortIndex                       : Port that this structure applies to
++ *  eHuffmanTable                    : Huffman table type
++ *  nNumberOfHuffmanCodeOfLength[16] : 0-16, number of Huffman codes of each
++ *                                     possible length
++ *  nHuffmanTable[256]               : 0-255, the size used for AC and DC
++ *                                     HuffmanTable are 16 and 162
++ */
++typedef struct OMX_IMAGE_PARAM_HUFFMANTTABLETYPE {
++    OMX_U32 nSize;
++    OMX_VERSIONTYPE nVersion;
++    OMX_U32 nPortIndex;
++    OMX_IMAGE_HUFFMANTABLETYPE eHuffmanTable;
++    OMX_U8 nNumberOfHuffmanCodeOfLength[16];
++    OMX_U8 nHuffmanTable[256];
++}OMX_IMAGE_PARAM_HUFFMANTTABLETYPE;
++
++/** @} */
++#ifdef __cplusplus
++}
++#endif /* __cplusplus */
++
++#endif
++/* File EOF */
+diff -rupN a/usr/include/OpenMAX/il/OMX_IndexExt.h b/usr/include/OpenMAX/il/OMX_IndexExt.h
+--- a/usr/include/OpenMAX/il/OMX_IndexExt.h	1970-01-01 01:00:00.000000000 +0100
++++ b/usr/include/OpenMAX/il/OMX_IndexExt.h	2011-08-18 13:48:18.000000000 +0200
+@@ -0,0 +1,90 @@
++/*
++ * Copyright (c) 2010 The Khronos Group Inc. 
++ * 
++ * Permission is hereby granted, free of charge, to any person obtaining
++ * a copy of this software and associated documentation files (the
++ * "Software"), to deal in the Software without restriction, including
++ * without limitation the rights to use, copy, modify, merge, publish,
++ * distribute, sublicense, and/or sell copies of the Software, and to
++ * permit persons to whom the Software is furnished to do so, subject
++ * to the following conditions: 
++ * The above copyright notice and this permission notice shall be included
++ * in all copies or substantial portions of the Software. 
++ * 
++ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS
++ * OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
++ * MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
++ * IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
++ * CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
++ * TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
++ * SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE. 
++ *
++ */
++
++/** @file OMX_IndexExt.h - OpenMax IL version 1.1.2
++ * The OMX_IndexExt header file contains extensions to the definitions 
++ * for both applications and components .
++ */
++
++#ifndef OMX_IndexExt_h
++#define OMX_IndexExt_h
++
++#ifdef __cplusplus
++extern "C" {
++#endif /* __cplusplus */
++
++/* Each OMX header shall include all required header files to allow the
++ * header to compile without errors.  The includes below are required
++ * for this header file to compile successfully
++ */
++#include <OMX_Index.h>
++
++
++/** Khronos standard extension indices.
++
++This enum lists the current Khronos extension indices to OpenMAX IL.
++*/
++typedef enum OMX_INDEXEXTTYPE {
++
++    /* Component parameters and configurations */
++    OMX_IndexExtComponentStartUnused = OMX_IndexKhronosExtensions + 0x00100000,
++    OMX_IndexConfigCallbackRequest,                 /**< reference: OMX_CONFIG_CALLBACKREQUESTTYPE */
++    OMX_IndexConfigCommitMode,                      /**< reference: OMX_CONFIG_COMMITMODETYPE */
++    OMX_IndexConfigCommit,                          /**< reference: OMX_CONFIG_COMMITTYPE */
++
++    /* Port parameters and configurations */
++    OMX_IndexExtPortStartUnused = OMX_IndexKhronosExtensions + 0x00200000,
++
++    /* Audio parameters and configurations */
++    OMX_IndexExtAudioStartUnused = OMX_IndexKhronosExtensions + 0x00400000,
++
++    /* Image parameters and configurations */
++    OMX_IndexExtImageStartUnused = OMX_IndexKhronosExtensions + 0x00500000,
++
++    /* Video parameters and configurations */
++    OMX_IndexExtVideoStartUnused = OMX_IndexKhronosExtensions + 0x00600000,
++    OMX_IndexParamNalStreamFormatSupported,         /**< reference: OMX_NALSTREAMFORMATTYPE */
++    OMX_IndexParamNalStreamFormat,                  /**< reference: OMX_NALSTREAMFORMATTYPE */
++    OMX_IndexParamNalStreamFormatSelect,            /**< reference: OMX_NALSTREAMFORMATTYPE */
++    OMX_IndexParamVideoVp8,                         /**< reference: OMX_VIDEO_PARAM_VP8TYPE */
++    OMX_IndexConfigVideoVp8ReferenceFrame,          /**< reference: OMX_VIDEO_VP8REFERENCEFRAMETYPE */
++    OMX_IndexConfigVideoVp8ReferenceFrameType,      /**< reference: OMX_VIDEO_VP8REFERENCEFRAMEINFOTYPE */
++
++    /* Image & Video common configurations */
++    OMX_IndexExtCommonStartUnused = OMX_IndexKhronosExtensions + 0x00700000,
++
++    /* Other configurations */
++    OMX_IndexExtOtherStartUnused = OMX_IndexKhronosExtensions + 0x00800000,
++
++    /* Time configurations */
++    OMX_IndexExtTimeStartUnused = OMX_IndexKhronosExtensions + 0x00900000,
++
++    OMX_IndexExtMax = 0x7FFFFFFF
++} OMX_INDEXEXTTYPE;
++
++#ifdef __cplusplus
++}
++#endif /* __cplusplus */
++
++#endif /* OMX_IndexExt_h */
++/* File EOF */
+diff -rupN a/usr/include/OpenMAX/il/OMX_Index.h b/usr/include/OpenMAX/il/OMX_Index.h
+--- a/usr/include/OpenMAX/il/OMX_Index.h	1970-01-01 01:00:00.000000000 +0100
++++ b/usr/include/OpenMAX/il/OMX_Index.h	2011-08-09 09:08:06.000000000 +0200
+@@ -0,0 +1,258 @@
++/*
++ * Copyright (c) 2008 The Khronos Group Inc.
++ *
++ * Permission is hereby granted, free of charge, to any person obtaining
++ * a copy of this software and associated documentation files (the
++ * "Software"), to deal in the Software without restriction, including
++ * without limitation the rights to use, copy, modify, merge, publish,
++ * distribute, sublicense, and/or sell copies of the Software, and to
++ * permit persons to whom the Software is furnished to do so, subject
++ * to the following conditions:
++ * The above copyright notice and this permission notice shall be included
++ * in all copies or substantial portions of the Software.
++ *
++ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS
++ * OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
++ * MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
++ * IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
++ * CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
++ * TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
++ * SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
++ *
++ */
++
++/** @file OMX_Index.h - OpenMax IL version 1.1.2
++ *  The OMX_Index header file contains the definitions for both applications
++ *  and components .
++ */
++
++
++#ifndef OMX_Index_h
++#define OMX_Index_h
++
++#ifdef __cplusplus
++extern "C" {
++#endif /* __cplusplus */
++
++
++/* Each OMX header must include all required header files to allow the
++ *  header to compile without errors.  The includes below are required
++ *  for this header file to compile successfully
++ */
++#include <OMX_Types.h>
++
++
++/** The OMX_INDEXTYPE enumeration is used to select a structure when either
++ *  getting or setting parameters and/or configuration data.  Each entry in
++ *  this enumeration maps to an OMX specified structure.  When the
++ *  OMX_GetParameter, OMX_SetParameter, OMX_GetConfig or OMX_SetConfig methods
++ *  are used, the second parameter will always be an entry from this enumeration
++ *  and the third entry will be the structure shown in the comments for the entry.
++ *  For example, if the application is initializing a cropping function, the
++ *  OMX_SetConfig command would have OMX_IndexConfigCommonInputCrop as the second parameter
++ *  and would send a pointer to an initialized OMX_RECTTYPE structure as the
++ *  third parameter.
++ *
++ *  The enumeration entries named with the OMX_Config prefix are sent using
++ *  the OMX_SetConfig command and the enumeration entries named with the
++ *  OMX_PARAM_ prefix are sent using the OMX_SetParameter command.
++ */
++typedef enum OMX_INDEXTYPE {
++
++    OMX_IndexComponentStartUnused = 0x01000000,
++    OMX_IndexParamPriorityMgmt,             /**< reference: OMX_PRIORITYMGMTTYPE */
++    OMX_IndexParamAudioInit,                /**< reference: OMX_PORT_PARAM_TYPE */
++    OMX_IndexParamImageInit,                /**< reference: OMX_PORT_PARAM_TYPE */
++    OMX_IndexParamVideoInit,                /**< reference: OMX_PORT_PARAM_TYPE */
++    OMX_IndexParamOtherInit,                /**< reference: OMX_PORT_PARAM_TYPE */
++    OMX_IndexParamNumAvailableStreams,      /**< reference: OMX_PARAM_U32TYPE */
++    OMX_IndexParamActiveStream,             /**< reference: OMX_PARAM_U32TYPE */
++    OMX_IndexParamSuspensionPolicy,         /**< reference: OMX_PARAM_SUSPENSIONPOLICYTYPE */
++    OMX_IndexParamComponentSuspended,       /**< reference: OMX_PARAM_SUSPENSIONTYPE */
++    OMX_IndexConfigCapturing,               /**< reference: OMX_CONFIG_BOOLEANTYPE */
++    OMX_IndexConfigCaptureMode,             /**< reference: OMX_CONFIG_CAPTUREMODETYPE */
++    OMX_IndexAutoPauseAfterCapture,         /**< reference: OMX_CONFIG_BOOLEANTYPE */
++    OMX_IndexParamContentURI,               /**< reference: OMX_PARAM_CONTENTURITYPE */
++    OMX_IndexParamCustomContentPipe,        /**< reference: OMX_PARAM_CONTENTPIPETYPE */
++    OMX_IndexParamDisableResourceConcealment, /**< reference: OMX_RESOURCECONCEALMENTTYPE */
++    OMX_IndexConfigMetadataItemCount,       /**< reference: OMX_CONFIG_METADATAITEMCOUNTTYPE */
++    OMX_IndexConfigContainerNodeCount,      /**< reference: OMX_CONFIG_CONTAINERNODECOUNTTYPE */
++    OMX_IndexConfigMetadataItem,            /**< reference: OMX_CONFIG_METADATAITEMTYPE */
++    OMX_IndexConfigCounterNodeID,           /**< reference: OMX_CONFIG_CONTAINERNODEIDTYPE */
++    OMX_IndexParamMetadataFilterType,       /**< reference: OMX_PARAM_METADATAFILTERTYPE */
++    OMX_IndexParamMetadataKeyFilter,        /**< reference: OMX_PARAM_METADATAFILTERTYPE */
++    OMX_IndexConfigPriorityMgmt,            /**< reference: OMX_PRIORITYMGMTTYPE */
++    OMX_IndexParamStandardComponentRole,    /**< reference: OMX_PARAM_COMPONENTROLETYPE */
++
++    OMX_IndexPortStartUnused = 0x02000000,
++    OMX_IndexParamPortDefinition,           /**< reference: OMX_PARAM_PORTDEFINITIONTYPE */
++    OMX_IndexParamCompBufferSupplier,       /**< reference: OMX_PARAM_BUFFERSUPPLIERTYPE */
++    OMX_IndexReservedStartUnused = 0x03000000,
++
++    /* Audio parameters and configurations */
++    OMX_IndexAudioStartUnused = 0x04000000,
++    OMX_IndexParamAudioPortFormat,          /**< reference: OMX_AUDIO_PARAM_PORTFORMATTYPE */
++    OMX_IndexParamAudioPcm,                 /**< reference: OMX_AUDIO_PARAM_PCMMODETYPE */
++    OMX_IndexParamAudioAac,                 /**< reference: OMX_AUDIO_PARAM_AACPROFILETYPE */
++    OMX_IndexParamAudioRa,                  /**< reference: OMX_AUDIO_PARAM_RATYPE */
++    OMX_IndexParamAudioMp3,                 /**< reference: OMX_AUDIO_PARAM_MP3TYPE */
++    OMX_IndexParamAudioAdpcm,               /**< reference: OMX_AUDIO_PARAM_ADPCMTYPE */
++    OMX_IndexParamAudioG723,                /**< reference: OMX_AUDIO_PARAM_G723TYPE */
++    OMX_IndexParamAudioG729,                /**< reference: OMX_AUDIO_PARAM_G729TYPE */
++    OMX_IndexParamAudioAmr,                 /**< reference: OMX_AUDIO_PARAM_AMRTYPE */
++    OMX_IndexParamAudioWma,                 /**< reference: OMX_AUDIO_PARAM_WMATYPE */
++    OMX_IndexParamAudioSbc,                 /**< reference: OMX_AUDIO_PARAM_SBCTYPE */
++    OMX_IndexParamAudioMidi,                /**< reference: OMX_AUDIO_PARAM_MIDITYPE */
++    OMX_IndexParamAudioGsm_FR,              /**< reference: OMX_AUDIO_PARAM_GSMFRTYPE */
++    OMX_IndexParamAudioMidiLoadUserSound,   /**< reference: OMX_AUDIO_PARAM_MIDILOADUSERSOUNDTYPE */
++    OMX_IndexParamAudioG726,                /**< reference: OMX_AUDIO_PARAM_G726TYPE */
++    OMX_IndexParamAudioGsm_EFR,             /**< reference: OMX_AUDIO_PARAM_GSMEFRTYPE */
++    OMX_IndexParamAudioGsm_HR,              /**< reference: OMX_AUDIO_PARAM_GSMHRTYPE */
++    OMX_IndexParamAudioPdc_FR,              /**< reference: OMX_AUDIO_PARAM_PDCFRTYPE */
++    OMX_IndexParamAudioPdc_EFR,             /**< reference: OMX_AUDIO_PARAM_PDCEFRTYPE */
++    OMX_IndexParamAudioPdc_HR,              /**< reference: OMX_AUDIO_PARAM_PDCHRTYPE */
++    OMX_IndexParamAudioTdma_FR,             /**< reference: OMX_AUDIO_PARAM_TDMAFRTYPE */
++    OMX_IndexParamAudioTdma_EFR,            /**< reference: OMX_AUDIO_PARAM_TDMAEFRTYPE */
++    OMX_IndexParamAudioQcelp8,              /**< reference: OMX_AUDIO_PARAM_QCELP8TYPE */
++    OMX_IndexParamAudioQcelp13,             /**< reference: OMX_AUDIO_PARAM_QCELP13TYPE */
++    OMX_IndexParamAudioEvrc,                /**< reference: OMX_AUDIO_PARAM_EVRCTYPE */
++    OMX_IndexParamAudioSmv,                 /**< reference: OMX_AUDIO_PARAM_SMVTYPE */
++    OMX_IndexParamAudioVorbis,              /**< reference: OMX_AUDIO_PARAM_VORBISTYPE */
++
++    OMX_IndexConfigAudioMidiImmediateEvent, /**< reference: OMX_AUDIO_CONFIG_MIDIIMMEDIATEEVENTTYPE */
++    OMX_IndexConfigAudioMidiControl,        /**< reference: OMX_AUDIO_CONFIG_MIDICONTROLTYPE */
++    OMX_IndexConfigAudioMidiSoundBankProgram, /**< reference: OMX_AUDIO_CONFIG_MIDISOUNDBANKPROGRAMTYPE */
++    OMX_IndexConfigAudioMidiStatus,         /**< reference: OMX_AUDIO_CONFIG_MIDISTATUSTYPE */
++    OMX_IndexConfigAudioMidiMetaEvent,      /**< reference: OMX_AUDIO_CONFIG_MIDIMETAEVENTTYPE */
++    OMX_IndexConfigAudioMidiMetaEventData,  /**< reference: OMX_AUDIO_CONFIG_MIDIMETAEVENTDATATYPE */
++    OMX_IndexConfigAudioVolume,             /**< reference: OMX_AUDIO_CONFIG_VOLUMETYPE */
++    OMX_IndexConfigAudioBalance,            /**< reference: OMX_AUDIO_CONFIG_BALANCETYPE */
++    OMX_IndexConfigAudioChannelMute,        /**< reference: OMX_AUDIO_CONFIG_CHANNELMUTETYPE */
++    OMX_IndexConfigAudioMute,               /**< reference: OMX_AUDIO_CONFIG_MUTETYPE */
++    OMX_IndexConfigAudioLoudness,           /**< reference: OMX_AUDIO_CONFIG_LOUDNESSTYPE */
++    OMX_IndexConfigAudioEchoCancelation,    /**< reference: OMX_AUDIO_CONFIG_ECHOCANCELATIONTYPE */
++    OMX_IndexConfigAudioNoiseReduction,     /**< reference: OMX_AUDIO_CONFIG_NOISEREDUCTIONTYPE */
++    OMX_IndexConfigAudioBass,               /**< reference: OMX_AUDIO_CONFIG_BASSTYPE */
++    OMX_IndexConfigAudioTreble,             /**< reference: OMX_AUDIO_CONFIG_TREBLETYPE */
++    OMX_IndexConfigAudioStereoWidening,     /**< reference: OMX_AUDIO_CONFIG_STEREOWIDENINGTYPE */
++    OMX_IndexConfigAudioChorus,             /**< reference: OMX_AUDIO_CONFIG_CHORUSTYPE */
++    OMX_IndexConfigAudioEqualizer,          /**< reference: OMX_AUDIO_CONFIG_EQUALIZERTYPE */
++    OMX_IndexConfigAudioReverberation,      /**< reference: OMX_AUDIO_CONFIG_REVERBERATIONTYPE */
++    OMX_IndexConfigAudioChannelVolume,      /**< reference: OMX_AUDIO_CONFIG_CHANNELVOLUMETYPE */
++
++    /* Image specific parameters and configurations */
++    OMX_IndexImageStartUnused = 0x05000000,
++    OMX_IndexParamImagePortFormat,          /**< reference: OMX_IMAGE_PARAM_PORTFORMATTYPE */
++    OMX_IndexParamFlashControl,             /**< reference: OMX_IMAGE_PARAM_FLASHCONTROLTYPE */
++    OMX_IndexConfigFocusControl,            /**< reference: OMX_IMAGE_CONFIG_FOCUSCONTROLTYPE */
++    OMX_IndexParamQFactor,                  /**< reference: OMX_IMAGE_PARAM_QFACTORTYPE */
++    OMX_IndexParamQuantizationTable,        /**< reference: OMX_IMAGE_PARAM_QUANTIZATIONTABLETYPE */
++    OMX_IndexParamHuffmanTable,             /**< reference: OMX_IMAGE_PARAM_HUFFMANTTABLETYPE */
++    OMX_IndexConfigFlashControl,            /**< reference: OMX_IMAGE_PARAM_FLASHCONTROLTYPE */
++
++    /* Video specific parameters and configurations */
++    OMX_IndexVideoStartUnused = 0x06000000,
++    OMX_IndexParamVideoPortFormat,          /**< reference: OMX_VIDEO_PARAM_PORTFORMATTYPE */
++    OMX_IndexParamVideoQuantization,        /**< reference: OMX_VIDEO_PARAM_QUANTIZATIONTYPE */
++    OMX_IndexParamVideoFastUpdate,          /**< reference: OMX_VIDEO_PARAM_VIDEOFASTUPDATETYPE */
++    OMX_IndexParamVideoBitrate,             /**< reference: OMX_VIDEO_PARAM_BITRATETYPE */
++    OMX_IndexParamVideoMotionVector,        /**< reference: OMX_VIDEO_PARAM_MOTIONVECTORTYPE */
++    OMX_IndexParamVideoIntraRefresh,        /**< reference: OMX_VIDEO_PARAM_INTRAREFRESHTYPE */
++    OMX_IndexParamVideoErrorCorrection,     /**< reference: OMX_VIDEO_PARAM_ERRORCORRECTIONTYPE */
++    OMX_IndexParamVideoVBSMC,               /**< reference: OMX_VIDEO_PARAM_VBSMCTYPE */
++    OMX_IndexParamVideoMpeg2,               /**< reference: OMX_VIDEO_PARAM_MPEG2TYPE */
++    OMX_IndexParamVideoMpeg4,               /**< reference: OMX_VIDEO_PARAM_MPEG4TYPE */
++    OMX_IndexParamVideoWmv,                 /**< reference: OMX_VIDEO_PARAM_WMVTYPE */
++    OMX_IndexParamVideoRv,                  /**< reference: OMX_VIDEO_PARAM_RVTYPE */
++    OMX_IndexParamVideoAvc,                 /**< reference: OMX_VIDEO_PARAM_AVCTYPE */
++    OMX_IndexParamVideoH263,                /**< reference: OMX_VIDEO_PARAM_H263TYPE */
++    OMX_IndexParamVideoProfileLevelQuerySupported, /**< reference: OMX_VIDEO_PARAM_PROFILELEVELTYPE */
++    OMX_IndexParamVideoProfileLevelCurrent, /**< reference: OMX_VIDEO_PARAM_PROFILELEVELTYPE */
++    OMX_IndexConfigVideoBitrate,            /**< reference: OMX_VIDEO_CONFIG_BITRATETYPE */
++    OMX_IndexConfigVideoFramerate,          /**< reference: OMX_CONFIG_FRAMERATETYPE */
++    OMX_IndexConfigVideoIntraVOPRefresh,    /**< reference: OMX_CONFIG_INTRAREFRESHVOPTYPE */
++    OMX_IndexConfigVideoIntraMBRefresh,     /**< reference: OMX_CONFIG_MACROBLOCKERRORMAPTYPE */
++    OMX_IndexConfigVideoMBErrorReporting,   /**< reference: OMX_CONFIG_MBERRORREPORTINGTYPE */
++    OMX_IndexParamVideoMacroblocksPerFrame, /**< reference: OMX_PARAM_MACROBLOCKSTYPE */
++    OMX_IndexConfigVideoMacroBlockErrorMap, /**< reference: OMX_CONFIG_MACROBLOCKERRORMAPTYPE */
++    OMX_IndexParamVideoSliceFMO,            /**< reference: OMX_VIDEO_PARAM_AVCSLICEFMO */
++    OMX_IndexConfigVideoAVCIntraPeriod,     /**< reference: OMX_VIDEO_CONFIG_AVCINTRAPERIOD */
++    OMX_IndexConfigVideoNalSize,            /**< reference: OMX_VIDEO_CONFIG_NALSIZE */
++
++    /* Image & Video common Configurations */
++    OMX_IndexCommonStartUnused = 0x07000000,
++    OMX_IndexParamCommonDeblocking,         /**< reference: OMX_PARAM_DEBLOCKINGTYPE */
++    OMX_IndexParamCommonSensorMode,         /**< reference: OMX_PARAM_SENSORMODETYPE */
++    OMX_IndexParamCommonInterleave,         /**< reference: OMX_PARAM_INTERLEAVETYPE */
++    OMX_IndexConfigCommonColorFormatConversion, /**< reference: OMX_CONFIG_COLORCONVERSIONTYPE */
++    OMX_IndexConfigCommonScale,             /**< reference: OMX_CONFIG_SCALEFACTORTYPE */
++    OMX_IndexConfigCommonImageFilter,       /**< reference: OMX_CONFIG_IMAGEFILTERTYPE */
++    OMX_IndexConfigCommonColorEnhancement,  /**< reference: OMX_CONFIG_COLORENHANCEMENTTYPE */
++    OMX_IndexConfigCommonColorKey,          /**< reference: OMX_CONFIG_COLORKEYTYPE */
++    OMX_IndexConfigCommonColorBlend,        /**< reference: OMX_CONFIG_COLORBLENDTYPE */
++    OMX_IndexConfigCommonFrameStabilisation,/**< reference: OMX_CONFIG_FRAMESTABTYPE */
++    OMX_IndexConfigCommonRotate,            /**< reference: OMX_CONFIG_ROTATIONTYPE */
++    OMX_IndexConfigCommonMirror,            /**< reference: OMX_CONFIG_MIRRORTYPE */
++    OMX_IndexConfigCommonOutputPosition,    /**< reference: OMX_CONFIG_POINTTYPE */
++    OMX_IndexConfigCommonInputCrop,         /**< reference: OMX_CONFIG_RECTTYPE */
++    OMX_IndexConfigCommonOutputCrop,        /**< reference: OMX_CONFIG_RECTTYPE */
++    OMX_IndexConfigCommonDigitalZoom,       /**< reference: OMX_CONFIG_SCALEFACTORTYPE */
++    OMX_IndexConfigCommonOpticalZoom,       /**< reference: OMX_CONFIG_SCALEFACTORTYPE*/
++    OMX_IndexConfigCommonWhiteBalance,      /**< reference: OMX_CONFIG_WHITEBALCONTROLTYPE */
++    OMX_IndexConfigCommonExposure,          /**< reference: OMX_CONFIG_EXPOSURECONTROLTYPE */
++    OMX_IndexConfigCommonContrast,          /**< reference: OMX_CONFIG_CONTRASTTYPE */
++    OMX_IndexConfigCommonBrightness,        /**< reference: OMX_CONFIG_BRIGHTNESSTYPE */
++    OMX_IndexConfigCommonBacklight,         /**< reference: OMX_CONFIG_BACKLIGHTTYPE */
++    OMX_IndexConfigCommonGamma,             /**< reference: OMX_CONFIG_GAMMATYPE */
++    OMX_IndexConfigCommonSaturation,        /**< reference: OMX_CONFIG_SATURATIONTYPE */
++    OMX_IndexConfigCommonLightness,         /**< reference: OMX_CONFIG_LIGHTNESSTYPE */
++    OMX_IndexConfigCommonExclusionRect,     /**< reference: OMX_CONFIG_RECTTYPE */
++    OMX_IndexConfigCommonDithering,         /**< reference: OMX_CONFIG_DITHERTYPE */
++    OMX_IndexConfigCommonPlaneBlend,        /**< reference: OMX_CONFIG_PLANEBLENDTYPE */
++    OMX_IndexConfigCommonExposureValue,     /**< reference: OMX_CONFIG_EXPOSUREVALUETYPE */
++    OMX_IndexConfigCommonOutputSize,        /**< reference: OMX_FRAMESIZETYPE */
++    OMX_IndexParamCommonExtraQuantData,     /**< reference: OMX_OTHER_EXTRADATATYPE */
++    OMX_IndexConfigCommonFocusRegion,       /**< reference: OMX_CONFIG_FOCUSREGIONTYPE */
++    OMX_IndexConfigCommonFocusStatus,       /**< reference: OMX_PARAM_FOCUSSTATUSTYPE */
++    OMX_IndexConfigCommonTransitionEffect,  /**< reference: OMX_CONFIG_TRANSITIONEFFECTTYPE */
++
++    /* Reserved Configuration range */
++    OMX_IndexOtherStartUnused = 0x08000000,
++    OMX_IndexParamOtherPortFormat,          /**< reference: OMX_OTHER_PARAM_PORTFORMATTYPE */
++    OMX_IndexConfigOtherPower,              /**< reference: OMX_OTHER_CONFIG_POWERTYPE */
++    OMX_IndexConfigOtherStats,              /**< reference: OMX_OTHER_CONFIG_STATSTYPE */
++
++
++    /* Reserved Time range */
++    OMX_IndexTimeStartUnused = 0x09000000,
++    OMX_IndexConfigTimeScale,               /**< reference: OMX_TIME_CONFIG_SCALETYPE */
++    OMX_IndexConfigTimeClockState,          /**< reference: OMX_TIME_CONFIG_CLOCKSTATETYPE */
++    OMX_IndexConfigTimeActiveRefClock,      /**< reference: OMX_TIME_CONFIG_ACTIVEREFCLOCKTYPE */
++    OMX_IndexConfigTimeCurrentMediaTime,    /**< reference: OMX_TIME_CONFIG_TIMESTAMPTYPE (read only) */
++    OMX_IndexConfigTimeCurrentWallTime,     /**< reference: OMX_TIME_CONFIG_TIMESTAMPTYPE (read only) */
++    OMX_IndexConfigTimeCurrentAudioReference, /**< reference: OMX_TIME_CONFIG_TIMESTAMPTYPE (write only) */
++    OMX_IndexConfigTimeCurrentVideoReference, /**< reference: OMX_TIME_CONFIG_TIMESTAMPTYPE (write only) */
++    OMX_IndexConfigTimeMediaTimeRequest,    /**< reference: OMX_TIME_CONFIG_MEDIATIMEREQUESTTYPE (write only) */
++    OMX_IndexConfigTimeClientStartTime,     /**<reference:  OMX_TIME_CONFIG_TIMESTAMPTYPE (write only) */
++    OMX_IndexConfigTimePosition,            /**< reference: OMX_TIME_CONFIG_TIMESTAMPTYPE */
++    OMX_IndexConfigTimeSeekMode,            /**< reference: OMX_TIME_CONFIG_SEEKMODETYPE */
++
++
++    OMX_IndexKhronosExtensions = 0x6F000000, /**< Reserved region for introducing Khronos Standard Extensions */
++    /* Vendor specific area */
++    OMX_IndexVendorStartUnused = 0x7F000000,
++    /* Vendor specific structures should be in the range of 0x7F000000
++       to 0x7FFFFFFE.  This range is not broken out by vendor, so
++       private indexes are not guaranteed unique and therefore should
++       only be sent to the appropriate component. */
++
++    OMX_IndexMax = 0x7FFFFFFF
++
++} OMX_INDEXTYPE;
++
++#ifdef __cplusplus
++}
++#endif /* __cplusplus */
++
++#endif
++/* File EOF */
+diff -rupN a/usr/include/OpenMAX/il/OMX_IVCommon.h b/usr/include/OpenMAX/il/OMX_IVCommon.h
+--- a/usr/include/OpenMAX/il/OMX_IVCommon.h	1970-01-01 01:00:00.000000000 +0100
++++ b/usr/include/OpenMAX/il/OMX_IVCommon.h	2011-08-09 09:08:06.000000000 +0200
+@@ -0,0 +1,920 @@
++/**
++ * Copyright (c) 2008 The Khronos Group Inc.
++ *
++ * Permission is hereby granted, free of charge, to any person obtaining
++ * a copy of this software and associated documentation files (the
++ * "Software"), to deal in the Software without restriction, including
++ * without limitation the rights to use, copy, modify, merge, publish,
++ * distribute, sublicense, and/or sell copies of the Software, and to
++ * permit persons to whom the Software is furnished to do so, subject
++ * to the following conditions:
++ * The above copyright notice and this permission notice shall be included
++ * in all copies or substantial portions of the Software.
++ *
++ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS
++ * OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
++ * MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
++ * IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
++ * CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
++ * TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
++ * SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
++ *
++ */
++
++/**
++ * @file OMX_IVCommon.h - OpenMax IL version 1.1.2
++ *  The structures needed by Video and Image components to exchange
++ *  parameters and configuration data with the components.
++ */
++#ifndef OMX_IVCommon_h
++#define OMX_IVCommon_h
++
++#ifdef __cplusplus
++extern "C" {
++#endif /* __cplusplus */
++
++/**
++ * Each OMX header must include all required header files to allow the header
++ * to compile without errors.  The includes below are required for this header
++ * file to compile successfully
++ */
++
++#include <OMX_Core.h>
++
++/** @defgroup iv OpenMAX IL Imaging and Video Domain
++ * Common structures for OpenMAX IL Imaging and Video domains
++ * @{
++ */
++
++
++/**
++ * Enumeration defining possible uncompressed image/video formats.
++ *
++ * ENUMS:
++ *  Unused                 : Placeholder value when format is N/A
++ *  Monochrome             : black and white
++ *  8bitRGB332             : Red 7:5, Green 4:2, Blue 1:0
++ *  12bitRGB444            : Red 11:8, Green 7:4, Blue 3:0
++ *  16bitARGB4444          : Alpha 15:12, Red 11:8, Green 7:4, Blue 3:0
++ *  16bitARGB1555          : Alpha 15, Red 14:10, Green 9:5, Blue 4:0
++ *  16bitRGB565            : Red 15:11, Green 10:5, Blue 4:0
++ *  16bitBGR565            : Blue 15:11, Green 10:5, Red 4:0
++ *  18bitRGB666            : Red 17:12, Green 11:6, Blue 5:0
++ *  18bitARGB1665          : Alpha 17, Red 16:11, Green 10:5, Blue 4:0
++ *  19bitARGB1666          : Alpha 18, Red 17:12, Green 11:6, Blue 5:0
++ *  24bitRGB888            : Red 24:16, Green 15:8, Blue 7:0
++ *  24bitBGR888            : Blue 24:16, Green 15:8, Red 7:0
++ *  24bitARGB1887          : Alpha 23, Red 22:15, Green 14:7, Blue 6:0
++ *  25bitARGB1888          : Alpha 24, Red 23:16, Green 15:8, Blue 7:0
++ *  32bitBGRA8888          : Blue 31:24, Green 23:16, Red 15:8, Alpha 7:0
++ *  32bitARGB8888          : Alpha 31:24, Red 23:16, Green 15:8, Blue 7:0
++ *  YUV411Planar           : U,Y are subsampled by a factor of 4 horizontally
++ *  YUV411PackedPlanar     : packed per payload in planar slices
++ *  YUV420Planar           : Three arrays Y,U,V.
++ *  YUV420PackedPlanar     : packed per payload in planar slices
++ *  YUV420SemiPlanar       : Two arrays, one is all Y, the other is U and V
++ *  YUV422Planar           : Three arrays Y,U,V.
++ *  YUV422PackedPlanar     : packed per payload in planar slices
++ *  YUV422SemiPlanar       : Two arrays, one is all Y, the other is U and V
++ *  YCbYCr                 : Organized as 16bit YUYV (i.e. YCbYCr)
++ *  YCrYCb                 : Organized as 16bit YVYU (i.e. YCrYCb)
++ *  CbYCrY                 : Organized as 16bit UYVY (i.e. CbYCrY)
++ *  CrYCbY                 : Organized as 16bit VYUY (i.e. CrYCbY)
++ *  YUV444Interleaved      : Each pixel contains equal parts YUV
++ *  RawBayer8bit           : SMIA camera output format
++ *  RawBayer10bit          : SMIA camera output format
++ *  RawBayer8bitcompressed : SMIA camera output format
++ */
++typedef enum OMX_COLOR_FORMATTYPE {
++    OMX_COLOR_FormatUnused,
++    OMX_COLOR_FormatMonochrome,
++    OMX_COLOR_Format8bitRGB332,
++    OMX_COLOR_Format12bitRGB444,
++    OMX_COLOR_Format16bitARGB4444,
++    OMX_COLOR_Format16bitARGB1555,
++    OMX_COLOR_Format16bitRGB565,
++    OMX_COLOR_Format16bitBGR565,
++    OMX_COLOR_Format18bitRGB666,
++    OMX_COLOR_Format18bitARGB1665,
++    OMX_COLOR_Format19bitARGB1666,
++    OMX_COLOR_Format24bitRGB888,
++    OMX_COLOR_Format24bitBGR888,
++    OMX_COLOR_Format24bitARGB1887,
++    OMX_COLOR_Format25bitARGB1888,
++    OMX_COLOR_Format32bitBGRA8888,
++    OMX_COLOR_Format32bitARGB8888,
++    OMX_COLOR_FormatYUV411Planar,
++    OMX_COLOR_FormatYUV411PackedPlanar,
++    OMX_COLOR_FormatYUV420Planar,
++    OMX_COLOR_FormatYUV420PackedPlanar,
++    OMX_COLOR_FormatYUV420SemiPlanar,
++    OMX_COLOR_FormatYUV422Planar,
++    OMX_COLOR_FormatYUV422PackedPlanar,
++    OMX_COLOR_FormatYUV422SemiPlanar,
++    OMX_COLOR_FormatYCbYCr,
++    OMX_COLOR_FormatYCrYCb,
++    OMX_COLOR_FormatCbYCrY,
++    OMX_COLOR_FormatCrYCbY,
++    OMX_COLOR_FormatYUV444Interleaved,
++    OMX_COLOR_FormatRawBayer8bit,
++    OMX_COLOR_FormatRawBayer10bit,
++    OMX_COLOR_FormatRawBayer8bitcompressed,
++    OMX_COLOR_FormatL2,
++    OMX_COLOR_FormatL4,
++    OMX_COLOR_FormatL8,
++    OMX_COLOR_FormatL16,
++    OMX_COLOR_FormatL24,
++    OMX_COLOR_FormatL32,
++    OMX_COLOR_FormatYUV420PackedSemiPlanar,
++    OMX_COLOR_FormatYUV422PackedSemiPlanar,
++    OMX_COLOR_Format18BitBGR666,
++    OMX_COLOR_Format24BitARGB6666,
++    OMX_COLOR_Format24BitABGR6666,
++    OMX_COLOR_FormatKhronosExtensions = 0x6F000000, /**< Reserved region for introducing Khronos Standard Extensions */
++    OMX_COLOR_FormatVendorStartUnused = 0x7F000000, /**< Reserved region for introducing Vendor Extensions */
++    OMX_COLOR_FormatMax = 0x7FFFFFFF
++} OMX_COLOR_FORMATTYPE;
++
++
++/**
++ * Defines the matrix for conversion from RGB to YUV or vice versa.
++ * iColorMatrix should be initialized with the fixed point values
++ * used in converting between formats.
++ */
++typedef struct OMX_CONFIG_COLORCONVERSIONTYPE {
++    OMX_U32 nSize;              /**< Size of the structure in bytes */
++    OMX_VERSIONTYPE nVersion;   /**< OMX specification version info */
++    OMX_U32 nPortIndex;         /**< Port that this struct applies to */
++    OMX_S32 xColorMatrix[3][3]; /**< Stored in signed Q16 format */
++    OMX_S32 xColorOffset[4];    /**< Stored in signed Q16 format */
++}OMX_CONFIG_COLORCONVERSIONTYPE;
++
++
++/**
++ * Structure defining percent to scale each frame dimension.  For example:
++ * To make the width 50% larger, use fWidth = 1.5 and to make the width
++ * 1/2 the original size, use fWidth = 0.5
++ */
++typedef struct OMX_CONFIG_SCALEFACTORTYPE {
++    OMX_U32 nSize;            /**< Size of the structure in bytes */
++    OMX_VERSIONTYPE nVersion; /**< OMX specification version info */
++    OMX_U32 nPortIndex;       /**< Port that this struct applies to */
++    OMX_S32 xWidth;           /**< Fixed point value stored as Q16 */
++    OMX_S32 xHeight;          /**< Fixed point value stored as Q16 */
++}OMX_CONFIG_SCALEFACTORTYPE;
++
++
++/**
++ * Enumeration of possible image filter types
++ */
++typedef enum OMX_IMAGEFILTERTYPE {
++    OMX_ImageFilterNone,
++    OMX_ImageFilterNoise,
++    OMX_ImageFilterEmboss,
++    OMX_ImageFilterNegative,
++    OMX_ImageFilterSketch,
++    OMX_ImageFilterOilPaint,
++    OMX_ImageFilterHatch,
++    OMX_ImageFilterGpen,
++    OMX_ImageFilterAntialias,
++    OMX_ImageFilterDeRing,
++    OMX_ImageFilterSolarize,
++    OMX_ImageFilterKhronosExtensions = 0x6F000000, /**< Reserved region for introducing Khronos Standard Extensions */
++    OMX_ImageFilterVendorStartUnused = 0x7F000000, /**< Reserved region for introducing Vendor Extensions */
++    OMX_ImageFilterMax = 0x7FFFFFFF
++} OMX_IMAGEFILTERTYPE;
++
++
++/**
++ * Image filter configuration
++ *
++ * STRUCT MEMBERS:
++ *  nSize        : Size of the structure in bytes
++ *  nVersion     : OMX specification version information
++ *  nPortIndex   : Port that this structure applies to
++ *  eImageFilter : Image filter type enumeration
++ */
++typedef struct OMX_CONFIG_IMAGEFILTERTYPE {
++    OMX_U32 nSize;
++    OMX_VERSIONTYPE nVersion;
++    OMX_U32 nPortIndex;
++    OMX_IMAGEFILTERTYPE eImageFilter;
++} OMX_CONFIG_IMAGEFILTERTYPE;
++
++
++/**
++ * Customized U and V for color enhancement
++ *
++ * STRUCT MEMBERS:
++ *  nSize             : Size of the structure in bytes
++ *  nVersion          : OMX specification version information
++ *  nPortIndex        : Port that this structure applies to
++ *  bColorEnhancement : Enable/disable color enhancement
++ *  nCustomizedU      : Practical values: 16-240, range: 0-255, value set for
++ *                      U component
++ *  nCustomizedV      : Practical values: 16-240, range: 0-255, value set for
++ *                      V component
++ */
++typedef struct OMX_CONFIG_COLORENHANCEMENTTYPE {
++    OMX_U32 nSize;
++    OMX_VERSIONTYPE nVersion;
++    OMX_U32 nPortIndex;
++    OMX_BOOL bColorEnhancement;
++    OMX_U8 nCustomizedU;
++    OMX_U8 nCustomizedV;
++} OMX_CONFIG_COLORENHANCEMENTTYPE;
++
++
++/**
++ * Define color key and color key mask
++ *
++ * STRUCT MEMBERS:
++ *  nSize      : Size of the structure in bytes
++ *  nVersion   : OMX specification version information
++ *  nPortIndex : Port that this structure applies to
++ *  nARGBColor : 32bit Alpha, Red, Green, Blue Color
++ *  nARGBMask  : 32bit Mask for Alpha, Red, Green, Blue channels
++ */
++typedef struct OMX_CONFIG_COLORKEYTYPE {
++    OMX_U32 nSize;
++    OMX_VERSIONTYPE nVersion;
++    OMX_U32 nPortIndex;
++    OMX_U32 nARGBColor;
++    OMX_U32 nARGBMask;
++} OMX_CONFIG_COLORKEYTYPE;
++
++
++/**
++ * List of color blend types for pre/post processing
++ *
++ * ENUMS:
++ *  None          : No color blending present
++ *  AlphaConstant : Function is (alpha_constant * src) +
++ *                  (1 - alpha_constant) * dst)
++ *  AlphaPerPixel : Function is (alpha * src) + (1 - alpha) * dst)
++ *  Alternate     : Function is alternating pixels from src and dst
++ *  And           : Function is (src & dst)
++ *  Or            : Function is (src | dst)
++ *  Invert        : Function is ~src
++ */
++typedef enum OMX_COLORBLENDTYPE {
++    OMX_ColorBlendNone,
++    OMX_ColorBlendAlphaConstant,
++    OMX_ColorBlendAlphaPerPixel,
++    OMX_ColorBlendAlternate,
++    OMX_ColorBlendAnd,
++    OMX_ColorBlendOr,
++    OMX_ColorBlendInvert,
++    OMX_ColorBlendKhronosExtensions = 0x6F000000, /**< Reserved region for introducing Khronos Standard Extensions */
++    OMX_ColorBlendVendorStartUnused = 0x7F000000, /**< Reserved region for introducing Vendor Extensions */
++    OMX_ColorBlendMax = 0x7FFFFFFF
++} OMX_COLORBLENDTYPE;
++
++
++/**
++ * Color blend configuration
++ *
++ * STRUCT MEMBERS:
++ *  nSize             : Size of the structure in bytes
++ *  nVersion          : OMX specification version information
++ *  nPortIndex        : Port that this structure applies to
++ *  nRGBAlphaConstant : Constant global alpha values when global alpha is used
++ *  eColorBlend       : Color blend type enumeration
++ */
++typedef struct OMX_CONFIG_COLORBLENDTYPE {
++    OMX_U32 nSize;
++    OMX_VERSIONTYPE nVersion;
++    OMX_U32 nPortIndex;
++    OMX_U32 nRGBAlphaConstant;
++    OMX_COLORBLENDTYPE  eColorBlend;
++} OMX_CONFIG_COLORBLENDTYPE;
++
++
++/**
++ * Hold frame dimension
++ *
++ * STRUCT MEMBERS:
++ *  nSize      : Size of the structure in bytes
++ *  nVersion   : OMX specification version information
++ *  nPortIndex : Port that this structure applies to
++ *  nWidth     : Frame width in pixels
++ *  nHeight    : Frame height in pixels
++ */
++typedef struct OMX_FRAMESIZETYPE {
++    OMX_U32 nSize;
++    OMX_VERSIONTYPE nVersion;
++    OMX_U32 nPortIndex;
++    OMX_U32 nWidth;
++    OMX_U32 nHeight;
++} OMX_FRAMESIZETYPE;
++
++
++/**
++ * Rotation configuration
++ *
++ * STRUCT MEMBERS:
++ *  nSize      : Size of the structure in bytes
++ *  nVersion   : OMX specification version information
++ *  nPortIndex : Port that this structure applies to
++ *  nRotation  : +/- integer rotation value
++ */
++typedef struct OMX_CONFIG_ROTATIONTYPE {
++    OMX_U32 nSize;
++    OMX_VERSIONTYPE nVersion;
++    OMX_U32 nPortIndex;
++    OMX_S32 nRotation;
++} OMX_CONFIG_ROTATIONTYPE;
++
++
++/**
++ * Possible mirroring directions for pre/post processing
++ *
++ * ENUMS:
++ *  None       : No mirroring
++ *  Vertical   : Vertical mirroring, flip on X axis
++ *  Horizontal : Horizontal mirroring, flip on Y axis
++ *  Both       : Both vertical and horizontal mirroring
++ */
++typedef enum OMX_MIRRORTYPE {
++    OMX_MirrorNone = 0,
++    OMX_MirrorVertical,
++    OMX_MirrorHorizontal,
++    OMX_MirrorBoth,
++    OMX_MirrorKhronosExtensions = 0x6F000000, /**< Reserved region for introducing Khronos Standard Extensions */
++    OMX_MirrorVendorStartUnused = 0x7F000000, /**< Reserved region for introducing Vendor Extensions */
++    OMX_MirrorMax = 0x7FFFFFFF
++} OMX_MIRRORTYPE;
++
++
++/**
++ * Mirroring configuration
++ *
++ * STRUCT MEMBERS:
++ *  nSize      : Size of the structure in bytes
++ *  nVersion   : OMX specification version information
++ *  nPortIndex : Port that this structure applies to
++ *  eMirror    : Mirror type enumeration
++ */
++typedef struct OMX_CONFIG_MIRRORTYPE {
++    OMX_U32 nSize;
++    OMX_VERSIONTYPE nVersion;
++    OMX_U32 nPortIndex;
++    OMX_MIRRORTYPE  eMirror;
++} OMX_CONFIG_MIRRORTYPE;
++
++
++/**
++ * Position information only
++ *
++ * STRUCT MEMBERS:
++ *  nSize      : Size of the structure in bytes
++ *  nVersion   : OMX specification version information
++ *  nPortIndex : Port that this structure applies to
++ *  nX         : X coordinate for the point
++ *  nY         : Y coordinate for the point
++ */
++typedef struct OMX_CONFIG_POINTTYPE {
++    OMX_U32 nSize;
++    OMX_VERSIONTYPE nVersion;
++    OMX_U32 nPortIndex;
++    OMX_S32 nX;
++    OMX_S32 nY;
++} OMX_CONFIG_POINTTYPE;
++
++
++/**
++ * Frame size plus position
++ *
++ * STRUCT MEMBERS:
++ *  nSize      : Size of the structure in bytes
++ *  nVersion   : OMX specification version information
++ *  nPortIndex : Port that this structure applies to
++ *  nLeft      : X Coordinate of the top left corner of the rectangle
++ *  nTop       : Y Coordinate of the top left corner of the rectangle
++ *  nWidth     : Width of the rectangle
++ *  nHeight    : Height of the rectangle
++ */
++typedef struct OMX_CONFIG_RECTTYPE {
++    OMX_U32 nSize;
++    OMX_VERSIONTYPE nVersion;
++    OMX_U32 nPortIndex;
++    OMX_S32 nLeft;
++    OMX_S32 nTop;
++    OMX_U32 nWidth;
++    OMX_U32 nHeight;
++} OMX_CONFIG_RECTTYPE;
++
++
++/**
++ * Deblocking state; it is required to be set up before starting the codec
++ *
++ * STRUCT MEMBERS:
++ *  nSize       : Size of the structure in bytes
++ *  nVersion    : OMX specification version information
++ *  nPortIndex  : Port that this structure applies to
++ *  bDeblocking : Enable/disable deblocking mode
++ */
++typedef struct OMX_PARAM_DEBLOCKINGTYPE {
++    OMX_U32 nSize;
++    OMX_VERSIONTYPE nVersion;
++    OMX_U32 nPortIndex;
++    OMX_BOOL bDeblocking;
++} OMX_PARAM_DEBLOCKINGTYPE;
++
++
++/**
++ * Stabilization state
++ *
++ * STRUCT MEMBERS:
++ *  nSize      : Size of the structure in bytes
++ *  nVersion   : OMX specification version information
++ *  nPortIndex : Port that this structure applies to
++ *  bStab      : Enable/disable frame stabilization state
++ */
++typedef struct OMX_CONFIG_FRAMESTABTYPE {
++    OMX_U32 nSize;
++    OMX_VERSIONTYPE nVersion;
++    OMX_U32 nPortIndex;
++    OMX_BOOL bStab;
++} OMX_CONFIG_FRAMESTABTYPE;
++
++
++/**
++ * White Balance control type
++ *
++ * STRUCT MEMBERS:
++ *  SunLight : Referenced in JSR-234
++ *  Flash    : Optimal for device's integrated flash
++ */
++typedef enum OMX_WHITEBALCONTROLTYPE {
++    OMX_WhiteBalControlOff = 0,
++    OMX_WhiteBalControlAuto,
++    OMX_WhiteBalControlSunLight,
++    OMX_WhiteBalControlCloudy,
++    OMX_WhiteBalControlShade,
++    OMX_WhiteBalControlTungsten,
++    OMX_WhiteBalControlFluorescent,
++    OMX_WhiteBalControlIncandescent,
++    OMX_WhiteBalControlFlash,
++    OMX_WhiteBalControlHorizon,
++    OMX_WhiteBalControlKhronosExtensions = 0x6F000000, /**< Reserved region for introducing Khronos Standard Extensions */
++    OMX_WhiteBalControlVendorStartUnused = 0x7F000000, /**< Reserved region for introducing Vendor Extensions */
++    OMX_WhiteBalControlMax = 0x7FFFFFFF
++} OMX_WHITEBALCONTROLTYPE;
++
++
++/**
++ * White Balance control configuration
++ *
++ * STRUCT MEMBERS:
++ *  nSize            : Size of the structure in bytes
++ *  nVersion         : OMX specification version information
++ *  nPortIndex       : Port that this structure applies to
++ *  eWhiteBalControl : White balance enumeration
++ */
++typedef struct OMX_CONFIG_WHITEBALCONTROLTYPE {
++    OMX_U32 nSize;
++    OMX_VERSIONTYPE nVersion;
++    OMX_U32 nPortIndex;
++    OMX_WHITEBALCONTROLTYPE eWhiteBalControl;
++} OMX_CONFIG_WHITEBALCONTROLTYPE;
++
++
++/**
++ * Exposure control type
++ */
++typedef enum OMX_EXPOSURECONTROLTYPE {
++    OMX_ExposureControlOff = 0,
++    OMX_ExposureControlAuto,
++    OMX_ExposureControlNight,
++    OMX_ExposureControlBackLight,
++    OMX_ExposureControlSpotLight,
++    OMX_ExposureControlSports,
++    OMX_ExposureControlSnow,
++    OMX_ExposureControlBeach,
++    OMX_ExposureControlLargeAperture,
++    OMX_ExposureControlSmallApperture,
++    OMX_ExposureControlKhronosExtensions = 0x6F000000, /**< Reserved region for introducing Khronos Standard Extensions */
++    OMX_ExposureControlVendorStartUnused = 0x7F000000, /**< Reserved region for introducing Vendor Extensions */
++    OMX_ExposureControlMax = 0x7FFFFFFF
++} OMX_EXPOSURECONTROLTYPE;
++
++
++/**
++ * White Balance control configuration
++ *
++ * STRUCT MEMBERS:
++ *  nSize            : Size of the structure in bytes
++ *  nVersion         : OMX specification version information
++ *  nPortIndex       : Port that this structure applies to
++ *  eExposureControl : Exposure control enumeration
++ */
++typedef struct OMX_CONFIG_EXPOSURECONTROLTYPE {
++    OMX_U32 nSize;
++    OMX_VERSIONTYPE nVersion;
++    OMX_U32 nPortIndex;
++    OMX_EXPOSURECONTROLTYPE eExposureControl;
++} OMX_CONFIG_EXPOSURECONTROLTYPE;
++
++
++/**
++ * Defines sensor supported mode.
++ *
++ * STRUCT MEMBERS:
++ *  nSize      : Size of the structure in bytes
++ *  nVersion   : OMX specification version information
++ *  nPortIndex : Port that this structure applies to
++ *  nFrameRate : Single shot mode is indicated by a 0
++ *  bOneShot   : Enable for single shot, disable for streaming
++ *  sFrameSize : Framesize
++ */
++typedef struct OMX_PARAM_SENSORMODETYPE {
++    OMX_U32 nSize;
++    OMX_VERSIONTYPE nVersion;
++    OMX_U32 nPortIndex;
++    OMX_U32 nFrameRate;
++    OMX_BOOL bOneShot;
++    OMX_FRAMESIZETYPE sFrameSize;
++} OMX_PARAM_SENSORMODETYPE;
++
++
++/**
++ * Defines contrast level
++ *
++ * STRUCT MEMBERS:
++ *  nSize      : Size of the structure in bytes
++ *  nVersion   : OMX specification version information
++ *  nPortIndex : Port that this structure applies to
++ *  nContrast  : Values allowed for contrast -100 to 100, zero means no change
++ */
++typedef struct OMX_CONFIG_CONTRASTTYPE {
++    OMX_U32 nSize;
++    OMX_VERSIONTYPE nVersion;
++    OMX_U32 nPortIndex;
++    OMX_S32 nContrast;
++} OMX_CONFIG_CONTRASTTYPE;
++
++
++/**
++ * Defines brightness level
++ *
++ * STRUCT MEMBERS:
++ *  nSize       : Size of the structure in bytes
++ *  nVersion    : OMX specification version information
++ *  nPortIndex  : Port that this structure applies to
++ *  nBrightness : 0-100%
++ */
++typedef struct OMX_CONFIG_BRIGHTNESSTYPE {
++    OMX_U32 nSize;
++    OMX_VERSIONTYPE nVersion;
++    OMX_U32 nPortIndex;
++    OMX_U32 nBrightness;
++} OMX_CONFIG_BRIGHTNESSTYPE;
++
++
++/**
++ * Defines backlight level configuration for a video sink, e.g. LCD panel
++ *
++ * STRUCT MEMBERS:
++ *  nSize      : Size of the structure in bytes
++ *  nVersion   : OMX specification version information
++ *  nPortIndex : Port that this structure applies to
++ *  nBacklight : Values allowed for backlight 0-100%
++ *  nTimeout   : Number of milliseconds before backlight automatically turns
++ *               off.  A value of 0x0 disables backight timeout
++ */
++typedef struct OMX_CONFIG_BACKLIGHTTYPE {
++    OMX_U32 nSize;
++    OMX_VERSIONTYPE nVersion;
++    OMX_U32 nPortIndex;
++    OMX_U32 nBacklight;
++    OMX_U32 nTimeout;
++} OMX_CONFIG_BACKLIGHTTYPE;
++
++
++/**
++ * Defines setting for Gamma
++ *
++ * STRUCT MEMBERS:
++ *  nSize      : Size of the structure in bytes
++ *  nVersion   : OMX specification version information
++ *  nPortIndex : Port that this structure applies to
++ *  nGamma     : Values allowed for gamma -100 to 100, zero means no change
++ */
++typedef struct OMX_CONFIG_GAMMATYPE {
++    OMX_U32 nSize;
++    OMX_VERSIONTYPE nVersion;
++    OMX_U32 nPortIndex;
++    OMX_S32 nGamma;
++} OMX_CONFIG_GAMMATYPE;
++
++
++/**
++ * Define for setting saturation
++ *
++ * STRUCT MEMBERS:
++ *  nSize       : Size of the structure in bytes
++ *  nVersion    : OMX specification version information
++ *  nPortIndex  : Port that this structure applies to
++ *  nSaturation : Values allowed for saturation -100 to 100, zero means
++ *                no change
++ */
++typedef struct OMX_CONFIG_SATURATIONTYPE {
++    OMX_U32 nSize;
++    OMX_VERSIONTYPE nVersion;
++    OMX_U32 nPortIndex;
++    OMX_S32 nSaturation;
++} OMX_CONFIG_SATURATIONTYPE;
++
++
++/**
++ * Define for setting Lightness
++ *
++ * STRUCT MEMBERS:
++ *  nSize      : Size of the structure in bytes
++ *  nVersion   : OMX specification version information
++ *  nPortIndex : Port that this structure applies to
++ *  nLightness : Values allowed for lightness -100 to 100, zero means no
++ *               change
++ */
++typedef struct OMX_CONFIG_LIGHTNESSTYPE {
++    OMX_U32 nSize;
++    OMX_VERSIONTYPE nVersion;
++    OMX_U32 nPortIndex;
++    OMX_S32 nLightness;
++} OMX_CONFIG_LIGHTNESSTYPE;
++
++
++/**
++ * Plane blend configuration
++ *
++ * STRUCT MEMBERS:
++ *  nSize      : Size of the structure in bytes
++ *  nVersion   : OMX specification version information
++ *  nPortIndex : Index of input port associated with the plane.
++ *  nDepth     : Depth of the plane in relation to the screen. Higher
++ *               numbered depths are "behind" lower number depths.
++ *               This number defaults to the Port Index number.
++ *  nAlpha     : Transparency blending component for the entire plane.
++ *               See blending modes for more detail.
++ */
++typedef struct OMX_CONFIG_PLANEBLENDTYPE {
++    OMX_U32 nSize;
++    OMX_VERSIONTYPE nVersion;
++    OMX_U32 nPortIndex;
++    OMX_U32 nDepth;
++    OMX_U32 nAlpha;
++} OMX_CONFIG_PLANEBLENDTYPE;
++
++
++/**
++ * Define interlace type
++ *
++ * STRUCT MEMBERS:
++ *  nSize                 : Size of the structure in bytes
++ *  nVersion              : OMX specification version information
++ *  nPortIndex            : Port that this structure applies to
++ *  bEnable               : Enable control variable for this functionality
++ *                          (see below)
++ *  nInterleavePortIndex  : Index of input or output port associated with
++ *                          the interleaved plane.
++ *  pPlanarPortIndexes[4] : Index of input or output planar ports.
++ */
++typedef struct OMX_PARAM_INTERLEAVETYPE {
++    OMX_U32 nSize;
++    OMX_VERSIONTYPE nVersion;
++    OMX_U32 nPortIndex;
++    OMX_BOOL bEnable;
++    OMX_U32 nInterleavePortIndex;
++} OMX_PARAM_INTERLEAVETYPE;
++
++
++/**
++ * Defines the picture effect used for an input picture
++ */
++typedef enum OMX_TRANSITIONEFFECTTYPE {
++    OMX_EffectNone,
++    OMX_EffectFadeFromBlack,
++    OMX_EffectFadeToBlack,
++    OMX_EffectUnspecifiedThroughConstantColor,
++    OMX_EffectDissolve,
++    OMX_EffectWipe,
++    OMX_EffectUnspecifiedMixOfTwoScenes,
++    OMX_EffectKhronosExtensions = 0x6F000000, /**< Reserved region for introducing Khronos Standard Extensions */
++    OMX_EffectVendorStartUnused = 0x7F000000, /**< Reserved region for introducing Vendor Extensions */
++    OMX_EffectMax = 0x7FFFFFFF
++} OMX_TRANSITIONEFFECTTYPE;
++
++
++/**
++ * Structure used to configure current transition effect
++ *
++ * STRUCT MEMBERS:
++ * nSize      : Size of the structure in bytes
++ * nVersion   : OMX specification version information
++ * nPortIndex : Port that this structure applies to
++ * eEffect    : Effect to enable
++ */
++typedef struct OMX_CONFIG_TRANSITIONEFFECTTYPE {
++    OMX_U32 nSize;
++    OMX_VERSIONTYPE nVersion;
++    OMX_U32 nPortIndex;
++    OMX_TRANSITIONEFFECTTYPE eEffect;
++} OMX_CONFIG_TRANSITIONEFFECTTYPE;
++
++
++/**
++ * Defines possible data unit types for encoded video data. The data unit
++ * types are used both for encoded video input for playback as well as
++ * encoded video output from recording.
++ */
++typedef enum OMX_DATAUNITTYPE {
++    OMX_DataUnitCodedPicture,
++    OMX_DataUnitVideoSegment,
++    OMX_DataUnitSeveralSegments,
++    OMX_DataUnitArbitraryStreamSection,
++    OMX_DataUnitKhronosExtensions = 0x6F000000, /**< Reserved region for introducing Khronos Standard Extensions */
++    OMX_DataUnitVendorStartUnused = 0x7F000000, /**< Reserved region for introducing Vendor Extensions */
++    OMX_DataUnitMax = 0x7FFFFFFF
++} OMX_DATAUNITTYPE;
++
++
++/**
++ * Defines possible encapsulation types for coded video data unit. The
++ * encapsulation information is used both for encoded video input for
++ * playback as well as encoded video output from recording.
++ */
++typedef enum OMX_DATAUNITENCAPSULATIONTYPE {
++    OMX_DataEncapsulationElementaryStream,
++    OMX_DataEncapsulationGenericPayload,
++    OMX_DataEncapsulationRtpPayload,
++    OMX_DataEncapsulationKhronosExtensions = 0x6F000000, /**< Reserved region for introducing Khronos Standard Extensions */
++    OMX_DataEncapsulationVendorStartUnused = 0x7F000000, /**< Reserved region for introducing Vendor Extensions */
++    OMX_DataEncapsulationMax = 0x7FFFFFFF
++} OMX_DATAUNITENCAPSULATIONTYPE;
++
++
++/**
++ * Structure used to configure the type of being decoded/encoded
++ */
++typedef struct OMX_PARAM_DATAUNITTYPE {
++    OMX_U32 nSize;            /**< Size of the structure in bytes */
++    OMX_VERSIONTYPE nVersion; /**< OMX specification version information */
++    OMX_U32 nPortIndex;       /**< Port that this structure applies to */
++    OMX_DATAUNITTYPE eUnitType;
++    OMX_DATAUNITENCAPSULATIONTYPE eEncapsulationType;
++} OMX_PARAM_DATAUNITTYPE;
++
++
++/**
++ * Defines dither types
++ */
++typedef enum OMX_DITHERTYPE {
++    OMX_DitherNone,
++    OMX_DitherOrdered,
++    OMX_DitherErrorDiffusion,
++    OMX_DitherOther,
++    OMX_DitherKhronosExtensions = 0x6F000000, /**< Reserved region for introducing Khronos Standard Extensions */
++    OMX_DitherVendorStartUnused = 0x7F000000, /**< Reserved region for introducing Vendor Extensions */
++    OMX_DitherMax = 0x7FFFFFFF
++} OMX_DITHERTYPE;
++
++
++/**
++ * Structure used to configure current type of dithering
++ */
++typedef struct OMX_CONFIG_DITHERTYPE {
++    OMX_U32 nSize;            /**< Size of the structure in bytes */
++    OMX_VERSIONTYPE nVersion; /**< OMX specification version information */
++    OMX_U32 nPortIndex;       /**< Port that this structure applies to */
++    OMX_DITHERTYPE eDither;   /**< Type of dithering to use */
++} OMX_CONFIG_DITHERTYPE;
++
++typedef struct OMX_CONFIG_CAPTUREMODETYPE {
++    OMX_U32 nSize;
++    OMX_VERSIONTYPE nVersion;
++    OMX_U32 nPortIndex;     /**< Port that this structure applies to */
++    OMX_BOOL bContinuous;   /**< If true then ignore frame rate and emit capture
++                             *   data as fast as possible (otherwise obey port's frame rate). */
++    OMX_BOOL bFrameLimited; /**< If true then terminate capture after the port emits the
++                             *   specified number of frames (otherwise the port does not
++                             *   terminate the capture until instructed to do so by the client).
++                             *   Even if set, the client may manually terminate the capture prior
++                             *   to reaching the limit. */
++    OMX_U32 nFrameLimit;      /**< Limit on number of frames emitted during a capture (only
++                               *   valid if bFrameLimited is set). */
++} OMX_CONFIG_CAPTUREMODETYPE;
++
++typedef enum OMX_METERINGTYPE {
++
++    OMX_MeteringModeAverage,     /**< Center-weighted average metering. */
++    OMX_MeteringModeSpot,	      /**< Spot (partial) metering. */
++    OMX_MeteringModeMatrix,      /**< Matrix or evaluative metering. */
++
++    OMX_MeteringKhronosExtensions = 0x6F000000, /**< Reserved region for introducing Khronos Standard Extensions */
++    OMX_MeteringVendorStartUnused = 0x7F000000, /**< Reserved region for introducing Vendor Extensions */
++    OMX_EVModeMax = 0x7fffffff
++} OMX_METERINGTYPE;
++
++typedef struct OMX_CONFIG_EXPOSUREVALUETYPE {
++    OMX_U32 nSize;
++    OMX_VERSIONTYPE nVersion;
++    OMX_U32 nPortIndex;
++    OMX_METERINGTYPE eMetering;
++    OMX_S32 xEVCompensation;      /**< Fixed point value stored as Q16 */
++    OMX_U32 nApertureFNumber;     /**< e.g. nApertureFNumber = 2 implies "f/2" - Q16 format */
++    OMX_BOOL bAutoAperture;		/**< Whether aperture number is defined automatically */
++    OMX_U32 nShutterSpeedMsec;    /**< Shutterspeed in milliseconds */
++    OMX_BOOL bAutoShutterSpeed;	/**< Whether shutter speed is defined automatically */
++    OMX_U32 nSensitivity;         /**< e.g. nSensitivity = 100 implies "ISO 100" */
++    OMX_BOOL bAutoSensitivity;	/**< Whether sensitivity is defined automatically */
++} OMX_CONFIG_EXPOSUREVALUETYPE;
++
++/**
++ * Focus region configuration
++ *
++ * STRUCT MEMBERS:
++ *  nSize           : Size of the structure in bytes
++ *  nVersion        : OMX specification version information
++ *  nPortIndex      : Port that this structure applies to
++ *  bCenter         : Use center region as focus region of interest
++ *  bLeft           : Use left region as focus region of interest
++ *  bRight          : Use right region as focus region of interest
++ *  bTop            : Use top region as focus region of interest
++ *  bBottom         : Use bottom region as focus region of interest
++ *  bTopLeft        : Use top left region as focus region of interest
++ *  bTopRight       : Use top right region as focus region of interest
++ *  bBottomLeft     : Use bottom left region as focus region of interest
++ *  bBottomRight    : Use bottom right region as focus region of interest
++ */
++typedef struct OMX_CONFIG_FOCUSREGIONTYPE {
++    OMX_U32 nSize;
++    OMX_VERSIONTYPE nVersion;
++    OMX_U32 nPortIndex;
++    OMX_BOOL bCenter;
++    OMX_BOOL bLeft;
++    OMX_BOOL bRight;
++    OMX_BOOL bTop;
++    OMX_BOOL bBottom;
++    OMX_BOOL bTopLeft;
++    OMX_BOOL bTopRight;
++    OMX_BOOL bBottomLeft;
++    OMX_BOOL bBottomRight;
++} OMX_CONFIG_FOCUSREGIONTYPE;
++
++/**
++ * Focus Status type
++ */
++typedef enum OMX_FOCUSSTATUSTYPE {
++    OMX_FocusStatusOff = 0,
++    OMX_FocusStatusRequest,
++    OMX_FocusStatusReached,
++    OMX_FocusStatusUnableToReach,
++    OMX_FocusStatusLost,
++    OMX_FocusStatusKhronosExtensions = 0x6F000000, /**< Reserved region for introducing Khronos Standard Extensions */
++    OMX_FocusStatusVendorStartUnused = 0x7F000000, /**< Reserved region for introducing Vendor Extensions */
++    OMX_FocusStatusMax = 0x7FFFFFFF
++} OMX_FOCUSSTATUSTYPE;
++
++/**
++ * Focus status configuration
++ *
++ * STRUCT MEMBERS:
++ *  nSize               : Size of the structure in bytes
++ *  nVersion            : OMX specification version information
++ *  nPortIndex          : Port that this structure applies to
++ *  eFocusStatus        : Specifies the focus status
++ *  bCenterStatus       : Use center region as focus region of interest
++ *  bLeftStatus         : Use left region as focus region of interest
++ *  bRightStatus        : Use right region as focus region of interest
++ *  bTopStatus          : Use top region as focus region of interest
++ *  bBottomStatus       : Use bottom region as focus region of interest
++ *  bTopLeftStatus      : Use top left region as focus region of interest
++ *  bTopRightStatus     : Use top right region as focus region of interest
++ *  bBottomLeftStatus   : Use bottom left region as focus region of interest
++ *  bBottomRightStatus  : Use bottom right region as focus region of interest
++ */
++typedef struct OMX_PARAM_FOCUSSTATUSTYPE {
++    OMX_U32 nSize;
++    OMX_VERSIONTYPE nVersion;
++    OMX_U32 nPortIndex;
++    OMX_FOCUSSTATUSTYPE eFocusStatus;
++    OMX_BOOL bCenterStatus;
++    OMX_BOOL bLeftStatus;
++    OMX_BOOL bRightStatus;
++    OMX_BOOL bTopStatus;
++    OMX_BOOL bBottomStatus;
++    OMX_BOOL bTopLeftStatus;
++    OMX_BOOL bTopRightStatus;
++    OMX_BOOL bBottomLeftStatus;
++    OMX_BOOL bBottomRightStatus;
++} OMX_PARAM_FOCUSSTATUSTYPE;
++
++/** @} */
++
++#ifdef __cplusplus
++}
++#endif /* __cplusplus */
++
++#endif
++/* File EOF */
+diff -rupN a/usr/include/OpenMAX/il/OMX_Other.h b/usr/include/OpenMAX/il/OMX_Other.h
+--- a/usr/include/OpenMAX/il/OMX_Other.h	1970-01-01 01:00:00.000000000 +0100
++++ b/usr/include/OpenMAX/il/OMX_Other.h	2011-08-09 09:08:06.000000000 +0200
+@@ -0,0 +1,337 @@
++/*
++ * Copyright (c) 2008 The Khronos Group Inc.
++ *
++ * Permission is hereby granted, free of charge, to any person obtaining
++ * a copy of this software and associated documentation files (the
++ * "Software"), to deal in the Software without restriction, including
++ * without limitation the rights to use, copy, modify, merge, publish,
++ * distribute, sublicense, and/or sell copies of the Software, and to
++ * permit persons to whom the Software is furnished to do so, subject
++ * to the following conditions:
++ * The above copyright notice and this permission notice shall be included
++ * in all copies or substantial portions of the Software.
++ *
++ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS
++ * OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
++ * MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
++ * IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
++ * CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
++ * TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
++ * SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
++ *
++ */
++
++/** @file OMX_Other.h - OpenMax IL version 1.1.2
++ *  The structures needed by Other components to exchange
++ *  parameters and configuration data with the components.
++ */
++
++#ifndef OMX_Other_h
++#define OMX_Other_h
++
++#ifdef __cplusplus
++extern "C" {
++#endif /* __cplusplus */
++
++
++/* Each OMX header must include all required header files to allow the
++ *  header to compile without errors.  The includes below are required
++ *  for this header file to compile successfully
++ */
++
++#include <OMX_Core.h>
++
++
++/**
++ * Enumeration of possible data types which match to multiple domains or no
++ * domain at all.  For types which are vendor specific, a value above
++ * OMX_OTHER_VENDORTSTART should be used.
++ */
++typedef enum OMX_OTHER_FORMATTYPE {
++    OMX_OTHER_FormatTime = 0, /**< Transmission of various timestamps, elapsed time,
++                                   time deltas, etc */
++    OMX_OTHER_FormatPower,    /**< Perhaps used for enabling/disabling power
++                                   management, setting clocks? */
++    OMX_OTHER_FormatStats,    /**< Could be things such as frame rate, frames
++                                   dropped, etc */
++    OMX_OTHER_FormatBinary,   /**< Arbitrary binary data */
++    OMX_OTHER_FormatVendorReserved = 1000, /**< Starting value for vendor specific
++                                                formats */
++
++    OMX_OTHER_FormatKhronosExtensions = 0x6F000000, /**< Reserved region for introducing Khronos Standard Extensions */
++    OMX_OTHER_FormatVendorStartUnused = 0x7F000000, /**< Reserved region for introducing Vendor Extensions */
++    OMX_OTHER_FormatMax = 0x7FFFFFFF
++} OMX_OTHER_FORMATTYPE;
++
++/**
++ * Enumeration of seek modes.
++ */
++typedef enum OMX_TIME_SEEKMODETYPE {
++    OMX_TIME_SeekModeFast = 0, /**< Prefer seeking to an approximation
++                                * of the requested seek position over
++                                * the actual seek position if it
++                                * results in a faster seek. */
++    OMX_TIME_SeekModeAccurate, /**< Prefer seeking to the actual seek
++                                * position over an approximation
++                                * of the requested seek position even
++                                * if it results in a slower seek. */
++    OMX_TIME_SeekModeKhronosExtensions = 0x6F000000, /**< Reserved region for introducing Khronos Standard Extensions */
++    OMX_TIME_SeekModeVendorStartUnused = 0x7F000000, /**< Reserved region for introducing Vendor Extensions */
++    OMX_TIME_SeekModeMax = 0x7FFFFFFF
++} OMX_TIME_SEEKMODETYPE;
++
++/* Structure representing the seekmode of the component */
++typedef struct OMX_TIME_CONFIG_SEEKMODETYPE {
++    OMX_U32 nSize;                  /**< size of the structure in bytes */
++    OMX_VERSIONTYPE nVersion;       /**< OMX specification version information */
++    OMX_TIME_SEEKMODETYPE eType;    /**< The seek mode */
++} OMX_TIME_CONFIG_SEEKMODETYPE;
++
++/** Structure representing a time stamp used with the following configs
++ * on the Clock Component (CC):
++ *
++ * OMX_IndexConfigTimeCurrentWallTime: query of the CC?s current wall
++ *     time
++ * OMX_IndexConfigTimeCurrentMediaTime: query of the CC?s current media
++ *     time
++ * OMX_IndexConfigTimeCurrentAudioReference and
++ * OMX_IndexConfigTimeCurrentVideoReference: audio/video reference
++ *     clock sending SC its reference time
++ * OMX_IndexConfigTimeClientStartTime: a Clock Component client sends
++ *     this structure to the Clock Component via a SetConfig on its
++ *     client port when it receives a buffer with
++ *     OMX_BUFFERFLAG_STARTTIME set. It must use the timestamp
++ *     specified by that buffer for nStartTimestamp.
++ *
++ * It?s also used with the following config on components in general:
++ *
++ * OMX_IndexConfigTimePosition: IL client querying component position
++ * (GetConfig) or commanding a component to seek to the given location
++ * (SetConfig)
++ */
++typedef struct OMX_TIME_CONFIG_TIMESTAMPTYPE {
++    OMX_U32 nSize;               /**< size of the structure in bytes */
++    OMX_VERSIONTYPE nVersion;    /**< OMX specification version
++                                  *   information */
++    OMX_U32 nPortIndex;     /**< port that this structure applies to */
++    OMX_TICKS nTimestamp;	     /**< timestamp .*/
++} OMX_TIME_CONFIG_TIMESTAMPTYPE;
++
++/** Enumeration of possible reference clocks to the media time. */
++typedef enum OMX_TIME_UPDATETYPE {
++      OMX_TIME_UpdateRequestFulfillment,    /**< Update is the fulfillment of a media time request. */
++      OMX_TIME_UpdateScaleChanged,	        /**< Update was generated because the scale chagned. */
++      OMX_TIME_UpdateClockStateChanged,     /**< Update was generated because the clock state changed. */
++      OMX_TIME_UpdateKhronosExtensions = 0x6F000000, /**< Reserved region for introducing Khronos Standard Extensions */
++      OMX_TIME_UpdateVendorStartUnused = 0x7F000000, /**< Reserved region for introducing Vendor Extensions */
++      OMX_TIME_UpdateMax = 0x7FFFFFFF
++} OMX_TIME_UPDATETYPE;
++
++/** Enumeration of possible reference clocks to the media time. */
++typedef enum OMX_TIME_REFCLOCKTYPE {
++      OMX_TIME_RefClockNone,    /**< Use no references. */
++      OMX_TIME_RefClockAudio,	/**< Use references sent through OMX_IndexConfigTimeCurrentAudioReference */
++      OMX_TIME_RefClockVideo,   /**< Use references sent through OMX_IndexConfigTimeCurrentVideoReference */
++      OMX_TIME_RefClockKhronosExtensions = 0x6F000000, /**< Reserved region for introducing Khronos Standard Extensions */
++      OMX_TIME_RefClockVendorStartUnused = 0x7F000000, /**< Reserved region for introducing Vendor Extensions */
++      OMX_TIME_RefClockMax = 0x7FFFFFFF
++} OMX_TIME_REFCLOCKTYPE;
++
++/** Enumeration of clock states. */
++typedef enum OMX_TIME_CLOCKSTATE {
++      OMX_TIME_ClockStateRunning,             /**< Clock running. */
++      OMX_TIME_ClockStateWaitingForStartTime, /**< Clock waiting until the
++                                               *   prescribed clients emit their
++                                               *   start time. */
++      OMX_TIME_ClockStateStopped,             /**< Clock stopped. */
++      OMX_TIME_ClockStateKhronosExtensions = 0x6F000000, /**< Reserved region for introducing Khronos Standard Extensions */
++      OMX_TIME_ClockStateVendorStartUnused = 0x7F000000, /**< Reserved region for introducing Vendor Extensions */
++      OMX_TIME_ClockStateMax = 0x7FFFFFFF
++} OMX_TIME_CLOCKSTATE;
++
++/** Structure representing a media time request to the clock component.
++ *
++ *  A client component sends this structure to the Clock Component via a SetConfig
++ *  on its client port to specify a media timestamp the Clock Component
++ *  should emit.  The Clock Component should fulfill the request by sending a
++ *  OMX_TIME_MEDIATIMETYPE when its media clock matches the requested
++ *  timestamp.
++ *
++ *  The client may require a media time request be fulfilled slightly
++ *  earlier than the media time specified. In this case the client specifies
++ *  an offset which is equal to the difference between wall time corresponding
++ *  to the requested media time and the wall time when it will be
++ *  fulfilled.
++ *
++ *  A client component may uses these requests and the OMX_TIME_MEDIATIMETYPE to
++ *  time events according to timestamps. If a client must perform an operation O at
++ *  a time T (e.g. deliver a video frame at its corresponding timestamp), it makes a
++ *  media time request at T (perhaps specifying an offset to ensure the request fulfillment
++ *  is a little early). When the clock component passes the resulting OMX_TIME_MEDIATIMETYPE
++ *  structure back to the client component, the client may perform operation O (perhaps having
++ *  to wait a slight amount more time itself as specified by the return values).
++ */
++
++typedef struct OMX_TIME_CONFIG_MEDIATIMEREQUESTTYPE {
++    OMX_U32 nSize;              /**< size of the structure in bytes */
++    OMX_VERSIONTYPE nVersion;   /**< OMX specification version information */
++    OMX_U32 nPortIndex;         /**< port that this structure applies to */
++    OMX_PTR pClientPrivate;     /**< Client private data to disabiguate this media time
++                                 *   from others (e.g. the number of the frame to deliver).
++                                 *   Duplicated in the media time structure that fulfills
++                                 *   this request. A value of zero is reserved for time scale
++                                 *   updates. */
++    OMX_TICKS nMediaTimestamp;  /**< Media timestamp requested.*/
++    OMX_TICKS nOffset;          /**< Amount of wall clock time by which this
++                                 *   request should be fulfilled early */
++} OMX_TIME_CONFIG_MEDIATIMEREQUESTTYPE;
++
++/**< Structure sent from the clock component client either when fulfilling
++ *   a media time request or when the time scale has changed.
++ *
++ *   In the former case the Clock Component fills this structure and times its emission
++ *   to a client component (via the client port) according to the corresponding media
++ *   time request sent by the client. The Clock Component should time the emission to occur
++ *   when the requested timestamp matches the Clock Component's media time but also the
++ *   prescribed offset early.
++ *
++ *   Upon scale changes the clock component clears the nClientPrivate data, sends the current
++ *   media time and sets the nScale to the new scale via the client port. It emits a
++ *   OMX_TIME_MEDIATIMETYPE to all clients independent of any requests. This allows clients to
++ *   alter processing to accomodate scaling. For instance a video component might skip inter-frames
++ *   in the case of extreme fastforward. Likewise an audio component might add or remove samples
++ *   from an audio frame to scale audio data.
++ *
++ *   It is expected that some clock components may not be able to fulfill requests
++ *   at exactly the prescribed time. This is acceptable so long as the request is
++ *   fulfilled at least as early as described and not later. This structure provides
++ *   fields the client may use to wait for the remaining time.
++ *
++ *   The client may use either the nOffset or nWallTimeAtMedia fields to determine the
++ *   wall time until the nMediaTimestamp actually occurs. In the latter case the
++ *   client can get a more accurate value for offset by getting the current wall
++ *   from the cloc component and subtracting it from nWallTimeAtMedia.
++ */
++
++typedef struct OMX_TIME_MEDIATIMETYPE {
++    OMX_U32 nSize;                  /**< size of the structure in bytes */
++    OMX_VERSIONTYPE nVersion;       /**< OMX specification version information */
++    OMX_U32 nClientPrivate;         /**< Client private data to disabiguate this media time
++                                     *   from others. Copied from the media time request.
++                                     *   A value of zero is reserved for time scale updates. */
++    OMX_TIME_UPDATETYPE eUpdateType; /**< Reason for the update */
++    OMX_TICKS nMediaTimestamp;      /**< Media time requested. If no media time was
++                                     *   requested then this is the current media time. */
++    OMX_TICKS nOffset;              /**< Amount of wall clock time by which this
++                                     *   request was actually fulfilled early */
++
++    OMX_TICKS nWallTimeAtMediaTime; /**< Wall time corresponding to nMediaTimeStamp.
++                                     *   A client may compare this value to current
++                                     *   media time obtained from the Clock Component to determine
++                                     *   the wall time until the media timestamp is really
++                                     *   current. */
++    OMX_S32 xScale;                 /**< Current media time scale in Q16 format. */
++    OMX_TIME_CLOCKSTATE eState;     /* Seeking Change. Added 7/12.*/
++                                    /**< State of the media time. */
++} OMX_TIME_MEDIATIMETYPE;
++
++/** Structure representing the current media time scale factor. Applicable only to clock
++ *  component, other components see scale changes via OMX_TIME_MEDIATIMETYPE buffers sent via
++ *  the clock component client ports. Upon recieving this config the clock component changes
++ *  the rate by which the media time increases or decreases effectively implementing trick modes.
++ */
++typedef struct OMX_TIME_CONFIG_SCALETYPE {
++    OMX_U32 nSize;                  /**< size of the structure in bytes */
++    OMX_VERSIONTYPE nVersion;       /**< OMX specification version information */
++    OMX_S32 xScale;                 /**< This is a value in Q16 format which is used for
++                                     * scaling the media time */
++} OMX_TIME_CONFIG_SCALETYPE;
++
++/** Bits used to identify a clock port. Used in OMX_TIME_CONFIG_CLOCKSTATETYPE?s nWaitMask field */
++#define OMX_CLOCKPORT0 0x00000001
++#define OMX_CLOCKPORT1 0x00000002
++#define OMX_CLOCKPORT2 0x00000004
++#define OMX_CLOCKPORT3 0x00000008
++#define OMX_CLOCKPORT4 0x00000010
++#define OMX_CLOCKPORT5 0x00000020
++#define OMX_CLOCKPORT6 0x00000040
++#define OMX_CLOCKPORT7 0x00000080
++
++/** Structure representing the current mode of the media clock.
++ *  IL Client uses this config to change or query the mode of the
++ *  media clock of the clock component. Applicable only to clock
++ *  component.
++ *
++ *  On a SetConfig if eState is OMX_TIME_ClockStateRunning media time
++ *  starts immediately at the prescribed start time. If
++ *  OMX_TIME_ClockStateWaitingForStartTime the Clock Component ignores
++ *  the given nStartTime and waits for all clients specified in the
++ *  nWaitMask to send starttimes (via
++ *  OMX_IndexConfigTimeClientStartTime). The Clock Component then starts
++ *  the media clock using the earliest start time supplied. */
++typedef struct OMX_TIME_CONFIG_CLOCKSTATETYPE {
++    OMX_U32 nSize;              /**< size of the structure in bytes */
++    OMX_VERSIONTYPE nVersion;   /**< OMX specification version
++                                 *   information */
++    OMX_TIME_CLOCKSTATE eState; /**< State of the media time. */
++    OMX_TICKS nStartTime;       /**< Start time of the media time. */
++    OMX_TICKS nOffset;          /**< Time to offset the media time by
++                                 * (e.g. preroll). Media time will be
++                                 * reported to be nOffset ticks earlier.
++                                 */
++    OMX_U32 nWaitMask;          /**< Mask of OMX_CLOCKPORT values. */
++} OMX_TIME_CONFIG_CLOCKSTATETYPE;
++
++/** Structure representing the reference clock currently being used to
++ *  compute media time. IL client uses this config to change or query the
++ *  clock component's active reference clock */
++typedef struct OMX_TIME_CONFIG_ACTIVEREFCLOCKTYPE {
++    OMX_U32 nSize;                  /**< size of the structure in bytes */
++    OMX_VERSIONTYPE nVersion;       /**< OMX specification version information */
++    OMX_TIME_REFCLOCKTYPE eClock;   /**< Reference clock used to compute media time */
++} OMX_TIME_CONFIG_ACTIVEREFCLOCKTYPE;
++
++/** Descriptor for setting specifics of power type.
++ *  Note: this structure is listed for backwards compatibility. */
++typedef struct OMX_OTHER_CONFIG_POWERTYPE {
++    OMX_U32 nSize;            /**< size of the structure in bytes */
++    OMX_VERSIONTYPE nVersion; /**< OMX specification version information */
++    OMX_BOOL bEnablePM;       /**< Flag to enable Power Management */
++} OMX_OTHER_CONFIG_POWERTYPE;
++
++
++/** Descriptor for setting specifics of stats type.
++ *  Note: this structure is listed for backwards compatibility. */
++typedef struct OMX_OTHER_CONFIG_STATSTYPE {
++    OMX_U32 nSize;            /**< size of the structure in bytes */
++    OMX_VERSIONTYPE nVersion; /**< OMX specification version information */
++    /* what goes here */
++} OMX_OTHER_CONFIG_STATSTYPE;
++
++
++/**
++ * The PortDefinition structure is used to define all of the parameters
++ * necessary for the compliant component to setup an input or an output other
++ * path.
++ */
++typedef struct OMX_OTHER_PORTDEFINITIONTYPE {
++    OMX_OTHER_FORMATTYPE eFormat;  /**< Type of data expected for this channel */
++} OMX_OTHER_PORTDEFINITIONTYPE;
++
++/**  Port format parameter.  This structure is used to enumerate
++  *  the various data input/output format supported by the port.
++  */
++typedef struct OMX_OTHER_PARAM_PORTFORMATTYPE {
++    OMX_U32 nSize; /**< size of the structure in bytes */
++    OMX_VERSIONTYPE nVersion; /**< OMX specification version information */
++    OMX_U32 nPortIndex; /**< Indicates which port to set */
++    OMX_U32 nIndex; /**< Indicates the enumeration index for the format from 0x0 to N-1 */
++    OMX_OTHER_FORMATTYPE eFormat; /**< Type of data expected for this channel */
++} OMX_OTHER_PARAM_PORTFORMATTYPE;
++
++#ifdef __cplusplus
++}
++#endif /* __cplusplus */
++
++#endif
++/* File EOF */
+diff -rupN a/usr/include/OpenMAX/il/OMX_Types.h b/usr/include/OpenMAX/il/OMX_Types.h
+--- a/usr/include/OpenMAX/il/OMX_Types.h	1970-01-01 01:00:00.000000000 +0100
++++ b/usr/include/OpenMAX/il/OMX_Types.h	2011-08-09 09:08:06.000000000 +0200
+@@ -0,0 +1,359 @@
++/*
++ * Copyright (c) 2008 The Khronos Group Inc.
++ *
++ * Permission is hereby granted, free of charge, to any person obtaining
++ * a copy of this software and associated documentation files (the
++ * "Software"), to deal in the Software without restriction, including
++ * without limitation the rights to use, copy, modify, merge, publish,
++ * distribute, sublicense, and/or sell copies of the Software, and to
++ * permit persons to whom the Software is furnished to do so, subject
++ * to the following conditions:
++ * The above copyright notice and this permission notice shall be included
++ * in all copies or substantial portions of the Software.
++ *
++ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS
++ * OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
++ * MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
++ * IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
++ * CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
++ * TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
++ * SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
++ *
++ */
++
++/** OMX_Types.h - OpenMax IL version 1.1.2
++ *  The OMX_Types header file contains the primitive type definitions used by
++ *  the core, the application and the component.  This file may need to be
++ *  modified to be used on systems that do not have "char" set to 8 bits,
++ *  "short" set to 16 bits and "long" set to 32 bits.
++ */
++
++#ifndef OMX_Types_h
++#define OMX_Types_h
++
++#ifdef __cplusplus
++extern "C" {
++#endif /* __cplusplus */
++
++/** The OMX_API and OMX_APIENTRY are platform specific definitions used
++ *  to declare OMX function prototypes.  They are modified to meet the
++ *  requirements for a particular platform */
++#ifdef __SYMBIAN32__
++#   ifdef __OMX_EXPORTS
++#       define OMX_API __declspec(dllexport)
++#   else
++#       ifdef _WIN32
++#           define OMX_API __declspec(dllexport)
++#       else
++#           define OMX_API __declspec(dllimport)
++#       endif
++#   endif
++#else
++#   ifdef _WIN32
++#      ifdef __OMX_EXPORTS
++#          define OMX_API __declspec(dllexport)
++#      else
++#          define OMX_API __declspec(dllimport)
++#      endif
++#   else
++#      ifdef __OMX_EXPORTS
++#          define OMX_API
++#      else
++#          define OMX_API extern
++#      endif
++#   endif
++#endif
++
++#ifndef OMX_APIENTRY
++#define OMX_APIENTRY
++#endif
++
++/** OMX_IN is used to identify inputs to an OMX function.  This designation
++    will also be used in the case of a pointer that points to a parameter
++    that is used as an output. */
++#ifndef OMX_IN
++#define OMX_IN
++#endif
++
++/** OMX_OUT is used to identify outputs from an OMX function.  This
++    designation will also be used in the case of a pointer that points
++    to a parameter that is used as an input. */
++#ifndef OMX_OUT
++#define OMX_OUT
++#endif
++
++
++/** OMX_INOUT is used to identify parameters that may be either inputs or
++    outputs from an OMX function at the same time.  This designation will
++    also be used in the case of a pointer that  points to a parameter that
++    is used both as an input and an output. */
++#ifndef OMX_INOUT
++#define OMX_INOUT
++#endif
++
++/** OMX_ALL is used to as a wildcard to select all entities of the same type
++ *  when specifying the index, or referring to a object by an index.  (i.e.
++ *  use OMX_ALL to indicate all N channels). When used as a port index
++ *  for a config or parameter this OMX_ALL denotes that the config or
++ *  parameter applies to the entire component not just one port. */
++#define OMX_ALL 0xFFFFFFFF
++
++/** In the following we define groups that help building doxygen documentation */
++
++/** @defgroup core OpenMAX IL core
++ * Functions and structure related to the OMX IL core
++ */
++
++ /** @defgroup comp OpenMAX IL component
++ * Functions and structure related to the OMX IL component
++ */
++
++/** @defgroup rpm Resource and Policy Management
++ * Structures for resource and policy management of components
++ */
++
++/** @defgroup buf Buffer Management
++ * Buffer handling functions and structures
++ */
++
++/** @defgroup tun Tunneling
++ * @ingroup core comp
++ * Structures and functions to manage tunnels among component ports
++ */
++
++/** @defgroup cp Content Pipes
++ *  @ingroup core
++ */
++
++ /** @defgroup metadata Metadata handling
++  *
++  */
++
++/** OMX_U8 is an 8 bit unsigned quantity that is byte aligned */
++typedef unsigned char OMX_U8;
++
++/** OMX_S8 is an 8 bit signed quantity that is byte aligned */
++typedef signed char OMX_S8;
++
++/** OMX_U16 is a 16 bit unsigned quantity that is 16 bit word aligned */
++typedef unsigned short OMX_U16;
++
++/** OMX_S16 is a 16 bit signed quantity that is 16 bit word aligned */
++typedef signed short OMX_S16;
++
++/** OMX_U32 is a 32 bit unsigned quantity that is 32 bit word aligned */
++typedef unsigned long OMX_U32;
++
++/** OMX_S32 is a 32 bit signed quantity that is 32 bit word aligned */
++typedef signed long OMX_S32;
++
++
++/* Users with compilers that cannot accept the "long long" designation should
++   define the OMX_SKIP64BIT macro.  It should be noted that this may cause
++   some components to fail to compile if the component was written to require
++   64 bit integral types.  However, these components would NOT compile anyway
++   since the compiler does not support the way the component was written.
++*/
++#ifndef OMX_SKIP64BIT
++#ifdef __SYMBIAN32__
++/** OMX_U64 is a 64 bit unsigned quantity that is 64 bit word aligned */
++typedef unsigned long long OMX_U64;
++
++/** OMX_S64 is a 64 bit signed quantity that is 64 bit word aligned */
++typedef signed long long OMX_S64;
++
++#elif defined(WIN32)
++
++/** OMX_U64 is a 64 bit unsigned quantity that is 64 bit word aligned */
++typedef unsigned __int64  OMX_U64;
++
++/** OMX_S64 is a 64 bit signed quantity that is 64 bit word aligned */
++typedef signed   __int64  OMX_S64;
++
++#else /* WIN32 */
++
++/** OMX_U64 is a 64 bit unsigned quantity that is 64 bit word aligned */
++typedef unsigned long long OMX_U64;
++
++/** OMX_S64 is a 64 bit signed quantity that is 64 bit word aligned */
++typedef signed long long OMX_S64;
++
++#endif /* WIN32 */
++#endif
++
++
++/** The OMX_BOOL type is intended to be used to represent a true or a false
++    value when passing parameters to and from the OMX core and components.  The
++    OMX_BOOL is a 32 bit quantity and is aligned on a 32 bit word boundary.
++ */
++typedef enum OMX_BOOL {
++    OMX_FALSE = 0,
++    OMX_TRUE = !OMX_FALSE,
++    OMX_BOOL_MAX = 0x7FFFFFFF
++} OMX_BOOL;
++
++/** The OMX_PTR type is intended to be used to pass pointers between the OMX
++    applications and the OMX Core and components.  This is a 32 bit pointer and
++    is aligned on a 32 bit boundary.
++ */
++typedef void* OMX_PTR;
++
++/** The OMX_STRING type is intended to be used to pass "C" type strings between
++    the application and the core and component.  The OMX_STRING type is a 32
++    bit pointer to a zero terminated string.  The  pointer is word aligned and
++    the string is byte aligned.
++ */
++typedef char* OMX_STRING;
++
++/** The OMX_BYTE type is intended to be used to pass arrays of bytes such as
++    buffers between the application and the component and core.  The OMX_BYTE
++    type is a 32 bit pointer to a zero terminated string.  The  pointer is word
++    aligned and the string is byte aligned.
++ */
++typedef unsigned char* OMX_BYTE;
++
++/** OMX_UUIDTYPE is a very long unique identifier to uniquely identify
++   @runtime.  This identifier should be generated by a component in a way
++    that guarantees that every instance of the identifier running on the system
++    is unique. */
++typedef unsigned char OMX_UUIDTYPE[128];
++
++/** The OMX_DIRTYPE enumeration is used to indicate if a port is an input or
++    an output port.  This enumeration is common across all component types.
++ */
++typedef enum OMX_DIRTYPE
++{
++    OMX_DirInput,              /**< Port is an input port */
++    OMX_DirOutput,             /**< Port is an output port */
++    OMX_DirMax = 0x7FFFFFFF
++} OMX_DIRTYPE;
++
++/** The OMX_ENDIANTYPE enumeration is used to indicate the bit ordering
++    for numerical data (i.e. big endian, or little endian).
++ */
++typedef enum OMX_ENDIANTYPE
++{
++    OMX_EndianBig, /**< big endian */
++    OMX_EndianLittle, /**< little endian */
++    OMX_EndianMax = 0x7FFFFFFF
++} OMX_ENDIANTYPE;
++
++
++/** The OMX_NUMERICALDATATYPE enumeration is used to indicate if data
++    is signed or unsigned
++ */
++typedef enum OMX_NUMERICALDATATYPE
++{
++    OMX_NumericalDataSigned, /**< signed data */
++    OMX_NumericalDataUnsigned, /**< unsigned data */
++    OMX_NumercialDataMax = 0x7FFFFFFF
++} OMX_NUMERICALDATATYPE;
++
++
++/** Unsigned bounded value type */
++typedef struct OMX_BU32 {
++    OMX_U32 nValue; /**< actual value */
++    OMX_U32 nMin;   /**< minimum for value (i.e. nValue >= nMin) */
++    OMX_U32 nMax;   /**< maximum for value (i.e. nValue <= nMax) */
++} OMX_BU32;
++
++
++/** Signed bounded value type */
++typedef struct OMX_BS32 {
++    OMX_S32 nValue; /**< actual value */
++    OMX_S32 nMin;   /**< minimum for value (i.e. nValue >= nMin) */
++    OMX_S32 nMax;   /**< maximum for value (i.e. nValue <= nMax) */
++} OMX_BS32;
++
++
++/** Structure representing some time or duration in microseconds. This structure
++  *  must be interpreted as a signed 64 bit value. The quantity is signed to accommodate
++  *  negative deltas and preroll scenarios. The quantity is represented in microseconds
++  *  to accomodate high resolution timestamps (e.g. DVD presentation timestamps based
++  *  on a 90kHz clock) and to allow more accurate and synchronized delivery (e.g.
++  *  individual audio samples delivered@192 kHz). The quantity is 64 bit to
++  *  accommodate a large dynamic range (signed 32 bit values would allow only for plus
++  *  or minus 35 minutes).
++  *
++  *  Implementations with limited precision may convert the signed 64 bit value to
++  *  a signed 32 bit value internally but risk loss of precision.
++  */
++#ifndef OMX_SKIP64BIT
++typedef OMX_S64 OMX_TICKS;
++#else
++typedef struct OMX_TICKS
++{
++    OMX_U32 nLowPart;    /** low bits of the signed 64 bit tick value */
++    OMX_U32 nHighPart;   /** high bits of the signed 64 bit tick value */
++} OMX_TICKS;
++#endif
++#define OMX_TICKS_PER_SECOND 1000000
++
++/** Define the public interface for the OMX Handle.  The core will not use
++    this value internally, but the application should only use this value.
++ */
++typedef void* OMX_HANDLETYPE;
++
++typedef struct OMX_MARKTYPE
++{
++    OMX_HANDLETYPE hMarkTargetComponent;   /**< The component that will
++                                                generate a mark event upon
++                                                processing the mark. */
++    OMX_PTR pMarkData;   /**< Application specific data associated with
++                              the mark sent on a mark event to disambiguate
++                              this mark from others. */
++} OMX_MARKTYPE;
++
++
++/** OMX_NATIVE_DEVICETYPE is used to map a OMX video port to the
++ *  platform & operating specific object used to reference the display
++ *  or can be used by a audio port for native audio rendering */
++typedef void* OMX_NATIVE_DEVICETYPE;
++
++/** OMX_NATIVE_WINDOWTYPE is used to map a OMX video port to the
++ *  platform & operating specific object used to reference the window */
++typedef void* OMX_NATIVE_WINDOWTYPE;
++
++
++/** Define the OMX IL version that corresponds to this set of header files.
++ *  We also define a combined version that can be used to write or compare
++ *  values of the 32bit nVersion field, assuming a little endian architecture */
++#define OMX_VERSION_MAJOR 1
++#define OMX_VERSION_MINOR 1
++#define OMX_VERSION_REVISION 2
++#define OMX_VERSION_STEP 0
++
++#define OMX_VERSION ((OMX_VERSION_STEP<<24) | (OMX_VERSION_REVISION<<16) | (OMX_VERSION_MINOR<<8) | OMX_VERSION_MAJOR)
++
++
++/** The OMX_VERSIONTYPE union is used to specify the version for
++    a structure or component.  For a component, the version is entirely
++    specified by the component vendor.  Components doing the same function
++    from different vendors may or may not have the same version.  For
++    structures, the version shall be set by the entity that allocates the
++    structure.  For structures specified in the OMX 1.1 specification, the
++    value of the version shall be set to 1.1.0.0 in all cases.  Access to the
++    OMX_VERSIONTYPE can be by a single 32 bit access (e.g. by nVersion) or
++    by accessing one of the structure elements to, for example, check only
++    the Major revision.
++ */
++typedef union OMX_VERSIONTYPE
++{
++    struct
++    {
++        OMX_U8 nVersionMajor;   /**< Major version accessor element */
++        OMX_U8 nVersionMinor;   /**< Minor version accessor element */
++        OMX_U8 nRevision;       /**< Revision version accessor element */
++        OMX_U8 nStep;           /**< Step version accessor element */
++    } s;
++    OMX_U32 nVersion;           /**< 32 bit value to make accessing the
++                                    version easily done in a single word
++                                    size copy/compare operation */
++} OMX_VERSIONTYPE;
++
++#ifdef __cplusplus
++}
++#endif /* __cplusplus */
++
++#endif
++/* File EOF */
+diff -rupN a/usr/include/OpenMAX/il/OMX_VideoExt.h b/usr/include/OpenMAX/il/OMX_VideoExt.h
+--- a/usr/include/OpenMAX/il/OMX_VideoExt.h	1970-01-01 01:00:00.000000000 +0100
++++ b/usr/include/OpenMAX/il/OMX_VideoExt.h	2011-08-18 13:29:40.000000000 +0200
+@@ -0,0 +1,123 @@
++/*
++ * Copyright (c) 2010 The Khronos Group Inc.
++ *
++ * Permission is hereby granted, free of charge, to any person obtaining
++ * a copy of this software and associated documentation files (the
++ * "Software"), to deal in the Software without restriction, including
++ * without limitation the rights to use, copy, modify, merge, publish,
++ * distribute, sublicense, and/or sell copies of the Software, and to
++ * permit persons to whom the Software is furnished to do so, subject
++ * to the following conditions:
++ * The above copyright notice and this permission notice shall be included
++ * in all copies or substantial portions of the Software.
++ *
++ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS
++ * OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
++ * MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
++ * IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
++ * CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
++ * TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
++ * SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
++ *
++ */
++
++/** OMX_VideoExt.h - OpenMax IL version 1.1.2
++ * The OMX_VideoExt header file contains extensions to the
++ * definitions used by both the application and the component to
++ * access video items.
++ */
++
++#ifndef OMX_VideoExt_h
++#define OMX_VideoExt_h
++
++#ifdef __cplusplus
++extern "C" {
++#endif /* __cplusplus */
++
++/* Each OMX header shall include all required header files to allow the
++ * header to compile without errors.  The includes below are required
++ * for this header file to compile successfully
++ */
++#include <OMX_Core.h>
++
++/** NALU Formats */
++typedef enum OMX_NALUFORMATSTYPE {
++    OMX_NaluFormatStartCodes = 1,
++    OMX_NaluFormatOneNaluPerBuffer = 2,
++    OMX_NaluFormatOneByteInterleaveLength = 4,
++    OMX_NaluFormatTwoByteInterleaveLength = 8,
++    OMX_NaluFormatFourByteInterleaveLength = 16,
++    OMX_NaluFormatCodingMax = 0x7FFFFFFF
++} OMX_NALUFORMATSTYPE;
++
++/** NAL Stream Format */
++typedef struct OMX_NALSTREAMFORMATTYPE{
++    OMX_U32 nSize;
++    OMX_VERSIONTYPE nVersion;
++    OMX_U32 nPortIndex;
++    OMX_NALUFORMATSTYPE eNaluFormat;
++} OMX_NALSTREAMFORMATTYPE;
++
++/** Enum for standard video codingtype extensions */
++typedef enum OMX_VIDEO_CODINGEXTTYPE {
++    OMX_VIDEO_ExtCodingUnused = OMX_VIDEO_CodingKhronosExtensions,
++    OMX_VIDEO_CodingVP8,        /**< VP8/WebM */ 
++} OMX_VIDEO_CODINGEXTTYPE;
++
++/** VP8 profiles */
++typedef enum OMX_VIDEO_VP8PROFILETYPE {
++    OMX_VIDEO_VP8ProfileMain = 0x01,
++    OMX_VIDEO_VP8ProfileUnknown = 0x6EFFFFFF,
++    OMX_VIDEO_VP8ProfileMax = 0x7FFFFFFF
++} OMX_VIDEO_VP8PROFILETYPE;
++
++/** VP8 levels */
++typedef enum OMX_VIDEO_VP8LEVELTYPE {
++    OMX_VIDEO_VP8Level_Version0 = 0x01,
++    OMX_VIDEO_VP8Level_Version1 = 0x02,
++    OMX_VIDEO_VP8Level_Version2 = 0x04,
++    OMX_VIDEO_VP8Level_Version3 = 0x08,
++    OMX_VIDEO_VP8LevelUnknown = 0x6EFFFFFF,
++    OMX_VIDEO_VP8LevelMax = 0x7FFFFFFF
++} OMX_VIDEO_VP8LEVELTYPE;
++
++/** VP8 Param */
++typedef struct OMX_VIDEO_PARAM_VP8TYPE {
++    OMX_U32 nSize;
++    OMX_VERSIONTYPE nVersion;
++    OMX_U32 nPortIndex;
++    OMX_VIDEO_VP8PROFILETYPE eProfile;
++    OMX_VIDEO_VP8LEVELTYPE eLevel;
++    OMX_U32 nDCTPartitions;
++    OMX_BOOL bErrorResilientMode;
++} OMX_VIDEO_PARAM_VP8TYPE;
++
++/** Structure for configuring VP8 reference frames */
++typedef struct OMX_VIDEO_VP8REFERENCEFRAMETYPE {
++    OMX_U32 nSize;
++    OMX_VERSIONTYPE nVersion;
++    OMX_U32 nPortIndex;
++    OMX_BOOL bPreviousFrameRefresh;
++    OMX_BOOL bGoldenFrameRefresh;
++    OMX_BOOL bAlternateFrameRefresh;
++    OMX_BOOL bUsePreviousFrame;
++    OMX_BOOL bUseGoldenFrame;
++    OMX_BOOL bUseAlternateFrame;
++} OMX_VIDEO_VP8REFERENCEFRAMETYPE;
++
++/** Structure for querying VP8 reference frame type */
++typedef struct OMX_VIDEO_VP8REFERENCEFRAMEINFOTYPE {
++    OMX_U32 nSize;
++    OMX_VERSIONTYPE nVersion;
++    OMX_U32 nPortIndex;
++    OMX_BOOL bIsIntraFrame;
++    OMX_BOOL bIsGoldenOrAlternateFrame;
++} OMX_VIDEO_VP8REFERENCEFRAMEINFOTYPE;
++
++
++#ifdef __cplusplus
++}
++#endif /* __cplusplus */
++
++#endif /* OMX_VideoExt_h */
++/* File EOF */
+diff -rupN a/usr/include/OpenMAX/il/OMX_Video.h b/usr/include/OpenMAX/il/OMX_Video.h
+--- a/usr/include/OpenMAX/il/OMX_Video.h	1970-01-01 01:00:00.000000000 +0100
++++ b/usr/include/OpenMAX/il/OMX_Video.h	2011-08-09 09:08:06.000000000 +0200
+@@ -0,0 +1,1060 @@
++/**
++ * Copyright (c) 2008 The Khronos Group Inc.
++ *
++ * Permission is hereby granted, free of charge, to any person obtaining
++ * a copy of this software and associated documentation files (the
++ * "Software"), to deal in the Software without restriction, including
++ * without limitation the rights to use, copy, modify, merge, publish,
++ * distribute, sublicense, and/or sell copies of the Software, and to
++ * permit persons to whom the Software is furnished to do so, subject
++ * to the following conditions:
++ * The above copyright notice and this permission notice shall be included
++ * in all copies or substantial portions of the Software.
++ *
++ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS
++ * OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
++ * MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
++ * IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
++ * CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
++ * TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
++ * SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
++ *
++ */
++
++/**
++ *  @file OMX_Video.h - OpenMax IL version 1.1.2
++ *  The structures is needed by Video components to exchange parameters
++ *  and configuration data with OMX components.
++ */
++#ifndef OMX_Video_h
++#define OMX_Video_h
++
++/** @defgroup video OpenMAX IL Video Domain
++ * @ingroup iv
++ * Structures for OpenMAX IL Video domain
++ * @{
++ */
++
++#ifdef __cplusplus
++extern "C" {
++#endif /* __cplusplus */
++
++
++/**
++ * Each OMX header must include all required header files to allow the
++ * header to compile without errors.  The includes below are required
++ * for this header file to compile successfully
++ */
++
++#include <OMX_IVCommon.h>
++
++
++/**
++ * Enumeration used to define the possible video compression codings.
++ * NOTE:  This essentially refers to file extensions. If the coding is
++ *        being used to specify the ENCODE type, then additional work
++ *        must be done to configure the exact flavor of the compression
++ *        to be used.  For decode cases where the user application can
++ *        not differentiate between MPEG-4 and H.264 bit streams, it is
++ *        up to the codec to handle this.
++ */
++typedef enum OMX_VIDEO_CODINGTYPE {
++    OMX_VIDEO_CodingUnused,     /**< Value when coding is N/A */
++    OMX_VIDEO_CodingAutoDetect, /**< Autodetection of coding type */
++    OMX_VIDEO_CodingMPEG2,      /**< AKA: H.262 */
++    OMX_VIDEO_CodingH263,       /**< H.263 */
++    OMX_VIDEO_CodingMPEG4,      /**< MPEG-4 */
++    OMX_VIDEO_CodingWMV,        /**< all versions of Windows Media Video */
++    OMX_VIDEO_CodingRV,         /**< all versions of Real Video */
++    OMX_VIDEO_CodingAVC,        /**< H.264/AVC */
++    OMX_VIDEO_CodingMJPEG,      /**< Motion JPEG */
++    OMX_VIDEO_CodingKhronosExtensions = 0x6F000000, /**< Reserved region for introducing Khronos Standard Extensions */
++    OMX_VIDEO_CodingVendorStartUnused = 0x7F000000, /**< Reserved region for introducing Vendor Extensions */
++    OMX_VIDEO_CodingMax = 0x7FFFFFFF
++} OMX_VIDEO_CODINGTYPE;
++
++
++/**
++ * Data structure used to define a video path.  The number of Video paths for
++ * input and output will vary by type of the Video component.
++ *
++ *    Input (aka Source) : zero Inputs, one Output,
++ *    Splitter           : one Input, 2 or more Outputs,
++ *    Processing Element : one Input, one output,
++ *    Mixer              : 2 or more inputs, one output,
++ *    Output (aka Sink)  : one Input, zero outputs.
++ *
++ * The PortDefinition structure is used to define all of the parameters
++ * necessary for the compliant component to setup an input or an output video
++ * path.  If additional vendor specific data is required, it should be
++ * transmitted to the component using the CustomCommand function.  Compliant
++ * components will prepopulate this structure with optimal values during the
++ * GetDefaultInitParams command.
++ *
++ * STRUCT MEMBERS:
++ *  cMIMEType             : MIME type of data for the port
++ *  pNativeRender         : Platform specific reference for a display if a
++ *                          sync, otherwise this field is 0
++ *  nFrameWidth           : Width of frame to be used on channel if
++ *                          uncompressed format is used.  Use 0 for unknown,
++ *                          don't care or variable
++ *  nFrameHeight          : Height of frame to be used on channel if
++ *                          uncompressed format is used. Use 0 for unknown,
++ *                          don't care or variable
++ *  nStride               : Number of bytes per span of an image
++ *                          (i.e. indicates the number of bytes to get
++ *                          from span N to span N+1, where negative stride
++ *                          indicates the image is bottom up
++ *  nSliceHeight          : Height used when encoding in slices
++ *  nBitrate              : Bit rate of frame to be used on channel if
++ *                          compressed format is used. Use 0 for unknown,
++ *                          don't care or variable
++ *  xFramerate            : Frame rate to be used on channel if uncompressed
++ *                          format is used. Use 0 for unknown, don't care or
++ *                          variable.  Units are Q16 frames per second.
++ *  bFlagErrorConcealment : Turns on error concealment if it is supported by
++ *                          the OMX component
++ *  eCompressionFormat    : Compression format used in this instance of the
++ *                          component. When OMX_VIDEO_CodingUnused is
++ *                          specified, eColorFormat is used
++ *  eColorFormat : Decompressed format used by this component
++ *  pNativeWindow : Platform specific reference for a window object if a
++ *                          display sink , otherwise this field is 0x0.
++ */
++typedef struct OMX_VIDEO_PORTDEFINITIONTYPE {
++    OMX_STRING cMIMEType;
++    OMX_NATIVE_DEVICETYPE pNativeRender;
++    OMX_U32 nFrameWidth;
++    OMX_U32 nFrameHeight;
++    OMX_S32 nStride;
++    OMX_U32 nSliceHeight;
++    OMX_U32 nBitrate;
++    OMX_U32 xFramerate;
++    OMX_BOOL bFlagErrorConcealment;
++    OMX_VIDEO_CODINGTYPE eCompressionFormat;
++    OMX_COLOR_FORMATTYPE eColorFormat;
++    OMX_NATIVE_WINDOWTYPE pNativeWindow;
++} OMX_VIDEO_PORTDEFINITIONTYPE;
++
++/**
++ * Port format parameter.  This structure is used to enumerate the various
++ * data input/output format supported by the port.
++ *
++ * STRUCT MEMBERS:
++ *  nSize              : Size of the structure in bytes
++ *  nVersion           : OMX specification version information
++ *  nPortIndex         : Indicates which port to set
++ *  nIndex             : Indicates the enumeration index for the format from
++ *                       0x0 to N-1
++ *  eCompressionFormat : Compression format used in this instance of the
++ *                       component. When OMX_VIDEO_CodingUnused is specified,
++ *                       eColorFormat is used
++ *  eColorFormat       : Decompressed format used by this component
++ *  xFrameRate         : Indicates the video frame rate in Q16 format
++ */
++typedef struct OMX_VIDEO_PARAM_PORTFORMATTYPE {
++    OMX_U32 nSize;
++    OMX_VERSIONTYPE nVersion;
++    OMX_U32 nPortIndex;
++    OMX_U32 nIndex;
++    OMX_VIDEO_CODINGTYPE eCompressionFormat;
++    OMX_COLOR_FORMATTYPE eColorFormat;
++    OMX_U32 xFramerate;
++} OMX_VIDEO_PARAM_PORTFORMATTYPE;
++
++
++/**
++ * This is a structure for configuring video compression quantization
++ * parameter values.  Codecs may support different QP values for different
++ * frame types.
++ *
++ * STRUCT MEMBERS:
++ *  nSize      : Size of the structure in bytes
++ *  nVersion   : OMX specification version info
++ *  nPortIndex : Port that this structure applies to
++ *  nQpI       : QP value to use for index frames
++ *  nQpP       : QP value to use for P frames
++ *  nQpB       : QP values to use for bidirectional frames
++ */
++typedef struct OMX_VIDEO_PARAM_QUANTIZATIONTYPE {
++    OMX_U32 nSize;
++    OMX_VERSIONTYPE nVersion;
++    OMX_U32 nPortIndex;
++    OMX_U32 nQpI;
++    OMX_U32 nQpP;
++    OMX_U32 nQpB;
++} OMX_VIDEO_PARAM_QUANTIZATIONTYPE;
++
++
++/**
++ * Structure for configuration of video fast update parameters.
++ *
++ * STRUCT MEMBERS:
++ *  nSize      : Size of the structure in bytes
++ *  nVersion   : OMX specification version info
++ *  nPortIndex : Port that this structure applies to
++ *  bEnableVFU : Enable/Disable video fast update
++ *  nFirstGOB  : Specifies the number of the first macroblock row
++ *  nFirstMB   : specifies the first MB relative to the specified first GOB
++ *  nNumMBs    : Specifies the number of MBs to be refreshed from nFirstGOB
++ *               and nFirstMB
++ */
++typedef struct OMX_VIDEO_PARAM_VIDEOFASTUPDATETYPE {
++    OMX_U32 nSize;
++    OMX_VERSIONTYPE nVersion;
++    OMX_U32 nPortIndex;
++    OMX_BOOL bEnableVFU;
++    OMX_U32 nFirstGOB;
++    OMX_U32 nFirstMB;
++    OMX_U32 nNumMBs;
++} OMX_VIDEO_PARAM_VIDEOFASTUPDATETYPE;
++
++
++/**
++ * Enumeration of possible bitrate control types
++ */
++typedef enum OMX_VIDEO_CONTROLRATETYPE {
++    OMX_Video_ControlRateDisable,
++    OMX_Video_ControlRateVariable,
++    OMX_Video_ControlRateConstant,
++    OMX_Video_ControlRateVariableSkipFrames,
++    OMX_Video_ControlRateConstantSkipFrames,
++    OMX_Video_ControlRateKhronosExtensions = 0x6F000000, /**< Reserved region for introducing Khronos Standard Extensions */
++    OMX_Video_ControlRateVendorStartUnused = 0x7F000000, /**< Reserved region for introducing Vendor Extensions */
++    OMX_Video_ControlRateMax = 0x7FFFFFFF
++} OMX_VIDEO_CONTROLRATETYPE;
++
++
++/**
++ * Structure for configuring bitrate mode of a codec.
++ *
++ * STRUCT MEMBERS:
++ *  nSize          : Size of the struct in bytes
++ *  nVersion       : OMX spec version info
++ *  nPortIndex     : Port that this struct applies to
++ *  eControlRate   : Control rate type enum
++ *  nTargetBitrate : Target bitrate to encode with
++ */
++typedef struct OMX_VIDEO_PARAM_BITRATETYPE {
++    OMX_U32 nSize;
++    OMX_VERSIONTYPE nVersion;
++    OMX_U32 nPortIndex;
++    OMX_VIDEO_CONTROLRATETYPE eControlRate;
++    OMX_U32 nTargetBitrate;
++} OMX_VIDEO_PARAM_BITRATETYPE;
++
++
++/**
++ * Enumeration of possible motion vector (MV) types
++ */
++typedef enum OMX_VIDEO_MOTIONVECTORTYPE {
++    OMX_Video_MotionVectorPixel,
++    OMX_Video_MotionVectorHalfPel,
++    OMX_Video_MotionVectorQuarterPel,
++    OMX_Video_MotionVectorEighthPel,
++    OMX_Video_MotionVectorKhronosExtensions = 0x6F000000, /**< Reserved region for introducing Khronos Standard Extensions */
++    OMX_Video_MotionVectorVendorStartUnused = 0x7F000000, /**< Reserved region for introducing Vendor Extensions */
++    OMX_Video_MotionVectorMax = 0x7FFFFFFF
++} OMX_VIDEO_MOTIONVECTORTYPE;
++
++
++/**
++ * Structure for configuring the number of motion vectors used as well
++ * as their accuracy.
++ *
++ * STRUCT MEMBERS:
++ *  nSize            : Size of the struct in bytes
++ *  nVersion         : OMX spec version info
++ *  nPortIndex       : port that this structure applies to
++ *  eAccuracy        : Enumerated MV accuracy
++ *  bUnrestrictedMVs : Allow unrestricted MVs
++ *  bFourMV          : Allow use of 4 MVs
++ *  sXSearchRange    : Search range in horizontal direction for MVs
++ *  sYSearchRange    : Search range in vertical direction for MVs
++ */
++typedef struct OMX_VIDEO_PARAM_MOTIONVECTORTYPE {
++    OMX_U32 nSize;
++    OMX_VERSIONTYPE nVersion;
++    OMX_U32 nPortIndex;
++    OMX_VIDEO_MOTIONVECTORTYPE eAccuracy;
++    OMX_BOOL bUnrestrictedMVs;
++    OMX_BOOL bFourMV;
++    OMX_S32 sXSearchRange;
++    OMX_S32 sYSearchRange;
++} OMX_VIDEO_PARAM_MOTIONVECTORTYPE;
++
++
++/**
++ * Enumeration of possible methods to use for Intra Refresh
++ */
++typedef enum OMX_VIDEO_INTRAREFRESHTYPE {
++    OMX_VIDEO_IntraRefreshCyclic,
++    OMX_VIDEO_IntraRefreshAdaptive,
++    OMX_VIDEO_IntraRefreshBoth,
++    OMX_VIDEO_IntraRefreshKhronosExtensions = 0x6F000000, /**< Reserved region for introducing Khronos Standard Extensions */
++    OMX_VIDEO_IntraRefreshVendorStartUnused = 0x7F000000, /**< Reserved region for introducing Vendor Extensions */
++    OMX_VIDEO_IntraRefreshMax = 0x7FFFFFFF
++} OMX_VIDEO_INTRAREFRESHTYPE;
++
++
++/**
++ * Structure for configuring intra refresh mode
++ *
++ * STRUCT MEMBERS:
++ *  nSize        : Size of the structure in bytes
++ *  nVersion     : OMX specification version information
++ *  nPortIndex   : Port that this structure applies to
++ *  eRefreshMode : Cyclic, Adaptive, or Both
++ *  nAirMBs      : Number of intra macroblocks to refresh in a frame when
++ *                 AIR is enabled
++ *  nAirRef      : Number of times a motion marked macroblock has to be
++ *                 intra coded
++ *  nCirMBs      : Number of consecutive macroblocks to be coded as "intra"
++ *                 when CIR is enabled
++ */
++typedef struct OMX_VIDEO_PARAM_INTRAREFRESHTYPE {
++    OMX_U32 nSize;
++    OMX_VERSIONTYPE nVersion;
++    OMX_U32 nPortIndex;
++    OMX_VIDEO_INTRAREFRESHTYPE eRefreshMode;
++    OMX_U32 nAirMBs;
++    OMX_U32 nAirRef;
++    OMX_U32 nCirMBs;
++} OMX_VIDEO_PARAM_INTRAREFRESHTYPE;
++
++
++/**
++ * Structure for enabling various error correction methods for video
++ * compression.
++ *
++ * STRUCT MEMBERS:
++ *  nSize                   : Size of the structure in bytes
++ *  nVersion                : OMX specification version information
++ *  nPortIndex              : Port that this structure applies to
++ *  bEnableHEC              : Enable/disable header extension codes (HEC)
++ *  bEnableResync           : Enable/disable resynchronization markers
++ *  nResynchMarkerSpacing   : Resynch markers interval (in bits) to be
++ *                            applied in the stream
++ *  bEnableDataPartitioning : Enable/disable data partitioning
++ *  bEnableRVLC             : Enable/disable reversible variable length
++ *                            coding
++ */
++typedef struct OMX_VIDEO_PARAM_ERRORCORRECTIONTYPE {
++    OMX_U32 nSize;
++    OMX_VERSIONTYPE nVersion;
++    OMX_U32 nPortIndex;
++    OMX_BOOL bEnableHEC;
++    OMX_BOOL bEnableResync;
++    OMX_U32  nResynchMarkerSpacing;
++    OMX_BOOL bEnableDataPartitioning;
++    OMX_BOOL bEnableRVLC;
++} OMX_VIDEO_PARAM_ERRORCORRECTIONTYPE;
++
++
++/**
++ * Configuration of variable block-size motion compensation (VBSMC)
++ *
++ * STRUCT MEMBERS:
++ *  nSize      : Size of the structure in bytes
++ *  nVersion   : OMX specification version information
++ *  nPortIndex : Port that this structure applies to
++ *  b16x16     : Enable inter block search 16x16
++ *  b16x8      : Enable inter block search 16x8
++ *  b8x16      : Enable inter block search 8x16
++ *  b8x8       : Enable inter block search 8x8
++ *  b8x4       : Enable inter block search 8x4
++ *  b4x8       : Enable inter block search 4x8
++ *  b4x4       : Enable inter block search 4x4
++ */
++typedef struct OMX_VIDEO_PARAM_VBSMCTYPE {
++    OMX_U32 nSize;
++    OMX_VERSIONTYPE nVersion;
++    OMX_U32 nPortIndex;
++    OMX_BOOL b16x16;
++    OMX_BOOL b16x8;
++    OMX_BOOL b8x16;
++    OMX_BOOL b8x8;
++    OMX_BOOL b8x4;
++    OMX_BOOL b4x8;
++    OMX_BOOL b4x4;
++} OMX_VIDEO_PARAM_VBSMCTYPE;
++
++
++/**
++ * H.263 profile types, each profile indicates support for various
++ * performance bounds and different annexes.
++ *
++ * ENUMS:
++ *  Baseline           : Baseline Profile: H.263 (V1), no optional modes
++ *  H320 Coding        : H.320 Coding Efficiency Backward Compatibility
++ *                       Profile: H.263+ (V2), includes annexes I, J, L.4
++ *                       and T
++ *  BackwardCompatible : Backward Compatibility Profile: H.263 (V1),
++ *                       includes annex F
++ *  ISWV2              : Interactive Streaming Wireless Profile: H.263+
++ *                       (V2), includes annexes I, J, K and T
++ *  ISWV3              : Interactive Streaming Wireless Profile: H.263++
++ *                       (V3), includes profile 3 and annexes V and W.6.3.8
++ *  HighCompression    : Conversational High Compression Profile: H.263++
++ *                       (V3), includes profiles 1 & 2 and annexes D and U
++ *  Internet           : Conversational Internet Profile: H.263++ (V3),
++ *                       includes profile 5 and annex K
++ *  Interlace          : Conversational Interlace Profile: H.263++ (V3),
++ *                       includes profile 5 and annex W.6.3.11
++ *  HighLatency        : High Latency Profile: H.263++ (V3), includes
++ *                       profile 6 and annexes O.1 and P.5
++ */
++typedef enum OMX_VIDEO_H263PROFILETYPE {
++    OMX_VIDEO_H263ProfileBaseline            = 0x01,
++    OMX_VIDEO_H263ProfileH320Coding          = 0x02,
++    OMX_VIDEO_H263ProfileBackwardCompatible  = 0x04,
++    OMX_VIDEO_H263ProfileISWV2               = 0x08,
++    OMX_VIDEO_H263ProfileISWV3               = 0x10,
++    OMX_VIDEO_H263ProfileHighCompression     = 0x20,
++    OMX_VIDEO_H263ProfileInternet            = 0x40,
++    OMX_VIDEO_H263ProfileInterlace           = 0x80,
++    OMX_VIDEO_H263ProfileHighLatency         = 0x100,
++    OMX_VIDEO_H263ProfileKhronosExtensions = 0x6F000000, /**< Reserved region for introducing Khronos Standard Extensions */
++    OMX_VIDEO_H263ProfileVendorStartUnused = 0x7F000000, /**< Reserved region for introducing Vendor Extensions */
++    OMX_VIDEO_H263ProfileMax                 = 0x7FFFFFFF
++} OMX_VIDEO_H263PROFILETYPE;
++
++
++/**
++ * H.263 level types, each level indicates support for various frame sizes,
++ * bit rates, decoder frame rates.
++ */
++typedef enum OMX_VIDEO_H263LEVELTYPE {
++    OMX_VIDEO_H263Level10  = 0x01,
++    OMX_VIDEO_H263Level20  = 0x02,
++    OMX_VIDEO_H263Level30  = 0x04,
++    OMX_VIDEO_H263Level40  = 0x08,
++    OMX_VIDEO_H263Level45  = 0x10,
++    OMX_VIDEO_H263Level50  = 0x20,
++    OMX_VIDEO_H263Level60  = 0x40,
++    OMX_VIDEO_H263Level70  = 0x80,
++    OMX_VIDEO_H263LevelKhronosExtensions = 0x6F000000, /**< Reserved region for introducing Khronos Standard Extensions */
++    OMX_VIDEO_H263LevelVendorStartUnused = 0x7F000000, /**< Reserved region for introducing Vendor Extensions */
++    OMX_VIDEO_H263LevelMax = 0x7FFFFFFF
++} OMX_VIDEO_H263LEVELTYPE;
++
++
++/**
++ * Specifies the picture type. These values should be OR'd to signal all
++ * pictures types which are allowed.
++ *
++ * ENUMS:
++ *  Generic Picture Types:          I, P and B
++ *  H.263 Specific Picture Types:   SI and SP
++ *  H.264 Specific Picture Types:   EI and EP
++ *  MPEG-4 Specific Picture Types:  S
++ */
++typedef enum OMX_VIDEO_PICTURETYPE {
++    OMX_VIDEO_PictureTypeI   = 0x01,
++    OMX_VIDEO_PictureTypeP   = 0x02,
++    OMX_VIDEO_PictureTypeB   = 0x04,
++    OMX_VIDEO_PictureTypeSI  = 0x08,
++    OMX_VIDEO_PictureTypeSP  = 0x10,
++    OMX_VIDEO_PictureTypeEI  = 0x11,
++    OMX_VIDEO_PictureTypeEP  = 0x12,
++    OMX_VIDEO_PictureTypeS   = 0x14,
++    OMX_VIDEO_PictureTypeKhronosExtensions = 0x6F000000, /**< Reserved region for introducing Khronos Standard Extensions */
++    OMX_VIDEO_PictureTypeVendorStartUnused = 0x7F000000, /**< Reserved region for introducing Vendor Extensions */
++    OMX_VIDEO_PictureTypeMax = 0x7FFFFFFF
++} OMX_VIDEO_PICTURETYPE;
++
++
++/**
++ * H.263 Params
++ *
++ * STRUCT MEMBERS:
++ *  nSize                    : Size of the structure in bytes
++ *  nVersion                 : OMX specification version information
++ *  nPortIndex               : Port that this structure applies to
++ *  nPFrames                 : Number of P frames between each I frame
++ *  nBFrames                 : Number of B frames between each I frame
++ *  eProfile                 : H.263 profile(s) to use
++ *  eLevel                   : H.263 level(s) to use
++ *  bPLUSPTYPEAllowed        : Indicating that it is allowed to use PLUSPTYPE
++ *                             (specified in the 1998 version of H.263) to
++ *                             indicate custom picture sizes or clock
++ *                             frequencies
++ *  nAllowedPictureTypes     : Specifies the picture types allowed in the
++ *                             bitstream
++ *  bForceRoundingTypeToZero : value of the RTYPE bit (bit 6 of MPPTYPE) is
++ *                             not constrained. It is recommended to change
++ *                             the value of the RTYPE bit for each reference
++ *                             picture in error-free communication
++ *  nPictureHeaderRepetition : Specifies the frequency of picture header
++ *                             repetition
++ *  nGOBHeaderInterval       : Specifies the interval of non-empty GOB
++ *                             headers in units of GOBs
++ */
++typedef struct OMX_VIDEO_PARAM_H263TYPE {
++    OMX_U32 nSize;
++    OMX_VERSIONTYPE nVersion;
++    OMX_U32 nPortIndex;
++    OMX_U32 nPFrames;
++    OMX_U32 nBFrames;
++    OMX_VIDEO_H263PROFILETYPE eProfile;
++	OMX_VIDEO_H263LEVELTYPE eLevel;
++    OMX_BOOL bPLUSPTYPEAllowed;
++    OMX_U32 nAllowedPictureTypes;
++    OMX_BOOL bForceRoundingTypeToZero;
++    OMX_U32 nPictureHeaderRepetition;
++    OMX_U32 nGOBHeaderInterval;
++} OMX_VIDEO_PARAM_H263TYPE;
++
++
++/**
++ * MPEG-2 profile types, each profile indicates support for various
++ * performance bounds and different annexes.
++ */
++typedef enum OMX_VIDEO_MPEG2PROFILETYPE {
++    OMX_VIDEO_MPEG2ProfileSimple = 0,  /**< Simple Profile */
++    OMX_VIDEO_MPEG2ProfileMain,        /**< Main Profile */
++    OMX_VIDEO_MPEG2Profile422,         /**< 4:2:2 Profile */
++    OMX_VIDEO_MPEG2ProfileSNR,         /**< SNR Profile */
++    OMX_VIDEO_MPEG2ProfileSpatial,     /**< Spatial Profile */
++    OMX_VIDEO_MPEG2ProfileHigh,        /**< High Profile */
++    OMX_VIDEO_MPEG2ProfileKhronosExtensions = 0x6F000000, /**< Reserved region for introducing Khronos Standard Extensions */
++    OMX_VIDEO_MPEG2ProfileVendorStartUnused = 0x7F000000, /**< Reserved region for introducing Vendor Extensions */
++    OMX_VIDEO_MPEG2ProfileMax = 0x7FFFFFFF
++} OMX_VIDEO_MPEG2PROFILETYPE;
++
++
++/**
++ * MPEG-2 level types, each level indicates support for various frame
++ * sizes, bit rates, decoder frame rates.  No need
++ */
++typedef enum OMX_VIDEO_MPEG2LEVELTYPE {
++    OMX_VIDEO_MPEG2LevelLL = 0,  /**< Low Level */
++    OMX_VIDEO_MPEG2LevelML,      /**< Main Level */
++    OMX_VIDEO_MPEG2LevelH14,     /**< High 1440 */
++    OMX_VIDEO_MPEG2LevelHL,      /**< High Level */
++    OMX_VIDEO_MPEG2LevelKhronosExtensions = 0x6F000000, /**< Reserved region for introducing Khronos Standard Extensions */
++    OMX_VIDEO_MPEG2LevelVendorStartUnused = 0x7F000000, /**< Reserved region for introducing Vendor Extensions */
++    OMX_VIDEO_MPEG2LevelMax = 0x7FFFFFFF
++} OMX_VIDEO_MPEG2LEVELTYPE;
++
++
++/**
++ * MPEG-2 params
++ *
++ * STRUCT MEMBERS:
++ *  nSize      : Size of the structure in bytes
++ *  nVersion   : OMX specification version information
++ *  nPortIndex : Port that this structure applies to
++ *  nPFrames   : Number of P frames between each I frame
++ *  nBFrames   : Number of B frames between each I frame
++ *  eProfile   : MPEG-2 profile(s) to use
++ *  eLevel     : MPEG-2 levels(s) to use
++ */
++typedef struct OMX_VIDEO_PARAM_MPEG2TYPE {
++    OMX_U32 nSize;
++    OMX_VERSIONTYPE nVersion;
++    OMX_U32 nPortIndex;
++    OMX_U32 nPFrames;
++    OMX_U32 nBFrames;
++    OMX_VIDEO_MPEG2PROFILETYPE eProfile;
++	OMX_VIDEO_MPEG2LEVELTYPE eLevel;
++} OMX_VIDEO_PARAM_MPEG2TYPE;
++
++
++/**
++ * MPEG-4 profile types, each profile indicates support for various
++ * performance bounds and different annexes.
++ *
++ * ENUMS:
++ *  - Simple Profile, Levels 1-3
++ *  - Simple Scalable Profile, Levels 1-2
++ *  - Core Profile, Levels 1-2
++ *  - Main Profile, Levels 2-4
++ *  - N-bit Profile, Level 2
++ *  - Scalable Texture Profile, Level 1
++ *  - Simple Face Animation Profile, Levels 1-2
++ *  - Simple Face and Body Animation (FBA) Profile, Levels 1-2
++ *  - Basic Animated Texture Profile, Levels 1-2
++ *  - Hybrid Profile, Levels 1-2
++ *  - Advanced Real Time Simple Profiles, Levels 1-4
++ *  - Core Scalable Profile, Levels 1-3
++ *  - Advanced Coding Efficiency Profile, Levels 1-4
++ *  - Advanced Core Profile, Levels 1-2
++ *  - Advanced Scalable Texture, Levels 2-3
++ */
++typedef enum OMX_VIDEO_MPEG4PROFILETYPE {
++    OMX_VIDEO_MPEG4ProfileSimple           = 0x01,
++    OMX_VIDEO_MPEG4ProfileSimpleScalable   = 0x02,
++    OMX_VIDEO_MPEG4ProfileCore             = 0x04,
++    OMX_VIDEO_MPEG4ProfileMain             = 0x08,
++    OMX_VIDEO_MPEG4ProfileNbit             = 0x10,
++    OMX_VIDEO_MPEG4ProfileScalableTexture  = 0x20,
++    OMX_VIDEO_MPEG4ProfileSimpleFace       = 0x40,
++    OMX_VIDEO_MPEG4ProfileSimpleFBA        = 0x80,
++    OMX_VIDEO_MPEG4ProfileBasicAnimated    = 0x100,
++    OMX_VIDEO_MPEG4ProfileHybrid           = 0x200,
++    OMX_VIDEO_MPEG4ProfileAdvancedRealTime = 0x400,
++    OMX_VIDEO_MPEG4ProfileCoreScalable     = 0x800,
++    OMX_VIDEO_MPEG4ProfileAdvancedCoding   = 0x1000,
++    OMX_VIDEO_MPEG4ProfileAdvancedCore     = 0x2000,
++    OMX_VIDEO_MPEG4ProfileAdvancedScalable = 0x4000,
++    OMX_VIDEO_MPEG4ProfileAdvancedSimple   = 0x8000,
++    OMX_VIDEO_MPEG4ProfileKhronosExtensions = 0x6F000000, /**< Reserved region for introducing Khronos Standard Extensions */
++    OMX_VIDEO_MPEG4ProfileVendorStartUnused = 0x7F000000, /**< Reserved region for introducing Vendor Extensions */
++    OMX_VIDEO_MPEG4ProfileMax              = 0x7FFFFFFF
++} OMX_VIDEO_MPEG4PROFILETYPE;
++
++
++/**
++ * MPEG-4 level types, each level indicates support for various frame
++ * sizes, bit rates, decoder frame rates.  No need
++ */
++typedef enum OMX_VIDEO_MPEG4LEVELTYPE {
++    OMX_VIDEO_MPEG4Level0  = 0x01,   /**< Level 0 */
++    OMX_VIDEO_MPEG4Level0b = 0x02,   /**< Level 0b */
++    OMX_VIDEO_MPEG4Level1  = 0x04,   /**< Level 1 */
++    OMX_VIDEO_MPEG4Level2  = 0x08,   /**< Level 2 */
++    OMX_VIDEO_MPEG4Level3  = 0x10,   /**< Level 3 */
++    OMX_VIDEO_MPEG4Level4  = 0x20,   /**< Level 4 */
++    OMX_VIDEO_MPEG4Level4a = 0x40,   /**< Level 4a */
++    OMX_VIDEO_MPEG4Level5  = 0x80,   /**< Level 5 */
++    OMX_VIDEO_MPEG4LevelKhronosExtensions = 0x6F000000, /**< Reserved region for introducing Khronos Standard Extensions */
++    OMX_VIDEO_MPEG4LevelVendorStartUnused = 0x7F000000, /**< Reserved region for introducing Vendor Extensions */
++    OMX_VIDEO_MPEG4LevelMax = 0x7FFFFFFF
++} OMX_VIDEO_MPEG4LEVELTYPE;
++
++
++/**
++ * MPEG-4 configuration.  This structure handles configuration options
++ * which are specific to MPEG4 algorithms
++ *
++ * STRUCT MEMBERS:
++ *  nSize                : Size of the structure in bytes
++ *  nVersion             : OMX specification version information
++ *  nPortIndex           : Port that this structure applies to
++ *  nSliceHeaderSpacing  : Number of macroblocks between slice header (H263+
++ *                         Annex K). Put zero if not used
++ *  bSVH                 : Enable Short Video Header mode
++ *  bGov                 : Flag to enable GOV
++ *  nPFrames             : Number of P frames between each I frame (also called
++ *                         GOV period)
++ *  nBFrames             : Number of B frames between each I frame
++ *  nIDCVLCThreshold     : Value of intra DC VLC threshold
++ *  bACPred              : Flag to use ac prediction
++ *  nMaxPacketSize       : Maximum size of packet in bytes.
++ *  nTimeIncRes          : Used to pass VOP time increment resolution for MPEG4.
++ *                         Interpreted as described in MPEG4 standard.
++ *  eProfile             : MPEG-4 profile(s) to use.
++ *  eLevel               : MPEG-4 level(s) to use.
++ *  nAllowedPictureTypes : Specifies the picture types allowed in the bitstream
++ *  nHeaderExtension     : Specifies the number of consecutive video packet
++ *                         headers within a VOP
++ *  bReversibleVLC       : Specifies whether reversible variable length coding
++ *                         is in use
++ */
++typedef struct OMX_VIDEO_PARAM_MPEG4TYPE {
++    OMX_U32 nSize;
++    OMX_VERSIONTYPE nVersion;
++    OMX_U32 nPortIndex;
++    OMX_U32 nSliceHeaderSpacing;
++    OMX_BOOL bSVH;
++    OMX_BOOL bGov;
++    OMX_U32 nPFrames;
++    OMX_U32 nBFrames;
++    OMX_U32 nIDCVLCThreshold;
++    OMX_BOOL bACPred;
++    OMX_U32 nMaxPacketSize;
++    OMX_U32 nTimeIncRes;
++    OMX_VIDEO_MPEG4PROFILETYPE eProfile;
++    OMX_VIDEO_MPEG4LEVELTYPE eLevel;
++    OMX_U32 nAllowedPictureTypes;
++    OMX_U32 nHeaderExtension;
++    OMX_BOOL bReversibleVLC;
++} OMX_VIDEO_PARAM_MPEG4TYPE;
++
++
++/**
++ * WMV Versions
++ */
++typedef enum OMX_VIDEO_WMVFORMATTYPE {
++    OMX_VIDEO_WMVFormatUnused = 0x01,   /**< Format unused or unknown */
++    OMX_VIDEO_WMVFormat7      = 0x02,   /**< Windows Media Video format 7 */
++    OMX_VIDEO_WMVFormat8      = 0x04,   /**< Windows Media Video format 8 */
++    OMX_VIDEO_WMVFormat9      = 0x08,   /**< Windows Media Video format 9 */
++    OMX_VIDEO_WMFFormatKhronosExtensions = 0x6F000000, /**< Reserved region for introducing Khronos Standard Extensions */
++    OMX_VIDEO_WMFFormatVendorStartUnused = 0x7F000000, /**< Reserved region for introducing Vendor Extensions */
++    OMX_VIDEO_WMVFormatMax    = 0x7FFFFFFF
++} OMX_VIDEO_WMVFORMATTYPE;
++
++
++/**
++ * WMV Params
++ *
++ * STRUCT MEMBERS:
++ *  nSize      : Size of the structure in bytes
++ *  nVersion   : OMX specification version information
++ *  nPortIndex : Port that this structure applies to
++ *  eFormat    : Version of WMV stream / data
++ */
++typedef struct OMX_VIDEO_PARAM_WMVTYPE {
++    OMX_U32 nSize;
++    OMX_VERSIONTYPE nVersion;
++    OMX_U32 nPortIndex;
++    OMX_VIDEO_WMVFORMATTYPE eFormat;
++} OMX_VIDEO_PARAM_WMVTYPE;
++
++
++/**
++ * Real Video Version
++ */
++typedef enum OMX_VIDEO_RVFORMATTYPE {
++    OMX_VIDEO_RVFormatUnused = 0, /**< Format unused or unknown */
++    OMX_VIDEO_RVFormat8,          /**< Real Video format 8 */
++    OMX_VIDEO_RVFormat9,          /**< Real Video format 9 */
++    OMX_VIDEO_RVFormatG2,         /**< Real Video Format G2 */
++    OMX_VIDEO_RVFormatKhronosExtensions = 0x6F000000, /**< Reserved region for introducing Khronos Standard Extensions */
++    OMX_VIDEO_RVFormatVendorStartUnused = 0x7F000000, /**< Reserved region for introducing Vendor Extensions */
++    OMX_VIDEO_RVFormatMax = 0x7FFFFFFF
++} OMX_VIDEO_RVFORMATTYPE;
++
++
++/**
++ * Real Video Params
++ *
++ * STUCT MEMBERS:
++ *  nSize              : Size of the structure in bytes
++ *  nVersion           : OMX specification version information
++ *  nPortIndex         : Port that this structure applies to
++ *  eFormat            : Version of RV stream / data
++ *  nBitsPerPixel      : Bits per pixel coded in the frame
++ *  nPaddedWidth       : Padded width in pixel of a video frame
++ *  nPaddedHeight      : Padded Height in pixels of a video frame
++ *  nFrameRate         : Rate of video in frames per second
++ *  nBitstreamFlags    : Flags which internal information about the bitstream
++ *  nBitstreamVersion  : Bitstream version
++ *  nMaxEncodeFrameSize: Max encoded frame size
++ *  bEnablePostFilter  : Turn on/off post filter
++ *  bEnableTemporalInterpolation : Turn on/off temporal interpolation
++ *  bEnableLatencyMode : When enabled, the decoder does not display a decoded
++ *                       frame until it has detected that no enhancement layer
++ *					 frames or dependent B frames will be coming. This
++ *					 detection usually occurs when a subsequent non-B
++ *					 frame is encountered
++ */
++typedef struct OMX_VIDEO_PARAM_RVTYPE {
++    OMX_U32 nSize;
++    OMX_VERSIONTYPE nVersion;
++    OMX_U32 nPortIndex;
++    OMX_VIDEO_RVFORMATTYPE eFormat;
++    OMX_U16 nBitsPerPixel;
++    OMX_U16 nPaddedWidth;
++    OMX_U16 nPaddedHeight;
++    OMX_U32 nFrameRate;
++    OMX_U32 nBitstreamFlags;
++    OMX_U32 nBitstreamVersion;
++    OMX_U32 nMaxEncodeFrameSize;
++    OMX_BOOL bEnablePostFilter;
++    OMX_BOOL bEnableTemporalInterpolation;
++    OMX_BOOL bEnableLatencyMode;
++} OMX_VIDEO_PARAM_RVTYPE;
++
++
++/**
++ * AVC profile types, each profile indicates support for various
++ * performance bounds and different annexes.
++ */
++typedef enum OMX_VIDEO_AVCPROFILETYPE {
++    OMX_VIDEO_AVCProfileBaseline = 0x01,   /**< Baseline profile */
++    OMX_VIDEO_AVCProfileMain     = 0x02,   /**< Main profile */
++    OMX_VIDEO_AVCProfileExtended = 0x04,   /**< Extended profile */
++    OMX_VIDEO_AVCProfileHigh     = 0x08,   /**< High profile */
++    OMX_VIDEO_AVCProfileHigh10   = 0x10,   /**< High 10 profile */
++    OMX_VIDEO_AVCProfileHigh422  = 0x20,   /**< High 4:2:2 profile */
++    OMX_VIDEO_AVCProfileHigh444  = 0x40,   /**< High 4:4:4 profile */
++    OMX_VIDEO_AVCProfileKhronosExtensions = 0x6F000000, /**< Reserved region for introducing Khronos Standard Extensions */
++    OMX_VIDEO_AVCProfileVendorStartUnused = 0x7F000000, /**< Reserved region for introducing Vendor Extensions */
++    OMX_VIDEO_AVCProfileMax      = 0x7FFFFFFF
++} OMX_VIDEO_AVCPROFILETYPE;
++
++
++/**
++ * AVC level types, each level indicates support for various frame sizes,
++ * bit rates, decoder frame rates.  No need
++ */
++typedef enum OMX_VIDEO_AVCLEVELTYPE {
++    OMX_VIDEO_AVCLevel1   = 0x01,     /**< Level 1 */
++    OMX_VIDEO_AVCLevel1b  = 0x02,     /**< Level 1b */
++    OMX_VIDEO_AVCLevel11  = 0x04,     /**< Level 1.1 */
++    OMX_VIDEO_AVCLevel12  = 0x08,     /**< Level 1.2 */
++    OMX_VIDEO_AVCLevel13  = 0x10,     /**< Level 1.3 */
++    OMX_VIDEO_AVCLevel2   = 0x20,     /**< Level 2 */
++    OMX_VIDEO_AVCLevel21  = 0x40,     /**< Level 2.1 */
++    OMX_VIDEO_AVCLevel22  = 0x80,     /**< Level 2.2 */
++    OMX_VIDEO_AVCLevel3   = 0x100,    /**< Level 3 */
++    OMX_VIDEO_AVCLevel31  = 0x200,    /**< Level 3.1 */
++    OMX_VIDEO_AVCLevel32  = 0x400,    /**< Level 3.2 */
++    OMX_VIDEO_AVCLevel4   = 0x800,    /**< Level 4 */
++    OMX_VIDEO_AVCLevel41  = 0x1000,   /**< Level 4.1 */
++    OMX_VIDEO_AVCLevel42  = 0x2000,   /**< Level 4.2 */
++    OMX_VIDEO_AVCLevel5   = 0x4000,   /**< Level 5 */
++    OMX_VIDEO_AVCLevel51  = 0x8000,   /**< Level 5.1 */
++    OMX_VIDEO_AVCLevelKhronosExtensions = 0x6F000000, /**< Reserved region for introducing Khronos Standard Extensions */
++    OMX_VIDEO_AVCLevelVendorStartUnused = 0x7F000000, /**< Reserved region for introducing Vendor Extensions */
++    OMX_VIDEO_AVCLevelMax = 0x7FFFFFFF
++} OMX_VIDEO_AVCLEVELTYPE;
++
++
++/**
++ * AVC loop filter modes
++ *
++ * OMX_VIDEO_AVCLoopFilterEnable               : Enable
++ * OMX_VIDEO_AVCLoopFilterDisable              : Disable
++ * OMX_VIDEO_AVCLoopFilterDisableSliceBoundary : Disabled on slice boundaries
++ */
++typedef enum OMX_VIDEO_AVCLOOPFILTERTYPE {
++    OMX_VIDEO_AVCLoopFilterEnable = 0,
++    OMX_VIDEO_AVCLoopFilterDisable,
++    OMX_VIDEO_AVCLoopFilterDisableSliceBoundary,
++    OMX_VIDEO_AVCLoopFilterKhronosExtensions = 0x6F000000, /**< Reserved region for introducing Khronos Standard Extensions */
++    OMX_VIDEO_AVCLoopFilterVendorStartUnused = 0x7F000000, /**< Reserved region for introducing Vendor Extensions */
++    OMX_VIDEO_AVCLoopFilterMax = 0x7FFFFFFF
++} OMX_VIDEO_AVCLOOPFILTERTYPE;
++
++
++/**
++ * AVC params
++ *
++ * STRUCT MEMBERS:
++ *  nSize                     : Size of the structure in bytes
++ *  nVersion                  : OMX specification version information
++ *  nPortIndex                : Port that this structure applies to
++ *  nSliceHeaderSpacing       : Number of macroblocks between slice header, put
++ *                              zero if not used
++ *  nPFrames                  : Number of P frames between each I frame
++ *  nBFrames                  : Number of B frames between each I frame
++ *  bUseHadamard              : Enable/disable Hadamard transform
++ *  nRefFrames                : Max number of reference frames to use for inter
++ *                              motion search (1-16)
++ *  nRefIdxTrailing           : Pic param set ref frame index (index into ref
++ *                              frame buffer of trailing frames list), B frame
++ *                              support
++ *  nRefIdxForward            : Pic param set ref frame index (index into ref
++ *                              frame buffer of forward frames list), B frame
++ *                              support
++ *  bEnableUEP                : Enable/disable unequal error protection. This
++ *                              is only valid of data partitioning is enabled.
++ *  bEnableFMO                : Enable/disable flexible macroblock ordering
++ *  bEnableASO                : Enable/disable arbitrary slice ordering
++ *  bEnableRS                 : Enable/disable sending of redundant slices
++ *  eProfile                  : AVC profile(s) to use
++ *  eLevel                    : AVC level(s) to use
++ *  nAllowedPictureTypes      : Specifies the picture types allowed in the
++ *                              bitstream
++ *  bFrameMBsOnly             : specifies that every coded picture of the
++ *                              coded video sequence is a coded frame
++ *                              containing only frame macroblocks
++ *  bMBAFF                    : Enable/disable switching between frame and
++ *                              field macroblocks within a picture
++ *  bEntropyCodingCABAC       : Entropy decoding method to be applied for the
++ *                              syntax elements for which two descriptors appear
++ *                              in the syntax tables
++ *  bWeightedPPrediction      : Enable/disable weighted prediction shall not
++ *                              be applied to P and SP slices
++ *  nWeightedBipredicitonMode : Default weighted prediction is applied to B
++ *                              slices
++ *  bconstIpred               : Enable/disable intra prediction
++ *  bDirect8x8Inference       : Specifies the method used in the derivation
++ *                              process for luma motion vectors for B_Skip,
++ *                              B_Direct_16x16 and B_Direct_8x8 as specified
++ *                              in subclause 8.4.1.2 of the AVC spec
++ *  bDirectSpatialTemporal    : Flag indicating spatial or temporal direct
++ *                              mode used in B slice coding (related to
++ *                              bDirect8x8Inference) . Spatial direct mode is
++ *                              more common and should be the default.
++ *  nCabacInitIdx             : Index used to init CABAC contexts
++ *  eLoopFilterMode           : Enable/disable loop filter
++ */
++typedef struct OMX_VIDEO_PARAM_AVCTYPE {
++    OMX_U32 nSize;
++    OMX_VERSIONTYPE nVersion;
++    OMX_U32 nPortIndex;
++    OMX_U32 nSliceHeaderSpacing;
++    OMX_U32 nPFrames;
++    OMX_U32 nBFrames;
++    OMX_BOOL bUseHadamard;
++    OMX_U32 nRefFrames;
++	OMX_U32 nRefIdx10ActiveMinus1;
++	OMX_U32 nRefIdx11ActiveMinus1;
++    OMX_BOOL bEnableUEP;
++    OMX_BOOL bEnableFMO;
++    OMX_BOOL bEnableASO;
++    OMX_BOOL bEnableRS;
++    OMX_VIDEO_AVCPROFILETYPE eProfile;
++	OMX_VIDEO_AVCLEVELTYPE eLevel;
++    OMX_U32 nAllowedPictureTypes;
++	OMX_BOOL bFrameMBsOnly;
++    OMX_BOOL bMBAFF;
++    OMX_BOOL bEntropyCodingCABAC;
++    OMX_BOOL bWeightedPPrediction;
++    OMX_U32 nWeightedBipredicitonMode;
++    OMX_BOOL bconstIpred ;
++    OMX_BOOL bDirect8x8Inference;
++	OMX_BOOL bDirectSpatialTemporal;
++	OMX_U32 nCabacInitIdc;
++	OMX_VIDEO_AVCLOOPFILTERTYPE eLoopFilterMode;
++} OMX_VIDEO_PARAM_AVCTYPE;
++
++typedef struct OMX_VIDEO_PARAM_PROFILELEVELTYPE {
++   OMX_U32 nSize;
++   OMX_VERSIONTYPE nVersion;
++   OMX_U32 nPortIndex;
++   OMX_U32 eProfile;      /**< type is OMX_VIDEO_AVCPROFILETYPE, OMX_VIDEO_H263PROFILETYPE,
++                                 or OMX_VIDEO_MPEG4PROFILETYPE depending on context */
++   OMX_U32 eLevel;        /**< type is OMX_VIDEO_AVCLEVELTYPE, OMX_VIDEO_H263LEVELTYPE,
++                                 or OMX_VIDEO_MPEG4PROFILETYPE depending on context */
++   OMX_U32 nProfileIndex; /**< Used to query for individual profile support information,
++                               This parameter is valid only for
++                               OMX_IndexParamVideoProfileLevelQuerySupported index,
++                               For all other indices this parameter is to be ignored. */
++} OMX_VIDEO_PARAM_PROFILELEVELTYPE;
++
++/**
++ * Structure for dynamically configuring bitrate mode of a codec.
++ *
++ * STRUCT MEMBERS:
++ *  nSize          : Size of the struct in bytes
++ *  nVersion       : OMX spec version info
++ *  nPortIndex     : Port that this struct applies to
++ *  nEncodeBitrate : Target average bitrate to be generated in bps
++ */
++typedef struct OMX_VIDEO_CONFIG_BITRATETYPE {
++    OMX_U32 nSize;
++    OMX_VERSIONTYPE nVersion;
++    OMX_U32 nPortIndex;
++    OMX_U32 nEncodeBitrate;
++} OMX_VIDEO_CONFIG_BITRATETYPE;
++
++/**
++ * Defines Encoder Frame Rate setting
++ *
++ * STRUCT MEMBERS:
++ *  nSize            : Size of the structure in bytes
++ *  nVersion         : OMX specification version information
++ *  nPortIndex       : Port that this structure applies to
++ *  xEncodeFramerate : Encoding framerate represented in Q16 format
++ */
++typedef struct OMX_CONFIG_FRAMERATETYPE {
++    OMX_U32 nSize;
++    OMX_VERSIONTYPE nVersion;
++    OMX_U32 nPortIndex;
++    OMX_U32 xEncodeFramerate; /* Q16 format */
++} OMX_CONFIG_FRAMERATETYPE;
++
++typedef struct OMX_CONFIG_INTRAREFRESHVOPTYPE {
++    OMX_U32 nSize;
++    OMX_VERSIONTYPE nVersion;
++    OMX_U32 nPortIndex;
++    OMX_BOOL IntraRefreshVOP;
++} OMX_CONFIG_INTRAREFRESHVOPTYPE;
++
++typedef struct OMX_CONFIG_MACROBLOCKERRORMAPTYPE {
++    OMX_U32 nSize;
++    OMX_VERSIONTYPE nVersion;
++    OMX_U32 nPortIndex;
++    OMX_U32 nErrMapSize;           /* Size of the Error Map in bytes */
++    OMX_U8  ErrMap[1];             /* Error map hint */
++} OMX_CONFIG_MACROBLOCKERRORMAPTYPE;
++
++typedef struct OMX_CONFIG_MBERRORREPORTINGTYPE {
++    OMX_U32 nSize;
++    OMX_VERSIONTYPE nVersion;
++    OMX_U32 nPortIndex;
++    OMX_BOOL bEnabled;
++} OMX_CONFIG_MBERRORREPORTINGTYPE;
++
++typedef struct OMX_PARAM_MACROBLOCKSTYPE {
++    OMX_U32 nSize;
++    OMX_VERSIONTYPE nVersion;
++    OMX_U32 nPortIndex;
++    OMX_U32 nMacroblocks;
++} OMX_PARAM_MACROBLOCKSTYPE;
++
++/**
++ * AVC Slice Mode modes
++ *
++ * OMX_VIDEO_SLICEMODE_AVCDefault   : Normal frame encoding, one slice per frame
++ * OMX_VIDEO_SLICEMODE_AVCMBSlice   : NAL mode, number of MBs per frame
++ * OMX_VIDEO_SLICEMODE_AVCByteSlice : NAL mode, number of bytes per frame
++ */
++typedef enum OMX_VIDEO_AVCSLICEMODETYPE {
++    OMX_VIDEO_SLICEMODE_AVCDefault = 0,
++    OMX_VIDEO_SLICEMODE_AVCMBSlice,
++    OMX_VIDEO_SLICEMODE_AVCByteSlice,
++    OMX_VIDEO_SLICEMODE_AVCKhronosExtensions = 0x6F000000, /**< Reserved region for introducing Khronos Standard Extensions */
++    OMX_VIDEO_SLICEMODE_AVCVendorStartUnused = 0x7F000000, /**< Reserved region for introducing Vendor Extensions */
++    OMX_VIDEO_SLICEMODE_AVCLevelMax = 0x7FFFFFFF
++} OMX_VIDEO_AVCSLICEMODETYPE;
++
++/**
++ * AVC FMO Slice Mode Params
++ *
++ * STRUCT MEMBERS:
++ *  nSize      : Size of the structure in bytes
++ *  nVersion   : OMX specification version information
++ *  nPortIndex : Port that this structure applies to
++ *  nNumSliceGroups : Specifies the number of slice groups
++ *  nSliceGroupMapType : Specifies the type of slice groups
++ *  eSliceMode : Specifies the type of slice
++ */
++typedef struct OMX_VIDEO_PARAM_AVCSLICEFMO {
++    OMX_U32 nSize;
++    OMX_VERSIONTYPE nVersion;
++    OMX_U32 nPortIndex;
++    OMX_U8 nNumSliceGroups;
++    OMX_U8 nSliceGroupMapType;
++    OMX_VIDEO_AVCSLICEMODETYPE eSliceMode;
++} OMX_VIDEO_PARAM_AVCSLICEFMO;
++
++/**
++ * AVC IDR Period Configs
++ *
++ * STRUCT MEMBERS:
++ *  nSize      : Size of the structure in bytes
++ *  nVersion   : OMX specification version information
++ *  nPortIndex : Port that this structure applies to
++ *  nIDRPeriod : Specifies periodicity of IDR frames
++ *  nPFrames : Specifies internal of coding Intra frames
++ */
++typedef struct OMX_VIDEO_CONFIG_AVCINTRAPERIOD {
++    OMX_U32 nSize;
++    OMX_VERSIONTYPE nVersion;
++    OMX_U32 nPortIndex;
++    OMX_U32 nIDRPeriod;
++    OMX_U32 nPFrames;
++} OMX_VIDEO_CONFIG_AVCINTRAPERIOD;
++
++/**
++ * AVC NAL Size Configs
++ *
++ * STRUCT MEMBERS:
++ *  nSize      : Size of the structure in bytes
++ *  nVersion   : OMX specification version information
++ *  nPortIndex : Port that this structure applies to
++ *  nNaluBytes : Specifies the NAL unit size
++ */
++typedef struct OMX_VIDEO_CONFIG_NALSIZE {
++    OMX_U32 nSize;
++    OMX_VERSIONTYPE nVersion;
++    OMX_U32 nPortIndex;
++    OMX_U32 nNaluBytes;
++} OMX_VIDEO_CONFIG_NALSIZE;
++
++/** @} */
++
++#ifdef __cplusplus
++}
++#endif /* __cplusplus */
++
++#endif
++/* File EOF */
++
diff --git a/package/nvidia-tegra23/nvidia-tegra23-binaries/nvidia-tegra23-binaries-001-pkgconfig.patch b/package/nvidia-tegra23/nvidia-tegra23-binaries/nvidia-tegra23-binaries-001-pkgconfig.patch
new file mode 100644
index 0000000..7743c5c
--- /dev/null
+++ b/package/nvidia-tegra23/nvidia-tegra23-binaries/nvidia-tegra23-binaries-001-pkgconfig.patch
@@ -0,0 +1,42 @@
+diff -rupN a/usr/lib/pkgconfig/egl.pc b/usr/lib/pkgconfig/egl.pc
+--- a/usr/lib/pkgconfig/egl.pc	1970-01-01 01:00:00.000000000 +0100
++++ b/usr/lib/pkgconfig/egl.pc	2014-11-03 15:57:00.428740000 +0100
+@@ -0,0 +1,10 @@
++prefix=/usr
++exec_prefix=${prefix}
++libdir=/usr/lib
++includedir=/usr/include
++
++Name: egl
++Description: EGL implementation
++Version: 1
++Cflags: -I${includedir}/EGL
++Libs: -L${libdir} -lEGL
+diff -rupN a/usr/lib/pkgconfig/gles.pc b/usr/lib/pkgconfig/gles.pc
+--- a/usr/lib/pkgconfig/gles.pc	1970-01-01 01:00:00.000000000 +0100
++++ b/usr/lib/pkgconfig/gles.pc	2014-11-03 15:57:06.036740000 +0100
+@@ -0,0 +1,10 @@
++prefix=/usr
++exec_prefix=${prefix}
++libdir=/usr/lib
++includedir=/usr/include
++
++Name: glesv2
++Description: OpenGL ES 1.1 implementation
++Version: 1.1
++Cflags: -I${includedir}/GLES
++Libs: -L${libdir} -lGLESv1_CM
+diff -rupN a/usr/lib/pkgconfig/glesv2.pc b/usr/lib/pkgconfig/glesv2.pc
+--- a/usr/lib/pkgconfig/glesv2.pc	1970-01-01 01:00:00.000000000 +0100
++++ b/usr/lib/pkgconfig/glesv2.pc	2014-11-03 15:57:13.524740000 +0100
+@@ -0,0 +1,10 @@
++prefix=/usr
++exec_prefix=${prefix}
++libdir=/usr/lib
++includedir=/usr/include
++
++Name: glesv2
++Description: OpenGL ES 2 implementation
++Version: 2
++Cflags: -I${includedir}/GLESv2
++Libs: -L${libdir} -lGLESv2
diff --git a/package/nvidia-tegra23/nvidia-tegra23-binaries/nvidia-tegra23-binaries.hash b/package/nvidia-tegra23/nvidia-tegra23-binaries/nvidia-tegra23-binaries.hash
new file mode 100644
index 0000000..8185593
--- /dev/null
+++ b/package/nvidia-tegra23/nvidia-tegra23-binaries/nvidia-tegra23-binaries.hash
@@ -0,0 +1,3 @@
+# From https://developer.nvidia.com/linux-tegra-rel-16
+sha1 6b57b43f8f9c5b76fa3763144e57c0c16047b1a8 Tegra20_Linux_R16.4.0_armhf.tbz2
+sha1 44e7f84dd6e3b80d37ecddf9cc133031b2653004 Tegra30_Linux_R16.4.0_armhf.tbz2
diff --git a/package/nvidia-tegra23/nvidia-tegra23-binaries/nvidia-tegra23-binaries.mk b/package/nvidia-tegra23/nvidia-tegra23-binaries/nvidia-tegra23-binaries.mk
new file mode 100644
index 0000000..053480a
--- /dev/null
+++ b/package/nvidia-tegra23/nvidia-tegra23-binaries/nvidia-tegra23-binaries.mk
@@ -0,0 +1,187 @@
+################################################################################
+#
+# nvidia-tegra3-binaries
+#
+################################################################################
+
+NVIDIA_TEGRA23_BINARIES_VERSION	= $(NVIDIA_TEGRA23_VERSION)
+ifeq ($(BR2_PACKAGE_NVIDIA_TEGRA23_BINARIES_TEGRA2),y)
+NVIDIA_TEGRA23_BINARIES_SOURCE = Tegra20_Linux_R$(NVIDIA_TEGRA23_BINARIES_VERSION)_armhf.tbz2
+endif
+ifeq ($(BR2_PACKAGE_NVIDIA_TEGRA23_BINARIES_TEGRA3),y)
+NVIDIA_TEGRA23_BINARIES_SOURCE = Tegra30_Linux_R$(NVIDIA_TEGRA23_BINARIES_VERSION)_armhf.tbz2
+endif
+NVIDIA_TEGRA23_BINARIES_SITE = $(NVIDIA_TEGRA23_SITE)
+
+ifeq ($(BR2_PACKAGE_NVIDIA_TEGRA23_BINARIES_GSTREAMER_PLUGINS), y)
+NVIDIA_TEGRA23_BINARIES_LICENSE = License For Customer Use of NVIDIA Software, LGPLv2.1
+NVIDIA_TEGRA23_BINARIES_LICENSE_FILES = nv_tegra/LICENSE nv_tegra/nv_sample_apps/LICENSE.gst-openmax
+else
+NVIDIA_TEGRA23_BINARIES_LICENSE = License For Customer Use of NVIDIA Software
+NVIDIA_TEGRA23_BINARIES_LICENSE_FILES = nv_tegra/LICENSE
+endif
+
+NVIDIA_TEGRA23_BINARIES_INSTALL_STAGING = YES
+NVIDIA_TEGRA23_BINARIES_INSTALL_TARGET = YES
+
+NVIDIA_TEGRA23_BINARIES_DEPENDENCIES = xlib_libX11 xlib_libXext xlib_libXv
+NVIDIA_TEGRA23_BINARIES_PROVIDES = libegl libgles libopenmax
+
+NVIDIA_TEGRA23_BINARIES_LIBS_VERSION = nv_tegra_release
+
+ifeq ($(BR2_PACKAGE_NVIDIA_TEGRA23_BINARIES_TEGRA2),y)
+NVIDIA_TEGRA23_BINARIES_FIRMWARE = \
+		nvrm_avp.bin nvavp_vid_ucode_alt.bin nvavp_os_0ff00000.bin \
+		nvavp_os_eff00000.bin
+endif
+ifeq ($(BR2_PACKAGE_NVIDIA_TEGRA23_BINARIES_TEGRA3),y)
+NVIDIA_TEGRA23_BINARIES_FIRMWARE = \
+		nvrm_avp_0ff00000.bin nvrm_avp_8e000000.bin nvrm_avp_9e000000.bin \
+		nvrm_avp_be000000.bin nvrm_avp_eff00000.bin nvavp_vid_ucode_alt.bin \
+		nvavp_os_0ff00000.bin nvavp_os_eff00000.bin
+endif
+
+NVIDIA_TEGRA23_BINARIES_LIBRARIES = \
+		libardrv_dynamic.so libcgdrv.so libEGL.so.1 libGLESv1_CM.so.1 libGLESv2.so.2 \
+		libKD.so libnvapputil.so libnvavp.so libnvcwm.so libnvdc.so \
+		libnvddk_2d.so libnvddk_2d_v2.so libnvddk_disp.so libnvddk_kbc.so \
+		libnvddk_mipihsi.so libnvddk_nand.so libnvddk_se.so libnvddk_snor.so \
+		libnvddk_spif.so libnvddk_usbphy.so libnvdispatch_helper.so libnvglsi.so \
+		libnvmedia_audio.so libnvmm_audio.so libnvmm_camera.so libnvmm_contentpipe.so \
+		libnvmm_image.so libnvmmlite_audio.so libnvmmlite_image.so libnvmmlite.so \
+		libnvmmlite_utils.so libnvmmlite_video.so libnvmm_manager.so libnvmm_parser.so \
+		libnvmm_service.so libnvmm.so libnvmm_utils.so libnvmm_video.so libnvmm_writer.so \
+		libnvodm_disp.so libnvodm_dtvtuner.so libnvodm_imager.so libnvodm_misc.so \
+		libnvodm_query.so libnvomxilclient.so libnvomx.so libnvos.so libnvparser.so \
+		libnvrm_graphics.so libnvrm.so libnvsm.so libnvtestio.so libnvtestresults.so \
+		libnvtvmr.so libnvwinsys.so libnvwsi.so
+
+ifeq ($(BR2_PACKAGE_JPEG_TEGRA23),y)
+NVIDIA_TEGRA23_BINARIES_PROVIDES += jpeg
+NVIDIA_TEGRA23_BINARIES_LIBRARIES += libjpeg.so
+endif
+
+NVIDIA_TEGRA23_BINARIES_X11ABI_DRIVERS = \
+		tegra_drv.abi5.so tegra_drv.abi6.so tegra_drv.abi7.so tegra_drv.abi8.so \
+		tegra_drv.abi10.so tegra_drv.abi11.so tegra_drv.abi12.so tegra_drv.abi13.so \
+		tegra_drv.abi14.so
+
+NVIDIA_TEGRA23_BINARIES_GSTREAMER_PLUGINS = \
+		libgstnv4l2.so libgstnvvidconv.so libgstnvxvimagesink.so libgstomx.so
+
+NVIDIA_TEGRA23_BINARIES_MULTIMEDIA_APPS = nvgstplayer nvgstcapture
+
+NVIDIA_TEGRA23_BINARIES_PKGCONFIG = egl.pc gles.pc glesv2.pc
+
+NVIDIA_TEGRA23_BINARIES_HEADERS = OpenMAX/il KHR KD GLES2 GLES EGL
+
+ifeq ($(BR2_PACKAGE_NVIDIA_TEGRA23_BINARIES_X11ABI_V5),y)
+NVIDIA_TEGRA23_BINARIES_X_ABI_DRIVER = tegra_drv.abi5.so
+endif
+
+ifeq ($(BR2_PACKAGE_NVIDIA_TEGRA23_BINARIES_X11ABI_V6),y)
+NVIDIA_TEGRA23_BINARIES_X_ABI_DRIVER = tegra_drv.abi6.so
+endif
+
+ifeq ($(BR2_PACKAGE_NVIDIA_TEGRA23_BINARIES_X11ABI_V7),y)
+NVIDIA_TEGRA23_BINARIES_X_ABI_DRIVER = tegra_drv.abi7.so
+endif
+
+ifeq ($(BR2_PACKAGE_NVIDIA_TEGRA23_BINARIES_X11ABI_V8),y)
+NVIDIA_TEGRA23_BINARIES_X_ABI_DRIVER = tegra_drv.abi8.so
+endif
+
+ifeq ($(BR2_PACKAGE_NVIDIA_TEGRA23_BINARIES_X11ABI_V10),y)
+NVIDIA_TEGRA23_BINARIES_X_ABI_DRIVER = tegra_drv.abi10.so
+endif
+
+ifeq ($(BR2_PACKAGE_NVIDIA_TEGRA23_BINARIES_X11ABI_V11),y)
+NVIDIA_TEGRA23_BINARIES_X_ABI_DRIVER = tegra_drv.abi11.so
+endif
+
+ifeq ($(BR2_PACKAGE_NVIDIA_TEGRA23_BINARIES_X11ABI_V12),y)
+NVIDIA_TEGRA23_BINARIES_X_ABI_DRIVER = tegra_drv.abi12.so
+endif
+
+ifeq ($(BR2_PACKAGE_NVIDIA_TEGRA23_BINARIES_X11ABI_V13),y)
+NVIDIA_TEGRA23_BINARIES_X_ABI_DRIVER = tegra_drv.abi13.so
+endif
+
+ifeq ($(BR2_PACKAGE_NVIDIA_TEGRA23_BINARIES_X11ABI_V14),y)
+NVIDIA_TEGRA23_BINARIES_X_ABI_DRIVER = tegra_drv.abi14.so
+endif
+
+define NVIDIA_TEGRA23_BINARIES_EXTRACT_CMDS
+	bzcat $(DL_DIR)/$(NVIDIA_TEGRA23_BINARIES_SOURCE) | tar --strip-components=1 -C $(@D) -xf -
+	rm -rf $(@D)/nv_tegra/nvidia_drivers
+	mkdir $(@D)/nv_tegra/nvidia_drivers
+	tar -xvf $(@D)/nv_tegra/nvidia_drivers.tbz2 -C $(@D)/nv_tegra/nvidia_drivers/
+	rm -rf $(@D)/nv_tegra/nv_sample_apps/nvgstapps
+	mkdir $(@D)/nv_tegra/nv_sample_apps/nvgstapps
+	tar -xvf $(@D)/nv_tegra/nv_sample_apps/nvgstapps.tbz2 -C $(@D)/nv_tegra/nv_sample_apps/nvgstapps/
+endef
+
+define NVIDIA_TEGRA23_BINARIES_INSTALL_LIBS
+	$(foreach lib,$(NVIDIA_TEGRA23_BINARIES_LIBRARIES),
+		$(INSTALL) -D -m 0644 $(@D)/nv_tegra/nvidia_drivers/usr/lib/$(lib) \
+			$(1)/usr/lib/$(lib); \
+	)
+	(cd $(1)/usr/lib; \
+		ln -sf libGLESv2.so.2 libGLESv2.so; \
+		ln -sf libGLESv1_CM.so.1 libGLESv1_CM.so; \
+		ln -sf libEGL.so.1 libEGL.so \
+	)
+	$(INSTALL) -D -m 0644 $(@D)/nv_tegra/nvidia_drivers/etc/$(NVIDIA_TEGRA23_BINARIES_LIBS_VERSION) \
+		$(1)/etc/$(NVIDIA_TEGRA23_BINARIES_LIBS_VERSION)
+	$(foreach xabi,$(NVIDIA_TEGRA23_BINARIES_X11ABI_DRIVERS),
+		$(INSTALL) -D -m 0644 $(@D)/nv_tegra/nvidia_drivers/usr/lib/xorg/modules/drivers/$(xabi) \
+			$(1)/usr/lib/xorg/modules/drivers/$(xabi); \
+	)
+	(cd $(1)/usr/lib/xorg/modules/drivers; \
+		ln -sf $(NVIDIA_TEGRA23_BINARIES_X_ABI_DRIVER) tegra_drv.so \
+	)
+endef
+
+ifeq ($(BR2_PACKAGE_NVIDIA_TEGRA23_BINARIES_GSTREAMER_PLUGINS),y)
+define NVIDIA_TEGRA23_BINARIES_INSTALL_GST_PLUGINS
+	$(foreach gst_plug,$(NVIDIA_TEGRA23_BINARIES_GSTREAMER_PLUGINS),
+		$(INSTALL) -D -m 0644 $(@D)/nv_tegra/nv_sample_apps/nvgstapps/usr/lib/gstreamer-0.10/$(gst_plug) \
+			$(1)/usr/lib/gstreamer-0.10/$(gst_plug); \
+	)
+endef
+endif
+
+ifeq ($(BR2_PACKAGE_NVIDIA_TEGRA23_BINARIES_NV_SAMPLE_APPS),y)
+define NVIDIA_TEGRA23_BINARIES_INSTALL_APPS
+	$(foreach apps,$(NVIDIA_TEGRA23_BINARIES_MULTIMEDIA_APPS),
+		$(INSTALL) -D -m 0755 $(@D)/nv_tegra/nv_sample_apps/nvgstapps/usr/bin/$(apps) \
+			$(TARGET_DIR)/usr/bin/$(apps); \
+	)
+endef
+endif
+
+define NVIDIA_TEGRA23_BINARIES_INSTALL_STAGING_CMDS
+	$(call NVIDIA_TEGRA23_BINARIES_INSTALL_LIBS, $(STAGING_DIR))
+	$(foreach pkgconfig,$(NVIDIA_TEGRA23_BINARIES_PKGCONFIG),
+		$(INSTALL) -D -m 0644 $(@D)/usr/lib/pkgconfig/$(pkgconfig) \
+			$(STAGING_DIR)/usr/lib/pkgconfig/$(pkgconfig); \
+	)
+	$(foreach header,$(NVIDIA_TEGRA23_BINARIES_HEADERS),
+		$(INSTALL) -d $(STAGING_DIR)/usr/include/$(header);
+		$(INSTALL) -D -m 0644 $(@D)/usr/include/$(header)/* \
+			$(STAGING_DIR)/usr/include/$(header)/; \
+	)
+	$(call NVIDIA_TEGRA23_BINARIES_INSTALL_GST_PLUGINS, $(STAGING_DIR))
+endef
+
+define NVIDIA_TEGRA23_BINARIES_INSTALL_TARGET_CMDS
+	$(foreach firmware,$(NVIDIA_TEGRA23_BINARIES_FIRMWARE),
+		$(INSTALL) -D -m 0644 $(@D)/nv_tegra/nvidia_drivers/lib/firmware/$(firmware) \
+			$(TARGET_DIR)/lib/firmware/$(firmware); \
+	)
+	$(call NVIDIA_TEGRA23_BINARIES_INSTALL_LIBS, $(TARGET_DIR))
+	$(call NVIDIA_TEGRA23_BINARIES_INSTALL_GST_PLUGINS, $(TARGET_DIR))
+	$(NVIDIA_TEGRA23_BINARIES_INSTALL_APPS)
+endef
+
+$(eval $(generic-package))
diff --git a/package/nvidia-tegra23/nvidia-tegra23-codecs/Config.in b/package/nvidia-tegra23/nvidia-tegra23-codecs/Config.in
new file mode 100644
index 0000000..0ac5599
--- /dev/null
+++ b/package/nvidia-tegra23/nvidia-tegra23-codecs/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_NVIDIA_TEGRA23_CODECS
+	bool "nvidia-tegra23 codecs"
+	depends on BR2_PACKAGE_NVIDIA_TEGRA23_BINARIES
+	help
+	  NVIDIA Tegra restricted codecs from Linux For Tegra 16.4.0
+	  These codecs are under
+	  NVIDIA(r) Tegra(r) Software License Agreement
+
+	  https://developer.nvidia.com/linux-tegra-rel-16
diff --git a/package/nvidia-tegra23/nvidia-tegra23-codecs/nvidia-tegra23-codecs.hash b/package/nvidia-tegra23/nvidia-tegra23-codecs/nvidia-tegra23-codecs.hash
new file mode 100644
index 0000000..de4a461
--- /dev/null
+++ b/package/nvidia-tegra23/nvidia-tegra23-codecs/nvidia-tegra23-codecs.hash
@@ -0,0 +1,3 @@
+# From https://developer.nvidia.com/linux-tegra-rel-16
+sha1 d0889bf0ca408583a1e88657c6fd18f3659ef1bb Tegra20_Linux-codecs_R16.4.0_armhf.tbz2
+sha1 a9f298222d3b6a618ef96a6bed9641929b152c8a Tegra30_Linux-codecs_R16.4.0_armhf.tbz2
diff --git a/package/nvidia-tegra23/nvidia-tegra23-codecs/nvidia-tegra23-codecs.mk b/package/nvidia-tegra23/nvidia-tegra23-codecs/nvidia-tegra23-codecs.mk
new file mode 100644
index 0000000..19bc663
--- /dev/null
+++ b/package/nvidia-tegra23/nvidia-tegra23-codecs/nvidia-tegra23-codecs.mk
@@ -0,0 +1,42 @@
+################################################################################
+#
+# nvidia-tegra23-codecs
+#
+################################################################################
+
+NVIDIA_TEGRA23_CODECS_VERSION = $(NVIDIA_TEGRA23_VERSION)
+ifeq ($(BR2_PACKAGE_NVIDIA_TEGRA23_BINARIES_TEGRA2),y)
+NVIDIA_TEGRA23_CODECS_SOURCE = Tegra20_Linux-codecs_R$(NVIDIA_TEGRA23_CODECS_VERSION)_armhf.tbz2
+endif
+ifeq ($(BR2_PACKAGE_NVIDIA_TEGRA23_BINARIES_TEGRA3),y)
+NVIDIA_TEGRA23_CODECS_SOURCE = Tegra30_Linux-codecs_R$(NVIDIA_TEGRA23_CODECS_VERSION)_armhf.tbz2
+endif
+NVIDIA_TEGRA23_CODECS_SITE = $(NVIDIA_TEGRA23_SITE)
+NVIDIA_TEGRA23_CODECS_LICENSE = NVIDIA(r) Tegra(r) Software License Agreement
+NVIDIA_TEGRA23_CODECS_LICENSE_FILES = Tegra_Software_License_Agreement-Tegra-Linux-codecs.txt
+NVIDIA_TEGRA23_CODECS_REDISTRIBUTE = NO
+NVIDIA_TEGRA23_CODECS_DEPENDENCIES = nvidia-tegra23-binaries
+NVIDIA_TEGRA23_CODECS_INSTALL_STAGING = NO
+NVIDIA_TEGRA23_CODECS_INSTALL_TARGET = YES
+
+NVIDIA_TEGRA23_CODECS_FIRMWARE = \
+		nvmm_aacdec.axf nvmm_adtsdec.axf nvmm_h264dec.axf nvmm_h264dec2x.axf \
+		nvmm_jpegdec.axf nvmm_jpegenc.axf nvmm_manager.axf nvmm_mp3dec.axf \
+		nvmm_mpeg4dec.axf nvmm_service.axf
+
+# The archive contains an archive with the firmware codecs
+define NVIDIA_TEGRA23_CODECS_EXTRACT_CMDS
+	bzcat $(DL_DIR)/$(NVIDIA_TEGRA23_CODECS_SOURCE) | tar -C $(@D) -xf -
+	rm -rf $(@D)/restricted_codecs
+	mkdir $(@D)/restricted_codecs
+	tar -xvf $(@D)/restricted_codecs.tbz2 -C $(@D)/restricted_codecs/
+endef
+
+define NVIDIA_TEGRA23_CODECS_INSTALL_TARGET_CMDS
+	$(foreach codec,$(NVIDIA_TEGRA23_CODECS_FIRMWARE),
+		$(INSTALL) -D -m 0644 $(@D)/restricted_codecs/lib/firmware/$(codec) \
+			$(TARGET_DIR)/lib/firmware/$(codec); \
+	)
+endef
+
+$(eval $(generic-package))
diff --git a/package/nvidia-tegra23/nvidia-tegra23.mk b/package/nvidia-tegra23/nvidia-tegra23.mk
new file mode 100644
index 0000000..2f645d8
--- /dev/null
+++ b/package/nvidia-tegra23/nvidia-tegra23.mk
@@ -0,0 +1,10 @@
+################################################################################
+#
+# nvidia-tegra23
+#
+################################################################################
+
+NVIDIA_TEGRA23_SITE = https://developer.nvidia.com/sites/default/files/akamai/mobile/files/L4T
+NVIDIA_TEGRA23_VERSION = 16.4.0
+
+include $(sort $(wildcard package/nvidia-tegra23/*/*.mk))
-- 
2.1.3
