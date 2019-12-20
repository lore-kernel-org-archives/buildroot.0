From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Fri, 20 Dec 2019 15:28:15 +0100
Subject: [Buildroot] [PATCH 2/2] package/wireshark: fix static build
 with snappy
In-Reply-To: <20190529172932.3753-2-fontaine.fabrice@gmail.com>
References: <20190529172932.3753-1-fontaine.fabrice@gmail.com>
 <20190529172932.3753-2-fontaine.fabrice@gmail.com>
Message-ID: <eb15394f-28b2-b448-0863-47d68dd8019d@benettiengineering.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Fabrice,

On 5/29/19 7:29 PM, Fabrice Fontaine wrote:
> Fixes:
>   - http://autobuild.buildroot.org/results/419468f0d7d3c2b64d420513aa9505c6de097ed2
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>   .../0005-FindSNAPPY-fix-static-build.patch    | 46 +++++++++++++++++++
>   1 file changed, 46 insertions(+)
>   create mode 100644 package/wireshark/0005-FindSNAPPY-fix-static-build.patch
> 
> diff --git a/package/wireshark/0005-FindSNAPPY-fix-static-build.patch b/package/wireshark/0005-FindSNAPPY-fix-static-build.patch
> new file mode 100644
> index 0000000000..ba528cf01a
> --- /dev/null
> +++ b/package/wireshark/0005-FindSNAPPY-fix-static-build.patch
> @@ -0,0 +1,46 @@
> +From 4abe51deee1ed3daffa9042ab41ed0622856c69c Mon Sep 17 00:00:00 2001
> +From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +Date: Tue, 28 May 2019 21:18:09 +0200
> +Subject: [PATCH] FindSNAPPY: fix static build
> +
> +On UNIX, when statically built, snappy can depends on stdc++. This
> +dependency can be retrieved through pkg-config, see:
> +https://github.com/google/snappy/pull/51
> +
> +Fixes:
> + - http://autobuild.buildroot.org/results/faa65da84ace974426e220205f4665fc0a73bdfe
> +
> +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +---
> + cmake/modules/FindSNAPPY.cmake | 8 ++++++--
> + 1 file changed, 6 insertions(+), 2 deletions(-)
> +
> +diff --git a/cmake/modules/FindSNAPPY.cmake b/cmake/modules/FindSNAPPY.cmake
> +index 7964c9d145..93fdb2bc33 100644
> +--- a/cmake/modules/FindSNAPPY.cmake
> ++++ b/cmake/modules/FindSNAPPY.cmake
> +@@ -13,7 +13,7 @@ FindWSWinLibs( "snappy-.*" "SNAPPY_HINTS" )
> +
> + if( NOT WIN32)
> +   find_package(PkgConfig)
> +-  pkg_search_module(SNAPPY libsnappy)
> ++  pkg_search_module(SNAPPY libsnappy snappy)
> + endif()
> +
> + find_path(SNAPPY_INCLUDE_DIR
> +@@ -36,7 +36,11 @@ find_package_handle_standard_args( SNAPPY DEFAULT_MSG SNAPPY_LIBRARY SNAPPY_INCL
> +
> + if( SNAPPY_FOUND )
> +   set( SNAPPY_INCLUDE_DIRS ${SNAPPY_INCLUDE_DIR} )
> +-  set( SNAPPY_LIBRARIES ${SNAPPY_LIBRARY} )
> ++  # If pkg-config is available on the system and snappy .pc files are installed,
> ++  # SNAPPY_LIBRARIES will already contain transitive dependencies such as
> ++  # -lstdc++ for static linking
> ++  list( APPEND SNAPPY_LIBRARIES ${SNAPPY_LIBRARY} )
> ++
> +   if (WIN32)
> +     set ( SNAPPY_DLL_DIR "${SNAPPY_HINTS}/bin"
> +       CACHE PATH "Path to Snappy DLL"
> +--
> +2.20.1
> +
> 

Reviewed-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Best regards
-- 
Giulio Benetti
Benetti Engineering sas
