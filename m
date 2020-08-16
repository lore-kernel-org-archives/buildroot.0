From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 16 Aug 2020 22:45:34 +0200
Subject: [Buildroot] [PATCH 1/1] package/fluidsynth: fix build with gcc
 4.8
In-Reply-To: <20200816183052.1387314-1-fontaine.fabrice@gmail.com>
References: <20200816183052.1387314-1-fontaine.fabrice@gmail.com>
Message-ID: <20200816204534.GE24264@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabrice, All,

On 2020-08-16 20:30 +0200, Fabrice Fontaine spake thusly:
> Fixes:
>  - http://autobuild.buildroot.org/results/13cbba871db56ef8657a3d13c6ac8e1b4da0d244
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

The upstream CI is failing, but that's on BSD because their builder is
not up-to-date, and everything else passed.

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  ...MakeLists.txt-fix-build-with-gcc-4.8.patch | 49 +++++++++++++++++++
>  1 file changed, 49 insertions(+)
>  create mode 100644 package/fluidsynth/0001-CMakeLists.txt-fix-build-with-gcc-4.8.patch
> 
> diff --git a/package/fluidsynth/0001-CMakeLists.txt-fix-build-with-gcc-4.8.patch b/package/fluidsynth/0001-CMakeLists.txt-fix-build-with-gcc-4.8.patch
> new file mode 100644
> index 0000000000..1e906f53bb
> --- /dev/null
> +++ b/package/fluidsynth/0001-CMakeLists.txt-fix-build-with-gcc-4.8.patch
> @@ -0,0 +1,49 @@
> +From a810e30a3d560d3e6ced41c74032c54ea365a88e Mon Sep 17 00:00:00 2001
> +From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +Date: Sun, 16 Aug 2020 20:17:26 +0200
> +Subject: [PATCH] CMakeLists.txt: fix build with gcc 4.8
> +
> +-Werror=incompatible-pointer-types is unconditionally used since version
> +2.1.4 and 137a14e106d75d1260f78acc1a19c5a936ef75b2. This will raise a
> +build failure when checking for threads on gcc 4.8:
> +
> +/home/buildroot/autobuild/run/instance-3/output-1/host/bin/arm-none-linux-gnueabi-gcc --sysroot=/home/buildroot/autobuild/run/instance-3/output-1/host/arm-buildroot-linux-gnueabi/sysroot -DTESTKEYWORD=inline  -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -Os -Wall -W -Wpointer-arith -Wcast-qual -Wstrict-prototypes -Wno-unused-parameter -Wdeclaration-after-statement -Werror=implicit-function-declaration -Werror=incompatible-pointer-types -Wbad-function-cast -Wcast-align   -DNDEBUG -fPIE   -o CMakeFiles/cmTC_98946.dir/CheckIncludeFile.c.o   -c /home/buildroot/autobuild/run/instance-3/output-1/build/fluidsynth-2.1.4/CMakeFiles/CMakeTmp/CheckIncludeFile.c
> +cc1: error: -Werror=incompatible-pointer-types: no option -Wincompatible-pointer-types
> +
> +Fixes:
> + - http://autobuild.buildroot.org/results/13cbba871db56ef8657a3d13c6ac8e1b4da0d244
> +
> +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +[Upstream status: https://github.com/FluidSynth/fluidsynth/pull/661]
> +---
> + CMakeLists.txt | 7 ++++++-
> + 1 file changed, 6 insertions(+), 1 deletion(-)
> +
> +diff --git a/CMakeLists.txt b/CMakeLists.txt
> +index 7844889..0f6c169 100644
> +--- a/CMakeLists.txt
> ++++ b/CMakeLists.txt
> +@@ -146,6 +146,7 @@ endif ( POLICY CMP0063 )
> + include ( DefaultDirs )
> + 
> + # Basic C library checks
> ++include ( CheckCCompilerFlag )
> + include ( CheckSTDC )
> + include ( CheckIncludeFile )
> + include ( CheckFunctionExists )
> +@@ -196,7 +197,11 @@ if ( CMAKE_COMPILER_IS_GNUCC OR CMAKE_C_COMPILER_ID MATCHES "Clang" OR CMAKE_C_C
> +   endif ( NOT APPLE AND NOT OS2 )
> + 
> +   # define some warning flags
> +-  set ( CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -Wall -W -Wpointer-arith -Wcast-qual -Wstrict-prototypes -Wno-unused-parameter -Wdeclaration-after-statement -Werror=implicit-function-declaration -Werror=incompatible-pointer-types" )
> ++  set ( CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -Wall -W -Wpointer-arith -Wcast-qual -Wstrict-prototypes -Wno-unused-parameter -Wdeclaration-after-statement -Werror=implicit-function-declaration" )
> ++  check_c_compiler_flag ( "-Werror=incompatible-pointer-types" HAVE_INCOMPATIBLE_POINTER_TYPES )
> ++  if ( HAVE_INCOMPATIBLE_POINTER_TYPES )
> ++    set ( CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -Werror=incompatible-pointer-types" )
> ++  endif ( HAVE_INCOMPATIBLE_POINTER_TYPES ) 
> + 
> +   # prepend to build type specific flags, to allow users to override
> +   set ( CMAKE_C_FLAGS_DEBUG "-g ${CMAKE_C_FLAGS_DEBUG}" )
> +-- 
> +2.27.0
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
