From: Baruch Siach <baruch@tkos.co.il>
Date: Mon, 30 Oct 2017 07:19:49 +0200
Subject: [Buildroot] [PATCH v2 1/2] package/libssh2: Add selectable
 crypto libraries
In-Reply-To: <1509054225-19795-1-git-send-email-sam.voss@rockwellcollins.com>
References: <1509054225-19795-1-git-send-email-sam.voss@rockwellcollins.com>
Message-ID: <20171030051949.n2w5iprgp6cv5zg2@sapphire.tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Sam,

On Thu, Oct 26, 2017 at 04:43:44PM -0500, Sam Voss wrote:
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

[...]

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

Have you tested combination of options after the version bump in the next 
patch?

The master libssh2 branch changes the configure crypto selection options to 
--with-crypto=auto|openssl|libgcrypt|mbedtls. You should either take this into 
account in the version bump patch, or (preferably, IMO) reverse the patches 
order, change to --with-crypto in the version bump patch, and add selectable 
crypto backend in the second.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
