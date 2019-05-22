From: Giulio Benetti <giulio.benetti@micronovasrl.com>
Date: Wed, 22 May 2019 15:59:05 +0200
Subject: [Buildroot] [PATCH v2 6/7] package/qt5webengine: re-enable building
 if BUG_85682=y on latest Qt5
In-Reply-To: <20190522135906.30796-1-giulio.benetti@micronovasrl.com>
References: <10430096-81de-792a-8b49-c59ed5e9de2e@micronovasrl.com>
 <20190522135906.30796-1-giulio.benetti@micronovasrl.com>
Message-ID: <20190522135906.30796-7-giulio.benetti@micronovasrl.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

'depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_85862' is listed because libnss
was affected by that bug in latest Qt5, but now that bug has been worked
around.

So remove 'depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_85862' and allow
building latest Qt5 by removing also '|| BR2_PACKAGE_QT5_VERSION_5_6'.

Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
---
 package/qt5/qt5webengine/Config.in | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/package/qt5/qt5webengine/Config.in b/package/qt5/qt5webengine/Config.in
index 744d659567..969582712e 100644
--- a/package/qt5/qt5webengine/Config.in
+++ b/package/qt5/qt5webengine/Config.in
@@ -20,18 +20,12 @@ comment "qt5webengine needs an OpenGL and EGL-capable backend"
 	depends on BR2_PACKAGE_QT5WEBENGINE_ARCH_SUPPORTS
 	depends on !BR2_PACKAGE_QT5_GL_AVAILABLE || !BR2_PACKAGE_HAS_LIBEGL
 
-comment "qt5webengine needs a toolchain not affected by GCC bug 85862"
-	depends on BR2_PACKAGE_QT5WEBENGINE_ARCH_SUPPORTS
-	depends on !BR2_PACKAGE_QT5_VERSION_5_6
-	depends on BR2_TOOLCHAIN_HAS_GCC_BUG_85862 # libnss
-
 config BR2_PACKAGE_QT5WEBENGINE
 	bool "qt5webengine"
 	depends on BR2_PACKAGE_QT5WEBENGINE_ARCH_SUPPORTS
 	depends on BR2_TOOLCHAIN_USES_GLIBC # execinfo.h, mallinfo
 	depends on BR2_HOST_GCC_AT_LEAST_4_8 # qt5base-icu
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # qt5base-icu
-	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_85862 || BR2_PACKAGE_QT5_VERSION_5_6 # libnss
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2, libvpx, qt5base-dbus
 	depends on BR2_USE_WCHAR # libglib2
 	depends on BR2_PACKAGE_QT5_GL_AVAILABLE # qt5declarative, qt5base-eglfs
-- 
2.17.1
