From: Samuel Martin <s.martin49@gmail.com>
Date: Sat, 27 Aug 2016 11:03:39 +0200
Subject: [Buildroot] [PATCH] package/kmsxx: add patch to fix LTO support
In-Reply-To: <20160826213442.19246-1-arnout@mind.be>
References: <20160826213442.19246-1-arnout@mind.be>
Message-ID: <C235CE6F-F057-45DA-840A-5C5B7944FCE1@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

On August 26, 2016 11:34:42 PM GMT+02:00, "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be> wrote:
>The LTO support in the kmsxx package uses the host gcc-ar and
>gcc-ranlib
>instead of the ones from the cross-toolchain. Add a patch that tries to
>find the right one based on CMAKE_C_COMPILER.
>
>Fixes:
>http://autobuild.buildroot.net/results/16a/16a38a4277dd1152a5955d62cb92f85447791ef3
>
>Possibly also fixes:
>http://autobuild.buildroot.net/results/f3c/f3c48da3a9706cd366c0e0a96c3cd0ff959f2a78
>(it fails later, possibly because an incompatible host ar)
>
>Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
>Cc: Samuel Martin <s.martin49@gmail.com>
>Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
>---
>Thomas P. proposed to instead add a variable for LTO_AR and LTO_RANLIB
>that we would override. However, this version works and is upstreamable
>and currently we don't even "know" if cross-gcc-ar exists or not.
>
>CMake actually has a target property INTERPROCEDURAL_OPTIMIZATION but
>it seems that this is currently only implemented for Intel ICC. Cfr.
>https://cmake.org/Bug/view.php?id=15939
>---
>...001-Fix-LTO-support-for-cross-compilation.patch | 45
>++++++++++++++++++++++
> 1 file changed, 45 insertions(+)
>create mode 100644
>package/kmsxx/0001-Fix-LTO-support-for-cross-compilation.patch
>
>diff --git
>a/package/kmsxx/0001-Fix-LTO-support-for-cross-compilation.patch
>b/package/kmsxx/0001-Fix-LTO-support-for-cross-compilation.patch
>new file mode 100644
>index 0000000..9b4a582
>--- /dev/null
>+++ b/package/kmsxx/0001-Fix-LTO-support-for-cross-compilation.patch
>@@ -0,0 +1,45 @@
>+From 5da1f631bc753655ac94b08a6233eecd0d451327 Mon Sep 17 00:00:00 2001
>+From: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>
>+Date: Fri, 26 Aug 2016 21:55:06 +0200
>+Subject: [PATCH] Fix LTO support for cross-compilation.
>+
>+When cross-compiling, the ar and ranlib to be used for LTO are
>prefixed
>+by the cross-tuple. gcc-ar and gcc-ranlib may not exist. Cfr.
>+http://autobuild.buildroot.net/results/f3c/f3c48da3a9706cd366c0e0a96c3cd0ff959f2a78/
>+
>+Therefore, search for an appropriate lto-ar and lto-ranlib before
>+enabling LTO.
>+
>+Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
>+---
>+Submitted upstream: https://github.com/tomba/kmsxx/pull/14
>+---
>+ CMakeLists.txt | 12 +++++++++---
>+ 1 file changed, 9 insertions(+), 3 deletions(-)
>+
>+diff --git a/CMakeLists.txt b/CMakeLists.txt
>+index e5b5ea5..c61c81d 100644
>+--- a/CMakeLists.txt
>++++ b/CMakeLists.txt
>+@@ -39,9 +39,15 @@ if (NOT ${U_CMAKE_BUILD_TYPE} MATCHES DEBUG)
>+     CHECK_CXX_COMPILER_FLAG("-flto" HAS_LTO_FLAG)
>+ 
>+     if (HAS_LTO_FLAG)
>+-        set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -flto")
>+-        set(CMAKE_AR gcc-ar)
>+-        set(CMAKE_RANLIB gcc-ranlib)
>++        find_program(LTO_AR NAMES "${CMAKE_C_COMPILER}-ar" gcc-ar)
>++        find_program(LTO_RANLIB NAMES "${CMAKE_C_COMPILER}-ranlib"
>/usr/bin/gcc-ranlib)
>++        if (LTO_AR AND LTO_RANLIB)
>++            set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -flto")
>++            set(CMAKE_AR "${LTO_AR}")
>++            set(CMAKE_RANLIB "${LTO_RANLIB}")

These definitions belong to the toolchainfile.cmake file IMHO, but it can be moved there in a follow-up patch.

Regards,

>++        else()
>++            message(STATUS "gcc-ar or gcc-ranlib not found, disabling
>LTO")
>++        endif()
>+     endif()
>+ endif()
>+ 
>+-- 
>+2.9.3
>+

-- 
Samuel
