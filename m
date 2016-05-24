From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 24 May 2016 22:10:01 +0200
Subject: [Buildroot] [PATCH 0/2] pulseview: fix build failures
In-Reply-To: <1435660874-14116-1-git-send-email-bgolaszewski@baylibre.com>
References: <1435660874-14116-1-git-send-email-bgolaszewski@baylibre.com>
Message-ID: <20160524221001.2a2fce00@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Bartosz,

On Tue, 30 Jun 2015 12:41:12 +0200, Bartosz Golaszewski wrote:
> Autobuilders frequently report the following issue with pulseview:
>   http://autobuild.buildroot.net/results/993/993622312239fe56946fdde4d3dfec73786393e5/build-end.log
> 
> It's caused by passing a nullptr as argument where
> boost::optional<std::pair<(...)> > is expected. Commit ec6cc07f
> fixed the issue in PulseView and the second patch makes buildroot
> use it when building PV. The first patch is needed too due to some
> API changes in libsigrokcxx.
> 
> NOTE: this builds fine on x86 and actually also used to build
> properly on other architectures at commit edbeeef. Something must
> have changed along the way that exposed the bug.

We are still seeing some build issue with the pulseview package, on the
SPARC architecture:

  http://autobuild.buildroot.org/results/1e3/1e3101261252d5f30fdf842cc99604e4f4c25eef/build-end.log

On SPARC, when the __atomic intrinsics are used, you must link with the
libatomic library (which is part of the toolchain). When you take the
pulseview link command line, and just add "-latomic", it links fine. So
I've tried to add some CMake logic to have pulseview link against
libatomic when needed. This CMake logic is inspired (copied) from LLVM,
and looks like this:

include(CheckCXXSourceCompiles)

function(check_working_cxx_atomics varname)
  set(OLD_CMAKE_REQUIRED_FLAGS ${CMAKE_REQUIRED_FLAGS})
  set(CMAKE_REQUIRED_FLAGS "-std=c++11")
  CHECK_CXX_SOURCE_COMPILES("
#include <atomic>
std::atomic<int> x;
int main() {
  return x;
}
" ${varname})
  set(CMAKE_REQUIRED_FLAGS ${OLD_CMAKE_REQUIRED_FLAGS})
endfunction(check_working_cxx_atomics)

# First check if atomics work without the library.
check_working_cxx_atomics(HAVE_CXX_ATOMICS_WITHOUT_LIB)
# If not, check if the library exists, and atomics work with it.
if(NOT HAVE_CXX_ATOMICS_WITHOUT_LIB)
  check_library_exists(atomic __atomic_fetch_add_4 "" HAVE_LIBATOMIC)
  if( HAVE_LIBATOMIC )
    list(APPEND CMAKE_REQUIRED_LIBRARIES "atomic")
    check_working_cxx_atomics(HAVE_CXX_ATOMICS_WITH_LIB)
    if (NOT HAVE_CXX_ATOMICS_WITH_LIB)
      message(FATAL_ERROR "Host compiler must support std::atomic!")
    endif()
  else()
    message(FATAL_ERROR "Host compiler appears to require libatomic, but cannot find it.")
  endif()
endif()

Unfortunately, for some reason the sample code in this check builds
just fine without -latomic, and therefore HAVE_CXX_ATOMICS_WITHOUT_LIB
gets defined and -latomic is not added to the libraries to link with.

Could you investigate this issue, and see which CMake check can be
written to make sure we link against libatomic when needed?

Here is a minimal defconfig that reproduces the problem:

BR2_sparc=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-sparc-uclibc-2016.05-rc1-2-g44038df.tar.bz2"
BR2_TOOLCHAIN_EXTERNAL_GCC_4_9=y
BR2_TOOLCHAIN_EXTERNAL_HEADERS_3_14=y
BR2_TOOLCHAIN_EXTERNAL_LOCALE=y
# BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS_DEBUG is not set
BR2_TOOLCHAIN_EXTERNAL_INET_RPC=y
BR2_TOOLCHAIN_EXTERNAL_CXX=y
BR2_INIT_NONE=y
BR2_SYSTEM_BIN_SH_NONE=y
# BR2_PACKAGE_BUSYBOX is not set
BR2_PACKAGE_QT5=y
BR2_PACKAGE_QT5BASE_LICENSE_APPROVED=y
BR2_PACKAGE_PULSEVIEW=y
# BR2_TARGET_ROOTFS_TAR is not set

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
