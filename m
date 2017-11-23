From: =?UTF-8?q?Ga=C3=ABl=20PORTAY?= <gael.portay@savoirfairelinux.com>
Date: Thu, 23 Nov 2017 18:26:19 -0500
Subject: [Buildroot] [PATCH v2 1/1] qt5webengine: enable build for 5.6.3
Message-ID: <20171123232619.29849-1-gael.portay@savoirfairelinux.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The build was broken in 5.6.2 and was disabled.

It compiles fine since 5.6.3.

The two additional patches are useful at run-time.

The first one avoid the need to specify the path to the SSL certificate
directory (using an additional environment variable).

The second one is the same used in 5.9.x (plus resolved conflicts). It uses the
process's context to get handles on EGL and GLESv2 libraries. Those libraries
are linked to Qt WebEngine at compile time.

The patch is particularly usefull for RPI boards since the raspberrypi userland
package does not provide the libEGLv2.so.2 and libGLES.so.1 symlinks. Both
library paths are hardcoded in Qt WebEngine.

Signed-off-by: Ga?l PORTAY <gael.portay@savoirfairelinux.com>
---

Changes since v1:
 - reword commit message to include comments from cover-letter
 - format the first patch using git; and add my signed-off-by

 .../5.6.3/0001-Change-default-SSL-directory.patch  | 35 ++++++++
 ...ad-libEGL-and-libGLES2-symbols-implicitly.patch | 93 ++++++++++++++++++++++
 package/qt5/qt5webengine/Config.in                 |  5 --
 package/qt5/qt5webengine/qt5webengine.hash         |  3 +
 4 files changed, 131 insertions(+), 5 deletions(-)
 create mode 100644 package/qt5/qt5webengine/5.6.3/0001-Change-default-SSL-directory.patch
 create mode 100644 package/qt5/qt5webengine/5.6.3/0002-Load-libEGL-and-libGLES2-symbols-implicitly.patch

diff --git a/package/qt5/qt5webengine/5.6.3/0001-Change-default-SSL-directory.patch b/package/qt5/qt5webengine/5.6.3/0001-Change-default-SSL-directory.patch
new file mode 100644
index 0000000000..15cd9f87bb
--- /dev/null
+++ b/package/qt5/qt5webengine/5.6.3/0001-Change-default-SSL-directory.patch
@@ -0,0 +1,35 @@
+From fc41c0f572ff347142cca4bf5d82b87782bb5906 Mon Sep 17 00:00:00 2001
+From: =?utf-8?q?Ga=C3=ABl=20PORTAY?= <gael.portay@savoirfairelinux.com>
+Date: Thu, 23 Nov 2017 16:18:06 -0500
+Subject: [PATCH] Change default SSL directory
+MIME-Version: 1.0
+Content-Type: text/plain; charset=utf-8
+Content-Transfer-Encoding: 8bit
+
+Change the default SSL directory, as buildroot ca-cert package is
+installed at /etc/ssl. That way, we don't have to use the SSL_CERT_DIR
+environment at runtime.
+
+Upstream-Status: Inappropriate
+Signed-off-by: Damien Riegel <damien.riegel@savoirfairelinux.com>
+Signed-off-by: Ga?l PORTAY <gael.portay@savoirfairelinux.com>
+---
+ src/core/qtwebengine_extras.gypi | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/core/qtwebengine_extras.gypi b/src/core/qtwebengine_extras.gypi
+index 229421ef..3b2386c0 100644
+--- a/src/core/qtwebengine_extras.gypi
++++ b/src/core/qtwebengine_extras.gypi
+@@ -96,7 +96,7 @@
+             'GL_GLEXT_PROTOTYPES',
+             'EGL_EGLEXT_PROTOTYPES',
+             # At runtime the env variable SSL_CERT_DIR can be used to override this
+-            'OPENSSLDIR="/usr/lib/ssl"',
++            'OPENSSLDIR="/etc/ssl"',
+             'OPENSSL_LOAD_CONF',
+             'EGL_API_FB=1',
+             'LINUX=1',
+-- 
+2.15.0
+
diff --git a/package/qt5/qt5webengine/5.6.3/0002-Load-libEGL-and-libGLES2-symbols-implicitly.patch b/package/qt5/qt5webengine/5.6.3/0002-Load-libEGL-and-libGLES2-symbols-implicitly.patch
new file mode 100644
index 0000000000..05ed2956d2
--- /dev/null
+++ b/package/qt5/qt5webengine/5.6.3/0002-Load-libEGL-and-libGLES2-symbols-implicitly.patch
@@ -0,0 +1,93 @@
+From bdfd084296681bcead17c42f1e5cf0e24ee04f65 Mon Sep 17 00:00:00 2001
+From: Viktor Engelmann <viktor.engelmann@qt.io>
+Date: Fri, 7 Jul 2017 12:56:19 +0200
+Subject: [PATCH] Load libEGL and libGLES2 symbols implicitly
+MIME-Version: 1.0
+Content-Type: text/plain; charset=utf-8
+Content-Transfer-Encoding: 8bit
+
+Instead of explicitly loading libraries from hard-coded locations,
+we now just call dlopen(NULL, RTLD_LAZY). This returns a handle to
+the host process'es context, which already contains the symbols of
+both these libraries, because we link against them.
+It was necessary to bypass LoadLibrary, because that expects a non-NULL
+file path, so we couldn't pass NULL through that interface.
+
+Upstream-Status: Merged
+Task-number: QTBUG-57761
+Change-Id: I29f037dfe542222b5188a33c7727c81a464a87bb
+Reviewed-by: Allan Sandfeld Jensen <allan.jensen@qt.io>
+Reviewed-by: Michal Klocek <michal.klocek@qt.io>
+Signed-off-by: Ga?l PORTAY <gael.portay@savoirfairelinux.com>
+[gportay: backport from 5.9 and merge conflicts]
+---
+ src/core/surface_factory_qt.cpp | 40 ++++++++--------------------------------
+ 1 file changed, 8 insertions(+), 32 deletions(-)
+
+diff --git a/src/core/surface_factory_qt.cpp b/src/core/surface_factory_qt.cpp
+index 48c91bfc..c6059b67 100644
+--- a/src/core/surface_factory_qt.cpp
++++ b/src/core/surface_factory_qt.cpp
+@@ -51,51 +51,27 @@
+ #if defined(USE_OZONE)
+ 
+ #include <EGL/egl.h>
+-
+-#ifndef QT_LIBDIR_EGL
+-#define QT_LIBDIR_EGL "/usr/lib"
+-#endif
+-#ifndef QT_LIBDIR_GLES2
+-#define QT_LIBDIR_GLES2 QT_LIBDIR_EGL
+-#endif
++#include <dlfcn.h>
+ 
+ namespace QtWebEngineCore {
+ 
+-base::NativeLibrary LoadLibrary(const base::FilePath& filename) {
+-    base::NativeLibraryLoadError error;
+-    base::NativeLibrary library = base::LoadNativeLibrary(filename, &error);
+-    if (!library) {
+-        LOG(ERROR) << "Failed to load " << filename.MaybeAsASCII() << ": " << error.ToString();
+-        return NULL;
+-    }
+-    return library;
+-}
+-
+ bool SurfaceFactoryQt::LoadEGLGLES2Bindings(AddGLLibraryCallback add_gl_library, SetGLGetProcAddressProcCallback set_gl_get_proc_address)
+ {
+-    base::FilePath libEGLPath = QtWebEngineCore::toFilePath(QT_LIBDIR_EGL);
+-    libEGLPath = libEGLPath.Append("libEGL.so.1");
+-    base::NativeLibrary eglLibrary = LoadLibrary(libEGLPath);
+-    if (!eglLibrary)
+-        return false;
+-
+-    base::FilePath libGLES2Path = QtWebEngineCore::toFilePath(QT_LIBDIR_GLES2);
+-    libGLES2Path = libGLES2Path.Append("libGLESv2.so.2");
+-    base::NativeLibrary gles2Library = LoadLibrary(libGLES2Path);
+-    if (!gles2Library)
++    base::NativeLibrary eglgles2Library = dlopen(NULL, RTLD_LAZY);
++    if (!eglgles2Library) {
++        LOG(ERROR) << "Failed to open EGL/GLES2 context " << dlerror();
+         return false;
++    }
+ 
+-    gfx::GLGetProcAddressProc get_proc_address = reinterpret_cast<gfx::GLGetProcAddressProc>(base::GetFunctionPointerFromNativeLibrary(eglLibrary, "eglGetProcAddress"));
++    gfx::GLGetProcAddressProc get_proc_address = reinterpret_cast<gfx::GLGetProcAddressProc>(base::GetFunctionPointerFromNativeLibrary(eglgles2Library, "eglGetProcAddress"));
+     if (!get_proc_address) {
+         LOG(ERROR) << "eglGetProcAddress not found.";
+-        base::UnloadNativeLibrary(eglLibrary);
+-        base::UnloadNativeLibrary(gles2Library);
++        base::UnloadNativeLibrary(eglgles2Library);
+         return false;
+     }
+ 
+     gfx::SetGLGetProcAddressProc(get_proc_address);
+-    gfx::AddGLNativeLibrary(eglLibrary);
+-    gfx::AddGLNativeLibrary(gles2Library);
++    gfx::AddGLNativeLibrary(eglgles2Library);
+     return true;
+ }
+ 
+-- 
+2.15.0
+
diff --git a/package/qt5/qt5webengine/Config.in b/package/qt5/qt5webengine/Config.in
index d40b58062e..d0c8d18210 100644
--- a/package/qt5/qt5webengine/Config.in
+++ b/package/qt5/qt5webengine/Config.in
@@ -20,10 +20,6 @@ comment "qt5webengine needs an OpenGL and EGL-capable backend"
 	depends on BR2_PACKAGE_QT5WEBENGINE_ARCH_SUPPORTS
 	depends on !BR2_PACKAGE_QT5_GL_AVAILABLE || !BR2_PACKAGE_HAS_LIBEGL
 
-comment "qt5webengine is not available with Qt 5.6"
-	depends on BR2_PACKAGE_QT5WEBENGINE_ARCH_SUPPORTS
-	depends on BR2_PACKAGE_QT5_VERSION_5_6
-
 config BR2_PACKAGE_QT5WEBENGINE
 	bool "qt5webengine"
 	depends on BR2_PACKAGE_QT5WEBENGINE_ARCH_SUPPORTS
@@ -35,7 +31,6 @@ config BR2_PACKAGE_QT5WEBENGINE
 	depends on BR2_PACKAGE_QT5_GL_AVAILABLE # qt5declarative, qt5base-eglfs
 	depends on BR2_PACKAGE_HAS_LIBEGL # qt5base-eglfs
 	depends on BR2_PACKAGE_HAS_UDEV
-	depends on !BR2_PACKAGE_QT5_VERSION_5_6
 	# v8 (a chromium 3rd-party) compiles its internal host-tools with the
 	# same word size as the target. For 32-bits targets, it adds the -m32
 	# flag (for 64-bits, it adds the -m64 flag).
diff --git a/package/qt5/qt5webengine/qt5webengine.hash b/package/qt5/qt5webengine/qt5webengine.hash
index 918f7edb3a..f71889e251 100644
--- a/package/qt5/qt5webengine/qt5webengine.hash
+++ b/package/qt5/qt5webengine/qt5webengine.hash
@@ -1,2 +1,5 @@
+# Hash from https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qtwebengine-opensource-src-5.6.3.tar.xz.mirrorlist
+sha256 009d69fb39f6c0e2b0cd89a7e9302cd0ae1872d02c787d3a37f2cacca5ddb7a7 qtwebengine-opensource-src-5.6.3.tar.xz
+
 # Hash from: https://download.qt.io/official_releases/qt/5.9/5.9.2/submodules/qtwebengine-opensource-src-5.9.2.tar.xz.mirrorlist
 sha256 cab069e4589f806640bebe4077c70e5cd5ffeb146c6e8caca6c4454fc0c4a108 qtwebengine-opensource-src-5.9.2.tar.xz
-- 
2.15.0
