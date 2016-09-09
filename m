From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 10 Sep 2016 00:26:51 +0200
Subject: [Buildroot] [PATCHv6] core: don't build host-cmake if it is
 available on the build host
In-Reply-To: <1473201140-28745-1-git-send-email-yann.morin.1998@free.fr>
References: <1473201140-28745-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <5d7b90ec-5dcf-f61b-166d-7dddc2436c79@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 07-09-16 00:32, Yann E. MORIN wrote:
> From: Luca Ceresoli <luca@lucaceresoli.net>
> 
> Currently all cmake packages depend on host-cmake. Unfortunately
> host-cmake takes a long time to configure and build: almost 7 minutes
> on a dual-core i5 with SSD. The time does not change even with ccache
> enabled.
> 
> Indeed, building host-cmake is avoidable if it is already installed on
> the build host: CMake is supposed to be quite portable, and the only
> patch in Buildroot for the CMake package seems to only affect
> target-cmake.
> 
> Thus we automatically skip building host-cmake and use the one on the
> system if:
>  - cmake is available on the system and
>  - it is recent enough.
> 
> First, we leverage the existing infrastructure in
> support/dependencies/dependencies.mk to find out whether there's a
> suitable cmake executable on the system. Its path can be passed in the
> BR2_CMAKE environment variable, otherwise it defaults to "cmake". If
> it is enabled, found and suitable then we set BR2_CMAKE_HOST_DEPENDENCY
> to empty; otherwise we set BR2_CMAKE_HOST_DEPENDENCY to 'host-cmake' and
> override BR2_CMAKE with "$(HOST_DIR)/usr/bin/cmake" to revert to using
> our own cmake (the old behaviour).
> 
> Then in pkg-cmake.mk we replace the hard-coded dependency on host-cmake
> to using the BR2_CMAKE_HOST_DEPENDENCY variable, and we use $(BR2_CMAKE)
> instead of $(HOST_DIR)/usr/bin/cmake.
> 
> Unlike what we do for host-tar and host-xzcat, for host-cmake we do
> not add host-cmake to DEPENDENCIES_HOST_PREREQ. If we did, host-cmake
> would be a dependency for _any_ package when it's not installed on the
> host, even when no cmake package is selected.
> 
> Cmake versions older than 3.0 are affected by the bug described and
> fixed in Buildroot in ef2c1970e4bf ("cmake: add patch to fix Qt mkspecs
> detection"). The bug was fixed in upstream CMake in version 3.0 [0].
> 
> Amongst all the cmake packages currently in Buildroot, the currently
                                                             ^^^^^^^^^dupe

> highest version mentioned in cmake_minimum_required() is 3.1 (grantlee
> and opencv3).
> 
> Thus we use 3.1 as the lowest required cmake for now, until a package is
> bumped, or a new package added, with a higher required version.
> 
> We then ensure, as a post-patch hook in the cmake infra, that no
> package requires a cmake version higher than what we do in Buildroot.
> If that's not the case, this is considered an error and the build is
> aborted. We use a post-patch hook rather a more obvious pre-configure
> hook because it is then easier to check the requirements of a package
> without having to build all its dependencies first.

 I still have some comments about this minimum version check. Perhaps it's
better to split that into a separate patch so the core functionality can already
be committed.

> 
> However, the target cmake requires up to cmake 3.4 for running its
> tests; and they do not get built in our case. Bumping the required host
> cmake minimum version for the whole of Buildroot would almost always
> defeat the purpose of this change. So we just exclude the target cmake
> from the version check.
> 
> [0] https://cmake.org/gitweb?p=cmake.git;h=e8b8b37ef6fef094940d3384df5a1d421b9fa568
[snip]
> diff --git a/package/pkg-cmake.mk b/package/pkg-cmake.mk
> index 4c6dc62..759b3e6 100644
> --- a/package/pkg-cmake.mk
> +++ b/package/pkg-cmake.mk
> @@ -35,6 +35,38 @@ ifneq ($(QUIET),)
>  CMAKE_QUIET = -DCMAKE_RULE_MESSAGES=OFF -DCMAKE_INSTALL_MESSAGE=NEVER
>  endif
>  
> +#
> +# Check the package does not require a cmake version more recent than we do.
> +#
> +# Some packages may use a variable to set the minimum required version. In
> +# this case, there is not much we can do, so we just accept it; the configure
> +# would fail later anyway in this case.
> +#
> +define CMAKE_CHECK_MIN_VERSION

 This would be perfect to do with a script instead - no make support is needed,
except for passing $(@D) $($(PKG)_NAME) and BR2_CMAKE_MIN_VERSION.

> +	$(Q)v=$$( grep -hr -i 'cmake_minimum_required.*version' $(@D) \

 Shouldn't we search just in CMakeLists.txt files? Do you think it's likely that
a package declares the minimum required version in and included file? That said,
the extra time spent on grepping through everything doesn't amount to much
unless it's a large package, and in that case it's anyway going to be dominated
by package build time.

> +		|tr '[:upper:]' '[:lower:]' \
> +		|sed -r -e '/.*\(version ([[:digit:]]+\.[[:digit:]]+).+/!d; s//\1/' \

 Not exactly an easy to understand sed script...

> +		|sort -t. -k 1,1nr -k2,2nr \

 Since you're anyway doing the version sort here already, you could just add
$(BR2_CMAKE_MIN_VERSION_MAJOR).$(BR2_CMAKE_MIN_VERSION_MINOR) into the mix and
verify that the first line is equal to
$(BR2_CMAKE_MIN_VERSION_MAJOR).$(BR2_CMAKE_MIN_VERSION_MINOR)
We already use that trick for checking the make version, for instance.

(and then you don't need to split anymore, just $(BR2_CMAKE_MIN_VERSION)).

> +		|head -n 1 \
> +	 ); \
> +	MAJOR=$${v%.*}; minor=$${v#*.}; \
> +	if [ -z "$${v}" ]; then \
> +		: Unknown, not much we can do, OK; \
> +	elif [ $(BR2_CMAKE_MIN_VERSION_MAJOR) -gt $${MAJOR} ]; then \
> +		: OK; \
> +	elif [    $(BR2_CMAKE_MIN_VERSION_MAJOR) -eq $${MAJOR} \
> +	       -a $(BR2_CMAKE_MIN_VERSION_MINOR) -ge $${minor} ]; then \
> +		: OK; \

 Which removes the need for all these conditions.

> +	else \
> +		printf "*** Error: incorrect minimum cmake version:\n"; \
> +		printf "*** Error: Buildroot requires %s.%s\n" \
> +			$(BR2_CMAKE_MIN_VERSION_MAJOR) $(BR2_CMAKE_MIN_VERSION_MINOR); \
> +		printf "*** Error: %s needs at least %s.%s\n" \
> +			$($(PKG)_NAME) $${MAJOR} $${minor}; \

 I don't think this error message is very clear. How about:

*** Error: package %s needs cmake version %s.%s\n
***        Buildroot's minimum version BR2_CMAKE_MIN_VERSION\n
***        should be set to at least that version. Currently\n
***        it is set to %s.\n

> +		exit 1; \
> +	fi
> +endef
> +
>  ################################################################################
>  # inner-cmake-package -- defines how the configuration, compilation and
>  # installation of a CMake package should be done, implements a few hooks to
> @@ -71,6 +103,13 @@ else
>  $(2)_BUILDDIR			= $$($(2)_SRCDIR)/buildroot-build
>  endif
>  
> +# Special exception for cmake, which requires cmake up to 3.4, but
> +# only to run its tests; all other equirements are on at most 3.0.
> +# Just skip the version check for cmake, and only for cmake.
> +ifneq ($(1),cmake)
> +$(2)_POST_PATCH_HOOKS += CMAKE_CHECK_MIN_VERSION
> +endif
> +
>  #
>  # Configure step. Only define it if not already defined by the package
>  # .mk file. And take care of the differences between host and target
> @@ -85,7 +124,7 @@ define $(2)_CONFIGURE_CMDS
>  	cd $$($$(PKG)_BUILDDIR) && \
>  	rm -f CMakeCache.txt && \
>  	PATH=$$(BR_PATH) \
> -	$$($$(PKG)_CONF_ENV) $$(HOST_DIR)/usr/bin/cmake $$($$(PKG)_SRCDIR) \
> +	$$($$(PKG)_CONF_ENV) $$(BR2_CMAKE) $$($$(PKG)_SRCDIR) \
>  		-DCMAKE_TOOLCHAIN_FILE="$$(HOST_DIR)/usr/share/buildroot/toolchainfile.cmake" \
>  		-DCMAKE_BUILD_TYPE=$$(if $$(BR2_ENABLE_DEBUG),RelWithDebInfo,Release) \
>  		-DCMAKE_INSTALL_PREFIX="/usr" \
> @@ -110,7 +149,7 @@ define $(2)_CONFIGURE_CMDS
>  	cd $$($$(PKG)_BUILDDIR) && \
>  	rm -f CMakeCache.txt && \
>  	PATH=$$(BR_PATH) \
> -	$$(HOST_DIR)/usr/bin/cmake $$($$(PKG)_SRCDIR) \
> +	$$(BR2_CMAKE) $$($$(PKG)_SRCDIR) \
>  		-DCMAKE_INSTALL_SO_NO_EXE=0 \
>  		-DCMAKE_FIND_ROOT_PATH="$$(HOST_DIR)" \
>  		-DCMAKE_FIND_ROOT_PATH_MODE_PROGRAM="BOTH" \
> @@ -146,7 +185,7 @@ endif
>  # primitives to find {C,LD}FLAGS, add it to the dependency list.
>  $(2)_DEPENDENCIES += host-pkgconf
>  
> -$(2)_DEPENDENCIES += host-cmake
> +$(2)_DEPENDENCIES += $(BR2_CMAKE_HOST_DEPENDENCY)
>  
>  #
>  # Build step. Only define it if not already defined by the package .mk
> diff --git a/support/dependencies/check-host-cmake.mk b/support/dependencies/check-host-cmake.mk
> new file mode 100644
> index 0000000..8680ec9
> --- /dev/null
> +++ b/support/dependencies/check-host-cmake.mk
> @@ -0,0 +1,19 @@
> +# Versions before 3.0 are affected by the bug described in
> +# https://git.busybox.net/buildroot/commit/?id=ef2c1970e4bff3be3992014070392b0e6bc28bd2
> +# and fixed in upstream CMake in version 3.0:
> +# https://cmake.org/gitweb?p=cmake.git;h=e8b8b37ef6fef094940d3384df5a1d421b9fa568
> +#
> +# Set this to either 3.0 or higher, depending on the highest minimum
> +# version required by any of the packages bundled in Buildroot. If a
> +# package is bumped or a new one added, and it requires a higher
> +# version, our cmake infra will catch it and whine.
> +#
> +BR2_CMAKE_MIN_VERSION_MAJOR = 3
> +BR2_CMAKE_MIN_VERSION_MINOR = 1

 It's just a personal preference, but I'd rather see a single
BR2_CMAKE_MIN_VERSION = 3.1, and where you need the major or minor use ${v%.*}.

> +
> +BR2_CMAKE ?= cmake
> +ifeq ($(call suitable-host-package,cmake,\
> +	$(BR2_CMAKE) $(BR2_CMAKE_MIN_VERSION_MAJOR) $(BR2_CMAKE_MIN_VERSION_MINOR)),)
> +BR2_CMAKE = $(HOST_DIR)/usr/bin/cmake
> +BR2_CMAKE_HOST_DEPENDENCY = host-cmake
> +endif
> diff --git a/support/dependencies/check-host-cmake.sh b/support/dependencies/check-host-cmake.sh
> new file mode 100755
> index 0000000..4951a05
> --- /dev/null
> +++ b/support/dependencies/check-host-cmake.sh
> @@ -0,0 +1,26 @@
> +#!/bin/sh
> +
> +candidate="${1}"
> +major_min="${2}"
> +minor_min="${3}"
> +
> +cmake=`which ${candidate}`
> +if [ ! -x "${cmake}" ]; then
> +	# echo nothing: no suitable cmake found
> +	exit 1
> +fi
> +
> +version=`${cmake} --version | head -n1 | cut -d\  -f3`

 Again minor nit, but I think -d' ' is easier to understand than -d\ .

> +major=`echo "${version}" | cut -d. -f1`
> +minor=`echo "${version}" | cut -d. -f2`

 I know this is just copy-paste from the other scripts, but ${version%.*} really
is better.


 Regards,
 Arnout

> +
> +if [ ${major} -gt ${major_min} ]; then
> +	echo "${cmake}"
> +else
> +	if [ ${major} -eq ${major_min} -a ${minor} -ge ${minor_min} ]; then
> +		echo "${cmake}"
> +	else
> +		# echo nothing: no suitable cmake found
> +		exit 1
> +	fi
> +fi
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
