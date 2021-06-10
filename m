From: Adrian Perez de Castro <aperez@igalia.com>
Date: Thu, 10 Jun 2021 22:25:13 +0300
Subject: [Buildroot] [PATCH v2,
 1/1] package/libsoup: always disable tls_check
In-Reply-To: <20210610190313.38683-1-fontaine.fabrice@gmail.com>
References: <20210610190313.38683-1-fontaine.fabrice@gmail.com>
Message-ID: <20210610222513.GB358606@momiji>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On Thu, 10 Jun 2021 21:03:13 +0200 Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:
> Always disable tls_check to avoid the following build failure since bump to
> version 2.72.0 in commit 8e5f7f1cfc8fd7a9d5270f6a9707eb9eecfd21da:
> 
> ../output-1/build/libsoup-2.72.0/meson.build:184:4: ERROR: Can not run test applications in this cross environment.
> 
> Indeed, tls_check will run code since
> https://gitlab.gnome.org/GNOME/libsoup/-/commit/5c45253243a2deca4880d4f614f2932373445cf9
> 
> While at it, also drop glib-networking build-time dependency
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/9e539dc7185cfb81f18438dd36357cb49ef23a5a
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Reviewed-by: Adrian Perez de Castro <aperez@igalia.com>

> ---
> Changes v1 -> v2:
>  - Drop glib-networking build-time dependency
> 
>  package/libsoup/Config.in  | 4 ++--
>  package/libsoup/libsoup.mk | 7 +------
>  2 files changed, 3 insertions(+), 8 deletions(-)
> 
> diff --git a/package/libsoup/Config.in b/package/libsoup/Config.in
> index 47adfb33f2..82ff077b8c 100644
> --- a/package/libsoup/Config.in
> +++ b/package/libsoup/Config.in
> @@ -24,8 +24,8 @@ config BR2_PACKAGE_LIBSOUP_GNOME
>  config BR2_PACKAGE_LIBSOUP_SSL
>  	bool "https support"
>  	depends on !BR2_STATIC_LIBS # glib-networking, gnutls
> -	select BR2_PACKAGE_GLIB_NETWORKING
> -	select BR2_PACKAGE_GNUTLS
> +	select BR2_PACKAGE_GLIB_NETWORKING # runtime
> +	select BR2_PACKAGE_GNUTLS # runtime
>  	help
>  	  Enable HTTPS (SSL) support.
>  
> diff --git a/package/libsoup/libsoup.mk b/package/libsoup/libsoup.mk
> index 2f63e9e85c..964488f430 100644
> --- a/package/libsoup/libsoup.mk
> +++ b/package/libsoup/libsoup.mk
> @@ -30,6 +30,7 @@ LIBSOUP_CONF_OPTS = \
>  	-Dntlm=disabled \
>  	-Dsysprof=disabled \
>  	-Dtests=false \
> +	-Dtls_check=false \
>  	-Dvapi=disabled
>  
>  ifeq ($(BR2_PACKAGE_BROTLI),y)
> @@ -52,10 +53,4 @@ else
>  LIBSOUP_CONF_OPTS += -Dgnome=false
>  endif
>  
> -ifeq ($(BR2_PACKAGE_LIBSOUP_SSL),y)
> -LIBSOUP_DEPENDENCIES += glib-networking
> -else
> -LIBSOUP_CONF_OPTS += -Dtls_check=false
> -endif
> -
>  $(eval $(meson-package))
> -- 
> 2.30.2
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
-------------- next part --------------
A non-text attachment was scrubbed...
Name: not available
Type: application/pgp-signature
Size: 195 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20210610/c18dd66b/attachment.asc>
