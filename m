From: Will Wagner <will_wagner@carallon.com>
Date: Wed, 10 Jul 2013 19:59:38 +0100
Subject: [Buildroot] [PATCH v4 2/2] qt: add powervr and opengl
In-Reply-To: <1373479838-8288-1-git-send-email-spenser@gillilanding.com>
References: <1373479838-8288-1-git-send-email-spenser@gillilanding.com>
Message-ID: <51DDAF1A.5040602@carallon.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 10/07/2013 19:10, Spenser Gilliland wrote:
> Use the following to test:
> /usr/share/qt/examples/opengl/hellogl_es2/hellogl_es2 -qws -display powervr
>
> Signed-off-by: Spenser Gilliland <spenser@gillilanding.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Cc: Sundareson, Prabindh <prabu@ti.com>
> Cc: Peter Korsgaard <jacmet@uclibc.org>
> ---
>   package/qt/Config.gfx.in                |   5 +
>   package/qt/Config.in                    |   8 +
>   package/qt/powervr.ini                  |   2 +
>   package/qt/qt-eglwsegl-use-system.patch | 802 ++++++++++++++++++++++++++++++++
>   package/qt/qt.mk                        |  28 +-
>   5 files changed, 844 insertions(+), 1 deletion(-)
>   create mode 100644 package/qt/powervr.ini
>   create mode 100644 package/qt/qt-eglwsegl-use-system.patch
>
> diff --git a/package/qt/Config.gfx.in b/package/qt/Config.gfx.in
> index dc70665..c983f29 100644
> --- a/package/qt/Config.gfx.in
> +++ b/package/qt/Config.gfx.in
> @@ -23,4 +23,9 @@ config BR2_PACKAGE_QT_GFX_DIRECTFB
>   	depends on BR2_PACKAGE_DIRECTFB
>   	bool "directFB"
>   
> +config BR2_PACKAGE_QT_GFX_POWERVR
> +	depends on BR2_PACKAGE_QT_OPENGL_ES
> +	depends on BR2_PACKAGE_TI_GFX
> +	bool "powervr"
> +

I don't like that this depends on the TI_GFX package. When I added 
powervr support to Qt I added a powervr virtual package the same as 
opengl_es or opengl_egl. This allows Qt to not contain anything specific 
to the hardware graphics package.

>   endmenu
> diff --git a/package/qt/Config.in b/package/qt/Config.in
> index 9f6e54d..35e8208 100644
> --- a/package/qt/Config.in
> +++ b/package/qt/Config.in
> @@ -281,6 +281,14 @@ config BR2_PACKAGE_QT_PHONON_BACKEND
>   	help
>   	  Build the platform Phonon plugin.
>   	  If unsure, say n.
> +
> +config BR2_PACKAGE_QT_OPENGL_ES
> +	bool "OpenGL ES v2.x support"
> +	depends on BR2_PACKAGE_HAS_OPENGL_ES
> +	depends on BR2_PACKAGE_HAS_OPENGL_EGL
> +	help
> +	  Enable the OpenGL ES v2.x support.
> +
>   endif
>   
>   config BR2_PACKAGE_QT_DBUS
> diff --git a/package/qt/powervr.ini b/package/qt/powervr.ini
> new file mode 100644
> index 0000000..57863eb
> --- /dev/null
> +++ b/package/qt/powervr.ini
> @@ -0,0 +1,2 @@
> +[default]
> +WindowSystem=libpvrQWSWSEGL.so.1
> diff --git a/package/qt/qt-eglwsegl-use-system.patch b/package/qt/qt-eglwsegl-use-system.patch
> new file mode 100644
> index 0000000..5464fdc
> --- /dev/null
> +++ b/package/qt/qt-eglwsegl-use-system.patch
> @@ -0,0 +1,802 @@
> +Patch to remove obslete powervr headers and instead use the headers provided
> +on the system.
> +

Is this really necessary. When I got this working I instead used the 
variables provided by Qt to point it to the hardware specific headers. 
The code looks like:

+ifeq ($(BR2_PACKAGE_QT_GFX_POWERVR),y)
+define QT_CONFIGURE_POWERVR
+       $(call 
QT_QMAKE_SET,QMAKE_INCDIR_OPENGL_ES2,$(STAGING_DIR)/usr/include/OGLES2,$(@D))
+       $(call 
QT_QMAKE_SET,QMAKE_INCDIR_EGL,$(STAGING_DIR)/usr/include/OGLES2,$(@D))
+       $(call 
QT_QMAKE_SET,QMAKE_INCDIR_POWERVR,$(STAGING_DIR)/usr/include/pvr2d 
$(STAGING_DIR)/usr/include/wsegl,$(@D))
+endef
+endif

I have this working with both TI and freescale hardware.

I'll check what state my patches are in and if they need rebasing 
against master and then I can post them if people would be interested.

Thanks
Will

-- 
------------------------------------------------------------------------
Will Wagner                                     will_wagner at carallon.com
Development Manager                      Office Tel: +44 (0)20 7371 2032
Carallon Ltd, Studio G20, Shepherds Building, Rockley Rd, London W14 0DA
------------------------------------------------------------------------
