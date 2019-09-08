From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 8 Sep 2019 17:24:51 +0200
Subject: [Buildroot] [PATCH v4 1/1] libuwsc: new package
In-Reply-To: <CAGN0SiHWg3eZ_=2HJnLd6ACODH5WAXTTNBBPZCnW4=t8MMQCzA@mail.gmail.com>
References: <CAGN0SiHWg3eZ_=2HJnLd6ACODH5WAXTTNBBPZCnW4=t8MMQCzA@mail.gmail.com>
Message-ID: <27b89946-3fdd-ca06-a710-e37f52020712@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Zhao,

 Thank you for this new version.

On 08/09/2019 14:54, ??? wrote:
> Signed-off-by: ??? <zhaojh329@gmail.com>
> 
> ---
> Changes v3 -> v4:
>   - perfect configuration (suggested by Baruch Siach)

 That was the change from v2 -> v3. What has changed in this version compared to v3?

> ---
>  package/Config.in            |  1 +
>  package/libuwsc/Config.in    |  8 ++++++++
>  package/libuwsc/libuwsc.hash |  3 +++
>  package/libuwsc/libuwsc.mk   | 34 ++++++++++++++++++++++++++++++++++
>  4 files changed, 46 insertions(+)
>  create mode 100644 package/libuwsc/Config.in
>  create mode 100644 package/libuwsc/libuwsc.hash
>  create mode 100644 package/libuwsc/libuwsc.mk
> 
> diff --git a/package/Config.in b/package/Config.in
> index 9336261c5d..a9f3867949 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -1624,6 +1624,7 @@ menu "Networking"
>   source "package/libupnp18/Config.in"
>   source "package/libupnpp/Config.in"
>   source "package/liburiparser/Config.in"
> + source "package/libuwsc/Config.in"
>   source "package/libvncserver/Config.in"
>   source "package/libwebsock/Config.in"
>   source "package/libwebsockets/Config.in"
> diff --git a/package/libuwsc/Config.in b/package/libuwsc/Config.in
> new file mode 100644
> index 0000000000..ae99b6d2dc
> --- /dev/null
> +++ b/package/libuwsc/Config.in
> @@ -0,0 +1,8 @@
> +config BR2_PACKAGE_LIBUWSC
> + bool "libuwsc"
> + select BR2_PACKAGE_LIBEV
> + help
> +   A Lightweight and fully asynchronous WebSocket client
> +   library based on libev.
> +
> +   https://github.com/zhaojh329/libuwsc
> diff --git a/package/libuwsc/libuwsc.hash b/package/libuwsc/libuwsc.hash
> new file mode 100644
> index 0000000000..f137b3613b
> --- /dev/null
> +++ b/package/libuwsc/libuwsc.hash
> @@ -0,0 +1,3 @@
> +# Locally calculated
> +sha256 bae2cd13eda86876ebcf99a38a069f5e8c01717713d2fec25031051b9c47624b
>  libuwsc-3.3.2.tar.gz

 The patch is still whitespace-damaged. Please consult the end of the
git-send-email man page about how to set up git to work with gmail.


> +sha256 e557975decde6439395e72dce7690d974d1a493722a7be5228794ec944f0c5db
>  LICENSE
> diff --git a/package/libuwsc/libuwsc.mk b/package/libuwsc/libuwsc.mk
> new file mode 100644
> index 0000000000..94b94820e7
> --- /dev/null
> +++ b/package/libuwsc/libuwsc.mk
> @@ -0,0 +1,34 @@
> +################################################################################
> +#
> +# libuwsc
> +#
> +################################################################################
> +
> +LIBUWSC_VERSION = 3.3.2
> +LIBUWSC_SITE =
> https://github.com/zhaojh329/libuwsc/releases/download/v$(LIBUWSC_VERSION)
> +LIBUWSC_LICENSE = MIT
> +LIBUWSC_LICENSE_FILES = LICENSE
> +LIBUWSC_INSTALL_STAGING = YES
> +LIBUWSC_DEPENDENCIES = libev
> +
> +ifeq ($(BR2_PACKAGE_OPENSSL),y)
> +LIBUWSC_DEPENDENCIES += openssl
> +LIBUWSC_CONF_OPTS += -DUWSC_USE_OPENSSL=ON
> +else ifeq ($(BR2_PACKAGE_WOLFSSL),y)
> +LIBUWSC_DEPENDENCIES += wolfssl
> +LIBUWSC_CONF_OPTS += -DUWSC_USE_WOLFSSL=ON
> +else ifeq ($(BR2_PACKAGE_MBEDTLS),y)
> +LIBUWSC_DEPENDENCIES += mbedtls
> +LIBUWSC_CONF_OPTS += -DUWSC_USE_MBEDTLS=ON
> +else
> +LIBUWSC_CONF_OPTS += -DUWSC_SSL_SUPPORT=OFF
> +endif
> +
> +ifneq ($(findstring $(BR2_PACKAGE_LUA_5_1)$(BR2_PACKAGE_LUA_5_3), y),)

 Both Baruch and me have commented on this part. Can you explain why our
suggestions don't work?

 Regards,
 Arnout

> +LIBUWSC_DEPENDENCIES += lua
> +LIBUWSC_CONF_OPTS += -DUWSC_LUA_SUPPORT=ON
> +else
> +LIBUWSC_CONF_OPTS += -DUWSC_LUA_SUPPORT=OFF
> +endif
> +
> +$(eval $(cmake-package))
> 
