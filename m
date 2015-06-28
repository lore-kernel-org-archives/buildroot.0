From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 28 Jun 2015 16:39:16 +0200
Subject: [Buildroot] [PATCH 3/4] package/kodi/kodi: Fix egl/gles
 compilation with mesa3d and disabled X.org
In-Reply-To: <1434273033-31723-3-git-send-email-bernd.kuhls@t-online.de>
References: <1434273033-31723-1-git-send-email-bernd.kuhls@t-online.de>
 <1434273033-31723-3-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20150628143916.GC3950@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernd, All,

On 2015-06-14 11:10 +0200, Bernd Kuhls spake thusly:
> In this case -DMESA_EGL_NO_X11_HEADERS is needed during compilation.
> 
> Fixes this build error
> 
> make[1]: Entering directory `/home/fli4l/br8_kodi/output/build/kodi-14.2-Helix/xbmc/cores/dvdplayer'
> CPP     xbmc/cores/dvdplayer/DVDPlayerVideo.o
> In file included from /home/fli4l/br8_kodi/output/host/usr/i586-buildroot-linux-uclibc/sysroot/usr/include/EGL/egl.h:36:0,
>                  from /home/fli4l/br8_kodi/output/build/kodi-14.2-Helix/xbmc/windowing/egl/WinSystemEGL.h:28,
>                  from /home/fli4l/br8_kodi/output/build/kodi-14.2-Helix/xbmc/windowing/WindowingFactory.h:39,
>                  from DVDPlayerVideo.cpp:23:
> /home/fli4l/br8_kodi/output/host/usr/i586-buildroot-linux-uclibc/sysroot/usr/include/EGL/eglplatform.h:118:22: fatal error: X11/Xlib.h: No such file or directory
>  #include <X11/Xlib.h>
>                       ^
> using this defconfig
> 
> BR2_TOOLCHAIN_BUILDROOT_WCHAR=y
> BR2_TOOLCHAIN_BUILDROOT_CXX=y
> BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
> BR2_PACKAGE_KODI=y
> BR2_PACKAGE_MESA3D=y
> BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_SWRAST=y
> BR2_PACKAGE_MESA3D_OPENGL_EGL=y
> BR2_PACKAGE_MESA3D_OPENGL_ES=y
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
[yann.morin.1998 at free.fr: build-tested only, with this defconfig]
Tested-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  package/kodi/kodi/kodi.mk |    1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/kodi/kodi/kodi.mk b/package/kodi/kodi/kodi.mk
> index 26a5fe1..cecc41f 100644
> --- a/package/kodi/kodi/kodi.mk
> +++ b/package/kodi/kodi/kodi.mk
> @@ -113,6 +113,7 @@ else
>  KODI_CONF_OPTS += --disable-gl --disable-rsxs --disable-sdl --disable-x11 --disable-xrandr
>  ifeq ($(BR2_PACKAGE_KODI_EGL_GLES),y)
>  KODI_DEPENDENCIES += libegl libgles
> +KODI_CONF_ENV += CXXFLAGS="$(TARGET_CXXFLAGS) $(shell $(PKG_CONFIG_HOST_BINARY) --cflags egl)"
>  KODI_CONF_OPTS += --enable-gles
>  else
>  KODI_CONF_OPTS += --disable-gles
> -- 
> 1.7.10.4
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
