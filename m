From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 04 Nov 2012 01:01:10 +0100
Subject: [Buildroot] [PATCH 08/18] lmbench: add support to use libtirpc
 when available
In-Reply-To: <50a55c7abef1a7f980e000258521ecc703226b31.1351964808.git.thomas.petazzoni@free-electrons.com>
References: <cover.1351964808.git.thomas.petazzoni@free-electrons.com>
 <50a55c7abef1a7f980e000258521ecc703226b31.1351964808.git.thomas.petazzoni@free-electrons.com>
Message-ID: <5095B046.7080604@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 11/03/12 18:47, Thomas Petazzoni wrote:
> -	# Uses pmap_set, pmap__unset, pmap_getport, etc.
> -	depends on BR2_TOOLCHAIN_HAS_NATIVE_RPC
> +	select BR2_PACKAGE_LIBTIRPC if !BR2_TOOLCHAIN_HAS_NATIVE_RPC
>   	help
>   	  LMbench is a suite of simple, portable,
>   	  ANSI/C microbenchmarks for UNIX/POSIX.
>
>   	http://sourceforge.net/projects/lmbench/
> -
> -comment "lmbench requires a toolchain with RPC support"
> -	depends on !BR2_TOOLCHAIN_HAS_NATIVE_RPC
> diff --git a/package/lmbench/lmbench.mk b/package/lmbench/lmbench.mk
> index d3d0f8f..1932adb 100644
> --- a/package/lmbench/lmbench.mk
> +++ b/package/lmbench/lmbench.mk
> @@ -9,6 +9,15 @@ LMBENCH_SITE:=http://downloads.sourceforge.net/project/lmbench/development/lmben
>   LMBENCH_LICENSE =  lmbench license (based on GPLv2)
>   LMBENCH_LICENSE_FILES = COPYING COPYING-2
>
> +LMBENCH_CFLAGS = $(TARGET_CFLAGS)
> +LMBENCH_LDLIBS = $(TARGET_LDFLAGS)
> +
> +ifeq ($(BR2_PACKAGE_LIBTIRPC),y)
> +LMBENCH_DEPENDENCIES += libtirpc
> +LMBENCH_CFLAGS += -I$(STAGING_DIR)/usr/include/tirpc/
> +LMBENCH_LDFLAGS += -ltirpc
> +endif

  For discussion tomorrow: do we want to use a similar strategy as Yann's proposal
for gettext, i.e.:

select BR2_NEEDS_RPC

LMBENCH_DEPENDENCIES += $(rpc-dependency)
LMBENCH_CFLAGS       += $(rpc-cflags)
LMBENCH_LDFLAGS      += $(rpc-ldflags)


  Regards,
  Arnout

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
