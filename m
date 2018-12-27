From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 27 Dec 2018 09:23:02 +0100
Subject: [Buildroot] [PATCH 3/5 v5] core/pkg-infra: allow meson packages
 to specify custom build rules
In-Reply-To: <CADvTj4pab06_x_r6N4q1d-RNTBekoAcZ1aEwB83ks3YzbrdBaw@mail.gmail.com>
References: <cover.1545814334.git.yann.morin.1998@free.fr>
 <acd0d092fa0c62970c3c8b5e3cecedeb73dcc4aa.1545814334.git.yann.morin.1998@free.fr>
 <CADvTj4qeYHq9+QuBfzHoYdhfF0WrVB_f5yxJivuxUdJQcR6EVg@mail.gmail.com>
 <20181226120610.GF14286@scaer>
 <CADvTj4pab06_x_r6N4q1d-RNTBekoAcZ1aEwB83ks3YzbrdBaw@mail.gmail.com>
Message-ID: <20181227082302.GM14286@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

James, All,

On 2018-12-26 22:21 -0600, James Hilliard spake thusly:
> On Wed, Dec 26, 2018 at 6:06 AM Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> >
> > James, ?ric, All,
> >
> > On 2018-12-26 05:36 -0600, James Hilliard spake thusly:
> > > On Wed, Dec 26, 2018 at 2:52 AM Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> > > > Some packages may want to build only specific targets, instead of the
> > > > default.
> > [--SNIP--]
> > > > diff --git a/package/pkg-meson.mk b/package/pkg-meson.mk
> > > > index 507e686068..0588660dbf 100644
> > > > --- a/package/pkg-meson.mk
> > > > +++ b/package/pkg-meson.mk
> > > > @@ -103,12 +103,12 @@ ifndef $(2)_BUILD_CMDS
> > > >  ifeq ($(4),target)
> > > >  define $(2)_BUILD_CMDS
> > > >         $$(TARGET_MAKE_ENV) $$($$(PKG)_NINJA_ENV) \
> > > > -               $$(NINJA) $$(NINJA_OPTS) -C $$($$(PKG)_SRCDIR)/build
> > > > +               $$(NINJA) $$(NINJA_OPTS) $$($$(PKG)_NINJA_OPTS) -C $$($$(PKG)_SRCDIR)/build
> > > >  endef
> > > >  else
> > > >  define $(2)_BUILD_CMDS
> > > >         $$(HOST_MAKE_ENV) $$($$(PKG)_NINJA_ENV) \
> > > > -               $$(NINJA) $$(NINJA_OPTS) -C $$($$(PKG)_SRCDIR)/build
> > > > +               $$(NINJA) $$(NINJA_OPTS) $$($$(PKG)_NINJA_OPTS) -C $$($$(PKG)_SRCDIR)/build
> > > shouldn't $$($$(PKG)_NINJA_OPTS) come after $$($$(PKG)_SRCDIR)/build?
> >
> > I don't know. It worked that way for me, and I wanted to group together
> > the two _OPTS variables, and also like we do for the autotools infra. But
> > your suggestion also makes sense, and is indeed more in-line with the
> > ninja's short-help:
> Maybe add a $$($$(PKG)_NINJA_TARGETS) option as well?

Not really, because we want to do the same in all the packages infras.

For example, autotools-package uses FOO_MAKE_OPTS to apss arbitrary
options to make, and that is almost exclusively used to in fact pass the
target rule to make.

So, we want to keep this idiosyncracy consistent acros infras, hence
FOO_NINJA_OPTS, when I agree that it will almost exclusively (or even
exclusively) be used to pass the target rules.

Regards,
Yann E. MORIN.

> >     $ ./output/host/bin/ninja -h
> >     usage: ninja [options] [targets...]
> >     [...]
> >
> > ?ric, your opinion?
> >
> > Regards,
> > Yann E. MORIN.
> >
> > --
> > .-----------------.--------------------.------------------.--------------------.
> > |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
> > | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
> > | +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
> > | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
> > '------------------------------^-------^------------------^--------------------'

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
