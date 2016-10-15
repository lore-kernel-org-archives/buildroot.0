From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 16 Oct 2016 00:42:04 +0200
Subject: [Buildroot] [PATCH v5 2/9] package/pkg-cmake.mk: move
 CMAKE_BUILD_TYPE definition into toolchainfile.cmake
In-Reply-To: <20161015210349.29432-3-s.martin49@gmail.com>
References: <20161015210349.29432-1-s.martin49@gmail.com>
 <20161015210349.29432-3-s.martin49@gmail.com>
Message-ID: <838f8306-1385-0098-6b50-1a27141f4d92@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 15-10-16 23:03, Samuel Martin wrote:
> This change still allows overriding the build type from the configure
> command line.

 Maybe explain why we want this:

The chosen CMAKE_BUILD_TYPE encodes an option of the Buildroot configuration, so
it makes more sense to save it in the toolchainfile.cmake than to pass it during
configure.

It is still possible to override the build type on the cmake command line.

> 
> Cc: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> Cc: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
> Signed-off-by: Samuel Martin <s.martin49@gmail.com>
> 
> ---
> changes v4->v5:
> - fix cmake set call
> 
> changes v3->v4:
> - new patch
> ---
>  CHANGES                             | 6 ++++++
>  package/pkg-cmake.mk                | 2 +-
>  support/misc/toolchainfile.cmake.in | 3 +++
>  3 files changed, 10 insertions(+), 1 deletion(-)
> 
> diff --git a/CHANGES b/CHANGES
> index b4bd5fe..c0e3e79 100644
> --- a/CHANGES
> +++ b/CHANGES
> @@ -1,3 +1,9 @@
> +2016.11-rc1,
> +
> +    toolchainfile.cmake:
> +    * when used outside of Buildroot, if not specified on the command
> +      line, the CMAKE_BUILD_TYPE is by toolchainfile.cmake.

 I'm not sure if this is something important enough to mention in the CHANGES.
If it is (up to Peter to decide when commit I'd say), the maybe rephrase as

   * when used outside of Buildroot, the toolchainfile.cmake will set the
     CMAKE_BUILD_TYPE to Debug or Release, according to the configuration.
     It is still possible to override this by adding -DCMAKE_BUILD_TYPE=...
     on the cmake command line.

> +
>  2016.08, Released September 1st, 2016
>  
>  	Minor fixes.
> diff --git a/package/pkg-cmake.mk b/package/pkg-cmake.mk
> index 259865d..5725ed6 100644
> --- a/package/pkg-cmake.mk
> +++ b/package/pkg-cmake.mk
> @@ -95,7 +95,6 @@ define $(2)_CONFIGURE_CMDS
>  	PATH=$$(BR_PATH) \
>  	$$($$(PKG)_CONF_ENV) $$(BR2_CMAKE) $$($$(PKG)_SRCDIR) \
>  		-DCMAKE_TOOLCHAIN_FILE="$$(HOST_DIR)/usr/share/buildroot/toolchainfile.cmake" \
> -		-DCMAKE_BUILD_TYPE=$(BR_CMAKE_BUILD_TYPE) \
>  		-DCMAKE_INSTALL_PREFIX="/usr" \
>  		-DCMAKE_COLOR_MAKEFILE=OFF \
>  		-DBUILD_DOC=OFF \
> @@ -255,5 +254,6 @@ $(HOST_DIR)/usr/share/buildroot/toolchainfile.cmake:
>  		-e 's#@@TARGET_FC@@#$(subst $(HOST_DIR)/,,$(call qstrip,$(TARGET_FC)))#' \
>  		-e 's#@@CMAKE_SYSTEM_PROCESSOR@@#$(call qstrip,$(CMAKE_SYSTEM_PROCESSOR))#' \
>  		-e 's#@@TOOLCHAIN_HAS_FORTRAN@@#$(if $(BR2_TOOLCHAIN_HAS_FORTRAN),1,0)#' \
> +		-e 's#@@BR_CMAKE_BUILD_TYPE@@#$(BR_CMAKE_BUILD_TYPE)#' \

 So I'd still keep the $(if $(BR2_ENABLE_DEBUG),Debug,Release) form here.

 Regards,
 Arnout

>  		$(TOPDIR)/support/misc/toolchainfile.cmake.in \
>  		> $@
> diff --git a/support/misc/toolchainfile.cmake.in b/support/misc/toolchainfile.cmake.in
> index 649b52d..2505256 100644
> --- a/support/misc/toolchainfile.cmake.in
> +++ b/support/misc/toolchainfile.cmake.in
> @@ -13,6 +13,9 @@ string(REPLACE "/usr/share/buildroot" "" RELOCATED_HOST_DIR ${CMAKE_CURRENT_LIST
>  set(CMAKE_SYSTEM_NAME Linux)
>  set(CMAKE_SYSTEM_PROCESSOR @@CMAKE_SYSTEM_PROCESSOR@@)
>  
> +# Build type from the Buildroot configuration
> +set(CMAKE_BUILD_TYPE @@BR_CMAKE_BUILD_TYPE@@ CACHE STRING "Buildroot build configuration")
> +
>  set(CMAKE_C_FLAGS "@@TARGET_CFLAGS@@ ${CMAKE_C_FLAGS}" CACHE STRING "Buildroot CFLAGS")
>  set(CMAKE_CXX_FLAGS "@@TARGET_CXXFLAGS@@ ${CMAKE_CXX_FLAGS}" CACHE STRING "Buildroot CXXFLAGS")
>  set(CMAKE_EXE_LINKER_FLAGS "@@TARGET_LDFLAGS@@ ${CMAKE_EXE_LINKER_FLAGS}" CACHE STRING "Buildroot LDFLAGS")
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
