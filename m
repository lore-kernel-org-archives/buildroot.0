From: Jordan Yelloz <jordan@yelloz.me>
Date: Mon, 25 Jul 2016 09:36:13 -0700
Subject: [Buildroot] [PATCH 3/4] swupdate: improved help text for Lua
 support
In-Reply-To: <20160725093253.089ea2a8@free-electrons.com>
References: <20160724232739.14132-1-jordan@yelloz.me>
 <20160724232739.14132-4-jordan@yelloz.me>
 <20160725093253.089ea2a8@free-electrons.com>
Message-ID: <5f0bb3f1-3f91-0bf0-8677-790dad5e92fe@yelloz.me>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 07/25/2016 12:32 AM, Thomas Petazzoni wrote:
> Hello,
> 
> On Sun, 24 Jul 2016 16:27:38 -0700, Jordan Yelloz wrote:
> 
>> -	  * Select BR2_PACKAGE_LUA if you want to have Lua support.
>> +	  * Select BR2_PACKAGE_LUA or BR2_PACKAGE_LUAJIT if you want to have Lua
>> +	    support.
>> +	    CONFIG_HANDLER_IN_LUA is not supported in LuaJIT or Lua 5.1.
>> +	    swupdate must be manually configured with CONFIG_LUAVERSION="jit-5.1"
>> +	    to link against luajit.
> 
> What does this last sentence means?
> 
> Thomas
> 

Regarding CONFIG_LUAVERSION, this is trying to explain how to
successfully configure swupdate to build against LuaJIT. If you just
choose LuaJIT, it will not be successful automatically due to some minor
limitations in the swupdate build system.

swupdate has some build rules that are not that good (it uses
pkg-config for some parts of the build but uses a secondary list of
library names to actually link the final executable against) and when
adding the Lua library to the list of libraries to link, it relies on
concatenating "lua" with $(CONFIG_LUAVERSION).

Basically, the only way to get swupdate to link against libluajit-5.1.so
is to ensure CONFIG_LUAVERSION="jit-5.1" is in your swupdate KConfig
file. To me, the easiest/safest way of handling that is to expect the
user to configure swupdate manually with that value.

--
Jordan
