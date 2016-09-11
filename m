From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 11 Sep 2016 15:35:23 +0200
Subject: [Buildroot] [PATCHv6] core: don't build host-cmake if it is
 available on the build host
In-Reply-To: <5d7b90ec-5dcf-f61b-166d-7dddc2436c79@mind.be>
References: <1473201140-28745-1-git-send-email-yann.morin.1998@free.fr>
 <5d7b90ec-5dcf-f61b-166d-7dddc2436c79@mind.be>
Message-ID: <20160911133523.GK5740@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

On 2016-09-10 00:26 +0200, Arnout Vandecappelle spake thusly:
> On 07-09-16 00:32, Yann E. MORIN wrote:
> > From: Luca Ceresoli <luca@lucaceresoli.net>
> > 
> > Currently all cmake packages depend on host-cmake. Unfortunately
> > host-cmake takes a long time to configure and build: almost 7 minutes
> > on a dual-core i5 with SSD. The time does not change even with ccache
> > enabled.
[--SNIP--]
> > diff --git a/package/pkg-cmake.mk b/package/pkg-cmake.mk
> > index 4c6dc62..759b3e6 100644
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
> 
>  This would be perfect to do with a script instead - no make support is needed,
> except for passing $(@D) $($(PKG)_NAME) and BR2_CMAKE_MIN_VERSION.
> 
> > +	$(Q)v=$$( grep -hr -i 'cmake_minimum_required.*version' $(@D) \
> 
>  Shouldn't we search just in CMakeLists.txt files? Do you think it's likely that
> a package declares the minimum required version in and included file? That said,
> the extra time spent on grepping through everything doesn't amount to much
> unless it's a large package, and in that case it's anyway going to be dominated
> by package build time.

Well, grepping in a source tree that has been freshly extracted (i.e. it
would be cache-hot) would not be very costly...

> > +		|tr '[:upper:]' '[:lower:]' \
> > +		|sed -r -e '/.*\(version ([[:digit:]]+\.[[:digit:]]+).+/!d; s//\1/' \
> 
>  Not exactly an easy to understand sed script...

I must be very weird, then, as I can read it pretty easily:
  - any number of any character,
  - followed by an opening paranthesis,
  - followed by the literal string 'version' and then a space,
  - start a matching group
    - followed by one or more digits,
    - followed by a literal dot
    - followed by one or more digits,
  - end the matching group
  - followed by one or more of any character (implied: up to the end of
    the line),
  - delete lines that don't match the above,
  - on a line that matches, replace it with the matching group.

;-)

> > +		|sort -t. -k 1,1nr -k2,2nr \
> 
>  Since you're anyway doing the version sort here already, you could just add
> $(BR2_CMAKE_MIN_VERSION_MAJOR).$(BR2_CMAKE_MIN_VERSION_MINOR) into the mix and
> verify that the first line is equal to
> $(BR2_CMAKE_MIN_VERSION_MAJOR).$(BR2_CMAKE_MIN_VERSION_MINOR)

orry, I'm not sure I understand what you meant. Something like:

    (echo 3.1; grep blabla) |blabla

and then check that we get 3.1, right?

> We already use that trick for checking the make version, for instance.

I've looked at support/dependencies/dependencies.sh and we're not using
that "trick" to check the make version;

   85 MAKE_MAJOR=$(echo $MAKE_VERSION | sed -e "s/\..*//g")
   86 MAKE_MINOR=$(echo $MAKE_VERSION | sed -e "s/^$MAKE_MAJOR\.//g" -e "s/\..*//g" -e "s/[a-zA-Z].*//g")
   87 if [ $MAKE_MAJOR -lt 3 ] || [ $MAKE_MAJOR -eq 3 -a $MAKE_MINOR -lt 81 ] ; then
   88 ?   echo
   89 ?   echo "You have make '$MAKE_VERSION' installed.  GNU make >=3.81 is required"
   90 ?   exit 1;
   91 fi;

> > +	else \
> > +		printf "*** Error: incorrect minimum cmake version:\n"; \
> > +		printf "*** Error: Buildroot requires %s.%s\n" \
> > +			$(BR2_CMAKE_MIN_VERSION_MAJOR) $(BR2_CMAKE_MIN_VERSION_MINOR); \
> > +		printf "*** Error: %s needs at least %s.%s\n" \
> > +			$($(PKG)_NAME) $${MAJOR} $${minor}; \
> 
>  I don't think this error message is very clear. How about:
> 
> *** Error: package %s needs cmake version %s.%s\n
> ***        Buildroot's minimum version BR2_CMAKE_MIN_VERSION\n
> ***        should be set to at least that version. Currently\n
> ***        it is set to %s.\n

If you want...

[--SNIP--]
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
> > +#
> > +# Set this to either 3.0 or higher, depending on the highest minimum
> > +# version required by any of the packages bundled in Buildroot. If a
> > +# package is bumped or a new one added, and it requires a higher
> > +# version, our cmake infra will catch it and whine.
> > +#
> > +BR2_CMAKE_MIN_VERSION_MAJOR = 3
> > +BR2_CMAKE_MIN_VERSION_MINOR = 1
> 
>  It's just a personal preference, but I'd rather see a single
> BR2_CMAKE_MIN_VERSION = 3.1, and where you need the major or minor use ${v%.*}.

OK...

> > +BR2_CMAKE ?= cmake
> > +ifeq ($(call suitable-host-package,cmake,\
> > +	$(BR2_CMAKE) $(BR2_CMAKE_MIN_VERSION_MAJOR) $(BR2_CMAKE_MIN_VERSION_MINOR)),)
> > +BR2_CMAKE = $(HOST_DIR)/usr/bin/cmake
> > +BR2_CMAKE_HOST_DEPENDENCY = host-cmake
> > +endif
> > diff --git a/support/dependencies/check-host-cmake.sh b/support/dependencies/check-host-cmake.sh
> > new file mode 100755
> > index 0000000..4951a05
> > --- /dev/null
> > +++ b/support/dependencies/check-host-cmake.sh
> > @@ -0,0 +1,26 @@
> > +#!/bin/sh
> > +
> > +candidate="${1}"
> > +major_min="${2}"
> > +minor_min="${3}"
> > +
> > +cmake=`which ${candidate}`
> > +if [ ! -x "${cmake}" ]; then
> > +	# echo nothing: no suitable cmake found
> > +	exit 1
> > +fi
> > +
> > +version=`${cmake} --version | head -n1 | cut -d\  -f3`
> 
>  Again minor nit, but I think -d' ' is easier to understand than -d\ .

OK...

> > +major=`echo "${version}" | cut -d. -f1`
> > +minor=`echo "${version}" | cut -d. -f2`
> 
>  I know this is just copy-paste from the other scripts, but ${version%.*} really
> is better.

Yep, I missed changing it...

Thanks!

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
