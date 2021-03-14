From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 14 Mar 2021 19:38:35 +0100
Subject: [Buildroot] [PATCH 7/8] package/opkg-utils: add opkg-utils as
 target pkg
In-Reply-To: <20210312200534.923-8-ryan.barnett@rockwellcollins.com>
References: <20210312200534.923-1-ryan.barnett@rockwellcollins.com>
 <20210312200534.923-8-ryan.barnett@rockwellcollins.com>
Message-ID: <20210314183835.GM2737665@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Ryan, All,

On 2021-03-12 14:05 -0600, Ryan Barnett spake thusly:
> Supports a use case of building container rootfs images where a matching
> target version of the tools is required for repackaging of a installer
>  archive.
> 
> Signed-off-by: Ryan Barnett <ryan.barnett@rockwellcollins.com>

Applied to master, with the following changes:

  - only select full-blown packages if busybox is not enabled
  - select BR2_PACKAGE_BUSYBOX_SHOW_OTHERS, instead of 'depends on'
  - allow on nios2 when busybox is enabled
  - add binutils binaries on target (for 'ar')
  - drop _DEPENDENCIES: they all are only runtime-dpeendencies
  - add comment when python(2) is enabled

Thanks!

Regards,
Yann E. MORIN.

> ---
>  package/Config.in                |  1 +
>  package/opkg-utils/Config.in     | 33 ++++++++++++++++++++++++++++++++
>  package/opkg-utils/opkg-utils.mk | 20 +++++++++++++++++++
>  3 files changed, 54 insertions(+)
>  create mode 100644 package/opkg-utils/Config.in
> 
> diff --git a/package/Config.in b/package/Config.in
> index 992e46a319..fb77ba134e 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -2337,6 +2337,7 @@ comment "See the manual:                                        "
>  comment "http://buildroot.org/manual.html#faq-no-binary-packages"
>  comment "-------------------------------------------------------"
>  	source "package/opkg/Config.in"
> +	source "package/opkg-utils/Config.in"
>  	source "package/rpm/Config.in"
>  endmenu
>  
> diff --git a/package/opkg-utils/Config.in b/package/opkg-utils/Config.in
> new file mode 100644
> index 0000000000..b60a48c19d
> --- /dev/null
> +++ b/package/opkg-utils/Config.in
> @@ -0,0 +1,33 @@
> +config BR2_PACKAGE_OPKG_UTILS
> +	bool "opkg-utils"
> +	depends on BR2_USE_MMU # bash, coreutils, findutils, tar
> +	depends on !BR2_nios2 # binutils
> +	# binutils, coreutils, diffutils, findutils, grep, gzip, python3, sed,
> +	# tar
> +	depends on BR2_USE_WCHAR
> +	depends on BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
> +	depends on BR2_TOOLCHAIN_HAS_THREADS # libffi
> +	depends on !BR2_STATIC_LIBS # python3
> +	depends on !BR2_PACKAGE_PYTHON # python3
> +	select BR2_PACKAGE_BASH
> +	select BR2_PACKAGE_BINUTILS
> +	select BR2_PACKAGE_BZIP2
> +	select BR2_PACKAGE_COREUTILS
> +	select BR2_PACKAGE_DIFFUTILS
> +	select BR2_PACKAGE_FINDUTILS
> +	select BR2_PACKAGE_GREP
> +	select BR2_PACKAGE_GZIP
> +	select BR2_PACKAGE_LZ4
> +	select BR2_PACKAGE_PYTHON3
> +	select BR2_PACKAGE_SED
> +	select BR2_PACKAGE_TAR
> +	select BR2_PACKAGE_XZ
> +	help
> +	  Helper scripts for use with the opkg package manager.
> +
> +	  https://git.yoctoproject.org/cgit/cgit.cgi/opkg-utils/
> +
> +comment "opkg-utils needs a toolchain w/ wchar, threads, dynamic library"
> +	depends on BR2_USE_MMU
> +	depends on !BR2_nios2
> +	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
> diff --git a/package/opkg-utils/opkg-utils.mk b/package/opkg-utils/opkg-utils.mk
> index d7f68b8555..a445c9f49e 100644
> --- a/package/opkg-utils/opkg-utils.mk
> +++ b/package/opkg-utils/opkg-utils.mk
> @@ -10,6 +10,21 @@ OPKG_UTILS_SITE_METHOD = git
>  OPKG_UTILS_LICENSE = GPL-2.0+
>  OPKG_UTILS_LICENSE_FILES = COPYING
>  
> +OPKG_UTILS_DEPENDENCIES += \
> +	bash \
> +	binutils \
> +	bzip2 \
> +	coreutils \
> +	diffutils \
> +	findutils \
> +	grep \
> +	gzip \
> +	lz4 \
> +	python3 \
> +	sed \
> +	tar \
> +	xz
> +
>  HOST_OPKG_UTILS_DEPENDENCIES += \
>  	host-coreutils \
>  	host-diffutils \
> @@ -19,8 +34,13 @@ HOST_OPKG_UTILS_DEPENDENCIES += \
>  	$(BR2_PYTHON3_HOST_DEPENDENCY) \
>  	host-xz
>  
> +define OPKG_UTILS_INSTALL_CMDS
> +	$(MAKE) -C $(@D) PREFIX=$(TARGET_DIR) install-utils
> +endef
> +
>  define HOST_OPKG_UTILS_INSTALL_CMDS
>  	$(MAKE) -C $(@D) PREFIX=$(HOST_DIR) install-utils
>  endef
>  
> +$(eval $(generic-package))
>  $(eval $(host-generic-package))
> -- 
> 2.17.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
