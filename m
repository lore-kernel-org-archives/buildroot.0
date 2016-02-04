From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 4 Feb 2016 14:51:59 +0100
Subject: [Buildroot] [PATCH 1/1] libbsd: upgrade to v0.8.2 and expand
 architecture support
In-Reply-To: <1454593238-5352-1-git-send-email-casantos@datacom.ind.br>
References: <1454593238-5352-1-git-send-email-casantos@datacom.ind.br>
Message-ID: <56B3577F.6010403@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Carlos,

 We prefer things to be split up, so this could be a version bump and the
architecture support in separate patches. Most likely, the architecture support
will still be included in 2016.02 but the version bump may be dropped.

On 04-02-16 14:40, Carlos Santos wrote:
> There is no reason to limit libbsd to ARM, x86 and x86_64. MicroBlaze is the
> only architecture supported by Buildroot that is not supported by libbsd.
> 
> According to Arnout Vandecappelle, "the exclusion was "from the time that we
> only supported glibc for external toolchains and it didn't get too much
> attention. So we missed the fact that glibc doesn't include linux/a.out.h".

 The explanation is a bit too brief.

When libbsd still supported uClibc as a C library, we added the architecture
exclusions because uClibc's a.out.h includes linux/a.out.h. The latter only
exists for the specified architectures.

However, glibc doesn't include linux/a.out.h, it instead has its own
implementation and it adds a flag to indicate if a.out is supported on this
architecture or not.

Since libbsd currently only supports glibc-based toolchains, the architecture
exclusions are no longer valid.

On microblaze, the build still fails, but this time because of ELF support.
libbsd explicitly handles architectures and microblaze is not one of them (see
local-elf.h).


 Feel free to improve this further, of course.


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

 This is a good comment.

> +	default y if !BR2_microblaze
> +
> +comment "libbsd does not support the MicroBlaze architecture"
> +	depends on !BR2_PACKAGE_LIBBSD_ARCH_SUPPORTS

 This is not needed, we don't add comments for architectures, because there is
anyway nothing you can do about it. We only write comments for toolchain config
options that you can actually change. A comment like this is effectively saying
"change your platform" which is not very helpful.

>  
>  config BR2_PACKAGE_LIBBSD
>  	bool "libbsd"
> diff --git a/package/libbsd/libbsd.hash b/package/libbsd/libbsd.hash
> index be4ba50..f77c0aa 100644
> --- a/package/libbsd/libbsd.hash
> +++ b/package/libbsd/libbsd.hash
> @@ -1,2 +1,2 @@
>  # Locally calculated after checking pgp signature
> -sha256	9e8f34ffa9c8579c87965a55a82d8ac37a1dc64858f717b7c49452ade277cc62	libbsd-0.6.0.tar.xz
> +sha256	b2f644cae94a6e2fe109449c20ad79a0f6ee4faec2205b07eefa0020565e250a	libbsd-0.8.2.tar.xz

 Did you indeed check the signature?

> diff --git a/package/libbsd/libbsd.mk b/package/libbsd/libbsd.mk
> index 99a9572..634a614 100644
> --- a/package/libbsd/libbsd.mk
> +++ b/package/libbsd/libbsd.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -LIBBSD_VERSION = 0.6.0
> +LIBBSD_VERSION = 0.8.2
>  LIBBSD_SOURCE = libbsd-$(LIBBSD_VERSION).tar.xz
>  LIBBSD_SITE = http://libbsd.freedesktop.org/releases
>  LIBBSD_LICENSE = BSD-3c, MIT
> diff --git a/package/netcat-openbsd/Config.in b/package/netcat-openbsd/Config.in
> index 346561a..7da0477 100644
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

 This is wrong. The "depends on BR2_PACKAGE_LIBBSD_ARCH_SUPPORTS" is there
because we _don't_ want to show the comment on architectures where it's anyway
not supported.


 Regards,
 Arnout


>  ~
> 

-- 
Arnout Vandecappelle      arnout dot vandecappelle at essensium dot com
Senior Embedded Software Architect . . . . . . +32-478-010353 (mobile)
Essensium, Mind division . . . . . . . . . . . . . . http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium . . . . . BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
