From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 25 Jun 2013 23:25:38 +0200
Subject: [Buildroot] [PATCH] package/libmicrohttpd: minor fixes and
	additions
In-Reply-To: <1372187313-15042-1-git-send-email-c.schoenert@gmail.com>
References: <1372187313-15042-1-git-send-email-c.schoenert@gmail.com>
Message-ID: <51CA0AD2.7030006@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 25/06/13 21:08, Carsten Schoenert wrote:
> From: Carsten Schoenert <c.schoenert@gmail.com>
>
> Correcting the indentation inside Config.in. Also adding the missed
> license information.
>
> Note: libmicrohttpd is partialy dual licensed, if you don't need or want
> to use the HTTPS option you can choose between LPGLv2.1 and the eCos
> license (http://ecos.sourceware.org/license-overview.html).
> If you use the HTTPS option you have to agree to the LGPLv2.1!
>
> Signed-off-by: Carsten Schoenert <c.schoenert@gmail.com>
> ---
>   package/libmicrohttpd/Config.in        |   14 +++++++-------
>   package/libmicrohttpd/libmicrohttpd.mk |    5 ++++-
>   2 files changed, 11 insertions(+), 8 deletions(-)
>
> diff --git a/package/libmicrohttpd/Config.in b/package/libmicrohttpd/Config.in
> index 2e4de0f..5c20ba6 100644
> --- a/package/libmicrohttpd/Config.in
> +++ b/package/libmicrohttpd/Config.in
> @@ -8,13 +8,13 @@ config BR2_PACKAGE_LIBMICROHTTPD
>   	  http://www.gnu.org/software/libmicrohttpd/
>
>   config BR2_PACKAGE_LIBMICROHTTPD_SSL
> -       bool "https support"
> -       depends on BR2_PACKAGE_LIBMICROHTTPD
> -       depends on BR2_USE_WCHAR
> -       select BR2_PACKAGE_GNUTLS
> -       select BR2_PACKAGE_LIBGCRYPT
> -       help
> -         Enable HTTPS (SSL) support.
> +	bool "https support"
> +	depends on BR2_PACKAGE_LIBMICROHTTPD
> +	depends on BR2_USE_WCHAR
> +	select BR2_PACKAGE_GNUTLS
> +	select BR2_PACKAGE_LIBGCRYPT
> +	help
> +	  Enable HTTPS (SSL) support.
>
>   comment "libmicrohttpd needs a toolchain with thread support"
>   	depends on !BR2_TOOLCHAIN_HAS_THREADS
> diff --git a/package/libmicrohttpd/libmicrohttpd.mk b/package/libmicrohttpd/libmicrohttpd.mk
> index 697cbf5..40ef197 100644
> --- a/package/libmicrohttpd/libmicrohttpd.mk
> +++ b/package/libmicrohttpd/libmicrohttpd.mk
> @@ -6,12 +6,15 @@
>
>   LIBMICROHTTPD_VERSION = 0.9.27
>   LIBMICROHTTPD_SITE = $(BR2_GNU_MIRROR)/libmicrohttpd
> +LIBMICROHTTPD_LICENSE = LGPLv2.1 eCos

  Quick check tells me it's LGPLv2.1+

  I would write "LGPLv2.1+ or eCos license" to make the choice more 
explicit, else it looks as if both licenses apply.

> +LIBMICROHTTPD_LICENSE_FILE = COPYING
>   LIBMICROHTTPD_INSTALL_STAGING = YES
>
>   ifeq ($(BR2_PACKAGE_LIBMICROHTTPD_SSL),y)
>   LIBMICROHTTPD_DEPENDENCIES += gnutls libgcrypt
>   LIBMICROHTTPD_CONF_OPT += --enable-https --with-gnutls=$(STAGING_DIR)/usr \
> -			  --with-libgcrypt-prefix=$(STAGING_DIR)/usr
> +						  --with-libgcrypt-prefix=$(STAGING_DIR)/usr
> +LIBMICROHTTPD_LICENSE = LGPLv2.1

  We would typically put the LGPLv2.1 or eCos option in the else branch 
of the condition, rather than overwriting it.

  Regards,
  Arnout

>   else
>   LIBMICROHTTPD_CONF_OPT += --disable-https
>   endif
>


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
