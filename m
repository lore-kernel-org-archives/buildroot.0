From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 30 Dec 2018 15:38:02 -0600
Subject: [Buildroot] [PATCH v2 1/3] package/lua-std-debug: new package
In-Reply-To: <20181230145330.3f930031@windsurf>
References: <1546049245-22865-1-git-send-email-james.hilliard1@gmail.com>
 <20181230145330.3f930031@windsurf>
Message-ID: <CADvTj4pp1AXkige=X5PKOyPk01daPkHyjA194GQYRSQPnu=SGw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, Dec 30, 2018 at 7:53 AM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> Hello,
>
> I have applied, but there were a few things to fix. I'm Cc'ing
> Fran?ois, who gave his Acked-by, so that he can hopefully take into
> account these details for the next reviews. For me, it is *very* useful
> to have the reviews of Fran?ois on Lua patches, but it's even better
> when such a review catches all the small details! :-)
>
> On Sat, 29 Dec 2018 10:07:23 +0800, james.hilliard1 at gmail.com wrote:
>
> >  package/Config.in                        |  1 +
> >  package/lua-std-debug/Config.in          |  7 +++++++
> >  package/lua-std-debug/lua-std-debug.hash |  2 ++
> >  package/lua-std-debug/lua-std-debug.mk   | 16 ++++++++++++++++
>
> First issue: no entry was added to the DEVELOPERS file. Even if
> Fran?ois entry covers all Lua modules, it's good when someone
> contributes a new package that he gets referenced as such in the
> DEVELOPERS file.
Yeah, I didn't do that for these since I was adding these packages
only since they were required for the luaposix version bump, I also
don't normally write anything in lua(I'm primarily a python developer)
but needed to use lua for the built in script interface in the
swupdate package for automatic disk formatting and installation.
>
>
> > diff --git a/package/lua-std-debug/Config.in b/package/lua-std-debug/Config.in
> > new file mode 100644
> > index 0000000..3774292
> > --- /dev/null
> > +++ b/package/lua-std-debug/Config.in
> > @@ -0,0 +1,7 @@
> > +config BR2_PACKAGE_LUA_STD_DEBUG
> > +     bool "lua-std-debug"
> > +     depends on BR2_PACKAGE_HAS_LUAINTERPRETER
>
> This dependency is not needed: all Lua modules inclusions in
> package/Config.in are already enclosed in a
> BR2_PACKAGE_HAS_LUAINTERPRETER & !BR2_STATIC_LIBS condition.
Yeah, I wasn't sure what was supposed to be there, I copied that from luaposix.
>
> > diff --git a/package/lua-std-debug/lua-std-debug.hash b/package/lua-std-debug/lua-std-debug.hash
> > new file mode 100644
> > index 0000000..2c48711
> > --- /dev/null
> > +++ b/package/lua-std-debug/lua-std-debug.hash
> > @@ -0,0 +1,2 @@
> > +# Locally calculated
> > +sha256 7f6b84283d4b78dafee17e7765dd5f1f8e75c3314169977f4dda0e7873616ce2  std._debug-1.0.1-1.src.rock
>
> The hash for the license file was missing.
>
> > diff --git a/package/lua-std-debug/lua-std-debug.mk b/package/lua-std-debug/lua-std-debug.mk
> > new file mode 100644
> > index 0000000..b9e6312
> > --- /dev/null
> > +++ b/package/lua-std-debug/lua-std-debug.mk
> > @@ -0,0 +1,16 @@
> > +################################################################################
> > +#
> > +# lua-std-debug
> > +#
> > +################################################################################
> > +
> > +LUA_STD_DEBUG_VERSION_UPSTREAM = 1.0.1
> > +LUA_STD_DEBUG_VERSION = $(LUA_STD_DEBUG_VERSION_UPSTREAM)-1
> > +LUA_STD_DEBUG_NAME_UPSTREAM = std._debug
> > +LUA_STD_DEBUG_SUBDIR = _debug-$(LUA_STD_DEBUG_VERSION_UPSTREAM)
> > +LUA_STD_DEBUG_ROCKSPEC = $(LUA_STD_DEBUG_NAME_UPSTREAM)-$(LUA_STD_DEBUG_VERSION).rockspec
> > +LUA_STD_DEBUG_SOURCE = $(LUA_STD_DEBUG_NAME_UPSTREAM)-$(LUA_STD_DEBUG_VERSION).src.rock
>
> I was a bit surprised that those values were not automatically inferred
> by the luarocks package infrastructure. However indeed, due to the
> infrastructure using $(call LOWERCASE) and the upstream name containing
> a underscore, it gets turned into a dash, and it no longer matches.
> I don't think it's worth fixing the infrastructure about this right
> now, but it's worth keeping in mind, in case several other packages are
> in the same situation, in which case we could think about improving the
> common infrastructure logic.
>
> > +LUA_STD_DEBUG_LICENSE = MIT
> > +LUA_STD_DEBUG_LICENSE_FILES = LICENSE.md
>
> This was clearly not tested with "make legal-info". Indeed LICENSE.md
> is inside LUA_STD_DEBUG_SUBDIR.
>
> I fixed those details, and applied. Thanks!
>
> Best regards
>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
