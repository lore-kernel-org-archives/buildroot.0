From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 22 Dec 2019 11:47:56 +0100
Subject: [Buildroot] [PATCHv2 1/1] package/dropbear: group post-extract
 hooks with their call site
In-Reply-To: <20191220160510.21030-1-patrickdepinguin@gmail.com>
References: <20191220160510.21030-1-patrickdepinguin@gmail.com>
Message-ID: <20191222104756.GY26395@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2019-12-20 17:05 +0100, Thomas De Schampheleire spake thusly:
> From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
> 
> The organization of dropbear.mk was no longer very clear: for some
> post-extract blocks, the block was separated from the place where it was
> enabled, but for others they were grouped.
> 
> Regroup all blocks with their call site and inside the condition, if
> present.
> 
> Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/dropbear/dropbear.mk | 32 ++++++++++++++------------------
>  1 file changed, 14 insertions(+), 18 deletions(-)
> 
> v2: move blocks inside condition (ThomasP)
> 
> diff --git a/package/dropbear/dropbear.mk b/package/dropbear/dropbear.mk
> index 7cbc16bc3d..7d1aa5f480 100644
> --- a/package/dropbear/dropbear.mk
> +++ b/package/dropbear/dropbear.mk
> @@ -56,6 +56,7 @@ endef
>  DROPBEAR_POST_EXTRACT_HOOKS += DROPBEAR_SVR_PASSWORD_AUTH
>  endif
>  
> +ifneq ($(BR2_PACKAGE_DROPBEAR_LEGACY_CRYPTO),y)
>  define DROPBEAR_DISABLE_LEGACY_CRYPTO
>  	echo '#define DROPBEAR_3DES 0'                  >> $(@D)/localoptions.h
>  	echo '#define DROPBEAR_ENABLE_CBC_MODE 0'       >> $(@D)/localoptions.h
> @@ -63,28 +64,32 @@ define DROPBEAR_DISABLE_LEGACY_CRYPTO
>  	echo '#define DROPBEAR_DSS 0'                   >> $(@D)/localoptions.h
>  	echo '#define DROPBEAR_DH_GROUP1 0'             >> $(@D)/localoptions.h
>  endef
> -ifneq ($(BR2_PACKAGE_DROPBEAR_LEGACY_CRYPTO),y)
>  DROPBEAR_POST_EXTRACT_HOOKS += DROPBEAR_DISABLE_LEGACY_CRYPTO
>  endif
>  
> +ifeq ($(BR2_PACKAGE_DROPBEAR_DISABLE_REVERSEDNS),)
>  define DROPBEAR_ENABLE_REVERSE_DNS
>  	echo '#define DO_HOST_LOOKUP 1'                 >> $(@D)/localoptions.h
>  endef
> +DROPBEAR_POST_EXTRACT_HOOKS += DROPBEAR_ENABLE_REVERSE_DNS
> +endif
>  
> +ifeq ($(BR2_PACKAGE_DROPBEAR_SMALL),y)
> +DROPBEAR_CONF_OPTS += --disable-zlib --enable-bundled-libtom
> +else
>  define DROPBEAR_BUILD_FEATURED
>  	echo '#define DROPBEAR_SMALL_CODE 0'            >> $(@D)/localoptions.h
>  	echo '#define DROPBEAR_TWOFISH128 1'            >> $(@D)/localoptions.h
>  	echo '#define DROPBEAR_TWOFISH256 1'            >> $(@D)/localoptions.h
>  endef
> -
> -define DROPBEAR_DISABLE_STANDALONE
> -	echo '#define NON_INETD_MODE 0'                 >> $(@D)/localoptions.h
> -endef
> +DROPBEAR_POST_EXTRACT_HOOKS += DROPBEAR_BUILD_FEATURED
> +DROPBEAR_DEPENDENCIES += zlib libtomcrypt
> +DROPBEAR_CONF_OPTS += --disable-bundled-libtom
> +endif
>  
>  define DROPBEAR_CUSTOM_PATH
>  	echo '#define DEFAULT_PATH $(BR2_SYSTEM_DEFAULT_PATH)' >>$(@D)/localoptions.h
>  endef
> -
>  DROPBEAR_POST_EXTRACT_HOOKS += DROPBEAR_CUSTOM_PATH
>  
>  define DROPBEAR_INSTALL_INIT_SYSTEMD
> @@ -101,21 +106,12 @@ define DROPBEAR_INSTALL_INIT_SYSV
>  		$(TARGET_DIR)/etc/init.d/S50dropbear
>  endef
>  else
> +define DROPBEAR_DISABLE_STANDALONE
> +	echo '#define NON_INETD_MODE 0'                 >> $(@D)/localoptions.h
> +endef
>  DROPBEAR_POST_EXTRACT_HOOKS += DROPBEAR_DISABLE_STANDALONE
>  endif
>  
> -ifeq ($(BR2_PACKAGE_DROPBEAR_DISABLE_REVERSEDNS),)
> -DROPBEAR_POST_EXTRACT_HOOKS += DROPBEAR_ENABLE_REVERSE_DNS
> -endif
> -
> -ifeq ($(BR2_PACKAGE_DROPBEAR_SMALL),y)
> -DROPBEAR_CONF_OPTS += --disable-zlib --enable-bundled-libtom
> -else
> -DROPBEAR_POST_EXTRACT_HOOKS += DROPBEAR_BUILD_FEATURED
> -DROPBEAR_DEPENDENCIES += zlib libtomcrypt
> -DROPBEAR_CONF_OPTS += --disable-bundled-libtom
> -endif
> -
>  ifneq ($(BR2_PACKAGE_DROPBEAR_WTMP),y)
>  DROPBEAR_CONF_OPTS += --disable-wtmp
>  endif
> -- 
> 2.23.0
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
