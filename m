From: Adrian Perez de Castro <aperez@igalia.com>
Date: Mon, 30 Sep 2019 11:59:58 +0300
Subject: [Buildroot] [PATCH v2 1/1] cmake: bump version to 3.15.3
In-Reply-To: <20190929115731.128904-1-james.hilliard1@gmail.com>
References: <20190929115731.128904-1-james.hilliard1@gmail.com>
Message-ID: <20190930115958.GB255313@momiji>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 29 Sep 2019 05:57:31 -0600, James Hilliard <james.hilliard1@gmail.com> wrote:
> Remove FindLibUV patch which is now upstream.
> 
> Resync/reformat rename cmake rootfile patch for 3.15.3 with git format-patch.
> 
> Set cmake version min to 3.10.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Reviewed-by: Adrian Perez de Castro <aperez@igalia.com>

> ---
> Changes v1 -> v2:
>   - Set cmake version min to 3.10.
> ---
>  ...patch => 0001-rename-cmake-rootfile.patch} | 32 +++++++++++++------
>  ...k-uv-version-h-for-version-detection.patch | 32 -------------------
>  package/cmake/cmake.hash                      |  6 ++--
>  package/cmake/cmake.mk                        |  4 +--
>  support/dependencies/check-host-cmake.mk      |  4 +--
>  5 files changed, 30 insertions(+), 48 deletions(-)
>  rename package/cmake/{0001-rename_cmake_rootfile.patch => 0001-rename-cmake-rootfile.patch} (50%)
>  delete mode 100644 package/cmake/0002-FindLibUV-Also-check-uv-version-h-for-version-detection.patch
> 
> diff --git a/package/cmake/0001-rename_cmake_rootfile.patch b/package/cmake/0001-rename-cmake-rootfile.patch
> similarity index 50%
> rename from package/cmake/0001-rename_cmake_rootfile.patch
> rename to package/cmake/0001-rename-cmake-rootfile.patch
> index 8c168c15a8..29d7df2d29 100644
> --- a/package/cmake/0001-rename_cmake_rootfile.patch
> +++ b/package/cmake/0001-rename-cmake-rootfile.patch
> @@ -1,3 +1,8 @@
> +From f7291b1decd24a4e9530f98d7723fb55f38223ea Mon Sep 17 00:00:00 2001
> +From: Davide Viti <zinosat@tiscali.it>
> +Date: Thu, 14 Jul 2016 10:14:59 +0100
> +Subject: [PATCH] rename cmake rootfile
> +
>  ctest fails on the target, because it cannot find CMake.cmake inside
>  CMAKE_DATA_DIR (typically set to "/usr/share/cmake-3.0"): all *.cmake
>  files are removed at build time via the target-finalize rule.
> @@ -6,24 +11,33 @@ This buildroot-specific patch makes sure ctest looks also for
>  "Modules/CMake.cmake.ctest" before complaining
>  
>  [Vincent: tweak patch for 3.6.3]
> +[James: tweak patch for 3.15.3]
>  
>  Signed-off-by: Davide Viti <zinosat@tiscali.it>
>  Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
> +Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> +---
> + Source/cmake.cxx | 7 ++++++-
> + 1 file changed, 6 insertions(+), 1 deletion(-)
>  
> -diff -rup a/Source/cmake.cxx b/Source/cmake.cxx
> ---- a/Source/cmake.cxx	2016-07-07 15:47:27.000000000 +0100
> -+++ b/Source/cmake.cxx	2016-07-14 10:14:59.914265515 +0100
> -@@ -771,7 +771,12 @@ int cmake::AddCMakePaths()
> -                       "Path to cpack program executable.", cmState::INTERNAL);
> +diff --git a/Source/cmake.cxx b/Source/cmake.cxx
> +index 3772f09985..c317e4af38 100644
> +--- a/Source/cmake.cxx
> ++++ b/Source/cmake.cxx
> +@@ -1009,7 +1009,12 @@ int cmake::AddCMakePaths()
> +     "Path to cpack program executable.", cmStateEnums::INTERNAL);
>   #endif
>     if (!cmSystemTools::FileExists(
> --        (cmSystemTools::GetCMakeRoot() + "/Modules/CMake.cmake").c_str())) {
> -+        (cmSystemTools::GetCMakeRoot() + "/Modules/CMake.cmake").c_str()) &&
> -+	!cmSystemTools::FileExists(
> -+	  (cmSystemTools::GetCMakeRoot()+"/Modules/CMake.cmake.ctest").c_str()
> +-        (cmSystemTools::GetCMakeRoot() + "/Modules/CMake.cmake"))) {
> ++        (cmSystemTools::GetCMakeRoot() + "/Modules/CMake.cmake")) &&
> ++        !cmSystemTools::FileExists(
> ++          (cmSystemTools::GetCMakeRoot()+"/Modules/CMake.cmake.ctest")
>  +        )
>  +     )
>  +  {
>       // couldn't find modules
>       cmSystemTools::Error(
>         "Could not find CMAKE_ROOT !!!\n"
> +-- 
> +2.20.1
> +
> diff --git a/package/cmake/0002-FindLibUV-Also-check-uv-version-h-for-version-detection.patch b/package/cmake/0002-FindLibUV-Also-check-uv-version-h-for-version-detection.patch
> deleted file mode 100644
> index 9abf1a538f..0000000000
> --- a/package/cmake/0002-FindLibUV-Also-check-uv-version-h-for-version-detection.patch
> +++ /dev/null
> @@ -1,32 +0,0 @@
> -From 92c4b3d900a24512967a960f108d985c819fdf00 Mon Sep 17 00:00:00 2001
> -From: Raphael Kubo da Costa <rakuco@FreeBSD.org>
> -Date: Sat, 23 Jun 2018 20:30:07 +0200
> -Subject: [PATCH] FindLibUV: Also check uv/version.h for version detection
> -
> -Starting with libuv 1.21.0, libuv's headers were moved into a uv/ directory.
> -Make FindLibUV aware of the file's new location for configuration to work.
> -
> -Upstream change: https://github.com/libuv/libuv/pull/1429
> -
> -Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> -[Retrieve from: https://gitlab.kitware.com/cmake/cmake/merge_requests/2169]
> ----
> - Source/Modules/FindLibUV.cmake | 2 ++
> - 1 file changed, 2 insertions(+)
> -
> -diff --git a/Source/Modules/FindLibUV.cmake b/Source/Modules/FindLibUV.cmake
> -index ba13d75f8b..0554d62c23 100644
> ---- a/Source/Modules/FindLibUV.cmake
> -+++ b/Source/Modules/FindLibUV.cmake
> -@@ -63,6 +63,8 @@ mark_as_advanced(LibUV_INCLUDE_DIR)
> - set(_LibUV_H_REGEX "#[ \t]*define[ \t]+UV_VERSION_(MAJOR|MINOR|PATCH)[ \t]+[0-9]+")
> - if(LibUV_INCLUDE_DIR AND EXISTS "${LibUV_INCLUDE_DIR}/uv-version.h")
> -   file(STRINGS "${LibUV_INCLUDE_DIR}/uv-version.h" _LibUV_H REGEX "${_LibUV_H_REGEX}")
> -+elseif(LibUV_INCLUDE_DIR AND EXISTS "${LibUV_INCLUDE_DIR}/uv/version.h")
> -+  file(STRINGS "${LibUV_INCLUDE_DIR}/uv/version.h" _LibUV_H REGEX "${_LibUV_H_REGEX}")
> - elseif(LibUV_INCLUDE_DIR AND EXISTS "${LibUV_INCLUDE_DIR}/uv.h")
> -   file(STRINGS "${LibUV_INCLUDE_DIR}/uv.h" _LibUV_H REGEX "${_LibUV_H_REGEX}")
> - else()
> --- 
> -2.16.4
> -
> diff --git a/package/cmake/cmake.hash b/package/cmake/cmake.hash
> index 9e0159a3c8..0fdf12cc93 100644
> --- a/package/cmake/cmake.hash
> +++ b/package/cmake/cmake.hash
> @@ -1,5 +1,5 @@
> -# From http://www.cmake.org/files/v3.8/cmake-3.8.2-SHA-256.txt
> -sha256 da3072794eb4c09f2d782fcee043847b99bb4cf8d4573978d9b2024214d6e92d  cmake-3.8.2.tar.gz
> +# From https://cmake.org/files/v3.15/cmake-3.15.3-SHA-256.txt
> +sha256 13958243a01365b05652fa01b21d40fa834f70a9e30efa69c02604e64f58b8f5  cmake-3.15.3.tar.gz
>  
>  # Locally calculated
> -sha256 af3030e1bf1af2f534430fdfe3cfc5a617966648a2a7f0c06a631adc92be1e5f  Copyright.txt
> +sha256 dc628fb936a5d229296d42083f9a8218aa32204c016919e784404c9ec58776e9  Copyright.txt
> diff --git a/package/cmake/cmake.mk b/package/cmake/cmake.mk
> index a00691a128..2302d3f2cb 100644
> --- a/package/cmake/cmake.mk
> +++ b/package/cmake/cmake.mk
> @@ -4,8 +4,8 @@
>  #
>  ################################################################################
>  
> -CMAKE_VERSION_MAJOR = 3.8
> -CMAKE_VERSION = $(CMAKE_VERSION_MAJOR).2
> +CMAKE_VERSION_MAJOR = 3.15
> +CMAKE_VERSION = $(CMAKE_VERSION_MAJOR).3
>  CMAKE_SITE = https://cmake.org/files/v$(CMAKE_VERSION_MAJOR)
>  CMAKE_LICENSE = BSD-3-Clause
>  CMAKE_LICENSE_FILES = Copyright.txt
> diff --git a/support/dependencies/check-host-cmake.mk b/support/dependencies/check-host-cmake.mk
> index 5604713de6..01f38da376 100644
> --- a/support/dependencies/check-host-cmake.mk
> +++ b/support/dependencies/check-host-cmake.mk
> @@ -1,9 +1,9 @@
> -# Set this to either 3.8 or higher, depending on the highest minimum
> +# Set this to either 3.10 or higher, depending on the highest minimum
>  # version required by any of the packages bundled in Buildroot. If a
>  # package is bumped or a new one added, and it requires a higher
>  # version, our cmake infra will catch it and build its own.
>  #
> -BR2_CMAKE_VERSION_MIN = 3.8
> +BR2_CMAKE_VERSION_MIN = 3.10
>  
>  BR2_CMAKE_CANDIDATES ?= cmake cmake3
>  BR2_CMAKE ?= $(call suitable-host-package,cmake,\
> -- 
> 2.20.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 195 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20190930/e604582c/attachment.asc>
