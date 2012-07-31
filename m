From: =?ISO-8859-1?Q?Fran=E7ois_Perrad?= <francois.perrad@gadz.org>
Date: Tue, 31 Jul 2012 09:56:55 +0200
Subject: [Buildroot] [PATCH 3/4] lua: remove 3 sub-options,
	always install all
In-Reply-To: <20120730225645.6ed17e9f@skate>
References: <1343629890-4657-1-git-send-email-francois.perrad@gadz.org>
 <1343629890-4657-3-git-send-email-francois.perrad@gadz.org>
 <20120730225645.6ed17e9f@skate>
Message-ID: <CAB0FRsvGq7LxcoMZw9wEPkv2ysqY3Xk1A=iqPS6ky8Z7D=Su7Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2012/7/30 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>:
> Le Mon, 30 Jul 2012 08:31:29 +0200,
> Francois Perrad <fperrad@gmail.com> a ?crit :
>
>> ---
>>  package/lua/Config.in |   18 ------------------
>>  package/lua/lua.mk    |   17 +----------------
>>  2 files changed, 1 insertion(+), 34 deletions(-)
>>
>> diff --git a/package/lua/Config.in b/package/lua/Config.in
>> index 06f3046..fc6bb4c 100644
>> --- a/package/lua/Config.in
>> +++ b/package/lua/Config.in
>> @@ -32,29 +32,11 @@ endchoice
>>
>>  if BR2_PACKAGE_LUA
>>
>> -config BR2_PACKAGE_LUA_COMPILER
>> -     bool "lua compiler"
>> -     select BR2_PACKAGE_LUA_SHARED_LIBRARY
>> -     help
>> -       Install luac binary
>> -
>> -config BR2_PACKAGE_LUA_INTERPRETER
>> -     bool "lua interpreter"
>> -     select BR2_PACKAGE_LUA_SHARED_LIBRARY
>> -     help
>> -       Install lua binary
>
> Wouldn't it make sense to keep options for the compiler and
> interpreter? I presume using the compiler on the target is fairly
> uncommon (you would rather do the compilation at build time, no?).
>

The lua bytecode is platform dependent (the header contains the
endianness and the size of some types : int, size_t, Instruction &
lua_Number).
So, the Lua code cannot be compiled on the host and interpreted on target.

> And Lua can be used as a library without the separate /usr/bin/lua
> interpreter, no?
>
> But maybe this last option (the interpreter) is more complicated to
> handle with the choice between lua and luajit.
>

Since lua & luac are linked against the shared library, there are
small (< 10KB).
And the post-build script (BR2_ROOTFS_POST_BUILD_SCRIPT) could remove
them if needed.

So, I think that the 3 sub-options could be removed.

Fran?ois

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
