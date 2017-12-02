From: Marcus Folkesson <marcus.folkesson@gmail.com>
Date: Sat, 2 Dec 2017 16:34:34 +0100
Subject: [Buildroot] [PATCH 1/1] gconf: new package
In-Reply-To: <20171121020258.31523-1-joseph.kogut@gmail.com>
References: <20171121020258.31523-1-joseph.kogut@gmail.com>
Message-ID: <20171202153434.GA2462@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On Mon, Nov 20, 2017 at 06:02:58PM -0800, Joseph Kogut wrote:
> diff --git a/package/gconf/Config.in b/package/gconf/Config.in
> new file mode 100644
> index 0000000000..364caea1ca
> --- /dev/null
> +++ b/package/gconf/Config.in
> @@ -0,0 +1,10 @@

You need to propagate some dependencies from packages gconf depends
on.

> +config BR2_PACKAGE_GCONF
> +	bool "gconf"
> +	select BR2_PACKAGE_DBUS

dbus contains:
	depends on BR2_TOOLCHAIN_HAS_THREADS
	# uses fork()
	depends on BR2_USE_MMU

> +	select BR2_PACKAGE_DBUS_GLIB
dbus-glib contains:
	depends on BR2_PACKAGE_DBUS
	depends on BR2_USE_WCHAR # glib2
	depends on BR2_TOOLCHAIN_HAS_THREADS # glib2
	depends on BR2_USE_MMU # glib2

> +	select BR2_PACKAGE_LIBGLIB2
libglib2 contains:
	depends on BR2_USE_WCHAR # gettext
	depends on BR2_TOOLCHAIN_HAS_THREADS
	depends on BR2_USE_MMU # fork()

> +	select BR2_PACKAGE_LIBXML2



> +	help
> +	  GConf was a system used by the GNOME desktop environment for storing
> +	  configuration settings for the desktop and applications. It is similar
> +	  to the Windows Registry.
> diff --git a/package/gconf/gconf.hash b/package/gconf/gconf.hash
> new file mode 100644
> index 0000000000..24d0cf9b17
> --- /dev/null
> +++ b/package/gconf/gconf.hash
> @@ -0,0 +1,4 @@
> +# http://ftp.acc.umu.se/pub/gnome/sources/GConf/3.2/GConf-3.2.6.sha256sum
> +sha256 1912b91803ab09a5eed34d364bf09fe3a2a9c96751fde03a4e0cfa51a04d784c  GConf-3.2.6.tar.xz
> +# License files, locally calculated
> +sha256 94b03f1a60a7fd5007149530626a895a6ef5a8b9342abfd56860c5f3956f5d23  COPYING
> diff --git a/package/gconf/gconf.mk b/package/gconf/gconf.mk
> new file mode 100644
> index 0000000000..5f33290d7a
> --- /dev/null
> +++ b/package/gconf/gconf.mk
> @@ -0,0 +1,10 @@
> +GCONF_VERSION = 3.2.6
> +GCONF_SOURCE = GConf-${GCONF_VERSION}.tar.xz
> +GCONF_SITE = http://ftp.gnome.org/pub/gnome/sources/GConf/3.2
> +GCONF_CONF_OPTS = --disable-orbit --disable-nls --disable-dependency-tracking
> +GCONF_DEPENDENCIES = dbus dbus-glib libglib2 libxml2
> +
> +GCONF_LICENSE = GPL-2.0

The license is LGPL-2.0 (+ ?)


Best regards
Marcus Folkesson
