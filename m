From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 16 Jan 2018 17:07:12 +0100
Subject: [Buildroot] [PATCH 1/1] vte: new package
In-Reply-To: <20180116152333.29596-1-stefan.froberg@petroprogram.com>
References: <20180116152333.29596-1-stefan.froberg@petroprogram.com>
Message-ID: <20180116170712.63ad80cf@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 16 Jan 2018 17:23:33 +0200, Stefan Fr?berg wrote:

> diff --git a/package/vte/Config.in b/package/vte/Config.in
> new file mode 100644
> index 0000000000..e448477d69
> --- /dev/null
> +++ b/package/vte/Config.in
> @@ -0,0 +1,15 @@
> +config BR2_PACKAGE_VTE
> +	bool "vte"
> +	select BR2_PACKAGE_LIBGTK3

You can't just select libgtk3 so easily. It has lots of dependencies:

        depends on BR2_USE_WCHAR # glib2
        depends on BR2_TOOLCHAIN_HAS_THREADS # glib2
        depends on BR2_USE_MMU # glib2
        depends on BR2_INSTALL_LIBSTDCPP # pango
        depends on BR2_TOOLCHAIN_HAS_SYNC_4 # pango -> harfbuzz
        depends on BR2_PACKAGE_HAS_LIBEGL_WAYLAND || \
                BR2_PACKAGE_HAS_LIBGL

> +	select BR2_PACKAGE_LIBXML2
> +	select BR2_PACKAGE_PCRE2
> +	depends on BR2_PACKAGE_XORG7

The depends on should go before the select. This is checked
by ./utils/check-package.

> +	help
> +	  VTE is a library (libvte) implementing a terminal emulator
> +	  widget for GTK+, and a minimal sample application (vte)
> +	  using that. Vte is mainly used in gnome-terminal, but
> +	  can also be used to embed a console/terminal in games,
> +	  editors, IDEs, etc.
> +
> +	  http://github.com/GNOME/vte
> +

Spurious empty line.

You will need a bunch of Config.in comments here about this package
dependencies.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
