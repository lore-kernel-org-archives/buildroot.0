From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 13 Apr 2019 16:56:27 +0200
Subject: [Buildroot] [PATCH 1/1] package/softether: fix static build
 with openssl and atomic
In-Reply-To: <20190413084640.32444-1-fontaine.fabrice@gmail.com>
References: <20190413084640.32444-1-fontaine.fabrice@gmail.com>
Message-ID: <21cd8c47-5a00-569b-4d13-b6bc93ae42eb@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 13/04/2019 10:46, Fabrice Fontaine wrote:
> Don't pass --with-openssl option to force softether to use pkg-config
> (see autotools/ax_check_openssl.m4).
> 
> pkg-config will find openssl dependencies such as lz or latomic
> 
> Fix static build on sparc v8 (even if there is no autobuilder failures
> yet)
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

 Applied to master, thanks.

 Small nit though: could you write the commit message something like:

Fixes: static build on sparc v8 (even if there are no autobuilder failures yet)

 The Fixes: tag is recognized by patchwork and is flagged in the F column in the
overview. I sometimes use that to identify priority patches.

 Regards,
 Arnout


> ---
>  package/softether/softether.mk | 11 ++---------
>  1 file changed, 2 insertions(+), 9 deletions(-)
> 
> diff --git a/package/softether/softether.mk b/package/softether/softether.mk
> index 31378e8b70..1a31abd4bd 100644
> --- a/package/softether/softether.mk
> +++ b/package/softether/softether.mk
> @@ -8,7 +8,7 @@ SOFTETHER_VERSION = v4.28-9669-beta
>  SOFTETHER_SITE = $(call github,SoftEtherVPN,SoftEtherVPN_stable,$(SOFTETHER_VERSION))
>  SOFTETHER_LICENSE = GPL-2.0
>  SOFTETHER_LICENSE_FILES = LICENSE
> -SOFTETHER_DEPENDENCIES = host-softether libopenssl readline
> +SOFTETHER_DEPENDENCIES = host-pkgconf host-softether libopenssl readline
>  SOFTETHER_AUTORECONF = YES
>  
>  ifeq ($(BR2_ENABLE_LOCALE),)
> @@ -16,14 +16,7 @@ SOFTETHER_DEPENDENCIES += libiconv
>  SOFTETHER_CONF_ENV = LIBS+=" -liconv"
>  endif
>  
> -ifeq ($(BR2_STATIC_LIBS),y)
> -# openssl needs zlib
> -SOFTETHER_CONF_ENV += LIBS+=" -lz"
> -endif
> -
> -SOFTETHER_CONF_OPTS = \
> -	--with-openssl="$(STAGING_DIR)/usr" \
> -	--with-zlib="$(STAGING_DIR)/usr"
> +SOFTETHER_CONF_OPTS = --with-zlib="$(STAGING_DIR)/usr"
>  
>  # host-libiconv does not exist, therefore we need this extra line
>  HOST_SOFTETHER_DEPENDENCIES = host-pkgconf host-libopenssl host-readline
> 
