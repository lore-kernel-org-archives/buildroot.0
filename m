From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 20 Jul 2012 20:41:46 +0200
Subject: [Buildroot] [UNSURE]Re: [PATCH 1/4] add host arch detection and
 Kconfig BR2_HOSTARCH
In-Reply-To: <CAB0FRsvT83vy8tVVo7iXcZeBbyYAhsy+30sJRXZzee9AMFoJfA@mail.gmail.com>
References: <1342619953-15512-1-git-send-email-francois.perrad@gadz.org>
 <20120718193750.2020db34@skate>
 <CAB0FRsuN7f=0PehFg9XvythsfJh9oCwPcikz8Dtmig=LnDWQEQ@mail.gmail.com>
 <20120719150310.294327e5@skate>
 <CAB0FRsth=O9vVnLJEhXWnCUExPo+3yzkp0PPVZfmn+p_JToxKQ@mail.gmail.com>
 <20120720141436.5e13d45e@skate>
 <CAB0FRsvT83vy8tVVo7iXcZeBbyYAhsy+30sJRXZzee9AMFoJfA@mail.gmail.com>
Message-ID: <20120720204146.21143421@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Fri, 20 Jul 2012 20:24:27 +0200,
Fran?ois Perrad <francois.perrad@gadz.org> a ?crit :

> LuaJIT was designed to operate with modules compiled with Lua 5.1 includes.
> 
> But LuaJIT supplies also its own set of includes (in /usr/include/luajit-2.0).

So apparently, we could see lua and luajit as two mutually exclusive
packages.

> So, each Lua module could be modified with the following pattern :
>     ifeq ($(BR2_PACKAGE_LUA),y)
>         LUAFOO_DEPENDENCIES = lua
>         LUAFOO_INCLUDES = $(STAGING_DIR)/usr/include
>     else
>         LUAFOO_DEPENDENCIES = luajit
>         LUAFOO_INCLUDES = $(STAGING_DIR)/usr/include/luajit-2.0
>     endif
> 
> instead of the current : LUAFOO_DEPENDENCIES = lua

Or we could do something like:

 (*) lua and luajit are mutually exclusive packages

 (*) Some common .mk file does something like:

ifeq ($(BR2_PACKAGE_LUA),y)
LUA_INTERPRETER = lua
else ifeq ($(BR2_PACKAGE_LUAJIT),y)
LUA_INTERPRETER = luajit
endif

 (*) luajit would install its headers in $(STAGING_DIR)/usr/include, so
 that it is transparent whether lua or luajit is used, from the modules
 point of view

 (*) Lua modules would do LUAFOO_DEPENDENCIES = $(LUA_INTERPRETER)

Or something along those lines.

Essentially, we have a similar sort of problem for jpeg-turbo, which is
a drop-in replacement for libjpeg, and we don't really know how to
handle that properly in BR today.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
