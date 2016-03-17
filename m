From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 17 Mar 2016 21:30:43 +0100
Subject: [Buildroot] [PATCH 2/2] cdebootstrap: new package
In-Reply-To: <1458227200-19903-2-git-send-email-benoit.allard@greenbone.net>
References: <1458227200-19903-1-git-send-email-benoit.allard@greenbone.net>
 <1458227200-19903-2-git-send-email-benoit.allard@greenbone.net>
Message-ID: <20160317213043.76ad9bb5@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Beno?t,

On Thu, 17 Mar 2016 16:06:40 +0100, Beno?t Allard wrote:
> cdebootstrap is used to create a Debian base system from scratch.
> 
> Signed-off-by: Beno?t Allard <benoit.allard@greenbone.net>

Could you give some details about the use case for such a package?

It seems somewhat weird, in the context of Buildroot, to use
cdebootstrap on the target.

> diff --git a/package/cdebootstrap/Config.in b/package/cdebootstrap/Config.in
> new file mode 100644
> index 0000000..0ed9bfe
> --- /dev/null
> +++ b/package/cdebootstrap/Config.in
> @@ -0,0 +1,12 @@
> +config BR2_PACKAGE_CDEBOOTSTRAP
> +	bool "cdebootstrap"
> +	select BR2_PACKAGE_LIBCURL
> +	select BR2_PACKAGE_LIBDEBIAN_INSTALLER
> +	select BR2_PACKAGE_ZLIB
> +	select BR2_PACKAGE_BZIP2
> +	select BR2_PACKAGE_XZ

Whenever possible, alphabetic ordering is preferred (though I agree it
is not a rule we comply with everywhere in Buildroot).

> +	help
> +	  cdebootstrap generates systems from scratch for Debian and\
> +	  derivates.

The trailing \ is not good.

> diff --git a/package/cdebootstrap/cdebootstrap.hash b/package/cdebootstrap/cdebootstrap.hash
> new file mode 100644
> index 0000000..eb0783e
> --- /dev/null
> +++ b/package/cdebootstrap/cdebootstrap.hash
> @@ -0,0 +1,3 @@
> +#Locally computed
> +sha256 e33fe2c245894ab40dc4db764f31a0bf59cc80c34d9ebf2e71b715e49631bb34 cdebootstrap_0.6.4.tar.gz
> +

Useless empty line here.

> diff --git a/package/cdebootstrap/cdebootstrap.mk b/package/cdebootstrap/cdebootstrap.mk
> new file mode 100644
> index 0000000..172b83f
> --- /dev/null
> +++ b/package/cdebootstrap/cdebootstrap.mk
> @@ -0,0 +1,17 @@
> +################################################################################
> +#
> +# cdebootstrap
> +#
> +################################################################################
> +
> +CDEBOOTSTRAP_VERSION = 0.6.4
> +CDEBOOTSTRAP_SOURCE = cdebootstrap_$(CDEBOOTSTRAP_VERSION).tar.gz
> +CDEBOOTSTRAP_SITE = http://http.debian.net/debian/pool/main/c/cdebootstrap

Those URLs are not stable, you should use snapshot.debian.org instead.
Grep for snapshot.debian.org in Buildroot.

> +CDEBOOTSTRAP_LICENSE = GPLv2
> +CDEBOOTSTRAP_LICENSE_FILES = debian/copyright
> +CDEBOOTSTRAP_INSTALL_STAGING = NO
> +CDEBOOTSTRAP_INSTALL_TARGET = YES

Those two lines are not needed, since it's the default value.

> +CDEBOOTSTRAP_CONF_OPTS = 

Not needed.

> +CDEBOOTSTRAP_DEPENDENCIES = libcurl libdebian-installer zlib bzip2 host-pkgconf xz

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
