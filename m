From: Romain Naour <romain.naour@smile.fr>
Date: Thu, 24 Oct 2019 22:34:15 +0200
Subject: [Buildroot] [PATCH v8 1/2] package/compiler-rt: new package
In-Reply-To: <20191023214636.17284-1-matthew.weber@rockwellcollins.com>
References: <20191023214636.17284-1-matthew.weber@rockwellcollins.com>
Message-ID: <d9b10fc1-2243-1baa-98dc-8eac64a3ad12@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Matt,

Le 23/10/2019 ? 23:46, Matt Weber a ?crit?:
> This patch adds support for the compiler-rt (CLANG runtime) library.
> It builds a set of static libraries and installs them into the
> CLANG/LLVM toolchain resource folder.
> 
> The compiler-rt fuzzer and address sanitizer tools require additional
> LLVM binary tools installed to allow stack trace decoding actively during
> executable analysis.  This patch conditionally enables these tools.
> https://github.com/google/sanitizers/wiki/AddressSanitizerCallStack
> 
> Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
> Cc: Romain Naour <romain.naour@smile.fr>
> Cc: Ricardo Martincoski <ricardo.martincoski@gmail.com>
> Cc: Valentin Korenblit <valentinkorenblit@gmail.com>
> Cc: Michael Drake <michael.drake@codethink.co.uk>
> 
> ---
> Changes
> v1 -> v2
> [Romain
>  - Removed unnecessary host-cmake dependency
> 
> v2 -> v3
> [Romain
>  - Update to use COMPILER_RT_INSTALL_PATH for library install
> [Ricardo
>  - Fixed check-package extra line
>  - Spelling in commit message
> 
> v3 -> v4
> [Valentin
>  - Pointed out that non-glibc libraries won't build. Further
>    investigation shows that the lib asan support in compiler-rt
>    doesn't have the libc checks yet to support multiple libraries.
>    (https://patchwork.ozlabs.org/patch/339938/ was the best example
>     I could find and it doesn't look like anything has changed in the
>     recent codebase)
> 
> v4 -> v5
> [Thomas P
>  - Revisited staging install step and found a cleaner way to use the
>    default and then a hook to setup the runtime library path
> 
> v6
>  - Bumped to 7.0.1 to match current LLVM/Clang version
> 
> v7
>  - Rebased on master for 8.0 LLVM/Clang version
>  - Added comment about bumping verions of LLVM/Clang and Compiler-rt
>    together
> [Romain
>  - Disabled test cases (-DCOMPILER_RT_INCLUDE_TESTS=OFF)
> 
> v8
>  - Rebased and updated version to 9.x to match llvm/clang
> 
> [Romain
>  - Squashed "[v7,1/5]package/llvm: install target binary/debug tools" to
>    be included in this patch
> 
> [Michael D
>  - compiler-rt symlink creation to include shared folder such
>    that control flow lists work
> ---
>  DEVELOPERS                           |  1 +
>  package/Config.in                    |  1 +
>  package/compiler-rt/Config.in        | 14 +++++++++++
>  package/compiler-rt/compiler-rt.hash |  3 +++
>  package/compiler-rt/compiler-rt.mk   | 37 ++++++++++++++++++++++++++++
>  package/llvm/llvm.mk                 | 11 ++++++++-
>  6 files changed, 66 insertions(+), 1 deletion(-)
>  create mode 100644 package/compiler-rt/Config.in
>  create mode 100644 package/compiler-rt/compiler-rt.hash
>  create mode 100644 package/compiler-rt/compiler-rt.mk
> 
> diff --git a/DEVELOPERS b/DEVELOPERS
> index db7d81fa86..e9cf60c1cd 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -1522,6 +1522,7 @@ F:	package/bridge-utils/
>  F:	package/checkpolicy/
>  F:	package/checksec/
>  F:	package/cgroupfs-mount/
> +F:	package/compiler-rt/
>  F:	package/crda/
>  F:	package/cunit/
>  F:	package/dacapo/
> diff --git a/package/Config.in b/package/Config.in
> index d4cfd50a4b..9d3ac0d5c2 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -1700,6 +1700,7 @@ menu "Other"
>  	source "package/clapack/Config.in"
>  	source "package/classpath/Config.in"
>  	source "package/cmocka/Config.in"
> +	source "package/compiler-rt/Config.in"
>  	source "package/cppcms/Config.in"
>  	source "package/cracklib/Config.in"
>  	source "package/dawgdic/Config.in"
> diff --git a/package/compiler-rt/Config.in b/package/compiler-rt/Config.in
> new file mode 100644
> index 0000000000..9afc0d9d60
> --- /dev/null
> +++ b/package/compiler-rt/Config.in
> @@ -0,0 +1,14 @@
> +config BR2_PACKAGE_COMPILER_RT
> +	bool "compiler-rt"
> +	depends on BR2_PACKAGE_LLVM
> +	depends on BR2_TOOLCHAIN_USES_GLIBC # asan lib requires
> +	help
> +	  A collection of runtime libraries primarily used by clang and
> +	  llvm to provide builtins, sanitizer runtimes, and profiling
> +	  at runtime.
> +
> +	  https://compiler-rt.llvm.org/
> +
> +comment "compiler-rt requires llvm to be enabled and a glibc toolchain"
> +	depends on !BR2_PACKAGE_LLVM
> +	depends on !BR2_TOOLCHAIN_USES_GLIBC
> diff --git a/package/compiler-rt/compiler-rt.hash b/package/compiler-rt/compiler-rt.hash
> new file mode 100644
> index 0000000000..cf2f1890ad
> --- /dev/null
> +++ b/package/compiler-rt/compiler-rt.hash
> @@ -0,0 +1,3 @@
> +# Locally computed:
> +sha256 56e4cd96dd1d8c346b07b4d6b255f976570c6f2389697347a6c3dcb9e820d10e  compiler-rt-9.0.0.src.tar.xz
> +sha256 dd27f8c290bcdc8368549cd7cd98710a9dbdc34122f2e096a1edb97824ed4148  LICENSE.TXT
> diff --git a/package/compiler-rt/compiler-rt.mk b/package/compiler-rt/compiler-rt.mk
> new file mode 100644
> index 0000000000..3d2cbcbff5
> --- /dev/null
> +++ b/package/compiler-rt/compiler-rt.mk
> @@ -0,0 +1,37 @@
> +################################################################################
> +#
> +# compiler-rt
> +#
> +################################################################################
> +
> +# Compiler-RT should be bumped together with LLVM and Clang as the run-time is
> +# tied to the version of those tools
> +COMPILER_RT_VERSION = 9.0.0
> +COMPILER_RT_SOURCE = compiler-rt-$(COMPILER_RT_VERSION).src.tar.xz
> +COMPILER_RT_SITE = http://llvm.org/releases/$(COMPILER_RT_VERSION)
> +COMPILER_RT_LICENSE = NCSA MIT

With LLVM 9.0.0, the LLVM based packages has been relicensed to the Apache
License 2.0 with LLVM Exceptions.

It guess you upadated the license file hash accordingly :)

See you tomorrow,
Romain

> +COMPILER_RT_LICENSE_FILES = LICENSE.TXT
> +COMPILER_RT_DEPENDENCIES = host-clang llvm
> +
> +COMPILER_RT_INSTALL_STAGING = YES
> +COMPILER_RT_INSTALL_TARGET = NO
> +
> +COMPILER_RT_CONF_OPTS=-DCOMPILER_RT_STANDALONE_BUILD=OFF \
> +	-DCOMPILER_RT_STANDALONE_BUILD=ON \
> +	-DCOMPILER_RT_DEFAULT_TARGET_TRIPLE=$(GNU_TARGET_NAME) \
> +	-DLLVM_CONFIG_PATH=$(HOST_DIR)/usr/bin/llvm-config
> +
> +# The installation of the target runtime libraries defaults to DESTDIR, however
> +# host-clang resources directory needs a link so Clang can find the runtime
> +# libraries in the same location they would be if built as part of the Clang
> +# build. The "resources" directory is loosely documented and seems to be
> +# assumed, as compiler-rt is usually build at the same time as Clang and not
> +# standalone.
> +define COMPILER_RT_SETUP_RUNTIME_LIBS
> +	mkdir -p $(HOST_DIR)/lib/clang/$(HOST_CLANG_VERSION)/lib
> +	ln -sf ../../../../$(GNU_TARGET_NAME)/sysroot/usr/lib/linux $(HOST_DIR)/lib/clang/$(HOST_CLANG_VERSION)/lib/linux
> +	ln -sf ../../../../$(GNU_TARGET_NAME)/sysroot/usr/share $(HOST_DIR)/lib/clang/$(HOST_CLANG_VERSION)/share
> +endef
> +COMPILER_RT_POST_INSTALL_STAGING_HOOKS += COMPILER_RT_SETUP_RUNTIME_LIBS
> +
> +$(eval $(cmake-package))
> diff --git a/package/llvm/llvm.mk b/package/llvm/llvm.mk
> index f21d986ad2..8453f67009 100644
> --- a/package/llvm/llvm.mk
> +++ b/package/llvm/llvm.mk
> @@ -217,8 +217,17 @@ HOST_LLVM_CONF_OPTS += \
>  # We need to activate LLVM_INCLUDE_TOOLS, otherwise it does not generate
>  # libLLVM.so
>  LLVM_CONF_OPTS += \
> -	-DLLVM_INCLUDE_TOOLS=ON \
> +	-DLLVM_INCLUDE_TOOLS=ON
> +
> +# The llvm-symbolizer binary is used by the Compiler-RT Fuzzer
> +# and AddressSanitizer tools for stack traces.
> +ifeq ($(BR2_PACKAGE_COMPILER_RT),y)
> +LLVM_CONF_OPTS += \
> +	-DLLVM_BUILD_TOOLS=ON
> +else
> +LLVM_CONF_OPTS += \
>  	-DLLVM_BUILD_TOOLS=OFF
> +endif
>  
>  # Compiler-rt not in the source tree.
>  # llvm runtime libraries are not in the source tree.
> 
