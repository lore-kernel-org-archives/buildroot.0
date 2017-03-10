From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 11 Mar 2017 00:25:38 +0100
Subject: [Buildroot] [PATCH v2 1/1] package/pkg-cmake: Use
 CMAKE_<LANG>_COMPILER_LAUNCHER for ccache
In-Reply-To: <20170309050752.19494-1-daniel.black@au.ibm.com>
References: <20170309010911.1960-1-daniel.black@au.ibm.com>
 <20170309042720.or2hhr4zvgmrwcd2@tarshish>
 <20170309050752.19494-1-daniel.black@au.ibm.com>
Message-ID: <22d614df-d3fd-93af-8ef2-c340f8b9e45f@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 09-03-17 06:07, Daniel Black wrote:
> Since cmake version 3.4.0 CMAKE_<LANG>_COMPILER_LAUNCHER is used as
> the way to invoke things like ccache. We set this to ccache for
> the host and for cross compilers in toolchain.cmake.in. This
> leaves CMAKE_<C,CXX>_COMPILER pointing at the real compiler and
> still uses ccache.
> 
> Update minimium dependency version in check-host-cmake.mk accordingly.

 This is very unfortunate, it means a substantial slowdown in the build for
people who have an older system CMake.

 Although it is indeed cleaner to handle ccache this way, I don't think it
really fixes anything, does it? In that case, I think we should just stick with
the old way of doing things. We can revisit when we need to CMake 3.4 for some
other package.

 Regards,
 Arnout

> 
> ref: https://cmake.org/cmake/help/v3.4/variable/CMAKE_LANG_COMPILER_LAUNCHER.html
> 
> Signed-off-by: Daniel Black <daniel.black@au.ibm.com>
> ---
>  package/pkg-cmake.mk                     | 22 ++++++----------------
>  support/dependencies/check-host-cmake.mk |  2 +-
>  support/misc/toolchainfile.cmake.in      |  2 ++
>  3 files changed, 9 insertions(+), 17 deletions(-)
> 
> diff --git a/package/pkg-cmake.mk b/package/pkg-cmake.mk
> index 5d0a455..e2590b7 100644
> --- a/package/pkg-cmake.mk
> +++ b/package/pkg-cmake.mk
> @@ -20,17 +20,6 @@
>  #
>  ################################################################################
>  
> -# Set compiler variables.
> -ifeq ($(BR2_CCACHE),y)
> -CMAKE_HOST_C_COMPILER = $(HOST_DIR)/usr/bin/ccache
> -CMAKE_HOST_CXX_COMPILER = $(HOST_DIR)/usr/bin/ccache
> -CMAKE_HOST_C_COMPILER_ARG1 = $(HOSTCC_NOCCACHE)
> -CMAKE_HOST_CXX_COMPILER_ARG1 = $(HOSTCXX_NOCCACHE)
> -else
> -CMAKE_HOST_C_COMPILER = $(HOSTCC)
> -CMAKE_HOST_CXX_COMPILER = $(HOSTCXX)
> -endif
> -
>  ifneq ($(QUIET),)
>  CMAKE_QUIET = -DCMAKE_RULE_MESSAGES=OFF -DCMAKE_INSTALL_MESSAGE=NEVER
>  endif
> @@ -120,11 +109,11 @@ define $(2)_CONFIGURE_CMDS
>  		-DCMAKE_CXX_FLAGS="$$(HOST_CXXFLAGS)" \
>  		-DCMAKE_EXE_LINKER_FLAGS="$$(HOST_LDFLAGS)" \
>  		-DCMAKE_ASM_COMPILER="$$(HOSTAS)" \
> -		-DCMAKE_C_COMPILER="$$(CMAKE_HOST_C_COMPILER)" \
> -		-DCMAKE_CXX_COMPILER="$$(CMAKE_HOST_CXX_COMPILER)" \
> -		$(if $$(CMAKE_HOST_C_COMPILER_ARG1),\
> -			-DCMAKE_C_COMPILER_ARG1="$$(CMAKE_HOST_C_COMPILER_ARG1)" \
> -			-DCMAKE_CXX_COMPILER_ARG1="$$(CMAKE_HOST_CXX_COMPILER_ARG1)" \
> +		-DCMAKE_C_COMPILER="$$(HOSTCC_NOCCACHE)" \
> +		-DCMAKE_CXX_COMPILER="$$(HOSTCXX_NOCCACHE)" \
> +		$(if $(BR2_CCACHE),\
> +			-DCMAKE_CXX_COMPILER_LAUNCHER="$$(HOST_DIR)/usr/bin/ccache" \
> +			-DCMAKE_C_COMPILER_LAUNCHER="$$(HOST_DIR)/usr/bin/ccache" \
>  		) \
>  		-DCMAKE_COLOR_MAKEFILE=OFF \
>  		-DBUILD_DOC=OFF \
> @@ -247,6 +236,7 @@ $(HOST_DIR)/usr/share/buildroot/toolchainfile.cmake:
>  		-e 's#@@CMAKE_SYSTEM_PROCESSOR@@#$(call qstrip,$(CMAKE_SYSTEM_PROCESSOR))#' \
>  		-e 's#@@TOOLCHAIN_HAS_FORTRAN@@#$(if $(BR2_TOOLCHAIN_HAS_FORTRAN),1,0)#' \
>  		-e 's#@@CMAKE_BUILD_TYPE@@#$(if $(BR2_ENABLE_DEBUG),Debug,Release)#' \
> +		-e 's#\([^@]*\)@@CCACHE@@#$(if $(BR2_CCACHE),\1/usr/bin/ccache,\#\1)#g' \
>  		$(TOPDIR)/support/misc/toolchainfile.cmake.in \
>  		> $@
>  
> diff --git a/support/dependencies/check-host-cmake.mk b/support/dependencies/check-host-cmake.mk
> index 8002278..21f5072 100644
> --- a/support/dependencies/check-host-cmake.mk
> +++ b/support/dependencies/check-host-cmake.mk
> @@ -8,7 +8,7 @@
>  # package is bumped or a new one added, and it requires a higher
>  # version, our cmake infra will catch it and whine.
>  #
> -BR2_CMAKE_VERSION_MIN = 3.1
> +BR2_CMAKE_VERSION_MIN = 3.4
>  
>  BR2_CMAKE ?= cmake
>  ifeq ($(call suitable-host-package,cmake,\
> diff --git a/support/misc/toolchainfile.cmake.in b/support/misc/toolchainfile.cmake.in
> index c38800e..c4086ab 100644
> --- a/support/misc/toolchainfile.cmake.in
> +++ b/support/misc/toolchainfile.cmake.in
> @@ -60,6 +60,8 @@ set(ENV{PKG_CONFIG_SYSROOT_DIR} "${RELOCATED_HOST_DIR}/@@STAGING_SUBDIR@@")
>  # This toolchain file can be used both inside and outside Buildroot.
>  set(CMAKE_C_COMPILER "${RELOCATED_HOST_DIR}/@@TARGET_CC@@")
>  set(CMAKE_CXX_COMPILER "${RELOCATED_HOST_DIR}/@@TARGET_CXX@@")
> +set(CMAKE_C_COMPILER_LAUNCHER "${RELOCATED_HOST_DIR}/@@CCACHE@@")
> +set(CMAKE_CXX_COMPILER_LAUNCHER "${RELOCATED_HOST_DIR}/@@CCACHE@@")
>  if(@@TOOLCHAIN_HAS_FORTRAN@@)
>    set(CMAKE_Fortran_FLAGS_DEBUG "" CACHE STRING "Debug Fortran FLAGS")
>    set(CMAKE_Fortran_FLAGS_RELEASE " -DNDEBUG" CACHE STRING "Release Fortran FLAGS")
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
