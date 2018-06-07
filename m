From: Baruch Siach <baruch@tkos.co.il>
Date: Thu, 7 Jun 2018 05:39:07 +0300
Subject: [Buildroot] [PATCH 2/2] librsvg: bump to version 2.42.5
In-Reply-To: <20180606202501.14535-2-fontaine.fabrice@gmail.com>
References: <20180606202501.14535-1-fontaine.fabrice@gmail.com>
 <20180606202501.14535-2-fontaine.fabrice@gmail.com>
Message-ID: <20180607023907.rzjm57pe7jggl7sv@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Fabrice,

On Wed, Jun 06, 2018 at 10:25:01PM +0200, Fabrice Fontaine wrote:
> - Add a dependency to host-cargo
> - Add a patch to set RUST_TARGET
> - Add a dependency to BR2_PACKAGE_HOST_RUSTC_ARCH_SUPPORTS
> - Forward this dependency to efl svg and enlightment
> - Add hash for license file
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/efl/Config.in                              |  1 +
>  package/enlightenment/Config.in                    |  2 +
>  .../librsvg/0001-Add-RUST_TARGET-variable.patch    | 57 ++++++++++++++++++++++
>  package/librsvg/Config.in                          |  3 ++
>  package/librsvg/librsvg.hash                       |  7 ++-
>  package/librsvg/librsvg.mk                         | 12 +++--
>  6 files changed, 76 insertions(+), 6 deletions(-)
>  create mode 100644 package/librsvg/0001-Add-RUST_TARGET-variable.patch
> 
> diff --git a/package/efl/Config.in b/package/efl/Config.in
> index cfb803c6df..b9b285d8da 100644
> --- a/package/efl/Config.in
> +++ b/package/efl/Config.in
> @@ -289,6 +289,7 @@ config BR2_PACKAGE_EFL_LIBRAW
>  
>  config BR2_PACKAGE_EFL_SVG
>  	bool "SVG loader"
> +	depends on BR2_PACKAGE_HOST_RUSTC_ARCH_SUPPORTS # librsvg
>  	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # librsvg -> pango -> harfbuzz
>  	select BR2_PACKAGE_LIBRSVG
>  	select BR2_PACKAGE_CAIRO
> diff --git a/package/enlightenment/Config.in b/package/enlightenment/Config.in
> index d1dee25f86..de194c7b37 100644
> --- a/package/enlightenment/Config.in
> +++ b/package/enlightenment/Config.in
> @@ -1,5 +1,6 @@
>  config BR2_PACKAGE_ENLIGHTENMENT
>  	bool "enlightenment"
> +	depends on BR2_PACKAGE_HOST_RUSTC_ARCH_SUPPORTS # efl svg
>  	# libevas-generic-loaders-svg -> librsvg -> glib2 / pango
>  	depends on BR2_USE_WCHAR
>  	depends on BR2_INSTALL_LIBSTDCPP
> @@ -29,6 +30,7 @@ config BR2_PACKAGE_ENLIGHTENMENT
>  	  http://www.enlightenment.org/
>  
>  comment "enlightenment needs udev /dev management and a toolchain w/ wchar, C++, threads"
> +	depends on BR2_PACKAGE_HOST_RUSTC_ARCH_SUPPORTS
>  	depends on BR2_PACKAGE_EFL && BR2_PACKAGE_XORG7 && BR2_USE_MMU
>  	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || !BR2_INSTALL_LIBSTDCPP || \
>  		!BR2_PACKAGE_HAS_UDEV

BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_RSVG and 
BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_RSVG also select BR2_PACKAGE_LIBRSVG, so 
they need that dependency.

[snip]

> diff --git a/package/librsvg/Config.in b/package/librsvg/Config.in
> index ffb0287dbd..45919c7d51 100644
> --- a/package/librsvg/Config.in
> +++ b/package/librsvg/Config.in
> @@ -1,5 +1,6 @@
>  config BR2_PACKAGE_LIBRSVG
>  	bool "librsvg"
> +	depends on BR2_PACKAGE_HOST_RUSTC_ARCH_SUPPORTS
>  	depends on BR2_USE_WCHAR # glib2
>  	depends on BR2_TOOLCHAIN_HAS_THREADS # glib2
>  	depends on BR2_USE_MMU # glib2
> @@ -8,6 +9,7 @@ config BR2_PACKAGE_LIBRSVG
>  	select BR2_PACKAGE_CAIRO
>  	select BR2_PACKAGE_CAIRO_PNG
>  	select BR2_PACKAGE_GDK_PIXBUF
> +	select BR2_PACKAGE_HOST_CARGO

This is not needed for host packages. Listing host-cargo in <PKG>_DEPENDENCIES 
should be enough.

>  	select BR2_PACKAGE_LIBCROCO
>  	select BR2_PACKAGE_LIBGLIB2
>  	select BR2_PACKAGE_LIBXML2
> @@ -19,6 +21,7 @@ config BR2_PACKAGE_LIBRSVG
>  	  https://wiki.gnome.org/Projects/LibRsvg
>  
>  comment "librsvg needs a toolchain w/ wchar, threads, C++"
> +	depends on BR2_PACKAGE_HOST_RUSTC_ARCH_SUPPORTS
>  	depends on BR2_USE_MMU
>  	depends on BR2_TOOLCHAIN_HAS_SYNC_4
>  	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || !BR2_INSTALL_LIBSTDCPP

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
