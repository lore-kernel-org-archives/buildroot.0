From: Romain Naour <romain.naour@gmail.com>
Date: Tue, 26 Jan 2016 00:16:23 +0100
Subject: [Buildroot] [PATCH 7/8] uclibc: remove support for the snapshot
 version
In-Reply-To: <1453148701-10036-8-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1453148701-10036-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1453148701-10036-8-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <56A6ACC7.40104@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

Le 18/01/2016 21:25, Thomas Petazzoni a ?crit :
> The snapshot version points to the original uClibc project, which is
> dead. Moreover, we no longer support "snapshot" versions for any other
> Buildroot component, so there is no reason to keep it for uClibc.
> 

Same here, no legacy handling for BR2_UCLIBC_VERSION_SNAPSHOT

Best regards,
Romain

> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  package/uclibc/Config.in              | 17 ---------------
>  package/uclibc/uClibc-snapshot.config | 41 -----------------------------------
>  package/uclibc/uclibc.hash            |  3 ---
>  package/uclibc/uclibc.mk              |  5 +----
>  4 files changed, 1 insertion(+), 65 deletions(-)
>  delete mode 100644 package/uclibc/uClibc-snapshot.config
> 
> diff --git a/package/uclibc/Config.in b/package/uclibc/Config.in
> index 7cbd45c..452043d 100644
> --- a/package/uclibc/Config.in
> +++ b/package/uclibc/Config.in
> @@ -30,32 +30,15 @@ choice
>  		select BR2_UCLIBC_VERSION_SUPPORTS_NPTL \
>  		       if !BR2_m68k && !BR2_x86_i386
>  
> -	config BR2_UCLIBC_VERSION_SNAPSHOT
> -		bool "daily snapshot"
> -		select BR2_UCLIBC_VERSION_SUPPORTS_LINUXTHREADS if !BR2_xtensa
> -		select BR2_UCLIBC_VERSION_SUPPORTS_LINUXTHREADS_OLD
> -		select BR2_UCLIBC_VERSION_SUPPORTS_NPTL \
> -		       if !BR2_x86_i386 && !BR2_xtensa
> -		depends on !(BR2_arc || BR2_mips64 || BR2_mips64el)
> -
>  endchoice
>  
> -config BR2_USE_UCLIBC_SNAPSHOT
> -	string "Date (yyyymmdd) of snapshot or 'snapshot' for latest"
> -	default "snapshot"
> -	depends on BR2_UCLIBC_VERSION_SNAPSHOT
> -	help
> -	  Use latest snapshot or one from a specific date?
> -
>  config BR2_UCLIBC_VERSION_STRING
>  	string
>  	default "1.0.11"		if BR2_UCLIBC_VERSION_NG
> -	default BR2_USE_UCLIBC_SNAPSHOT	if BR2_UCLIBC_VERSION_SNAPSHOT
>  
>  config BR2_UCLIBC_CONFIG
>  	string "uClibc configuration file to use?"
>  	default "package/uclibc/uClibc-ng.config" if BR2_UCLIBC_VERSION_NG
> -	default "package/uclibc/uClibc-snapshot.config" if BR2_UCLIBC_VERSION_SNAPSHOT
>  	help
>  	  Some people may wish to use their own modified uClibc configuration
>  	  file and will specify their config file location with this option.
> diff --git a/package/uclibc/uClibc-snapshot.config b/package/uclibc/uClibc-snapshot.config
> deleted file mode 100644
> index cbb4737..0000000
> --- a/package/uclibc/uClibc-snapshot.config
> +++ /dev/null
> @@ -1,41 +0,0 @@
> -DO_C99_MATH=y
> -KERNEL_HEADERS="/usr/src/linux/include"
> -# LDSO_CACHE_SUPPORT is not set
> -# UCLIBC_STATIC_LDCONFIG is not set
> -LDSO_RUNPATH=y
> -LINUXTHREADS_OLD=y
> -MALLOC_GLIBC_COMPAT=y
> -UCLIBC_HAS_OBSTACK=y
> -UCLIBC_HAS_UTMPX=y
> -UCLIBC_HAS_UTMP=y
> -UCLIBC_SUSV2_LEGACY=y
> -UCLIBC_SUSV3_LEGACY=y
> -UCLIBC_HAS_CONTEXT_FUNCS=y
> -UCLIBC_SUSV4_LEGACY=y
> -UCLIBC_HAS_PROGRAM_INVOCATION_NAME=y
> -UCLIBC_HAS_GETPT=y
> -UCLIBC_HAS_LIBUTIL=y
> -UCLIBC_HAS_OBSOLETE_BSD_SIGNAL=y
> -UCLIBC_USE_NETLINK=y
> -UCLIBC_SUPPORT_AI_ADDRCONFIG=y
> -UCLIBC_HAS_RESOLVER_SUPPORT=y
> -UCLIBC_HAS_LIBRESOLV_STUB=y
> -UCLIBC_HAS_LIBNSL_STUB=y
> -UCLIBC_HAS_CTYPE_CHECKED=y
> -UCLIBC_HAS_HEXADECIMAL_FLOATS=y
> -UCLIBC_HAS_GLIBC_CUSTOM_PRINTF=y
> -UCLIBC_HAS_STDIO_GETC_MACRO=y
> -UCLIBC_HAS_STDIO_PUTC_MACRO=y
> -UCLIBC_HAS_FOPEN_EXCLUSIVE_MODE=y
> -UCLIBC_HAS_GLIBC_CUSTOM_STREAMS=y
> -UCLIBC_HAS_PRINTF_M_SPEC=y
> -# UCLIBC_HAS_REGEX_OLD is not set
> -# UCLIBC_HAS_FNMATCH_OLD is not set
> -UCLIBC_HAS_NFTW=y
> -UCLIBC_HAS_FTW=y
> -UCLIBC_HAS_GNU_GLOB=y
> -RUNTIME_PREFIX="/"
> -DEVEL_PREFIX="/usr/"
> -UCLIBC_HAS_SSP=y
> -UCLIBC_BUILD_NOW=y
> -# DOSTRIP is not set
> diff --git a/package/uclibc/uclibc.hash b/package/uclibc/uclibc.hash
> index 0a1fdf6..ecc8cf9 100644
> --- a/package/uclibc/uclibc.hash
> +++ b/package/uclibc/uclibc.hash
> @@ -1,5 +1,2 @@
>  # From http://www.uclibc-ng.org/
>  sha256  2fdc6b9015f8049be0eb12a5e3e446de471fb80061115afd8d72ea582cb22b74        uClibc-ng-1.0.11.tar.xz
> -
> -# No hash for this git snapshot
> -none  xxx  uClibc-7bf35c8b7d4a1f97174eb49f47f33946b282114c.tar.gz
> diff --git a/package/uclibc/uclibc.mk b/package/uclibc/uclibc.mk
> index ad5f607..44b8a97 100644
> --- a/package/uclibc/uclibc.mk
> +++ b/package/uclibc/uclibc.mk
> @@ -9,10 +9,7 @@ UCLIBC_SOURCE ?= uClibc-$(UCLIBC_VERSION).tar.bz2
>  UCLIBC_LICENSE = LGPLv2.1+
>  UCLIBC_LICENSE_FILES = COPYING.LIB
>  
> -ifeq ($(BR2_UCLIBC_VERSION_SNAPSHOT),y)
> -UCLIBC_SITE = http://www.uclibc.org/downloads/snapshots
> -BR_NO_CHECK_HASH_FOR += $(UCLIBC_SOURCE)
> -else ifeq ($(BR2_UCLIBC_VERSION_NG),y)
> +ifeq ($(BR2_UCLIBC_VERSION_NG),y)
>  UCLIBC_SITE = http://downloads.uclibc-ng.org/releases/$(UCLIBC_VERSION)
>  UCLIBC_SOURCE = uClibc-ng-$(UCLIBC_VERSION).tar.xz
>  endif
> 
