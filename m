From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 28 Oct 2017 19:05:54 +0200
Subject: [Buildroot] [PATCH 1/2] LIBSSH2: Add selectable crypto libraries
In-Reply-To: <1509044092-20922-1-git-send-email-sam.voss@rockwellcollins.com>
References: <1509044092-20922-1-git-send-email-sam.voss@rockwellcollins.com>
Message-ID: <a8b817e4-2ef5-d1ff-ec67-0297439ef8c0@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Sam,

On 26-10-17 20:54, Sam Voss wrote:
> Add functionality to allow crypto libraries for libssh2 to be selectable
> by a choice instead of a fallback that may not work in all cases.
> Previous fallback is maintained from within the "defaults" of the choice
> menu, but can be overridden by making a choice.
> 
> This fixes issues where two crypto libraries are present on the system,
> but the fallback order picks the wrong one.

 If I understand correctly, the problem that you're trying to solve is that you
have (for example) both libgcrypt and openssl selected, and you want libssh2 to
use openssl instead of libgcrypt? Is there any good reason why one is preferably
over the other? Otherwise, the logic we have now should work fine as far as I
can see.


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

 You should also remove the select of the library.

>  	  SECSH-FILEXFER(06)*, SECSH-DHGEX(04), and SECSH-NUMBERS(10)
>  
>  	  http://www.libssh2.org/
> +
> +if BR2_PACKAGE_LIBSSH2
> +
> +choice
> +	prompt "Crypto Library"

 Library -> backend

> +	default BR2_PACKAGE_LIBSSH2_MBEDTLS if BR2_PACKAGE_MBEDTLS
> +	default BR2_PACKAGE_LIBSSH2_LIBGCRYPT if BR2_PACKAGE_LIBGCRYPT
> +	default BR2_PACKAGE_OPENSSL
> +	help
> +	  Select crypto library to be used in libssh2.
> +
> +config BR2_PACKAGE_LIBSSH2_MBEDTLS
> +	depends on BR2_PACKAGE_MBEDTLS

 This should be a select instead of a depend (and the same below)

> +	bool "mbedtls"
> +
> +comment "mbedtls not selected"
> +	depends on !BR2_PACKAGE_MBEDTLS

 With select, the comment becomes unnecessary of course (and the same below).

> +
> +config BR2_PACKAGE_LIBSSH2_LIBGCRYPT
> +	depends on BR2_PACKAGE_LIBGCRYPT

 Also a select, but you have to inherit

	depends on BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS # libgcrypt -> libgpg-error

No comment is needed since it's an arch dependency.


 Regards,
 Arnout

> +	bool "gcrypt"
> +
> +comment "libgcrypt not selected"
> +	depends on !BR2_PACKAGE_LIBGCRYPT
> +
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
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
