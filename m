From: =?ISO-8859-1?Q?Ezequiel_Garc=EDa?= <ezequiel@vanguardiasur.com.ar>
Date: Mon, 14 Oct 2013 11:13:36 -0300
Subject: [Buildroot] [PATCH v2 1/6] qt5: bump to 5.1.1
In-Reply-To: <1379655795-22429-2-git-send-email-fatih.asici@gmail.com>
References: <1379655795-22429-1-git-send-email-fatih.asici@gmail.com>
 <1379655795-22429-2-git-send-email-fatih.asici@gmail.com>
Message-ID: <CAAEAJfB7Q2VwaaY+U4S+gjEAPCXuj28k3TcLWgia+s9hUDORxA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 20 September 2013 02:43, Fatih A??c? <fatih.asici@gmail.com> wrote:
> Following patches are removed since they are upstreamed:
>   - qt5base/qt5base-0001-eglconvenience-add-egl-to-CONFIG-to-get-correct-incl.patch
>   - qt5jsbackend/qt5jsbackend-0002-fix-uclibc.patch
>
> Remove "-nomake demos" from configure options since "demos" directory is
> merged into examples.
>
> Signed-off-by: Fatih A??c? <fatih.asici@gmail.com>
> ---
>  package/qt5/qt5.mk                                 |    4 +--
>  package/qt5/qt5base/Config.in                      |    2 ++
>  ...nce-add-egl-to-CONFIG-to-get-correct-incl.patch |   32 -------------------
>  ...-Add-egl-cflags-when-opengles2-is-enabled.patch |   32 +++++++++++++++++++
>  .../qt5/qt5base/qt5base-0002-mkspecs-files.patch   |    5 +--
>  package/qt5/qt5base/qt5base.mk                     |   10 ++++--
>  package/qt5/qt5declarative/qt5declarative.mk       |    1 +
>  .../qt5jsbackend-0002-fix-uclibc.patch             |   33 --------------------
>  package/qt5/qt5quick1/qt5quick1.mk                 |    3 +-
>  9 files changed, 48 insertions(+), 74 deletions(-)
>  delete mode 100644 package/qt5/qt5base/qt5base-0001-eglconvenience-add-egl-to-CONFIG-to-get-correct-incl.patch
>  create mode 100644 package/qt5/qt5base/qt5base-0001-xcb-Add-egl-cflags-when-opengles2-is-enabled.patch
>  delete mode 100644 package/qt5/qt5jsbackend/qt5jsbackend-0002-fix-uclibc.patch
>
> diff --git a/package/qt5/qt5.mk b/package/qt5/qt5.mk
> index fce0ca3..671a217 100644
> --- a/package/qt5/qt5.mk
> +++ b/package/qt5/qt5.mk
> @@ -1,5 +1,5 @@
> -QT5_VERSION = 5.0.2
> -QT5_SITE = http://download.qt-project.org/archive/qt/5.0/$(QT5_VERSION)/submodules/
> +QT5_VERSION = 5.1.1
> +QT5_SITE = http://download.qt-project.org/official_releases/qt/5.1/$(QT5_VERSION)/submodules/
>  include $(sort $(wildcard package/qt5/*/*.mk))
>
>  define QT5_LA_PRL_FILES_FIXUP
> diff --git a/package/qt5/qt5base/Config.in b/package/qt5/qt5base/Config.in
> index 9c7fd15..e433373 100644
> --- a/package/qt5/qt5base/Config.in
> +++ b/package/qt5/qt5base/Config.in
> @@ -104,6 +104,7 @@ if BR2_PACKAGE_QT5BASE_GUI
>
>  config BR2_PACKAGE_QT5BASE_WIDGETS
>         bool "widgets module"
> +       select BR2_PACKAGE_XLIB_LIBXEXT if BR2_PACKAGE_QT5BASE_XCB
>         help
>           This option enables the Qt5Widgets library.
>
> @@ -122,6 +123,7 @@ config BR2_PACKAGE_QT5BASE_XCB
>         select BR2_PACKAGE_XCB_UTIL_IMAGE
>         select BR2_PACKAGE_XCB_UTIL_KEYSYMS
>         select BR2_PACKAGE_XCB_UTIL_WM
> +       select BR2_PACKAGE_LIBXKBCOMMON
>
>  comment "X.org XCB backend available if X.org is enabled"
>         depends on !BR2_PACKAGE_XORG7
> diff --git a/package/qt5/qt5base/qt5base-0001-eglconvenience-add-egl-to-CONFIG-to-get-correct-incl.patch b/package/qt5/qt5base/qt5base-0001-eglconvenience-add-egl-to-CONFIG-to-get-correct-incl.patch
> deleted file mode 100644
> index a85a5aa..0000000
> --- a/package/qt5/qt5base/qt5base-0001-eglconvenience-add-egl-to-CONFIG-to-get-correct-incl.patch
> +++ /dev/null
> @@ -1,32 +0,0 @@
> -From 588c60d0c3d11e79d19860fa62b03c935658d13a Mon Sep 17 00:00:00 2001
> -From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> -Date: Sun, 13 Jan 2013 14:36:48 +0100
> -Subject: [PATCH qtbase] eglconvenience: add egl to CONFIG to get correct include
> - paths
> -
> -The eglconvenience code includes <EGL/egl.h>. Therefore, it should get
> -the appropriate EGL-specific include paths from QMAKE_INCDIR_EGL,
> -otherwise the build might if the EGL library has its headers in
> -special locations. In order to achieve this, we simply add the "egl"
> -feature to the list of features imported by eglconvenience.
> -
> -Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ----
> - .../eglconvenience/eglconvenience.pri              |    1 +
> - 1 file changed, 1 insertion(+)
> -
> -diff --git a/src/platformsupport/eglconvenience/eglconvenience.pri b/src/platformsupport/eglconvenience/eglconvenience.pri
> -index 188eb1c..8996cea 100644
> ---- a/src/platformsupport/eglconvenience/eglconvenience.pri
> -+++ b/src/platformsupport/eglconvenience/eglconvenience.pri
> -@@ -5,6 +5,7 @@ contains(QT_CONFIG,egl) {
> -     SOURCES += \
> -         $$PWD/qeglconvenience.cpp \
> -         $$PWD/qeglplatformcontext.cpp
> -+    CONFIG += egl
> -
> -     contains(QT_CONFIG,xlib) {
> -         HEADERS += \
> ---
> -1.7.9.5
> -
> diff --git a/package/qt5/qt5base/qt5base-0001-xcb-Add-egl-cflags-when-opengles2-is-enabled.patch b/package/qt5/qt5base/qt5base-0001-xcb-Add-egl-cflags-when-opengles2-is-enabled.patch
> new file mode 100644
> index 0000000..87acd9b
> --- /dev/null
> +++ b/package/qt5/qt5base/qt5base-0001-xcb-Add-egl-cflags-when-opengles2-is-enabled.patch
> @@ -0,0 +1,32 @@
> +From cbffa1e467a4c8b9e8061364b69e250b23fb7b59 Mon Sep 17 00:00:00 2001
> +From: =?UTF-8?q?Fatih=20A=C5=9F=C4=B1c=C4=B1?= <fatih.asici@gmail.com>
> +Date: Sun, 15 Sep 2013 11:15:33 +0300
> +Subject: [PATCH] xcb: Add egl cflags when opengles2 is enabled
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=UTF-8
> +Content-Transfer-Encoding: 8bit
> +
> +This patch is sent to upstream and applied:
> +https://qt.gitorious.org/qt/qtbase/commit/ff7b57bbb936bc86a64aa2a947fa8984adf400c8
> +
> +Signed-off-by: Fatih A??c? <fatih.asici@gmail.com>
> +---
> + src/plugins/platforms/xcb/xcb-plugin.pro |    2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/src/plugins/platforms/xcb/xcb-plugin.pro b/src/plugins/platforms/xcb/xcb-plugin.pro
> +index 8299528..bc21afe 100644
> +--- a/src/plugins/platforms/xcb/xcb-plugin.pro
> ++++ b/src/plugins/platforms/xcb/xcb-plugin.pro
> +@@ -73,7 +73,7 @@ contains(QT_CONFIG, xcb-render) {
> + contains(QT_CONFIG, opengl) {
> +     contains(QT_CONFIG, opengles2) {
> +         DEFINES += XCB_USE_EGL
> +-        LIBS += -lEGL
> ++        CONFIG += egl
> +         HEADERS += qxcbeglsurface.h
> +
> +         # EGL on MeeGo 1.2 Harmattan needs this macro to map EGLNativeDisplayType
> +--
> +1.7.10.4
> +
> diff --git a/package/qt5/qt5base/qt5base-0002-mkspecs-files.patch b/package/qt5/qt5base/qt5base-0002-mkspecs-files.patch
> index bfa9c15..e406cfc 100644
> --- a/package/qt5/qt5base/qt5base-0002-mkspecs-files.patch
> +++ b/package/qt5/qt5base/qt5base-0002-mkspecs-files.patch
> @@ -14,9 +14,9 @@ Index: b/mkspecs/devices/linux-buildroot-g++/qmake.conf
>  ===================================================================
>  --- /dev/null
>  +++ b/mkspecs/devices/linux-buildroot-g++/qmake.conf
> -@@ -0,0 +1,43 @@
> +@@ -0,0 +1,44 @@
>  +MAKEFILE_GENERATOR      = UNIX
> -+CONFIG                  += incremental gdb_dwarf_index
> ++CONFIG                 += incremental gdb_dwarf_index
>  +QMAKE_INCREMENTAL_STYLE = sublib
>  +
>  +include(../../common/linux.conf)
> @@ -41,6 +41,7 @@ Index: b/mkspecs/devices/linux-buildroot-g++/qmake.conf
>  +# modifications to linux.conf
>  +QMAKE_AR                = $${BUILDROOT_CROSS_COMPILE}ar cqs
>  +QMAKE_OBJCOPY           = $${BUILDROOT_CROSS_COMPILE}objcopy
> ++QMAKE_NM                = $${BUILDROOT_CROSS_COMPILE}nm -P
>  +QMAKE_STRIP             = $${BUILDROOT_CROSS_COMPILE}strip
>  +
>  +#modifications to gcc-base.conf
> diff --git a/package/qt5/qt5base/qt5base.mk b/package/qt5/qt5base/qt5base.mk
> index ddc5574..0106c2c 100644
> --- a/package/qt5/qt5base/qt5base.mk
> +++ b/package/qt5/qt5base/qt5base.mk
> @@ -84,13 +84,17 @@ QT5BASE_CONFIGURE_OPTS += $(if $(BR2_PACKAGE_QT5BASE_DIRECTFB),-directfb,-no-dir
>  QT5BASE_DEPENDENCIES   += $(if $(BR2_PACKAGE_QT5BASE_DIRECTFB),directfb)
>
>  ifeq ($(BR2_PACKAGE_QT5BASE_XCB),y)
> -QT5BASE_CONFIGURE_OPTS += -xcb
> +QT5BASE_CONFIGURE_OPTS += -xcb -system-xkbcommon
>  QT5BASE_DEPENDENCIES   += \
>         libxcb \
>         xcb-util-wm \
>         xcb-util-image \
>         xcb-util-keysyms \
> -       xlib_libX11
> +       xlib_libX11 \
> +       libxkbcommon
> +ifeq ($(BR2_PACKAGE_QT5BASE_WIDGETS),y)
> +QT5BASE_DEPENDENCIES   += xlib_libXext
> +endif
>  else
>  QT5BASE_CONFIGURE_OPTS += -no-xcb
>  endif
> @@ -172,7 +176,7 @@ define QT5BASE_CONFIGURE_CMDS
>                 -sysroot $(STAGING_DIR) \
>                 -plugindir /usr/lib/qt/plugins \
>                 -no-rpath \
> -               -nomake examples -nomake demos -nomake tests \
> +               -nomake examples -nomake tests \
>                 -device buildroot \
>                 -no-c++11 \
>                 $(QT5BASE_CONFIGURE_OPTS) \
> diff --git a/package/qt5/qt5declarative/qt5declarative.mk b/package/qt5/qt5declarative/qt5declarative.mk
> index 603c0e7..943f33d 100644
> --- a/package/qt5/qt5declarative/qt5declarative.mk
> +++ b/package/qt5/qt5declarative/qt5declarative.mk
> @@ -39,6 +39,7 @@ ifeq ($(BR2_PREFER_STATIC_LIB),)
>  define QT5DECLARATIVE_INSTALL_TARGET_LIBS
>         cp -dpf $(STAGING_DIR)/usr/lib/libQt5Qml*.so.* $(TARGET_DIR)/usr/lib
>         cp -dpf $(STAGING_DIR)/usr/lib/libQt5Quick*.so.* $(TARGET_DIR)/usr/lib
> +       cp -dpfr $(STAGING_DIR)/usr/lib/qt/plugins/accessible $(TARGET_DIR)/usr/lib/qt/plugins
>         cp -dpfr $(STAGING_DIR)/usr/lib/qt/plugins/qml* $(TARGET_DIR)/usr/lib/qt/plugins
>  endef
>  endif
> diff --git a/package/qt5/qt5jsbackend/qt5jsbackend-0002-fix-uclibc.patch b/package/qt5/qt5jsbackend/qt5jsbackend-0002-fix-uclibc.patch
> deleted file mode 100644
> index 50a6dbc..0000000
> --- a/package/qt5/qt5jsbackend/qt5jsbackend-0002-fix-uclibc.patch
> +++ /dev/null
> @@ -1,33 +0,0 @@
> -Fix build on uClibc
> -
> -Patch taken from https://code.google.com/p/v8/source/detail?r=12094.
> -
> -Review URL: https://chromiumcodereview.appspot.com/10784012
> -Patch from Remi Duraffort <remi.duraffort@st.com>.
> -
> -Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> -
> -Index: qt5jsbackend-5.0.0/src/3rdparty/v8/src/platform-linux.cc
> -===================================================================
> ---- qt5jsbackend-5.0.0.orig/src/3rdparty/v8/src/platform-linux.cc      2012-12-18 20:04:01.000000000 +0100
> -+++ qt5jsbackend-5.0.0/src/3rdparty/v8/src/platform-linux.cc   2013-03-03 20:31:46.000000000 +0100
> -@@ -1030,7 +1030,8 @@
> -   sample->fp = reinterpret_cast<Address>(mcontext.gregs[REG_RBP]);
> - #elif V8_HOST_ARCH_ARM
> - // An undefined macro evaluates to 0, so this applies to Android's Bionic also.
> --#if (__GLIBC__ < 2 || (__GLIBC__ == 2 && __GLIBC_MINOR__ <= 3))
> -+#if (__GLIBC__ < 2 || (__GLIBC__ == 2 && __GLIBC_MINOR__ <= 3) && \
> -+     !defined(__UCLIBC__))
> -   sample->pc = reinterpret_cast<Address>(mcontext.gregs[R15]);
> -   sample->sp = reinterpret_cast<Address>(mcontext.gregs[R13]);
> -   sample->fp = reinterpret_cast<Address>(mcontext.gregs[R11]);
> -@@ -1038,7 +1039,8 @@
> -   sample->pc = reinterpret_cast<Address>(mcontext.arm_pc);
> -   sample->sp = reinterpret_cast<Address>(mcontext.arm_sp);
> -   sample->fp = reinterpret_cast<Address>(mcontext.arm_fp);
> --#endif  // (__GLIBC__ < 2 || (__GLIBC__ == 2 && __GLIBC_MINOR__ <= 3))
> -+#endif  // (__GLIBC__ < 2 || (__GLIBC__ == 2 && __GLIBC_MINOR__ <= 3) &&
> -+        // !defined(__UCLIBC__))
> - #elif V8_HOST_ARCH_MIPS
> -   sample->pc = reinterpret_cast<Address>(mcontext.pc);
> -   sample->sp = reinterpret_cast<Address>(mcontext.gregs[29]);
> diff --git a/package/qt5/qt5quick1/qt5quick1.mk b/package/qt5/qt5quick1/qt5quick1.mk
> index 9bd36db..d1b0b36 100644
> --- a/package/qt5/qt5quick1/qt5quick1.mk
> +++ b/package/qt5/qt5quick1/qt5quick1.mk
> @@ -35,8 +35,7 @@ endef
>
>  define QT5QUICK1_INSTALL_TARGET_CMDS
>         cp -dpf $(STAGING_DIR)/usr/lib/libQt5Declarative.so.* $(TARGET_DIR)/usr/lib
> -       cp -dpf $(STAGING_DIR)/usr/lib/qt/plugins/qmltooling/libqmldbg_inspector.so $(TARGET_DIR)/usr/lib/qt/plugins/qmltooling/
> -       cp -dpf $(STAGING_DIR)/usr/lib/qt/plugins/qmltooling/libqmldbg_tcp_qtdeclarative.so $(TARGET_DIR)/usr/lib/qt/plugins/qmltooling/
> +       cp -dpfr $(STAGING_DIR)/usr/lib/qt/plugins/qml1tooling $(TARGET_DIR)/usr/lib/qt/plugins/
>         cp -dpfr $(STAGING_DIR)/usr/imports $(TARGET_DIR)/usr
>  endef
>
> --
> 1.7.10.4
>

Tested-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>

Hope Peter picks this soon ;-)
-- 
Ezequiel Garc?a, VanguardiaSur
www.vanguardiasur.com.ar
