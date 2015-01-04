From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 4 Jan 2015 22:33:34 +0100
Subject: [Buildroot] [PATCH v4 04/17] docs/manual: add documentation for
 the pkg-rebar infrastructure
In-Reply-To: <1418135662-773-5-git-send-email-johan.oudinet@gmail.com>
References: <1418135662-773-1-git-send-email-johan.oudinet@gmail.com>
 <1418135662-773-5-git-send-email-johan.oudinet@gmail.com>
Message-ID: <20150104223334.08fc134c@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Johan Oudinet,

On Tue,  9 Dec 2014 15:34:09 +0100, Johan Oudinet wrote:

> +------------------------------
> +01: ################################################################################
> +02: #
> +03: # erlang-foobar
> +04: #
> +05: ################################################################################
> +06:
> +07: ERLANG_FOOBAR_VERSION = 1.0
> +08: ERLANG_FOOBAR_SOURCE = erlang-foobar-$(ERLANG_FOOBAR_VERSION).tar.gz

It might be good to use .tar.xz as the example, because otherwise this
example is bogus: erlang-foobar-$(ERLANG_FOOBAR_VERSION).tar.gz is the
default _SOURCE value, and should not be specified.

> +09: ERLANG_FOOBAR_SITE = http://www.foosoftware.org/download
> +10: ERLANG_FOOBAR_INSTALL_STAGING = YES
> +11: ERLANG_FOOBAR_CONF_OPTS = --enable-bar

Does this make sense for a rebar package that doesn't have
ERLANG_FOOBAR_CONFIGURE = YES ?

> +12: ERLANG_FOOBAR_DEPENDENCIES = host-libaaa libbbb
> +13:
> +14: $(eval $(rebar-package))
> +--------------------------------
> +
> +On line 7, we declare the version of the package.
> +
> +On line 8 and 9, we declare the name of the tarball (xz-ed tarball recommended)
> +and the location of the tarball on the Web. Buildroot will automatically
> +download the tarball from this location.
> +
> +On line 10, we tell Buildroot to install the package to the staging
> +directory. The staging directory, located in +output/staging/+
> +is the directory where all the packages are installed, including their
> +development files, etc. By default, packages are not installed to the
> +staging directory, since usually, only libraries need to be installed in
> +the staging directory: their development files are needed to compile
> +other libraries or applications depending on them.

Does this applies to rebar packages?

> +On line 11, we tell Buildroot to pass a custom configure option, that
> +will be passed to the +./configure+ script before configuring
> +and building the package.

Same question as above: does it make sense for a package that doesn't
pass <pkg>_CONFIGURE = YES ?

> +On line 12, we declare our dependencies, so that they are built
> +before the build process of our package starts.
> +
> +Finally, on line line 14, we invoke the +rebar-package+
> +macro that generates all the Makefile rules that actually allows the
> +package to be built.
> +
> +[[rebar-package-reference]]
> +
> +==== +rebar-package+ reference
> +
> +The main macro of the rebar package infrastructure is
> ++rebar-package+. It is similar to the +generic-package+ macro. The
> +ability to have target and host packages is also available, with the

"The ability to have host packages is also available, with the
+host-rebar-package+ macro", otherwise one could think that
host-rebar-package is also used for target packages.

> ++host-rebar-package+ macro.
> +
> +Just like the generic infrastructure, the rebar infrastructure works
> +by defining a number of variables before calling the +rebar-package+
> +macro.
> +
> +First, all the package metadata information variables that exist in
> +the generic infrastructure also exist in the rebar infrastructure:
> ++ERLANG_FOOBAR_VERSION+, +ERLANG_FOOBAR_SOURCE+,
> ++ERLANG_FOOBAR_PATCH+, +ERLANG_FOOBAR_SITE+,
> ++ERLANG_FOOBAR_SUBDIR+, +ERLANG_FOOBAR_DEPENDENCIES+,
> ++ERLANG_FOOBAR_INSTALL_STAGING+, +ERLANG_FOOBAR_INSTALL_TARGET+.

ERLANG_FOOBAR_LICENSE, ERLANG_FOOBAR_LICENSE_FILES.

Maybe we should refactor the documentation a bit to avoid mentioning
those variables over and over again.

> +Note that the rebar infrastructure does not expect a configure script,
> +but does call such a script when it exists.

What about <pkg>_CONFIGURE = YES ?

>  When a package uses both
> +the Autotools and rebar, it should use the rebar infrastructure.  In
> +this case however, the build commands do not call make, but only
> ++rebar compile+; this avoids triggering the download of dependencies
> +(as most Makefile's do when combined with rebar).  Also, note that the
> +install commands never call +make install+.  Instead, they install
> +Erlang's application directories (ebin, priv, etc.)  into a proper
> +location.  If this is not what you want, add custom hooks or override
> +rebar commands (see below).

What is "a proper location" ? As opposed to what ?

> +A few additional variables, specific to the rebar infrastructure,
> +can also be defined. Many of them are only useful in very specific
> +cases, typical packages will therefore only use a few of them.
> +
> +* +ERLANG_FOOBAR_CONF_ENV+, to specify additional environment
> +  variables to pass to the configure script. By default, empty.

And only useful when <pkg>_CONFIGURE = YES, no?

> +* +ERLANG_FOOBAR_CONF_OPTS+, to specify additional configure options
> +  to pass to the configure script. By default, empty.

Ditto.

> +* +ERLANG_FOOBAR_AUTORECONF+, tells whether the package should be
> +  autoreconfigured or not (i.e. if the configure script and
> +  Makefile.in files should be re-generated by re-running autoconf,
> +  automake, libtool, etc.). Valid values are +YES+ and +NO+. By
> +  default, the value is +NO+

Ditto.

> +
> +* +ERLANG_FOOBAR_AUTORECONF_ENV+, to specify additional environment
> +  variables to pass to the 'autoreconf' program if
> +  +ERLANG_FOOBAR_AUTORECONF=YES+. These are passed in the environment
> +  of the 'autoreconf' command. By default, empty.

Ditto.

> +
> +* +ERLANG_FOOBAR_AUTORECONF_OPTS+ to specify additional options passed
> +  to the 'autoreconf' program if +ERLANG_FOOBAR_AUTORECONF=YES+. By
> +  default, empty.

Ditto.

Maybe we should simply specify that when <pkg>_CONFIGURE = YES is
specified, the normal autotools-package infra is used and that
therefore for the configure step, a given set of variables have the
same meaning as the ones of the autotools-package infra?

> +* +ERLANG_FOOBAR_REBAR_ENV+, to specify additional environment
> +  variables to pass to rebar.  By default, the value sets a minimal
> +  PATH that only includes +HOST_DIR/bin+, +HOST_DIR/usr/bin+, and
> +  +/bin+.

<pkg>_ENV, no? At least that's what patch 03/17 does, but I indeed
suggested to use <pkg>_REBAR_ENV instead.

> +* +ERLANG_FOOBAR_REBAR_FLAGS+, to specify rebar flags. By default, the
> +  value is +deps_dir=ERLANG_FOOBAR_REBAR_DEPS_DIR+.

I don't see this variable used anywhere in PATCH 03/17.

> +* +ERLANG_FOOBAR_REBAR_DEPS_DIR+, to specify where to look for the
> +  package's dependencies.  By default, the value is
> +  +output/build/erlang-rebar-deps/target+, or
> +  +output/build/erlang-rebar-deps/host+ for host packages.  Note that
> +  if the package installs to staging as well, the rebar infrastructure
> +  then creates a symbolic link in this directory to
> +  +ERLANG_FOOBAR_ERLANG_LIBDIR+ so other packages may use it as
> +  a dependency.

Why would one want to override this? Isn't the value always set to:

+REBAR_HOST_DEPS_DIR = $(HOST_DIR)/usr/share/rebar/deps
+REBAR_TARGET_DEPS_DIR = $(STAGING_DIR)/usr/share/rebar/deps

> +* +ERLANG_FOOBAR_ERLANG_LIBDIR+, to specify where to install the
> +  Erlang application.  By default, the value is
> +  +/usr/lib/erlang/lib/ERLANG_FOOBAR_ERLANG_APP-ERLANG_FOOBAR_VERSION+.

Hum, the code does:

+$(2)_ERLANG_LIBDIR = \
+	/usr/lib/erlang/lib/$$($$(PKG)_ERLANG_APP)-$$($$(PKG)_VERSION)

So it doesn't really seem to leave the freedom for the package to
provide its own value, no?

> +
> +* +ERLANG_FOOBAR_ERLANG_APP+, to specify the name of the Erlang
> +  application to be installed.  This modifies where the application is
> +  installed (e.g., +/usr/lib/erlang/lib/ERLANG_FOOBAR_ERLANG_APP-ERLANG_FOOBAR_VERSION+)
> +  and the name of the symbolic link in +ERLANG_FOOBAR_REBAR_DEPS_DIR+,
> +  if any (e.g., +output/build/erlang-rebar-deps/target/ERLANG_FOOBAR_ERLANG_APP+.
> +  By default, the value is the lowercase package name stripped from
> +  any +erlang-+ prefix, and with dashes converted to underscores.

Ditto:

+$(2)_ERLANG_APP = $(subst -,_,$(call LOWERCASE,$(patsubst ERLANG_%,%,$(3))))

> +* +ERLANG_FOOBAR_ENV+, to specify additional environment variables to
> +  pass both to the configure script and rebar.  By default, sets CC,
> +  CFLAGS, LDFLAGS, ERL_COMPILER_OPTIONS, and ERL_EI_LIBDIR.

Ah, so here we document $$(PKG)_ENV, which actually exists in the code.
How is that different from ERLANG_FOOBAR_REBAR_ENV above?

Could you rework this documentation, and send an updated version?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
