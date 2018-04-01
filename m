From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 1 Apr 2018 22:46:07 +0200
Subject: [Buildroot] [PATCH v4 02/11] package/llvm: enable target variant
In-Reply-To: <20180329113346.10367-3-valentin.korenblit@smile.fr>
References: <20180329113346.10367-1-valentin.korenblit@smile.fr>
 <20180329113346.10367-3-valentin.korenblit@smile.fr>
Message-ID: <20180401224607.6c7e3722@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 29 Mar 2018 13:33:37 +0200, Valentin Korenblit wrote:

> diff --git a/package/llvm/llvm.mk b/package/llvm/llvm.mk
> index 71fcaa2b8e..4e58c96e0f 100644
> --- a/package/llvm/llvm.mk
> +++ b/package/llvm/llvm.mk
> @@ -10,13 +10,16 @@ LLVM_SOURCE = llvm-$(LLVM_VERSION).src.tar.xz
>  LLVM_LICENSE = NCSA
>  LLVM_LICENSE_FILES = LICENSE.TXT
>  LLVM_SUPPORTS_IN_SOURCE_BUILD = NO
> +LLVM_INSTALL_STAGING = YES
>  
>  # http://llvm.org/docs/GettingStarted.html#software
>  # host-python: Python interpreter 2.7 or newer is required for builds and testing.
>  # host-zlib: Optional, adds compression / uncompression capabilities to selected LLVM tools.
>  HOST_LLVM_DEPENDENCIES = host-python host-zlib
> +LLVM_DEPENDENCIES = host-llvm zlib
>  
>  # Don't build clang libcxx libcxxabi lldb compiler-rt lld polly as llvm subprojects
> +#This flag assumes that projects are checked out side-by-side and not nested

And ? I also don't understand why this comment is added in PATCH 02 and
not PATCH 01.

>  HOST_LLVM_CONF_OPTS += -DLLVM_ENABLE_PROJECTS=""
>  
>  # Disable CCACHE
> @@ -28,166 +31,238 @@ HOST_LLVM_CONF_OPTS += -DLLVM_BUILD_GLOBAL_ISEL=OFF
>  # * Use "Unix Makefiles" generator for generating make-compatible parallel makefiles.
>  #   Ninja is not supported yet by Buildroot
>  HOST_LLVM_CONF_OPTS += -G "Unix Makefiles"
> +LLVM_CONF_OPTS += -G "Unix Makefiles"

Same comment as for PATCH 01, do we really need to pass this
explicitly ? How do all other CMake packages in Buildroot work ?

> +# Use native llvm-tblgen from host-llvm (needed for cross-compilation)
> +LLVM_CONF_OPTS += -DLLVM_TABLEGEN=$(HOST_DIR)/usr/bin/llvm-tblgen
> +
> +# Copy llvm-config (host variant) to STAGING_DIR since llvm-config
> +# provided by llvm target variant can't run on the host.
> +# Also, llvm-config (host variant) returns include and lib directories
> +# for the host if it's installed in host/usr/bin:
> +# output/host/usr/bin/llvm-config --includedir
> +# output/host/usr/include
> +# When istalled in STAGING_DIR, llvm-config return include and lib

istalled -> installed

> +# directories from STAGING_DIR.
> +# output/staging/usr/bin/llvm-config --includedir
> +# output/staging/usr/include
> +define LLVM_COPY_LLVM_CONFIG_TO_STAGING_DIR
> +	$(INSTALL) -D -m 0755 $(HOST_DIR)/usr/bin/llvm-config \
> +		$(STAGING_DIR)/usr/bin/llvm-config
> +endef
> +LLVM_POST_INSTALL_STAGING_HOOKS = LLVM_COPY_LLVM_CONFIG_TO_STAGING_DIR

I don't understand why this is done as a post-install staging hook. Is
llvm-config build by host-llvm or llvm ? Is it needed for the build of
llvm, or for the build of stuff (like mesa3d) that will link against
the llvm library ?

>  # * LLVM_BUILD_UTILS: Build LLVM utility binaries. If OFF, just generate build targets.
> +#   Keep llvm utility binaries for the host. llvm-tblgen is built anyway as CMakeLists.txt
> +#   has add_subdirectory(utils/TableGen) unconditionally.
>  HOST_LLVM_CONF_OPTS += -DLLVM_BUILD_UTILS=ON
> +LLVM_CONF_OPTS += -DLLVM_BUILD_UTILS=OFF

Seeing all of this, I am not longer sure I like this per-option
explanations anymore.

Maybe something like:

# FOO_BAZ=ON, because ...
# BAZ_BAR=OFF, because ...
HOST_LLVM_CONF_OPTS = \
	... \
	...

# BAZ_BLEH=OFF, because ...
LLVM_CONF_OPTS = \
	... \
	...

And by having comments only for the interesting options, not only for
the obvious stuff.

>  # * BUILD_SHARED_LIBS Build all libraries as shared libraries instead of static
>  #   It is only recommended to be used by LLVM developers.To build LLVM as a single
>  #   shared library, we should use the LLVM_BUILD_LLVM_DYLIB option.

I know this comment was already there in PATCH 01, but I believe a more
useful explanation would be:

BUILD_SHARED_LIBS has a misleading name. It is in fact an option for
LLVM developers to build all LLVM libraries are separate shared
libraries. For normal use of LLVM, it is recommended to build a single
shared library, which is achieved by BUILD_SHARED_LIBS=OFF and
LLVM_BUILD_LLVM_DYLIB=ON.


>  # * CMAKE_BUILD_TYPE: Set build type Debug, Release, RelWithDebInfo, and MinSizeRel.
>  #   Default is Debug. Use the Release build which requires considerably less space.
>  HOST_LLVM_CONF_OPTS += -DCMAKE_BUILD_TYPE=Release
> +LLVM_CONF_OPTS += -DCMAKE_BUILD_TYPE=Release

CMAKE_BUILD_TYPE for target package is already passed by the
cmake-package infrastructure, so you shouldn't override that.

>  # Get target architecture
>  HOST_LLVM_TARGET_ARCH = $(call qstrip,$(BR2_PACKAGE_LLVM_TARGET_ARCH))
>  
>  # Build backend for target architecture
>  HOST_LLVM_CONF_OPTS += -DLLVM_TARGETS_TO_BUILD="$(HOST_LLVM_TARGET_ARCH)"
> +LLVM_CONF_OPTS += -DLLVM_TARGETS_TO_BUILD="$(HOST_LLVM_TARGET_ARCH)"
>  
>  # LLVM target to use for native code generation.
>  HOST_LLVM_CONF_OPTS += -DLLVM_TARGET_ARCH=$(HOST_LLVM_TARGET_ARCH)
> +LLVM_CONF_OPTS += -DLLVM_TARGET_ARCH=$(HOST_LLVM_TARGET_ARCH)

Is there a difference between -DLLVM_TARGETS_TO_BUILD and
-DLLVM_TARGET_ARCH ? You pass the same value to both ?

>  # * LLVM_ENABLE_CXX1Y: Compile with C++1y enabled OFF
>  #   Enable C++ and C++11 support if BR2_INSTALL_LIBSTDCPP=y
>  HOST_LLVM_CONF_OPTS += -DLLVM_ENABLE_CXX1Y=$(if $(BR2_INSTALL_LIBSTDCPP),ON,OFF)
> +LLVM_CONF_OPTS += -DLLVM_ENABLE_CXX1Y=$(if $(BR2_INSTALL_LIBSTDCPP),ON,OFF)

This time, this line makes sense (for the target LLVM).

>  # Builds a release tablegen that gets used during the LLVM build.
>  HOST_LLVM_CONF_OPTS += -DLLVM_OPTIMIZED_TABLEGEN=ON
> +LLVM_CONF_OPTS += -DLLVM_OPTIMIZED_TABLEGEN=ON

You need to build tablegen in the target llvm ?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
