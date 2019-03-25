From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 25 Mar 2019 19:24:16 +0100
Subject: [Buildroot] [PATCH] package/lua-gd: new package
In-Reply-To: <20190323121150.20564-1-francois.perrad@gadz.org>
References: <20190323121150.20564-1-francois.perrad@gadz.org>
Message-ID: <20190325192416.10177592@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Fran?ois,

Overall looks good, was about to apply, but I have a couple of
comments/questions, see below.

On Sat, 23 Mar 2019 13:11:50 +0100
Francois Perrad <fperrad@gmail.com> wrote:

> diff --git a/package/lua-gd/0001-Protect-declaration-of-LgdImageCreateFromPng-with-GD.patch b/package/lua-gd/0001-Protect-declaration-of-LgdImageCreateFromPng-with-GD.patch
> new file mode 100644
> index 000000000..0d507d603
> --- /dev/null
> +++ b/package/lua-gd/0001-Protect-declaration-of-LgdImageCreateFromPng-with-GD.patch
> @@ -0,0 +1,28 @@
> +Protect declaration of LgdImageCreateFromPng* with GD_PNG feature test macro
> +
> +If GD_PNG is false, neither LgdImageCreateFromPng nor
> +LgdImageCreateFromPngPtr would be implemented. We should avoid declaring
> +them too.
> +
> +Fetch from: https://github.com/ittner/lua-gd/pull/8
> +
> +Signed-off-by: Francois Perrad <francois.perrad@gadz.org>

Please use
https://github.com/ittner/lua-gd/commit/78afd1c5f1ceaed05b78ac42c297d87a493295fd.patch
and create a Git formatted patch, i.e:

	$ git clone https://github.com/ittner/lua-gd.git
	$ curl https://github.com/ittner/lua-gd/commit/78afd1c5f1ceaed05b78ac42c297d87a493295fd.patch | git am -s
	$ git format-patch HEAD^

> diff --git a/package/lua-gd/lua-gd.mk b/package/lua-gd/lua-gd.mk
> new file mode 100644
> index 000000000..77d63d4de
> --- /dev/null
> +++ b/package/lua-gd/lua-gd.mk
> @@ -0,0 +1,25 @@
> +################################################################################
> +#
> +# lua-gd
> +#
> +################################################################################
> +
> +LUA_GD_VERSION = e60b13b7977bb3424d7044976ccba5d42c256934
> +LUA_GD_SITE = $(call github,ittner,lua-gd,$(LUA_GD_VERSION))
> +LUA_GD_LICENSE = MIT
> +LUA_GD_LICENSE_FILES = COPYING
> +LUA_GD_DEPENDENCIES = luainterpreter gd
> +
> +define LUA_GD_BUILD_CMDS
> +	$(MAKE) -C $(@D) gd.so \
> +		GDLIBCONFIG="$(STAGING_DIR)/usr/bin/$(GD_CONFIG_SCRIPTS)" \

We don't typically use the <pkg>_CONFIG_SCRIPTS variable from another
package, because it may contains multiple entries, so please stick to:

	GDLIBCONFIG=$(STAGING_DIR)/usr/bin/gdlib-config

> +		CC=$(TARGET_CC) \
> +		CFLAGS="$(TARGET_CFLAGS) -DVERSION=\\\"$(GD_VERSION)r3\\\"" \

What is this $(GD_VERSION)r3 thing ? Why r3 ? If it's really needed
as-is, it deserves a small comment.

> +define LUA_GD_INSTALL_TARGET_CMDS
> +	$(INSTALL) -D $(@D)/gd.so $(TARGET_DIR)/usr/lib/lua/$(LUAINTERPRETER_ABIVER)/gd.so

Please add an explicit -m option to define the permissions.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
