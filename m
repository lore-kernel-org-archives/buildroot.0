From: Matthew Weber <matthew.weber@collins.com>
Date: Thu, 11 Mar 2021 13:37:22 -0600
Subject: [Buildroot] [PATCH v11 4/9] package/libclc: bump version to
 11.1.0
In-Reply-To: <CANQCQpYpXG2_1JQp=8VJHtfmAEqXRPfQid5qeeDVYkdVVpSSBQ@mail.gmail.com>
References: <20210311142932.44985-1-matthew.weber@rockwellcollins.com>
 <20210311142932.44985-4-matthew.weber@rockwellcollins.com>
 <CANQCQpYpXG2_1JQp=8VJHtfmAEqXRPfQid5qeeDVYkdVVpSSBQ@mail.gmail.com>
Message-ID: <CANQCQpZGpLkvWwPpNPKjsygS83GBuTv6dDr63ePi0X7W+znLhg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

" Romain,

On Thu, Mar 11, 2021 at 8:35 AM Matthew Weber
<matthew.weber@rockwellcollins.com> wrote:
>
> Romain,
>
> On Thu, Mar 11, 2021 at 8:29 AM Matt Weber
> <matthew.weber@rockwellcollins.com> wrote:
> >
> >  * Converts to the cmake pkg type
> >  * Updates download site
> >  * Adds a crosscompile fixups patch
> >    * Allow prepare_builtins utility to be directly called
> >      (it isn't installed into the path when cross compiling)
> >    * Fix file_find() for root search limitation
> >
>
> Do you have a way to runtime test libclc?  I've verified mesa3d and
> the library all built correctly on x86 and ARM64
>
>
> > Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
> > ---
> >  .../0001-support-out-of-tree-build.patch      | 71 +++++++++++++++++++
> >  package/libclc/libclc.hash                    |  2 +-
> >  package/libclc/libclc.mk                      | 42 +++--------
> >  3 files changed, 83 insertions(+), 32 deletions(-)
> >  create mode 100644 package/libclc/0001-support-out-of-tree-build.patch
> >
> > diff --git a/package/libclc/0001-support-out-of-tree-build.patch b/package/libclc/0001-support-out-of-tree-build.patch
> > new file mode 100644
> > index 0000000000..918474c433
> > --- /dev/null
> > +++ b/package/libclc/0001-support-out-of-tree-build.patch
> > @@ -0,0 +1,71 @@
> > +From 495491e9d53bfb184c15753b5187e4bb55b19511 Mon Sep 17 00:00:00 2001
> > +From: Matt Weber <matthew.weber@rockwellcollins.com>
> > +Date: Tue, 9 Mar 2021 15:55:17 -0600
> > +Subject: [PATCH] support out of tree build
> > +
> > +(1) The package has a prepare_builtins tool which is built
> > +but not placed in the path for later use in the build. This
> > +fix allows the later build steps to use the binary in-place.
> > +
> > +(2) With cmake, find_file() when used for non-host builds is
> > +limited by CMAKE_FIND_ROOT_PATH* scope.
> > +
> > +In $(HOST_DIR)/share/buildroot/toolchainfile.cmake we set the
> > +following target settings for CMAKE_FIND_ROOT_PATH* which
> > +limit the scope.
> > +set(CMAKE_FIND_ROOT_PATH "${RELOCATED_HOST_DIR}/aarch64-buildroot-linux-gnu/sysroot")
> > +set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
> > +set(CMAKE_FIND_ROOT_PATH_MODE_PACKAGE ONLY)
> > +set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
> > +set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)
> > +
> > +
> > +Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
> > +---
> > + CMakeLists.txt                          | 2 +-
> > + cmake/CMakeDetermineCLCCompiler.cmake   | 4 ++++
> > + cmake/CMakeDetermineLLAsmCompiler.cmake | 4 ++++
> > + 3 files changed, 9 insertions(+), 1 deletion(-)
> > +
> > +diff --git a/CMakeLists.txt b/CMakeLists.txt
> > +index 9472f19..a784519 100644
> > +--- a/CMakeLists.txt
> > ++++ b/CMakeLists.txt
> > +@@ -279,7 +279,7 @@ foreach( t ${LIBCLC_TARGETS_TO_BUILD} )
> > +
> > +               # Add prepare target
> > +               add_custom_command( OUTPUT "${obj_suffix}"
> > +-                                  COMMAND prepare_builtins -o
> > ++                                  COMMAND ./prepare_builtins -o
> > +                                   "${obj_suffix}"
> > +                                   "builtins.opt.${obj_suffix}"
> > +                                   DEPENDS "opt.${obj_suffix}"
> > +diff --git a/cmake/CMakeDetermineCLCCompiler.cmake b/cmake/CMakeDetermineCLCCompiler.cmake
> > +index 94d85d9..5de6a48 100644
> > +--- a/cmake/CMakeDetermineCLCCompiler.cmake
> > ++++ b/cmake/CMakeDetermineCLCCompiler.cmake
> > +@@ -12,7 +12,7 @@ mark_as_advanced(CMAKE_CLC_ARCHIVE)
> > +
> > + set(CMAKE_CLC_COMPILER_ENV_VAR "CLC_COMPILER")
> > + set(CMAKE_CLC_ARCHIVE_ENV_VAR "CLC_LINKER")
> > +-find_file(clc_comp_in CMakeCLCCompiler.cmake.in PATHS ${CMAKE_ROOT}/Modules ${CMAKE_MODULE_PATH})
> > ++set(clc_comp_in "${CMAKE_MODULE_PATH}/CMakeCLCCompiler.cmake.in" )
> > + # configure all variables set in this file
> > + configure_file(${clc_comp_in} ${CMAKE_PLATFORM_INFO_DIR}/CMakeCLCCompiler.cmake @ONLY)
> > + mark_as_advanced(clc_comp_in)
> > +diff --git a/cmake/CMakeDetermineLLAsmCompiler.cmake b/cmake/CMakeDetermineLLAsmCompiler.cmake
> > +index 1c424c7..dd3bfb6 100644
> > +--- a/cmake/CMakeDetermineLLAsmCompiler.cmake
> > ++++ b/cmake/CMakeDetermineLLAsmCompiler.cmake
> > +@@ -18,7 +18,7 @@ mark_as_advanced(CMAKE_LLAsm_ARCHIVE)
> > + set(CMAKE_LLAsm_PREPROCESSOR_ENV_VAR "LL_PREPROCESSOR")
> > + set(CMAKE_LLAsm_COMPILER_ENV_VAR "LL_ASSEMBLER")
> > + set(CMAKE_LLAsm_ARCHIVE_ENV_VAR "LL_LINKER")
> > +-find_file(ll_comp_in CMakeLLAsmCompiler.cmake.in PATHS ${CMAKE_ROOT}/Modules ${CMAKE_MODULE_PATH})
> > ++set(ll_comp_in "${CMAKE_MODULE_PATH}/CMakeLLAsmCompiler.cmake.in" )
> > + # configure all variables set in this file
> > + configure_file(${ll_comp_in} ${CMAKE_PLATFORM_INFO_DIR}/CMakeLLAsmCompiler.cmake @ONLY)
> > + mark_as_advanced(ll_comp_in)
> > +--
> > +2.17.1
> > +
> > diff --git a/package/libclc/libclc.hash b/package/libclc/libclc.hash
> > index 2af64bc8e8..c670d92ed3 100644
> > --- a/package/libclc/libclc.hash
> > +++ b/package/libclc/libclc.hash
> > @@ -1,3 +1,3 @@
> >  # locally calculated
> > -sha256  54d7ae523aabf68d533011739d6c01546cae0c294442d0f44fd657c046cb707d  libclc-d1cbc92e2ceee59963f5c3a576382e5bba31f060-br1.tar.gz
> > +sha256  198dc45cdcc426c7968b9628a55062162ea338931157a18ddefb47188d119e1d  libclc-11.1.0.src.tar.xz
> >  sha256  3c536c052db9afd997809e38785c9f2a9e54e2892330fa7c5b438e18a7413479  LICENSE.TXT
> > diff --git a/package/libclc/libclc.mk b/package/libclc/libclc.mk
> > index 6fe8e10a77..d460adcf41 100644
> > --- a/package/libclc/libclc.mk
> > +++ b/package/libclc/libclc.mk
> > @@ -4,43 +4,23 @@
> >  #
> >  ################################################################################
> >
> > -# Use the latest commit from release_90 branch.
> > -LIBCLC_VERSION = d1cbc92e2ceee59963f5c3a576382e5bba31f060
> > -LIBCLC_SITE = https://github.com/llvm-mirror/libclc
> > -LIBCLC_SITE_METHOD = git
> > +LIBCLC_VERSION = 11.1.0
> > +LIBCLC_SITE = https://github.com/llvm/llvm-project/releases/download/llvmorg-$(LIBCLC_VERSION)
> > +LIBCLC_SOURCE = libclc-$(LIBCLC_VERSION).src.tar.xz
> >  LIBCLC_LICENSE = Apache-2.0 with exceptions or MIT
> >  LIBCLC_LICENSE_FILES = LICENSE.TXT
> >
> >  LIBCLC_DEPENDENCIES = host-clang host-llvm
> >  LIBCLC_INSTALL_STAGING = YES
> >
> > -# C++ compiler is used to build a small tool (prepare-builtins) for the host.
> > -# It must be built with the C++ compiler from the host.
> > +# CMAKE_*_COMPILER_FORCED=ON skips testing the tools and assumes
> > +# llvm-config provided values
> >  #
> > -# The headers are installed in /usr/share and not /usr/include,
> > -# because they are needed at runtime on the target to build the OpenCL
> > -# kernels.
> > +# CMAKE_CXX_COMPILER has to be set to the host compiler to build a host
> > +# 'prepare_builtins' tool used during the build process
> >  LIBCLC_CONF_OPTS = \
> > -       --with-llvm-config=$(HOST_DIR)/usr/bin/llvm-config \
> > -       --prefix=/usr \
> > -       --includedir=/usr/share \
> > -       --pkgconfigdir=/usr/lib/pkgconfig \
> > -       --with-cxx-compiler=$(HOSTCXX_NOCCACHE)
> > +       -DCMAKE_CLC_COMPILER_FORCED=ON \
> > +       -DCMAKE_LLAsm_COMPILER_FORCED=ON \
> > +       -DCMAKE_CXX_COMPILER="$(CMAKE_HOST_CXX_COMPILER)"

Looks like I have a couple of bugs (I didn't have opencl checked in menuconfig)

1) mesa3d.mk needs MESA3D_MESON_EXTRA_BINARIES +=
llvm-config='$(STAGING_DIR)/bin/llvm-config' updated to point to the
HOST_DIR llvm-config because it needs to be able to execute the tool.
However this doesn't work since then you get the
"host/lib/libLLVM-11.so when searching for -lLLVM-11 " error which
makes sense since that's the host llvm-config we pointed at.....
Unsure how to solve this one and we don't notice it in x86 builds.
When you enable the AMD Radeon to build for aarch64 you can cause this
error.

2) mesa3d doesn't quite build (pkgconfig can't find libclc).  I didn't
catch that CMAKE_INSTALL_PREFIX is getting ignored (we set it in the
pkg-cmake.mk infra) so the libclc.pc is getting installed in
$HOST_DIR/usr/local/share vs $HOST_DIR/usr/share .  I haven't been
able to figure out why the value doesn't take hold (ie after the
configuration step libclc-11.1.0/CMakeCache.txt still shows /usr/local
unless I force set the CMAKE_INSTALL_PREFIX value in
libclc-11.1.0/CMakeList.txt before project().


Matt
