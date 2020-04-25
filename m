From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 25 Apr 2020 23:46:04 +0200
Subject: [Buildroot] [PATCH v3 1/2] package/wlroots: new package
In-Reply-To: <20191110200638.3570497-2-aperez@igalia.com>
References: <20191110200638.3570497-1-aperez@igalia.com>
 <20191110200638.3570497-2-aperez@igalia.com>
Message-ID: <20200425234604.4a48a33a@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Adrian,

On Sun, 10 Nov 2019 22:06:37 +0200
Adrian Perez de Castro <aperez@igalia.com> wrote:

> wlroots is a modular library which provides building blocks to
> implement Wayland compositors. wlroots is a dependency of the
> Cage Wayland compositor.
> 
> https://github.com/swaywm/wlroots/
> 
> Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>

I have (finally) applied this patch, after doing a number of changes.
See below for some comments, and questions.

> diff --git a/package/wlroots/0001-Do-not-use-pkg-config-to-find-wayland-scanner-when-c.patch b/package/wlroots/0001-Do-not-use-pkg-config-to-find-wayland-scanner-when-c.patch
> new file mode 100644
> index 0000000000..898506a0dc
> --- /dev/null
> +++ b/package/wlroots/0001-Do-not-use-pkg-config-to-find-wayland-scanner-when-c.patch
> @@ -0,0 +1,45 @@
> +From 72138a67c8e6b0154aadc1b5fcb3d661033fbcd3 Mon Sep 17 00:00:00 2001
> +From: Adrian Perez de Castro <aperez@igalia.com>
> +Date: Thu, 13 Jun 2019 02:13:47 +0300
> +Subject: [PATCH] Do not use pkg-config to find wayland-scanner when cross
> + building
> +
> +When cross-compiling it is still needed to run a native wayland-scanner,
> +but many tools for the task will still have pkg-config return the
> +location of wayland-scanner for the target in some location which may
> +be the same as for some native installation of wayland-scanner; but
> +which is not the copy of the program that the compilation system wants
> +packages to use (which are typically in a "host tools" directory
> +elsewhere).
> +
> +This disables usage of pkg-config to find wayland-scanner when
> +cross-compiling because most tools for the job will set $PATH in a way
> +that the correct installation of the tool will be found first.
> +
> +Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
> +[Upstream status: https://github.com/swaywm/wlroots/pull/1722]

This patch was rejected upstream. As part of that, they pointed to
another Buildroot-related discussion at
https://gitlab.freedesktop.org/wayland/weston/-/merge_requests/157#note_154262.

And it turns out that Buildroot's support for meson was indeed improved
since then when it comes to pkg-config handling. We are now compatible
with Meson either using pkg-config to find libraries/tools for the
target *or* for the host. See Arnout's commit
4e0bc29993376613d200e892d491e31ea5a49622.

So there is a chance that with this in place, wlroots now asks
wayland-scanner with the host pkg-config, and not the
for-cross-compilation pkg-config.

Could you have a look at this ?


> diff --git a/package/wlroots/Config.in b/package/wlroots/Config.in
> new file mode 100644
> index 0000000000..88734ced74
> --- /dev/null
> +++ b/package/wlroots/Config.in
> @@ -0,0 +1,52 @@
> +comment "wlroots needs udev, mesa3d w/ EGL and GLES support, toolchain w/ threads, locale, shared libraries"
> +	depends on !BR2_PACKAGE_MESA3D_OPENGL_EGL || \
> +	  !BR2_PACKAGE_MESA3D_OPENGL_ES || !BR2_PACKAGE_HAS_UDEV || \
> +	  !BR2_ENABLE_LOCALE || !BR2_TOOLCHAIN_HAS_THREADS || \
> +	  BR2_STATIC_LIBS

This was a bit too much, so I've split into two comments: one for the
toolchain dependencies, one for the other dependencies.

> +
> +config BR2_PACKAGE_WLROOTS
> +	bool "wlroots"
> +	depends on !BR2_STATIC_LIBS # wayland
> +	depends on BR2_TOOLCHAIN_HAS_THREADS # libdrm, wayland
> +	depends on BR2_ENABLE_LOCALE # libinput
> +	depends on BR2_PACKAGE_HAS_UDEV # libinput
> +	# Technically wlroots should work with any OpenGL implementation
> +	# which provides EGL, GLES2, and libgbm; but in practice only
> +	# Mesa ships an usable libgbm.

In fact, some other OpenGL implementations might provide a suitable
libgbm. I did some initial work on a libgbm virtual package, which got
stopped due to incompatibilities between libgbm implementations. But
after some research and discussion, I have some ideas on how to handle
this.

> +	depends on BR2_PACKAGE_MESA3D_OPENGL_EGL
> +	depends on BR2_PACKAGE_MESA3D_OPENGL_ES
> +	select BR2_PACKAGE_LIBDRM
> +	select BR2_PACKAGE_LIBINPUT
> +	select BR2_PACKAGE_LIBXCB if BR2_PACKAGE_XORG7 # For XWayland.

This was a bit brutal as if you want the X11 backend but don't care
about XWayland, you would still have libxcb, so I've dropped this line,
and changed something in the .mk file accordingly.

> +	select BR2_PACKAGE_LIBXKBCOMMON
> +	select BR2_PACKAGE_PIXMAN
> +	select BR2_PACKAGE_WAYLAND
> +	select BR2_PACKAGE_WAYLAND_PROTOCOLS
> +	help
> +	  wlroots is a modular Wayland library for building compositors
> +	  which implements many of their common features.
> +
> +	  https://github.com/swaywm/wlroots
> +
> +if BR2_PACKAGE_WLROOTS
> +
> +config BR2_PACKAGE_WLROOTS_RDP
> +	bool "RDP backend"
> +	depends on BR2_PACKAGE_FREERDP
> +	help
> +	  Support Wayland sessions served using the RDP protocol
> +
> +comment "RDP backend needs freerdp"
> +	depends on !BR2_PACKAGE_FREERDP

I dropped this comment: if you need the RDP backend, it's pretty
obvious you need FreeRDP.

> +config BR2_PACKAGE_WLROOTS_X11
> +	bool "X11 backend"
> +	depends on BR2_PACKAGE_XORG7
> +	select BR2_PACKAGE_XLIB_LIBX11
> +	help
> +	  Support Wayland sessions nested inside a X11 window
> +
> +comment "X11 backend needs X.org enabled"
> +	depends on !BR2_PACKAGE_XORG7

Ditto.


> +WLROOTS_VERSION = 0.8.1
> +WLROOTS_SITE = https://github.com/swaywm/wlroots/releases/download/$(WLROOTS_VERSION)
> +WLROOTS_SOURCE = wlroots-$(WLROOTS_VERSION).tar.gz

This is the default value -> triggers a check-package warning.

> +WLROOTS_LICENSE = MIT
> +WLROOTS_INSTALL_STAGING = YES
> +
> +WLROOTS_DEPENDENCIES = host-pkgconf host-wayland libegl libinput \
> +	libxkbcommon mesa3d pixman udev wayland wayland-protocols
> +
> +WLROOTS_CONF_OPTS = -Dexamples=false
> +
> +ifeq ($(BR2_PACKAGE_FFMPEG),y)
> +WLROOTS_DEPENDENCIES += ffmpeg
> +endif
> +
> +ifeq ($(BR2_PACKAGE_LIBCAP),y)
> +WLROOTS_CONF_OPTS += -Dlibcap=enabled
> +WLROOTS_DEPENDENCIES += libcap
> +else
> +WLROOTS_CONF_OPTS += -Dlibcap=disabled
> +endif
> +
> +ifeq ($(BR2_PACKAGE_LIBPNG),y)
> +WLROOTS_DEPENDENCIES += libpng
> +endif
> +
> +ifeq ($(BR2_PACKAGE_SYSTEMD_LOGIND),y)
> +WLROOTS_CONF_OPTS += -Dlogind=enabled -Dlogind-provider=systemd
> +WLROOTS_DEPENDENCIES += systemd
> +else
> +WLROOTS_CONF_OPTS += -Dlogind=disabled
> +endif
> +
> +ifeq ($(BR2_PACKAGE_WLROOTS_RDP),y)
> +WLROOTS_CONF_OPTS += -Dfreerdp=enabled
> +WLROOTS_DEPENDENCIES += freerdp
> +else
> +WLROOTS_CONF_OPTS += -Dfreerdp=disabled
> +endif
> +
> +ifeq ($(BR2_PACKAGE_WLROOTS_X11),y)
> +WLROOTS_CONF_OPTS += -Dx11-backend=enabled
> +WLROOTS_DEPENDENCIES += xlib_libX11
> +else
> +WLROOTS_CONF_OPTS += -Dx11-backend=disabled
> +endif
> +
> +ifeq ($(BR2_PACKAGE_XORG7),y)

Changed to a test on BR2_PACKAGE_LIBXCB.

> +WLROOTS_CONF_OPTS += -Dxwayland=enabled
> +WLROOTS_DEPENDENCIES += libxcb
> +ifeq ($(BR2_PACKAGE_XCB_UTIL),y)
> +WLROOTS_CONF_OPTS += -Dxcb-errors=enabled
> +WLROOTS_DEPENDENCIES += xcb-util
> +else
> +WLROOTS_CONF_OPTS += -Dxcb-errors=disabled
> +endif
> +ifeq ($(BR2_PACKAGE_XCB_UTIL_WM),y)
> +WLROOTS_CONF_OPTS += -Dxcb-icccm=enabled
> +WLROOTS_DEPENDENCIES += xcb-util-wm
> +else
> +WLROOTS_CONF_OPTS += -Dxcb-icccm=disabled
> +endif
> +else
> +WLROOTS_CONF_OPTS += -Dxwayland=disabled -Dxcb-errors=disabled -Dxcb-icccm=disabled
> +endif

Also, since BR2_PACKAGE_XCB_UTIL and BR2_PACKAGE_XCB_UTIL_WM can't be
enabled without BR2_PACKAGE_LIBXCB, I've simplified this whole block to:

+ifeq ($(BR2_PACKAGE_LIBXCB),y)
+WLROOTS_CONF_OPTS += -Dxwayland=enabled
+WLROOTS_DEPENDENCIES += libxcb
+else
+WLROOTS_CONF_OPTS += -Dxwayland=disabled
+endif
+
+ifeq ($(BR2_PACKAGE_XCB_UTIL),y)
+WLROOTS_CONF_OPTS += -Dxcb-errors=enabled
+WLROOTS_DEPENDENCIES += xcb-util
+else
+WLROOTS_CONF_OPTS += -Dxcb-errors=disabled
+endif
+
+ifeq ($(BR2_PACKAGE_XCB_UTIL_WM),y)
+WLROOTS_CONF_OPTS += -Dxcb-icccm=enabled
+WLROOTS_DEPENDENCIES += xcb-util-wm
+else
+WLROOTS_CONF_OPTS += -Dxcb-icccm=disabled
+endif

Applied with those changes!

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
