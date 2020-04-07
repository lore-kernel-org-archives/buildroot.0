From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 7 Apr 2020 09:18:53 +0200
Subject: [Buildroot] [PATCH 1/1] package/rng-tools: add nistbeacon option
In-Reply-To: <20200404213653.1538752-1-fontaine.fabrice@gmail.com>
References: <20200404213653.1538752-1-fontaine.fabrice@gmail.com>
Message-ID: <20200407071853.GD22325@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabrice, All,

On 2020-04-04 23:36 +0200, Fabrice Fontaine spake thusly:
> Add an option to enable nistbeacon which is available since version 6.1
> and
> https://github.com/nhorman/rng-tools/commit/aefe862e187a1ef608f9826b2b4a5bbabd5e9945
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/rng-tools/Config.in    | 17 +++++++++++++++++
>  package/rng-tools/rng-tools.mk | 11 ++++++++---
>  2 files changed, 25 insertions(+), 3 deletions(-)
> 
> diff --git a/package/rng-tools/Config.in b/package/rng-tools/Config.in
> index a86fbb0f74..25b41f40d6 100644
> --- a/package/rng-tools/Config.in
> +++ b/package/rng-tools/Config.in
> @@ -11,5 +11,22 @@ config BR2_PACKAGE_RNG_TOOLS
>  
>  	  http://sourceforge.net/projects/gkernel/
>  
> +if BR2_PACKAGE_RNG_TOOLS
> +
> +config BR2_PACKAGE_RNG_TOOLS_NISTBEACON
> +	bool "NIST Entropy Beacon support"
> +	select BR2_PACKAGE_JANSSON
> +	select BR2_PACKAGE_LIBCURL
> +	select BR2_PACKAGE_LIBXML2
> +	help
> +	  Enable NIST Entropy Beacon support.
> +
> +	  Entropy gathered from the NIST network entropy beacon. Note
> +	  that this entropy source is disabled by default as it should
> +	  never be used for cryptographic purposes, or any use case in
> +	  which random data should be known only by a single entity.
> +
> +endif
> +
>  comment "rng-tools needs a toolchain w/ NPTL"
>  	depends on !BR2_TOOLCHAIN_HAS_THREADS_NPTL
> diff --git a/package/rng-tools/rng-tools.mk b/package/rng-tools/rng-tools.mk
> index 8ebfc0975a..3baddb98ee 100644
> --- a/package/rng-tools/rng-tools.mk
> +++ b/package/rng-tools/rng-tools.mk
> @@ -12,9 +12,7 @@ RNG_TOOLS_DEPENDENCIES = libsysfs jitterentropy-library host-pkgconf openssl
>  # From git
>  RNG_TOOLS_AUTORECONF = YES
>  
> -RNG_TOOLS_CONF_OPTS = \
> -	--without-nistbeacon \
> -	--without-pkcs11
> +RNG_TOOLS_CONF_OPTS = --without-pkcs11
>  
>  # Work around for uClibc or musl toolchains which lack argp_*()
>  # functions.
> @@ -30,6 +28,13 @@ else
>  RNG_TOOLS_CONF_OPTS += --without-rtlsdr
>  endif
>  
> +ifeq ($(BR2_PACKAGE_RNG_TOOLS_NISTBEACON),y)
> +RNG_TOOLS_DEPENDENCIES += jansson libcurl libxml2
> +RNG_TOOLS_CONF_OPTS += --with-nistbeacon
> +else
> +RNG_TOOLS_CONF_OPTS += --without-nistbeacon
> +endif
> +
>  define RNG_TOOLS_INSTALL_INIT_SYSV
>  	$(INSTALL) -D -m 755 package/rng-tools/S21rngd \
>  		$(TARGET_DIR)/etc/init.d/S21rngd
> -- 
> 2.25.1
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
