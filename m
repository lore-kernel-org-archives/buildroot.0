From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 26 Feb 2020 22:21:43 +0100
Subject: [Buildroot] [PATCH] package/eudev: add openrc init support
In-Reply-To: <20200225024359.27220-1-unixmania@gmail.com>
References: <20200225024359.27220-1-unixmania@gmail.com>
Message-ID: <20200226212143.GB8743@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Carlos, All,

On 2020-02-24 23:43 -0300, unixmania at gmail.com spake thusly:
> From: Carlos Santos <unixmania@gmail.com>
> 
> Add a udev-gentoo-scripts subpackage with the Gentoo scripts for openrc
> and select it when BR2_INIT_OPENRC=y.
> 
> Signed-off-by: Carlos Santos <unixmania@gmail.com>
> ---
> I think this is worst than https://patchwork.ozlabs.org/patch/1243458/
> ---
>  package/eudev/Config.in                       |  3 +++
>  package/eudev/eudev.mk                        |  7 +++++++
>  package/eudev/udev-gentoo-scripts/Config.in   |  6 ++++++
>  .../udev-gentoo-scripts.hash                  |  3 +++
>  .../udev-gentoo-scripts.mk                    | 20 +++++++++++++++++++
>  5 files changed, 39 insertions(+)
>  create mode 100644 package/eudev/udev-gentoo-scripts/Config.in
>  create mode 100644 package/eudev/udev-gentoo-scripts/udev-gentoo-scripts.hash
>  create mode 100644 package/eudev/udev-gentoo-scripts/udev-gentoo-scripts.mk
> 
> diff --git a/package/eudev/Config.in b/package/eudev/Config.in
> index b1d2f37a72..ef5da7dfb1 100644
> --- a/package/eudev/Config.in
> +++ b/package/eudev/Config.in
> @@ -5,6 +5,7 @@ config BR2_PACKAGE_EUDEV
>  	depends on BR2_USE_WCHAR # needs C99 compiler
>  	depends on !BR2_STATIC_LIBS # kmod
>  	select BR2_PACKAGE_HAS_UDEV
> +	select BR2_PACKAGE_UDEV_GENTOO_SCRIPTS if BR2_INIT_OPENRC
>  	select BR2_PACKAGE_UTIL_LINUX
>  	select BR2_PACKAGE_UTIL_LINUX_LIBBLKID
>  	select BR2_PACKAGE_KMOD
> @@ -42,3 +43,5 @@ comment "eudev needs eudev /dev management"
>  comment "eudev needs a toolchain w/ wchar, dynamic library"
>  	depends on BR2_USE_MMU
>  	depends on !BR2_USE_WCHAR || BR2_STATIC_LIBS
> +
> +source package/eudev/udev-gentoo-scripts/Config.in

Why do you source it from the eudev package? You should treat it like
any other package; eudev will select it when it needs it.

We already have similar stuff, like the appropriate skeleton is
selected depending on the init system that is enabled. Or the
musl-compat-headers that is automatically selected by musl-based
toolchains...

> diff --git a/package/eudev/eudev.mk b/package/eudev/eudev.mk
> index 99b5befd09..ff06ae7d3b 100644
> --- a/package/eudev/eudev.mk
> +++ b/package/eudev/eudev.mk
> @@ -48,6 +48,11 @@ define EUDEV_INSTALL_INIT_SYSV
>  	$(INSTALL) -D -m 0755 package/eudev/S10udev $(TARGET_DIR)/etc/init.d/S10udev
>  endef
>  
> +# Avoid installing S10udev

What about being a bit more verbose:

    # Avoid installing the sysv S10udec script with openrc, as the
    # service is started by a unit from the udev-gentoo-scripts package.

> +define EUDEV_INSTALL_INIT_OPENRC
> +	true
> +endef
> +
>  # Required by default rules for input devices
>  define EUDEV_USERS
>  	- - input -1 * - - - Input device group
> @@ -92,3 +97,5 @@ HOST_EUDEV_ROOTFS_PRE_CMD_HOOKS += HOST_EUDEV_RM_HWDB_SRC
>  
>  $(eval $(autotools-package))
>  $(eval $(host-autotools-package))
> +
> +include package/eudev/udev-gentoo-scripts/udev-gentoo-scripts.mk

Ditto: no need to source it from eudev.

> diff --git a/package/eudev/udev-gentoo-scripts/Config.in b/package/eudev/udev-gentoo-scripts/Config.in
> new file mode 100644
> index 0000000000..9d6944354d
> --- /dev/null
> +++ b/package/eudev/udev-gentoo-scripts/Config.in

Move it with (almost) all the other packages, into package/udev-gentoo-scripts/
(i.e. not in a subdir of eudev).

> @@ -0,0 +1,6 @@
> +config BR2_PACKAGE_UDEV_GENTOO_SCRIPTS
> +	bool
> +	depends on BR2_PACKAGE_EUDEV
> +	depends on BR2_INIT_OPENRC
> +	help
> +	  Init scripts for eudev.
> diff --git a/package/eudev/udev-gentoo-scripts/udev-gentoo-scripts.hash b/package/eudev/udev-gentoo-scripts/udev-gentoo-scripts.hash
> new file mode 100644
> index 0000000000..60563baae0
> --- /dev/null
> +++ b/package/eudev/udev-gentoo-scripts/udev-gentoo-scripts.hash
> @@ -0,0 +1,3 @@
> +# Locally calculated
> +sha256 b206f72c93cd2e51ed59061931918a9c23c3c1f7e6caffacc9d4f8915a42c30a  udev-gentoo-scripts-33.tar.bz2
> +sha256 329f95829088b95650b9012ae688f09baa1637985425a7964d33683363f48702  init.d/udev-settle
> diff --git a/package/eudev/udev-gentoo-scripts/udev-gentoo-scripts.mk b/package/eudev/udev-gentoo-scripts/udev-gentoo-scripts.mk
> new file mode 100644
> index 0000000000..c8a642ece3
> --- /dev/null
> +++ b/package/eudev/udev-gentoo-scripts/udev-gentoo-scripts.mk
> @@ -0,0 +1,20 @@
> +################################################################################
> +#
> +# udev-gentoo-scripts
> +#
> +################################################################################
> +
> +UDEV_GENTOO_SCRIPTS_VERSION = 33
> +UDEV_GENTOO_SCRIPTS_SOURCE = udev-gentoo-scripts-$(UDEV_GENTOO_SCRIPTS_VERSION).tar.bz2
> +UDEV_GENTOO_SCRIPTS_SITE = https://gitweb.gentoo.org/proj/udev-gentoo-scripts.git/snapshot
> +UDEV_GENTOO_SCRIPTS_LICENSE = GPL-2.0
> +UDEV_GENTOO_SCRIPTS_LICENSE_FILES = init.d/udev-settle
> +
> +define UDEV_GENTOO_SCRIPTS_INSTALL_INIT_OPENRC
> +	$(MAKE1) -C $(@D) install DESTDIR=$(TARGET_DIR)
> +	$(INSTALL) -d -m 755 $(TARGET_DIR)/etc/runlevels/sysinit
> +	ln -s -f /etc/init.d/udev-settle /etc/init.d/udev-trigger \
> +		$(TARGET_DIR)/etc/runlevels/sysinit

Don't we also need to handle the 'udev' unit too?

Regards,
Yann E. MORIN.

> +endef
> +
> +$(eval $(generic-package))
> -- 
> 2.18.2
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
