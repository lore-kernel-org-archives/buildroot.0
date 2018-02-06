From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 6 Feb 2018 15:39:51 +0100
Subject: [Buildroot] [PATCH v4] systemd: allow to build with uClibc
 toolchains
In-Reply-To: <20170914030345.GA23395@waldemar-brodkorb.de>
References: <20170914030345.GA23395@waldemar-brodkorb.de>
Message-ID: <29bc2adb-0f3f-40c6-46bd-dbe4a31e5853@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 14-09-17 05:03, Waldemar Brodkorb wrote:
> We need to disable any systemd parts using either IDN or NSS.
> IDN is only disabled in C library function call to getnameinfo(),
> it does not effect libidn/libidn2 usage in systemd.
> 
> Tested with qemu-system-arm.
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>

 Hi Waldemar,

 We've left this patch for way too long, and now systemd has the meson-based
build system so it no longer takes the --gnuconf style configure options. Could
you respin please?

 Otherwise LGTM.

 Regards,
 Arnout

> ---                                                                                                                                                                                                                 
> v1 -> v2:                                                                                                                                                                                                           
>   - added Upstream commit URL suggested by Thomas Petazzoni                                                                                                                                                         
>   - rework enable/disable options suggested by Thomas Petazzoni                                                                                                                                                     
>   - extend commit message a little bit                                                                                                                                                                              
> v2 -> v3:                                                                                                                                                                                                           
>   - sync to latest master changes                                                                                                                                                                                   
>   - remove patches included upstream                                                                                                                                                                                
>   - disable features not usable with uClibc-ng lacking nss.h
> v3 -> v4:
>   - add comment about missing nss suggested by Arnout
>   - add extra parenthesis suggested by Arnout
> ---
>  package/systemd/Config.in  |  4 ++++
>  package/systemd/systemd.mk | 11 +++++++++++
>  system/Config.in           |  6 +++---
>  3 files changed, 18 insertions(+), 3 deletions(-)
> 
> diff --git a/package/systemd/Config.in b/package/systemd/Config.in
> index 7dfd7ca..6aeade2 100644
> --- a/package/systemd/Config.in
> +++ b/package/systemd/Config.in
> @@ -180,6 +180,7 @@ config BR2_PACKAGE_SYSTEMD_LOGIND
>  
>  config BR2_PACKAGE_SYSTEMD_MACHINED
>  	bool "enable machine daemon"
> +	depends on !BR2_TOOLCHAIN_USES_UCLIBC # needs nss
>  	help
>  	  systemd-machined is a system service that keeps track of
>  	  virtual machines and containers, and processes belonging to
> @@ -189,6 +190,7 @@ config BR2_PACKAGE_SYSTEMD_MACHINED
>  
>  config BR2_PACKAGE_SYSTEMD_MYHOSTNAME
>  	bool "enable myhostname NSS plugin"
> +	depends on !BR2_TOOLCHAIN_USES_UCLIBC # needs nss
>  	default y
>  	help
>  	  nss-myhostname is a plug-in module for the GNU Name Service
> @@ -244,6 +246,7 @@ config BR2_PACKAGE_SYSTEMD_RANDOMSEED
>  
>  config BR2_PACKAGE_SYSTEMD_RESOLVED
>  	bool "enable resolve daemon"
> +	depends on !BR2_TOOLCHAIN_USES_UCLIBC # needs nss
>  	default y
>  	help
>  	  systemd-resolved is a system service that provides network
> @@ -277,6 +280,7 @@ config BR2_PACKAGE_SYSTEMD_SMACK_SUPPORT
>  
>  config BR2_PACKAGE_SYSTEMD_SYSUSERS
>  	bool "enable sysusers support"
> +	depends on !BR2_TOOLCHAIN_USES_UCLIBC # needs nss
>  	help
>  	  systemd-sysusers creates system users and groups, based on
>  	  the file format and location specified in sysusers.d(5).
> diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
> index 9f286fd..55b8f23 100644
> --- a/package/systemd/systemd.mk
> +++ b/package/systemd/systemd.mk
> @@ -40,6 +40,17 @@ SYSTEMD_CONF_OPTS += \
>  	--with-default-dnssec=no \
>  	--without-python
>  
> +# disable unsupported features for non-glibc toolchains
> +ifeq ($(BR2_TOOLCHAIN_USES_GLIBC),y)
> +SYSTEMD_CONF_OPTS += \
> +	--enable-idn \
> +	--enable-nss-systemd
> +else
> +SYSTEMD_CONF_OPTS += \
> +	--disable-idn \
> +	--disable-nss-systemd
> +endif
> +
>  SYSTEMD_CFLAGS = $(TARGET_CFLAGS) -fno-lto
>  
>  # Override paths to a few utilities needed at runtime, to
> diff --git a/system/Config.in b/system/Config.in
> index b971492..d68d5ce 100644
> --- a/system/Config.in
> +++ b/system/Config.in
> @@ -127,7 +127,7 @@ config BR2_INIT_SYSV
>  config BR2_INIT_SYSTEMD
>  	bool "systemd"
>  	depends on BR2_PACKAGE_SYSTEMD_ARCH_SUPPORTS
> -	depends on BR2_TOOLCHAIN_USES_GLIBC
> +	depends on BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_UCLIBC
>  	depends on BR2_USE_WCHAR
>  	depends on BR2_TOOLCHAIN_HAS_THREADS
>  	depends on BR2_TOOLCHAIN_HAS_SSP
> @@ -137,8 +137,8 @@ config BR2_INIT_SYSTEMD
>  	select BR2_ROOTFS_MERGED_USR
>  	select BR2_PACKAGE_SYSTEMD
>  
> -comment "systemd needs a glibc toolchain, headers >= 3.10"
> -	depends on !(BR2_TOOLCHAIN_USES_GLIBC \
> +comment "systemd needs a glibc or uclibc toolchain, headers >= 3.10"
> +	depends on !((BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_UCLIBC) \
>  		&& BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_10)
>  
>  config BR2_INIT_NONE
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
