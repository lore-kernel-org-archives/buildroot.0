From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 03 Feb 2015 19:23:43 +0100
Subject: [Buildroot] [PATCH v2] libgpg-error: bump version to 1.17
In-Reply-To: <1417435514-51375-1-git-send-email-Vincent.Riera@imgtec.com>
References: <1417435514-51375-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <54D1122F.4060301@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 01/12/14 13:05, Vicente Olivert Riera wrote:
> - Bump version to 1.17
> - Add a hash file
> - Add a hook to fix cross-compilation
> - Fix license and license files
> - Remove unnecessary <pkg>_CONFIG_SCRIPTS option
> - Add a BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS variable
> - Propagate the dependencies using that variable
> 
> Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>

 Hi Vicente,

 Sorry to be so late with this, but it's a tricky patch because it basically
kills so many packages on some architectures... But at the BR developer day we
decided that it should be OK to do that, there's anyway not much we can do about it.

[snip]
> diff --git a/package/libgcrypt/Config.in b/package/libgcrypt/Config.in
> index dd8f270..6832a01 100644
> --- a/package/libgcrypt/Config.in
> +++ b/package/libgcrypt/Config.in
> @@ -1,5 +1,6 @@
>  config BR2_PACKAGE_LIBGCRYPT
>  	bool "libgcrypt"
> +	depends on BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS

 There's a whole bunch of packages that select libgcrypt: cppcms, crda,
cryptsetup, kodi, libmicrohttpd, network-manager, ntfs-3g, strongswan,
wireshark. Plus their reverse dependencies. Oh, and also systemd but I think
that already has similar restrictions.

>  	select BR2_PACKAGE_LIBGPG_ERROR
>  	help
>  	  LibGCrypt is GNU's basic cryptographic library.
> diff --git a/package/libgpg-error/Config.in b/package/libgpg-error/Config.in
> index 8287f98..18c348e 100644
> --- a/package/libgpg-error/Config.in
> +++ b/package/libgpg-error/Config.in
> @@ -1,5 +1,15 @@
> +config BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS
> +	bool
> +	# see src/syscfg/
> +	default y if BR2_arm || BR2_armeb || BR2_i386 || BR2_mips || \

 You have aarch64 as well in the .mk file.

> +		BR2_mipsel || BR2_mips64 || BR2_mips64el || \
> +		BR2_m68k || BR2_powerpc || BR2_powerpc64 || \
> +		BR2_powerpc64le || BR2_sh4 || BR2_sh4eb || BR2_sh4a || \
> +		BR2_sh4aeb || BR2_sparc || BR2_x86_64
> +
>  config BR2_PACKAGE_LIBGPG_ERROR
>  	bool "libgpg-error"
> +	depends on BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS
>  	help
>  	  Libgpg-error is a small library with error codes and
>  	  descriptions shared by most GnuPG related software.
> diff --git a/package/libgpg-error/libgpg-error.hash b/package/libgpg-error/libgpg-error.hash
> new file mode 100644
> index 0000000..5a736b0
> --- /dev/null
> +++ b/package/libgpg-error/libgpg-error.hash
> @@ -0,0 +1,2 @@
> +# From https://www.gnupg.org/download/integrity_check.html
> +sha1  ba5858b2947e7272dd197c87bac9f32caf29b256  libgpg-error-1.17.tar.bz2
> diff --git a/package/libgpg-error/libgpg-error.mk b/package/libgpg-error/libgpg-error.mk
> index 9f5f6c2..71d5a94 100644
> --- a/package/libgpg-error/libgpg-error.mk
> +++ b/package/libgpg-error/libgpg-error.mk
> @@ -4,11 +4,58 @@
>  #
>  ################################################################################
>  
> -LIBGPG_ERROR_VERSION = 1.12
> +LIBGPG_ERROR_VERSION = 1.17

 By now there's a 1.18.

> +LIBGPG_ERROR_SOURCE = libgpg-error-$(LIBGPG_ERROR_VERSION).tar.bz2
>  LIBGPG_ERROR_SITE = ftp://ftp.gnupg.org/gcrypt/libgpg-error
> -LIBGPG_ERROR_LICENSE = LGPLv2.1+
> -LIBGPG_ERROR_LICENSE_FILES = COPYING.LIB
> +LIBGPG_ERROR_LICENSE = GPLv2 LGPLv2.1

 Can this be a bit more specific about which parts are which license? Or is it
completely dual-licensed? Are you sure it is without + for both of them? Perhaps
you can expand on this in the commit log.

> +LIBGPG_ERROR_LICENSE_FILES = COPYING COPYING.LIB
>  LIBGPG_ERROR_INSTALL_STAGING = YES
> -LIBGPG_ERROR_CONFIG_SCRIPTS = gpg-error-config
> +
> +ifeq ($(findstring mips,$(BR2_ARCH)),aarch64)

 mips? aarch64?

> +LIBGPG_ERROR_TRIPLET = unknown-linux-gnu

 Since this is common to most archs, perhaps it's better to set some defaults
before the conditions (and better use $(ARCH) which is already qstripped):

LIBGPG_ERROR_TRIPLET = unknown-linux-gnu
LIBGPG_ERROR_ARCH = $(ARCH)

ifeq ($(findstring arm,$(BR2_ARCH)),arm)
LIBGPG_ERROR_TRIPLET = unknown-linux-gnu$(ABI)
LIBGPG_ERROR_ARCH = arm
else ifeq ($(findstring mips,$(BR2_ARCH)),mips)
...

> +LIBGPG_ERROR_ARCH = aarch64
> +else ifeq ($(findstring arm,$(BR2_ARCH)),arm)
> +LIBGPG_ERROR_TRIPLET = unknown-linux-gnu$(ABI)
> +LIBGPG_ERROR_ARCH = arm
> +else ifeq ($(findstring m68k,$(BR2_ARCH)),m68k)
> +LIBGPG_ERROR_TRIPLET = unknown-linux-gnu
> +LIBGPG_ERROR_ARCH = m68k
> +else ifeq ($(findstring mips,$(BR2_ARCH)),mips)
> +ifeq ($(findstring el,$(BR2_ARCH)),el)
> +LIBGPG_ERROR_TRIPLET = unknown-linux-gnu
> +LIBGPG_ERROR_ARCH = mipsel
> +else
> +LIBGPG_ERROR_TRIPLET = unknown-linux-gnu
> +LIBGPG_ERROR_ARCH = mips
> +endif
> +else ifeq ($(findstring powerpc64le,$(BR2_ARCH)),powerpc64le)
> +LIBGPG_ERROR_TRIPLET = unknown-linux-gnu
> +LIBGPG_ERROR_ARCH = powerpc64le
> +else ifeq ($(findstring powerpc64,$(BR2_ARCH)),powerpc64)
> +LIBGPG_ERROR_TRIPLET = unknown-linux-gnu
> +LIBGPG_ERROR_ARCH = powerpc64
> +else ifeq ($(findstring powerpc,$(BR2_ARCH)),powerpc)
> +LIBGPG_ERROR_TRIPLET = unknown-linux-gnu
> +LIBGPG_ERROR_ARCH = powerpc
> +else ifeq ($(findstring sh4,$(BR2_ARCH)),sh4)
> +LIBGPG_ERROR_TRIPLET = unknown-linux-gnu
> +LIBGPG_ERROR_ARCH = sh4
> +else ifeq ($(findstring sparc,$(BR2_ARCH)),sparc)
> +LIBGPG_ERROR_TRIPLET = unknown-linux-gnu
> +LIBGPG_ERROR_ARCH = sparc
> +else ifeq ($(findstring x86_64,$(BR2_ARCH)),x86_64)
> +LIBGPG_ERROR_TRIPLET = pc-linux-gnu
> +LIBGPG_ERROR_ARCH = x86_64
> +else
> +LIBGPG_ERROR_TRIPLET = pc-linux-gnu
> +LIBGPG_ERROR_ARCH = i486
> +endif
> +
> +define LIBGPG_ERROR_FIX_CROSS_COMPILATION
> +	cd $(@D)/src/syscfg && \
> +	ln -s lock-obj-pub.$(LIBGPG_ERROR_ARCH)-$(LIBGPG_ERROR_TRIPLET).h \
> +		lock-obj-pub.$(GNU_TARGET_NAME).h
> +endef
> +LIBGPG_ERROR_PRE_CONFIGURE_HOOKS += LIBGPG_ERROR_FIX_CROSS_COMPILATION
>  
>  $(eval $(autotools-package))
> diff --git a/package/libgpgme/Config.in b/package/libgpgme/Config.in
> index e176dac..4896f4d 100644
> --- a/package/libgpgme/Config.in
> +++ b/package/libgpgme/Config.in
> @@ -1,6 +1,7 @@
>  config BR2_PACKAGE_LIBGPGME
>  	bool "libgpgme"
>  	depends on BR2_USE_MMU # libassuan
> +	depends on BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS

 Reverse dependencies on opkg and php-gnupg.


 BTW, to check that the dependency chains are OK, you can create a testconfig
file that sets BR2_PACKAGE_LIBGPG_ERROR=y and also its dependencies, and then run

while true; do KCONFIG_ALLCONFIG=$(PWD)/testconfig make randconfig; done

When there is something wrong with the dependency chains, randconfig will
complain. Well, actually, until my patch for fixing the legacy handling for
randconfig is merged

 Regards,
 Arnout

>  	#gnupg is not needed to build, but at runtime.
>  	select BR2_PACKAGE_GNUPG if !BR2_PACKAGE_GNUPG2
>  	select BR2_PACKAGE_LIBGPG_ERROR
[snip]


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
