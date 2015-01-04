From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 5 Jan 2015 00:27:30 +0100
Subject: [Buildroot] [PATCH v4 04/17] docs/manual: add documentation for
 the pkg-rebar infrastructure
In-Reply-To: <20150104223334.08fc134c@free-electrons.com>
References: <1418135662-773-1-git-send-email-johan.oudinet@gmail.com>
 <1418135662-773-5-git-send-email-johan.oudinet@gmail.com>
 <20150104223334.08fc134c@free-electrons.com>
Message-ID: <20150104232730.GE31970@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, Johan, All,

[Elided comments are being dealt with without further ado.]

On 2015-01-04 22:33 +0100, Thomas Petazzoni spake thusly:
> On Tue,  9 Dec 2014 15:34:09 +0100, Johan Oudinet wrote:
[--SNIP--]
> > +On line 10, we tell Buildroot to install the package to the staging
> > +directory. The staging directory, located in +output/staging/+
> > +is the directory where all the packages are installed, including their
> > +development files, etc. By default, packages are not installed to the
> > +staging directory, since usually, only libraries need to be installed in
> > +the staging directory: their development files are needed to compile
> > +other libraries or applications depending on them.
> 
> Does this applies to rebar packages?

It would seem it does not, since they are interpreted packages, the
dependencies would always be in target/

Johan, care to expand/fix the exaplanations, please? ;-)

[--SNIP--]
> > +First, all the package metadata information variables that exist in
> > +the generic infrastructure also exist in the rebar infrastructure:
> > ++ERLANG_FOOBAR_VERSION+, +ERLANG_FOOBAR_SOURCE+,
> > ++ERLANG_FOOBAR_PATCH+, +ERLANG_FOOBAR_SITE+,
> > ++ERLANG_FOOBAR_SUBDIR+, +ERLANG_FOOBAR_DEPENDENCIES+,
> > ++ERLANG_FOOBAR_INSTALL_STAGING+, +ERLANG_FOOBAR_INSTALL_TARGET+.
> 
> ERLANG_FOOBAR_LICENSE, ERLANG_FOOBAR_LICENSE_FILES.
> 
> Maybe we should refactor the documentation a bit to avoid mentioning
> those variables over and over again.

I've just written that to my TODO list. It seems it can only grow... ;-)

> > +Note that the rebar infrastructure does not expect a configure script,
> > +but does call such a script when it exists.
> 
> What about <pkg>_CONFIGURE = YES ?

I've rewritten that section quite a bit to make this much more explicit.

> >  When a package uses both
> > +the Autotools and rebar, it should use the rebar infrastructure.  In
> > +this case however, the build commands do not call make, but only
> > ++rebar compile+; this avoids triggering the download of dependencies
> > +(as most Makefile's do when combined with rebar).  Also, note that the
> > +install commands never call +make install+.  Instead, they install
> > +Erlang's application directories (ebin, priv, etc.)  into a proper
> > +location.  If this is not what you want, add custom hooks or override
> > +rebar commands (see below).
> 
> What is "a proper location" ? As opposed to what ?

I was thinking of just gettin rid of the implementation details. The
details are available in pkg-rebar.mk.

> > +* +ERLANG_FOOBAR_REBAR_ENV+, to specify additional environment
> > +  variables to pass to rebar.  By default, the value sets a minimal
> > +  PATH that only includes +HOST_DIR/bin+, +HOST_DIR/usr/bin+, and
> > +  +/bin+.
> 
> <pkg>_ENV, no? At least that's what patch 03/17 does, but I indeed
> suggested to use <pkg>_REBAR_ENV instead.

Switched to using <pkg>_REBAR_ENV as you suggested in your review of the
infra itself.

> > +* +ERLANG_FOOBAR_REBAR_FLAGS+, to specify rebar flags. By default, the
> > +  value is +deps_dir=ERLANG_FOOBAR_REBAR_DEPS_DIR+.
> 
> I don't see this variable used anywhere in PATCH 03/17.

Inded, it is not used, and none of the following packages sets it.

I'll just drop that one, unless Johan has a use-case for it?

> > +* +ERLANG_FOOBAR_REBAR_DEPS_DIR+, to specify where to look for the
> > +  package's dependencies.  By default, the value is
> > +  +output/build/erlang-rebar-deps/target+, or
> > +  +output/build/erlang-rebar-deps/host+ for host packages.  Note that
> > +  if the package installs to staging as well, the rebar infrastructure
> > +  then creates a symbolic link in this directory to
> > +  +ERLANG_FOOBAR_ERLANG_LIBDIR+ so other packages may use it as
> > +  a dependency.
> 
> Why would one want to override this? Isn't the value always set to:
> 
> +REBAR_HOST_DEPS_DIR = $(HOST_DIR)/usr/share/rebar/deps
> +REBAR_TARGET_DEPS_DIR = $(STAGING_DIR)/usr/share/rebar/deps

Moreover, nothing references $(2)_REBAR_DEPS_DIR at all.

Johan, did we miss anything?

> > +* +ERLANG_FOOBAR_ERLANG_LIBDIR+, to specify where to install the
> > +  Erlang application.  By default, the value is
> > +  +/usr/lib/erlang/lib/ERLANG_FOOBAR_ERLANG_APP-ERLANG_FOOBAR_VERSION+.
> 
> Hum, the code does:
> 
> +$(2)_ERLANG_LIBDIR = \
> +	/usr/lib/erlang/lib/$$($$(PKG)_ERLANG_APP)-$$($$(PKG)_VERSION)
> 
> So it doesn't really seem to leave the freedom for the package to
> provide its own value, no?

I gues not. We really want all packages to behave the same and install
all their files in a similar fashion.

I'll drop this variable, inless Johan has a good reason to keep it.

> > +* +ERLANG_FOOBAR_ENV+, to specify additional environment variables to
> > +  pass both to the configure script and rebar.  By default, sets CC,
> > +  CFLAGS, LDFLAGS, ERL_COMPILER_OPTIONS, and ERL_EI_LIBDIR.
> 
> Ah, so here we document $$(PKG)_ENV, which actually exists in the code.
> How is that different from ERLANG_FOOBAR_REBAR_ENV above?

Ah...

OK, I'll rework whatever I can, for Johan to grab.

Thank you!

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
