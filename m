From: =?UTF-8?Q?Fran=C3=A7ois_Perrad?= <francois.perrad@gadz.org>
Date: Mon, 18 Jan 2016 21:16:04 +0100
Subject: [Buildroot] [PATCH] lighttpd: requires a Lua 5.1.x
In-Reply-To: <8760yq7lvs.fsf@dell.be.48ers.dk>
References: <1453030107-7010-1-git-send-email-francois.perrad@gadz.org>
 <8760yq7lvs.fsf@dell.be.48ers.dk>
Message-ID: <CAB0FRsvFSPO_EKWM01kYG367CNE_FwETWPPNZqK6CxroLk-g+A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter,

I try this patch, it fixes only the file src/mod_magnet.c,
but it doesn't fix the compilation of src/mod_cml_lua.c

ibtool: compile:
/home/user/build/sourcery/host/usr/bin/arm-none-linux-gnueabi-gcc
-DHAVE_CONFIG_H -DHAVE_VERSION_H -DLIBRARY_DIR=\"/usr/lib/lighttpd\"
-DSBIN_DIR=\"/usr/sbin\" -I. -I.. -D_LARGEFILE_SOURCE
-D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -D_REENTRANT
-D__EXTENSIONS__ -DOPENSSL_NO_KRB5 -D_FILE_OFFSET_BITS=64
-D_LARGEFILE_SOURCE -D_LARGE_FILES
-I/home/user/build/sourcery/host/usr/arm-buildroot-linux-gnueabi/sysroot/usr/include
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -Os
-Wall -W -Wshadow -pedantic -std=gnu99 -c mod_cml_funcs.c  -fPIC -DPIC
-o .libs/mod_cml_la-mod_cml_funcs.o
mod_cml_lua.c: In function 'lua_to_c_get_string':
mod_cml_lua.c:54:18: error: 'LUA_GLOBALSINDEX' undeclared (first use
in this function)
  lua_gettable(L, LUA_GLOBALSINDEX);
                  ^
mod_cml_lua.c:54:18: note: each undeclared identifier is reported only
once for each function it appears in
mod_cml_lua.c: In function 'lua_to_c_is_table':
mod_cml_lua.c:78:18: error: 'LUA_GLOBALSINDEX' undeclared (first use
in this function)
  lua_gettable(L, LUA_GLOBALSINDEX);
                  ^
mod_cml_lua.c: In function 'cache_parse_lua':
mod_cml_lua.c:254:18: error: 'LUA_GLOBALSINDEX' undeclared (first use
in this function)
  lua_settable(L, LUA_GLOBALSINDEX);
                  ^
mod_cml_lua.c:294:2: error: too few arguments to function 'lua_load'
  if (lua_load(L, load_file, &rm, fn->ptr) || lua_pcall(L,0,1,0)) {
  ^
In file included from mod_cml_funcs.h:9:0,
                 from mod_cml_lua.c:2:
/home/user/build/sourcery/host/usr/arm-buildroot-linux-gnueabi/sysroot/usr/include/lua.h:261:16:
note: declared here
 LUA_API int   (lua_load) (lua_State *L, lua_Reader reader, void *dt,
                ^
Makefile:1635: recipe for target 'mod_cml_la-mod_cml_lua.lo' failed


Fran?ois

2016-01-18 20:01 GMT+01:00 Peter Korsgaard <peter@korsgaard.com>:
>>>>>> "Francois" == Francois Perrad <fperrad@gmail.com> writes:
>
>  > see failure in http://autobuild.buildroot.net/results/13f/13faa9ebce00359b8943775364a432ce422fe8b8/
>  > Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
>
> How about we instead backport r3070, which afaik should be included in
> the next release:
>
> https://redmine.lighttpd.net/issues/2674
>
> --
> Bye, Peter Korsgaard
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
