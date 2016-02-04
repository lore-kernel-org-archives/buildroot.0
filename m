From: Baruch Siach <baruch@tkos.co.il>
Date: Thu, 4 Feb 2016 15:48:33 +0200
Subject: [Buildroot] [PATCH 1/1] libbsd: upgrade to v0.8.2 and expand
 architecture support
In-Reply-To: <1454593238-5352-1-git-send-email-casantos@datacom.ind.br>
References: <1454593238-5352-1-git-send-email-casantos@datacom.ind.br>
Message-ID: <20160204134833.GM3529@sapphire.tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Carlos,

On Thu, Feb 04, 2016 at 11:40:38AM -0200, Carlos Santos wrote:
> There is no reason to limit libbsd to ARM, x86 and x86_64. MicroBlaze is the
> only architecture supported by Buildroot that is not supported by libbsd.
> 
> According to Arnout Vandecappelle, "the exclusion was "from the time that we
> only supported glibc for external toolchains and it didn't get too much
> attention. So we missed the fact that glibc doesn't include linux/a.out.h".
> 
> Signed-off-by: Carlos Santos <casantos@datacom.ind.br>
> ---
>  package/libbsd/Config.in         | 9 +++++----
>  package/libbsd/libbsd.hash       | 2 +-
>  package/libbsd/libbsd.mk         | 2 +-
>  package/netcat-openbsd/Config.in | 6 +++---
>  4 files changed, 10 insertions(+), 9 deletions(-)
> 
> diff --git a/package/libbsd/Config.in b/package/libbsd/Config.in
> index d521f05..f5012c1 100644
> --- a/package/libbsd/Config.in
> +++ b/package/libbsd/Config.in
> @@ -1,9 +1,10 @@
>  config BR2_PACKAGE_LIBBSD_ARCH_SUPPORTS
>  	bool
> -	# libbsd requires a.out.h, which is only available for those
> -	# architectures: arm, x86 (and alpha, currently not supported in Buildroot;
> -	# also m68k which is currently not enabled, so can't be tested.)
> -	default y if BR2_arm || BR2_i386 || BR2_x86_64
> +	# libbsd does not support the MicroBlaze ELF machine type (see local-elf.h)
> +	default y if !BR2_microblaze
> +
> +comment "libbsd does not support the MicroBlaze architecture"
> +	depends on !BR2_PACKAGE_LIBBSD_ARCH_SUPPORTS

Comments like this one are useless for architecture dependencies, since the 
user can't do much about that in most cases.

[...]

> --- a/package/netcat-openbsd/Config.in
> +++ b/package/netcat-openbsd/Config.in
> @@ -18,7 +18,7 @@ config BR2_PACKAGE_NETCAT_OPENBSD
>  
>  	  https://packages.debian.org/sid/netcat-openbsd
>  
> -comment "netcat-openbsd needs an (e)glibc toolchain w/ threads"
> -	depends on BR2_PACKAGE_LIBBSD_ARCH_SUPPORTS
> -	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_TOOLCHAIN_USES_GLIBC
> +comment "netcat-openbsd needs libbsd and an (e)glibc toolchain w/ threads"
> +	depends on !BR2_PACKAGE_LIBBSD_ARCH_SUPPORTS || \
> +		!BR2_TOOLCHAIN_HAS_THREADS || !BR2_TOOLCHAIN_USES_GLIBC

Why? Current dependency hides this comment for 
!BR2_PACKAGE_LIBBSD_ARCH_SUPPORTS, which is as it should be as per above.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
