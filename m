From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 8 Oct 2019 09:23:59 +0200
Subject: [Buildroot] [PATCH] package/lua-sdl2: fix install path
In-Reply-To: <20191007040250.23281-1-francois.perrad@gadz.org>
References: <20191007040250.23281-1-francois.perrad@gadz.org>
Message-ID: <20191008092359.0fff1caa@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Fran?ois,

On Mon,  7 Oct 2019 06:02:50 +0200
Francois Perrad <fperrad@gmail.com> wrote:

> WITH_LUAVER must be set with a value depending of Lua interpreter,
> by this way, the module is installed in the correct location
> 
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> ---
>  package/lua-sdl2/lua-sdl2.mk | 12 +++++++++++-
>  1 file changed, 11 insertions(+), 1 deletion(-)
> 
> diff --git a/package/lua-sdl2/lua-sdl2.mk b/package/lua-sdl2/lua-sdl2.mk
> index a1e54bfde..e0ed0b7e2 100644
> --- a/package/lua-sdl2/lua-sdl2.mk
> +++ b/package/lua-sdl2/lua-sdl2.mk
> @@ -10,7 +10,17 @@ LUA_SDL2_LICENSE = ISC
>  LUA_SDL2_LICENSE_FILES = LICENSE
>  LUA_SDL2_DEPENDENCIES = luainterpreter sdl2
>  
> -LUA_SDL2_CONF_OPTS += -DWITH_LUAVER=user -DLUA_INCLUDE_DIR=$(STAGING_DIR)/usr/include
> +ifeq ($(BR2_PACKAGE_LUAJIT),y)
> +LUA_SDL2_LUAVER=JIT

We put spaces around = sign.

> +else
> +ifeq ($(BR2_PACKAGE_LUA_5_3),y)

This should have been written as:

else ifeq (...)

this way, you don't enter another conditional block, and you don't need
the double "endif".

I fixed that, and applied. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
