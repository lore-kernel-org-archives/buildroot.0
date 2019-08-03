From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 3 Aug 2019 19:16:08 +0200
Subject: [Buildroot] [PATCH 2/2] package/qbittorrent: new package
In-Reply-To: <20181123181426.16116-2-richterphilipp.pops@gmail.com>
References: <20181123181426.16116-1-richterphilipp.pops@gmail.com>
 <20181123181426.16116-2-richterphilipp.pops@gmail.com>
Message-ID: <56889a43-3797-ef61-de24-7eaa52b3c950@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Philipp,

 Sorry for the late reply. We have a very long patch backlog, and this one got a
bit forgotten...

 There are still a few issues with it, could you fix up and resubmit?

On 23/11/2018 19:14, Philipp Richter wrote:
> The qBittorrent project aims to provide
> an open-source software alternative to ?Torrent.
> 
> https://www.qbittorrent.org/
> 
> Signed-off-by: Philipp Richter <richterphilipp.pops@gmail.com>

 Please add a patch changelog below the --- line, and also add the version in
the subject using the -v2 option to git format-patch. See [1].

[1] https://buildroot.org/downloads/manual/manual.html#_patch_revision_changelog

[snip]
> diff --git a/package/qbittorrent/Config.in b/package/qbittorrent/Config.in
> new file mode 100644
> index 0000000000..c4bdf3a22e
> --- /dev/null
> +++ b/package/qbittorrent/Config.in
> @@ -0,0 +1,63 @@
> +comment "qbittorrent needs a toolchain w/ C++, threads, wchar, NPTL, dynamic library, gcc >= 4.8"
> +	depends on !BR2_PACKAGE_QT

 We no longer have qt4, so this is not needed.

> +	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR || \
> +		!BR2_HOST_GCC_AT_LEAST_4_8 || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 || \
> +		!BR2_TOOLCHAIN_HAS_THREADS_NPTL || BR2_STATIC_LIBS> +
> +config BR2_PACKAGE_QBITTORRENT
> +	bool "qbittorrent"
> +	depends on BR2_INSTALL_LIBSTDCPP
> +	depends on BR2_HOST_GCC_AT_LEAST_4_8

 Why is this needed? Put a small comment here, and a more extensive explanation
in the commit message.

> +	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8

 You should add a comment why. Typically this would be # C++11.

> +	depends on BR2_TOOLCHAIN_HAS_THREADS

 This is redundant, the NPTL below implies it.

> +	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL

 I assume this comes from qt5. Add a comment for that:
	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # qt5

> +	depends on BR2_USE_WCHAR
> +	depends on !BR2_STATIC_LIBS
> +	depends on !BR2_PACKAGE_QT
> +	select BR2_PACKAGE_BOOST
> +	select BR2_PACKAGE_BOOST_SYSTEM
> +	select BR2_PACKAGE_BOOST_THREAD

 You didn't reply to Thomas's comment in v1 of the patch:

Is this package directly using Boost, or only indirectly because it's
using libtorrent-rasterbar ? It's rather odd for a program to use both
Boost and Qt.

 I'll answer it myself, though: it *does* use Boost directly.

> +	select BR2_PACKAGE_LIBTORRENT_RASTERBAR
> +	select BR2_PACKAGE_QT5
> +	select BR2_PACKAGE_QT5BASE
> +	select BR2_PACKAGE_ZLIB
> +	help
> +	  The qBittorrent project aims to provide
> +	  an open-source software alternative to ?Torrent.
> +
> +	  https://www.qbittorrent.org/
> +
> +if BR2_PACKAGE_QBITTORRENT
> +
> +config BR2_PACKAGE_QBITTORRENT_GUI
> +	bool "GUI"
> +	select BR2_PACKAGE_HICOLOR_ICON_THEME
> +	select BR2_PACKAGE_QT5BASE_GUI
> +	select BR2_PACKAGE_QT5BASE_WIDGETS
> +	select BR2_PACKAGE_QT5SVG
> +	help
> +	  Disable for headless mode.
> +	  The target binary will be called qbittorrent-nox.
> +
> +if BR2_PACKAGE_QBITTORRENT_GUI
> +
> +config BR2_PACKAGE_QBITTORRENT_QTDBUS
> +	bool "D-Bus support"
> +	default y
> +	select BR2_PACKAGE_QT5BASE_DBUS
> +	help
> +	  Enable D-Bus support.
> +
> +endif
> +
> +if !BR2_PACKAGE_QBITTORRENT_GUI

 Why would you exclude the webUI if the GUI is selected? To me, it makes perfect
sense to have both available.

> +
> +config BR2_PACKAGE_QBITTORRENT_WEBUI

 If neither webUI nor GUI are selected, does the package still do something
useful? If not, then you should add the following to the top-level qbittorrent
symbol:

	select BR2_PACKAGE_QBITTORRENT_WEBUI if !BR2_PACKAGE_QBITTORRENT_GUI

This makes sure the webUI is unconditionally enabled when the GUI is not.


> +	bool "WebUI"
> +	default y
> +	help
> +	  Enable the WebUI.
> +
> +endif
> +
> +endif
> diff --git a/package/qbittorrent/qbittorrent.hash b/package/qbittorrent/qbittorrent.hash
> new file mode 100644
> index 0000000000..6cc24d2796
> --- /dev/null
> +++ b/package/qbittorrent/qbittorrent.hash
> @@ -0,0 +1,5 @@
> +# Locally checked with PGP signature from https://downloads.sourceforge.net/sourceforge/qbittorrent/qbittorrent-4.1.4.tar.xz.asc

 Excellent!

> +sha256 5f7b4c5ae891ce7fbab880ff322764a0d433fccf655164f6b98ef08f1ae52386 qbittorrent-4.1.4.tar.xz
> +
> +# Locally calculated
> +sha256 fc68233a17d308ee633aefedbd761c7582ec48557539aca310b4162e54212fe5 COPYING
> diff --git a/package/qbittorrent/qbittorrent.mk b/package/qbittorrent/qbittorrent.mk
> new file mode 100644
> index 0000000000..11523efdbb
> --- /dev/null
> +++ b/package/qbittorrent/qbittorrent.mk
> @@ -0,0 +1,41 @@
> +################################################################################
> +#
> +# qbittorrent
> +#
> +################################################################################
> +
> +QBITTORRENT_VERSION = 4.1.4
> +QBITTORRENT_SOURCE = qbittorrent-$(QBITTORRENT_VERSION).tar.xz
> +QBITTORRENT_SITE = https://downloads.sourceforge.net/sourceforge/qbittorrent
> +QBITTORRENT_LICENSE = GPL-2.0

 All files have the 'or later' clause, so this is GPL-2.0+

> +QBITTORRENT_LICENSE_FILES = COPYING
> +QBITTORRENT_DEPENDENCIES = host-pkgconf boost libtorrent-rasterbar qt5base zlib
> +QBITTORRENT_CONF_OPTS += --with-boost-libdir=$(STAGING_DIR)/usr/lib

 I think we should also set --with-qtsingleapplication=system

> +QBITTORRENT_INSTALL_TARGET_OPTS = INSTALL_ROOT="$(TARGET_DIR)" install
> +
> +ifeq ($(BR2_PACKAGE_QBITTORRENT_GUI),y)
> +QBITTORRENT_CONF_OPTS += --enable-gui
> +QBITTORRENT_DEPENDENCIES += hicolor-icon-theme qt5svg
> +else
> +QBITTORRENT_CONF_OPTS += --disable-gui
> +endif
> +
> +ifeq ($(BR2_PACKAGE_QBITTORRENT_QTDBUS),y)

 Actually, for this one, you could also do it automatically, i.e.

ifeq ($(BR2_PACKAGE_QT5BASE_DBUS),y)

and remove the BR2_PACKAGE_QBITTORRENT_QTDBUS option. But it's not so important.


> +QBITTORRENT_CONF_OPTS += --enable-qt-dbus
> +else
> +QBITTORRENT_CONF_OPTS += --disable-qt-dbus
> +endif
> +
> +ifeq ($(BR2_INIT_SYSTEMD),y)
> +QBITTORRENT_CONF_OPTS += --enable-systemd
> +else
> +QBITTORRENT_CONF_OPTS += --disable-systemd
> +endif
> +
> +ifeq ($(BR2_PACKAGE_QBITTORRENT_WEBUI),y)
> +QBITTORRENT_CONF_OPTS += --enable-webui
> +else
> +QBITTORRENT_CONF_OPTS += --disable-webui
> +endif
> +
> +$(eval $(autotools-package))

 Interesting... This package uses autoconf to generate a qmake configuration,
then qmake to generate a Makefile... I've never seen that.


 Regards,
 Arnout
