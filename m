From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 12 Apr 2015 15:23:02 +0200
Subject: [Buildroot] [PATCH v3 1/1] package/exim: Add optional OpenSSL
 support
In-Reply-To: <1428837942-24631-1-git-send-email-bernd.kuhls@t-online.de>
References: <1428837942-24631-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20150412132302.GF4218@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernd, All,

On 2015-04-12 13:25 +0200, Bernd Kuhls spake thusly:
> Also add TARGET_MAKE_ENV to EXIM_BUILD_CMDS to enable access to our pkg-config.
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Tested-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
[build-tested only]
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Note that I was not able to test for static builds, because exim is
already broken in that case; this defconfig does not build:

    BR2_arm=y
    BR2_cortex_a7=y
    BR2_STATIC_LIBS=y
    BR2_TOOLCHAIN_EXTERNAL=y
    BR2_PACKAGE_OPENSSL=y
    BR2_PACKAGE_EXIM=y

and fails with this error message:

    /home/ymorin/dev/buildroot/O/host/opt/ext-toolchain/bin/../lib/gcc
    /arm-linux-musleabi/4.8.3/../../../../arm-linux-musleabi/bin/ld:
    cannot find -lnsl

That's because musl does not provide libnsl. But exim does not disable
libnsl.

A further fix would be to remove use of libnsl when the C library is not
glibc.

This is obviously not related to your patch, however.

Regards,
Yann E. MORIN.

> ---
> v3: Add comment about TARGET_MAKE_ENV (Baruch)
> v2: Use pkg-config to detect openssl (Yann)
> 
>  package/exim/exim.mk |   13 +++++++++++--
>  1 file changed, 11 insertions(+), 2 deletions(-)
> 
> diff --git a/package/exim/exim.mk b/package/exim/exim.mk
> index f39445d..67dbd64 100644
> --- a/package/exim/exim.mk
> +++ b/package/exim/exim.mk
> @@ -9,7 +9,7 @@ EXIM_SOURCE = exim-$(EXIM_VERSION).tar.bz2
>  EXIM_SITE = ftp://ftp.exim.org/pub/exim/exim4
>  EXIM_LICENSE = GPLv2+
>  EXIM_LICENSE_FILES = LICENCE
> -EXIM_DEPENDENCIES = pcre berkeleydb
> +EXIM_DEPENDENCIES = pcre berkeleydb host-pkgconf
>  
>  # Modify a variable value. It must already exist in the file, either
>  # commented or not.
> @@ -62,6 +62,14 @@ define EXIM_USE_DEFAULT_CONFIG_FILE_CLAMAV
>  endef
>  endif
>  
> +ifeq ($(BR2_PACKAGE_OPENSSL),y)
> +EXIM_DEPENDENCIES += openssl
> +define EXIM_USE_DEFAULT_CONFIG_FILE_OPENSSL
> +	$(call exim-config-change,SUPPORT_TLS,yes)
> +	$(call exim-config-change,USE_OPENSSL_PC,openssl)
> +endef
> +endif
> +
>  # this specific toolchain lacks libnsl
>  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_SYNOPSYS_ARC_2014_12),y)
>  define EXIM_REMOVE_LIBNSL_FROM_MAKEFILE
> @@ -89,6 +97,7 @@ define EXIM_CONFIGURE_CMDS
>  	$(EXIM_USE_DEFAULT_CONFIG_FILE)
>  	$(EXIM_USE_DEFAULT_CONFIG_FILE_DOVECOT)
>  	$(EXIM_USE_DEFAULT_CONFIG_FILE_CLAMAV)
> +	$(EXIM_USE_DEFAULT_CONFIG_FILE_OPENSSL)
>  	$(EXIM_CONFIGURE_TOOLCHAIN)
>  endef
>  endif # CUSTOM_CONFIG
> @@ -101,7 +110,7 @@ endif
>  # "The -j (parallel) flag must not be used with make"
>  # (http://www.exim.org/exim-html-current/doc/html/spec_html/ch04.html)
>  define EXIM_BUILD_CMDS
> -	build=br $(MAKE1) -C $(@D) $(EXIM_STATIC_FLAGS)
> +	$(TARGET_MAKE_ENV) build=br $(MAKE1) -C $(@D) $(EXIM_STATIC_FLAGS)
>  endef
>  
>  # Need to replicate the LFLAGS in install, as exim still wants to build
> -- 
> 1.7.10.4
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
