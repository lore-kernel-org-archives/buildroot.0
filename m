From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 17 Jun 2017 16:31:54 +0200
Subject: [Buildroot] [PATCH 1/2] llvm: new package
In-Reply-To: <20170616204143.29198-2-aperez@igalia.com>
References: <20170616204143.29198-1-aperez@igalia.com>
 <20170616204143.29198-2-aperez@igalia.com>
Message-ID: <20170617163154.2b32a518@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 16 Jun 2017 23:41:42 +0300, Adrian Perez de Castro wrote:
> Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>

Thanks a lot for this patch. It's definitely good to see someone
working on LLVM support.

> diff --git a/package/llvm/0007-llvm-config-Clean-up-exported-values-update-for-shar.patch b/package/llvm/0007-llvm-config-Clean-up-exported-values-update-for-shar.patch
> new file mode 100644
> index 0000000000..679683a823
> --- /dev/null
> +++ b/package/llvm/0007-llvm-config-Clean-up-exported-values-update-for-shar.patch
> @@ -0,0 +1,57 @@
> +From 628b899be14a6bab4b32dbd53aabd447dcc16cb7 Mon Sep 17 00:00:00 2001
> +From: =?UTF-8?q?Micha=C5=82=20G=C3=B3rny?= <mgorny@gentoo.org>
> +Date: Sat, 20 Aug 2016 23:47:41 +0200
> +Subject: [PATCH] llvm-config: Clean up exported values, update for shared
> + linking
> +
> +Gentoo-specific fixup for llvm-config, including:
> +- wiping build-specific CFLAGS, CXXFLAGS,
> +- making --src-root return invalid path (/dev/null).

It would be nice to explain why this patch is needed.

> +
> +Thanks to Steven Newbury for the initial patch.
> +
> +Bug: https://bugs.gentoo.org/565358
> +Bug: https://bugs.gentoo.org/501684
> +
> +Fetch from: https://gitweb.gentoo.org/repo/gentoo.git/plain/sys-devel/llvm/files/9999/0007-llvm-config-Clean-up-exported-values-update-for-shar.patch
> +
> +

Please add your Signed-off-by here.

> diff --git a/package/llvm/Config.in b/package/llvm/Config.in
> new file mode 100644
> index 0000000000..92ad52d7b2
> --- /dev/null
> +++ b/package/llvm/Config.in
> @@ -0,0 +1,48 @@
> +config BR2_PACKAGE_HOST_LLVM_ARCH_SUPPORT

Why are you calling this BR2_PACKAGE_HOST_LLVM ? Isn't this instead
related to which target architectures LLVM support?

Also, it should be "SUPPORTS" with a final "S".

> +	bool
> +	default y
> +	depends on BR2_arm || BR2_armeb || BR2_aarch64 || \
> +		BR2_i386 || BR2_x86_64 || \
> +		BR2_mips || BR2_mipsel || \
> +		BR2_mips64 || BR2_mips64el || \
> +		BR2_powerpc || BR2_powerpc64 || BR2_powerpc64le || \
> +		BR2_sparc

It would IMO be a bit more readable as follows:

config BR2_PACKAGE_LLVM_ARCH_SUPPORTS
	bool
	default y if BR2_arm || BR2_armeb
	default y if BR2_aarch64
	default y if ...

> +menuconfig BR2_PACKAGE_LLVM

A "menuconfig" is probably not needed, keep this just a plain "config".

> +	bool "llvm"
> +	depends on BR2_PACKAGE_HOST_LLVM_ARCH_SUPPORT && \
> +		BR2_INSTALL_LIBSTDCPP && BR2_TOOLCHAIN_BUILDROOT_WCHAR

Please split each depends on on its own line.

> +	select BR2_PACKAGE_LIBXML2
> +	select BR2_PACKAGE_ZLIB
> +	help
> +		The LLVM Project is a collection of modular and reusable compiler
> +		and toolchain technologies.
> +
> +		http://llvm.org

Indentation of the help text is one tab + two spaces. Please run your
package through ./support/scripts/check-package to detect such coding
style related issues.

> +comment "llvm requires C++ and wide-character support"

Should be:

comment "llvm needs a toolchain w/ C++, wchar"
	depends on BR2_PACKAGE_LLVM_ARCH_SUPPORTS

Indeed, the wording of such comments is standardized in Buildroot, and
the depends on allows to not show the comment if llvm is anyway not
available for the selected architecture.

> +	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_BUILDROOT_WCHAR
> +
> +if BR2_PACKAGE_LLVM
> +
> +config BR2_PACKAGE_LLVM_ENABLE_FFI
> +	bool "Support libffi"
> +	default n

"default n" is never needed, as it's the default, please remove
everywhere.

> +	select BR2_PACKAGE_LIBFFI
> +	help
> +		Use libffi in the LLVM Interpreter in order to enable calling
> +		external functions.

One tab + two spaces for the indentation (please fix globally).

> +config BR2_PACKAGE_LLVM_ENABLE_RTTI
> +	bool "C++: Support RTTI"
> +	default n
> +	help
> +		Enable support for C++ Run-Time Type Information (RTTI)
> +
> +config BR2_PACKAGE_LLVM_ENABLE_EH
> +	bool "C++: Support exception handling"
> +	default n
> +	help
> +		Enable support for C++ exception handling (try/catch)

Is it really important to make those features configurable, as opposed
to having them unconditionally enabled? What is the size impact?

> diff --git a/package/llvm/llvm.mk b/package/llvm/llvm.mk
> new file mode 100644
> index 0000000000..0e9bd5fc41
> --- /dev/null
> +++ b/package/llvm/llvm.mk
> @@ -0,0 +1,145 @@
> +################################################################################
> +#
> +# llvm
> +#
> +################################################################################
> +
> +LLVM_VERSION = 4.0.0
> +LLVM_SITE = http://llvm.org/releases/$(LLVM_VERSION)
> +LLVM_SOURCE = llvm-$(LLVM_VERSION).src.tar.xz
> +LLVM_LICENSE = University of Illinois/NCSA Open Source License

We want SPDX license codes for the <pkg>_LICENSE variable. According to
https://spdx.org/licenses/, the corresponding code is just "NCSA".

> +LLVM_LICENSE_FILES = LICENSE.TXT
> +LLVM_INSTALL_STAGING = YES
> +LLVM_INSTALL_TARGET = YES

This last line is not needed, it's the default.

> +LLVM_DEPENDENCIES = libxml2 zlib host-python host-cmake

Remove host-cmake, it's automatically added to the dependencies since
you're using cmake-package.

> +# Determine the name of the LLVM target to enable depending on
> +# the Buildroot target settings.
> +#
> +ifeq ($(BR2_i386),y)
> +  LLVM_TARGET_ARCH := X86
> +else ifeq ($(BR2_x86_64),y)
> +  LLVM_TARGET_ARCH := X86
> +else ifeq ($(BR2_arm),y)
> +  LLVM_TARGET_ARCH := ARM
> +else ifeq ($(BR2_armeb),y)
> +  LLVM_TARGET_ARCH := ARM
> +else ifeq ($(BR2_aarch64),y)
> +  LLVM_TARGET_ARCH := AArch64
> +else ifeq ($(BR2_mips),y)
> +  LLVM_TARGET_ARCH := Mips
> +else ifeq ($(BR2_mipsel),y)
> +  LLVM_TARGET_ARCH := Mips
> +else ifeq ($(BR2_mips64),y)
> +  LLVM_TARGET_ARCH := Mips
> +else ifeq ($(BR2_mips64el),y)
> +  LLVM_TARGET_ARCH := Mips
> +else ifeq ($(BR2_powerpc),y)
> +  LLVM_TARGET_ARCH := PowerPC
> +else ifeq ($(BR2_powerpc64),y)
> +  LLVM_TARGET_ARCH := PowerPC
> +else ifeq ($(BR2_powerpc64le),y)
> +  LLVM_TARGET_ARCH := PowerPC
> +else ifeq ($(BR2_sparc),y)
> +  LLVM_TARGET_ARCH := Sparc
> +else
> +  $(error Target architecture not supported by LLVM)
> +endif

Don't use := for assignments, but =. Also, this could probably be more
nicely handled in the Config.in file. Something like:

config BR2_PACKAGE_LLVM_ARCH
	string
	default "X86" if BR2_i386 || BR2_x86_64
	default "ARM" if BR2_arm || BR2_armeb
	...

and in llvm.mk:

LLVM_ARCH = $(call qstrip,$(BR2_PACKAGE_LLVM_ARCH))

> +# List of build options at:
> +#    http://llvm.org/docs/CMake.html
> +#
> +LLVM_CONF_OPTS := \

Use = for assignments, not :=.

> +  -DLLVM_DEFAULT_TARGET_TRIPLE=$(GNU_TARGET_NAME) \
> +  -DLLVM_HOST_TRIPLE=$(GNU_TARGET_NAME) \
> +  -DLLVM_TARGETS_TO_BUILD=$(LLVM_TARGET_ARCH) \
> +  -DLLVM_TARGET_ARCH=$(LLVM_TARGET_ARCH) \
> +  -DLLVM_OPTIMIZED_TABLEGEN=YES \
> +  -DLLVM_ENABLE_ZLIB=YES \

zlib support is optional ?

> +  -DLLVM_INCLUDE_TOOLS=YES \
> +  -DLLVM_INCLUDE_UTILS=NO \
> +  -DLLVM_INCLUDE_EXAMPLES=NO \
> +  -DLLVM_INCLUDE_TESTS=NO \
> +  -DLLVM_BUILD_TESTS=NO \
> +  -DLLVM_BUILD_RUNTIME=NO \
> +  -DLLVM_ENABLE_PROJECTS=''
> +
> +

Please use only one blank line.

> +# The Go bindings have no CMake rules at the moment, but better remove the
> +# check preventively. Building the Go and OCaml bindings is yet unsupported.
> +#
> +LLVM_CONF_OPTS += \
> +  -DGO_EXECUTABLE=GO_EXECUTABLE-NOTFOUND \
> +  -DOCAMLFIND=OCAMLFIND-NOTFOUND
> +
> +

Only one blank line.

> +# Building per-component shared libraries is NOT recommended by upstream.
> +# The all-in-one libLLVM-<version>.so is enabled with a different setting.
> +LLVM_CONF_OPTS += \
> +  -DBUILD_SHARED_LIBS=NO \
> +  -DLLVM_BUILD_LLVM_DYLIB=$(if $(BR2_STATIC_LIBS),NO,YES)
> +
> +

Only one blank line.

> +ifeq ($(BR2_PACKAGE_LLVM_ENABLE_FFI),y)
> +  LLVM_DEPENDENCIES += libffi
> +  LLVM_CONF_OPTS += -DLLVM_ENABLE_FFI=YES
> +else
> +  LLVM_CONF_OPTS += -DLLVM_ENABLE_FFI=NO

No indentation inside the ifeq...endif blocks (please fix globally).

> +# XXX: LLVM does include some support for building native tools. This is used
> +#      to build e.g. llvm-config, and a host-native llvm-tblgen if needed.
> +#      Unfortunately, Buildroot is overzealous about passing the parameters
> +#      needed for cross-building, and the CMake configuration for the native

Can you explain in what respect Buildroot is "overzealous"? Is there
anything we can/should fix?

> +#      tools ends up using the cross-toolchain. Once "cmake-package" has
> +#      defined LLVM_*_CMDS, this adds:
> +#
> +#        - A call to CMake which resets CMAKE_{C,CXX,ASM}_COMPILER with the
> +#          paths to the host-native ones. Note that using the *_NOCCACHE
> +#          variables is needed, otherwise CMake will choke.
> +#
> +#        - The file "BuildVariables.inc" is copied over from the cross-build
> +#          directory to the native one. This way a new "llvm-config" which
> +#          can run on the build host returns information about the target
> +#          build which gets installed in the sysroot. This is done as an
> +#          appended build command. Note that Make has to be re-invoked to
> +#          rebuild after copying the file over.
> +#
> +#        - Last but not least, "llvm-config" is copied into the sysroot with
> +#          the target triple prefix, because packages using sane build systems
> +#          will first try that.

Buildroot doesn't rename <foo>-config scripts/programs to be prefixed
with the target triple prefix, so it would be better to keep it named
llvm-config, like all other <foo>-config in $(STAGING_DIR)/usr/bin.

> +LLVM_CONFIGURE_CMDS += \

Using those += is really not clean. Instead, you should use
POST_CONFIGURE_HOOKS, POST_BUILD_HOOKS and POST_INSTALL_STAGING_HOOKS.

However, I'd really like to understand how Buildroot is "overzealous"
and see if things can work out of the box without doing those hacks.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
