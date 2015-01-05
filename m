From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 5 Jan 2015 22:59:56 +0100
Subject: [Buildroot] [PATCH v4 03/17] package/pkg-rebar: new
 infrastructure
In-Reply-To: <20150105103116.74bbc777@free-electrons.com>
References: <1418135662-773-1-git-send-email-johan.oudinet@gmail.com>
 <1418135662-773-4-git-send-email-johan.oudinet@gmail.com>
 <20150104222307.009f6e73@free-electrons.com>
 <20150104222038.GD31970@free.fr>
 <20150105103116.74bbc777@free-electrons.com>
Message-ID: <20150105215956.GC5077@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2015-01-05 10:31 +0100, Thomas Petazzoni spake thusly:
> On Sun, 4 Jan 2015 23:20:38 +0100, Yann E. MORIN wrote:
[--SNIP--]
> > Some packages bundle their own rebar, other do not.
> > 
> > Of the former, some may really require we use their bundled rebar
> > instead f the one we provide. _HAS_REBAR is for those packages.
> > 
> > But maybe it is not really properly named. It's meaning is: this package
> > has a bundled rebar, and does not work with the system rebar, so must
> > use its own bnundled version.
> > 
> > But the appreciated meaning of the variable name is just: this package
> > has a rebar utility. It does not state that the rebar infra shall use
> > it. I'll try to come up with a better name.
> 
> $(2)_USE_BUNDLED_REBAR, default to NO, and overridden by YES for those
> packages that should really use their rebar rather than the system one.
> 
> or:
> 
> $(2)_USE_SYSTEM_REBAR, default to YES, and overridden to NO for those
> packages that should really use their rebar rather than the system one.

I have already gone for _USE_BUNDLED_REBAR in the series I pushed to
Johan, although I had pondered the alternative you also suggested.

Great minds think alike! Hehe! :-)

> > > > +# Define the build and install commands
> > > > +#
> > > > +ifeq ($(4),target)
> > > > +
> > > > +ifeq ($$($(2)_CONFIGURE),YES)
> > > 
> > > What is $(2)_CONFIGURE exactly? It is not documented in PATCH 04/17.
> > 
> > Some rebar packages use autotools for the configure step, and use rebar
> > for the build step. Worse, some of them even require being autoreconf-ed.
> > 
> > This variable, if set to YES, means that this package will use the
> > autotools-package infrastrucutre; otherwise, it will be trated as a
> > generic-package.
> 
> Not sure of a better name for this one. Maybe $(2)_USE_AUTOTOOLS,
> defaults to no, can be overridden to YES by the packages having a
> configure script? Do they both autoconf and automake, or just autoconf?
> I guess the latter, so maybe $(2)_USE_AUTOCONF.

Alternatively, I was even thinking of an even more generic solution,
$(2)_PACKAGE_TYPE , which would be set to the underlying type of
packages.

In the end, I did not implement that because it is too much overkill.
Also, I kept _CONFIGURE because it is what people do expect: the package
needs to be configured before being built. But I am not completely
opposed to changing the variable name. _USE_AUTOTOOLS or _USE_AUTOCONF
is equally fit, I guess (although I'd still prefer _AUTOTOOLS, because
it matches the fact that we call back to the autotools infrastructure
underneath.

Johan, are there Erlang packages that use something other than
autotools?

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
