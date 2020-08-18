From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 18 Aug 2020 22:19:51 +0200
Subject: [Buildroot] [PATCH 1/1] package/opencv3: fix build with gcc 10
In-Reply-To: <20200818183644.115230-1-fontaine.fabrice@gmail.com>
References: <20200818183644.115230-1-fontaine.fabrice@gmail.com>
Message-ID: <20200818201951.GS24264@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabrice, All,

On 2020-08-18 20:36 +0200, Fabrice Fontaine spake thusly:
> Fixes:
>  - http://autobuild.buildroot.org/results/e87b566f9c7d4ebebe57313fca4751939c197c88
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  ...th-with-ipa-cp-unit-growth-on-gcc-10.patch | 53 +++++++++++++++++++
>  1 file changed, 53 insertions(+)
>  create mode 100644 package/opencv3/0002-carotene-Replace-ipcp-unit-growth-with-ipa-cp-unit-growth-on-gcc-10.patch
> 
> diff --git a/package/opencv3/0002-carotene-Replace-ipcp-unit-growth-with-ipa-cp-unit-growth-on-gcc-10.patch b/package/opencv3/0002-carotene-Replace-ipcp-unit-growth-with-ipa-cp-unit-growth-on-gcc-10.patch
> new file mode 100644
> index 0000000000..321c2e51f9
> --- /dev/null
> +++ b/package/opencv3/0002-carotene-Replace-ipcp-unit-growth-with-ipa-cp-unit-growth-on-gcc-10.patch
> @@ -0,0 +1,53 @@
> +From 2bd94884752b9840d434f80b1c4b83176f7063e3 Mon Sep 17 00:00:00 2001
> +From: Khem Raj <raj.khem@gmail.com>
> +Date: Thu, 16 Jan 2020 08:52:00 -0800
> +Subject: [PATCH] carotene: Replace ipcp-unit-growth with ipa-cp-unit-growth on
> + gcc >= 10
> +
> +gcc 10+ has renamed this option, therefore check for gcc version before
> +deciding which name to use for opt parameter
> +
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +[Retrieved from:
> +https://github.com/opencv/opencv/commit/2bd94884752b9840d434f80b1c4b83176f7063e3]
> +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +---
> + 3rdparty/carotene/CMakeLists.txt     | 7 +++++--
> + 3rdparty/carotene/hal/CMakeLists.txt | 6 +++++-
> + 2 files changed, 10 insertions(+), 3 deletions(-)
> +
> +diff --git a/3rdparty/carotene/CMakeLists.txt b/3rdparty/carotene/CMakeLists.txt
> +index bfa9368d79d..528fcf62e15 100644
> +--- a/3rdparty/carotene/CMakeLists.txt
> ++++ b/3rdparty/carotene/CMakeLists.txt
> +@@ -20,8 +20,11 @@ if(CMAKE_COMPILER_IS_GNUCC)
> +     # - matchTemplate about 5-10%
> +     # - goodFeaturesToTrack 10-20%
> +     # - cornerHarris 30% for some cases
> +-
> +-    set_source_files_properties(${carotene_sources} COMPILE_FLAGS "--param ipcp-unit-growth=100000 --param inline-unit-growth=100000 --param large-stack-frame-growth=5000")
> ++    if(CMAKE_CXX_COMPILER_VERSION VERSION_LESS "10.0.0")
> ++        set_source_files_properties(${carotene_sources} COMPILE_FLAGS "--param ipcp-unit-growth=100000 --param inline-unit-growth=100000 --param large-stack-frame-growth=5000")
> ++    else()
> ++        set_source_files_properties(${carotene_sources} COMPILE_FLAGS "--param ipa-cp-unit-growth=100000 --param inline-unit-growth=100000 --param large-stack-frame-growth=5000")
> ++    endif()
> + endif()
> + 
> + add_library(carotene_objs OBJECT
> +diff --git a/3rdparty/carotene/hal/CMakeLists.txt b/3rdparty/carotene/hal/CMakeLists.txt
> +index 819954de137..b94d8511e8a 100644
> +--- a/3rdparty/carotene/hal/CMakeLists.txt
> ++++ b/3rdparty/carotene/hal/CMakeLists.txt
> +@@ -88,7 +88,11 @@ set_property(DIRECTORY APPEND PROPERTY COMPILE_DEFINITIONS ${carotene_defs})
> +     #   matchTemplate about 5-10%
> +     #   goodFeaturesToTrack 10-20%
> +     #   cornerHarris 30% for some cases
> +-    set_source_files_properties(impl.cpp $<TARGET_OBJECTS:carotene_objs> COMPILE_FLAGS "--param ipcp-unit-growth=100000 --param inline-unit-growth=100000 --param large-stack-frame-growth=5000")
> ++    if(CMAKE_CXX_COMPILER_VERSION VERSION_LESS "10.0.0")
> ++      set_source_files_properties(impl.cpp $<TARGET_OBJECTS:carotene_objs> COMPILE_FLAGS "--param ipcp-unit-growth=100000 --param inline-unit-growth=100000 --param large-stack-frame-growth=5000")
> ++    else()
> ++      set_source_files_properties(impl.cpp $<TARGET_OBJECTS:carotene_objs> COMPILE_FLAGS "--param ipa-cp-unit-growth=100000 --param inline-unit-growth=100000 --param large-stack-frame-growth=5000")
> ++    endif()
> + #    set_source_files_properties(impl.cpp $<TARGET_OBJECTS:carotene_objs> COMPILE_FLAGS "--param ipcp-unit-growth=100000 --param inline-unit-growth=100000 --param large-stack-frame-growth=5000")
> +   endif()
> + 
> -- 
> 2.27.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
