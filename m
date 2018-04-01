From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 1 Apr 2018 22:36:22 +0200
Subject: [Buildroot] [PATCH v4 01/11] package/llvm: new host package
In-Reply-To: <20180329113346.10367-2-valentin.korenblit@smile.fr>
References: <20180329113346.10367-1-valentin.korenblit@smile.fr>
 <20180329113346.10367-2-valentin.korenblit@smile.fr>
Message-ID: <20180401223622.7ed2b85a@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Valentin,

Here is a review. I guess I'll see with Romain tomorrow how to handle
this. Perhaps we can fix most of the things during the hackathon, but
it would be nice if you could answer the questions in the e-mail below.
Thanks!

On Thu, 29 Mar 2018 13:33:36 +0200, Valentin Korenblit wrote:
> This patch installs LLVM on the host machine: tools and libraries.
> 
> In order to cross-compile LLVM for the target, LLVM
> must be installed on the host, or at least llvm-tblgen.
> This is necessary as the path to host's llvm-tblgen must
> be specified when cross-compiling using the option LLVM_TABLEGEN.

the LLVM_TABLEGEN option.

> Also, a version of llvm-config that can run on the host will
> be required by packages that link with LLVM libraries, so we
> need to generate it and install it in STAGING_DIR/usr/bin.
> 
> It is important to remark why we need llvm-config(host variant)
> installed in STAGING dir. This tool is necessary to build
> applications that use LLVM, as it prints the compiler flags,
> linker flags and object libraries needed to link against LLVM libs.
> 
> More info: https://bugs.chromium.org/p/chromium/issues/detail?id=219369
> 
> The original idea was to compile only llvm-tblgen and llvm-config
> for the host, as they are the only necessary componentes. However,

componentes -> components

> llvm-config tool does not work as expected if it is not linked with
> libLLVM.so, so we must also enable LLVM_LINK_LLVM_DYLIB, what builds
> LLVM as a single shared library and links LLVM tools with it.
> 
> More info: https://bugs.freebsd.org/bugzilla/show_bug.cgi?id=224847
> in comment #11.
> 
> If we don't build full LLVM for the host, it would be necessary to
> patch configure.ac from mesa3d if we want dynamic linking, because it
> uses llvm-config (host variant installed in STAGING_DIR) to get the
> necessary LLVM libraries to link with, what has the following problems:

"what has" ? Probably you wanted to use "that has" or "which has"

> 
> llvm-config --shared mode outputs static (even if LLVM is built as
> one shared library)
> 
> llvm-config --libs outputs all LLVM tiny libs: -lLLVMLTO, -lLLVMPasses,etc.

And ?

> Mesa tries to execute: llvm-config --link-shared --libs, but this outputs
> llvm-config: error: libLLVM-5.0.so is missing.
> 
> Given that these problems may arise with other packages that use LLVM, it
> is preferable to do a full build for the host. Also, having a complete
> installation of LLVM on the host will also facilitate the integration
> of Clang front-end, what is going to be added in a future patch.

what -> that or which

> As this package is intended to be used together with Mesa3D to enable llvmpipe,
> we target x86 architecture.

I'm not sure what this means, especially because your patch series
later adds support for ARM, AArch64, etc.

> Mesa strongly recommends support for SSE2. Support for SSE3 and
> SSE4.1 will yield the most efficient code.

And ?

> diff --git a/package/llvm/Config.in.host b/package/llvm/Config.in.host
> new file mode 100644
> index 0000000000..26ee7e28bb
> --- /dev/null
> +++ b/package/llvm/Config.in.host
> @@ -0,0 +1,17 @@
> +config BR2_PACKAGE_LLVM_ARCH_SUPPORTS
> +	bool
> +	default y if BR2_i386 || BR2_x86_64

	default y if BR2_i386
	default y if BR2_x86_64

> +	depends on BR2_HOST_GCC_AT_LEAST_4_8

This is not an architecture dependency, and we generally have a
Config.in comment for it.

> +config BR2_PACKAGE_HOST_LLVM
> +	bool "host llvm"

Do we really need a visible Config.in.host option for this? In this
patch series, host-llvm is merely needed as a build dependency of the
target llvm, so I don't think we need a visible Config.in.host option.

> diff --git a/package/llvm/llvm.mk b/package/llvm/llvm.mk
> new file mode 100644
> index 0000000000..71fcaa2b8e
> --- /dev/null
> +++ b/package/llvm/llvm.mk
> @@ -0,0 +1,217 @@
> +################################################################################
> +#
> +# llvm
> +#
> +################################################################################
> +
> +LLVM_VERSION = 5.0.1
> +LLVM_SITE = http://llvm.org/releases/$(LLVM_VERSION)
> +LLVM_SOURCE = llvm-$(LLVM_VERSION).src.tar.xz
> +LLVM_LICENSE = NCSA
> +LLVM_LICENSE_FILES = LICENSE.TXT
> +LLVM_SUPPORTS_IN_SOURCE_BUILD = NO

In the rest of this file, you've decided to document each and every
configure option, and why it was set to its value. I don't think we do
this in any other package in Buildroot. I find that pretty verbose, but
on the other hand, it indeed gives lots of interesting details. So I'm
personally OK with this.

> +# http://llvm.org/docs/GettingStarted.html#software
> +# host-python: Python interpreter 2.7 or newer is required for builds and testing.
> +# host-zlib: Optional, adds compression / uncompression capabilities to selected LLVM tools.

If it's optional, why do we enable it ?

> +HOST_LLVM_DEPENDENCIES = host-python host-zlib
> +
> +# Don't build clang libcxx libcxxabi lldb compiler-rt lld polly as llvm subprojects
> +HOST_LLVM_CONF_OPTS += -DLLVM_ENABLE_PROJECTS=""
> +
> +# Disable CCACHE
> +HOST_LLVM_CONF_OPTS += -DLLVM_CCACHE_BUILD=OFF

Why do we disable ccache ? Buildroot has ccache support, and for
something big like LLVM, it seems useful to use it.

> +
> +# Disable Build GlobalIsel

This comment is really useless: it doesn't explain *anything* more than
what the code show. So either don't put such a comment, or make it
actually useful by explaining what GlobalIsel is.

> +HOST_LLVM_CONF_OPTS += -DLLVM_BUILD_GLOBAL_ISEL=OFF
> +
> +# * Use "Unix Makefiles" generator for generating make-compatible parallel makefiles.
> +#   Ninja is not supported yet by Buildroot

This is not correct, we do have host-ninja, and a number of meson-based
packages are using ninja. I'm a bit surprised that you need to pass
this, since we're not passing it for any other CMake-based package in
Buildroot. Is this really needed ?

> +HOST_LLVM_CONF_OPTS += -G "Unix Makefiles"
> +
> +# * LLVM_BUILD_UTILS: Build LLVM utility binaries. If OFF, just generate build targets.

This comment is also not very useful. Explain *why* we are doing
things, not what we are doing, because it's obvious that
LLVM_BUILD_UTILS=ON will build the LLVM utility binaries.

> +HOST_LLVM_CONF_OPTS += -DLLVM_BUILD_UTILS=ON
> +
> +# * LLVM_INSTALL_UTILS: Include utility binaries in the 'install' target. ON for host.
> +#   Utils : FileCheck, KillTheDoctor, llvm-PerfectShuffle, count, not, yaml-bench
> +HOST_LLVM_CONF_OPTS += -DLLVM_INSTALL_UTILS=ON
> +
> +# * LLVM_ENABLE_LIBEDIT: Use libedit if available

Do we really need to replicate the documentation of each option ?

> +#   Disabled since no host-libedit
> +HOST_LLVM_CONF_OPTS += -DLLVM_ENABLE_LIBEDIT=OFF
> +
> +# * LLVM_INSTALL_TOOLCHAIN_ONLY "Only include toolchain files in the 'install' target. OFF
> +#   We also want llvm libraries and modules.

In fact I'm not sure I like the fact that you have the option
documentation, and then the explanation of what we're doing with it.
It's very verbose for no good reason. Probably something like this
would be sufficient:

# We to install llvm libraries and modules.

> +HOST_LLVM_CONF_OPTS += -DLLVM_INSTALL_TOOLCHAIN_ONLY=OFF
> +
> +# * LLVM_APPEND_VC_REV "Append the version control system revision id to LLVM version OFF
> +#   We build from a release archive without vcs

Ditto.

> +# * LLVM_ENABLE_BACKTRACES: Enable embedding backtraces on crash ON
> +#   Use backtraces on crash to report toolchain issue.

issues.

> +# * LLVM_ENABLE_THREADS: Use threads if available ON
> +#   Keep threads enabled

Why "Keep" ? Just "Enable thread support"

> +HOST_LLVM_CONF_OPTS += -DLLVM_ENABLE_THREADS=ON
> +
> +# * LLVM_ENABLE_ZLIB: Use zlib for compression/decompression if available ON
> +#   Keep zlib support enabled

Same.

> +HOST_LLVM_CONF_OPTS += -DLLVM_ENABLE_ZLIB=ON
> +
> +# * LLVM_ENABLE_PIC: Build Position-Independent Code ON
> +#   We don't use llvm for static only build, so enable PIC
> +HOST_LLVM_CONF_OPTS += -DLLVM_ENABLE_PIC=ON
> +
> +# * LLVM_ENABLE_WARNINGS: Enable compiler warnings ON
> +#   Keep compiler warning enabled
> +HOST_LLVM_CONF_OPTS += -DLLVM_ENABLE_WARNINGS=ON
> +
> +# * LLVM_ENABLE_PEDANTIC: Compile with pedantic enabled ON
> +#   Keep pedantic enabled
> +HOST_LLVM_CONF_OPTS += -DLLVM_ENABLE_PEDANTIC=ON
> +
> +# * LLVM_ENABLE_WERROR: Fail and stop if a warning is triggered OFF
> +#   Keep Werror disabled
> +HOST_LLVM_CONF_OPTS += -DLLVM_ENABLE_WERROR=OFF

Again, all of those descriptions are too verbose IMO.

> +# * LLVM_POLLY_BUILD: Build LLVM with Polly ON
> +#   Keep it enabled, if POLLY is not in-tree it will not be built
> +HOST_LLVM_CONF_OPTS += -DLLVM_POLLY_BUILD=ON

At the beginning of the .mk file in a comment you say " Don't build
clang libcxx libcxxabi lldb compiler-rt lld polly as llvm subprojects".
And here you say you want to build Polly. I have no idea what Polly is,
but it doesn't seem very consistent.

> +# * LINK_POLLY_INTO_TOOLS: Static link Polly into tools ON

Also: don't repeat the option name in the comment, that's really
useless.

> +HOST_LLVM_CONF_OPTS += -DLLVM_POLLY_LINK_INTO_TOOLS=ON
> +
> +# * LLVM_INCLUDE_TOOLS: Generate build targets for the LLVM tools ON
> +HOST_LLVM_CONF_OPTS += -DLLVM_INCLUDE_TOOLS=ON
> +
> +# * LLVM_BUILD_TOOLS: Build the LLVM tools

That's another example of a totally useless comment. BUILD_TOOLS=ON is
clear that you enable the tools.

> +# * LLVM_INCLUDE_UTILS: Generate build targets for the LLVM utils.
> +#   Enabled for host, disabled for the target.

That's all obvious from LLVM_INCLUDE_UTILS=ON. A comment is useful if
it says *why* we are doing something, not *what* we are doing.

> +HOST_LLVM_CONF_OPTS += -DLLVM_INCLUDE_UTILS=ON
> +
> +# Do not build llvm runtime libraries
> +HOST_LLVM_CONF_OPTS += -DLLVM_BUILD_RUNTIME=OFF \
> +	-DLLVM_INCLUDE_RUNTIMES=OFF
> +
> +# * LLVM_BUILD_EXAMPLES: Build the LLVM example programs OFF
> +#   Don't build examples
> +HOST_LLVM_CONF_OPTS += -DLLVM_BUILD_EXAMPLES=OFF \
> +	-DLLVM_INCLUDE_EXAMPLES=OFF
> +
> +# * LLVM_BUILD_TESTS: Build LLVM unit tests OFF
> +#   Don't build tests
> +HOST_LLVM_CONF_OPTS += -DLLVM_BUILD_TESTS=OFF
> +
> +# * LLVM_INCLUDE_TESTS: Generate build targets for the LLVM unit tests OFF
> +#   Don't build llvm unit tests
> +HOST_LLVM_CONF_OPTS += -DLLVM_INCLUDE_TESTS=OFF
> +
> +# * LLVM_INCLUDE_GO_TESTS: Include the Go bindings tests in test build targets OFF
> +#   Don't build Go tests
> +HOST_LLVM_CONF_OPTS += -DLLVM_INCLUDE_GO_TESTS=OFF
> +
> +# * LLVM_BUILD_DOCS: Build the llvm documentation OFF
> +#   Disable llvm documentation
> +HOST_LLVM_CONF_OPTS += -DLLVM_BUILD_DOCS=OFF
> +
> +# * LLVM_INCLUDE_DOCS: Generate build targets for llvm documentation OFF
> +#   Don't build llvm documentation
> +HOST_LLVM_CONF_OPTS += -DLLVM_INCLUDE_DOCS=OFF
> +
> +# * LLVM_ENABLE_DOXYGEN: Use doxygen to generate llvm API documentation OFF
> +#   Don't build llvm API documentation
> +HOST_LLVM_CONF_OPTS += -DLLVM_ENABLE_DOXYGEN=OFF
> +
> +# * LLVM_ENABLE_SPHINX: Use Sphinx to generate llvm documentation OFF
> +#   Don't build llvm documentation
> +HOST_LLVM_CONF_OPTS += -DLLVM_ENABLE_SPHINX=OFF
> +
> +# * LLVM_ENABLE_OCAMLDOC: Use OCaml bindings documentation OFF
> +#   Don't build llvm documentation
> +HOST_LLVM_CONF_OPTS += -DLLVM_ENABLE_OCAMLDOC=OFF

This is really verbose, and could be done in one assignment of
HOST_LLVM_CONF_OPTS, since it's obvious why we disable all this stuff.

> +# * LLVM_ENABLE_CXX1Y: Compile with C++1y enabled OFF
> +#   Enable C++ and C++11 support if BR2_INSTALL_LIBSTDCPP=y
> +HOST_LLVM_CONF_OPTS += -DLLVM_ENABLE_CXX1Y=$(if $(BR2_INSTALL_LIBSTDCPP),ON,OFF)

This looks weird. Is LLVM_ENABLE_CXX1Y about LLVM using C++11 ? If so
then it doesn't make sense to look at BR2_INSTALL_LIBSTDCPP, because
this option indicates a property of the target toolchain.

> +# Install libLLVM and tools in HOST_DIR/usr
> +HOST_LLVM_CONF_OPTS += -DCMAKE_INSTALL_PREFIX=$(HOST_DIR)/usr

This is not useful as CMAKE_INSTALL_PREFIX is already passed by the
package infrastructure, and it's actually wrong because the prefix for
all host tools should now be $(HOST_DIR).

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
