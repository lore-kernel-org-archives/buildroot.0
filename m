From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 24 Jan 2017 18:21:10 +1300
Subject: [Buildroot] [git commit] package/x265: Disable -march selection
	from CMakeLists.txt
Message-ID: <20170124052116.8E8D081EC3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=52ef38396a814c468b0b713d3ff95b36b3791832
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes
http://autobuild.buildroot.net/results/996/9961313a870b833b48438d8d258c5b5323025790/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/x265/0001-fix-gcc-options.patch | 52 +++++++++++++++++++++++++++++++++
 1 file changed, 52 insertions(+)

diff --git a/package/x265/0001-fix-gcc-options.patch b/package/x265/0001-fix-gcc-options.patch
new file mode 100644
index 0000000..8151821
--- /dev/null
+++ b/package/x265/0001-fix-gcc-options.patch
@@ -0,0 +1,52 @@
+# HG changeset patch
+# User Bertrand Jacquin <bertrand@jacquin.bzh>
+# Date 1444431941 -3600
+# Node ID 5c6d2a6f2f9a0534933cc999b3845be4344e1af0
+# Parent  b6156a08b1def3584647f26096866c1a0c11e54a
+build: Disable -march selection from CMakeLists.txt
+
+x32 arch as defined on https://sites.google.com/site/x32abi is neither
+X86 nor X64, then forcing -march=i686 leads to build failure as wrong
+-march is used.
+
+Forcing -march, -mfloat-abi and -mfpu for ARM is also wrong
+
+As a global sanity sake, disable all forced -march in CMakeLists
+
+Backported from upstream pull request:
+https://bitbucket.org/multicoreware/x265/pull-requests/21
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+
+diff -r 58dddcf01b7d source/CMakeLists.txt
+--- a/source/CMakeLists.txt	Mon Jan 23 09:50:33 2017 +0530
++++ b/source/CMakeLists.txt	Mon Jan 23 21:03:10 2017 +0100
+@@ -194,28 +194,6 @@
+     if(NATIVE_BUILD)
+         if(INTEL_CXX)
+             add_definitions(-xhost)
+-        else()
+-            add_definitions(-march=native)
+-        endif()
+-    elseif(X86 AND NOT X64)
+-        string(FIND "${CMAKE_CXX_FLAGS}" "-march" marchPos)
+-        if(marchPos LESS "0")
+-            add_definitions(-march=i686)
+-            if(WIN32 AND NOT INTEL_CXX AND NOT CLANG AND
+-               CMAKE_CXX_COMPILER_VERSION VERSION_GREATER 6.0 AND CMAKE_CXX_COMPILER_VERSION VERSION_LESS 7.0)
+-                add_definitions(-mpreferred-stack-boundary=2)
+-            endif()
+-        endif()
+-    endif()
+-    if(ARM AND CROSS_COMPILE_ARM)
+-        set(ARM_ARGS -march=armv6 -mfloat-abi=soft -mfpu=vfp -marm -fPIC)
+-    elseif(ARM)
+-        find_package(Neon)
+-        if(CPU_HAS_NEON)
+-            set(ARM_ARGS -mcpu=native -mfloat-abi=hard -mfpu=neon -marm -fPIC)
+-            add_definitions(-DHAVE_NEON)
+-        else()
+-            set(ARM_ARGS -mcpu=native -mfloat-abi=hard -mfpu=vfp -marm)
+         endif()
+     endif()
+     add_definitions(${ARM_ARGS})
