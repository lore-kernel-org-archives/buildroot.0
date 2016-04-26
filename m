From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 26 Apr 2016 23:00:44 +0200
Subject: [Buildroot] [PATCH 1/1] kodi: Enable raspberry-pi2 build support
In-Reply-To: <1461702074-14376-1-git-send-email-bmauduit@beneth.fr>
References: <1461702074-14376-1-git-send-email-bmauduit@beneth.fr>
Message-ID: <20160426210044.GA3482@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Benoit, All,

On 2016-04-26 22:21 +0200, Beno?t Mauduit spake thusly:
> The previous commit [ef37472b20894c99cad758397f3cd6b90f933df1] was
> based on a newer version of Kodi :
> "with-platform=raspberry-pi2" is not yet supported in Kodi "Jarvis" branch.

Arg. My bad. I indeed looked at the master of Kodi when doing that
patch.

Until there is a new release of Kodi (Krypton?), we should revert my
patch, rather than backport upstream changes...

Regards,
Yann E. MORIN.

> Backport 2 patches from Kodi master branch into this one.
> 
> Signed-off-by: Beno?t Mauduit <bmauduit@beneth.fr>
> ---
>  ...0007-configure-Add-raspberry-pi2-platform.patch | 205 +++++++++++++++++++++
>  1 file changed, 205 insertions(+)
>  create mode 100644 package/kodi/0007-configure-Add-raspberry-pi2-platform.patch
> 
> diff --git a/package/kodi/0007-configure-Add-raspberry-pi2-platform.patch b/package/kodi/0007-configure-Add-raspberry-pi2-platform.patch
> new file mode 100644
> index 0000000..7542b91
> --- /dev/null
> +++ b/package/kodi/0007-configure-Add-raspberry-pi2-platform.patch
> @@ -0,0 +1,205 @@
> +From 968c4a0f412c80bf0afecf934b71044d297cad51 Mon Sep 17 00:00:00 2001
> +From: =?UTF-8?q?Beno=C3=AEt=20Mauduit?= <bmauduit@beneth.fr>
> +Date: Tue, 26 Apr 2016 15:30:42 +0200
> +Subject: [PATCH 1/1] configure: Add raspberry-pi2 platform
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=UTF-8
> +Content-Transfer-Encoding: 8bit
> +
> +Original commit from "popcornmix" [0], and fixed by "wsnipex" [1] on Kodi branch master.
> +Commit-id in xbmc/kodi upstream git :
> +[0] Commit-id : 253ec417519afe9415612add80ff5a1753208b75
> +[1] Commit-id : 1da2f07be715865bf7cf9731d7147dc4f43459be
> +
> +Addition to original patches :
> + * Add optimization flag for rpi2 in main xbmc build
> + * Add -mtune & -mvectorize-with-neon-quad flag in "tools/depends" build
> +
> +Signed-off-by: Beno?t Mauduit <bmauduit@beneth.fr>
> +---
> + configure.ac                                      | 21 +++++++++++--
> + m4/xbmc_arch.m4                                   |  8 ++---
> + tools/depends/Makefile.include.in                 |  2 +-
> + tools/depends/configure.ac                        | 37 ++++++++++++++++-------
> + tools/depends/target/Toolchain.cmake.in           |  2 +-
> + tools/depends/target/Toolchain_binaddons.cmake.in |  2 +-
> + 6 files changed, 50 insertions(+), 22 deletions(-)
> +
> +diff --git a/configure.ac b/configure.ac
> +index 5d47a4a..2eb0e20 100644
> +--- a/configure.ac
> ++++ b/configure.ac
> +@@ -698,8 +698,17 @@ case $use_platform in
> +   raspberry-pi)
> +      target_platform=target_raspberry_pi
> +      use_neon=no
> +-     use_arch="arm"
> +      use_cpu=arm1176jzf-s
> ++     ;;
> ++  raspberry-pi2)
> ++     target_platform=target_raspberry_pi
> ++     use_neon=yes
> ++     use_cpu=cortex-a7
> ++     ;;
> ++esac
> ++
> ++if test "$target_platform" = "target_raspberry_pi" ; then
> ++     use_arch="arm"
> +      use_hardcoded_tables="yes"
> +      use_openmax=no
> +      ARCH="arm"
> +@@ -708,8 +717,7 @@ case $use_platform in
> +      USE_MMAL=1; AC_DEFINE([HAS_MMAL],[1],["Define to 1 if MMAL libs is enabled"])
> +      CFLAGS="$CFLAGS"
> +      CXXFLAGS="$CXXFLAGS"
> +-     ;;
> +-esac
> ++fi
> + 
> + if test "$host_vendor" = "apple"; then
> +   use_avahi=no
> +@@ -807,6 +815,13 @@ if test "$host_vendor" = "apple" ; then
> + elif test "$target_platform" = "target_raspberry_pi"; then
> +   ARCH="arm"
> +   use_arch="arm"
> ++
> ++  # Add specific flags for rpi2
> ++  if test "$use_platform" = "raspberry-pi2"; then
> ++    CFLAGS="$CFLAGS -mcpu=cortex-a7 -mtune=cortex-a7 -mfpu=neon-vfpv4 -mvectorize-with-neon-quad"
> ++    CXXFLAGS="$CXXFLAGS -mcpu=cortex-a7 -mtune=cortex-a7 -mfpu=neon-vfpv4 -mvectorize-with-neon-quad"
> ++  fi
> ++
> + elif test "$use_arch" = "arm"; then
> +   CFLAGS="$CFLAGS -mno-apcs-stack-check"
> +   CXXFLAGS="$CXXFLAGS -mno-apcs-stack-check"
> +diff --git a/m4/xbmc_arch.m4 b/m4/xbmc_arch.m4
> +index 0b66a82..adb8e97 100644
> +--- a/m4/xbmc_arch.m4
> ++++ b/m4/xbmc_arch.m4
> +@@ -77,9 +77,7 @@ if test "$target_platform" = "target_android" ; then
> +   AC_SUBST(ARCH_DEFINES, "-DTARGET_POSIX -DTARGET_LINUX -D_LINUX -DTARGET_ANDROID")
> + fi
> + 
> +-case $use_platform in
> +-  raspberry-pi)
> +-     AC_SUBST(ARCH_DEFINES, "-DTARGET_POSIX -DTARGET_LINUX -D_LINUX -D_ARMEL -DTARGET_RASPBERRY_PI")
> +-     ;;
> +-esac
> ++if test "$target_platform" = "target_raspberry_pi" ; then
> ++  AC_SUBST(ARCH_DEFINES, "-DTARGET_POSIX -DTARGET_LINUX -D_LINUX -D_ARMEL -DTARGET_RASPBERRY_PI")
> ++fi
> + ])
> +diff --git a/tools/depends/Makefile.include.in b/tools/depends/Makefile.include.in
> +index 6e37022..326e7b8 100644
> +--- a/tools/depends/Makefile.include.in
> ++++ b/tools/depends/Makefile.include.in
> +@@ -20,7 +20,7 @@ NATIVE_OS=@build_os@
> + CROSS_COMPILING=@cross_compiling@
> + ARCH_DEFINES=@ARCH_DEFINES@
> + NATIVE_ARCH_DEFINES=@NATIVE_ARCH_DEFINES@
> +-TARGET_PLATFORM=@use_platform@
> ++TARGET_PLATFORM=@target_platform@
> + XCODE_VERSION=@use_xcode@
> + AAPT=@AAPT@
> + DX=@DX@
> +diff --git a/tools/depends/configure.ac b/tools/depends/configure.ac
> +index 12935e3..05644b8 100644
> +--- a/tools/depends/configure.ac
> ++++ b/tools/depends/configure.ac
> +@@ -302,34 +302,49 @@ case $host in
> +     AC_MSG_ERROR(unsupported host ($use_host))
> + esac
> + 
> +-if test "$use_platform" = "raspberry-pi"; then
> ++case $use_platform in
> ++  raspberry-pi)
> ++     target_platform=raspberry-pi
> ++     use_neon=no
> ++     use_cpu=arm1176jzf-s
> ++     platform_cflags="-mcpu=arm1176jzf-s -mtune=arm1176jzf-s -mfloat-abi=hard -mfpu=vfp"
> ++     platform_cxxflags="-mcpu=arm1176jzf-s -mtune=arm1176jzf-s -mfloat-abi=hard -mfpu=vfp"
> ++     platform_ldflags=""
> ++     ;;
> ++  raspberry-pi2)
> ++     target_platform=raspberry-pi
> ++     use_neon=yes
> ++     use_cpu=cortex-a7
> ++     platform_cflags="-fPIC -mcpu=cortex-a7 -mtune=cortex-a7 -mfloat-abi=hard -mfpu=neon-vfpv4 -mvectorize-with-neon-quad"
> ++     platform_cxxflags="-fPIC -mcpu=cortex-a7 -mtune=cortex-a7 -mfloat-abi=hard -mfpu=neon-vfpv4 -mvectorize-with-neon-quad"
> ++     platform_ldflags="-lpthread"
> ++     ;;
> ++esac
> ++
> ++if test "$target_platform" = "raspberry-pi" ; then
> +   if test -d "${use_firmware}/opt/vc/include"; then
> +     :
> +   else
> +     AC_MSG_ERROR([Raspberry Pi firmware not found])
> +   fi
> +-  use_neon=no
> +   use_arch="arm"
> +-  use_cpu="arm1176jzf-s"
> +   use_hardcoded_tables="yes"
> +-  use_alsa="no"
> +   ARCH="arm"
> +   platform_os="linux"
> +   cross_compiling="yes"
> +   use_host="arm-linux-gnueabihf"
> +   deps_dir="$use_host"
> +-  platform_cflags="-pipe -mcpu=arm1176jzf-s -mtune=arm1176jzf-s -mfloat-abi=hard \
> +-   -mfpu=vfp -mabi=aapcs-linux -Wno-psabi -Wa,-mno-warn-deprecated \
> +-   -Wno-deprecated-declarations -isystem${use_firmware}/opt/vc/include \
> ++  platform_cflags+=" -pipe -mabi=aapcs-linux -Wno-psabi \
> ++   -Wa,-mno-warn-deprecated -Wno-deprecated-declarations \
> ++   -isystem${use_firmware}/opt/vc/include \
> +    -isystem${use_firmware}/opt/vc/include/interface/vcos/pthreads \
> +    -isystem${use_firmware}/opt/vc/include/interface/vmcs_host/linux"
> +-  platform_cxxflags="-pipe -mcpu=arm1176jzf-s -mtune=arm1176jzf-s \
> +-   -mfloat-abi=hard -mfpu=vfp -mabi=aapcs-linux -Wno-psabi \
> ++  platform_cxxflags+=" -pipe -mabi=aapcs-linux -Wno-psabi \
> +    -Wa,-mno-warn-deprecated -Wno-deprecated-declarations \
> +    -isystem${use_firmware}/opt/vc/include \
> +    -isystem${use_firmware}/opt/vc/include/interface/vcos/pthreads \
> +    -isystem${use_firmware}/opt/vc/include/interface/vmcs_host/linux"
> +-  platform_ldflags="-L${use_firmware}/opt/vc/lib -lEGL -lGLESv2 -lbcm_host -lvcos \
> ++  platform_ldflags+=" -L${use_firmware}/opt/vc/lib -lEGL -lGLESv2 -lbcm_host -lvcos \
> +    -lvchiq_arm"
> + fi
> + 
> +@@ -491,7 +506,7 @@ AC_SUBST(use_cpu)
> + AC_SUBST(use_toolchain)
> + AC_SUBST(use_build_toolchain)
> + AC_SUBST(use_tarballs)
> +-AC_SUBST(use_platform)
> ++AC_SUBST(target_platform)
> + AC_SUBST(use_firmware)
> + AC_SUBST(cross_compiling)
> + AC_SUBST(platform_cflags)
> +diff --git a/tools/depends/target/Toolchain.cmake.in b/tools/depends/target/Toolchain.cmake.in
> +index 943be73..59385e8 100644
> +--- a/tools/depends/target/Toolchain.cmake.in
> ++++ b/tools/depends/target/Toolchain.cmake.in
> +@@ -1,6 +1,6 @@
> + SET(OS "@platform_os@")
> + SET(CPU "@use_cpu@")
> +-SET(PLATFORM "@use_platform@")
> ++SET(PLATFORM "@target_platform@")
> + IF("${OS}" STREQUAL "linux" OR "${OS}" STREQUAL "android")
> + SET(CMAKE_SYSTEM_NAME Linux)
> + ENDIF()
> +diff --git a/tools/depends/target/Toolchain_binaddons.cmake.in b/tools/depends/target/Toolchain_binaddons.cmake.in
> +index dc6d565..98494b4 100644
> +--- a/tools/depends/target/Toolchain_binaddons.cmake.in
> ++++ b/tools/depends/target/Toolchain_binaddons.cmake.in
> +@@ -1,7 +1,7 @@
> + set(CMAKE_SYSTEM_VERSION 1)
> + set(OS "@platform_os@")
> + set(CPU "@use_cpu@")
> +-set(PLATFORM "@use_platform@")
> ++set(PLATFORM "@target_platform@")
> + if("${OS}" STREQUAL "linux" OR "${OS}" STREQUAL "android")
> +   set(CMAKE_SYSTEM_NAME Linux)
> + endif()
> +-- 
> +2.8.1
> +
> -- 
> 2.8.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
