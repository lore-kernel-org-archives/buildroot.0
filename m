From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 22 Dec 2013 21:44:00 +0100
Subject: [Buildroot] [pkg-luarocks infra V4 01/10] luainterpreter:
 create virtual package
In-Reply-To: <20131222182249.4b8e0b14@skate>
References: <1384520859-3189-1-git-send-email-francois.perrad@gadz.org>
 <20131222182249.4b8e0b14@skate>
Message-ID: <20131222204359.GB27858@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Francois, All,

On 2013-12-22 18:22 +0100, Thomas Petazzoni spake thusly:
> On Fri, 15 Nov 2013 14:07:30 +0100, Francois Perrad wrote:
> > luainterpreter is lua or luajit
> 
> It would be good to have slightly more verbose commit logs. Something
> like:
> 
> """
> This commit introduces the 'luainterpreter' package, which serves as a
> virtual package depending either on the 'lua' package or the 'luajit'
> package depending on which interpreter is selected.
> 
> In order to achieve this, it also updates all the existing Lua packages
> to depend on luainterpreter... blablabla.
> """

I've tried to be a bit more verbose in the commit log.
To be reviewed.

> > diff --git a/package/Config.in b/package/Config.in
> > index 311cc6c..a8ebb27 100644
> > --- a/package/Config.in
> > +++ b/package/Config.in
> > @@ -352,6 +352,7 @@ source "package/haserl/Config.in"
> >  source "package/jamvm/Config.in"
> >  source "package/jimtcl/Config.in"
> >  source "package/lua/Config.in"
> > +source "package/luainterpreter/Config.in"
> >  source "package/luajit/Config.in"
> >  if BR2_PACKAGE_LUA || BR2_PACKAGE_LUAJIT
> 
> Why not replace this condition by:
> 
> if BR2_PACKAGE_HAS_LUA_INTERPRETER

Done.

> so that you can remove the "depends on BR2_PACKAGE_HAS_LUA_INTERPRETER"
> in all of the Lua packages.

Doh, I forgot that one... :-(

> > diff --git a/package/luainterpreter/luainterpreter.mk b/package/luainterpreter/luainterpreter.mk
> > new file mode 100644
> > index 0000000..6e2ccfe
> > --- /dev/null
> > +++ b/package/luainterpreter/luainterpreter.mk
> > @@ -0,0 +1,18 @@
> > +#############################################################
> > +#
> > +# Virtual package for luainterpreter
> > +#
> > +#############################################################
> 
> No need for a special comment. Just "luainterpreter" is sufficient.

Done.

> > +LUAINTERPRETER_VERSION = virtual
> > +LUAINTERPRETER_SOURCE =
> > +
> > +ifeq ($(BR2_PACKAGE_LUA),y)
> > +LUAINTERPRETER_DEPENDENCIES = lua
> > +endif
> > +
> > +ifeq ($(BR2_PACKAGE_LUAJIT),y)
> > +LUAINTERPRETER_DEPENDENCIES = luajit
> > +endif
> > +
> > +$(eval $(generic-package))
> 
> This should probably be converted to use the new virtual package scheme
> proposed by Yann. But Yann is telling me on IRC that he has already
> done so.

Yep, done.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
