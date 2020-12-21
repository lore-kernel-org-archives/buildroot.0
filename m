From: Baruch Siach <baruch@tkos.co.il>
Date: Mon, 21 Dec 2020 14:30:46 +0200
Subject: [Buildroot] [PATCH 2/3] package/p11-kit: libtasn1 is optional,
 not mandatory
In-Reply-To: <20201221122005.343120-2-fontaine.fabrice@gmail.com>
References: <20201221122005.343120-1-fontaine.fabrice@gmail.com>
 <20201221122005.343120-2-fontaine.fabrice@gmail.com>
Message-ID: <87im8vnxxl.fsf@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Fabrice,

On Mon, Dec 21 2020, Fabrice Fontaine wrote:
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/p11-kit/Config.in  | 1 -
>  package/p11-kit/p11-kit.mk | 8 +++++++-
>  2 files changed, 7 insertions(+), 2 deletions(-)
>
> diff --git a/package/p11-kit/Config.in b/package/p11-kit/Config.in
> index 5690418756..9be76c2f41 100644
> --- a/package/p11-kit/Config.in
> +++ b/package/p11-kit/Config.in
> @@ -3,7 +3,6 @@ config BR2_PACKAGE_P11_KIT
>  	depends on !BR2_STATIC_LIBS
>  	depends on BR2_USE_MMU
>  	depends on BR2_TOOLCHAIN_HAS_THREADS
> -	select BR2_PACKAGE_LIBTASN1
>  	help
>  	  Provides a way to load and enumerate PKCS#11 modules.
>  	  Provides a standard configuration setup for installing PKCS#11
> diff --git a/package/p11-kit/p11-kit.mk b/package/p11-kit/p11-kit.mk
> index f67e57102b..c2c6b2ab79 100644
> --- a/package/p11-kit/p11-kit.mk
> +++ b/package/p11-kit/p11-kit.mk
> @@ -6,7 +6,6 @@
>  
>  P11_KIT_VERSION = 0.23.16.1
>  P11_KIT_SITE = https://github.com/p11-glue/p11-kit/releases/download/$(P11_KIT_VERSION)
> -P11_KIT_DEPENDENCIES = host-pkgconf libtasn1
>  P11_KIT_INSTALL_STAGING = YES
>  P11_KIT_CONF_OPTS = --disable-static
>  P11_KIT_CONF_ENV = ac_cv_have_decl_program_invocation_short_name=yes \
> @@ -27,4 +26,11 @@ else
>  P11_KIT_CONF_OPTS += --without-libffi
>  endif
>  
> +ifeq ($(BR2_PACKAGE_LIBTASN1),y)
> +P11_KIT_DEPENDENCIES = host-pkgconf libtasn1

Once again this overwrites the dependencies set in the libffi case
above.

baruch

> +P11_KIT_CONF_OPTS += --with-libtasn1
> +else
> +P11_KIT_CONF_OPTS += --without-libtasn1
> +endif
> +
>  $(eval $(autotools-package))

-- 
                                                     ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
