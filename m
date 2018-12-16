From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 16 Dec 2018 15:21:42 +0100
Subject: [Buildroot] [PATCH] package/python-numpy: fix fenv build
 failure on ARCv2 with glibc
In-Reply-To: <20180302141604.42489-1-Evgeniy.Didin@synopsys.com>
References: <20180302141604.42489-1-Evgeniy.Didin@synopsys.com>
Message-ID: <20181216152142.7f2c768e@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri,  2 Mar 2018 17:16:04 +0300, Evgeniy Didin wrote:
> Building python-numpy on ARC HS with glibc fails due to missing FE_*
> definitions in <fenv.h>. There exceptions are not supported by
> ARCv2 architecture.
> Let's add patch, which disables compilation of a part of the
> code in which FE_* errors occur for ARC.
> 
> Signed-off-by: Evgeniy Didin <didin@synopsys.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Cc: Alexey Brodkin <abrodkin@synopsys.com>
> Cc: arc-buildroot at synopsys.com

Sorry for the slow feedback. I see two problem with this patch, see
below.


> +diff --git a/numpy/core/src/npymath/ieee754.c.src b/numpy/core/src/npymath/ieee754.c.src
> +index e63e409b6..944b2ea7c 100644
> +--- a/numpy/core/src/npymath/ieee754.c.src
> ++++ b/numpy/core/src/npymath/ieee754.c.src
> +@@ -612,7 +612,7 @@ void npy_set_floatstatus_invalid(void)
> + }
> + 
> + 
> +-#elif (defined(__GLIBC__) && !defined(__UCLIBC__)) || defined(__APPLE__) || \
> ++#elif (defined(__GLIBC__) && !defined(__UCLIBC__) && !defined(__arc__)) || defined(__APPLE__) || \

You also need to adjust this in numpy/core/include/numpy/ufuncobject.h.
See patch 0001-no-fenv-on-uclibc.patch in Buildroot, and the comment in
numpy/core/include/numpy/ufuncobject.h that says:

"""
/* keep in sync with ieee754.c.src */
"""
> diff --git a/package/python-numpy/Config.in b/package/python-numpy/Config.in
> index 067085bf41..a1f31ef688 100644
> --- a/package/python-numpy/Config.in
> +++ b/package/python-numpy/Config.in
> @@ -3,7 +3,7 @@ config BR2_PACKAGE_PYTHON_NUMPY_ARCH_SUPPORTS
>  	# Numpy has some CPU specific code
>  	# ARCompact build fails due to toolchain issue
>  	# ARC HS38 build fails on glibc due to missing FE_* definitions

This comment is no longer accurate.

> -	default y if BR2_arc && BR2_archs38 && !BR2_TOOLCHAIN_USES_GLIBC
> +	default y if BR2_arc

Here you are doing two things:

 - Enabling for glibc

 - Enabling on non-HS38 ARC variants

While your commit log only mentions fixing the issue for glibc on ARC
HS. Also, there is a comment in python-numpy/Config.in that says
ARCompact build fails due to toolchain issue.

Could you clarify this ? If ARcompact is now working, is it really
related to the glibc exclusion ? If not, it should be a separate patch.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
