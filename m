From: Romain Naour <romain.naour@gmail.com>
Date: Sun, 18 Nov 2018 23:28:04 +0100
Subject: [Buildroot] [PATCH v2 1/6] package/compiler-rt: new package
In-Reply-To: <1542426982-54683-1-git-send-email-matthew.weber@rockwellcollins.com>
References: <1542426982-54683-1-git-send-email-matthew.weber@rockwellcollins.com>
Message-ID: <7495e3c3-0816-5055-8e8e-e7ee6aa2657c@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le 17/11/2018 ? 04:56, Matt Weber a ?crit?:
> This patch adds support for the compiler-rt (CLANG runtime) libary.
> It builds a set of static libraries and installs them into the
> CLANG/LLVM toolchain resource folder.
> 
> Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
> Cc: Romain Naour <romain.naour@smile.fr>
> ---
> Changes
> v1 -> v2
> [Romain
>  - Removed unnecessary host-cmake dependency
> ---
>  DEVELOPERS                           |  1 +
>  package/Config.in                    |  1 +
>  package/compiler-rt/Config.in        | 12 ++++++++++++
>  package/compiler-rt/compiler-rt.hash |  3 +++
>  package/compiler-rt/compiler-rt.mk   | 35 +++++++++++++++++++++++++++++++++++
>  5 files changed, 52 insertions(+)
>  create mode 100644 package/compiler-rt/Config.in
>  create mode 100644 package/compiler-rt/compiler-rt.hash
>  create mode 100644 package/compiler-rt/compiler-rt.mk
> 
> diff --git a/DEVELOPERS b/DEVELOPERS
> index 53467da..e78d649 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -1360,6 +1360,7 @@ F:	package/bridge-utils/
>  F:	package/checkpolicy/
>  F:	package/checksec/
>  F:	package/cgroupfs-mount/
> +F:	package/compiler-rt/
>  F:	package/crda/
>  F:	package/devmem2/
>  F:	package/dnsmasq/
> diff --git a/package/Config.in b/package/Config.in
> index b60e770..73ddc2d 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -1602,6 +1602,7 @@ menu "Other"
>  	source "package/clapack/Config.in"
>  	source "package/classpath/Config.in"
>  	source "package/cmocka/Config.in"
> +	source "package/compiler-rt/Config.in"
>  	source "package/cppcms/Config.in"
>  	source "package/cracklib/Config.in"
>  	source "package/dawgdic/Config.in"
> diff --git a/package/compiler-rt/Config.in b/package/compiler-rt/Config.in
> new file mode 100644
> index 0000000..e15d3aa
> --- /dev/null
> +++ b/package/compiler-rt/Config.in
> @@ -0,0 +1,12 @@
> +config BR2_PACKAGE_COMPILER_RT
> +	bool "compiler-rt"
> +	depends on BR2_PACKAGE_LLVM
> +	help
> +	  A collection of runtime libraries primarily used by clang and
> +	  llvm to provide builtins, sanitizer runtimes, and profiling
> +	  at runtime.
> +
> +	  https://compiler-rt.llvm.org/
> +
> +comment "compiler-rt requires llvm to be enabled"
> +	depends on !BR2_PACKAGE_LLVM
> diff --git a/package/compiler-rt/compiler-rt.hash b/package/compiler-rt/compiler-rt.hash
> new file mode 100644
> index 0000000..df6ed19
> --- /dev/null
> +++ b/package/compiler-rt/compiler-rt.hash
> @@ -0,0 +1,3 @@
> +# Locally computed:
> +sha256 bdec7fe3cf2c85f55656c07dfb0bd93ae46f2b3dd8f33ff3ad6e7586f4c670d6  compiler-rt-7.0.0.src.tar.xz
> +sha256 417541d990edb3f96327ac03cb67e52eac80fc5c3e7afc69213cd04d7c3b9b27  LICENSE.TXT
> diff --git a/package/compiler-rt/compiler-rt.mk b/package/compiler-rt/compiler-rt.mk
> new file mode 100644
> index 0000000..dd962fb
> --- /dev/null
> +++ b/package/compiler-rt/compiler-rt.mk
> @@ -0,0 +1,35 @@
> +################################################################################
> +#
> +# compiler-rt
> +#
> +################################################################################
> +
> +# Compiler-RT should be bumped together with LLVM and Clang as the run-time is
> +# tied to the version of those tools
> +COMPILER_RT_VERSION = 7.0.0
> +COMPILER_RT_SOURCE = compiler-rt-$(COMPILER_RT_VERSION).src.tar.xz
> +COMPILER_RT_SITE = http://llvm.org/releases/$(COMPILER_RT_VERSION)
> +COMPILER_RT_LICENSE = NCSA MIT
> +COMPILER_RT_LICENSE_FILES = LICENSE.TXT
> +COMPILER_RT_DEPENDENCIES = host-clang llvm
> +
> +COMPILER_RT_INSTALL_STAGING = YES
> +COMPILER_RT_INSTALL_TARGET = NO
> +
> +
> +# -DCMAKE_INSTALL_PREFIX="" allows the COMPILER_RT_INSTALL_STAGING_CMDS to
> +# provide the complete path to compilier-rt for installation of the runtime
> +# libraries into the host-{clang,llvm} resources directory. The "resources"
> +# directory is loosely document at this point and will probably need revisited
> +# when making the llvm/clang tools SDK relocatable.
> +COMPILER_RT_CONF_OPTS=-DCOMPILER_RT_INCLUDE_TESTS=ON \
> +	-DCOMPILER_RT_STANDALONE_BUILD=ON \
> +	-DCOMPILER_RT_DEFAULT_TARGET_TRIPLE=$(GNU_TARGET_NAME) \
> +	-DLLVM_CONFIG_PATH=$(HOST_DIR)/usr/bin/llvm-config \
> +	-DCMAKE_INSTALL_PREFIX=""

Can you try with -DCOMPILER_RT_INSTALL_PATH=$(HOST_DIR) instead ?

Best regards,
Romain

> +
> +define COMPILER_RT_INSTALL_STAGING_CMDS
> +	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR=$(HOST_DIR)/lib/clang/$(HOST_CLANG_VERSION)/ install/fast
> +endef
> +
> +$(eval $(cmake-package))
> 
