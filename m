From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 20 Jun 2021 15:44:39 +0200
Subject: [Buildroot] [PATCH 1/1] package/libuhttpd: bump version to
 3.12.1
In-Reply-To: <20210607024239.2657720-2-zhaojh329@gmail.com>
References: <20210607024239.2657720-1-zhaojh329@gmail.com>
 <20210607024239.2657720-2-zhaojh329@gmail.com>
Message-ID: <0b38c2cc-279b-0886-8d4b-badc78aa392e@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 07/06/2021 04:42, Jianhui Zhao wrote:
> Signed-off-by: Jianhui Zhao <zhaojh329@gmail.com>
> ---
>  package/libuhttpd/libuhttpd.hash |  2 +-
>  package/libuhttpd/libuhttpd.mk   | 27 ++++++---------------------
>  2 files changed, 7 insertions(+), 22 deletions(-)
> 
> diff --git a/package/libuhttpd/libuhttpd.hash b/package/libuhttpd/libuhttpd.hash
> index 4b0b5027c6..98bd6e513b 100644
> --- a/package/libuhttpd/libuhttpd.hash
> +++ b/package/libuhttpd/libuhttpd.hash
> @@ -1,3 +1,3 @@
>  # Locally calculated
> -sha256  6e7a9ad61e3d0ab5bd4d20b274b850542dff8057a8fcf6c36ce59eb34818f61f  libuhttpd-3.10.1.tar.gz

 You previously submitted a patch that bumped it to 3.11.1, which was applied to
the 'next' branch. Therefore, you should have based your patch on the 'next' branch.

> +sha256  c234dd3d491c4daa047e28870c6e740529b2eff2dd027dafb6bf02d8dba286b0  libuhttpd-3.12.1.tar.gz
>  sha256  99efed4bbc0b62f96f999ef23399e38234fb91651af734fd389a52b033a85b55  LICENSE
> diff --git a/package/libuhttpd/libuhttpd.mk b/package/libuhttpd/libuhttpd.mk
> index 326c78face..782e04a257 100644
> --- a/package/libuhttpd/libuhttpd.mk
> +++ b/package/libuhttpd/libuhttpd.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -LIBUHTTPD_VERSION = 3.10.1
> +LIBUHTTPD_VERSION = 3.12.1
>  LIBUHTTPD_SITE = https://github.com/zhaojh329/libuhttpd/releases/download/v$(LIBUHTTPD_VERSION)
>  LIBUHTTPD_LICENSE = MIT
>  LIBUHTTPD_LICENSE_FILES = LICENSE
> @@ -13,34 +13,19 @@ LIBUHTTPD_DEPENDENCIES = libev
>  
>  ifeq ($(BR2_PACKAGE_OPENSSL),y)
>  LIBUHTTPD_DEPENDENCIES += openssl
> -LIBUHTTPD_CONF_OPTS += \
> -	-DUHTTPD_SSL_SUPPORT=ON \
> -	-DUHTTPD_USE_MBEDTLS=OFF \
> -	-DUHTTPD_USE_OPENSSL=ON \
> -	-DUHTTPD_USE_WOLFSSL=OFF
> +LIBUHTTPD_CONF_OPTS += -DUSE_OPENSSL=ON

 This change shouldn't have been made. We want to be explicit about the options
that are turned on and off.

>  else ifeq ($(BR2_PACKAGE_WOLFSSL),y)
>  LIBUHTTPD_DEPENDENCIES += wolfssl
> -LIBUHTTPD_CONF_OPTS += \
> -	-DUHTTPD_SSL_SUPPORT=ON \
> -	-DUHTTPD_USE_MBEDTLS=OFF \
> -	-DUHTTPD_USE_OPENSSL=OFF \
> -	-DUHTTPD_USE_WOLFSSL=ON
> +LIBUHTTPD_CONF_OPTS += -DUSE_WOLFSSL=ON
>  else ifeq ($(BR2_PACKAGE_MBEDTLS),y)
>  LIBUHTTPD_DEPENDENCIES += mbedtls
> -LIBUHTTPD_CONF_OPTS += \
> -	-DUHTTPD_SSL_SUPPORT=ON \
> -	-DUHTTPD_USE_MBEDTLS=ON \
> -	-DUHTTPD_USE_OPENSSL=OFF \
> -	-DUHTTPD_USE_WOLFSSL=OFF
> +LIBUHTTPD_CONF_OPTS += -DUSE_MBEDTLS=ON
>  else
> -LIBUHTTPD_CONF_OPTS += -DUHTTPD_SSL_SUPPORT=OFF
> +LIBUHTTPD_CONF_OPTS += -DSSL_SUPPORT=OFF
>  endif
>  
> -# BUILD_SHARED_LIBS is handled in pkg-cmake.mk as it is a generic cmake variable
>  ifeq ($(BR2_SHARED_STATIC_LIBS),y)
> -LIBUHTTPD_CONF_OPTS += -DBUILD_STATIC_LIBS=ON
> -else ifeq ($(BR2_SHARED_LIBS),y)
> -LIBUHTTPD_CONF_OPTS += -DBUILD_STATIC_LIBS=OFF
> +LIBUHTTPD_CONF_OPTS += -DBUILD_STATIC=ON

 Here also we want the negative case to be explicit.

 I made thosw changes, and also updated the commit message with an explanation
of them:

    CMake options have been renamed: UHTTPD_ prefix was dropped,
    BUILD_STATIC_LIBS renamed to BUILD_STATIC.

    Also fix handling of BUILD_STATIC: it should only be given when building
    static libs, otherwise no dynamic lib is built.


 Applied to master, thanks.

 Regards,
 Arnout


>  endif
>  
>  $(eval $(cmake-package))
> 
