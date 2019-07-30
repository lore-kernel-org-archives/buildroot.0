From: Peter Seiderer <ps.report@gmx.net>
Date: Tue, 30 Jul 2019 23:30:29 +0200
Subject: [Buildroot] [PATCH] package/qt5/qt5webengine: fix build error
In-Reply-To: <20190730115832.21008-1-b.bilas@grinn-global.com>
References: <20190730115832.21008-1-b.bilas@grinn-global.com>
Message-ID: <20190730233029.7360e1bd@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Bartosz,

On Tue, 30 Jul 2019 13:58:32 +0200, Bartosz Bilas <b.bilas@grinn-global.com> wrote:

> This commit adds a patch from upstream chromium
> and bumps required minimal gcc version to 8.
> 
> Fixes:
>   ../../3rdparty/chromium/third_party/skia/third_party/skcms/skcms.cc:1909:16:
>   note: in definition of macro 'NS'
>   #define NS(id) id
>                 ^~

Please paste some more lines of the failure, e.g. as the original:

	[102/12099] CXX obj/skia/skcms/skcms.o
	FAILED: obj/skia/skcms/skcms.o
[...]
	../../3rdparty/chromium/third_party/skia/third_party/skcms/src/Transform_inl.h: In function ?void exec_ops(const Op*, const void**, const char*, char*, int)?:
	../../3rdparty/chromium/third_party/skia/third_party/skcms/src/Transform_inl.h:560:16: internal compiler error: in convert_move, at expr.c:231
	 static void NS(exec_ops)(const Op* ops, const void** args,
	                ^
	../../3rdparty/chromium/third_party/skia/third_party/skcms/skcms.cc:1909:16: note: in definition of macro ?NS?
	 #define NS(id) id
	                ^~
	Please submit a full bug report,
	with preprocessed source if appropriate.
	See <http://bugs.buildroot.net/> for instructions.

As the intersting part is the 'internal compiler error'...

Regards,
Peter

> 
> Signed-off-by: Bartosz Bilas <b.bilas@grinn-global.com>
> ---
>  ...1-pkg_config-Fixes-when-use_sysroot-false.patch | 56 ++++++++++++++++++++++
>  package/qt5/qt5webengine/Config.in                 |  6 +--
>  2 files changed, 59 insertions(+), 3 deletions(-)
>  create mode 100644 package/qt5/qt5webengine/5.12.4/0001-pkg_config-Fixes-when-use_sysroot-false.patch
> 
> diff --git a/package/qt5/qt5webengine/5.12.4/0001-pkg_config-Fixes-when-use_sysroot-false.patch b/package/qt5/qt5webengine/5.12.4/0001-pkg_config-Fixes-when-use_sysroot-false.patch
> new file mode 100644
> index 0000000000..e5ffd19dd0
> --- /dev/null
> +++ b/package/qt5/qt5webengine/5.12.4/0001-pkg_config-Fixes-when-use_sysroot-false.patch
> @@ -0,0 +1,56 @@
> +From cc35cac78c053c14da01d6b1e5b05b0615360148 Mon Sep 17 00:00:00 2001
> +From: Tom Anderson <thomasanderson@chromium.org>
> +Date: Thu, 2 Aug 2018 01:59:28 +0000
> +Subject: [PATCH] pkg_config: Fixes when use_sysroot=false
> +
> +This CL introduces 2 changes to the behavior of pkg_config when
> +use_sysroot=false:
> +
> +1. The path is not made relative to the build directory.  This fixes the case
> +where your src directory may be mounted at different locations.
> +
> +2. -I is used instead of -isystem.  When -isystem is used, dep files do not
> +reference the system header files.  This is OK when using the sysroot because
> +the CR_SYSROOT_HASH macro contains the sysroot revision so any source files will
> +be rebuilt when the sysroot updates.
> +
> +R=dpranke
> +
> +Change-Id: Ia3d7df51880205fee888923283b76078ccb3112f
> +Reviewed-on: https://chromium-review.googlesource.com/1159689
> +Reviewed-by: Dirk Pranke <dpranke@chromium.org>
> +Commit-Queue: Thomas Anderson <thomasanderson@chromium.org>
> +Cr-Original-Commit-Position: refs/heads/master@{#580030}
> +Cr-Mirrored-From: https://chromium.googlesource.com/chromium/src
> +Cr-Mirrored-Commit: a8c8396fd20d98666d517c45b358c63736e345ef
> +---
> + src/3rdparty/chromium/build/config/linux/pkg_config.gni | 12 ++++++++----
> + 1 file changed, 8 insertions(+), 4 deletions(-)
> +
> +diff --git a/src/3rdparty/chromium/build/config/linux/pkg_config.gni b/src/3rdparty/chromium/build/config/linux/pkg_config.gni
> +index 53ee353af..428e44ac0 100644
> +--- a/src/3rdparty/chromium/build/config/linux/pkg_config.gni
> ++++ b/src/3rdparty/chromium/build/config/linux/pkg_config.gni
> +@@ -103,11 +103,15 @@ template("pkg_config") {
> +     pkgresult = exec_script(pkg_config_script, args, "value")
> +     cflags = pkgresult[1]
> + 
> +-    # We want the system include paths to use -isystem instead of -I to suppress
> +-    # warnings in those headers.
> +     foreach(include, pkgresult[0]) {
> +-      include_relativized = rebase_path(include, root_build_dir)
> +-      cflags += [ "-isystem$include_relativized" ]
> ++      if (use_sysroot) {
> ++        # We want the system include paths to use -isystem instead of -I to
> ++        # suppress warnings in those headers.
> ++        include_relativized = rebase_path(include, root_build_dir)
> ++        cflags += [ "-isystem$include_relativized" ]
> ++      } else {
> ++        cflags += [ "-I$include" ]
> ++      }
> +     }
> + 
> +     if (!defined(invoker.ignore_libs) || !invoker.ignore_libs) {
> +-- 
> +2.21.0
> +
> diff --git a/package/qt5/qt5webengine/Config.in b/package/qt5/qt5webengine/Config.in
> index 744d659567..8102e39b0b 100644
> --- a/package/qt5/qt5webengine/Config.in
> +++ b/package/qt5/qt5webengine/Config.in
> @@ -10,10 +10,10 @@ config BR2_PACKAGE_QT5WEBENGINE_ARCH_SUPPORTS
>  	depends on !BR2_BINFMT_FLAT # qt5base-icu
>  	depends on BR2_USE_MMU # libglib2, qt5base-dbus
>  
> -comment "qt5webengine needs udev /dev management and a glibc toolchain w/ gcc >= 4.8, host gcc >= 4.8, threads, wchar"
> +comment "qt5webengine needs udev /dev management and a glibc toolchain w/ gcc >= 8, host gcc >= 4.8, threads, wchar"
>  	depends on BR2_PACKAGE_QT5WEBENGINE_ARCH_SUPPORTS
>  	depends on !BR2_PACKAGE_HAS_UDEV || !BR2_TOOLCHAIN_USES_GLIBC || \
> -		!BR2_HOST_GCC_AT_LEAST_4_8 || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 || \
> +		!BR2_HOST_GCC_AT_LEAST_4_8 || !BR2_TOOLCHAIN_GCC_AT_LEAST_8 || \
>  		!BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR
>  
>  comment "qt5webengine needs an OpenGL and EGL-capable backend"
> @@ -30,7 +30,7 @@ config BR2_PACKAGE_QT5WEBENGINE
>  	depends on BR2_PACKAGE_QT5WEBENGINE_ARCH_SUPPORTS
>  	depends on BR2_TOOLCHAIN_USES_GLIBC # execinfo.h, mallinfo
>  	depends on BR2_HOST_GCC_AT_LEAST_4_8 # qt5base-icu
> -	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # qt5base-icu
> +	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_8 # qt5base-icu
>  	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_85862 || BR2_PACKAGE_QT5_VERSION_5_6 # libnss
>  	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2, libvpx, qt5base-dbus
>  	depends on BR2_USE_WCHAR # libglib2
