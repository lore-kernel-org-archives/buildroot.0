From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 29 Apr 2017 14:08:22 +0200
Subject: [Buildroot] [PATCH 1/2] ne10: bump to version 1.2.1. Remove
 obsolete patch file for modifying thumb code generation.
In-Reply-To: <1493418486-109149-1-git-send-email-g4@novadsp.com>
References: <1493418486-109149-1-git-send-email-g4@novadsp.com>
Message-ID: <20170429140822.1203aa3d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Since the change is not trivial, it requires a more verbose commit log.
You're doing much more than bumping.

Also, the commit title should be shorter, just "ne10: bump to version
1.2.1".

On Fri, 28 Apr 2017 23:28:05 +0100, J Evans wrote:

>  ...sts-don-t-hard-code-thumb-code-generation.patch | 29 ----------------------

What makes you think this patch is no longer needed? The CMakeLists.txt
is still hardcoding -mthumb:

    if("${NE10_TARGET_ARCH}" STREQUAL "armv7")
      set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -mthumb-interwork -mthumb -march=armv7-a -mfpu=vfp3 -funsafe-math-optimizations")
      set(CMAKE_ASM_FLAGS "${CMAKE_C_FLAGS} -mthumb-interwork -mthumb -march=armv7-a -mfpu=neon")


> diff --git a/package/ne10/Config.in b/package/ne10/Config.in
> old mode 100644
> new mode 100755

Why are you making this file executable? Are you working on Windows?

> index 8d37579..ebd23a6
> --- a/package/ne10/Config.in
> +++ b/package/ne10/Config.in
> @@ -1,7 +1,6 @@
>  config BR2_PACKAGE_NE10
>  	bool "ne10"
> -	depends on BR2_arm
> -	depends on BR2_ARM_FPU_NEON || BR2_ARM_FPU_NEON_VFPV4
> +	depends on BR2_aarch64 || (BR2_arm && (BR2_ARM_FPU_NEON || BR2_ARM_FPU_NEON_VFPV4))

I think it would be nicer to introduce a blind option:

config BR2_PACKAGE_NE10_ARCH_SUPPORTS
	bool
	default y if BR2_aarch64
	default y if BR2_arm && (BR2_ARM_FPU_NEON || BR2_ARM_FPU_NEON_VFPV4)

and then use it in BR2_PACKAGE_NE10 and the Config.in comment.


> old mode 100644
> new mode 100755
> index db5b6f1..923e660
> --- a/package/ne10/ne10.hash
> +++ b/package/ne10/ne10.hash

Why are you making this file executable ?

> @@ -1,2 +1,2 @@
> -# Locally calculated
> -sha256 450dac5bb3a2351019ae23792e97c3bf965d16a21c0598b73cea9fbc3b3a56af  ne10-v1.2.0.tar.gz
> +# Locally calculated after checking pgp signature
> +sha256	dd1a96610c0692cc80154ae123edd5d25e6e0a3f81d0c16a96425f3ef57b9929	ne10-v1.2.1.tar.gz
> diff --git a/package/ne10/ne10.mk b/package/ne10/ne10.mk
> old mode 100644
> new mode 100755
> index cb303bd..0da862c
> --- a/package/ne10/ne10.mk
> +++ b/package/ne10/ne10.mk

Same question.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
