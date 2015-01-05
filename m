From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 5 Jan 2015 10:31:16 +0100
Subject: [Buildroot] [PATCH v4 03/17] package/pkg-rebar: new
 infrastructure
In-Reply-To: <20150104222038.GD31970@free.fr>
References: <1418135662-773-1-git-send-email-johan.oudinet@gmail.com>
 <1418135662-773-4-git-send-email-johan.oudinet@gmail.com>
 <20150104222307.009f6e73@free-electrons.com>
 <20150104222038.GD31970@free.fr>
Message-ID: <20150105103116.74bbc777@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello!

On Sun, 4 Jan 2015 23:20:38 +0100, Yann E. MORIN wrote:

> > Would it be clearer to actually use $(1) ?
> > 
> > $(2)_ERLANG_APP = $(subst -,_,$(patsubst erlang-%,%,$(patsubst host-%,%,$(1))
> > 
> > Not sure that's really better.
> 
> Yet, it is better to deal with the original values, rather than to try
> to retro-engineer them. I'll check your proposal, and use it.

Well, it's a matter of taste really because both expressions are
equally "complicated". So using $(1) as I propose, or $(3) as was in
the patch doesn't make much difference. Maybe only the switch back and
forth between - and _ is a bit weird when using $(3).

> > It's not clear what $(2)_HAS_REBAR is useful for, and this variable is
> > not documented in PATCH 04/17.
> 
> Some packages bundle their own rebar, other do not.
> 
> Of the former, some may really require we use their bundled rebar
> instead f the one we provide. _HAS_REBAR is for those packages.
> 
> But maybe it is not really properly named. It's meaning is: this package
> has a bundled rebar, and does not work with the system rebar, so must
> use its own bnundled version.
> 
> But the appreciated meaning of the variable name is just: this package
> has a rebar utility. It does not state that the rebar infra shall use
> it. I'll try to come up with a better name.

$(2)_USE_BUNDLED_REBAR, default to NO, and overridden by YES for those
packages that should really use their rebar rather than the system one.

or:

$(2)_USE_SYSTEM_REBAR, default to YES, and overridden to NO for those
packages that should really use their rebar rather than the system one.

> > > +# Define the build and install commands
> > > +#
> > > +ifeq ($(4),target)
> > > +
> > > +ifeq ($$($(2)_CONFIGURE),YES)
> > 
> > What is $(2)_CONFIGURE exactly? It is not documented in PATCH 04/17.
> 
> Some rebar packages use autotools for the configure step, and use rebar
> for the build step. Worse, some of them even require being autoreconf-ed.
> 
> This variable, if set to YES, means that this package will use the
> autotools-package infrastrucutre; otherwise, it will be trated as a
> generic-package.

Not sure of a better name for this one. Maybe $(2)_USE_AUTOTOOLS,
defaults to no, can be overridden to YES by the packages having a
configure script? Do they both autoconf and automake, or just autoconf?
I guess the latter, so maybe $(2)_USE_AUTOCONF.

> > Wow, this is funky :-) A package infra that inherits from either one
> > infra or the other! And two-level inheritance in the case of
> > generic-package -> autotools-package -> rebar-package.
> 
> So, are you not too horrified by this? Shall we keep it, or do you want
> we copme up with an alternate solution?

No, I'm not horrified by this at all. It's smart, and elegantly re-uses
the existing infrastructures. It's perfectly fine for me.

> I'm doing a sanitising pass with your comments, now. I'll push that to
> my branch so Johan can grab it (I'll poke here when I did the push).

Great, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
