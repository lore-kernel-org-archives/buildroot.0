From: Baruch Siach <baruch@tkos.co.il>
Date: Fri, 20 Mar 2015 08:15:53 +0200
Subject: [Buildroot] [PATCH] package: add pacman 4.2.1
In-Reply-To: <1426736888-29437-5-git-send-email-steven@uplinklabs.net>
References: <1426736888-29437-1-git-send-email-steven@uplinklabs.net>
 <1426736888-29437-5-git-send-email-steven@uplinklabs.net>
Message-ID: <20150320061553.GE25388@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Steven,

On Wed, Mar 18, 2015 at 08:48:07PM -0700, Steven Noonan wrote:
> diff --git a/package/pacman/Config.in b/package/pacman/Config.in
> new file mode 100644
> index 0000000..9c4ca66
> --- /dev/null
> +++ b/package/pacman/Config.in
> @@ -0,0 +1,18 @@
> +config BR2_PACKAGE_PACMAN
> +	bool "pacman"
> +	depends on BR2_TOOLCHAIN_USES_GLIBC

Why? Please explain in the commit log.

> +	select BR2_PACKAGE_LIBGPGME
> +	select BR2_PACKAGE_LIBARCHIVE
> +	select BR2_PACKAGE_LIBCURL
> +	select BR2_PACKAGE_OPENSSL

Please propagate dependencies.

> +	help
> +	  Pacman is the package manager used by the Arch distribution. It is a
> +	  frontend for the ALPM (Arch Linux Package Management) library.
> +
> +	  Pacman does not strive to "do everything." It will add, remove and
> +	  upgrade packages in the system, and it will allow you to query the
> +	  package database for installed packages, files and owners. It also
> +	  attempts to handle dependencies automatically and can download
> +	  packages from a remote server. Arch packages are simple archives, with
> +	  .pkg.tar.gz extension for binary packages and .src.tar.gz for source
> +	  packages.
> diff --git a/package/pacman/pacman.mk b/package/pacman/pacman.mk
> new file mode 100644
> index 0000000..e979adb
> --- /dev/null
> +++ b/package/pacman/pacman.mk
> @@ -0,0 +1,14 @@
> +################################################################################
> +#
> +# pacman
> +#
> +################################################################################
> +
> +PACMAN_VERSION = 4.2.1
> +PACMAN_SITE = https://sources.archlinux.org/other/pacman
> +PACMAN_SOURCES = pacman-$(PACMAN_VERSION).tar.gz

Default.

> +PACMAN_DEPENDENCIES = glibc libarchive libcurl libgpgme openssl

No need to explicitly depend on 'glibc'. glibc is part of the toolchain that 
is an implicit dependency of everything.

> +PACMAN_LICENSE = GPLv2
> +PACMAN_LICENSE_FILES = COPYING
> +
> +$(eval $(autotools-package))

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
