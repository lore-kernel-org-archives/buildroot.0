From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 27 Jul 2020 22:11:18 +0200
Subject: [Buildroot] [PATCH v3 6/9] package/minetest: do not select
 luajit
In-Reply-To: <CADvTj4q8iYZxC9762dOSn0HfqNsyq+ZUkzYKt57pmP9tJ3ouxw@mail.gmail.com>
References: <20200525004845.3019642-1-james.hilliard1@gmail.com>
 <20200525004845.3019642-6-james.hilliard1@gmail.com>
 <9bd512a3-e010-62d9-4fe2-841e25abaae5@gmail.com>
 <CADvTj4q8iYZxC9762dOSn0HfqNsyq+ZUkzYKt57pmP9tJ3ouxw@mail.gmail.com>
Message-ID: <20200727201118.GM19818@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

James, All,

On 2020-06-06 16:43 -0600, James Hilliard spake thusly:
> On Sat, Jun 6, 2020 at 11:05 AM Romain Naour <romain.naour@gmail.com> wrote:
> > Le 25/05/2020 ? 02:48, James Hilliard a ?crit :
> > > Since luajit is not a requirement for minetest we should not select it
> > > instead we should conditionally use it when available.
> > I never tested minetest without Luajit since I'm testing with a target using efl
> > + enlightenment that already depend on luajit.
[--SNIP--]
> We're not selecting or depending on buildroot's Lua 5.1 here, only making luajit
> optional, the main reason for this change is that we can't safely
> select luajit at all,
> we could depend on it but since it's not actually a required dependency we can
> just use it conditionally.

As far as I can see, minetest does require a Lua interpreter. What their
README states is:

    ENABLE_LUAJIT=ON    - Build with LuaJIT (much faster than non-JIT Lua)

And if one looks at the code, one can see that only parts of the lua
code is protected behind HAS_LUAJIT, e.g.:

    src/script/cpp_api/s_security.cpp:
      206 	// Copy safe package fields
      207 	lua_getfield(L, old_globals, "package");
      208 	lua_newtable(L);
      209 	copy_safe(L, package_whitelist, sizeof(package_whitelist));
      210 	lua_setglobal(L, "package");
      211 	lua_pop(L, 1);  // Pop old package
      212
      213 #if USE_LUAJIT
      214 	// Copy safe jit functions, if they exist
      215 	lua_getfield(L, -1, "jit");
      216 	if (!lua_isnil(L, -1)) {
      217 		lua_newtable(L);
      218 		copy_safe(L, jit_whitelist, sizeof(jit_whitelist));
      219 		lua_setglobal(L, "jit");
      220 	}
      221 	lua_pop(L, 1);  // Pop old jit
      222 #endif
      223
      224 	lua_pop(L, 1); // Pop globals_backup

So, if not laujit, then we need lua, no?

Regards,
Yann E. MORIN.

> > Best regards,
> > Romain
> >
> > >
> > > Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> > > ---
> > >  package/minetest/Config.in   |  4 ----
> > >  package/minetest/minetest.mk | 10 ++++++++--
> > >  2 files changed, 8 insertions(+), 6 deletions(-)
> > >
> > > diff --git a/package/minetest/Config.in b/package/minetest/Config.in
> > > index 085525534d..19da290df4 100644
> > > --- a/package/minetest/Config.in
> > > +++ b/package/minetest/Config.in
> > > @@ -5,11 +5,9 @@ config BR2_PACKAGE_MINETEST
> > >       depends on BR2_TOOLCHAIN_HAS_THREADS
> > >       depends on BR2_PACKAGE_XORG7 # irrlicht
> > >       depends on BR2_PACKAGE_HAS_LIBGL # irrlicht
> > > -     depends on BR2_PACKAGE_LUAJIT_ARCH_SUPPORTS
> > >       select BR2_PACKAGE_IRRLICHT
> > >       select BR2_PACKAGE_GMP
> > >       select BR2_PACKAGE_JSONCPP
> > > -     select BR2_PACKAGE_LUAJIT
> > >       select BR2_PACKAGE_SQLITE
> > >       select BR2_PACKAGE_ZLIB
> > >       # At least one option must be enabled
> > > @@ -53,13 +51,11 @@ comment "sound support needs a toolchain w/ threads NPTL"
> > >  endif
> > >
> > >  comment "minetest needs a toolchain w/ C++, gcc >= 4.9, threads"
> > > -     depends on BR2_PACKAGE_LUAJIT_ARCH_SUPPORTS
> > >       depends on !BR2_INSTALL_LIBSTDCPP \
> > >               || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 \
> > >               || !BR2_TOOLCHAIN_HAS_THREADS
> > >
> > >  comment "minetest needs X11 and an OpenGL provider"
> > > -     depends on BR2_PACKAGE_LUAJIT_ARCH_SUPPORTS
> > >       depends on (BR2_INSTALL_LIBSTDCPP \
> > >               && BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 \
> > >               && BR2_TOOLCHAIN_HAS_THREADS)
> > > diff --git a/package/minetest/minetest.mk b/package/minetest/minetest.mk
> > > index e8fe5b45ce..c0301273be 100644
> > > --- a/package/minetest/minetest.mk
> > > +++ b/package/minetest/minetest.mk
> > > @@ -9,12 +9,11 @@ MINETEST_SITE = $(call github,minetest,minetest,$(MINETEST_VERSION))
> > >  MINETEST_LICENSE = LGPL-2.1+ (code), CC-BY-SA-3.0 (textures and sounds)
> > >  MINETEST_LICENSE_FILES = LICENSE.txt
> > >
> > > -MINETEST_DEPENDENCIES = gmp irrlicht jsoncpp luajit sqlite zlib
> > > +MINETEST_DEPENDENCIES = gmp irrlicht jsoncpp sqlite zlib
> > >
> > >  MINETEST_CONF_OPTS = \
> > >       -DDEFAULT_RUN_IN_PLACE=OFF \
> > >       -DENABLE_GLES=OFF \
> > > -     -DENABLE_LUAJIT=ON \
> > >       -DENABLE_CURSES=OFF \
> > >       -DAPPLY_LOCALE_BLACKLIST=OFF \
> > >       -DENABLE_SYSTEM_GMP=ON \
> > > @@ -75,6 +74,13 @@ else
> > >  MINETEST_CONF_OPTS += -DENABLE_SPATIAL=OFF
> > >  endif
> > >
> > > +ifeq ($(BR2_PACKAGE_LUAJIT),y)
> > > +MINETEST_DEPENDENCIES += luajit
> > > +MINETEST_CONF_OPTS += -DENABLE_LUAJIT=ON
> > > +else
> > > +MINETEST_CONF_OPTS += -DENABLE_LUAJIT=OFF
> > > +endif
> > > +
> > >  ifeq ($(BR2_PACKAGE_POSTGRESQL),y)
> > >  MINETEST_DEPENDENCIES += postgresql
> > >  MINETEST_CONF_OPTS += -DENABLE_POSTGRESQL=ON
> > >
> >
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
