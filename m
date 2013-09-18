From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 18 Sep 2013 19:04:37 +0200
Subject: [Buildroot] [PATCH 1/5] qt5: bump to 5.1.1
In-Reply-To: <1379485693-822-2-git-send-email-fatih.asici@gmail.com>
References: <1379485693-822-1-git-send-email-fatih.asici@gmail.com>
 <1379485693-822-2-git-send-email-fatih.asici@gmail.com>
Message-ID: <20130918190437.6640e141@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Fatih A??c?,

Nice!

However, I believe this bump is far from being trivial, and the commit
log should therefore give a lot more details about the changes being
made. A few questions below to show the kind of details that I believe
are missing.

On Wed, 18 Sep 2013 09:28:09 +0300, Fatih A??c? wrote:
> diff --git a/package/qt5/qt5base/qt5base-eglconvenience-add-egl-to-CONFIG-to-get-correct-incl.patch b/package/qt5/qt5base/qt5base-eglconvenience-add-egl-to-CONFIG-to-get-correct-incl.patch
> deleted file mode 100644
> index a85a5aa..0000000
> --- a/package/qt5/qt5base/qt5base-eglconvenience-add-egl-to-CONFIG-to-get-correct-incl.patch
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

Why is this patch removed? Was this fixed in Qt upstream? I see you're
adding a CONFIG += egl in another patch, but only for the X.org case.

> diff --git a/package/qt5/qt5base/qt5base-mkspecs-files.patch b/package/qt5/qt5base/qt5base-mkspecs-files.patch
> index bfa9c15..e406cfc 100644
> --- a/package/qt5/qt5base/qt5base-mkspecs-files.patch
> +++ b/package/qt5/qt5base/qt5base-mkspecs-files.patch
> @@ -14,9 +14,9 @@ Index: b/mkspecs/devices/linux-buildroot-g++/qmake.conf
>  ===================================================================
>  --- /dev/null
>  +++ b/mkspecs/devices/linux-buildroot-g++/qmake.conf
> -@@ -0,0 +1,43 @@
> +@@ -0,0 +1,44 @@
>  +MAKEFILE_GENERATOR      = UNIX
> -+CONFIG                  += incremental gdb_dwarf_index
> ++CONFIG                 += incremental gdb_dwarf_index

Is this change needed? Seems like white space change only, no?

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
>  	libxcb \
>  	xcb-util-wm \
>  	xcb-util-image \
>  	xcb-util-keysyms \
> -	xlib_libX11
> +	xlib_libX11 \
> +	libxkbcommon
> +ifeq ($(BR2_PACKAGE_QT5BASE_WIDGETS),y)
> +QT5BASE_DEPENDENCIES   += xlib_libXext
> +endif
>  else
>  QT5BASE_CONFIGURE_OPTS += -no-xcb
>  endif
> @@ -172,7 +176,7 @@ define QT5BASE_CONFIGURE_CMDS
>  		-sysroot $(STAGING_DIR) \
>  		-plugindir /usr/lib/qt/plugins \
>  		-no-rpath \
> -		-nomake examples -nomake demos -nomake tests \
> +		-nomake examples -nomake tests \

No more demos to disable?

>  		-device buildroot \
>  		-no-c++11 \
>  		$(QT5BASE_CONFIGURE_OPTS) \
> diff --git a/package/qt5/qt5declarative/qt5declarative.mk b/package/qt5/qt5declarative/qt5declarative.mk
> index 603c0e7..943f33d 100644
> --- a/package/qt5/qt5declarative/qt5declarative.mk
> +++ b/package/qt5/qt5declarative/qt5declarative.mk
> @@ -39,6 +39,7 @@ ifeq ($(BR2_PREFER_STATIC_LIB),)
>  define QT5DECLARATIVE_INSTALL_TARGET_LIBS
>  	cp -dpf $(STAGING_DIR)/usr/lib/libQt5Qml*.so.* $(TARGET_DIR)/usr/lib
>  	cp -dpf $(STAGING_DIR)/usr/lib/libQt5Quick*.so.* $(TARGET_DIR)/usr/lib
> +	cp -dpfr $(STAGING_DIR)/usr/lib/qt/plugins/accessible $(TARGET_DIR)/usr/lib/qt/plugins
>  	cp -dpfr $(STAGING_DIR)/usr/lib/qt/plugins/qml* $(TARGET_DIR)/usr/lib/qt/plugins
>  endef
>  endif
> diff --git a/package/qt5/qt5jsbackend/qt5jsbackend-fix-uclibc.patch b/package/qt5/qt5jsbackend/qt5jsbackend-fix-uclibc.patch
> deleted file mode 100644
> index 50a6dbc..0000000
> --- a/package/qt5/qt5jsbackend/qt5jsbackend-fix-uclibc.patch
> +++ /dev/null

So this patch was merged upstream? Or is no longer needed?

>  ifeq ($(BR2_PACKAGE_QT5BASE_LICENSE_APPROVED),y)
> -QT5QUICK1_CONFIGURE_OPTS += -opensource -confirm-license

Hum why does this gets removed from qt5quick1 but not the other
packages? Maybe it's only needed in qt5base, but in this case, it
should be removed from all other packages, and as a separate patch,
since it's unrelated to the version bump, no?

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
