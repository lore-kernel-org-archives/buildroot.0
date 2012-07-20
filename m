From: =?ISO-8859-1?Q?Fran=E7ois_Perrad?= <francois.perrad@gadz.org>
Date: Fri, 20 Jul 2012 20:24:27 +0200
Subject: [Buildroot] [UNSURE]Re: [PATCH 1/4] add host arch detection and
 Kconfig BR2_HOSTARCH
In-Reply-To: <20120720141436.5e13d45e@skate>
References: <1342619953-15512-1-git-send-email-francois.perrad@gadz.org>
 <20120718193750.2020db34@skate>
 <CAB0FRsuN7f=0PehFg9XvythsfJh9oCwPcikz8Dtmig=LnDWQEQ@mail.gmail.com>
 <20120719150310.294327e5@skate>
 <CAB0FRsth=O9vVnLJEhXWnCUExPo+3yzkp0PPVZfmn+p_JToxKQ@mail.gmail.com>
 <20120720141436.5e13d45e@skate>
Message-ID: <CAB0FRsvT83vy8tVVo7iXcZeBbyYAhsy+30sJRXZzee9AMFoJfA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2012/7/20 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>:
> Le Fri, 20 Jul 2012 13:40:14 +0200,
> Fran?ois Perrad <francois.perrad@gadz.org> a ?crit :
>
>> take as example a target with luajit and luasocket.
>> nothing from lua is needed at runtime.
>> but at compile time of luasocket, include files from lua (lua.h,
>> luaconf.h, lualib.h, lauxlib.h) are mandatory in staging.
>> so, luasocket.mk contains : LUASOCKET_DEPENDENCIES = lua
>>
>> so, it is useful that BR2_PACKAGE_LUA installs nothing on target.
>> the 3 sub-options BR2_PACKAGE_LUA_COMPILER,
>> BR2_PACKAGE_LUA_INTERPRETER and  BR2_PACKAGE_LUA_SHARED_LIBRARY are
>> install flags (as said in there help doc).
>> so, BR2_PACKAGE_LUA_SHARED_LIBRARY shouldn't be removed.
>
> So this means luajit is not a complete replacement for lua?
>
> Note that you did:
>
> if BR2_PACKAGE_LUA || BR2_PACKAGE_LUAJIT
> menu "LUA libraries/modules"
> source "package/cgilua/Config.in"
> source "package/copas/Config.in"
> source "package/coxpcall/Config.in"
> source "package/luacjson/Config.in"
> source "package/luaexpat/Config.in"
> source "package/luafilesystem/Config.in"
> source "package/luasocket/Config.in"
> source "package/rings/Config.in"
> source "package/wsapi/Config.in"
> source "package/xavante/Config.in"
> endmenu
>
> So this means that Lua modules can currently be compiled without the
> Lua package being selected. Of course, the Lua package will be built
> because the Lua modules packages depend on it (in terms of .mk), but
> that's really not how things are supposed to work.
>
> Thomas

LuaJIT was designed to operate with modules compiled with Lua 5.1 includes.

But LuaJIT supplies also its own set of includes (in /usr/include/luajit-2.0).

So, each Lua module could be modified with the following pattern :
    ifeq ($(BR2_PACKAGE_LUA),y)
        LUAFOO_DEPENDENCIES = lua
        LUAFOO_INCLUDES = $(STAGING_DIR)/usr/include
    else
        LUAFOO_DEPENDENCIES = luajit
        LUAFOO_INCLUDES = $(STAGING_DIR)/usr/include/luajit-2.0
    endif

instead of the current : LUAFOO_DEPENDENCIES = lua

Currently, I prefer the shortest pattern.

Fran?ois

> --
> Thomas Petazzoni, Free Electrons
> Kernel, drivers, real-time and embedded Linux
> development, consulting, training and support.
> http://free-electrons.com
