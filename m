From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 30 Dec 2020 21:30:06 +0100
Subject: [Buildroot] [PATCH 1/1] package/p11-kit: fix build without tasn1
In-Reply-To: <20201230192038.201344-1-fontaine.fabrice@gmail.com>
References: <20201230192038.201344-1-fontaine.fabrice@gmail.com>
Message-ID: <20201230203006.GA2902@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2020-12-30 20:20 +0100, Fabrice Fontaine spake thusly:
> Commit d82da39d55ea16c3c8aa3c5a8ea91fd6c2ceafbb forgot to move
> BR2_PACKAGE_CA_CERTIFICATES condition under BR2_PACKAGE_LIBTASN1 to
> avoid the following build failure:
> 
> checking if trust module is enabled... configure: WARNING: --with-libtasn1 is needed in order to build the trust module, disabling
> no
> checking for trust module paths... configure: error: need --enable-trust-module in order to specify trust module paths.
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/e7f68205e1b776f9af34e6017f6eb17f46aa2f19
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/p11-kit/p11-kit.mk | 19 +++++++++++--------
>  1 file changed, 11 insertions(+), 8 deletions(-)
> 
> diff --git a/package/p11-kit/p11-kit.mk b/package/p11-kit/p11-kit.mk
> index c2a7b23e9d..1ffc7e21c8 100644
> --- a/package/p11-kit/p11-kit.mk
> +++ b/package/p11-kit/p11-kit.mk
> @@ -13,12 +13,6 @@ P11_KIT_CONF_ENV = ac_cv_have_decl_program_invocation_short_name=yes \
>  P11_KIT_LICENSE = BSD-3-Clause
>  P11_KIT_LICENSE_FILES = COPYING
>  
> -ifeq ($(BR2_PACKAGE_CA_CERTIFICATES),y)
> -P11_KIT_CONF_OPTS += --with-trust-paths=/etc/ssl/certs/ca-certificates.crt
> -else
> -P11_KIT_CONF_OPTS += --without-trust-paths
> -endif
> -
>  ifeq ($(BR2_PACKAGE_LIBFFI),y)
>  P11_KIT_DEPENDENCIES += host-pkgconf libffi
>  P11_KIT_CONF_OPTS += --with-libffi
> @@ -28,9 +22,18 @@ endif
>  
>  ifeq ($(BR2_PACKAGE_LIBTASN1),y)
>  P11_KIT_DEPENDENCIES += host-pkgconf libtasn1
> -P11_KIT_CONF_OPTS += --with-libtasn1
> +P11_KIT_CONF_OPTS += \
> +	--enable-trust-module \
> +	--with-libtasn1
> +ifeq ($(BR2_PACKAGE_CA_CERTIFICATES),y)
> +P11_KIT_CONF_OPTS += --with-trust-paths=/etc/ssl/certs/ca-certificates.crt
> +else
> +P11_KIT_CONF_OPTS += --without-trust-paths
> +endif
>  else
> -P11_KIT_CONF_OPTS += --without-libtasn1
> +P11_KIT_CONF_OPTS += \
> +	--disable-trust-module \
> +	--without-libtasn1
>  endif
>  
>  $(eval $(autotools-package))
> -- 
> 2.29.2
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
