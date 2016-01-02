From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 2 Jan 2016 23:59:34 +0100
Subject: [Buildroot] [PATCH 1/1] package/libgpg-error: bump to version
	1.21
In-Reply-To: <1451762923-15985-1-git-send-email-joerg.krause@embedded.rocks>
References: <1451762923-15985-1-git-send-email-joerg.krause@embedded.rocks>
Message-ID: <56885656.8080505@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 02-01-16 20:28, J?rg Krause wrote:
> This patch is based on a patch sent by Vicente Olivert Riera and commented by
> Arnout Vandecappelle [1].
> 
> - Bump version to 1.21
> - Add a hook to fix cross-compilation
> - Fix license and license files
> - Remove patch applied upstream
> - Add a BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS variable
> - Propagate the dependencies using that variable:
>     * package/gnupg2
>     * package/libassuan
>     * package/libgcrypt
>     * package/libgpgme
>     * package/libksba
>     * package/netatalk
>     * package/opkg
>     * package/vpnc
>     * package/cppcms
>     * package/crda
>     * package/gcr
>     * package/kodi
>     * package/libmicrohttpd
>     * package/network-manager
>     * package/ntfs-3g
>     * package/php-gnupg
>     * package/rng-tools
>     * package/strongswan
>     * package/systemd
> 
> [1] http://patchwork.ozlabs.org/patch/416427/
> 
> Cc: Arnout Vandecappelle <arnout@mind.be>
> Cc: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
> Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
> ---
>  package/cppcms/Config.in                           |  1 +
>  package/crda/Config.in                             |  1 +
>  package/gcr/Config.in                              |  1 +
>  package/gnupg2/Config.in                           |  1 +
>  package/kodi/Config.in                             |  1 +
>  package/libassuan/Config.in                        |  1 +
>  package/libgcrypt/Config.in                        |  1 +
>  .../0001-avoid-breakage-with-gcc-5.patch           | 56 ----------------------
>  package/libgpg-error/Config.in                     | 12 +++++
>  package/libgpg-error/libgpg-error.hash             |  2 +-
>  package/libgpg-error/libgpg-error.mk               | 37 +++++++++++---
>  package/libgpgme/Config.in                         |  1 +
>  package/libksba/Config.in                          |  1 +
>  package/libmicrohttpd/Config.in                    |  1 +
>  package/netatalk/Config.in                         |  1 +
>  package/network-manager/Config.in                  |  1 +
>  package/ntfs-3g/Config.in                          |  1 +
>  package/opkg/Config.in                             |  1 +
>  package/php-gnupg/Config.in                        |  1 +
>  package/rng-tools/Config.in                        |  1 +
>  package/strongswan/Config.in                       |  1 +
>  package/systemd/Config.in                          |  1 +
>  package/vpnc/Config.in                             |  1 +
>  23 files changed, 63 insertions(+), 63 deletions(-)
>  delete mode 100644 package/libgpg-error/0001-avoid-breakage-with-gcc-5.patch
> 
> diff --git a/package/cppcms/Config.in b/package/cppcms/Config.in
> index 85ba118..4d38883 100644
> --- a/package/cppcms/Config.in
> +++ b/package/cppcms/Config.in
> @@ -4,6 +4,7 @@ config BR2_PACKAGE_CPPCMS
>  	select BR2_PACKAGE_PCRE
>  	select BR2_PACKAGE_LIBGCRYPT
>  	depends on BR2_INSTALL_LIBSTDCPP
> +	depends on BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS # libgcrypt

 libgcrypt? Shouldn't that be libgpg-error?

>  	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
>  	depends on !BR2_STATIC_LIBS # dlopen()
>  	depends on BR2_USE_WCHAR
[snip]
> diff --git a/package/libgpg-error/Config.in b/package/libgpg-error/Config.in
> index 8287f98..f948c04 100644
> --- a/package/libgpg-error/Config.in
> +++ b/package/libgpg-error/Config.in
> @@ -1,5 +1,17 @@
> +config BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS
> +	bool
> +	# see src/syscfg/
> +	default y if BR2_aarch64 || BR2_aarch64_eb || BR2_arm	|| \
> +		BR2_armeb	|| BR2_i386	|| BR2_mips	|| \
> +		BR2_mipsel	|| BR2_mips64	|| BR2_mips64el	|| \
> +		BR2_m68k	|| BR2_powerpc	|| BR2_powerpc64 || \
> +		BR2_powerpc64le	|| BR2_sh4	|| BR2_sh4eb	|| \
> +		BR2_sh4a	|| BR2_sh4aeb	|| BR2_sparc	|| \
> +		BR2_sparc64	|| BR2_x86_64
> +
>  config BR2_PACKAGE_LIBGPG_ERROR
>  	bool "libgpg-error"
> +	depends on BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS
>  	help
>  	  Libgpg-error is a small library with error codes and

 It's mind-boggling that "a small library with error codes" needs
architecture-specific handling...

>  	  descriptions shared by most GnuPG related software.
> diff --git a/package/libgpg-error/libgpg-error.hash b/package/libgpg-error/libgpg-error.hash
> index 76aff5d..7f0c27e 100644
> --- a/package/libgpg-error/libgpg-error.hash
> +++ b/package/libgpg-error/libgpg-error.hash
> @@ -1,2 +1,2 @@
>  # Locally calculated after checking pgp signature
> -sha256	fa6fbf315efa33a943751e3c4d04ea3d41ddf4bdee5727de3c0978277d52923b	libgpg-error-1.12.tar.gz
> +sha256	af1b6e842b564ae711d71158bba97a474ba914eeba0ba288865c68b14fc6acba	libgpg-error-1.21.tar.gz
> diff --git a/package/libgpg-error/libgpg-error.mk b/package/libgpg-error/libgpg-error.mk
> index 52b7058..1a55a39 100644
> --- a/package/libgpg-error/libgpg-error.mk
> +++ b/package/libgpg-error/libgpg-error.mk
> @@ -4,14 +4,39 @@
>  #
>  ################################################################################
>  
> -LIBGPG_ERROR_VERSION = 1.12
> +LIBGPG_ERROR_VERSION = 1.21
>  LIBGPG_ERROR_SITE = ftp://ftp.gnupg.org/gcrypt/libgpg-error
> -LIBGPG_ERROR_LICENSE = LGPLv2.1+
> -LIBGPG_ERROR_LICENSE_FILES = COPYING.LIB
> +LIBGPG_ERROR_LICENSE = GPLv2+, LGPLv2.1+
> +LIBGPG_ERROR_LICENSE_FILES = COPYING COPYING.LIB

 The files that end up on the target are all LGPLv2.1+, it's only the scripts
that generate some of the source files that are GPLv2+. Which is probably the
reason why only the LGPLv2.1+ was mentioned originally. So to make it crystal clear:

LIBGPG_ERROR_LICENSE = LGPLv2.1+, GPLv2+ (build scripts)
LIBGPG_ERROR_LICENSE_FILES = COPYING.LIB COPYING

>  LIBGPG_ERROR_INSTALL_STAGING = YES
>  LIBGPG_ERROR_CONFIG_SCRIPTS = gpg-error-config
> -# we patch src/Makefile.am
> -LIBGPG_ERROR_AUTORECONF = YES
> -LIBGPG_ERROR_GETTEXTIZE = YES
> +
> +# default
> +LIBGPG_ERROR_ARCH = $(ARCH)
> +LIBGPG_ERROR_TRIPLET = unknown-linux-gnu
> +
> +# special treatments
> +ifeq ($(ARCH),$(filter $(ARCH),aarch64_eb))

 The filter is kind of redundant here. But I guess it's nice to have the same
construct everywhere.

> +LIBGPG_ERROR_ARCH = aarch64
> +else ifeq ($(ARCH),$(filter $(ARCH),arm armeb))
> +LIBGPG_ERROR_ARCH = arm
> +LIBGPG_ERROR_TRIPLET = unknown-linux-gnu$(ABI)
> +else ifeq ($(ARCH),$(filter $(ARCH),mips64))
> +LIBGPG_ERROR_ARCH = mips
> +else ifeq ($(ARCH),$(filter $(ARCH),sh4eb sh4a sh4aeb))
> +LIBGPG_ERROR_ARCH = sh4
> +else ifeq ($(findstring x86_64,$(ARCH)),x86_64)
> +LIBGPG_ERROR_TRIPLET = pc-linux-gnu
> +else ifeq ($(ARCH),$(filter $(ARCH),i386 i486 i586 i686))
> +LIBGPG_ERROR_ARCH = i686
> +LIBGPG_ERROR_TRIPLET = pc-linux-gnu
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
> index e176dac..59d9fa3 100644
> --- a/package/libgpgme/Config.in
> +++ b/package/libgpgme/Config.in
> @@ -1,5 +1,6 @@
>  config BR2_PACKAGE_LIBGPGME
>  	bool "libgpgme"
> +	depends on BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS

 Missing comment. Also in other packages.

>  	depends on BR2_USE_MMU # libassuan
>  	#gnupg is not needed to build, but at runtime.
>  	select BR2_PACKAGE_GNUPG if !BR2_PACKAGE_GNUPG2

[snip]

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
