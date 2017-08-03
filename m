From: Adrian Perez de Castro <aperez@igalia.com>
Date: Thu,  3 Aug 2017 14:31:09 +0300
Subject: [Buildroot] [PATCH v2 1/1] webkitgtk: Add patch for properly
	picking GL flags when building
Message-ID: <20170803113109.20158-1-aperez@igalia.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This solves build failures caused by WebKit trying to include X11 headers
when support for X11 is disabled in Mesa3D. A common situation is when
configuring both GTK+ and WebKitGTK+ only with Wayland support.

Once the fix for https://bugs.webkit.org/show_bug.cgi?id=175125 makes it
into a release, the patch can be dropped.

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>

---
Changes v1 -> v2:
    - Remove hunk in patch for the ChangeLog file, as it is not present
      in release tarballs.
---
 ...AGS-from-pkg-config-for-E-GL-are-not-pass.patch | 64 ++++++++++++++++++++++
 1 file changed, 64 insertions(+)
 create mode 100644 package/webkitgtk/0004-GTK-WPE-CFLAGS-from-pkg-config-for-E-GL-are-not-pass.patch

diff --git a/package/webkitgtk/0004-GTK-WPE-CFLAGS-from-pkg-config-for-E-GL-are-not-pass.patch b/package/webkitgtk/0004-GTK-WPE-CFLAGS-from-pkg-config-for-E-GL-are-not-pass.patch
new file mode 100644
index 0000000000..91c5116a2a
--- /dev/null
+++ b/package/webkitgtk/0004-GTK-WPE-CFLAGS-from-pkg-config-for-E-GL-are-not-pass.patch
@@ -0,0 +1,64 @@
+From 6579c307d85a9b447d3b7f13b25fb0a52177ed09 Mon Sep 17 00:00:00 2001
+From: Carlos Alberto Lopez Perez <clopez@igalia.com>
+Date: Thu, 3 Aug 2017 13:57:14 +0300
+Subject: [PATCH] [GTK][WPE] CFLAGS from pkg-config for (E)GL are not passed to
+ WebKit https://bugs.webkit.org/show_bug.cgi?id=175125
+
+Patch by Carlos Alberto Lopez Perez <clopez@igalia.com> on 2017-08-03
+Reviewed by NOBODY (OOPS!).
+
+* CMakeLists.txt: Pass GL-related flags to the WebKit component when
+  appropriate.
+
+Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
+
+---
+ Source/WebKit2/CMakeLists.txt | 31 +++++++++++++++++++++++++++++++
+ Source/WebKit2/ChangeLog      | 10 ++++++++++
+ 2 files changed, 41 insertions(+)
+
+diff --git a/Source/WebKit2/CMakeLists.txt b/Source/WebKit2/CMakeLists.txt
+index 2d8215f6a35..b25e9872de2 100644
+--- a/Source/WebKit2/CMakeLists.txt
++++ b/Source/WebKit2/CMakeLists.txt
+@@ -88,6 +88,37 @@ set(WebKit2_SYSTEM_INCLUDE_DIRECTORIES
+ )
+ 
+ if (ENABLE_GRAPHICS_CONTEXT_3D)
++    # For platforms that want to use system-provided OpenGL (ES) / EGL headers,
++    # these include directories, libraries or definitions need to be
++    # added before the ANGLE directories.
++    if (USE_OPENGL)
++        list(APPEND WebKit2_SYSTEM_INCLUDE_DIRECTORIES
++            ${OPENGL_INCLUDE_DIRS}
++        )
++        list(APPEND WebKit2_LIBRARIES
++            ${OPENGL_LIBRARIES}
++        )
++        add_definitions(${OPENGL_DEFINITIONS})
++    elseif (USE_OPENGL_ES_2)
++        list(APPEND WebKit2_SYSTEM_INCLUDE_DIRECTORIES
++            ${OPENGLES2_INCLUDE_DIRS}
++        )
++        list(APPEND WebKit2_LIBRARIES
++            ${OPENGLES2_LIBRARIES}
++        )
++        add_definitions(${OPENGLES2_DEFINITIONS})
++    endif ()
++
++    if (USE_EGL)
++        list(APPEND WebKit2_SYSTEM_INCLUDE_DIRECTORIES
++            ${EGL_INCLUDE_DIRS}
++        )
++        list(APPEND WebKit2_LIBRARIES
++            ${EGL_LIBRARIES}
++        )
++        add_definitions(${EGL_DEFINITIONS})
++    endif ()
++
+     list(APPEND WebKit2_INCLUDE_DIRECTORIES
+         "${THIRDPARTY_DIR}/ANGLE"
+         "${THIRDPARTY_DIR}/ANGLE/include/KHR"
+--
+2.13.4
+
-- 
2.13.4
