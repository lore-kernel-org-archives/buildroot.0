From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 27 Jul 2020 13:36:43 -0600
Subject: [Buildroot] [PATCH v3 7/9] package/efl: depend on lua ABI
 version 5.1
In-Reply-To: <20200727192934.GJ19818@scaer>
References: <20200525004845.3019642-1-james.hilliard1@gmail.com>
 <20200525004845.3019642-7-james.hilliard1@gmail.com>
 <20200727191940.GI19818@scaer>
 <CADvTj4rK80BS4Bf+rU-hYpxbWhemH5XvCR9RUM3MGX2XDG-sgA@mail.gmail.com>
 <20200727192934.GJ19818@scaer>
Message-ID: <CADvTj4o66HR7fSs4YxUbK9b=2Xy47PVZa01TK=tBN2WDj6Dy1Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Jul 27, 2020 at 1:29 PM Yann E. MORIN <yann.morin.1998@free.fr> wrote:
>
> James, All,
>
> On 2020-07-27 13:23 -0600, James Hilliard spake thusly:
> > On Mon, Jul 27, 2020 at 1:19 PM Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> > > On 2020-05-24 18:48 -0600, James Hilliard spake thusly:
> > > > Since efl is compatible with lua interpreters that provide the
> > > > version 5.1 ABI we should depend on that instead of unconditionally
> > > > selecting luajit.
> > > >
> > > > Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> > > > ---
> > > [--SNIP--]
> > > > @@ -379,6 +385,14 @@ else
> > > >  HOST_EFL_CONF_OPTS += --disable-cxx-bindings
> > > >  endif
> > > >
> > > > +ifeq ($(BR2_PACKAGE_LUAJIT),y)
> > > > +HOST_EFL_CONF_OPTS += --disable-lua-old
> > > > +HOST_EFL_DEPENDENCIES += host-luajit
> > > > +else ifeq ($(BR2_PACKAGE_LUA),y)
> > > > +HOST_EFL_CONF_OPTS += --enable-lua-old
> > > > +HOST_EFL_DEPENDENCIES += host-lua
> > > > +endif
> > >
> > > Why does the host variant need to build against the same as the target
> > > variant?
> > I think we can change that to just depend on host-luainterpreter which should
> > select the right version.
>
> The provider for the host-luainterpreter is always host-lua, never
> host-luajit::
>
>     config BR2_PACKAGE_PROVIDES_HOST_LUAINTERPRETER
>         string
>         default "host-lua"
>
> So, if the host and target variants of EFL need to be built with/against
> the same lua interpreter, that would not work.
Hmm, I thought there was something in the infrastructure that was supposed
to handle that automatically based on the target lua provider.
>
> So, must ELF target and host variants be built with thwe same Lua
> interpreter?
I recall they were supposed to but it has been a while and I don't really
remember the reason.
>
> Romain, any insight?
>
> Regards,
> Yann E. MORIN.
>
> > > It is very unusual that a target option (here, the target Lua
> > > interpreter) drives the compilation and dependencies of a host package,
> > > so this warrants a bit of explanations.
> > >
> > > Regards,
> > > Yann E. MORIN.
> > >
> > > --
> > > .-----------------.--------------------.------------------.--------------------.
> > > |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
> > > | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
> > > | +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
> > > | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
> > > '------------------------------^-------^------------------^--------------------'
>
> --
> .-----------------.--------------------.------------------.--------------------.
> |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
> | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
> | +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
> | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
> '------------------------------^-------^------------------^--------------------'
