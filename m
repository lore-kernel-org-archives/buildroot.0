From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 1 Apr 2018 14:04:25 +0200
Subject: [Buildroot] [PATCH 1/1] package/apache: fix dynamic build for
 mod_lua
In-Reply-To: <20180401112900.922-1-bernd.kuhls@t-online.de>
References: <20180401112900.922-1-bernd.kuhls@t-online.de>
Message-ID: <20180401140425.48a41272@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun,  1 Apr 2018 13:29:00 +0200, Bernd Kuhls wrote:

>  APACHE_DEPENDENCIES += lua
> +# liblua uses dlopen when dynamically linked
> +ifneq ($(BR2_STATIC_LIBS),y)
> +APACHE_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -ldl"
> +endif

As usual, I don't like this. Apache uses pkg-config to query for the
availability of Lua, and this should return "the right thing" without
the need for hacks. See modules/lua/config.m4:

if test -n "$PKGCONFIG" -a -z "$lua_path" \
   && $PKGCONFIG --atleast-version=5.1 lua; then
  LUA_LIBS="`$PKGCONFIG --libs lua`"
  LUA_CFLAGS="`$PKGCONFIG --cflags lua`"
  LUA_VERSION="`$PKGCONFIG --modversion lua`"
  AC_MSG_NOTICE([using Lua $LUA_VERSION configuration from pkg-config])

So we need to understand why this doesn't work.

In the failing build, host-pkgconf was built before apache, so
pkg-config was available. But apache didn't use it, I believe because
we pass a non_empty lua_path.

Could you try to pass --with-lua instead of --with-lua=$(STAGING_DIR) ?
That should convince  the stuff to use pkg-config to detect Lua, which
will get the compiler flags from lua.pc, and hopefully they will
contain the -ldl.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
