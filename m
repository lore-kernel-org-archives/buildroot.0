From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 30 Dec 2020 11:18:23 +0100
Subject: [Buildroot] [PATCH v1] package/qt5webengine: add optional
 host-freetype/host-libjpeg dependency
In-Reply-To: <20201221203952.22168-3-ps.report@gmx.net>
References: <20201221203952.22168-1-ps.report@gmx.net>
 <20201221203952.22168-3-ps.report@gmx.net>
Message-ID: <20201230111823.3114e2a6@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Peter,

On Mon, 21 Dec 2020 21:39:51 +0100
Peter Seiderer <ps.report@gmx.net> wrote:

> - add optional host-freetype dependency
> 
> Fixes:
> 
>   Command: .../host/bin/python2 .../build/qt5webengine-5.15.2/src/3rdparty/chromium/build/config/linux/pkg-config.py -p .../build/qt5webengine-5.15.2/host-bin/host-pkg-config freetype2
>   Returned 1.
>   stderr:
> 
>   Package freetype2 was not found in the pkg-config search path.
>   Perhaps you should add the directory containing `freetype2.pc'
>   to the PKG_CONFIG_PATH environment variable
>   Package 'freetype2', required by 'virtual:world', not found
>   Could not run pkg-config.
> 
>   See //build/linux/BUILD.gn:24:3: whence it was called.
>     pkg_config("freetype_from_pkgconfig") {
>     ^--------------------------------------
>   See //build/config/freetype/BUILD.gn:10:24: which caused the file to be included.
>       public_configs = [ "//build/linux:freetype_from_pkgconfig" ]
>                          ^--------------------------------------
>   Project ERROR: GN run error!
>   make[4]: *** [Makefile:82: sub-gn_run-pro-make_first] Error 3
>   make[3]: *** [Makefile:79: sub-core-make_first] Error 2
>   make[2]: *** [Makefile:49: sub-src-make_first] Error 2
> 
> - add optiobal hist-libjpeg dependency
> 
> Fixes:
> 
>   https://gitlab.com/buildroot.org/buildroot/-/jobs/917539230
> 
>   Command: .../host/bin/python2 .../build/qt5webengine-5.15.2/src/3rdparty/chromium/build/config/linux/pkg-config.py -p .../build/qt5webengine-5.15.2/host-bin/host-pkg-config libjpeg
>   Returned 1.
>   stderr:
>   Package libjpeg was not found in the pkg-config search path.
>   Perhaps you should add the directory containing `libjpeg.pc'
>   to the PKG_CONFIG_PATH environment variable
>   Package 'libjpeg', required by 'virtual:world', not found
>   Could not run pkg-config.
>   See //third_party/BUILD.gn:17:3: whence it was called.
>     pkg_config("system_libjpeg") {
>     ^-----------------------------
>   See //third_party/blink/renderer/platform/BUILD.gn:159:5: which caused the file to be included.
>       "//third_party:jpeg",
>       ^-------------------
>   Project ERROR: GN run error!
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> ---
>  package/qt5/qt5webengine/qt5webengine.mk | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/package/qt5/qt5webengine/qt5webengine.mk b/package/qt5/qt5webengine/qt5webengine.mk
> index 64c9c96cc2..8ab50a0fbf 100644
> --- a/package/qt5/qt5webengine/qt5webengine.mk
> +++ b/package/qt5/qt5webengine/qt5webengine.mk
> @@ -29,6 +29,14 @@ endif
>  
>  QT5WEBENGINE_DEPENDENCIES += host-libpng host-libnss libnss
>  
> +ifeq ($(BR2_PACKAGE_QT5BASE_FONTCONFIG),y)
> +QT5WEBENGINE_DEPENDENCIES += host-freetype
> +endif
> +
> +ifeq ($(BR2_PACKAGE_QT5BASE_JPEG),y)
> +QT5WEBENGINE_DEPENDENCIES += host-libjpeg
> +endif

This looks really odd. Why would these target-related features require
host-freetype and host-libjpeg ? Aren't we instead seeing some
pkg-config issue where it's trying to find freetype/libjpeg for the
target, but it for some reason doesn't work, and tries to find them for
the host ?

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
