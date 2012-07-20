From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 20 Jul 2012 14:14:36 +0200
Subject: [Buildroot] [UNSURE]Re: [PATCH 1/4] add host arch detection and
 Kconfig BR2_HOSTARCH
In-Reply-To: <CAB0FRsth=O9vVnLJEhXWnCUExPo+3yzkp0PPVZfmn+p_JToxKQ@mail.gmail.com>
References: <1342619953-15512-1-git-send-email-francois.perrad@gadz.org>
 <20120718193750.2020db34@skate>
 <CAB0FRsuN7f=0PehFg9XvythsfJh9oCwPcikz8Dtmig=LnDWQEQ@mail.gmail.com>
 <20120719150310.294327e5@skate>
 <CAB0FRsth=O9vVnLJEhXWnCUExPo+3yzkp0PPVZfmn+p_JToxKQ@mail.gmail.com>
Message-ID: <20120720141436.5e13d45e@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Fri, 20 Jul 2012 13:40:14 +0200,
Fran?ois Perrad <francois.perrad@gadz.org> a ?crit :

> take as example a target with luajit and luasocket.
> nothing from lua is needed at runtime.
> but at compile time of luasocket, include files from lua (lua.h,
> luaconf.h, lualib.h, lauxlib.h) are mandatory in staging.
> so, luasocket.mk contains : LUASOCKET_DEPENDENCIES = lua
> 
> so, it is useful that BR2_PACKAGE_LUA installs nothing on target.
> the 3 sub-options BR2_PACKAGE_LUA_COMPILER,
> BR2_PACKAGE_LUA_INTERPRETER and  BR2_PACKAGE_LUA_SHARED_LIBRARY are
> install flags (as said in there help doc).
> so, BR2_PACKAGE_LUA_SHARED_LIBRARY shouldn't be removed.

So this means luajit is not a complete replacement for lua?

Note that you did:

if BR2_PACKAGE_LUA || BR2_PACKAGE_LUAJIT
menu "LUA libraries/modules"
source "package/cgilua/Config.in"
source "package/copas/Config.in"
source "package/coxpcall/Config.in"
source "package/luacjson/Config.in"
source "package/luaexpat/Config.in"
source "package/luafilesystem/Config.in"
source "package/luasocket/Config.in"
source "package/rings/Config.in"
source "package/wsapi/Config.in"
source "package/xavante/Config.in"
endmenu

So this means that Lua modules can currently be compiled without the
Lua package being selected. Of course, the Lua package will be built
because the Lua modules packages depend on it (in terms of .mk), but
that's really not how things are supposed to work.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
