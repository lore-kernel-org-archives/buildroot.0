From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Tue, 25 Aug 2015 07:56:09 +0200
Subject: [Buildroot] [PATCH 1/3] [v3] libgudev: New package
In-Reply-To: <1440431056-25983-1-git-send-email-nroach44@gmail.com>
References: <1440431056-25983-1-git-send-email-nroach44@gmail.com>
Message-ID: <CAGm1_kttw+s321dGUBvWGAvYFMCBVRj1Oj=HSn1oj=WpSmfuow@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Aug 24, 2015 at 5:44 PM, Nathaniel Roach <nroach44@gmail.com> wrote:
> As libgudev recently was split from the main systemd/udev source,
>         this library is now required to build certain packages.
>
> This library is only relevant to systemd, as the code it contains
>         is still contained in eudev.
>
> Add the package and tweak systemd's Config.in message accordingly.
>
> ---
> Changes v2 -> v3
> (Changes as suggested by Yann E. MORIN)
>  - Separate libgudev and network-manager portions into
>         discrete patches, and a new patch for libmbim
>
> Changes v1 -> v2
> (Changes as suggested by Peter Korsgaard)
>  - Added the toolchain dependencies
>  - Dropped NM references in package
>  - Added _LICENSE_FILEs
>  - Conditionally depend on libgudev in NM if using systemd
>
> Signed-off-by: Nathaniel Roach <nroach44@gmail.com>

Tested-by: Yegor Yefremov <yegorslists@googlemail.com>

> ---
>  package/Config.in            |  1 +
>  package/libgudev/Config.in   | 19 +++++++++++++++++++
>  package/libgudev/libgudev.mk | 17 +++++++++++++++++
>  package/systemd/Config.in    |  1 -
>  4 files changed, 37 insertions(+), 1 deletion(-)
>  create mode 100644 package/libgudev/Config.in
>  create mode 100644 package/libgudev/libgudev.mk
>
> diff --git a/package/Config.in b/package/Config.in
> index 47d14d7..6494322 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -852,6 +852,7 @@ menu "Hardware handling"
>         source "package/libfreefare/Config.in"
>         source "package/libftdi/Config.in"
>         source "package/libftdi1/Config.in"
> +       source "package/libgudev/Config.in"
>         source "package/libhid/Config.in"
>         source "package/libiio/Config.in"
>         source "package/libinput/Config.in"
> diff --git a/package/libgudev/Config.in b/package/libgudev/Config.in
> new file mode 100644
> index 0000000..8cdd9f6
> --- /dev/null
> +++ b/package/libgudev/Config.in
> @@ -0,0 +1,19 @@
> +config BR2_PACKAGE_LIBGUDEV
> +       bool "libgudev"
> +       depends on BR2_INIT_SYSTEMD
> +       depends on BR2_USE_WCHAR # gettext
> +       depends on BR2_TOOLCHAIN_HAS_THREADS
> +       depends on BR2_USE_MMU # fork()
> +       select BR2_PACKAGE_LIBGLIB2
> +       help
> +         This library provides GObject bindings for libudev.
> +         It was originally part of udev-extras, then udev, then systemd.
> +         It's now a project on its own.
> +         Required for building some programs that use udev, when using
> +         systemd.
> +
> +         https://wiki.gnome.org/Projects/libgudev
> +
> +comment "libgudev needs a toolchain w/ wchar, threads, and systemd"
> +       depends on BR2_USE_MMU
> +       depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || !BR2_INIT_SYSTEMD
> diff --git a/package/libgudev/libgudev.mk b/package/libgudev/libgudev.mk
> new file mode 100644
> index 0000000..fa15b56
> --- /dev/null
> +++ b/package/libgudev/libgudev.mk
> @@ -0,0 +1,17 @@
> +################################################################################
> +#
> +# libgudev
> +#
> +################################################################################
> +
> +LIBGUDEV_VERSION = 230
> +LIBGUDEV_SOURCE = libgudev-$(LIBGUDEV_VERSION).tar.xz
> +LIBGUDEV_SITE = http://ftp.gnome.org/pub/GNOME/sources/libgudev/$(LIBGUDEV_VERSION)
> +LIBGUDEV_INSTALL_STAGING = YES
> +
> +LIBGUDEV_DEPENDENCIES = host-pkgconf udev libglib2
> +
> +LIBGUDEV_LICENSE = GPLv2+
> +LIBGUDEV_LICENSE_FILES = COPYING
> +
> +$(eval $(autotools-package))
> diff --git a/package/systemd/Config.in b/package/systemd/Config.in
> index 510badd..f7fc3bb 100644
> --- a/package/systemd/Config.in
> +++ b/package/systemd/Config.in
> @@ -55,7 +55,6 @@ config BR2_PACKAGE_SYSTEMD
>
>           The selection of other packages will enable some features:
>
> -         - libglib2 package will add support for gudev.
>           - acl package will add support for multi-seat.
>
>           http://freedesktop.org/wiki/Software/systemd
> --
> 2.5.0
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
