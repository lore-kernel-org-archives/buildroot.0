From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Wed, 23 Sep 2015 15:16:40 +0100
Subject: [Buildroot] [PATCH] openssl: change sed expression delimiter
In-Reply-To: <1442931820-20838-1-git-send-email-gustavo.zacarias@free-electrons.com>
References: <1442931820-20838-1-git-send-email-gustavo.zacarias@free-electrons.com>
Message-ID: <5602B448.6010302@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On 09/22/2015 03:23 PM, gustavo.zacarias at free-electrons.com wrote:
> From: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
> 
> Switch from : to # since CFLAGS can include :'s spilled in from
> BR2_TARGET_OPTIMIZATION, for example:
> 
> BR2_TARGET_OPTIMIZATION="-Wl,-rpath,/lib:/usr/lib" would cause the sed
> expression to fail thus breaking the build.
> 
> Changed all of the SEDs to # for consistency.
> 
> Signed-off-by: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
Reviewed-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>

Regards,

Vincent.

> ---
>  package/openssl/openssl.mk | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/package/openssl/openssl.mk b/package/openssl/openssl.mk
> index c1fc420..cad8d0c 100644
> --- a/package/openssl/openssl.mk
> +++ b/package/openssl/openssl.mk
> @@ -65,7 +65,7 @@ define HOST_OPENSSL_CONFIGURE_CMDS
>  		shared \
>  		zlib-dynamic \
>  	)
> -	$(SED) "s:-O[0-9]:$(HOST_CFLAGS):" $(@D)/Makefile
> +	$(SED) "s#-O[0-9]#$(HOST_CFLAGS)#" $(@D)/Makefile
>  endef
>  
>  define OPENSSL_CONFIGURE_CMDS
> @@ -87,15 +87,15 @@ define OPENSSL_CONFIGURE_CMDS
>  			$(if $(BR2_STATIC_LIBS),zlib,zlib-dynamic) \
>  			$(if $(BR2_STATIC_LIBS),no-dso) \
>  	)
> -	$(SED) "s:-march=[-a-z0-9] ::" -e "s:-mcpu=[-a-z0-9] ::g" $(@D)/Makefile
> -	$(SED) "s:-O[0-9]:$(OPENSSL_CFLAGS):" $(@D)/Makefile
> -	$(SED) "s: build_tests::" $(@D)/Makefile
> +	$(SED) "s#-march=[-a-z0-9] ##" -e "s#-mcpu=[-a-z0-9] ##g" $(@D)/Makefile
> +	$(SED) "s#-O[0-9]#$(OPENSSL_CFLAGS)#" $(@D)/Makefile
> +	$(SED) "s# build_tests##" $(@D)/Makefile
>  endef
>  
>  # libdl is not available in a static build, and this is not implied by no-dso
>  ifeq ($(BR2_STATIC_LIBS),y)
>  define OPENSSL_FIXUP_STATIC_MAKEFILE
> -	$(SED) 's/-ldl//g' $(@D)/Makefile
> +	$(SED) 's#-ldl##g' $(@D)/Makefile
>  endef
>  OPENSSL_POST_CONFIGURE_HOOKS += OPENSSL_FIXUP_STATIC_MAKEFILE
>  endif
> @@ -125,9 +125,9 @@ endef
>  # libdl has no business in a static build
>  ifeq ($(BR2_STATIC_LIBS),y)
>  define OPENSSL_FIXUP_STATIC_PKGCONFIG
> -	$(SED) 's/-ldl//' $(STAGING_DIR)/usr/lib/pkgconfig/libcrypto.pc
> -	$(SED) 's/-ldl//' $(STAGING_DIR)/usr/lib/pkgconfig/libssl.pc
> -	$(SED) 's/-ldl//' $(STAGING_DIR)/usr/lib/pkgconfig/openssl.pc
> +	$(SED) 's#-ldl##' $(STAGING_DIR)/usr/lib/pkgconfig/libcrypto.pc
> +	$(SED) 's#-ldl##' $(STAGING_DIR)/usr/lib/pkgconfig/libssl.pc
> +	$(SED) 's#-ldl##' $(STAGING_DIR)/usr/lib/pkgconfig/openssl.pc
>  endef
>  OPENSSL_POST_INSTALL_STAGING_HOOKS += OPENSSL_FIXUP_STATIC_PKGCONFIG
>  endif
> 
