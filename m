From: Marcus Folkesson <marcus.folkesson@gmail.com>
Date: Wed, 31 Jan 2018 16:09:53 +0100
Subject: [Buildroot] [PATCH v2 1/1] vte: new package
In-Reply-To: <20180116231558.7316-1-stefan.froberg@petroprogram.com>
References: <20180116231558.7316-1-stefan.froberg@petroprogram.com>
Message-ID: <20180131150953.GE13531@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Stefan,

On Wed, Jan 17, 2018 at 01:15:58AM +0200, Stefan Fr?berg wrote:
> The VTE package contains a termcap file implementation for 
> terminal emulators. 
> 
> Signed-off-by: Stefan Fr?berg <stefan.froberg@petroprogram.com>
> ---
> 
> Changes v1 -> v2:
> 
> - Fixed license
> - Added hash file
> - Added comment to Config.in (by Thomas Petazzoni)
> - Added "depends on" lines needed by libgtk3 (by Thomas Petazzoni)
> 
>  DEVELOPERS            |  1 +
>  package/Config.in     |  1 +
>  package/vte/Config.in | 34 ++++++++++++++++++++++++++++++++++
>  package/vte/vte.hash  |  3 +++
>  package/vte/vte.mk    | 15 +++++++++++++++
>  5 files changed, 54 insertions(+)
>  create mode 100644 package/vte/Config.in
>  create mode 100644 package/vte/vte.hash
>  create mode 100644 package/vte/vte.mk
> 
> diff --git a/DEVELOPERS b/DEVELOPERS
> index 2f7d051e8a..0f81b7093b 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -1642,6 +1642,7 @@ N:	Stefan Fr?berg <stefan.froberg@petroprogram.com>
>  F:	package/elfutils/
>  F:	package/libtasn1/
>  F:	package/proxychains-ng/
> +F:	package/vte/
>  F:	package/yasm/
>  F:	package/zlib-ng/
>  
> diff --git a/package/Config.in b/package/Config.in
> index 01f4095be5..be0304442a 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -333,6 +333,7 @@ comment "X applications"
>  	source "package/qt-webkit-kiosk/Config.in"
>  	source "package/rdesktop/Config.in"
>  	source "package/synergy/Config.in"
> +	source "package/vte/Config.in"
>  	source "package/wmctrl/Config.in"
>  	source "package/x11vnc/Config.in"
>  	source "package/xdotool/Config.in"
> diff --git a/package/vte/Config.in b/package/vte/Config.in
> new file mode 100644
> index 0000000000..43c6dd0948
> --- /dev/null
> +++ b/package/vte/Config.in
> @@ -0,0 +1,34 @@
> +config BR2_PACKAGE_VTE
> +	bool "vte"
> +	depends on BR2_USE_WCHAR
> +	depends on BR2_TOOLCHAIN_HAS_THREADS
> +	depends on BR2_USE_MMU
> +	depends on BR2_INSTALL_LIBSTDCPP
> +	depends on BR2_TOOLCHAIN_HAS_SYNC_4
> +	depends on BR2_PACKAGE_HAS_LIBEGL_WAYLAND || \
> +		BR2_PACKAGE_HAS_LIBGL
> +	depends on BR2_PACKAGE_XORG7
> +	select BR2_PACKAGE_LIBGTK3
> +	select BR2_PACKAGE_LIBXML2
> +	select BR2_PACKAGE_PCRE2
> +	help
> +	  VTE is a library (libvte) implementing a terminal emulator
> +	  widget for GTK+, and a minimal sample application (vte)
> +	  using that. Vte is mainly used in gnome-terminal, but
> +	  can also be used to embed a console/terminal in games,
> +	  editors, IDEs, etc.
> +
> +	  http://github.com/GNOME/vte
> +
> +comment "vte needs a toolchain w/ wchar, threads, C++"
> +	depends on BR2_USE_MMU
> +	depends on BR2_TOOLCHAIN_HAS_SYNC_4
> +	depends on !BR2_USE_WCHAR || !BR2_INSTALL_LIBSTDCPP || \
> +		!BR2_TOOLCHAIN_HAS_THREADS
> +
> +comment "vte needs an OpenGL or an OpenGL-EGL/wayland backend"
> +	depends on BR2_USE_MMU
> +	depends on BR2_TOOLCHAIN_HAS_SYNC_4
> +	depends on !BR2_PACKAGE_HAS_LIBEGL_WAYLAND && \
> +		!BR2_PACKAGE_HAS_LIBGL
> +
> diff --git a/package/vte/vte.hash b/package/vte/vte.hash
> new file mode 100644
> index 0000000000..3fbc5acab0
> --- /dev/null
> +++ b/package/vte/vte.hash
> @@ -0,0 +1,3 @@
> +# Locally calculated
> +sha256	a3a9fb182740b392a45cd3f46fa61a985f68bb6b1817b52daec22034c46158c3  vte-0.48.3.tar.xz
> +sha256	dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
> diff --git a/package/vte/vte.mk b/package/vte/vte.mk
> new file mode 100644
> index 0000000000..85f73bb91e
> --- /dev/null
> +++ b/package/vte/vte.mk
> @@ -0,0 +1,15 @@
> +################################################################################
> +#
> +# vte
> +#
> +################################################################################
> +
> +VTE_VERSION = 0.48.3
> +VTE_SOURCE = vte-$(VTE_VERSION).tar.xz
> +VTE_SITE = http://ftp.gnome.org/pub/gnome/sources/vte/0.48
> +VTE_DEPENDENCIES = host-pkgconf libgtk3 libxml2 pcre2
> +VTE_LICENSE = LGPL-2.1-or-later

The license is LGPL-2.1, no "or-later" on this one.

> +VTE_LICENSE_FILES = COPYING
> +VTE_CONF_OPTS += --disable-introspection --without-gnutls --disable-vala
> +
> +$(eval $(autotools-package))
> -- 
> 2.13.6
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot


Best regards
Marcus Folkesson
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 833 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180131/2877e9b8/attachment.asc>
