From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 1 Aug 2019 23:55:19 +0200
Subject: [Buildroot] [PATCH v2 1/2] package/wlroots: new package
In-Reply-To: <20190613000836.41302-2-aperez@igalia.com>
References: <20190613000836.41302-1-aperez@igalia.com>
 <20190613000836.41302-2-aperez@igalia.com>
Message-ID: <4d7fb361-f1e6-ceb7-8140-f2406c6fbfd6@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Adrian,

On 13/06/2019 02:08, Adrian Perez de Castro wrote:
> wlroots is a modular library which provides building blocks to
> implement Wayland compositors. wlroots is a dependency of the
> Cage Wayland compositor.
[snip]
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

 I looked at this PR, and the feedback refers to a similar PR in weston, which
gives me an interesting hint. According to Maarten ter Hurne [1], the current
state is correct...

[snip]
> +-wayland_scanner_dep = dependency('wayland-scanner', required: false, native: true)

 The native: true tells meson to look for a host .pc file, not a target one.
Indeed, in the log we see:

Trying pkg-config binary pkg-config for machine MachineChoice.BUILD at
['../output/host/bin/pkg-config']

(Note that in Buildroot we use wrong terminology; BUILD is what we call host,
and HOST is what we call target, or maybe staging is more accurate.)

So it does try to use the pkg-config for the host. Only, we don't tell meson
what the pkg-config for the host is, we just tell it where the pkg-config binary
is. Our pkg-config binary is actually a wrapper script that set the search
directories to STAGING_DIR.

 How we normally handle this for host builds is that we explicitly set
PKG_CONFIG_LIBDIR etc. in HOST_MAKE_ENV.

 Ideally, though, we'd like to be able to tell meson how to call pkg-config for
the target and how to call it for the host, so it can do the right thing. We can
*almost* get away with calling pkgconf directly instead of the pkg-config
wrapper - except that we also should set PKG_CONFIG_ALLOW_SYSTEM_CFLAGS/LIBS=1
(not for wayland-scanner, but to be able to use host libraries).

 So, bottom line, I think we should generate a second wrapper script that sets
the environment variables we currently set in HOST_MAKE_ENV, and tell meson to
use that one for MachineChoice.BUILD. Note that I have no idea how to do the latter.

 I'm adding a few people who have been involved in meson somehow in Cc to get
their input.

> ++if meson.is_cross_build()
> ++	wayland_scanner_dep = disabler()
> ++else
> ++	wayland_scanner_dep = dependency('wayland-scanner', required: false, native: true)
> ++endif
> ++
> + if wayland_scanner_dep.found()
> + 	wayland_scanner = find_program(
> + 		wayland_scanner_dep.get_pkgconfig_variable('wayland_scanner'),
> +-- 
> +2.22.0
> +
> diff --git a/package/wlroots/Config.in b/package/wlroots/Config.in
> new file mode 100644
> index 0000000000..2852f74b0c
> --- /dev/null
> +++ b/package/wlroots/Config.in
> @@ -0,0 +1,62 @@
> +config BR2_PACKAGE_WLROOTS
> +	bool "wlroots"
> +	depends on !BR2_STATIC_LIBS # wayland
> +	depends on BR2_TOOLCHAIN_HAS_THREADS # libdrm, wayland
> +	depends on BR2_ENABLE_LOCALE # libinput
> +	depends on BR2_PACKAGE_HAS_UDEV # libinput
> +	depends on BR2_PACKAGE_MESA3D_OPENGL_EGL
> +	depends on BR2_PACKAGE_MESA3D_OPENGL_ES

 Why don't you select mesa instead of depending on it? It is almost what you did
in v1, only you forgot to add 'select BR2_PACKAGE_MESA3D'.

 I would also add here a comment that mesa is not strictly needed, only gbm, but
that mesa is the only provider. Either here or in the commit message.

> +	select BR2_PACKAGE_LIBDRM
> +	select BR2_PACKAGE_LIBINPUT
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
> +comment "wlroots requires udev, mesa3d w/ EGL and GLES support"

 We use "needs", not "requires" (it's shorter and horizontal space is at a
premium in comments).

> +	depends on !BR2_PACKAGE_MESA3D_OPENGL_EGL || \
> +	  !BR2_PACKAGE_MESA3D_OPENGL_ES || !BR2_PACKAGE_HAS_UDEV

 You're missing the comment for !static, threads and locale.

> +
> +if BR2_PACKAGE_WLROOTS

 There should be nothing between the top symbol and the condition. That way, the
sub-options get properly indented in menuconfig.

> +
> +config BR2_PACKAGE_WLROOTS_RDP
> +	bool "RDP backend support"

 Remove "support", i.e. just "RDP backend". Or maybe "RDP support". With
"backend", it sounds like you would need at least one backend, and you don't
enforce that.

> +	depends on BR2_PACKAGE_FREERDP

 Why not select freerdp?

> +	help
> +	  Support Wayland sessions served using the RDP protocol
> +
> +comment "RDP backend support needs freerdp"
> +	depends on !BR2_PACKAGE_FREERDP
> +
> +config BR2_PACKAGE_WLROOTS_X11
> +	bool "X11 backend support"
> +	depends on BR2_PACKAGE_XORG7

 We don't do select of XORG7 so this is fine.

> +	select BR2_PACKAGE_LIBXCB
> +	select BR2_PACKAGE_XLIB_LIBX11
> +	help
> +	  Support Wayland sessions nested inside a X11 window
> +
> +comment "X11 backend support needs X.org enabled"
> +	depends on !BR2_PACKAGE_XORG7
> +
> +config BR2_PACKAGE_WLROOTS_XWAYLAND
> +	bool "XWayland support"
> +	depends on BR2_PACKAGE_XORG7
> +	select BR2_PACKAGE_LIBXCB
> +	help
> +	  Enable support for XWayland
> +
> +comment "XWayland support needs X.org enabled"
> +	depends on !BR2_PACKAGE_XORG7
> +
> +config BR2_PACKAGE_WLROOTS_ROOTSTON
> +	bool "rootston"
> +	help
> +	  Build and install the rootston example compositor
> +
> +endif
> diff --git a/package/wlroots/wlroots.hash b/package/wlroots/wlroots.hash
> new file mode 100644
> index 0000000000..dbb387a865
> --- /dev/null
> +++ b/package/wlroots/wlroots.hash
> @@ -0,0 +1,5 @@
> +# Generated locally

 There's an .asc for the release, so please verify the tarball with it and add:

# Generated locally, after checking
https://github.com/swaywm/wlroots/releases/download/0.6.0/wlroots-0.6.0.tar.gz.sig


> +sha256 9cf3716f3683d800df8b150f256ff66dad65faf13a9d67c284f67a9444d28c70  0.6.0.tar.gz
> +
> +# Hashes for license files:
> +sha256 ffd3737a478b83a8b51b42757d3bf909ef36694508355879722e11fc1fa6736b  LICENSE
> diff --git a/package/wlroots/wlroots.mk b/package/wlroots/wlroots.mk
> new file mode 100644
> index 0000000000..9d3581fd6f
> --- /dev/null
> +++ b/package/wlroots/wlroots.mk
> @@ -0,0 +1,80 @@
> +################################################################################
> +#
> +# wlroots
> +#
> +################################################################################
> +
> +WLROOTS_VERSION = 0.6.0
> +WLROOTS_SITE = https://github.com/swaywm/wlroots/archive
> +WLROOTS_SOURCE = $(WLROOTS_VERSION).tar.gz

 This is not an uploaded tarball, so please use the github helper.

> +WLROOTS_LICENSE = MIT
> +WLROOTS_INSTALL_STAGING = YES
> +
> +WLROOTS_DEPENDENCIES = host-pkgconf host-wayland libegl libinput \
> +					   libxkbcommon mesa3d pixman udev \
> +					   wayland wayland-protocols

 Indent these with just one tab.

 Thanks!

 Regards,
 Arnout


[1] https://gitlab.freedesktop.org/wayland/weston/merge_requests/157#note_154283

[snip]
