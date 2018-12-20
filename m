From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 20 Dec 2018 20:26:17 +0000
Subject: [Buildroot] =?utf-8?q?=5BBug_11556=5D_Can_not_build_qt5base_5=2E?=
 =?utf-8?q?11=2E2_with_weston_3=2E0=2E0_and_vivante_GPU=2E_error=3A_invali?=
 =?utf-8?b?ZCBjb252ZXJzaW9uIGZyb20g4oCYdm9pZCrigJkgdG8g4oCYRUdMTmF0aXZl?=
 =?utf-8?q?DisplayType_=7Baka_wl=5Fdisplay*=7D=E2=80=99_=5B-fpermissive=5D?=
In-Reply-To: <bug-11556-163@https.bugs.busybox.net/>
References: <bug-11556-163@https.bugs.busybox.net/>
Message-ID: <bug-11556-163-9CcfICkOk6@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=11556

--- Comment #13 from Peter Seiderer <ps.report@gmx.net> ---
Changes on base of given patch to fix compile of polytab_defconfig:

- relax qt5webengine dependency:

--- a/package/qt5/qt5webengine/Config.in
+++ b/package/qt5/qt5webengine/Config.in
@@ -50,7 +50,7 @@ config BR2_PACKAGE_QT5WEBENGINE
        select BR2_PACKAGE_WEBP
        select BR2_PACKAGE_WEBP_DEMUX
        select BR2_PACKAGE_QT5BASE_DBUS
-       select BR2_PACKAGE_QT5BASE_EGLFS
+       select BR2_PACKAGE_QT5BASE_EGLFS if !BR2_PACKAGE_QT5WAYLAND=y
        select BR2_PACKAGE_QT5BASE_FONTCONFIG
        select BR2_PACKAGE_QT5BASE_ICU
        select BR2_PACKAGE_QT5BASE_GUI


- fix eglfs_viv/eglfs_viv_wl (only compile tested):

--- /dev/null
+++ b/package/qt5/qt5base/5.11.3/0005-fix-eglfs_viv.patch
@@ -0,0 +1,20 @@
+---
qt5base-5.11.3/src/plugins/platforms/eglfs/deviceintegration/eglfs_viv/qeglfsvivintegration.cpp_orig
      2018-12-20 21:01:22.231473846 +0100
++++
qt5base-5.11.3/src/plugins/platforms/eglfs/deviceintegration/eglfs_viv/qeglfsvivintegration.cpp
   2018-12-20 21:03:27.017742819 +0100
+@@ -65,7 +65,7 @@
+     VivanteInit();
+     mNativeDisplay = fbGetDisplay();
+ #else
+-    mNativeDisplay = fbGetDisplayByIndex(framebufferIndex());
++    mNativeDisplay =
(EGLNativeDisplayType)fbGetDisplayByIndex(framebufferIndex());
+ #endif
+ 
+     fbGetDisplayGeometry(mNativeDisplay, &width, &height);
+@@ -88,7 +88,7 @@
+     Q_UNUSED(window)
+     Q_UNUSED(format)
+ 
+-    EGLNativeWindowType eglWindow = fbCreateWindow(mNativeDisplay, 0, 0,
size.width(), size.height());
++    EGLNativeWindowType eglWindow =
(EGLNativeWindowType)fbCreateWindow(mNativeDisplay, 0, 0, size.width(),
size.height());
+     return eglWindow;
+ }
+ 

--- /dev/null
+++ b/package/qt5/qt5base/5.11.3/0006-fix-eglfs_viv_wl.patch
@@ -0,0 +1,20 @@
+---
qt5base-5.11.3/src/plugins/platforms/eglfs/deviceintegration/eglfs_viv_wl/qeglfsvivwlintegration.cpp_orig
 2018-12-20 21:03:59.154328914 +0100
++++
qt5base-5.11.3/src/plugins/platforms/eglfs/deviceintegration/eglfs_viv_wl/qeglfsvivwlintegration.cpp
      2018-12-20 21:06:45.217366833 +0100
+@@ -60,7 +60,7 @@
+     }
+ 
+     mWaylandDisplay = wl_display_create();
+-    mNativeDisplay = fbGetDisplay(mWaylandDisplay);
++    mNativeDisplay = (EGLNativeDisplayType)fbGetDisplay(mWaylandDisplay);
+     fbGetDisplayGeometry(mNativeDisplay, &width, &height);
+     mScreenSize.setHeight(height);
+     mScreenSize.setWidth(width);
+@@ -81,7 +81,7 @@
+     Q_UNUSED(window)
+     Q_UNUSED(format)
+ 
+-    EGLNativeWindowType eglWindow = fbCreateWindow(mNativeDisplay, 0, 0,
size.width(), size.height());
++    EGLNativeWindowType eglWindow =
(EGLNativeWindowType)fbCreateWindow(mNativeDisplay, 0, 0, size.width(),
size.height());
+     return eglWindow;
+ }
+ 


- use up to date toolchain/remove extra qt5 configure options, re-select eglfs:

--- a/configs/polytab_defconfig
+++ b/configs/polytab_defconfig
@@ -5,15 +5,8 @@ BR2_ARM_ENABLE_VFP=y
 BR2_ARM_FPU_VFPV3=y
 BR2_OPTIMIZE_3=y
 # BR2_COMPILER_PARANOID_UNSAFE_PATH is not set
-BR2_TOOLCHAIN_EXTERNAL=y
-BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
-BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
-BR2_TOOLCHAIN_EXTERNAL_URL="https://releases.linaro.org/components/toolchain/binaries/4.9-2017.01/arm-linux-gnueabihf/gcc-linaro-4.9.4-2017.01-x86_64_arm-linux-gnueabihf.tar.xz"
-BR2_TOOLCHAIN_EXTERNAL_CUSTOM_PREFIX="$(ARCH)-linux-gnueabihf"
-BR2_TOOLCHAIN_EXTERNAL_GCC_4_9=y
-BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_0=y
-BR2_TOOLCHAIN_EXTERNAL_CUSTOM_GLIBC=y
-BR2_TOOLCHAIN_EXTERNAL_CXX=y
+BR2_TOOLCHAIN_BUILDROOT_GLIBC=y
+BR2_TOOLCHAIN_BUILDROOT_CXX=y
 BR2_TARGET_GENERIC_HOSTNAME="polytab"
 BR2_TARGET_GENERIC_ISSUE="Welcome"
 BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
@@ -32,19 +25,15 @@ BR2_PACKAGE_GST1_IMX_V4L2VIDEOSRC=y
 BR2_PACKAGE_DEJAVU=y
 BR2_PACKAGE_LIBERATION=y
 BR2_PACKAGE_QT5=y
-BR2_PACKAGE_QT5BASE_CUSTOM_CONF_OPTS="-v -opensource -confirm-license -make
libs -device imx6 -compile-examples -no-opengl -opengl es2"
 BR2_PACKAGE_QT5BASE_EXAMPLES=y
 BR2_PACKAGE_QT5BASE_OPENGL_LIB=y
 BR2_PACKAGE_QT5BASE_LINUXFB=y
+BR2_PACKAGE_QT5BASE_EGLFS=y
 BR2_PACKAGE_QT5BASE_DEFAULT_QPA="wayland"
 BR2_PACKAGE_QT5BASE_HARFBUZZ=y
 BR2_PACKAGE_QT5BASE_GIF=y
 BR2_PACKAGE_QT5BASE_JPEG=y

-- 
You are receiving this mail because:
You are on the CC list for the bug.
