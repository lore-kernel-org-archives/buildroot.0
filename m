From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 3 Feb 2020 17:26:21 +0100
Subject: [Buildroot] [PATCH v11 1/1] package/weston: bump to version
 8.0.0
In-Reply-To: <20200203110810.122620-1-james.hilliard1@gmail.com>
References: <20200203110810.122620-1-james.hilliard1@gmail.com>
Message-ID: <20200203162621.GG3299@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

James, All,

On 2020-02-03 04:08 -0700, James Hilliard spake thusly:
> The autotools build system is deprecated and replaced with meson for weston.
> 
> We need to enable pango when building demo clients since it is required
> by meson.
> 
> The dbus option in autotools is replaced with launcher-logind in meson
> which is only ever used with systemd, so add it to the condition.
> 
> Replaced WESTON_NATIVE_BACKEND with backend-default in meson.
> 
> Added systemd dependency as launcher-logind depends on both dbus
> and systemd and is the only dependency that requires dbus.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> Tested-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Applied to master, thanks! :-)

Regards,
Yann E. MORIN.

> ---
> Changes v10 -> v11:
>   - rebase and cleanup
> 
> Changes v9 -> v10:
>   - style and config cleanup
>   - removed and disabled pipewire
> 
> Changes v8 -> v9:
>   - add patch fixing missing defines on pre-v3.17 kernels
> 
> Changes v7 -> v8:
>   - add patch fixing missing sys/mman.h includes
> 
> Changes v6 -> v7:
>   - bump weston from 7.0.0 to 8.0.0
> 
> Changes v5 -> v6:
>   - add pipewire support
> 
> Changes v4 -> v5:
>   - fix up demo clients dependencies
> 
> Changes v3 -> v4:
>   - bump weston from 6.0.1 to 7.0.0
> 
> Changes v2 -> v3:
>   - fix dmabuf-v4l headers check
>   - add choice menu to select default weston backend
> 
> Changes v1 -> v2:
>   - Require both systemd and dbus for launcher-logind
>   - Move dmabuf-v4l out of egl/gl block
>   - Update imx-gpu-g2d requirement block
> ---
>  ...include-sys-mman.h-in-os-compatibili.patch | 38 ++++++++
>  ...issing-defines-for-pre-v3.17-kernels.patch | 42 ++++++++
>  package/weston/Config.in                      | 15 +++
>  package/weston/weston.hash                    | 10 +-
>  package/weston/weston.mk                      | 95 ++++++++++---------
>  5 files changed, 149 insertions(+), 51 deletions(-)
>  create mode 100644 package/weston/0001-unconditionally-include-sys-mman.h-in-os-compatibili.patch
>  create mode 100644 package/weston/0002-add-missing-defines-for-pre-v3.17-kernels.patch
> 
> diff --git a/package/weston/0001-unconditionally-include-sys-mman.h-in-os-compatibili.patch b/package/weston/0001-unconditionally-include-sys-mman.h-in-os-compatibili.patch
> new file mode 100644
> index 0000000000..0c632fbf35
> --- /dev/null
> +++ b/package/weston/0001-unconditionally-include-sys-mman.h-in-os-compatibili.patch
> @@ -0,0 +1,38 @@
> +From 888dd1ae6a0261230b2bc47079d7b20df8c05e68 Mon Sep 17 00:00:00 2001
> +From: James Hilliard <james.hilliard1@gmail.com>
> +Date: Sat, 1 Feb 2020 20:02:29 -0700
> +Subject: [PATCH] unconditionally include sys/mman.h in os-compatibility.c
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=UTF-8
> +Content-Transfer-Encoding: 8bit
> +
> +Fixes:
> +../shared/os-compatibility.c:273:25: error: ?PROT_READ? undeclared (first use in this function); did you mean ?LOCK_READ??
> +  map = mmap(NULL, size, PROT_READ | PROT_WRITE, MAP_SHARED, file->fd, 0);
> +                         ^~~~~~~~~
> +                         LOCK_READ
> +
> +Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> +[Upstream status:
> +https://gitlab.freedesktop.org/wayland/weston/merge_requests/368]
> +---
> + shared/os-compatibility.c | 2 --
> + 1 file changed, 2 deletions(-)
> +
> +diff --git a/shared/os-compatibility.c b/shared/os-compatibility.c
> +index 5e1ce479..ddc37807 100644
> +--- a/shared/os-compatibility.c
> ++++ b/shared/os-compatibility.c
> +@@ -35,9 +35,7 @@
> + #include <stdlib.h>
> + #include <libweston/zalloc.h>
> + 
> +-#ifdef HAVE_MEMFD_CREATE
> + #include <sys/mman.h>
> +-#endif
> + 
> + #include "os-compatibility.h"
> + 
> +-- 
> +2.20.1
> +
> diff --git a/package/weston/0002-add-missing-defines-for-pre-v3.17-kernels.patch b/package/weston/0002-add-missing-defines-for-pre-v3.17-kernels.patch
> new file mode 100644
> index 0000000000..39360f4fd2
> --- /dev/null
> +++ b/package/weston/0002-add-missing-defines-for-pre-v3.17-kernels.patch
> @@ -0,0 +1,42 @@
> +From f43c98b23e0d7731cd8d7a9b4510c359f3df7930 Mon Sep 17 00:00:00 2001
> +From: James Hilliard <james.hilliard1@gmail.com>
> +Date: Sat, 1 Feb 2020 23:32:29 -0700
> +Subject: [PATCH] add missing defines for pre-v3.17 kernels
> +
> +Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> +[Upstream status:
> +https://gitlab.freedesktop.org/wayland/weston/merge_requests/369]
> +---
> + shared/os-compatibility.c | 16 ++++++++++++++++
> + 1 file changed, 16 insertions(+)
> +
> +diff --git a/shared/os-compatibility.c b/shared/os-compatibility.c
> +index ddc37807..26c39e67 100644
> +--- a/shared/os-compatibility.c
> ++++ b/shared/os-compatibility.c
> +@@ -39,6 +39,22 @@
> + 
> + #include "os-compatibility.h"
> + 
> ++#ifndef F_GET_SEALS
> ++#define F_GET_SEALS	(1034)
> ++#endif
> ++
> ++#ifndef F_SEAL_SHRINK
> ++#define F_SEAL_SHRINK	0x0002
> ++#endif
> ++
> ++#ifndef F_SEAL_GROW
> ++#define F_SEAL_GROW	0x0004
> ++#endif
> ++
> ++#ifndef F_SEAL_WRITE
> ++#define F_SEAL_WRITE	0x0008
> ++#endif
> ++
> + #define READONLY_SEALS (F_SEAL_SHRINK | F_SEAL_GROW | F_SEAL_WRITE)
> + 
> + int
> +-- 
> +2.20.1
> +
> diff --git a/package/weston/Config.in b/package/weston/Config.in
> index 230417ac2c..bf783b70d4 100644
> --- a/package/weston/Config.in
> +++ b/package/weston/Config.in
> @@ -121,7 +121,22 @@ comment "XWayland support needs libepoxy and X.org enabled"
>  
>  config BR2_PACKAGE_WESTON_DEMO_CLIENTS
>  	bool "demo clients"
> +	depends on BR2_USE_MMU # pango
> +	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # pango
> +	depends on BR2_INSTALL_LIBSTDCPP # pango
> +	depends on BR2_TOOLCHAIN_HAS_THREADS # pango
> +	depends on BR2_USE_WCHAR # pango
> +	depends on BR2_PACKAGE_HAS_LIBGLES
> +	depends on BR2_PACKAGE_HAS_LIBEGL_WAYLAND
> +	select BR2_PACKAGE_PANGO
>  	help
>  	  This enables the installation of Weston's demo clients.
>  
> +comment "demo clients needs an OpenGL ES provider, an OpenEGL-capable Wayland backend and a toolchain w/ wchar, threads, C++"
> +	depends on BR2_USE_MMU
> +	depends on BR2_TOOLCHAIN_HAS_SYNC_4
> +	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS || \
> +		!BR2_USE_WCHAR || !BR2_PACKAGE_HAS_LIBGLES || \
> +		!BR2_PACKAGE_HAS_LIBEGL_WAYLAND
> +
>  endif
> diff --git a/package/weston/weston.hash b/package/weston/weston.hash
> index c9b2d4b1ce..0be1855a86 100644
> --- a/package/weston/weston.hash
> +++ b/package/weston/weston.hash
> @@ -1,5 +1,5 @@
> -# From https://lists.freedesktop.org/archives/wayland-devel/2019-June/040661.html
> -md5 e7b10710ef1eac82258f97bfd41fe534  weston-6.0.1.tar.xz
> -sha1 3b39e454b3dc8dc32598790cfcc65728b448378b  weston-6.0.1.tar.xz
> -sha256 bf2f6d5aae2e11cabb6bd69a76bcf9edb084f8c3e14ca769bea7234a513155b4  weston-6.0.1.tar.xz
> -sha512 3da04ff9b884480ce0824950347185e55584e3938021fe62014423d3d51577eafdda8de650a5de6eb37a842130c9cb14c7a952a560f6be93ff973164363af3d9  weston-6.0.1.tar.xz
> +# From https://lists.freedesktop.org/archives/wayland-devel/2020-January/041147.html
> +md5 53e4810d852df0601d01fd986a5b22b3  weston-8.0.0.tar.xz
> +sha1 80200a9c677d34c2de52230be444bd03ecd84229  weston-8.0.0.tar.xz
> +sha256 7518b49b2eaa1c3091f24671bdcc124fd49fc8f1af51161927afa4329c027848  weston-8.0.0.tar.xz
> +sha512 74853b0c9cabbabe942a2d057b65e4e97b48dc5f4df6d7b9ffc10ec52bc787009b12b900be6b426551902b920b7308baa967b7489761641dc9c31cf90440950c  weston-8.0.0.tar.xz
> diff --git a/package/weston/weston.mk b/package/weston/weston.mk
> index 746befd2b3..95cf80be40 100644
> --- a/package/weston/weston.mk
> +++ b/package/weston/weston.mk
> @@ -4,37 +4,41 @@
>  #
>  ################################################################################
>  
> -WESTON_VERSION = 6.0.1
> +WESTON_VERSION = 8.0.0
>  WESTON_SITE = http://wayland.freedesktop.org/releases
>  WESTON_SOURCE = weston-$(WESTON_VERSION).tar.xz
>  WESTON_LICENSE = MIT
>  WESTON_LICENSE_FILES = COPYING
>  
>  WESTON_DEPENDENCIES = host-pkgconf wayland wayland-protocols \
> -	libxkbcommon pixman libpng jpeg udev cairo libinput libdrm \
> -	$(if $(BR2_PACKAGE_WEBP),webp)
> +	libxkbcommon pixman libpng jpeg udev cairo libinput libdrm
>  
>  WESTON_CONF_OPTS = \
> -	--with-dtddir=$(STAGING_DIR)/usr/share/wayland \
> -	--disable-headless-compositor \
> -	--disable-colord \
> -	--disable-devdocs \
> -	--disable-setuid-install \
> -	--enable-autotools
> -
> -WESTON_MAKE_OPTS = \
> -	WAYLAND_PROTOCOLS_DATADIR=$(STAGING_DIR)/usr/share/wayland-protocols
> +	-Dbuild.pkg_config_path=$(HOST_DIR)/lib/pkgconfig \
> +	-Dbackend-headless=false \
> +	-Dcolor-management-colord=false \
> +	-Dremoting=false \
> +	-Dpipewire=false
>  
>  # Uses VIDIOC_EXPBUF, only available from 3.8+
> -ifeq ($(BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_8),)
> -WESTON_CONF_OPTS += --disable-simple-dmabuf-v4l-client
> +ifeq ($(BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_8),y)
> +WESTON_CONF_OPTS +=	-Dsimple-clients=dmabuf-v4l
> +else
> +WESTON_CONF_OPTS +=	-Dsimple-clients=
> +endif
> +
> +ifeq ($(BR2_PACKAGE_DBUS)$(BR2_PACKAGE_SYSTEMD),yy)
> +WESTON_CONF_OPTS += -Dlauncher-logind=true
> +WESTON_DEPENDENCIES += dbus systemd
> +else
> +WESTON_CONF_OPTS += -Dlauncher-logind=false
>  endif
>  
> -ifeq ($(BR2_PACKAGE_DBUS),y)
> -WESTON_CONF_OPTS += --enable-dbus
> -WESTON_DEPENDENCIES += dbus
> +ifeq ($(BR2_PACKAGE_WEBP),y)
> +WESTON_CONF_OPTS += -Dimage-webp=true
> +WESTON_DEPENDENCIES += webp
>  else
> -WESTON_CONF_OPTS += --disable-dbus
> +WESTON_CONF_OPTS += -Dimage-webp=false
>  endif
>  
>  # weston-launch must be u+s root in order to work properly
> @@ -45,90 +49,89 @@ endef
>  define WESTON_USERS
>  	- - weston-launch -1 - - - - Weston launcher group
>  endef
> -WESTON_CONF_OPTS += --enable-weston-launch
> +WESTON_CONF_OPTS += -Dweston-launch=true
>  WESTON_DEPENDENCIES += linux-pam
>  else
> -WESTON_CONF_OPTS += --disable-weston-launch
> +WESTON_CONF_OPTS += -Dweston-launch=false
>  endif
>  
>  ifeq ($(BR2_PACKAGE_HAS_LIBEGL_WAYLAND)$(BR2_PACKAGE_HAS_LIBGLES),yy)
> -WESTON_CONF_OPTS += --enable-egl
> +WESTON_CONF_OPTS += -Drenderer-gl=true
>  WESTON_DEPENDENCIES += libegl libgles
>  else
>  WESTON_CONF_OPTS += \
> -	--disable-egl \
> -	--disable-simple-dmabuf-drm-client \
> -	--disable-simple-egl-clients
> +	-Drenderer-gl=false
>  endif
>  
>  ifeq ($(BR2_PACKAGE_WESTON_RDP),y)
>  WESTON_DEPENDENCIES += freerdp
> -WESTON_CONF_OPTS += --enable-rdp-compositor
> +WESTON_CONF_OPTS += -Dbackend-rdp=true
>  else
> -WESTON_CONF_OPTS += --disable-rdp-compositor
> +WESTON_CONF_OPTS += -Dbackend-rdp=false
>  endif
>  
>  ifeq ($(BR2_PACKAGE_WESTON_FBDEV),y)
> -WESTON_CONF_OPTS += --enable-fbdev-compositor
> +WESTON_CONF_OPTS += -Dbackend-fbdev=true
>  else
> -WESTON_CONF_OPTS += --disable-fbdev-compositor
> +WESTON_CONF_OPTS += -Dbackend-fbdev=false
>  endif
>  
>  ifeq ($(BR2_PACKAGE_WESTON_DRM),y)
> -WESTON_CONF_OPTS += --enable-drm-compositor
> +WESTON_CONF_OPTS += -Dbackend-drm=true
>  else
> -WESTON_CONF_OPTS += --disable-drm-compositor
> +WESTON_CONF_OPTS += -Dbackend-drm=false
>  endif
>  
>  ifeq ($(BR2_PACKAGE_WESTON_X11),y)
> -WESTON_CONF_OPTS += --enable-x11-compositor
> +WESTON_CONF_OPTS += -Dbackend-x11=true
>  WESTON_DEPENDENCIES += libxcb xlib_libX11
>  else
> -WESTON_CONF_OPTS += --disable-x11-compositor
> +WESTON_CONF_OPTS += -Dbackend-x11=false
>  endif
>  
>  # We're guaranteed to have at least one backend
> -WESTON_CONF_OPTS += WESTON_NATIVE_BACKEND=$(call qstrip,$(BR2_PACKAGE_WESTON_DEFAULT_COMPOSITOR))
> +WESTON_CONF_OPTS += -Dbackend-default=$(call qstrip,$(BR2_PACKAGE_WESTON_DEFAULT_COMPOSITOR))
>  
>  ifeq ($(BR2_PACKAGE_WESTON_XWAYLAND),y)
> -WESTON_CONF_OPTS += --enable-xwayland
> +WESTON_CONF_OPTS += -Dxwayland=true
>  WESTON_DEPENDENCIES += cairo libepoxy libxcb xlib_libX11 xlib_libXcursor
>  else
> -WESTON_CONF_OPTS += --disable-xwayland
> +WESTON_CONF_OPTS += -Dxwayland=false
>  endif
>  
>  ifeq ($(BR2_PACKAGE_LIBVA),y)
> -WESTON_CONF_OPTS += --enable-vaapi-recorder
> +WESTON_CONF_OPTS += -Dbackend-drm-screencast-vaapi=true
>  WESTON_DEPENDENCIES += libva
>  else
> -WESTON_CONF_OPTS += --disable-vaapi-recorder
> +WESTON_CONF_OPTS += -Dbackend-drm-screencast-vaapi=false
>  endif
>  
>  ifeq ($(BR2_PACKAGE_LCMS2),y)
> -WESTON_CONF_OPTS += --enable-lcms
> +WESTON_CONF_OPTS += -Dcolor-management-lcms=true
>  WESTON_DEPENDENCIES += lcms2
>  else
> -WESTON_CONF_OPTS += --disable-lcms
> +WESTON_CONF_OPTS += -Dcolor-management-lcms=false
>  endif
>  
>  ifeq ($(BR2_PACKAGE_SYSTEMD),y)
> -WESTON_CONF_OPTS += --enable-systemd-login --enable-systemd-notify
> +WESTON_CONF_OPTS += -Dsystemd=true
>  WESTON_DEPENDENCIES += systemd
>  else
> -WESTON_CONF_OPTS += --disable-systemd-login --disable-systemd-notify
> +WESTON_CONF_OPTS += -Dsystemd=false
>  endif
>  
>  ifeq ($(BR2_PACKAGE_LIBXML2),y)
> -WESTON_CONF_OPTS += --enable-junit-xml
> +WESTON_CONF_OPTS += -Dtest-junit-xml=true
>  WESTON_DEPENDENCIES += libxml2
>  else
> -WESTON_CONF_OPTS += --disable-junit-xml
> +WESTON_CONF_OPTS += -Dtest-junit-xml=false
>  endif
>  
>  ifeq ($(BR2_PACKAGE_WESTON_DEMO_CLIENTS),y)
> -WESTON_CONF_OPTS += --enable-demo-clients-install
> +WESTON_CONF_OPTS += -Ddemo-clients=true
> +WESTON_DEPENDENCIES += pango
>  else
> -WESTON_CONF_OPTS += --disable-demo-clients-install
> +WESTON_CONF_OPTS += -Ddemo-clients=false
>  endif
>  
> -$(eval $(autotools-package))
> +$(eval $(meson-package))
> -- 
> 2.20.1
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
