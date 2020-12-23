From: Philippe REYNES <philippe.reynes@softathome.com>
Date: Wed, 23 Dec 2020 15:18:23 +0100
Subject: [Buildroot] [PATCH v3] package/ninja: fix to be cmake-3.10
 compatible again
In-Reply-To: <20201212205411.8528-1-ps.report@gmx.net>
References: <20201212205411.8528-1-ps.report@gmx.net>
Message-ID: <7425d726-fb44-3a9a-9506-fed144c0ff9c@softathome.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter,


Le 12/12/2020 ? 21:54, Peter Seiderer a ?crit?:
> Use cmake-3.10 conform COMPILE_FLAGS instead of 3.15 INCLUDE_DIRECTORIES
> property (as this one is unknown/unused for older cmake versions and
> has no effect, resuling in a build failure because of missing extra
> include path).
>
> Fixes:
>
>    - http://lists.busybox.net/pipermail/buildroot/2020-December/298159.html
>
>    [ 96%] Building CXX object CMakeFiles/ninja.dir/src/browse.cc.o
>    .../build/host-ninja-1.10.2/src/browse.cc:23:10: fatal error: build/browse_py.h: No such file or directory
>       23 | #include "build/browse_py.h"
>          |          ^~~~~~~~~~~~~~~~~~~
>    compilation terminated.
>
> Reported-by: Yegor Yefremov <yegorslists@googlemail.com>
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> Reviewed-by: Yegor Yefremov <yegorslists@googlemail.com>

Tested-by: Philippe Reynes <philippe.reynes@softathome.com>


Regards,

Philippe


> ---
> Changes v1 -> v2:
>    - really use COMPILE_FLAGS (as the patch subject says)
>      (suggested by Yegor Yefremov)
>
> Changes v2 -> v3:
>    - add reported-by, reviewed-by Yegor Yefremov
>    - update commit description
> ---
>   ...onform-COMPILE_FLAGS-instead-of-3.15.patch | 40 +++++++++++++++++++
>   1 file changed, 40 insertions(+)
>   create mode 100644 package/ninja/0002-use-cmake-3.10-conform-COMPILE_FLAGS-instead-of-3.15.patch
>
> diff --git a/package/ninja/0002-use-cmake-3.10-conform-COMPILE_FLAGS-instead-of-3.15.patch b/package/ninja/0002-use-cmake-3.10-conform-COMPILE_FLAGS-instead-of-3.15.patch
> new file mode 100644
> index 0000000000..83ec77c76c
> --- /dev/null
> +++ b/package/ninja/0002-use-cmake-3.10-conform-COMPILE_FLAGS-instead-of-3.15.patch
> @@ -0,0 +1,40 @@
> +From 80c34cb11c093f3f0c4217ecf078a1a626da50bd Mon Sep 17 00:00:00 2001
> +From: Peter Seiderer <ps.report@gmx.net>
> +Date: Thu, 10 Dec 2020 20:29:19 +0100
> +Subject: [PATCH] use cmake-3.10 conform COMPILE_FLAGS instead of 3.15
> + INCLUDE_DIRECTORIES property
> +
> +Use cmake-3.10 conform COMPILE_FLAGS instead of 3.15 INCLUDE_DIRECTORIES
> +property (as this one is unknown/unused for older cmake versions and
> +has no effect, resuling in a build failure because of missing extra
> +include path).
> +
> +Fixes:
> +
> +  [ 96%] Building CXX object CMakeFiles/ninja.dir/src/browse.cc.o
> +  .../build/host-ninja-1.10.2/src/browse.cc:23:10: fatal error: build/browse_py.h: No such file or directory
> +     23 | #include "build/browse_py.h"
> +        |          ^~~~~~~~~~~~~~~~~~~
> +  compilation terminated.
> +
> +Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> +---
> + CMakeLists.txt | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/CMakeLists.txt b/CMakeLists.txt
> +index 7f03c35..f582d2f 100644
> +--- a/CMakeLists.txt
> ++++ b/CMakeLists.txt
> +@@ -156,7 +156,7 @@ if(platform_supports_ninja_browse)
> + 	set_source_files_properties(src/browse.cc
> + 		PROPERTIES
> + 			OBJECT_DEPENDS "${CMAKE_BINARY_DIR}/build/browse_py.h"
> +-			INCLUDE_DIRECTORIES "${CMAKE_BINARY_DIR}"
> ++			COMPILE_FLAGS "-I${CMAKE_BINARY_DIR}"
> + 			COMPILE_DEFINITIONS NINJA_PYTHON="python"
> + 	)
> + endif()
> +--
> +2.29.2
> +
