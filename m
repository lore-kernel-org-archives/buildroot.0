From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 29 Mar 2020 23:27:02 +0200
Subject: [Buildroot] [PATCH v5 1/1] libuwsc: new package
In-Reply-To: <20190914162302.4645-1-zhaojh329@gmail.com>
References: <20190914162302.4645-1-zhaojh329@gmail.com>
Message-ID: <20200329232702.521c6151@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 15 Sep 2019 00:23:02 +0800
Jianhui zhao <zhaojh329@gmail.com> wrote:

> From: Jianhui Zhao <zhaojh329@gmail.com>
> 
> Signed-off-by: Jianhui zhao <zhaojh329@gmail.com>

I've applied the patch, after doing a number of changes, see below.

>  package/Config.in            |  1 +
>  package/libuwsc/Config.in    |  8 ++++++++
>  package/libuwsc/libuwsc.hash |  3 +++
>  package/libuwsc/libuwsc.mk   | 37 ++++++++++++++++++++++++++++++++++++
>  4 files changed, 49 insertions(+)

I've added an entry to the DEVELOPERS file.

> new file mode 100644
> index 0000000000..5afbb186a4
> --- /dev/null
> +++ b/package/libuwsc/libuwsc.mk
> @@ -0,0 +1,37 @@
> +################################################################################
> +#
> +# libuwsc
> +#
> +################################################################################
> +
> +LIBUWSC_VERSION = 3.3.2
> +LIBUWSC_SITE = https://github.com/zhaojh329/libuwsc/releases/download/v$(LIBUWSC_VERSION)
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

Just like for rtty, I've added some explicit disabling of SSL options
when they are not relevant.

> +
> +ifeq ($(BR2_PACKAGE_LUA),y)
> +LIBUWSC_DEPENDENCIES += lua
> +ifeq ($(BR2_PACKAGE_HAS_LUAINTERPRETER),y)
> +LIBUWSC_DEPENDENCIES += luainterpreter

This is not good: you should either use BR2_PACKAGE_LUA, or
BR2_PACKAGE_HJAS_LUAINTERPRETER, but not both.

You must use BR2_PACKAGE_LUA when you only support the original Lua
interpreter. Or use BR2_PACKAGE_HJAS_LUAINTERPRETER when you support
either Lua or LuaJIT. From a quick test build, LuaJIT was not properly
detected, so I've simplified that to only use BR2_PACKAGE_LUA.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
