From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 4 Jan 2013 00:25:27 +0100
Subject: [Buildroot] [PATCH v2 1/2] rxvt-unicode: new package
In-Reply-To: <1356633918-16114-1-git-send-email-stefan.froberg@petroprogram.com>
References: <1356633918-16114-1-git-send-email-stefan.froberg@petroprogram.com>
Message-ID: <20130104002527.416c342d@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Stefan Fr?berg,

On Thu, 27 Dec 2012 20:45:17 +0200, Stefan Fr?berg wrote:
> Signed-off-by: Stefan Fr?berg <stefan.froberg@petroprogram.com>
> ---
>  package/Config.in                    |    1 +
>  package/rxvt-unicode/Config.in       |    9 +++++++++
>  package/rxvt-unicode/rxvt-unicode.mk |   12 ++++++++++++
>  3 files changed, 22 insertions(+), 0 deletions(-)
>  create mode 100644 package/rxvt-unicode/Config.in
>  create mode 100644 package/rxvt-unicode/rxvt-unicode.mk
> 
> diff --git a/package/Config.in b/package/Config.in
> index 66445ff..73bab6e 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -169,6 +169,7 @@ source "package/leafpad/Config.in"
>  source "package/midori/Config.in"
>  source "package/pcmanfm/Config.in"
>  source "package/rdesktop/Config.in"
> +source "package/rxvt-unicode/Config.in"
>  source "package/sylpheed/Config.in"
>  source "package/synergy/Config.in"
>  source "package/torsmo/Config.in"
> diff --git a/package/rxvt-unicode/Config.in b/package/rxvt-unicode/Config.in
> new file mode 100644
> index 0000000..3d819ce
> --- /dev/null
> +++ b/package/rxvt-unicode/Config.in
> @@ -0,0 +1,9 @@
> +config BR2_PACKAGE_RXVT_UNICODE
> +	bool "rxvt-unicode"
> +	select BR2_PACKAGE_FONTCONFIG
> +	select BR2_PACKAGE_NCURSES
> +	depends on BR2_PACKAGE_XORG7

Please add:

	select BR2_PACKAGE_XLIB_LIBX11
	select BR2_PACKAGE_XLIB_LIBXRENDER

> +	help
> +	  rxvt clone with xft and unicode support

You're saying it uses Xft, but xlib_libXft is not part of your
dependencies. Is this normal?

> --- /dev/null
> +++ b/package/rxvt-unicode/rxvt-unicode.mk
> @@ -0,0 +1,12 @@
> +#############################################################
> +#
> +# rxvt-unicode
> +#
> +#############################################################
> +RXVT_UNICODE_VERSION = 9.15
> +RXVT_UNICODE_SOURCE = rxvt-unicode-$(RXVT_UNICODE_VERSION).tar.bz2
> +RXVT_UNICODE_SITE = http://dist.schmorp.de/rxvt-unicode
> +RXVT_UNICODE_DEPENDENCIES = fontconfig ncurses xlib_libX11 xlib_libXrender
> +RXVT_UNICODE_CONF_OPT += --enable-everything --disable-perl --with-x --with-terminfo=/usr/share/terminfo

Please cut this line:

RXVT_UNICODE_CONF_OPT += \
	--enable-everything \
	--disable-perl \
	--with-x \
	--with-terminfo=/usr/share/terminfo

Also, please add the RXVT_UNICODE_LICENSE and
RXVT_UNICODE_LICENSE_FILES variables.

Thanks!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
