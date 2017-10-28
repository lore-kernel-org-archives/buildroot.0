From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 28 Oct 2017 16:16:49 +0200
Subject: [Buildroot] [PATCH v2 1/2] package/libssh2: Add selectable
 crypto libraries
In-Reply-To: <1509054225-19795-1-git-send-email-sam.voss@rockwellcollins.com>
References: <1509054225-19795-1-git-send-email-sam.voss@rockwellcollins.com>
Message-ID: <20171028141649.GE3280@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Sam, All,

On 2017-10-26 16:43 -0500, Sam Voss spake thusly:
> Add functionality to allow crypto libraries for libssh2 to be selectable
> by a choice instead of a fallback that may not work in all cases.
> Previous fallback is maintained from within the "defaults" of the choice
> menu, but can be overridden by making a choice.
> 
> This fixes issues where two crypto libraries are present on the system,
> but the fallback order picks the wrong one.
> 
> Signed-off-by: Sam Voss <sam.voss@rockwellcollins.com>
> ---
>  package/libssh2/Config.in  | 34 ++++++++++++++++++++++++++++++++++
>  package/libssh2/libssh2.mk |  8 ++++----
>  2 files changed, 38 insertions(+), 4 deletions(-)
> 
> diff --git a/package/libssh2/Config.in b/package/libssh2/Config.in
> index 9b60823..61be054 100644
> --- a/package/libssh2/Config.in
> +++ b/package/libssh2/Config.in
> @@ -8,3 +8,37 @@ config BR2_PACKAGE_LIBSSH2
>  	  SECSH-FILEXFER(06)*, SECSH-DHGEX(04), and SECSH-NUMBERS(10)
>  
>  	  http://www.libssh2.org/
> +
> +if BR2_PACKAGE_LIBSSH2
> +
> +choice
> +	prompt "Crypto Library"
> +	default BR2_PACKAGE_LIBSSH2_MBEDTLS if BR2_PACKAGE_MBEDTLS
> +	default BR2_PACKAGE_LIBSSH2_LIBGCRYPT if BR2_PACKAGE_LIBGCRYPT
> +	default BR2_PACKAGE_OPENSSL

All those 'default' lines are useless. A choice always defaults to the
first option which dependencies are fulfilled.

> +	help
> +	  Select crypto library to be used in libssh2.
> +
> +config BR2_PACKAGE_LIBSSH2_MBEDTLS
> +	depends on BR2_PACKAGE_MBEDTLS
> +	bool "mbedtls"
> +
> +comment "mbedtls not selected"
> +	depends on !BR2_PACKAGE_MBEDTLS

Don't add those comments.

> +config BR2_PACKAGE_LIBSSH2_LIBGCRYPT
> +	depends on BR2_PACKAGE_LIBGCRYPT
> +	bool "gcrypt"
> +
> +comment "libgcrypt not selected"
> +	depends on !BR2_PACKAGE_LIBGCRYPT

So this patch does two things:
 1- make the backend selectable;
 2- add libgcrypt as a backend.

This should be two patches.

Regards,
Yann E. MORIN.

> +config BR2_PACKAGE_LIBSSH2_OPENSSL
> +	depends on BR2_PACKAGE_OPENSSL
> +	bool "openssl"
> +
> +comment "openssl not selected"
> +	depends on !BR2_PACKAGE_OPENSSL
> +
> +endchoice
> +endif
> diff --git a/package/libssh2/libssh2.mk b/package/libssh2/libssh2.mk
> index dedb890..3978698 100644
> --- a/package/libssh2/libssh2.mk
> +++ b/package/libssh2/libssh2.mk
> @@ -12,20 +12,20 @@ LIBSSH2_INSTALL_STAGING = YES
>  LIBSSH2_CONF_OPTS = --disable-examples-build
>  
>  # Dependency is one of mbedtls, libgcrypt or openssl, guaranteed in
> -# Config.in. Favour mbedtls.
> -ifeq ($(BR2_PACKAGE_MBEDTLS),y)
> +# Config.in.
> +ifeq ($(BR2_PACKAGE_LIBSSH2_MBEDTLS),y)
>  LIBSSH2_DEPENDENCIES += mbedtls
>  LIBSSH2_CONF_OPTS += --with-mbedtls=$(STAGING_DIR)/usr \
>  	--without-openssl --without-libgcrypt
>  LIBSSH2_CONF_ENV += ac_cv_libgcrypt=no
> -else ifeq ($(BR2_PACKAGE_LIBGCRYPT),y)
> +else ifeq ($(BR2_PACKAGE_LIBSSH2_LIBGCRYPT),y)
>  LIBSSH2_DEPENDENCIES += libgcrypt
>  LIBSSH2_CONF_OPTS += --with-libgcrypt=$(STAGING_DIR)/usr \
>  	--without-openssl --without-mbedtls
>  # configure.ac forgets to link to dependent libraries of gcrypt breaking static
>  # linking
>  LIBSSH2_CONF_ENV += LIBS="`$(STAGING_DIR)/usr/bin/libgcrypt-config --libs`"
> -else
> +else ifeq ($(BR2_PACKAGE_LIBSSH2_OPENSSL),y)
>  LIBSSH2_DEPENDENCIES += openssl
>  LIBSSH2_CONF_OPTS += --with-openssl \
>  	--with-libssl-prefix=$(STAGING_DIR)/usr \
> -- 
> 1.9.1
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
