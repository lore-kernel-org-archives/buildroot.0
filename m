From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 11 Oct 2018 21:40:05 +0200
Subject: [Buildroot] [PATCH 2/2] package/qbittorrent: new package
In-Reply-To: <20180911085024.14648-2-richterphilipp.pops@gmail.com>
References: <20180911085024.14648-1-richterphilipp.pops@gmail.com>
 <20180911085024.14648-2-richterphilipp.pops@gmail.com>
Message-ID: <20181011214005.1b45b0df@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Philipp,

Here as well, thanks for your submission. See below a number of
comments.

On Tue, 11 Sep 2018 10:50:24 +0200, Philipp Richter wrote:

> diff --git a/package/qbittorrent/0001-fix-webui-unreachable-issue.patch b/package/qbittorrent/0001-fix-webui-unreachable-issue.patch
> new file mode 100644
> index 0000000000..e7e955d813
> --- /dev/null
> +++ b/package/qbittorrent/0001-fix-webui-unreachable-issue.patch
> @@ -0,0 +1,36 @@
> +Backported from: 5f175e113ab0eaeaea560f58b6a255932b194892

This should go...

> +
> +From 262c3a75bd3a99de16eea2327213bcd32b727d36 Mon Sep 17 00:00:00 2001
> +From: Chocobo1 <Chocobo1@users.noreply.github.com>
> +Date: Sun, 19 Aug 2018 03:28:41 +0800
> +Subject: [PATCH] Fix WebUI unreachable issue
> +
> +QVariant doesn't have constructor for plain char, by default it converts
> +a plain char into an integer, hence the WebUI issue.
> +Closes #9333.

.... here.

And be followed by your Signed-off-by.

Two reasons:

 - To keep the patch a valid git-formatted patch that can be applied
   with 'git am', the Backport from: .. should not be added at the
   beginning.

 - We require contributors to sign-off on the patches they add to
   Buildroot to keep track of who added what.


> diff --git a/package/qbittorrent/Config.in b/package/qbittorrent/Config.in
> new file mode 100644
> index 0000000000..fb33e49d02
> --- /dev/null
> +++ b/package/qbittorrent/Config.in
> @@ -0,0 +1,97 @@
> +comment "qbittorrent needs a toolchain w/ C++"
> +	depends on !BR2_INSTALL_LIBSTDCPP
> +
> +config BR2_PACKAGE_QBITTORRENT
> +	bool "qbittorrent"
> +	depends on BR2_INSTALL_LIBSTDCPP
> +	select BR2_PACKAGE_HOST_PKGCONF

As explained for libtorrent-rasterbar, this select is not needed.

> +	select BR2_PACKAGE_BOOST
> +	select BR2_PACKAGE_BOOST_SYSTEM
> +	select BR2_PACKAGE_BOOST_THREAD

Is this package directly using Boost, or only indirectly because it's
using libtorrent-rasterbar ? It's rather odd for a program to use both
Boost and Qt.

> +	select BR2_PACKAGE_LIBTORRENT_RASTERBAR
> +	select BR2_PACKAGE_QT5
> +	select BR2_PACKAGE_QT5BASE
> +	select BR2_PACKAGE_ZLIB

As explained for libtorrent-rasterbar, you need to replicate all the
dependencies of the packages you select. So something like this:

	depends on BR2_INSTALL_LIBSTDCPP # boost, libtorrent-rasterbar, qt5
	depends on BR2_TOOLCHAIN_HAS_THREADS # boost, libtorrent-rasterbar
	depends on BR2_USE_WCHAR # boost, libtorrent-rasterbar, qt5
	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # qt5
	depends on !BR2_STATIC_LIBS # qt5
	depends on !BR2_PACKAGE_QT # qt5

and of course, add the corresponding Config.in comment.

> +if BR2_PACKAGE_QBITTORRENT
> +
> +config BR2_PACKAGE_QBITTORRENT_GUI
> +	bool "GUI"
> +	select BR2_PACKAGE_HICOLOR_ICON_THEME
> +	select BR2_PACKAGE_QT5BASE_WIDGETS

You need to select BR2_PACKAGE_QT5BASE_GUI, otherwise
BR2_PACKAGE_QT5BASE_WIDGETS can't be selected. It did work for you,
because QT5SVG already selects QT5BASE_GUI, but it's better to be
explicit here.

> +	select BR2_PACKAGE_QT5SVG
> +	help
> +	  Disable for headless running.
> +	  The target binary will be called qbittorrent-nox.
> +
> +if BR2_PACKAGE_QBITTORRENT_GUI
> +
> +config BR2_PACKAGE_QBITTORRENT_QTDBUS
> +	bool "QtDBUS"

Perhaps the option should be named "D-Bus support" ?

> +	default y
> +	select BR2_PACKAGE_QT5BASE_DBUS
> +	help
> +	  Enable QtDBUS support.
> +
> +	  Default: yes

Drop those "Default: XYZ".

> +
> +endif
> +
> +if !BR2_PACKAGE_QBITTORRENT_GUI
> +
> +comment "Systemd service needs systemd enabled"
> +	depends on !BR2_PACKAGE_SYSTEMD
> +
> +config BR2_PACKAGE_QBITTORRENT_SYSTEMD
> +	bool "Systemd service"
> +	depends on BR2_PACKAGE_SYSTEMD
> +	help
> +	  Install systemd service file.
> +
> +	  Default: no

You don't need an option, just use BR2_INIT_SYSTEMD to decide whether
the systemd service should be installed or not.

> +
> +endif
> +
> +comment "Stacktrace feature needs a glibc toolchain"
> +	depends on !BR2_TOOLCHAIN_USES_GLIBC

Just use "auto" when glibc is available, no need to make this
configurable.


> diff --git a/package/qbittorrent/qbittorrent.hash b/package/qbittorrent/qbittorrent.hash
> new file mode 100644
> index 0000000000..f5cf78e7fc
> --- /dev/null
> +++ b/package/qbittorrent/qbittorrent.hash
> @@ -0,0 +1,6 @@
> +# Locally checked with PGP signature from https://downloads.sourceforge.net/sourceforge/qbittorrent/qbittorrent-4.1.2.tar.xz.asc
> +sha256 e0165bd427820c64bce596ef952d80058ea8cd7294d3c84bc723d79cd9e2f9c7 qbittorrent-4.1.2.tar.xz
> +
> +# Locally calculated
> +sha256 ed266afaf97e160adc8954a2ddc6d1aeb63bc537b9b8b65348581239052bee03 0001-fix-webui-unreachable-issue.patch

No need to have hashes for patches that are part of the Buildroot tree.

> +sha256 fc68233a17d308ee633aefedbd761c7582ec48557539aca310b4162e54212fe5 COPYING
> diff --git a/package/qbittorrent/qbittorrent.mk b/package/qbittorrent/qbittorrent.mk
> new file mode 100644
> index 0000000000..b90dd9ac84
> --- /dev/null
> +++ b/package/qbittorrent/qbittorrent.mk
> @@ -0,0 +1,49 @@
> +################################################################################
> +#
> +# qbittorrent
> +#
> +################################################################################
> +
> +QBITTORRENT_VERSION = 4.1.2
> +QBITTORRENT_SOURCE = qbittorrent-$(QBITTORRENT_VERSION).tar.xz
> +QBITTORRENT_SITE = https://downloads.sourceforge.net/sourceforge/qbittorrent
> +QBITTORRENT_LICENSE = GPL-2.0
> +QBITTORRENT_LICENSE_FILES = COPYING
> +QBITTORRENT_DEPENDENCIES = host-pkgconf boost libtorrent-rasterbar qt5base zlib
> +QBITTORRENT_CONF_OPTS += --with-boost-libdir="$(STAGING_DIR)/usr/lib"

You can drop the double quotes.

Could you take into account those comments, and send an updated
version ?

Thanks a lot!

Thomas Petazzoni
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
