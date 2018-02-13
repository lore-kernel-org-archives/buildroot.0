From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 13 Feb 2018 22:53:42 +0100
Subject: [Buildroot] [PATCH 1/1] Add first KF5 packages
In-Reply-To: <20180213213531.22910-1-pinaraf@pinaraf.info>
References: <20180213213531.22910-1-pinaraf@pinaraf.info>
Message-ID: <20180213225342.006e1b37@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Thanks a lot for this contribution! And for showing up on IRC! :-)

On Tue, 13 Feb 2018 22:35:31 +0100, Pierre Ducroquet wrote:
> KDE Frameworks 5 is a set of libraries built on the Qt framework providing a
> lot of powerfull classes and solutions for developers building Qt
> applications.
> Unlike the previous KDE libraries, they are split in tiny packages, reducing
> dependencies as much as possible, making them usable even for embedded
> projects.
> 
> This first commit introduce the kf5 packages folder and the first two KF5
> packages:
> - ecm - Extra CMake modules, addons for CMake used across the KF5 libraries
> - NetworkManagerQt - a Qt wrapper for the NetworkManager DBus API
> 
> Signed-off-by: Pierre Ducroquet <pinaraf@pinaraf.info>

Thanks for this contribution! See some comments below.

>  package/Config.in                                  |  1 +
>  package/kf5/Config.in                              | 12 ++++++++++++
>  package/kf5/kf5.mk                                 | 11 +++++++++++
>  package/kf5/kf5ecm/Config.in                       | 11 +++++++++++
>  package/kf5/kf5ecm/kf5ecm.hash                     |  1 +
>  package/kf5/kf5ecm/kf5ecm.mk                       | 16 ++++++++++++++++
>  package/kf5/networkmanagerqt/Config.in             | 13 +++++++++++++
>  package/kf5/networkmanagerqt/networkmanagerqt.hash |  1 +
>  package/kf5/networkmanagerqt/networkmanagerqt.mk   | 17 +++++++++++++++++

It's perhaps a bit pedantic, but it'd be nicer to split this in 3
patches: one adding kf5, one adding kf5ecm, and one adding
networkmanagerqt.

Also, please add the appropriate entries to the DEVELOPERS file when
adding new packages.

> diff --git a/package/kf5/Config.in b/package/kf5/Config.in
> new file mode 100644
> index 0000000000..a7b4fb765b
> --- /dev/null
> +++ b/package/kf5/Config.in
> @@ -0,0 +1,12 @@
> +menuconfig BR2_PACKAGE_KF5
> +	bool "KF5"
> +	depends on BR2_PACKAGE_QT5BASE

Perhaps this should be BR2_PACKAGE_QT5 instead, and you should select
BR2_PACKAGE_QT5BASE when appropriate.

> +	depends on BR2_PACKAGE_HOST_CMAKE

This last depends on is not needed.


> diff --git a/package/kf5/kf5ecm/kf5ecm.hash b/package/kf5/kf5ecm/kf5ecm.hash
> new file mode 100644
> index 0000000000..4f510c152a
> --- /dev/null
> +++ b/package/kf5/kf5ecm/kf5ecm.hash
> @@ -0,0 +1 @@

The source of hash should be specified. Either:

# http://....

if the hash is provided by upstream somewhere, or alternatively:

# Locally calculated

> +sha256 baaf60940b9ff883332629ba2800090bb86722ba49a85cc12782e4ee5b169f67 extra-cmake-modules-5.41.0.tar.xz
> diff --git a/package/kf5/kf5ecm/kf5ecm.mk b/package/kf5/kf5ecm/kf5ecm.mk
> new file mode 100644
> index 0000000000..4f6fea0b1b
> --- /dev/null
> +++ b/package/kf5/kf5ecm/kf5ecm.mk
> @@ -0,0 +1,16 @@
> +################################################################################
> +#
> +# kf5ecm
> +#
> +################################################################################
> +
> +KF5ECM_VERSION = $(KF5_VERSION)
> +KF5ECM_SITE = $(KF5_SITE)
> +KF5ECM_SOURCE = extra-cmake-modules-$(KF5ECM_VERSION).tar.xz

License information is missing.

> +
> +KF5ECM_DEPENDENCIES = host-pkgconf
> +KF5ECM_INSTALL_STAGING = YES
> +KF5ECM_INSTALL_TARGET = NO
> +KF5ECM_CONF_OPTS = 

This last line is not needed.

So, I assume this package only installs a bunch of CMake modules in
$(STAGING_DIR), and our CMake automatically picks up those additional
modules from $(STAGING_DIR) ?

> diff --git a/package/kf5/networkmanagerqt/Config.in b/package/kf5/networkmanagerqt/Config.in
> new file mode 100644
> index 0000000000..59f3b4222c
> --- /dev/null
> +++ b/package/kf5/networkmanagerqt/Config.in
> @@ -0,0 +1,13 @@
> +config BR2_PACKAGE_NETWORKMANAGERQT
> +	bool "networkmanagerqt"
> +	depends on BR2_PACKAGE_KF5ECM

Please use a "select" for this.

> +	depends on BR2_PACKAGE_NETWORK_MANAGER

I believe this one could remain a "depends on".

> +	help
> +	  KF5 is a set of Qt framework addons, extending Qt in
> +	  various ways, not only restricted in helping integration
> +	  in KDE.
> +	  
> +	  This package contains the NetworkManager Qt5 bindings from the
> +	  KF5 project.
> +
> +	  https://api.kde.org/frameworks/networkmanager-qt/html/index.html
> diff --git a/package/kf5/networkmanagerqt/networkmanagerqt.hash b/package/kf5/networkmanagerqt/networkmanagerqt.hash
> new file mode 100644
> index 0000000000..ac4013efeb
> --- /dev/null
> +++ b/package/kf5/networkmanagerqt/networkmanagerqt.hash
> @@ -0,0 +1 @@
> +sha256 9bc26e42d27f829af1b1779cd10a4bb5639aebeeab80086a35b7ccaab85bb96d  networkmanager-qt-5.41.0.tar.xz

Same comment for the hash.

> diff --git a/package/kf5/networkmanagerqt/networkmanagerqt.mk b/package/kf5/networkmanagerqt/networkmanagerqt.mk
> new file mode 100644
> index 0000000000..8cba1e29a7
> --- /dev/null
> +++ b/package/kf5/networkmanagerqt/networkmanagerqt.mk
> @@ -0,0 +1,17 @@
> +################################################################################
> +#
> +# networkmanagerqt
> +#
> +################################################################################
> +
> +NETWORKMANAGERQT_VERSION = $(KF5_VERSION)
> +NETWORKMANAGERQT_SITE = $(KF5_SITE)
> +NETWORKMANAGERQT_SOURCE = networkmanager-qt-$(KF5ECM_VERSION).tar.xz

You should use this package <pkg>_VERSION variable :-)

> +NETWORKMANAGERQT_LICENSE = LGPL-2.1+

Can you add <pkg>_LICENSE_FILES ?

> +
> +NETWORKMANAGERQT_DEPENDENCIES = host-pkgconf kf5ecm network-manager
> +NETWORKMANAGERQT_INSTALL_STAGING = YES
> +NETWORKMANAGERQT_INSTALL_TARGET = YES
> +NETWORKMANAGERQT_CONF_OPTS = 

Those last two lines are not needed.

Also, should we call the package networkmanager-qt, to match the
upstream tarball name ?

Could you take into account those comments, and submit an updated
version ?

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
http://bootlin.com
