From: Romain Naour <romain.naour@openwide.fr>
Date: Thu, 05 Mar 2015 00:30:59 +0100
Subject: [Buildroot] [PATCH 8/8] package/cmake: only build what is
	necessary
In-Reply-To: <1422220435-18689-9-git-send-email-s.martin49@gmail.com>
References: <1422220435-18689-1-git-send-email-s.martin49@gmail.com>
 <1422220435-18689-9-git-send-email-s.martin49@gmail.com>
Message-ID: <54F795B3.9070803@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Samuel,

Le 25/01/2015 22:13, Samuel Martin a ?crit :
> Add a patch allowing to select the binaries to be built.
> 
> After applying this change, the time to build host-cmake is roughly
> 25% shorter.
> 
> Signed-off-by: Samuel Martin <s.martin49@gmail.com>
> 
> ---

Here are my results without and with your patch:

without the patch BR2_JLEVEL=1:
real	4m59.761s user	3m46.531s sys	0m24.404s

without the patch BR2_JLEVEL=5:
real	3m25.126s user	4m2.761s sys	0m24.406s

With the patch BR2_JLEVEL=1:
real	3m37.735s user	2m45.789s sys	0m18.675s

With the patch BR2_JLEVEL=5:
real	2m31.274s user	2m58.932s sys	0m18.779s

Reviewed-by: Romain Naour <romain.naour@openwide.fr>
Tested-by: Romain Naour <romain.naour@openwide.fr>

> Here is the actual results of the build I run on my machine:
> 
> 4x Intel(R) Core(TM) i7-4510U CPU @ 2.00GHz
> 8GB RAM
> SSD
> 
> w/o the patch, automatic job-level (i.e. 5 in my case):
>   675.36user 29.59system 4:21.72elapsed 269%CPU
>   686.98user 31.07system 4:26.85elapsed 269%CPU
>   694.84user 31.11system 4:35.42elapsed 263%CPU
>   697.24user 31.19system 4:32.17elapsed 267%CPU
>   686.62user 30.89system 4:23.00elapsed 272%CPU
>   696.28user 31.33system 4:29.15elapsed 270%CPU
>   677.73user 30.18system 4:15.15elapsed 277%CPU
>   692.62user 31.45system 4:47.56elapsed 251%CPU
>   679.78user 31.53system 4:20.99elapsed 272%CPU
>   685.63user 32.10system 4:28.15elapsed 267%CPU
> 
> w/o the patch, w/ BR2_JLEVEL=1:
>   340.58user 18.57system 6:19.26elapsed 94%CPU
>   337.48user 18.70system 6:16.41elapsed 94%CPU
>   335.39user 18.53system 6:13.74elapsed 94%CPU
>   335.93user 17.94system 6:13.84elapsed 94%CPU
>   335.49user 18.19system 6:13.67elapsed 94%CPU
> 
> w/ the patch, automatic job-level (i.e. 5 in my case):
>   494.96user 23.91system 3:13.87elapsed 267%CPU
>   506.90user 24.37system 3:16.83elapsed 269%CPU
>   504.37user 24.42system 3:17.57elapsed 267%CPU
>   499.79user 24.19system 3:04.50elapsed 284%CPU
>   507.02user 23.67system 3:04.93elapsed 286%CPU
>   510.93user 24.43system 3:08.19elapsed 284%CPU
>   512.43user 24.16system 3:08.53elapsed 284%CPU
>   510.80user 24.65system 3:08.64elapsed 283%CPU
>   512.28user 24.38system 3:09.62elapsed 283%CPU
>   514.90user 24.46system 3:08.96elapsed 285%CPU
> 
> w/ the patch, w/ BR2_JLEVEL=1:
>   244.56user 14.88system 4:36.88elapsed 93%CPU
>   247.02user 15.43system 4:39.89elapsed 93%CPU
>   247.14user 15.04system 4:39.76elapsed 93%CPU
>   246.32user 14.75system 4:38.93elapsed 93%CPU
>   247.53user 14.64system 4:40.27elapsed 93%CPU
> ---
>  ...-allow-to-select-what-program-to-be-built.patch | 231 +++++++++++++++++++++
>  package/cmake/cmake.mk                             |   4 +
>  2 files changed, 235 insertions(+)
>  create mode 100644 package/cmake/0001-CMake-allow-to-select-what-program-to-be-built.patch
> 
> diff --git a/package/cmake/0001-CMake-allow-to-select-what-program-to-be-built.patch b/package/cmake/0001-CMake-allow-to-select-what-program-to-be-built.patch
> new file mode 100644
> index 0000000..d6e53da
> --- /dev/null
> +++ b/package/cmake/0001-CMake-allow-to-select-what-program-to-be-built.patch
> @@ -0,0 +1,231 @@
> +From 9aeb3ea5f9c69bbc9a69672762d5fae939c3fd8c Mon Sep 17 00:00:00 2001
> +From: Samuel Martin <s.martin49@gmail.com>
> +Date: Sun, 25 Jan 2015 18:11:13 +0100
> +Subject: [PATCH] CMake: allow to select what program to be built
> +
> +Signed-off-by: Samuel Martin <s.martin49@gmail.com>
> +---
> + CMakeLists.txt        | 24 ++++++++++++++++++++++++
> + Source/CMakeLists.txt | 33 ++++++++++++++++++++++++++++++++-
> + 2 files changed, 56 insertions(+), 1 deletion(-)
> +
> +diff --git a/CMakeLists.txt b/CMakeLists.txt
> +index 71850de..cb9375e 100644
> +--- a/CMakeLists.txt
> ++++ b/CMakeLists.txt
> +@@ -43,6 +43,16 @@ if(CMAKE_ENCODING_UTF8)
> +   set(KWSYS_ENCODING_DEFAULT_CODEPAGE CP_UTF8)
> + endif()
> + 
> ++# options to select what programs to be built
> ++option(BUILD_CMAKE "Build cmake program" ON)
> ++mark_as_advanced(BUILD_CMAKE)
> ++
> ++option(BUILD_CTEST "Build ctest program" ON)
> ++mark_as_advanced(BUILD_CTEST)
> ++
> ++option(BUILD_CPACK "Build cpack program" ON)
> ++mark_as_advanced(BUILD_CPACK)
> ++
> + #-----------------------------------------------------------------------
> + # a macro to deal with system libraries, implemented as a macro
> + # simply to improve readability of the main script
> +@@ -241,6 +251,7 @@ macro (CMAKE_BUILD_UTILITIES)
> + 
> +   #---------------------------------------------------------------------
> +   # Build zlib library for Curl, CMake, and CTest.
> ++  if(BUILD_CMAKE OR BUILD_CTEST OR NOT CMAKE_USE_SYSTEM_CURL)
> +   set(CMAKE_ZLIB_HEADER "cm_zlib.h")
> +   if(CMAKE_USE_SYSTEM_ZLIB)
> +     find_package(ZLIB)
> +@@ -256,9 +267,11 @@ macro (CMAKE_BUILD_UTILITIES)
> +     add_subdirectory(Utilities/cmzlib)
> +     CMAKE_SET_TARGET_FOLDER(cmzlib "Utilities/3rdParty")
> +   endif()
> ++  endif()
> + 
> +   #---------------------------------------------------------------------
> +   # Build Curl library for CTest.
> ++  if(BUILD_CMAKE OR BUILD_CTEST)
> +   if(CMAKE_USE_SYSTEM_CURL)
> +     find_package(CURL)
> +     if(NOT CURL_FOUND)
> +@@ -284,9 +297,11 @@ macro (CMAKE_BUILD_UTILITIES)
> +     CMAKE_SET_TARGET_FOLDER(cmcurl "Utilities/3rdParty")
> +     CMAKE_SET_TARGET_FOLDER(LIBCURL "Utilities/3rdParty")
> +   endif()
> ++  endif()
> + 
> +   #---------------------------------------------------------------------
> +   # Build Compress library for CTest.
> ++  if(BUILD_CMAKE OR BUILD_CTEST)
> +   set(CMAKE_COMPRESS_INCLUDES
> +     "${CMAKE_CURRENT_BINARY_DIR}/Utilities/cmcompress")
> +   set(CMAKE_COMPRESS_LIBRARIES "cmcompress")
> +@@ -301,6 +316,7 @@ macro (CMAKE_BUILD_UTILITIES)
> +     add_subdirectory(Utilities/cmbzip2)
> +     CMAKE_SET_TARGET_FOLDER(cmbzip2 "Utilities/3rdParty")
> +   endif()
> ++  endif()
> + 
> +   #---------------------------------------------------------------------
> +   # Build or use system liblzma for libarchive.
> +@@ -321,6 +337,7 @@ macro (CMAKE_BUILD_UTILITIES)
> + 
> +   #---------------------------------------------------------------------
> +   # Build or use system libarchive for CMake and CTest.
> ++  if(BUILD_CMAKE OR BUILD_CTEST)
> +   if(CMAKE_USE_SYSTEM_LIBARCHIVE)
> +     find_package(LibArchive)
> +     if(NOT LibArchive_FOUND)
> +@@ -347,9 +364,11 @@ macro (CMAKE_BUILD_UTILITIES)
> +     CMAKE_SET_TARGET_FOLDER(cmlibarchive "Utilities/3rdParty")
> +     set(CMAKE_TAR_LIBRARIES cmlibarchive ${BZIP2_LIBRARIES})
> +   endif()
> ++  endif()
> + 
> +   #---------------------------------------------------------------------
> +   # Build expat library for CMake and CTest.
> ++  if(BUILD_CMAKE OR BUILD_CTEST)
> +   if(CMAKE_USE_SYSTEM_EXPAT)
> +     find_package(EXPAT)
> +     if(NOT EXPAT_FOUND)
> +@@ -364,9 +383,11 @@ macro (CMAKE_BUILD_UTILITIES)
> +     add_subdirectory(Utilities/cmexpat)
> +     CMAKE_SET_TARGET_FOLDER(cmexpat "Utilities/3rdParty")
> +   endif()
> ++  endif()
> + 
> +   #---------------------------------------------------------------------
> +   # Build XMLRPC library for CMake and CTest.
> ++  if(BUILD_CMAKE OR BUILD_CTEST)
> +   if(CTEST_USE_XMLRPC)
> +     find_package(XMLRPC QUIET REQUIRED libwww-client)
> +     if(NOT XMLRPC_FOUND)
> +@@ -376,6 +397,7 @@ macro (CMAKE_BUILD_UTILITIES)
> +     set(CMAKE_XMLRPC_INCLUDES ${XMLRPC_INCLUDE_DIRS})
> +     set(CMAKE_XMLRPC_LIBRARIES ${XMLRPC_LIBRARIES})
> +   endif()
> ++  endif()
> + 
> +   #---------------------------------------------------------------------
> +   # Use curses?
> +@@ -583,7 +605,9 @@ if(NOT CMake_TEST_EXTERNAL_CMAKE)
> +   add_subdirectory(Utilities)
> + endif()
> + 
> ++if(BUILD_CTEST)
> + add_subdirectory(Tests)
> ++endif()
> + 
> + if(NOT CMake_TEST_EXTERNAL_CMAKE)
> +   if(BUILD_TESTING)
> +diff --git a/Source/CMakeLists.txt b/Source/CMakeLists.txt
> +index f9405b3..2e14def 100644
> +--- a/Source/CMakeLists.txt
> ++++ b/Source/CMakeLists.txt
> +@@ -481,6 +481,7 @@ if(WIN32 AND NOT CYGWIN AND NOT BORLAND)
> + endif()
> + 
> + # create a library used by the command line and the GUI
> ++if(BUILD_CMAKE)
> + add_library(CMakeLib ${SRCS})
> + target_link_libraries(CMakeLib cmsys
> +   ${CMAKE_EXPAT_LIBRARIES} ${CMAKE_ZLIB_LIBRARIES}
> +@@ -496,6 +497,7 @@ endif()
> + if(CMAKE_BUILD_ON_VISUAL_STUDIO OR MINGW)
> +   target_link_libraries(CMakeLib rpcrt4)
> + endif()
> ++endif()
> + 
> + #
> + # CTestLib
> +@@ -565,8 +567,10 @@ set(CTEST_SRCS cmCTest.cxx
> +   )
> + 
> + # Build CTestLib
> ++if(BUILD_CTEST)
> + add_library(CTestLib ${CTEST_SRCS})
> + target_link_libraries(CTestLib CMakeLib ${CMAKE_CURL_LIBRARIES} ${CMAKE_XMLRPC_LIBRARIES})
> ++endif()
> + 
> + #
> + # Sources for CPack
> +@@ -628,9 +632,12 @@ if(APPLE)
> + endif()
> + 
> + # Build CPackLib
> ++if(BUILD_CPACK)
> + add_library(CPackLib ${CPACK_SRCS})
> + target_link_libraries(CPackLib CMakeLib)
> ++endif()
> + 
> ++if(BUILD_CMAKE)
> + if(APPLE)
> +   add_executable(cmakexbuild cmakexbuild.cxx)
> +   target_link_libraries(cmakexbuild CMakeLib)
> +@@ -639,36 +646,60 @@ if(APPLE)
> +   target_link_libraries(OSXScriptLauncher cmsys)
> +   target_link_libraries(OSXScriptLauncher "-framework CoreFoundation")
> + endif()
> ++endif()
> + 
> + # Build CMake executable
> ++if(BUILD_CMAKE)
> + add_executable(cmake cmakemain.cxx cmcmd.cxx cmcmd.h)
> + target_link_libraries(cmake CMakeLib)
> ++endif()
> + 
> + # Build CTest executable
> ++if(BUILD_CTEST)
> + add_executable(ctest ctest.cxx)
> + target_link_libraries(ctest CTestLib)
> ++endif()
> + 
> + # Build CPack executable
> ++if(BUILD_CPACK)
> + add_executable(cpack CPack/cpack.cxx)
> + target_link_libraries(cpack CPackLib)
> ++endif()
> + 
> + # Curses GUI
> ++if(BUILD_CMAKE)
> + if(BUILD_CursesDialog)
> +   include(${CMake_SOURCE_DIR}/Source/CursesDialog/CMakeLists.txt)
> + endif()
> ++endif()
> + 
> + # Qt GUI
> + option(BUILD_QtDialog "Build Qt dialog for CMake" FALSE)
> ++if(BUILD_CMAKE)
> + if(BUILD_QtDialog)
> +   add_subdirectory(QtDialog)
> + endif()
> ++endif()
> + 
> + include (${CMake_BINARY_DIR}/Source/LocalUserOptions.cmake OPTIONAL)
> + include (${CMake_SOURCE_DIR}/Source/LocalUserOptions.cmake OPTIONAL)
> + 
> +-install(TARGETS cmake ctest cpack DESTINATION bin)
> ++if(BUILD_CMAKE)
> ++install(TARGETS cmake DESTINATION bin)
> ++endif()
> ++
> ++if(BUILD_CTEST)
> ++install(TARGETS ctest DESTINATION bin)
> ++endif()
> ++
> ++if(BUILD_CPACK)
> ++install(TARGETS cpack DESTINATION bin)
> ++endif()
> ++
> ++if(BUILD_CMAKE)
> + if(APPLE)
> +   install(TARGETS cmakexbuild DESTINATION bin)
> + endif()
> ++endif()
> + 
> + install(FILES cmCPluginAPI.h DESTINATION ${CMAKE_DATA_DIR}/include)
> +-- 
> +2.2.2
> +
> diff --git a/package/cmake/cmake.mk b/package/cmake/cmake.mk
> index 14d5a4e..664885f 100644
> --- a/package/cmake/cmake.mk
> +++ b/package/cmake/cmake.mk
> @@ -22,6 +22,10 @@ define HOST_CMAKE_CONFIGURE_CMDS
>  			-DCMAKE_CXX_FLAGS="$(HOST_CXXFLAGS)" \
>  			-DCMAKE_EXE_LINKER_FLAGS="$(HOST_LDFLAGS)" \
>  			-DBUILD_CursesDialog=OFF \
> +			-DBUILD_CMAKE=ON \
> +			-DBUILD_CTEST=OFF \
> +			-DBUILD_CPACK=OFF \
> +			-DBUILD_TESTING=OFF \
>  	)
>  endef
>  
> 

-- 
Romain Naour

OPEN WIDE Ing?nierie - Paris
23/25, rue Daviel| 75013 PARIS
http://ingenierie.openwide.fr

Le blog des technologies libres et embarqu?es :
http://www.linuxembedded.fr
