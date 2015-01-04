From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 4 Jan 2015 23:20:38 +0100
Subject: [Buildroot] [PATCH v4 03/17] package/pkg-rebar: new
 infrastructure
In-Reply-To: <20150104222307.009f6e73@free-electrons.com>
References: <1418135662-773-1-git-send-email-johan.oudinet@gmail.com>
 <1418135662-773-4-git-send-email-johan.oudinet@gmail.com>
 <20150104222307.009f6e73@free-electrons.com>
Message-ID: <20150104222038.GD31970@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, Johan, All,

[comments ellided are being dealt with]

On 2015-01-04 22:23 +0100, Thomas Petazzoni spake thusly:
> On Tue,  9 Dec 2014 15:34:08 +0100, Johan Oudinet wrote:
> > diff --git a/package/pkg-rebar.mk b/package/pkg-rebar.mk
> > new file mode 100644
> > index 0000000..c9b15c0
> > --- /dev/null
> > +++ b/package/pkg-rebar.mk
[--SNIP--]
> > +################################################################################
> > +# inner-rebar-package -- defines how the configuration, compilation
> > +# and installation of a rebar package should be done, implements a few
> > +# hooks to tune the build process according to rebar specifities, and
> > +# calls the generic package infrastructure to generate the necessary
> > +# make targets.
> > +#
> > +#  argument 1 is the lowercase package name
> > +#  argument 2 is the uppercase package name, including a HOST_ prefix
> > +#             for host packages
> > +#  argument 3 is the uppercase package name, without the HOST_ prefix
> > +#             for host packages
> > +#  argument 4 is the type (target or host)
> > +#
> > +################################################################################
> > +
> > +define inner-rebar-package
> > +
> > +# Extract just the raw package name, lowercase without the leading
> > +# erlang- or host- prefix, as this is used by rebar to find the
> > +# dependencies a package specifies.
> > +#
> > +$(2)_ERLANG_APP = $(subst -,_,$(call LOWERCASE,$(patsubst ERLANG_%,%,$(3))))
> 
> I think the comment doesn't line up any more with what is done exactly:
> we're working on the uppercase version, which never has HOST_, and
> doesn't have erlang- but ERLANG_. Too bad that LOWERCASE replaces _ by
> -, and that then you have replace again - by _.
> 
> Would it be clearer to actually use $(1) ?
> 
> $(2)_ERLANG_APP = $(subst -,_,$(patsubst erlang-%,%,$(patsubst host-%,%,$(1))
> 
> Not sure that's really better.

Yet, it is better to deal with the original values, rather than to try
to retro-engineer them. I'll check your proposal, and use it.

> > +# Path where to store the package's libs, relative to either $(HOST_DIR)
> > +# for host packages, or $(STAGING_DIR) for target packages.
> > +#
> > +$(2)_ERLANG_LIBDIR = \
> > +	/usr/lib/erlang/lib/$$($$(PKG)_ERLANG_APP)-$$($$(PKG)_VERSION)
> > +
> > +# Whether to use the generic rebar or the package's rebar
> > +#
> > +ifeq ($$($(2)_HAS_REBAR),YES)
> > +$(2)_REBAR = ./rebar
> > +else
> > +$(2)_REBAR = rebar
> > +endif
> 
> It's not clear what $(2)_HAS_REBAR is useful for, and this variable is
> not documented in PATCH 04/17.

Some packages bundle their own rebar, other do not.

Of the former, some may really require we use their bundled rebar
instead f the one we provide. _HAS_REBAR is for those packages.

But maybe it is not really properly named. It's meaning is: this package
has a bundled rebar, and does not work with the system rebar, so must
use its own bnundled version.

But the appreciated meaning of the variable name is just: this package
has a rebar utility. It does not state that the rebar infra shall use
it. I'll try to come up with a better name.

> > +# Define the build and install commands
> > +#
> > +ifeq ($(4),target)
> > +
> > +ifeq ($$($(2)_CONFIGURE),YES)
> 
> What is $(2)_CONFIGURE exactly? It is not documented in PATCH 04/17.

Some rebar packages use autotools for the configure step, and use rebar
for the build step. Worse, some of them even require being autoreconf-ed.

This variable, if set to YES, means that this package will use the
autotools-package infrastrucutre; otherwise, it will be trated as a
generic-package.

Fortunately, I could not see an Erlang package that uses CMake or
setuptoolsi or distutils... :-)

[--SNIP--]
> > +# The package sub-infra to use
> > +#
> > +ifeq ($$($(2)_CONFIGURE),YES)
> > +$(call inner-autotools-package,$(1),$(2),$(3),$(4))
> > +else
> > +$(call inner-generic-package,$(1),$(2),$(3),$(4))
> > +endif
> 
> Wow, this is funky :-) A package infra that inherits from either one
> infra or the other! And two-level inheritance in the case of
> generic-package -> autotools-package -> rebar-package.

So, are you not too horrified by this? Shall we keep it, or do you want
we copme up with an alternate solution?

> All in all, despite the minor questions/comments above, it looks pretty
> good. Care to work to resolve those issues and post an updated version?

I'm doing a sanitising pass with your comments, now. I'll push that to
my branch so Johan can grab it (I'll poke here when I did the push).

Thanks for the reviews! :-)

/me can't wait to have a Jabber daemin in Buildroot... :-]

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
