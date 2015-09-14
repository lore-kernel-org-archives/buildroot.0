From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Mon, 14 Sep 2015 11:46:58 +0100
Subject: [Buildroot] [PATCH 2/3] gupnp: new package
In-Reply-To: <1442226095-4316-3-git-send-email-rahul.bedarkar@imgtec.com>
References: <1442226095-4316-1-git-send-email-rahul.bedarkar@imgtec.com>
 <1442226095-4316-3-git-send-email-rahul.bedarkar@imgtec.com>
Message-ID: <55F6A5A2.7020901@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Rahul Bedarkar,

On 09/14/2015 11:21 AM, Rahul Bedarkar wrote:
[snip]
> diff --git a/package/gupnp/Config.in b/package/gupnp/Config.in
> new file mode 100644
> index 0000000..89c14fc
> --- /dev/null
> +++ b/package/gupnp/Config.in
> @@ -0,0 +1,20 @@
> +config BR2_PACKAGE_GUPNP
> +	bool "gupnp"
> +	depends on BR2_USE_WCHAR # glib2

util-linux also needs wchar so add it to the list: # glib2, util-linux

> +	depends on BR2_TOOLCHAIN_HAS_THREADS # glib2
> +	depends on BR2_USE_MMU # glib2
> +	select BR2_PACKAGE_LIBGLIB2
> +	select BR2_PACKAGE_GSSDP
> +	select BR2_PACKAGE_LIBXML2
> +	select BR2_PACKAGE_UTIL_LINUX
> +	select BR2_PACKAGE_UTIL_LINUX_LIBUUID
> +	help
> +	  GUPnP implements the UPnP specification: resource announcement
> +	  and discovery, description, control, event notification, and
> +	  presentation.
> +
> +	  http://www.gupnp.org/
> +
> +comment "gupnp needs a toolchain w/ wchar, threads"
> +	depends on BR2_USE_MMU
> +	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
> diff --git a/package/gupnp/gupnp.hash b/package/gupnp/gupnp.hash
> new file mode 100644
> index 0000000..597cb42
> --- /dev/null
> +++ b/package/gupnp/gupnp.hash
> @@ -0,0 +1,2 @@
> +# Hash from: http://ftp.gnome.org/pub/gnome/sources/gupnp/0.19/gupnp-0.19.4.sha256sum:
> +sha256 3c1fb2873cb2f8f152b9d49598d55b15b8f3c1096a03ade46ce69694798fb243  gupnp-0.19.4.tar.xz
> diff --git a/package/gupnp/gupnp.mk b/package/gupnp/gupnp.mk
> new file mode 100644
> index 0000000..07fd851
> --- /dev/null
> +++ b/package/gupnp/gupnp.mk
> @@ -0,0 +1,15 @@
> +################################################################################
> +#
> +# gupnp
> +#
> +################################################################################
> +
> +GUPNP_VERSION = 0.19.4
> +GUPNP_SOURCE = gupnp-$(GUPNP_VERSION).tar.xz
> +GUPNP_SITE = http://ftp.gnome.org/pub/gnome/sources/gupnp/0.19

I think this would be better:

GUPNP_VERSION_MAJOR = 0.19
GUPNP_VERSION = $(GUPNP_VERSION_MAJOR).4
GUPNP_SOURCE = gupnp-$(GUPNP_VERSION).tar.xz
GUPNP_SITE =
http://ftp.gnome.org/pub/gnome/sources/gupnp/$(GUPNP_VERSION_MAJOR)

Regards,

Vincent.

> +GUPNP_LICENSE = LGPLv2+
> +GUPNP_LICENSE_FILES = COPYING
> +GUPNP_INSTALL_STAGING = YES
> +GUPNP_DEPENDENCIES = host-pkgconf libglib2 libxml2 gssdp util-linux
> +
> +$(eval $(autotools-package))
> 
