From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 7 Sep 2016 00:07:53 +0200
Subject: [Buildroot] [PATCHv5] core: don't build host-cmake if it is
 available on the build host
In-Reply-To: <70371343-393e-0922-3eb7-7846cac03a84@lucaceresoli.net>
References: <1473090116-9851-1-git-send-email-yann.morin.1998@free.fr>
 <70371343-393e-0922-3eb7-7846cac03a84@lucaceresoli.net>
Message-ID: <20160906220753.GE12105@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Luca, All,

On 2016-09-06 23:25 +0200, Luca Ceresoli spake thusly:
> On 05/09/2016 17:41, Yann E. MORIN wrote:
> > From: Luca Ceresoli <luca@lucaceresoli.net>
[--SNIP--]
> > First, we leverage the existing infrastructure in
> > support/dependencies/dependencies.mk to find out whether there's a
> > suitable cmake executable on the system. Its path can be passed in the
> > BR2_CMAKE environment variable, otherwise it defaults to "cmake". If
> > it is enabled, found and suitable then we set
> > USE_SYSTEM_CMAKE. Otherwise we override BR2_CMAKE with
> > "$(HOST_DIR)/usr/bin/cmake" to revert to the old behaviour.
> 
> You dropped USE_SYSTEM_CMAKE from the implementation, but didn't update
> the commit message.

I seem to have quite a few issues rewriting the commit log, recently...
I'll fix.

[--SNIP--]
> > Tested on:
> >  - Ubuntu 14.04 without CMake, with official CMake (2.8), PPA CMake
> >    (3.2)
> >  - Ubuntu 15.10 without CMake, with official CMake (3.2)
> >  - Ubuntu 16.04 without CMake, with official CMake (3.5)
> 
> It this still true? I mean, did you test the new implementation on all
> those distros?

No I did not. I kept them as your tests. Probably I can move them below
the --- line as part of your tests..

> > [0] https://cmake.org/gitweb?p=cmake.git;h=e8b8b37ef6fef094940d3384df5a1d421b9fa568
> > 
> > Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
> > Cc: Samuel Martin <s.martin49@gmail.com>
> > Cc: Davide Viti <zinosat@tiscali.it>
> > Cc: Arnout Vandecappelle <arnout@mind.be>
> > Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> > Reviewed-by: Romain Naour <romain.naour@gmail.com>
> > Tested-by: Romain Naour <romain.naour@gmail.com>
> 
> I think at least the "Tested-by" should be removed when making any code
> change...

Well, I pondered removing it. But since my own tags are below, and that
I state that I did change stuff, I thought I'd keep it as traceability
(i.e. if what Romain tested is now broken, it's my fault).

> > [yann.morin.1998 at free.fr:
> >   - simplify logic in check-host-cmake.mk;
> >   - set and use BR2_CMAKE_HOST_DEPENDENCY, drop USE_SYSTEM_CMAKE;
> >   - bump to cmake 3.1 for grantlee and opencv;
> >   - add the post-patch hook; exclude target cmake from the check.
> > ]
> > Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
[--SNIP--]
> > diff --git a/package/pkg-cmake.mk b/package/pkg-cmake.mk
> > index 4c6dc62..5cb2b52 100644
> > --- a/package/pkg-cmake.mk
> > +++ b/package/pkg-cmake.mk
> > @@ -35,6 +35,38 @@ ifneq ($(QUIET),)
> >  CMAKE_QUIET = -DCMAKE_RULE_MESSAGES=OFF -DCMAKE_INSTALL_MESSAGE=NEVER
> >  endif
> >  
> > +#
> > +# Check the package does not require a cmake version more recent than we do.
> > +#
> > +# Some packages may use a variable to set the minimum required version. In
> > +# this case, there is not much we can do, so we just accept it; the configure
> > +# would fail later anyway in this case.
> > +#
> > +define CMAKE_CHECK_MIN_VERSION
> > +	$(Q)v=$$( grep -hr -i 'cmake_minimum_required.*version' $(@D) \
> > +		|tr '[:upper:]' '[:lower:]' \
> > +		|sed -r -e '/.*\(version ([[:digit:]]+\.[[:digit:]]+).+/!d; s//\1/' \
> > +		|sort -t. -k 1,1nr -k2,2nr \
> > +		|head -n 1 \
> > +	 ); \
> > +	M=$${v%.*}; m=$${v#*.}; \
> > +	if [ -z "$${v}" ]; then \
> > +		: Unknown, not much we can do, OK; \
> > +	elif [ $(BR2_CMAKE_MIN_VERSION_MAJOR) -gt $${M} ]; then \
> > +		: OK; \
> > +	elif [    $(BR2_CMAKE_MIN_VERSION_MAJOR) -eq $${M} \
> > +	       -a $(BR2_CMAKE_MIN_VERSION_MINOR) -ge $${m} ]; then \
> > +		: OK; \
> > +	else \
> > +		printf "*** Error: incorrect minimum cmake version:\n"; \
> > +		printf "*** Error: Buildroot requires %s.%s\n" \
> > +			$(BR2_CMAKE_MIN_VERSION_MAJOR) $(BR2_CMAKE_MIN_VERSION_MINOR); \
> > +		printf "*** Error: %s needs at least %s.%s\n" \
> > +			$($(PKG)_NAME) $${M} $${m}; \
> > +		exit 1; \
> > +	fi
> > +endef
> 
> As discussed on IRC, I don't like very much this code snippet. It's not
> that unreadable, but not even that readable... But it profides a useful
> feature for the casual packager, and I have no better alternative, so
> I'd leave it there.

Not only for a casual packager, but for all of us who bump an existing
cmake-based package.

> On one hand we probably should have a utility function to compare
> version strings somewhere (Makefile?), and use that also in
> check-host-cmake.mk. But I'm not sure it's worth the effort now, since
> AFAIK we have no other uses for such a utility function. Moving the
> check to a script would be annoying on its own, so for the moment I'd
> accept this solution. Only, "M" and "m" could be renamed to something
> more verbose, e.g. "major" and "minor".

Well, 'M' and 'm' are local variables, whose scope is really limited.
And since we're checking a version string, it seemed obvious they would
stand for 'M'ajor and 'm'inor. And initially, the lines were much
longer, so short names were more fitting. But I can change, indeed.

> > @@ -71,6 +103,13 @@ else
> >  $(2)_BUILDDIR			= $$($(2)_SRCDIR)/buildroot-build
> >  endif
> >  
> > +# Special exception for cmake, which requires cmake up to 3.4, but
> > +# only to run its tests; all other equirements are on at most 3.0.
> > +# Just skip the version check for cmake, and only for cmake.
> > +ifneq ($(1),cmake)
> > +$(2)_POST_PATCH_HOOKS += CMAKE_CHECK_MIN_VERSION
> > +endif
> > +
> >  #
> >  # Configure step. Only define it if not already defined by the package
> >  # .mk file. And take care of the differences between host and target
> > @@ -85,7 +124,7 @@ define $(2)_CONFIGURE_CMDS
> >  	cd $$($$(PKG)_BUILDDIR) && \
> >  	rm -f CMakeCache.txt && \
> >  	PATH=$$(BR_PATH) \
> > -	$$($$(PKG)_CONF_ENV) $$(HOST_DIR)/usr/bin/cmake $$($$(PKG)_SRCDIR) \
> > +	$$($$(PKG)_CONF_ENV) $$(BR2_CMAKE) $$($$(PKG)_SRCDIR) \
> >  		-DCMAKE_TOOLCHAIN_FILE="$$(HOST_DIR)/usr/share/buildroot/toolchainfile.cmake" \
> >  		-DCMAKE_BUILD_TYPE=$$(if $$(BR2_ENABLE_DEBUG),RelWithDebInfo,Release) \
> >  		-DCMAKE_INSTALL_PREFIX="/usr" \
> > @@ -110,7 +149,7 @@ define $(2)_CONFIGURE_CMDS
> >  	cd $$($$(PKG)_BUILDDIR) && \
> >  	rm -f CMakeCache.txt && \
> >  	PATH=$$(BR_PATH) \
> > -	$$(HOST_DIR)/usr/bin/cmake $$($$(PKG)_SRCDIR) \
> > +	$$(BR2_CMAKE) $$($$(PKG)_SRCDIR) \
> >  		-DCMAKE_INSTALL_SO_NO_EXE=0 \
> >  		-DCMAKE_FIND_ROOT_PATH="$$(HOST_DIR)" \
> >  		-DCMAKE_FIND_ROOT_PATH_MODE_PROGRAM="BOTH" \
> > @@ -146,7 +185,7 @@ endif
> >  # primitives to find {C,LD}FLAGS, add it to the dependency list.
> >  $(2)_DEPENDENCIES += host-pkgconf
> >  
> > -$(2)_DEPENDENCIES += host-cmake
> > +$(2)_DEPENDENCIES += $(BR2_CMAKE_HOST_DEPENDENCY)
> >  
> >  #
> >  # Build step. Only define it if not already defined by the package .mk
> > diff --git a/support/dependencies/check-host-cmake.mk b/support/dependencies/check-host-cmake.mk
> > new file mode 100644
> > index 0000000..8680ec9
> > --- /dev/null
> > +++ b/support/dependencies/check-host-cmake.mk
> > @@ -0,0 +1,19 @@
> > +# Versions before 3.0 are affected by the bug described in
> > +# https://git.busybox.net/buildroot/commit/?id=ef2c1970e4bff3be3992014070392b0e6bc28bd2
> > +# and fixed in upstream CMake in version 3.0:
> > +# https://cmake.org/gitweb?p=cmake.git;h=e8b8b37ef6fef094940d3384df5a1d421b9fa568
> 
> I wonder whether we still need this comment, since we require >= 3.1
> now. I'd just leave it in the commit message, for the records.

Well... 3.0 is a strict requirements. Say tomorrow we update all our
cmake based packages and they siddenly only require 2.x [0] and someone
is smart enough to notice, owers our minimum version to that version,
and builds on a host with a 2.x cmake which is deemed to be enough.

Boom, the build would break, because the we do *really* require 3.x
internally for Buildroot.

[0] not impossible. For example, say an upstream decides to support
building on older distros, so they "fix" their CMakeList.txt to require
a lower version of cmake.

> > +#
> > +# Set this to either 3.0 or higher, depending on the highest minimum
> > +# version required by any of the packages bundled in Buildroot. If a
> > +# package is bumped or a new one added, and it requires a higher
> > +# version, our cmake infra will catch it and whine.
> > +#
> > +BR2_CMAKE_MIN_VERSION_MAJOR = 3
> > +BR2_CMAKE_MIN_VERSION_MINOR = 1
> > +
> > +BR2_CMAKE ?= cmake
> > +ifeq ($(call suitable-host-package,cmake,\
> > +	$(BR2_CMAKE) $(BR2_CMAKE_MIN_VERSION_MAJOR) $(BR2_CMAKE_MIN_VERSION_MINOR)),)
> > +BR2_CMAKE = $(HOST_DIR)/usr/bin/cmake
> > +BR2_CMAKE_HOST_DEPENDENCY = host-cmake
> > +endif
> 
> I like how you refactored the ifeq/else condition in a more linear way.

We already have a condition here, no need to add the same one in
pkg-cmake. ;-)

> I'm ok with the rest. If you could respin with these changes, I'd be
> glad to add my Reviewed-by tag.

Sure, will do.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
