From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 28 Oct 2016 14:51:02 +0200
Subject: [Buildroot] [PATCH 1/1] cminpack: new package
In-Reply-To: <20161028123106.32072-1-mat@ampyxpower.com>
References: <20161028123106.32072-1-mat@ampyxpower.com>
Message-ID: <20161028145102.7d548447@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Thanks for your contribution! It looks mostly good, there are just a
few things to address, see below.

On Fri, 28 Oct 2016 14:31:06 +0200, Mathieu Mirmont wrote:

> diff --git a/package/cminpack/cminpack-0001-Do-not-install-to-lib64-on-x86_64-platforms.patch b/package/cminpack/cminpack-0001-Do-not-install-to-lib64-on-x86_64-platforms.patch

This is not the correct naming for patches, it should be just
0001-Do-not-install-to-lib64-on-x86_64-platforms.patch, i.e there is no
need to repeat the name of the package.

> new file mode 100644
> index 0000000..d7d66e2
> --- /dev/null
> +++ b/package/cminpack/cminpack-0001-Do-not-install-to-lib64-on-x86_64-platforms.patch
> @@ -0,0 +1,28 @@
> +From 86f361b980f009ec2bdeea6de6972fe5523420e3 Mon Sep 17 00:00:00 2001
> +From: Mathieu Mirmont <mat@ampyxpower.com>
> +Date: Wed, 24 Jun 2015 11:32:51 +0200
> +Subject: [PATCH 1/2] Do not install to lib64 on x86_64 platforms.

Please generate your patches with "git format-patch -N" so that the 1/2
and 2/2 information is not mentioned.

Also, please add a Signed-off-by line with your name.

> +
> +---
> + cmake/cminpack_utils.cmake | 5 -----
> + 1 file changed, 5 deletions(-)
> +
> +diff --git a/cmake/cminpack_utils.cmake b/cmake/cminpack_utils.cmake
> +index e380d5c..a0896d5 100644
> +--- a/cmake/cminpack_utils.cmake
> ++++ b/cmake/cminpack_utils.cmake
> +@@ -8,11 +8,6 @@ macro(GET_OS_INFO)
> +     if(NOT DEFINED CMINPACK_LIB_INSTALL_DIR)
> +     set(CMINPACK_LIB_INSTALL_DIR "lib")
> +     if(OS_LINUX)
> +-        if(${CMAKE_SYSTEM_PROCESSOR} STREQUAL "x86_64")
> +-            set(CMINPACK_LIB_INSTALL_DIR "lib64")
> +-        else(${CMAKE_SYSTEM_PROCESSOR} STREQUAL "x86_64")
> +-            set(CMINPACK_LIB_INSTALL_DIR "lib")
> +-        endif(${CMAKE_SYSTEM_PROCESSOR} STREQUAL "x86_64")

Is this patch really needed? Buildroot installs lib64 -> lib and
usr/lib64 -> usr/lib symbolic links, so it should just work even if
your package installs in lib64. Have you faced a specific issue?


> diff --git a/package/cminpack/cminpack-0002-Do-not-install-headers-cminpack.pc-and-FindCMinpack.patch b/package/cminpack/cminpack-0002-Do-not-install-headers-cminpack.pc-and-FindCMinpack.patch
> new file mode 100644
> index 0000000..c517ed1
> --- /dev/null
> +++ b/package/cminpack/cminpack-0002-Do-not-install-headers-cminpack.pc-and-FindCMinpack.patch
> @@ -0,0 +1,39 @@
> +From 2a213a12674c76e70171cf6f0813479613511a07 Mon Sep 17 00:00:00 2001
> +From: Mathieu Mirmont <mat@ampyxpower.com>
> +Date: Wed, 24 Jun 2015 12:26:22 +0200
> +Subject: [PATCH 2/2] Do not install headers, cminpack.pc and
> + FindCMinpack.cmake
> +

Same comments as the previous patch: naming, git format-patch -N and
Signed-off-by line.

But I'm also questioning why you are adding this patch. All those files
should clearly be installed in $(STAGING_DIR) so that other
programs/libraries can link against cminpack. And if you added this
because you're worried about polluting $(TARGET_DIR), then you
shouldn't be worried: we have some generic logic in Buildroot that
removes all header files, .pc files and various other
development-related files from $(TARGET_DIR). It is done at the end of
the build, right before generating the filesystem image.

> diff --git a/package/cminpack/cminpack.mk b/package/cminpack/cminpack.mk
> new file mode 100644
> index 0000000..229c5c2
> --- /dev/null
> +++ b/package/cminpack/cminpack.mk
> @@ -0,0 +1,7 @@

Please add the comment block we have in every package. Yes, it's a
silly useless comment block, but we have it in every package, so it
should be there as well :)

> +CMINPACK_VERSION = 1.3.4
> +CMINPACK_SOURCE = cminpack-$(CMINPACK_VERSION).tar.gz

This assignment is useless, as it is the default value.

> +CMINPACK_SITE = http://devernay.free.fr/hacks/cminpack
> +
> +CMINPACK_CONF_OPTS = -DUSE_FPIC=ON -DSHARED_LIBS=ON

This line makes the assumption that support for shared libraries is
available, which is not always the case. So you have two options here:

 1. Your package supports being built in static library only
    environment (which normally CMake based packages are capable of).
    In this case, you should support it.

 2. If for some reason, building in a static library only configuration
    isn't supported, then your package should "depends
    on !BR2_STATIC_LIBS".

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
