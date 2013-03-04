From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 4 Mar 2013 22:29:32 +0100
Subject: [Buildroot] [PATCH 2/2] luajit: allow to build Lua extensions
 without lua
In-Reply-To: <1355564002-14490-2-git-send-email-francois.perrad@gadz.org>
References: <1355564002-14490-1-git-send-email-francois.perrad@gadz.org>
 <1355564002-14490-2-git-send-email-francois.perrad@gadz.org>
Message-ID: <20130304222932.40f646b4@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Francois Perrad,

On Sat, 15 Dec 2012 10:33:22 +0100, Francois Perrad wrote:

> diff --git a/package/Makefile.in b/package/Makefile.in
> index 8dea51e..c19887b 100644
> --- a/package/Makefile.in
> +++ b/package/Makefile.in
> @@ -307,6 +307,12 @@ else
>  SHARED_STATIC_LIBS_OPTS=--enable-static --enable-shared
>  endif
>  
> +ifeq ($(BR2_PACKAGE_LUA),y)
> +LUA_INTERPRETER = lua
> +else ifeq ($(BR2_PACKAGE_LUAJIT),y)
> +LUA_INTERPRETER = luajit
> +endif

I think what we want instead here is a virtual package, in the sense of
the OpenGL virtual package I proposed in my Qt5 patch set. See
http://git.free-electrons.com/users/thomas-petazzoni/buildroot/commit/?h=qt5&id=31ceec3926db7fea4fa2ac4b328b022bcec97aac.

In your case, it could be package/luainterpreter/Config.in:

config BR2_PACKAGE_HAS_LUA_INTERPRETER
	bool

package/luainterpreter/luainterpreter.mk:

LUAINTERPRETER_SOURCE =

ifeq ($(BR2_PACKAGE_LUA),y)
LUAINTERPRETER_DEPENDENCIES = lua
endif

ifeq ($(BR2_PACKAGE_LUAJIT),y)
LUAINTERPRETER_DEPENDENCIES = luajit
endif

$(eval $(generic-package))

and then package/lua/Config.in and package/luajit/Config.in would
'select BR2_PACKAGE_HAS_LUA_INTERPRETER'.

And all lua modules would do a 'depends on
BR2_PACKAGE_HAS_LUA_INTERPRETER' and have <pkg>_DEPENDENCIES =
luainterpreter in their .mk file.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
