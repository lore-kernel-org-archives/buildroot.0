From: Gary Bisson <gary.bisson@boundarydevices.com>
Date: Thu, 30 Apr 2015 10:55:26 +0200
Subject: [Buildroot] [v6,
	10/15] qt5base: fix "Unable to find an X11 visual" error
In-Reply-To: <1421451251-23366-11-git-send-email-jezz@sysmic.org>
References: <1421451251-23366-11-git-send-email-jezz@sysmic.org>
Message-ID: <20150430085526.GJ24549@t450s.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

On Sat, Jan 17, 2015 at 12:34:06AM +0100, J?r?me Pouiller wrote:
> Fix "Unable to find an X11 visual" bug that produce at runtime with Vivante
> drivers. Add a conditionnal patch and add variable QT5BASE_EXTRA_CFLAGS in
> order to enable workaround.
> 
> Signed-off-by: J?r?me Pouiller <jezz@sysmic.org>
> ---
>  .../qt5/qt5base/0001-Force_egl_visual_ID_33.patch  | 26 ++++++++++++++++++++++
>  package/qt5/qt5base/qt5base.mk                     |  6 +++--
>  2 files changed, 30 insertions(+), 2 deletions(-)
>  create mode 100644 package/qt5/qt5base/0001-Force_egl_visual_ID_33.patch
> 
> diff --git a/package/qt5/qt5base/0001-Force_egl_visual_ID_33.patch b/package/qt5/qt5base/0001-Force_egl_visual_ID_33.patch
> new file mode 100644
> index 0000000..e7e6c5e
> --- /dev/null
> +++ b/package/qt5/qt5base/0001-Force_egl_visual_ID_33.patch
> @@ -0,0 +1,26 @@
> +Workaround EGL initialization failure due visual mismatch
> +
> +Error:
> +
> +Warning: EGL suggested using X Visual ID 33 (RGB888) for EGL config 28 (RGB444), but this is incompatable
> +Unable to find an X11 visual which matches EGL config 28
> +Could not initialize EGL
> +Aborted
> +
> +Upstream-Status: Inappropriate [workaround]
> +
> +Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> +
> +diff -Naur qtbase-opensource-src-5.1.1_original/src/platformsupport/eglconvenience/qxlibeglintegration.cpp qtbase-opensource-src-5.1.1/src/platformsupport/eglconvenience/qxlibeglintegration.cpp
> +--- qtbase-opensource-src-5.1.1_original/src/platformsupport/eglconvenience/qxlibeglintegration.cpp	2013-12-25 19:08:42.163895341 -0800
> ++++ qtbase-opensource-src-5.1.1/src/platformsupport/eglconvenience/qxlibeglintegration.cpp	2013-12-25 19:09:37.207893799 -0800
> +@@ -180,5 +180,9 @@
> +     }
> + 
> +     qWarning("Unable to find an X11 visual which matches EGL config %d", configId);
> ++#ifdef ENABLE_MX6_WORKAROUND
> ++    return (VisualID)33;
> ++#else
> +     return (VisualID)0;
> ++#endif
> + }
> diff --git a/package/qt5/qt5base/qt5base.mk b/package/qt5/qt5base/qt5base.mk
> index a36359d..4796785 100644
> --- a/package/qt5/qt5base/qt5base.mk
> +++ b/package/qt5/qt5base/qt5base.mk
> @@ -172,6 +172,8 @@ QT5BASE_INSTALL_LIBS_$(BR2_PACKAGE_QT5BASE_PRINTSUPPORT) += Qt5PrintSupport
>  
>  QT5BASE_INSTALL_LIBS_$(BR2_PACKAGE_QT5BASE_DBUS) += Qt5DBus
>  
> +QT5BASE_EXTRA_CFLAGS = $(if $(BR2_PACKAGE_GPU_VIV_BIN_MX6Q),-DENABLE_MX6_WORKAROUND)
> +
>  define QT5BASE_CONFIGURE_CMDS
>  	(cd $(@D); \
>  		PKG_CONFIG="$(PKG_CONFIG_HOST_BINARY)" \
> @@ -192,8 +194,8 @@ define QT5BASE_CONFIGURE_CMDS
>  		-device buildroot \
>  		-device-option CROSS_COMPILE="$(TARGET_CROSS)" \
>  		-device-option BR_CCACHE="$(CCACHE)" \
> -		-device-option BR_COMPILER_CFLAGS="$(TARGET_CFLAGS)" \
> -		-device-option BR_COMPILER_CXXFLAGS="$(TARGET_CXXFLAGS)" \
> +		-device-option BR_COMPILER_CFLAGS="$(TARGET_CFLAGS)$(QT5BASE_EXTRA_CFLAGS)" \
> +		-device-option BR_COMPILER_CXXFLAGS="$(TARGET_CXXFLAGS)$(QT5BASE_EXTRA_CFLAGS)" \
>  		-device-option EGLFS_PLATFORM_HOOKS_SOURCES="$(QT5BASE_EGLFS_PLATFORM_HOOKS_SOURCES)" \
>  		-no-c++11 \
>  		$(QT5BASE_CONFIGURE_OPTS) \

As explained in my answer to the cover letter, this series of patch has
been successfully tested on a Nitrogen6x board.
http://lists.busybox.net/pipermail/buildroot/2015-April/124739.html

Tested-by: Gary Bisson <gary.bisson@boundarydevices.com>

This patch is actually an improvement over the fix available in Yocto:
https://github.com/Freescale/meta-fsl-arm/blob/dizzy/qt5-layer/recipes-qt/qt5/qtbase/Force_egl_visual_ID_33.patch

Reviewed-by: Gary Bisson <gary.bisson@boundarydevices.com>

Regards,
Gary
