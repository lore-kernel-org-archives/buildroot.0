From: Peter Seiderer <ps.report@gmx.net>
Date: Sun, 21 Jul 2019 11:34:14 +0200
Subject: [Buildroot] [PATCH 1/1] package/glib-networking: needs dynamic
 library
In-Reply-To: <20190718214952.20763-1-fontaine.fabrice@gmail.com>
References: <20190718214952.20763-1-fontaine.fabrice@gmail.com>
Message-ID: <20190721113414.0c604f82@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Fabrice,

On Thu, 18 Jul 2019 23:49:52 +0200, Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> glib-networking uses the meson's shared_module function
>
> Fixes:
>  - http://autobuild.buildroot.org/results/60037e37e020404485df9814f3f3ad4e3b2abdb3
>
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/glib-networking/Config.in | 6 ++++--
>  package/libsoup/Config.in         | 2 +-
>  2 files changed, 5 insertions(+), 3 deletions(-)
>
> diff --git a/package/glib-networking/Config.in b/package/glib-networking/Config.in
> index ec2962392c..339eee1139 100644
> --- a/package/glib-networking/Config.in
> +++ b/package/glib-networking/Config.in
> @@ -3,10 +3,12 @@ config BR2_PACKAGE_GLIB_NETWORKING
>  	depends on BR2_USE_WCHAR # glib2
>  	depends on BR2_TOOLCHAIN_HAS_THREADS # glib2
>  	depends on BR2_USE_MMU # glib2
> +	depends on !BR2_STATIC_LIBS
>  	select BR2_PACKAGE_LIBGLIB2
>  	help
>  	  Network-related GIO modules for glib.
>
> -comment "glib-networking needs a toolchain w/ wchar, threads"
> +comment "glib-networking needs a toolchain w/ wchar, threads, dynamic library"
>  	depends on BR2_USE_MMU
> -	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
> +	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || \
> +		BR2_STATIC_LIBS

Please mention in the commit log that this is a partly revert of commit
ed3eef6bb49270de619e5a86a249fdd8724c40cd 'package/glib-networking: bump
to version 2.61.1' re-adding the dynamic library dependency but from
a different demand...

> diff --git a/package/libsoup/Config.in b/package/libsoup/Config.in
> index 599f9594d9..f6f8fde968 100644
> --- a/package/libsoup/Config.in
> +++ b/package/libsoup/Config.in
> @@ -22,7 +22,7 @@ config BR2_PACKAGE_LIBSOUP_GNOME
>
>  config BR2_PACKAGE_LIBSOUP_SSL
>  	bool "https support"
> -	depends on !BR2_STATIC_LIBS # gnutls
> +	depends on !BR2_STATIC_LIBS # glib-networking, gnutls
>  	select BR2_PACKAGE_GLIB_NETWORKING
>  	select BR2_PACKAGE_GNUTLS
>  	help

And mention that the only direct user of BR2_PACKAGE_LIBSOUP_SSL is
package/webkitgtk for the option BR2_PACKAGE_WEBKITGTK_HTTPS which
already has (from lagacy) the dependency on !BR2_STATIC_LIBS and/or
update the comment in package/webkitgtk/Config.in...

With this changes you can add my

Reviewed-by: Peter Seiderer <ps.report@gmx.net>

Regards,
Peter
