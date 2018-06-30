From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 1 Jul 2018 00:12:53 +0200
Subject: [Buildroot] [PATCH 3/5] Add KF5 package networkmanager-qt
In-Reply-To: <20180215204815.14707-3-pinaraf@pinaraf.info>
References: <20180215204815.14707-1-pinaraf@pinaraf.info>
 <20180215204815.14707-3-pinaraf@pinaraf.info>
Message-ID: <20180701001253.38a198e4@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Pierre,

On Thu, 15 Feb 2018 21:48:13 +0100, Pierre Ducroquet wrote:
> networkmanager-qt is a simple Qt wrapper on the NetworkManager API.
> 
> Signed-off-by: Pierre Ducroquet <pinaraf@pinaraf.info>

I've applied this package, after doing a number of changes.

First, I fixed the commit title to follow our convention.

> diff --git a/package/kf5/kf5-networkmanager-qt/Config.in b/package/kf5/kf5-networkmanager-qt/Config.in
> new file mode 100644
> index 0000000000..aff4f39ae2
> --- /dev/null
> +++ b/package/kf5/kf5-networkmanager-qt/Config.in
> @@ -0,0 +1,13 @@
> +config BR2_PACKAGE_KF5_NETWORKMANAGER_QT
> +	bool "kf5-networkmanager-qt"
> +	select BR2_PACKAGE_KF5_EXTRA_CMAKE_MODULES
> +	select BR2_PACKAGE_NETWORK_MANAGER

When you select a package you *must* replicate its dependencies. Since
network-manager has tons of dependencies, and it's pretty obvious for
the user of kf5-networkmanager-qt that network-manager should be
enabled, I've changed from a "select" to a "depends on
BR2_PACKAGE_NETWORK_MANAGER", which avoids the need for replicating the
dependencies.

In addition, you forgot to select BR2_PACKAGE_QT5DBUS. Without this,
the build fails because kf5-networkmanager-qt uses the DBus support in
Qt. This required propagating a few dependencies.

See the final commit for the details.

> index 0000000000..d3c0f96d46
> --- /dev/null
> +++ b/package/kf5/kf5-networkmanager-qt/kf5-networkmanager-qt.hash
> @@ -0,0 +1,2 @@
> +# Locally calculated
> +sha256 0cbbcaa2db1f9bd5445b9c7c5f1e79313df5060f7c31617d673d00f19600755e networkmanager-qt-5.43.0.tar.xz

Updated to 5.47 + hash for license file added.

> +KF5_NETWORKMANAGER_QT_DEPENDENCIES = kf5-extra-cmake-modules network-manager

You were missing qt5base here. Without this, you have no guarantee that
qt5base gets built before, obviously causing a build failure.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
