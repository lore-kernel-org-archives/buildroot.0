From: =?ISO-8859-1?Q?Fran=E7ois_Perrad?= <francois.perrad@gadz.org>
Date: Thu, 19 Jul 2012 14:48:52 +0200
Subject: [Buildroot] [PATCH 1/4] add host arch detection and Kconfig
	BR2_HOSTARCH
In-Reply-To: <20120718193750.2020db34@skate>
References: <1342619953-15512-1-git-send-email-francois.perrad@gadz.org>
 <20120718193750.2020db34@skate>
Message-ID: <CAB0FRsuN7f=0PehFg9XvythsfJh9oCwPcikz8Dtmig=LnDWQEQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2012/7/18 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>:
> Le Wed, 18 Jul 2012 15:59:09 +0200,
> Francois Perrad <fperrad@gmail.com> a ?crit :
>
>> This will allow to install binary package only if they are supported by the
>> host. As example Atmel SAM-BA (x86 only).
>>
>> Signed-off-by: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
>
> I have applied this patch and the 3 other Lua-related patches.
>
> Could you however work on something that ensures that the
> BR2_PACKAGE_LUA option, when enabled, actually installs something?
> Maybe the BR2_PACKAGE_LUA_SHARED_LIBRARY option needs to be removed,
> and just enabling BR2_PACKAGE_LUA should unconditionally install the
> shared library. Sub-options could be used to selectively install the
> interpreter and/or the compiler. Do you think it makes sense?
>

have you reconsidered this outdated patch
http://article.gmane.org/gmane.comp.lib.uclibc.buildroot/43210 ?

> Another thing that would be great is probably to rename all Lua modules
> to lua<something>, like luaexpat and luacjson. Do you think it is
> possible? The only drawback is probably that the package name would no
> longer match the upstream project name, but it would make Lua modules
> much easier to identify in the list of packages in package/.
>

Lua modules use one of following schemes :
    foo, Foo, lfoo, LFoo, luafoo, LuaFoo, lua-foo, lua-Foo, Lua-Foo,
foo-lua, foo-lua, foolua, FooLua
See real world examples in these 2 Lua package managers :
 - LuaRocks : http://luarocks.org/repositories/rocks/
 - LuaDist : https://github.com/LuaDist/Repository

Native binding are compatible Lua/LuaJIT, but the recent LuaJIT FFI
allows to write libraries binding in pure Lua.
So, there are too http://wiki.luajit.org/FFI-Bindings, with more schemes.

my first choice is to move all Lua modules in a directory
'lua-modules' (and for future use, a directory 'luajit-ffi').
you already tell me that it is not the BR policy.
I agree that the directory 'multimedia' is a bad thing.
I think that it is a good way for framework like 'efl', 'x11r7'.
So, I think that it is the good way for interpreted languages like lua
when there are a lot of modules.
(see in attachment a Perl script which does the move,
I write it for this old ticket https://bugs.busybox.net/show_bug.cgi?id=2419)

my second choice is to use the upstream name, like now.
a Lua user could see the list of modules with [menu|g|k]config
or in a well identified section of package/Config.in.

Fran?ois

> Thanks,
>
> Thomas
> --
> Thomas Petazzoni, Free Electrons
> Kernel, drivers, real-time and embedded Linux
> development, consulting, training and support.
> http://free-electrons.com
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
-------------- next part --------------
A non-text attachment was scrubbed...
Name: mv_lua.pl
Type: application/octet-stream
Size: 1699 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20120719/95aeccac/attachment.obj>
