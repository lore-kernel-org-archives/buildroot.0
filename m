From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 30 Jul 2016 15:56:58 +0200
Subject: [Buildroot] [PATCH 1/2] gtksourceview: new package
In-Reply-To: <1469778689-31893-1-git-send-email-fabrice.fontaine@orange.com>
References: <1469778689-31893-1-git-send-email-fabrice.fontaine@orange.com>
Message-ID: <20160730155658.1e563afd@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 29 Jul 2016 09:51:28 +0200, Fabrice Fontaine wrote:

> diff --git a/package/Config.in b/package/Config.in
> index ab9c42f..cf1d54e 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -133,6 +133,7 @@ menu "Development tools"
>  	source "package/git/Config.in"
>  	source "package/gperf/Config.in"
>  	source "package/grep/Config.in"
> +	source "package/gtksourceview/Config.in"

It really isn't a "Development tools", it's a library, so I've put it
under Libraries -> Graphics.

> diff --git a/package/gtksourceview/Config.in b/package/gtksourceview/Config.in
> new file mode 100644
> index 0000000..be7536b
> --- /dev/null
> +++ b/package/gtksourceview/Config.in
> @@ -0,0 +1,32 @@
> +config BR2_PACKAGE_GTKSOURCEVIEW
> +	bool "gtksourceview"
> +	depends on BR2_USE_WCHAR # glib2
> +	depends on BR2_TOOLCHAIN_HAS_THREADS # glib2
> +	depends on BR2_USE_MMU # glib2
> +	depends on BR2_INSTALL_LIBSTDCPP # libgtk3
> +	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # libgtk3
> +	depends on BR2_PACKAGE_MESA3D_OPENGL_EGL || \
> +		BR2_PACKAGE_HAS_LIBGL # libgtk3
> +	select BR2_PACKAGE_LIBGLIB2
> +	select BR2_PACKAGE_LIBXML2
> +	select BR2_PACKAGE_LIBGTK3

It's really complicated to duplicate all the gtk3 depends on. So
instead, I've used "depends on BR2_PACKAGE_LIBGTK3". It's pretty
obvious for the user that gtksourceview needs gtk anyway.

This allows to get rid of the complicated Config.in comments as well.

> +GTKSOURCEVIEW_LICENSE = LGPLv2+

License is LGPLv2.1+.

I've fixed those minor issues, and applied. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
