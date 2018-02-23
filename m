From: Peter Seiderer <ps.report@gmx.net>
Date: Fri, 23 Feb 2018 19:32:22 +0100
Subject: [Buildroot] [PATCH-FOR-NEXT v1 4/6] qt5: bump latest version to
 5.10.1
In-Reply-To: <20180221142801.28997-5-gael.portay@savoirfairelinux.com>
References: <20180221142801.28997-1-gael.portay@savoirfairelinux.com>
 <20180221142801.28997-5-gael.portay@savoirfairelinux.com>
Message-ID: <20180223193222.6e2b3f87@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Ga?l,

On Wed, 21 Feb 2018 09:27:59 -0500, Ga?l PORTAY <gael.portay@savoirfairelinux.com> wrote:

> qtconnectivity:
> 
> 	0001-Example-heartrate-server-needs-only-core-and-bluetoo.patch
> 	was upstreamed[1].
> 
> qtquickcontrols:
> 
> 	0001-Example-flatstyle-needs-widgets-module.patch was
> 	upstreamed[2]
> 
> qtwebengine:
> 
> 	0002-Load-libEGL-and-libGLES2-symbols-implicitly.patch was
> 	upstreamed[3], then reverted[4] and finally restored[5].
> 
> [1]: https://code.qt.io/cgit/qt/qtconnectivity.git/commit/?id=22d20e81d866b79e1e9fefe3f24f93aeb687a450
> [2]: https://code.qt.io/cgit/qt/qtquickcontrols2.git/commit/?id=bd617ed62ba35ee11da75b7e92db3fd190751b0f
> [3]: https://code.qt.io/cgit/qt/qtwebengine.git/commit/?id=d4c621f6a6b87f2a86069fa393b9f7c4f9e7b9ad
> [4]: https://code.qt.io/cgit/qt/qtwebengine.git/commit/?id=c11c2c8981e647c1eb2c6753ce77d436b92fff87
> [5]: https://code.qt.io/cgit/qt/qtwebengine.git/commit/?id=e812237b6980584fc5939f49f6a18315cc694c3a
> 
> Note: Hashes has been updated and tested using the following script:
> 
> 	#!/bin/bash
> 
> 	set -e
> 
> 	if [ "$BR2_PACKAGE_QT5_VERSION_5_6" = y ]
> 	then
> 		set -- "${@/qt5charts/}"
> 		set -- "${@/qt5scxml/}"
> 		set -- "${@/qt5virtualkeyboard/}"
> 		set -- "${@/qt5wayland/}"
> 		set -- BR2_PACKAGE_QT5_VERSION_5_6=y
> 		QT5_VERSION_MAJOR=5.6
> 		QT5_VERSION=5.6.3
> 	else
> 		QT5_VERSION_MAJOR=5.10
> 		QT5_VERSION=5.10.1
> 		set -- BR2_PACKAGE_QT5_VERSION_LATEST=y
> 	fi
> 
> 	update_hash() {
> 		find package/qt5/ -name "*.hash" -exec \
> 		sed -e "s,$QT5_VERSION_MAJOR\.[0-9]*,$QT5_VERSION,g" \
> 		    -e "\,https\?://download.qt.io/official_releases/qt/$QT5_VERSION_MAJOR/,{s,opensource,everywhere,;n;s,opensource,everywhere,}" \
> 		    -i {} \;
> 	}
> 
> 	update_makefile() {
> 		find package/qt5/ -name "*.mk" -exec \
> 		sed -e "/QT5[A-Z0-9_]*_SOURCE = qt\([a-z0-9-]*\)-opensource-src-\$(\(QT5[A-Z0-9_]*\)_VERSION).tar.xz/s/= .*/= \$(call qt5source,qt5\1,\$(\2_VERSION))/" \
> 		     {} \;
> 	}
> 
> 	update_makefile() {
> 		find package/qt5/ -name "*.mk" -exec \
> 		sed -e "/QT5[A-Z0-9_]*_SOURCE = qt[a-z0-9-]*-opensource-src-\$(QT5[A-Z0-9_]*_VERSION).tar.xz/s/= \(qt[a-z0-9-]*\)-opensource-src-\$(\(QT5[A-Z0-9_]*\)_VERSION).tar.xz/= \$(call qt5source,\1,\$(\2_VERSION))/" \
> 		    -i {} \;
> 	}
> 
> 	get_url() {
> 		sed -e "\,# Hash from: https\?://download.qt.io/official_releases/qt/$QT5_VERSION_MAJOR/.*,{s,# Hash from: ,,;s,\.mirrorlist,.sha256,p}" \
> 		    -n "$1"
> 	}
> 
> 	update_sha256() {
> 		sed -e "\,# Hash from: https\?://download.qt.io/official_releases/qt/$QT5_VERSION_MAJOR/.*,{n;s,^.*$,sha256 $2,}" \
> 		    -i "$1"
> 	}
> 
> 	update_hashfile() {
> 		local url sha256
> 		url="$(get_url "$pkg/$module.hash")"
> 		sha256="$(wget -O- "$url")"
> 		update_sha256 "$pkg/$module.hash" "$sha256"
> 	}
> 
> 	update_hash
> 
> 	for pkg in package/qt5/qt5*
> 	do
> 		[ -d "$pkg" ] || continue
> 		module=${pkg##*/}
> 		if [ "$BR2_PACKAGE_QT5_VERSION_5_6" = y ]
> 		then
> 			case "$module" in
> 			qt5charts|qt5scxml|qt5virtualkeyboard|qt5wayland)
> 				echo "Warning: $module: skipped" >&2
> 				continue
> 				;;
> 			qt5webbrowser)
> 				echo "Warning: $module: skipped" >&2
> 				continue
> 				;;
> 			esac
> 		fi
> 
> 		if ! update_hashfile "$pkg/$module.hash"
> 		then
> 			continue
> 		fi
> 		echo "$module-source"
> 	done | xargs make "$@"
> 

The script part is a little lengthy for a commit log, maybe better
to add an extra patch adding something like utils/update-qt-helper
with the script content to ease the next qt5 version bump?

Otherwise looks good, and did a partly compile-/runtime test of
some packages, but found two compile/install failures (sqlite plugin,
qt5multimedia with gstreamer), patches will follow...

Regards,
Peter

> Signed-off-by: Ga?l PORTAY <gael.portay@savoirfairelinux.com>
> ---
>  package/qt5/Config.in                              |  4 +-
>  package/qt5/qt5.mk                                 | 10 ++-
>  package/qt5/qt53d/qt53d.hash                       |  4 +-
>  package/qt5/qt53d/qt53d.mk                         |  2 +-
>  package/qt5/qt5base/qt5base.hash                   |  4 +-
>  package/qt5/qt5base/qt5base.mk                     |  2 +-
>  package/qt5/qt5canvas3d/qt5canvas3d.hash           |  4 +-
>  package/qt5/qt5canvas3d/qt5canvas3d.mk             |  2 +-
>  package/qt5/qt5charts/qt5charts.hash               |  4 +-
>  package/qt5/qt5charts/qt5charts.mk                 |  2 +-
>  ...rtrate-server-needs-only-core-and-bluetoo.patch | 32 --------
>  package/qt5/qt5connectivity/qt5connectivity.hash   |  4 +-
>  package/qt5/qt5connectivity/qt5connectivity.mk     |  2 +-
>  package/qt5/qt5declarative/qt5declarative.hash     |  4 +-
>  package/qt5/qt5declarative/qt5declarative.mk       |  2 +-
>  package/qt5/qt5enginio/qt5enginio.mk               |  4 +-
>  .../qt5graphicaleffects/qt5graphicaleffects.hash   |  4 +-
>  .../qt5/qt5graphicaleffects/qt5graphicaleffects.mk |  2 +-
>  package/qt5/qt5imageformats/qt5imageformats.hash   |  4 +-
>  package/qt5/qt5imageformats/qt5imageformats.mk     |  2 +-
>  package/qt5/qt5location/qt5location.hash           |  4 +-
>  package/qt5/qt5location/qt5location.mk             |  2 +-
>  package/qt5/qt5multimedia/qt5multimedia.hash       |  4 +-
>  package/qt5/qt5multimedia/qt5multimedia.mk         |  2 +-
>  package/qt5/qt5quickcontrols/qt5quickcontrols.hash |  4 +-
>  package/qt5/qt5quickcontrols/qt5quickcontrols.mk   |  2 +-
>  ...01-Example-flatstyle-needs-widgets-module.patch | 31 --------
>  .../qt5/qt5quickcontrols2/qt5quickcontrols2.hash   |  4 +-
>  package/qt5/qt5quickcontrols2/qt5quickcontrols2.mk |  2 +-
>  package/qt5/qt5script/qt5script.hash               |  4 +-
>  package/qt5/qt5script/qt5script.mk                 |  2 +-
>  package/qt5/qt5scxml/qt5scxml.hash                 |  4 +-
>  package/qt5/qt5scxml/qt5scxml.mk                   |  2 +-
>  package/qt5/qt5sensors/qt5sensors.hash             |  4 +-
>  package/qt5/qt5sensors/qt5sensors.mk               |  2 +-
>  package/qt5/qt5serialbus/qt5serialbus.hash         |  4 +-
>  package/qt5/qt5serialbus/qt5serialbus.mk           |  2 +-
>  package/qt5/qt5serialport/qt5serialport.hash       |  4 +-
>  package/qt5/qt5serialport/qt5serialport.mk         |  2 +-
>  package/qt5/qt5svg/qt5svg.hash                     |  4 +-
>  package/qt5/qt5svg/qt5svg.mk                       |  2 +-
>  package/qt5/qt5tools/qt5tools.hash                 |  4 +-
>  package/qt5/qt5tools/qt5tools.mk                   |  2 +-
>  .../qt5/qt5virtualkeyboard/qt5virtualkeyboard.hash |  4 +-
>  .../qt5/qt5virtualkeyboard/qt5virtualkeyboard.mk   |  2 +-
>  package/qt5/qt5wayland/qt5wayland.hash             |  4 +-
>  package/qt5/qt5wayland/qt5wayland.mk               |  2 +-
>  package/qt5/qt5webchannel/qt5webchannel.hash       |  4 +-
>  package/qt5/qt5webchannel/qt5webchannel.mk         |  2 +-
>  ...ad-libEGL-and-libGLES2-symbols-implicitly.patch | 89 ----------------------
>  package/qt5/qt5webengine/qt5webengine.hash         |  4 +-
>  package/qt5/qt5webengine/qt5webengine.mk           |  2 +-
>  .../qt5/qt5webkit-examples/qt5webkit-examples.mk   |  2 +-
>  package/qt5/qt5websockets/qt5websockets.hash       |  4 +-
>  package/qt5/qt5websockets/qt5websockets.mk         |  2 +-
>  package/qt5/qt5x11extras/qt5x11extras.hash         |  4 +-
>  package/qt5/qt5x11extras/qt5x11extras.mk           |  2 +-
>  package/qt5/qt5xmlpatterns/qt5xmlpatterns.hash     |  4 +-
>  package/qt5/qt5xmlpatterns/qt5xmlpatterns.mk       |  2 +-
>  59 files changed, 90 insertions(+), 238 deletions(-)
>  delete mode 100644 package/qt5/qt5connectivity/5.9.3/0001-Example-heartrate-server-needs-only-core-and-bluetoo.patch
>  delete mode 100644 package/qt5/qt5quickcontrols2/5.9.3/0001-Example-flatstyle-needs-widgets-module.patch
>  delete mode 100644 package/qt5/qt5webengine/5.9.3/0002-Load-libEGL-and-libGLES2-symbols-implicitly.patch
> 
> diff --git a/package/qt5/Config.in b/package/qt5/Config.in
> index a9ee44c11f..b7786f7a63 100644
> --- a/package/qt5/Config.in
> +++ b/package/qt5/Config.in
> @@ -35,14 +35,14 @@ choice
>  	prompt "Qt5 version"
>  
>  config BR2_PACKAGE_QT5_VERSION_LATEST
> -	bool "Latest (5.9)"
> +	bool "Latest (5.10)"
>  	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # C++11
>  	depends on BR2_HOST_GCC_AT_LEAST_4_8 # C++11
>  	depends on !BR2_ARM_CPU_ARMV4 # needs ARMv5+
>  	# no built-in double-conversion support
>  	depends on !BR2_arc && !BR2_nios2 && !BR2_xtensa
>  	help
> -	  This option builds Qt 5.9, which is licensed under
> +	  This option builds Qt 5.10, which is licensed under
>  	  (L)GPL-3.0+.
>  
>  comment "Latest Qt version needs host/toolchain w/ gcc >= 4.8"
> diff --git a/package/qt5/qt5.mk b/package/qt5/qt5.mk
> index 7a6e1d7cfe..2ad35dbd1f 100644
> --- a/package/qt5/qt5.mk
> +++ b/package/qt5/qt5.mk
> @@ -5,13 +5,17 @@
>  ################################################################################
>  
>  ifeq ($(BR2_PACKAGE_QT5_VERSION_LATEST),y)
> -QT5_VERSION_MAJOR = 5.9
> -QT5_VERSION = $(QT5_VERSION_MAJOR).3
> +QT5_VERSION_MAJOR = 5.10
> +QT5_VERSION = $(QT5_VERSION_MAJOR).1
> +QT5_SRC = everywhere-src
>  else
>  QT5_VERSION_MAJOR = 5.6
>  QT5_VERSION = $(QT5_VERSION_MAJOR).3
> +QT5_SRC = opensource-src
>  endif
> -QT5_SITE = http://download.qt.io/official_releases/qt/$(QT5_VERSION_MAJOR)/$(QT5_VERSION)/submodules
> +QT5_SITE = https://download.qt.io/official_releases/qt/$(QT5_VERSION_MAJOR)/$(QT5_VERSION)/submodules
> +# qt5(module,version): returns site of Qt5 tarball
> +qt5source = $(1)-$(QT5_SRC)-$(2).tar.xz
>  
>  include $(sort $(wildcard package/qt5/*/*.mk))
>  
> diff --git a/package/qt5/qt53d/qt53d.hash b/package/qt5/qt53d/qt53d.hash
> index 18441ead0d..9d9ff8f69c 100644
> --- a/package/qt5/qt53d/qt53d.hash
> +++ b/package/qt5/qt53d/qt53d.hash
> @@ -1,8 +1,8 @@
>  # Hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qt3d-opensource-src-5.6.3.tar.xz.mirrorlist
>  sha256 10d05a30e925fcad971126c7f47a5e32c39f007dab96b298b2094501f9607ffe qt3d-opensource-src-5.6.3.tar.xz
>  
> -# Hash from: https://download.qt.io/official_releases/qt/5.9/5.9.3/submodules/qt3d-opensource-src-5.9.3.tar.xz.mirrorlist
> -sha256 97925132f0583ccd76f5e104c849341df3abba73dd4d9b647622a23bdae6273f qt3d-opensource-src-5.9.3.tar.xz
> +# Hash from: https://download.qt.io/official_releases/qt/5.10/5.10.1/submodules/qt3d-everywhere-src-5.10.1.tar.xz.mirrorlist
> +sha256 041fb42536a72bbf9be17a6f52d4b73ce93fb98b456fd63503cc47d80d196b3b  qt3d-everywhere-src-5.10.1.tar.xz
>  
>  # Hashes for license files:
>  sha256 edfe70e99be2a7c109d860b19204609e582720b211c50caedac729da372a1253 LICENSE.GPL
> diff --git a/package/qt5/qt53d/qt53d.mk b/package/qt5/qt53d/qt53d.mk
> index 4f37ae7f5d..fcbecff68c 100644
> --- a/package/qt5/qt53d/qt53d.mk
> +++ b/package/qt5/qt53d/qt53d.mk
> @@ -6,7 +6,7 @@
>  
>  QT53D_VERSION = $(QT5_VERSION)
>  QT53D_SITE = $(QT5_SITE)
> -QT53D_SOURCE = qt3d-opensource-src-$(QT5SVG_VERSION).tar.xz
> +QT53D_SOURCE = $(call qt5source,qt3d,$(QT53D_VERSION))
>  QT53D_DEPENDENCIES = qt5base qt5declarative
>  QT53D_INSTALL_STAGING = YES
>  
> diff --git a/package/qt5/qt5base/qt5base.hash b/package/qt5/qt5base/qt5base.hash
> index c6e694ab39..d788c071d8 100644
> --- a/package/qt5/qt5base/qt5base.hash
> +++ b/package/qt5/qt5base/qt5base.hash
> @@ -1,8 +1,8 @@
>  # Hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qtbase-opensource-src-5.6.3.tar.xz.mirrorlist
>  sha256 fef48529a6fc2617a30d75d952cb327c6be341fd104154993922184b3b3b4da1 qtbase-opensource-src-5.6.3.tar.xz
>  
> -# Hash from: https://download.qt.io/official_releases/qt/5.9/5.9.3/submodules/qtbase-opensource-src-5.9.3.tar.xz.mirrorlist
> -sha256 9e7c44005e7691dc7c85165bd4510282c47f0163521f4973eab71dbdb39a9982 qtbase-opensource-src-5.9.3.tar.xz
> +# Hash from: https://download.qt.io/official_releases/qt/5.10/5.10.1/submodules/qtbase-everywhere-src-5.10.1.tar.xz.mirrorlist
> +sha256 d8660e189caa5da5142d5894d328b61a4d3ee9750b76d61ad74e4eee8765a969  qtbase-everywhere-src-5.10.1.tar.xz
>  
>  # Hashes for license files:
>  sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 LICENSE.GPL2
> diff --git a/package/qt5/qt5base/qt5base.mk b/package/qt5/qt5base/qt5base.mk
> index b3f9c799cb..a48ce2e308 100644
> --- a/package/qt5/qt5base/qt5base.mk
> +++ b/package/qt5/qt5base/qt5base.mk
> @@ -6,7 +6,7 @@
>  
>  QT5BASE_VERSION = $(QT5_VERSION)
>  QT5BASE_SITE = $(QT5_SITE)
> -QT5BASE_SOURCE = qtbase-opensource-src-$(QT5BASE_VERSION).tar.xz
> +QT5BASE_SOURCE = $(call qt5source,qtbase,$(QT5BASE_VERSION))
>  
>  QT5BASE_DEPENDENCIES = host-pkgconf zlib
>  QT5BASE_INSTALL_STAGING = YES
> diff --git a/package/qt5/qt5canvas3d/qt5canvas3d.hash b/package/qt5/qt5canvas3d/qt5canvas3d.hash
> index 1664f626cd..d15fde9df7 100644
> --- a/package/qt5/qt5canvas3d/qt5canvas3d.hash
> +++ b/package/qt5/qt5canvas3d/qt5canvas3d.hash
> @@ -1,8 +1,8 @@
>  # Hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qtcanvas3d-opensource-src-5.6.3.tar.xz.mirrorlist
>  sha256 e99e0e159f2fba539b7947a1921072f6807f20958d32809edbf12aac571f56ff qtcanvas3d-opensource-src-5.6.3.tar.xz
>  
> -# Hash from: https://download.qt.io/official_releases/qt/5.9/5.9.3/submodules/qtcanvas3d-opensource-src-5.9.3.tar.xz.mirrorlist
> -sha256 5e38b17844af801be57844da0379cc6882750b9019034f4fe884aae70c300abc qtcanvas3d-opensource-src-5.9.3.tar.xz
> +# Hash from: https://download.qt.io/official_releases/qt/5.10/5.10.1/submodules/qtcanvas3d-everywhere-src-5.10.1.tar.xz.mirrorlist
> +sha256 de829a8e6aa4b8496048e9b6f3bff306a80c35935855a94426025ddfb8bcb0c0  qtcanvas3d-everywhere-src-5.10.1.tar.xz
>  
>  # Hashes for license files:
>  sha256 edfe70e99be2a7c109d860b19204609e582720b211c50caedac729da372a1253 LICENSE.GPLv2
> diff --git a/package/qt5/qt5canvas3d/qt5canvas3d.mk b/package/qt5/qt5canvas3d/qt5canvas3d.mk
> index 97b0ec494e..0d31f45184 100644
> --- a/package/qt5/qt5canvas3d/qt5canvas3d.mk
> +++ b/package/qt5/qt5canvas3d/qt5canvas3d.mk
> @@ -6,7 +6,7 @@
>  
>  QT5CANVAS3D_VERSION = $(QT5_VERSION)
>  QT5CANVAS3D_SITE = $(QT5_SITE)
> -QT5CANVAS3D_SOURCE = qtcanvas3d-opensource-src-$(QT5CANVAS3D_VERSION).tar.xz
> +QT5CANVAS3D_SOURCE = $(call qt5source,qtcanvas3d,$(QT5CANVAS3D_VERSION))
>  QT5CANVAS3D_DEPENDENCIES = qt5base qt5declarative
>  QT5CANVAS3D_INSTALL_STAGING = YES
>  
> diff --git a/package/qt5/qt5charts/qt5charts.hash b/package/qt5/qt5charts/qt5charts.hash
> index 3a9db5b297..5a5845ef9f 100644
> --- a/package/qt5/qt5charts/qt5charts.hash
> +++ b/package/qt5/qt5charts/qt5charts.hash
> @@ -1,5 +1,5 @@
> -# Hash from: https://download.qt.io/official_releases/qt/5.9/5.9.3/submodules/qtcharts-opensource-src-5.9.3.tar.xz.mirrorlist
> -sha256 ec1783a81d5715fc48a3276e67b90a66cac3e283ac14fc3bf88b2058994d69e9  qtcharts-opensource-src-5.9.3.tar.xz
> +# Hash from: https://download.qt.io/official_releases/qt/5.10/5.10.1/submodules/qtcharts-everywhere-src-5.10.1.tar.xz.mirrorlist
> +sha256 4f0d577bf73dd2bbb2765c2cfb493a2d68790fc2c64f42544d31dba806321ec9  qtcharts-everywhere-src-5.10.1.tar.xz
>  
>  # Hashes for license files:
>  sha256 8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903 LICENSE.GPL3
> diff --git a/package/qt5/qt5charts/qt5charts.mk b/package/qt5/qt5charts/qt5charts.mk
> index 17fdd96702..ab5d7f5aa6 100644
> --- a/package/qt5/qt5charts/qt5charts.mk
> +++ b/package/qt5/qt5charts/qt5charts.mk
> @@ -6,7 +6,7 @@
>  
>  QT5CHARTS_VERSION = $(QT5_VERSION)
>  QT5CHARTS_SITE = $(QT5_SITE)
> -QT5CHARTS_SOURCE = qtcharts-opensource-src-$(QT5CHARTS_VERSION).tar.xz
> +QT5CHARTS_SOURCE = $(call qt5source,qtcharts,$(QT5CHARTS_VERSION))
>  QT5CHARTS_DEPENDENCIES = qt5base
>  QT5CHARTS_INSTALL_STAGING = YES
>  
> diff --git a/package/qt5/qt5connectivity/5.9.3/0001-Example-heartrate-server-needs-only-core-and-bluetoo.patch b/package/qt5/qt5connectivity/5.9.3/0001-Example-heartrate-server-needs-only-core-and-bluetoo.patch
> deleted file mode 100644
> index cb0e8d18b1..0000000000
> --- a/package/qt5/qt5connectivity/5.9.3/0001-Example-heartrate-server-needs-only-core-and-bluetoo.patch
> +++ /dev/null
> @@ -1,32 +0,0 @@
> -From 13c2f56cc9c3bbfe0c96031107e7fafd437703d9 Mon Sep 17 00:00:00 2001
> -From: Peter Seiderer <ps.report@gmx.net>
> -Date: Sat, 18 Nov 2017 21:07:44 +0100
> -Subject: [PATCH] Example heartrate-server needs only core and bluetooth module
> -
> -Fixes compile with disabled gui module.
> -
> -Task-number: QTBUG-64597
> -Change-Id: I376dede3db987e524f97070344cc119e0ee1d187
> -
> -Upstream: https://codereview.qt-project.org/211810
> -Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> ----
> - examples/bluetooth/heartrate-server/heartrate-server.pro | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> -diff --git a/examples/bluetooth/heartrate-server/heartrate-server.pro b/examples/bluetooth/heartrate-server/heartrate-server.pro
> -index 4ccf486c..edd011b9 100644
> ---- a/examples/bluetooth/heartrate-server/heartrate-server.pro
> -+++ b/examples/bluetooth/heartrate-server/heartrate-server.pro
> -@@ -1,7 +1,7 @@
> - TEMPLATE = app
> - TARGET = heartrate-server
> - 
> --QT += bluetooth
> -+QT = core bluetooth
> - CONFIG += c++11
> - 
> - SOURCES += main.cpp
> --- 
> -2.14.2
> -
> diff --git a/package/qt5/qt5connectivity/qt5connectivity.hash b/package/qt5/qt5connectivity/qt5connectivity.hash
> index aaa3ef275b..8364536309 100644
> --- a/package/qt5/qt5connectivity/qt5connectivity.hash
> +++ b/package/qt5/qt5connectivity/qt5connectivity.hash
> @@ -1,5 +1,5 @@
>  # Hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qtconnectivity-opensource-src-5.6.3.tar.xz.mirrorlist
>  sha256 fa406e3d63fa4a2acc8ecae6d110f20c766f19a21c7061a12f3c167deb07ccde qtconnectivity-opensource-src-5.6.3.tar.xz
>  
> -# Hash from: https://download.qt.io/official_releases/qt/5.9/5.9.3/submodules/qtconnectivity-opensource-src-5.9.3.tar.xz.mirrorlist
> -sha256 e2891e6e8d91e82e3c4d5667f3146062458067c0b706d65ac0fc7562afce0649 qtconnectivity-opensource-src-5.9.3.tar.xz
> +# Hash from: https://download.qt.io/official_releases/qt/5.10/5.10.1/submodules/qtconnectivity-everywhere-src-5.10.1.tar.xz.mirrorlist
> +sha256 652821dc6819658ec4bc1a6bf149fd7a61008748ff4745b54f038ccf276d3ec9  qtconnectivity-everywhere-src-5.10.1.tar.xz
> diff --git a/package/qt5/qt5connectivity/qt5connectivity.mk b/package/qt5/qt5connectivity/qt5connectivity.mk
> index 4369a411a5..61dd853f81 100644
> --- a/package/qt5/qt5connectivity/qt5connectivity.mk
> +++ b/package/qt5/qt5connectivity/qt5connectivity.mk
> @@ -6,7 +6,7 @@
>  
>  QT5CONNECTIVITY_VERSION = $(QT5_VERSION)
>  QT5CONNECTIVITY_SITE = $(QT5_SITE)
> -QT5CONNECTIVITY_SOURCE = qtconnectivity-opensource-src-$(QT5CONNECTIVITY_VERSION).tar.xz
> +QT5CONNECTIVITY_SOURCE = $(call qt5source,qtconnectivity,$(QT5CONNECTIVITY_VERSION))
>  QT5CONNECTIVITY_DEPENDENCIES = qt5base
>  QT5CONNECTIVITY_INSTALL_STAGING = YES
>  
> diff --git a/package/qt5/qt5declarative/qt5declarative.hash b/package/qt5/qt5declarative/qt5declarative.hash
> index 6f171ffa40..1634a88ecc 100644
> --- a/package/qt5/qt5declarative/qt5declarative.hash
> +++ b/package/qt5/qt5declarative/qt5declarative.hash
> @@ -1,8 +1,8 @@
>  # Hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qtdeclarative-opensource-src-5.6.3.tar.xz.mirrorlist
>  sha256 f63fc053d0d16b8a9ca9308f8ead77874b470ae31b66057e2bd336bf648191fc qtdeclarative-opensource-src-5.6.3.tar.xz
>  
> -# Hash from: https://download.qt.io/official_releases/qt/5.9/5.9.3/submodules/qtdeclarative-opensource-src-5.9.3.tar.xz.mirrorlist
> -sha256 505f66d2062c1d84ce743a0b4969531e1cf94e30970dc64efffe10f74f989407 qtdeclarative-opensource-src-5.9.3.tar.xz
> +# Hash from: https://download.qt.io/official_releases/qt/5.10/5.10.1/submodules/qtdeclarative-everywhere-src-5.10.1.tar.xz.mirrorlist
> +sha256 3af9ed51bce5b5c6f04c4a67a6008f98765ccde897c43fff670621ab70789553  qtdeclarative-everywhere-src-5.10.1.tar.xz
>  
>  # Hashes for license files:
>  sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 LICENSE.GPL2
> diff --git a/package/qt5/qt5declarative/qt5declarative.mk b/package/qt5/qt5declarative/qt5declarative.mk
> index de8b048329..2c5027e304 100644
> --- a/package/qt5/qt5declarative/qt5declarative.mk
> +++ b/package/qt5/qt5declarative/qt5declarative.mk
> @@ -6,7 +6,7 @@
>  
>  QT5DECLARATIVE_VERSION = $(QT5_VERSION)
>  QT5DECLARATIVE_SITE = $(QT5_SITE)
> -QT5DECLARATIVE_SOURCE = qtdeclarative-opensource-src-$(QT5DECLARATIVE_VERSION).tar.xz
> +QT5DECLARATIVE_SOURCE = $(call qt5source,qtdeclarative,$(QT5DECLARATIVE_VERSION))
>  QT5DECLARATIVE_DEPENDENCIES = qt5base qt5xmlpatterns
>  QT5DECLARATIVE_INSTALL_STAGING = YES
>  
> diff --git a/package/qt5/qt5enginio/qt5enginio.mk b/package/qt5/qt5enginio/qt5enginio.mk
> index 5590d7cf4e..38f309646f 100644
> --- a/package/qt5/qt5enginio/qt5enginio.mk
> +++ b/package/qt5/qt5enginio/qt5enginio.mk
> @@ -6,8 +6,8 @@
>  
>  # Qt5Enginio does not follow Qt versionning
>  # see https://bugreports.qt.io/browse/QTBUG-50111
> -QT5ENGINIO_VERSION = 1.6.2
> -QT5ENGINIO_SITE = $(QT5_SITE)
> +QT5ENGINIO_VERSION = 1.6.3
> +QT5ENGINIO_SITE = https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules
>  QT5ENGINIO_SOURCE = qtenginio-opensource-src-$(QT5ENGINIO_VERSION).tar.xz
>  QT5ENGINIO_DEPENDENCIES = openssl qt5base
>  QT5ENGINIO_INSTALL_STAGING = YES
> diff --git a/package/qt5/qt5graphicaleffects/qt5graphicaleffects.hash b/package/qt5/qt5graphicaleffects/qt5graphicaleffects.hash
> index 8770d72a19..0eb188f139 100644
> --- a/package/qt5/qt5graphicaleffects/qt5graphicaleffects.hash
> +++ b/package/qt5/qt5graphicaleffects/qt5graphicaleffects.hash
> @@ -1,8 +1,8 @@
>  # Hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qtgraphicaleffects-opensource-src-5.6.3.tar.xz.mirrorlist
>  sha256 c742592d5e45b122b29df60b69be23ba7c817f2dc471db86e054f6ea24a999ed qtgraphicaleffects-opensource-src-5.6.3.tar.xz
>  
> -# Hash from: https://download.qt.io/official_releases/qt/5.9/5.9.3/submodules/qtgraphicaleffects-opensource-src-5.9.3.tar.xz.mirrorlist
> -sha256 790b029bc8bdbb5c9548ecad2ff6e73b7da3deabbdba6bacac4a6aacd3a0f0d9 qtgraphicaleffects-opensource-src-5.9.3.tar.xz
> +# Hash from: https://download.qt.io/official_releases/qt/5.10/5.10.1/submodules/qtgraphicaleffects-everywhere-src-5.10.1.tar.xz.mirrorlist
> +sha256 3f3b0631b579630bf58e99f3ca0d8dfdb6a44153c63cf90ac9e07041b4b1847f  qtgraphicaleffects-everywhere-src-5.10.1.tar.xz
>  
>  # Hashes for license files:
>  sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 LICENSE.GPL2
> diff --git a/package/qt5/qt5graphicaleffects/qt5graphicaleffects.mk b/package/qt5/qt5graphicaleffects/qt5graphicaleffects.mk
> index 2f6380f712..3467783b60 100644
> --- a/package/qt5/qt5graphicaleffects/qt5graphicaleffects.mk
> +++ b/package/qt5/qt5graphicaleffects/qt5graphicaleffects.mk
> @@ -6,7 +6,7 @@
>  
>  QT5GRAPHICALEFFECTS_VERSION = $(QT5_VERSION)
>  QT5GRAPHICALEFFECTS_SITE = $(QT5_SITE)
> -QT5GRAPHICALEFFECTS_SOURCE = qtgraphicaleffects-opensource-src-$(QT5GRAPHICALEFFECTS_VERSION).tar.xz
> +QT5GRAPHICALEFFECTS_SOURCE = $(call qt5source,qtgraphicaleffects,$(QT5GRAPHICALEFFECTS_VERSION))
>  QT5GRAPHICALEFFECTS_DEPENDENCIES = qt5base qt5declarative
>  QT5GRAPHICALEFFECTS_INSTALL_STAGING = YES
>  
> diff --git a/package/qt5/qt5imageformats/qt5imageformats.hash b/package/qt5/qt5imageformats/qt5imageformats.hash
> index c56ed7d587..ac858ea244 100644
> --- a/package/qt5/qt5imageformats/qt5imageformats.hash
> +++ b/package/qt5/qt5imageformats/qt5imageformats.hash
> @@ -1,8 +1,8 @@
>  # Hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qtimageformats-opensource-src-5.6.3.tar.xz.mirrorlist
>  sha256 efe4da3c90c976c9b9a2eb6b081d2b8e1435935695104456276ce98e8a5848c3 qtimageformats-opensource-src-5.6.3.tar.xz
>  
> -# Hash from: https://download.qt.io/official_releases/qt/5.9/5.9.3/submodules/qtimageformats-opensource-src-5.9.3.tar.xz.mirrorlist
> -sha256 d4b309ddbac2275cafadffc62047a26ed8f169bde015925761894843eae725dd qtimageformats-opensource-src-5.9.3.tar.xz
> +# Hash from: https://download.qt.io/official_releases/qt/5.10/5.10.1/submodules/qtimageformats-everywhere-src-5.10.1.tar.xz.mirrorlist
> +sha256 2804baa2779eae015096820e233d7f86bb7fde9853b7c9150a321a453422a283  qtimageformats-everywhere-src-5.10.1.tar.xz
>  
>  # Hashes for license files:
>  sha256 edfe70e99be2a7c109d860b19204609e582720b211c50caedac729da372a1253 LICENSE.GPLv2
> diff --git a/package/qt5/qt5imageformats/qt5imageformats.mk b/package/qt5/qt5imageformats/qt5imageformats.mk
> index f70f131d50..f0215837bd 100644
> --- a/package/qt5/qt5imageformats/qt5imageformats.mk
> +++ b/package/qt5/qt5imageformats/qt5imageformats.mk
> @@ -6,7 +6,7 @@
>  
>  QT5IMAGEFORMATS_VERSION = $(QT5_VERSION)
>  QT5IMAGEFORMATS_SITE = $(QT5_SITE)
> -QT5IMAGEFORMATS_SOURCE = qtimageformats-opensource-src-$(QT5IMAGEFORMATS_VERSION).tar.xz
> +QT5IMAGEFORMATS_SOURCE = $(call qt5source,qtimageformats,$(QT5IMAGEFORMATS_VERSION))
>  QT5IMAGEFORMATS_DEPENDENCIES = qt5base
>  QT5IMAGEFORMATS_INSTALL_STAGING = YES
>  
> diff --git a/package/qt5/qt5location/qt5location.hash b/package/qt5/qt5location/qt5location.hash
> index 5bb2021e09..c89af3fa89 100644
> --- a/package/qt5/qt5location/qt5location.hash
> +++ b/package/qt5/qt5location/qt5location.hash
> @@ -1,8 +1,8 @@
>  # Hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qtlocation-opensource-src-5.6.3.tar.xz.mirrorlist
>  sha256 b7a81c58cc331fb15bea8fba21d3c9a59f6dc6ad2e4855e30a14ce59a2af1466 qtlocation-opensource-src-5.6.3.tar.xz
>  
> -# Hash from: https://download.qt.io/official_releases/qt/5.9/5.9.3/submodules/qtlocation-opensource-src-5.9.3.tar.xz.mirrorlist
> -sha256 80fd425cde8747c1fc79aa90994a9caf921d7c79ff41babec692fe43cdc74ce1 qtlocation-opensource-src-5.9.3.tar.xz
> +# Hash from: https://download.qt.io/official_releases/qt/5.10/5.10.1/submodules/qtlocation-everywhere-src-5.10.1.tar.xz.mirrorlist
> +sha256 5e5cc05517c701a2c8ebba1fbe3ddff2b6b90d5aa554d307b1c477fe0cfd72c9  qtlocation-everywhere-src-5.10.1.tar.xz
>  
>  # Hashes for license files:
>  sha256 edfe70e99be2a7c109d860b19204609e582720b211c50caedac729da372a1253 LICENSE.GPLv2
> diff --git a/package/qt5/qt5location/qt5location.mk b/package/qt5/qt5location/qt5location.mk
> index e9f1e4d93d..3b0ec5d2ef 100644
> --- a/package/qt5/qt5location/qt5location.mk
> +++ b/package/qt5/qt5location/qt5location.mk
> @@ -6,7 +6,7 @@
>  
>  QT5LOCATION_VERSION = $(QT5_VERSION)
>  QT5LOCATION_SITE = $(QT5_SITE)
> -QT5LOCATION_SOURCE = qtlocation-opensource-src-$(QT5LOCATION_VERSION).tar.xz
> +QT5LOCATION_SOURCE = $(call qt5source,qtlocation,$(QT5LOCATION_VERSION))
>  QT5LOCATION_DEPENDENCIES = qt5base
>  QT5LOCATION_INSTALL_STAGING = YES
>  
> diff --git a/package/qt5/qt5multimedia/qt5multimedia.hash b/package/qt5/qt5multimedia/qt5multimedia.hash
> index 750c3379ca..0fb25b6e09 100644
> --- a/package/qt5/qt5multimedia/qt5multimedia.hash
> +++ b/package/qt5/qt5multimedia/qt5multimedia.hash
> @@ -1,8 +1,8 @@
>  # Hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qtmultimedia-opensource-src-5.6.3.tar.xz.mirrorlist
>  sha256 ae36039ea8037742342f1615687e0ca2188f3ed0d700627a5e5be546c15e1b46 qtmultimedia-opensource-src-5.6.3.tar.xz
>  
> -# Hash from: https://download.qt.io/official_releases/qt/5.9/5.9.3/submodules/qtmultimedia-opensource-src-5.9.3.tar.xz.mirrorlist
> -sha256 e79558d24ace9b4444d91d807b85778b6a0a592e7d1500ffadf45f7d3b8238a6 qtmultimedia-opensource-src-5.9.3.tar.xz
> +# Hash from: https://download.qt.io/official_releases/qt/5.10/5.10.1/submodules/qtmultimedia-everywhere-src-5.10.1.tar.xz.mirrorlist
> +sha256 a1fa98015ee5a6b81f2d337abc98d8b297c6718f7714a1f13fccfd2934c23649  qtmultimedia-everywhere-src-5.10.1.tar.xz
>  
>  # Hashes for license files:
>  sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 LICENSE.GPL2
> diff --git a/package/qt5/qt5multimedia/qt5multimedia.mk b/package/qt5/qt5multimedia/qt5multimedia.mk
> index 6df96bcab4..6120403f30 100644
> --- a/package/qt5/qt5multimedia/qt5multimedia.mk
> +++ b/package/qt5/qt5multimedia/qt5multimedia.mk
> @@ -6,7 +6,7 @@
>  
>  QT5MULTIMEDIA_VERSION = $(QT5_VERSION)
>  QT5MULTIMEDIA_SITE = $(QT5_SITE)
> -QT5MULTIMEDIA_SOURCE = qtmultimedia-opensource-src-$(QT5MULTIMEDIA_VERSION).tar.xz
> +QT5MULTIMEDIA_SOURCE = $(call qt5source,qtmultimedia,$(QT5MULTIMEDIA_VERSION))
>  QT5MULTIMEDIA_DEPENDENCIES = qt5base
>  QT5MULTIMEDIA_INSTALL_STAGING = YES
>  
> diff --git a/package/qt5/qt5quickcontrols/qt5quickcontrols.hash b/package/qt5/qt5quickcontrols/qt5quickcontrols.hash
> index 84890c5612..a829e6b495 100644
> --- a/package/qt5/qt5quickcontrols/qt5quickcontrols.hash
> +++ b/package/qt5/qt5quickcontrols/qt5quickcontrols.hash
> @@ -1,8 +1,8 @@
>  # Hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qtquickcontrols-opensource-src-5.6.3.tar.xz.mirrorlist
>  sha256 31bb0fc8f21b855af6ff02c415be3246128b523d0ef7c05e248e92281ab0db8e qtquickcontrols-opensource-src-5.6.3.tar.xz
>  
> -# Hash from: https://download.qt.io/official_releases/qt/5.9/5.9.3/submodules/qtquickcontrols-opensource-src-5.9.3.tar.xz.mirrorlist
> -sha256 300eeebd7d2c243c0123bc2324b5643b3f967c0816aead0ba7b993aeeac0e226 qtquickcontrols-opensource-src-5.9.3.tar.xz
> +# Hash from: https://download.qt.io/official_releases/qt/5.10/5.10.1/submodules/qtquickcontrols-everywhere-src-5.10.1.tar.xz.mirrorlist
> +sha256 d231a1993dc6a3f0dbc60a21d01fc0be15b0c26e881bd0631573952ea61682b7  qtquickcontrols-everywhere-src-5.10.1.tar.xz
>  
>  # Hashes for license files:
>  sha256 edfe70e99be2a7c109d860b19204609e582720b211c50caedac729da372a1253 LICENSE.GPLv2
> diff --git a/package/qt5/qt5quickcontrols/qt5quickcontrols.mk b/package/qt5/qt5quickcontrols/qt5quickcontrols.mk
> index 88e767bcf9..9cd223208f 100644
> --- a/package/qt5/qt5quickcontrols/qt5quickcontrols.mk
> +++ b/package/qt5/qt5quickcontrols/qt5quickcontrols.mk
> @@ -6,7 +6,7 @@
>  
>  QT5QUICKCONTROLS_VERSION = $(QT5_VERSION)
>  QT5QUICKCONTROLS_SITE = $(QT5_SITE)
> -QT5QUICKCONTROLS_SOURCE = qtquickcontrols-opensource-src-$(QT5QUICKCONTROLS_VERSION).tar.xz
> +QT5QUICKCONTROLS_SOURCE = $(call qt5source,qtquickcontrols,$(QT5QUICKCONTROLS_VERSION))
>  QT5QUICKCONTROLS_DEPENDENCIES = qt5base qt5declarative
>  QT5QUICKCONTROLS_INSTALL_STAGING = YES
>  
> diff --git a/package/qt5/qt5quickcontrols2/5.9.3/0001-Example-flatstyle-needs-widgets-module.patch b/package/qt5/qt5quickcontrols2/5.9.3/0001-Example-flatstyle-needs-widgets-module.patch
> deleted file mode 100644
> index 17e3b3610e..0000000000
> --- a/package/qt5/qt5quickcontrols2/5.9.3/0001-Example-flatstyle-needs-widgets-module.patch
> +++ /dev/null
> @@ -1,31 +0,0 @@
> -From 10d92524cd6736c767c9ce55a1d9b9f1a2a69a9f Mon Sep 17 00:00:00 2001
> -From: Peter Seiderer <ps.report@gmx.net>
> -Date: Sat, 25 Nov 2017 22:26:58 +0100
> -Subject: [PATCH] Example flatstyle needs widgets module
> -
> -Fixes compile with disabled widgets module.
> -
> -Task-number: QTBUG-64761
> -Change-Id: I743884d77d51e89061d87cab006bab0cafc9ddb7
> -
> -Upstream: https://codereview.qt-project.org/212583
> -Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> ----
> - examples/quickcontrols2/quickcontrols2.pro | 3 ++-
> - 1 file changed, 2 insertions(+), 1 deletion(-)
> -
> -diff --git a/examples/quickcontrols2/quickcontrols2.pro b/examples/quickcontrols2/quickcontrols2.pro
> -index 858759f..8310e9b 100644
> ---- a/examples/quickcontrols2/quickcontrols2.pro
> -+++ b/examples/quickcontrols2/quickcontrols2.pro
> -@@ -6,5 +6,6 @@ SUBDIRS += \
> -     contactlist \
> -     sidepanel \
> -     swipetoremove \
> --    flatstyle \
> -     wearable
> -+
> -+qtHaveModule(widgets): SUBDIRS += flatstyle
> --- 
> -2.7.4
> -
> diff --git a/package/qt5/qt5quickcontrols2/qt5quickcontrols2.hash b/package/qt5/qt5quickcontrols2/qt5quickcontrols2.hash
> index 7a6040f34c..f446980e87 100644
> --- a/package/qt5/qt5quickcontrols2/qt5quickcontrols2.hash
> +++ b/package/qt5/qt5quickcontrols2/qt5quickcontrols2.hash
> @@ -1,8 +1,8 @@
>  # Hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qtquickcontrols2-opensource-src-5.6.3.tar.xz.mirrorlist
>  sha256 ec5078470abe2da888c2be5d1749b5961ef5132487c180ce4d4aa19ea7ff81cb qtquickcontrols2-opensource-src-5.6.3.tar.xz
>  
> -# Hash from: https://download.qt.io/official_releases/qt/5.9/5.9.3/submodules/qtquickcontrols2-opensource-src-5.9.3.tar.xz.mirrorlist
> -sha256 21aaa26956ad0ccc3ce86ced7925ceae4b4cef25c6c5ef2f7ded608431420843 qtquickcontrols2-opensource-src-5.9.3.tar.xz
> +# Hash from: https://download.qt.io/official_releases/qt/5.10/5.10.1/submodules/qtquickcontrols2-everywhere-src-5.10.1.tar.xz.mirrorlist
> +sha256 5dc64a1b901e418b76fd3bf65dfa87a0cb11338741fb8970211c1df6df0e604a  qtquickcontrols2-everywhere-src-5.10.1.tar.xz
>  
>  # Hashes for license files:
>  sha256 d2cfc059acb4abd8e513cd0a73cd8489f34cbafa7bc34d5d31fb3210821cf8ca LICENSE.GPLv3
> diff --git a/package/qt5/qt5quickcontrols2/qt5quickcontrols2.mk b/package/qt5/qt5quickcontrols2/qt5quickcontrols2.mk
> index f27cafc63b..7508b84b27 100644
> --- a/package/qt5/qt5quickcontrols2/qt5quickcontrols2.mk
> +++ b/package/qt5/qt5quickcontrols2/qt5quickcontrols2.mk
> @@ -6,7 +6,7 @@
>  
>  QT5QUICKCONTROLS2_VERSION = $(QT5_VERSION)
>  QT5QUICKCONTROLS2_SITE = $(QT5_SITE)
> -QT5QUICKCONTROLS2_SOURCE = qtquickcontrols2-opensource-src-$(QT5QUICKCONTROLS2_VERSION).tar.xz
> +QT5QUICKCONTROLS2_SOURCE = $(call qt5source,qtquickcontrols2,$(QT5QUICKCONTROLS2_VERSION))
>  QT5QUICKCONTROLS2_DEPENDENCIES = qt5base qt5declarative
>  QT5QUICKCONTROLS2_INSTALL_STAGING = YES
>  
> diff --git a/package/qt5/qt5script/qt5script.hash b/package/qt5/qt5script/qt5script.hash
> index 66582ad448..2d41a98e83 100644
> --- a/package/qt5/qt5script/qt5script.hash
> +++ b/package/qt5/qt5script/qt5script.hash
> @@ -1,8 +1,8 @@
>  # Hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qtscript-opensource-src-5.6.3.tar.xz.mirrorlist
>  sha256 f08720dd0e3a70377c1cb7fa3b129e24f4cdedade279e51b67c9271ab470b389 qtscript-opensource-src-5.6.3.tar.xz
>  
> -# Hash from: https://download.qt.io/official_releases/qt/5.9/5.9.3/submodules/qtscript-opensource-src-5.9.3.tar.xz.mirrorlist
> -sha256 b80bfaaf58f154b68101e438a1881f669cb9974026926be7755adb00af355566 qtscript-opensource-src-5.9.3.tar.xz
> +# Hash from: https://download.qt.io/official_releases/qt/5.10/5.10.1/submodules/qtscript-everywhere-src-5.10.1.tar.xz.mirrorlist
> +sha256 e0618af7cb1f1f30d292c04cf484e3507cf6f4815f79870e35d2b0ce7ac9532d  qtscript-everywhere-src-5.10.1.tar.xz
>  
>  # Hashes for license files:
>  sha256 245248009fd0af1725d183248380e476c1283383909358a13686606352bf2a17 LICENSE.GPLv3
> diff --git a/package/qt5/qt5script/qt5script.mk b/package/qt5/qt5script/qt5script.mk
> index b6c02d0d1c..49371fba16 100644
> --- a/package/qt5/qt5script/qt5script.mk
> +++ b/package/qt5/qt5script/qt5script.mk
> @@ -6,7 +6,7 @@
>  
>  QT5SCRIPT_VERSION = $(QT5_VERSION)
>  QT5SCRIPT_SITE = $(QT5_SITE)
> -QT5SCRIPT_SOURCE = qtscript-opensource-src-$(QT5SCRIPT_VERSION).tar.xz
> +QT5SCRIPT_SOURCE = $(call qt5source,qtscript,$(QT5SCRIPT_VERSION))
>  QT5SCRIPT_DEPENDENCIES = qt5base
>  QT5SCRIPT_INSTALL_STAGING = YES
>  
> diff --git a/package/qt5/qt5scxml/qt5scxml.hash b/package/qt5/qt5scxml/qt5scxml.hash
> index b0d861573c..d272881843 100644
> --- a/package/qt5/qt5scxml/qt5scxml.hash
> +++ b/package/qt5/qt5scxml/qt5scxml.hash
> @@ -1,5 +1,5 @@
> -# Hash from: https://download.qt.io/official_releases/qt/5.9/5.9.3/submodules/qtscxml-opensource-src-5.9.3.tar.xz.mirrorlist
> -sha256 d8f51fa8eddd09fef29d8fad6e570e9ca9403469543ab10cb5cfad738786a81b qtscxml-opensource-src-5.9.3.tar.xz
> +# Hash from: https://download.qt.io/official_releases/qt/5.10/5.10.1/submodules/qtscxml-everywhere-src-5.10.1.tar.xz.mirrorlist
> +sha256 0b42d201e4f96af1c404a61f01da6726bab9bfba4e280cc4a82c717f0db26103  qtscxml-everywhere-src-5.10.1.tar.xz
>  
>  # Hashes for license files:
>  
> diff --git a/package/qt5/qt5scxml/qt5scxml.mk b/package/qt5/qt5scxml/qt5scxml.mk
> index 2d197a2bca..065cdd7d1a 100644
> --- a/package/qt5/qt5scxml/qt5scxml.mk
> +++ b/package/qt5/qt5scxml/qt5scxml.mk
> @@ -6,7 +6,7 @@
>  
>  QT5SCXML_VERSION = $(QT5_VERSION)
>  QT5SCXML_SITE = $(QT5_SITE)
> -QT5SCXML_SOURCE = qtscxml-opensource-src-$(QT5SCXML_VERSION).tar.xz
> +QT5SCXML_SOURCE = $(call qt5source,qtscxml,$(QT5SCXML_VERSION))
>  QT5SCXML_DEPENDENCIES = qt5base qt5declarative
>  QT5SCXML_INSTALL_STAGING = YES
>  
> diff --git a/package/qt5/qt5sensors/qt5sensors.hash b/package/qt5/qt5sensors/qt5sensors.hash
> index 26e13d60b1..0b7222f14d 100644
> --- a/package/qt5/qt5sensors/qt5sensors.hash
> +++ b/package/qt5/qt5sensors/qt5sensors.hash
> @@ -1,8 +1,8 @@
>  # Hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qtsensors-opensource-src-5.6.3.tar.xz.mirrorlist
>  sha256 7502d4dc5571865a7eea2a4180c3be396dfb8ce22df4c4f3d7e9ff32ab334973 qtsensors-opensource-src-5.6.3.tar.xz
>  
> -# Hash from: https://download.qt.io/official_releases/qt/5.9/5.9.3/submodules/qtsensors-opensource-src-5.9.3.tar.xz.mirrorlist
> -sha256 b95ea20b3d616655435357671558631da6fe6970500b7e6d35d1111f0b8cdac1 qtsensors-opensource-src-5.9.3.tar.xz
> +# Hash from: https://download.qt.io/official_releases/qt/5.10/5.10.1/submodules/qtsensors-everywhere-src-5.10.1.tar.xz.mirrorlist
> +sha256 bb0df76c0e53cf2b39d10dbf0964706a264413aae74a4596119143ab4d165c96  qtsensors-everywhere-src-5.10.1.tar.xz
>  
>  # Hashes for license files:
>  sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 LICENSE.GPL2
> diff --git a/package/qt5/qt5sensors/qt5sensors.mk b/package/qt5/qt5sensors/qt5sensors.mk
> index d4dc47e89c..b9e995bbfd 100644
> --- a/package/qt5/qt5sensors/qt5sensors.mk
> +++ b/package/qt5/qt5sensors/qt5sensors.mk
> @@ -6,7 +6,7 @@
>  
>  QT5SENSORS_VERSION = $(QT5_VERSION)
>  QT5SENSORS_SITE = $(QT5_SITE)
> -QT5SENSORS_SOURCE = qtsensors-opensource-src-$(QT5SENSORS_VERSION).tar.xz
> +QT5SENSORS_SOURCE = $(call qt5source,qtsensors,$(QT5SENSORS_VERSION))
>  QT5SENSORS_DEPENDENCIES = qt5base
>  QT5SENSORS_INSTALL_STAGING = YES
>  
> diff --git a/package/qt5/qt5serialbus/qt5serialbus.hash b/package/qt5/qt5serialbus/qt5serialbus.hash
> index 9191fd2198..d392897816 100644
> --- a/package/qt5/qt5serialbus/qt5serialbus.hash
> +++ b/package/qt5/qt5serialbus/qt5serialbus.hash
> @@ -1,8 +1,8 @@
>  # Hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qtserialbus-opensource-src-5.6.3.tar.xz.mirrorlist
>  sha256 71c89be3879414e2a11cad93a4882758f9259b1c0aec980560309192c99f9a9e qtserialbus-opensource-src-5.6.3.tar.xz
>  
> -# Hash from: https://download.qt.io/official_releases/qt/5.9/5.9.3/submodules/qtserialbus-opensource-src-5.9.3.tar.xz.mirrorlist
> -sha256 ef62745e1793515e03fa586171de13eb17ee7699c9eb626f76a4dc5a00c46938 qtserialbus-opensource-src-5.9.3.tar.xz
> +# Hash from: https://download.qt.io/official_releases/qt/5.10/5.10.1/submodules/qtserialbus-everywhere-src-5.10.1.tar.xz.mirrorlist
> +sha256 0650a17950f140130ec20520b06592618850cc5673a815cb4fd585590d922257  qtserialbus-everywhere-src-5.10.1.tar.xz
>  
>  # Hashes for license files:
>  sha256 edfe70e99be2a7c109d860b19204609e582720b211c50caedac729da372a1253 LICENSE.GPLv2
> diff --git a/package/qt5/qt5serialbus/qt5serialbus.mk b/package/qt5/qt5serialbus/qt5serialbus.mk
> index 218aba4e0a..359bb14955 100644
> --- a/package/qt5/qt5serialbus/qt5serialbus.mk
> +++ b/package/qt5/qt5serialbus/qt5serialbus.mk
> @@ -6,7 +6,7 @@
>  
>  QT5SERIALBUS_VERSION = $(QT5_VERSION)
>  QT5SERIALBUS_SITE = $(QT5_SITE)
> -QT5SERIALBUS_SOURCE = qtserialbus-opensource-src-$(QT5SERIALBUS_VERSION).tar.xz
> +QT5SERIALBUS_SOURCE = $(call qt5source,qtserialbus,$(QT5SERIALBUS_VERSION))
>  QT5SERIALBUS_DEPENDENCIES = qt5base qt5serialport
>  QT5SERIALBUS_INSTALL_STAGING = YES
>  
> diff --git a/package/qt5/qt5serialport/qt5serialport.hash b/package/qt5/qt5serialport/qt5serialport.hash
> index 15abf7ac09..544371d391 100644
> --- a/package/qt5/qt5serialport/qt5serialport.hash
> +++ b/package/qt5/qt5serialport/qt5serialport.hash
> @@ -1,8 +1,8 @@
>  # Hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qtserialport-opensource-src-5.6.3.tar.xz.mirrorlist
>  sha256 082d1fee2703aed19f840c4e4031e37c9b929e5bd8ebef2ebac4b28c509bae1a qtserialport-opensource-src-5.6.3.tar.xz
>  
> -# Hash from: https://download.qt.io/official_releases/qt/5.9/5.9.3/submodules/qtserialport-opensource-src-5.9.3.tar.xz.mirrorlist
> -sha256 4cdd3e9157ec3e91078f993cd28651989fa2429a409e19d398fb9cced231abdf qtserialport-opensource-src-5.9.3.tar.xz
> +# Hash from: https://download.qt.io/official_releases/qt/5.10/5.10.1/submodules/qtserialport-everywhere-src-5.10.1.tar.xz.mirrorlist
> +sha256 08e4cb13bbf165eb99857301f3cffe280a4946ff58a34ccc542ad1f790194a9e  qtserialport-everywhere-src-5.10.1.tar.xz
>  
>  # Hashes for license files:
>  sha256 edfe70e99be2a7c109d860b19204609e582720b211c50caedac729da372a1253 LICENSE.GPLv2
> diff --git a/package/qt5/qt5serialport/qt5serialport.mk b/package/qt5/qt5serialport/qt5serialport.mk
> index 479870b16e..fe14d2f6e4 100644
> --- a/package/qt5/qt5serialport/qt5serialport.mk
> +++ b/package/qt5/qt5serialport/qt5serialport.mk
> @@ -6,7 +6,7 @@
>  
>  QT5SERIALPORT_VERSION = $(QT5_VERSION)
>  QT5SERIALPORT_SITE = $(QT5_SITE)
> -QT5SERIALPORT_SOURCE = qtserialport-opensource-src-$(QT5SERIALPORT_VERSION).tar.xz
> +QT5SERIALPORT_SOURCE = $(call qt5source,qtserialport,$(QT5SERIALPORT_VERSION))
>  QT5SERIALPORT_DEPENDENCIES = qt5base
>  QT5SERIALPORT_INSTALL_STAGING = YES
>  
> diff --git a/package/qt5/qt5svg/qt5svg.hash b/package/qt5/qt5svg/qt5svg.hash
> index 03659702d6..3a10080e29 100644
> --- a/package/qt5/qt5svg/qt5svg.hash
> +++ b/package/qt5/qt5svg/qt5svg.hash
> @@ -1,8 +1,8 @@
>  # Hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qtsvg-opensource-src-5.6.3.tar.xz.mirrorlist
>  sha256 100f183517b46554079beabd8d2cabe3070a74dd0a2e64b6a304eac71cfadcec qtsvg-opensource-src-5.6.3.tar.xz
>  
> -# Hash from: https://download.qt.io/official_releases/qt/5.9/5.9.3/submodules/qtsvg-opensource-src-5.9.3.tar.xz.mirrorlist
> -sha256 df6628a60c8fbbcff99e6a24955c29494268d741509a3367a2294031ab4f5df2 qtsvg-opensource-src-5.9.3.tar.xz
> +# Hash from: https://download.qt.io/official_releases/qt/5.10/5.10.1/submodules/qtsvg-everywhere-src-5.10.1.tar.xz.mirrorlist
> +sha256 00e00c04abcc8363cf7d94ca8b16af61840995a4af23685d49fa4ccafa1c7f5a  qtsvg-everywhere-src-5.10.1.tar.xz
>  
>  # Hashes for license files:
>  sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 LICENSE.GPL2
> diff --git a/package/qt5/qt5svg/qt5svg.mk b/package/qt5/qt5svg/qt5svg.mk
> index 5a12755f94..078ea3dbee 100644
> --- a/package/qt5/qt5svg/qt5svg.mk
> +++ b/package/qt5/qt5svg/qt5svg.mk
> @@ -6,7 +6,7 @@
>  
>  QT5SVG_VERSION = $(QT5_VERSION)
>  QT5SVG_SITE = $(QT5_SITE)
> -QT5SVG_SOURCE = qtsvg-opensource-src-$(QT5SVG_VERSION).tar.xz
> +QT5SVG_SOURCE = $(call qt5source,qtsvg,$(QT5SVG_VERSION))
>  QT5SVG_DEPENDENCIES = qt5base
>  QT5SVG_INSTALL_STAGING = YES
>  
> diff --git a/package/qt5/qt5tools/qt5tools.hash b/package/qt5/qt5tools/qt5tools.hash
> index 44856400e7..83e6ef41be 100644
> --- a/package/qt5/qt5tools/qt5tools.hash
> +++ b/package/qt5/qt5tools/qt5tools.hash
> @@ -1,8 +1,8 @@
>  # Hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qttools-opensource-src-5.6.3.tar.xz.mirrorlist
>  sha256 1a63ba838058d73cb540040589b235ded77f76402693decfd6d4d3c75ea67926 qttools-opensource-src-5.6.3.tar.xz
>  
> -# Hash from: https://download.qt.io/official_releases/qt/5.9/5.9.3/submodules/qttools-opensource-src-5.9.3.tar.xz.mirrorlist
> -sha256 442c38de3e35f9dcc355dadff35436e23a5a7abd7dd1167a3bf6325e3d9284ff qttools-opensource-src-5.9.3.tar.xz
> +# Hash from: https://download.qt.io/official_releases/qt/5.10/5.10.1/submodules/qttools-everywhere-src-5.10.1.tar.xz.mirrorlist
> +sha256 f1ea441e5fe138756e6de3b60ab7d8d3051799eabe85a9408c995dfd4d048a53  qttools-everywhere-src-5.10.1.tar.xz
>  
>  # Hashes for license files:
>  sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 LICENSE.GPL2
> diff --git a/package/qt5/qt5tools/qt5tools.mk b/package/qt5/qt5tools/qt5tools.mk
> index 3638b74163..eb03dbfc71 100644
> --- a/package/qt5/qt5tools/qt5tools.mk
> +++ b/package/qt5/qt5tools/qt5tools.mk
> @@ -6,7 +6,7 @@
>  
>  QT5TOOLS_VERSION = $(QT5_VERSION)
>  QT5TOOLS_SITE = $(QT5_SITE)
> -QT5TOOLS_SOURCE = qttools-opensource-src-$(QT5BASE_VERSION).tar.xz
> +QT5TOOLS_SOURCE = $(call qt5source,qttools,$(QT5TOOLS_VERSION))
>  
>  QT5TOOLS_DEPENDENCIES = qt5base
>  QT5TOOLS_INSTALL_STAGING = YES
> diff --git a/package/qt5/qt5virtualkeyboard/qt5virtualkeyboard.hash b/package/qt5/qt5virtualkeyboard/qt5virtualkeyboard.hash
> index 54ded48dea..44ef1f230f 100644
> --- a/package/qt5/qt5virtualkeyboard/qt5virtualkeyboard.hash
> +++ b/package/qt5/qt5virtualkeyboard/qt5virtualkeyboard.hash
> @@ -1,5 +1,5 @@
> -# Hash from: https://download.qt.io/official_releases/qt/5.9/5.9.3/submodules/qtvirtualkeyboard-opensource-src-5.9.3.tar.xz.mirrorlist
> -sha256 b9313f744026f0dcf6e1008212880cd34851499d8b6bc9fc9fbaa1e4e52532ff qtvirtualkeyboard-opensource-src-5.9.3.tar.xz
> +# Hash from: https://download.qt.io/official_releases/qt/5.10/5.10.1/submodules/qtvirtualkeyboard-everywhere-src-5.10.1.tar.xz.mirrorlist
> +sha256 4319f90e68a571974d03f39507dde548971412e31f971081ca7eaf388187d52e  qtvirtualkeyboard-everywhere-src-5.10.1.tar.xz
>  
>  # Hashes for license files:
>  sha256 8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903 LICENSE.GPL3
> diff --git a/package/qt5/qt5virtualkeyboard/qt5virtualkeyboard.mk b/package/qt5/qt5virtualkeyboard/qt5virtualkeyboard.mk
> index 7d2201b55d..45f096e44b 100644
> --- a/package/qt5/qt5virtualkeyboard/qt5virtualkeyboard.mk
> +++ b/package/qt5/qt5virtualkeyboard/qt5virtualkeyboard.mk
> @@ -6,7 +6,7 @@
>  
>  QT5VIRTUALKEYBOARD_VERSION = $(QT5_VERSION)
>  QT5VIRTUALKEYBOARD_SITE = $(QT5_SITE)
> -QT5VIRTUALKEYBOARD_SOURCE = qtvirtualkeyboard-opensource-src-$(QT5VIRTUALKEYBOARD_VERSION).tar.xz
> +QT5VIRTUALKEYBOARD_SOURCE = $(call qt5source,qtvirtualkeyboard,$(QT5VIRTUALKEYBOARD_VERSION))
>  QT5VIRTUALKEYBOARD_DEPENDENCIES = qt5base qt5declarative qt5svg
>  QT5VIRTUALKEYBOARD_INSTALL_STAGING = YES
>  
> diff --git a/package/qt5/qt5wayland/qt5wayland.hash b/package/qt5/qt5wayland/qt5wayland.hash
> index f03a15ceb9..b28677ad29 100644
> --- a/package/qt5/qt5wayland/qt5wayland.hash
> +++ b/package/qt5/qt5wayland/qt5wayland.hash
> @@ -1,8 +1,8 @@
>  # hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qtwayland-opensource-src-5.6.3.tar.xz.mirrorlist
>  sha256 5a475278b2db73aa7fa7f3ba6d98d8d72774f5c77e172495007d79f91d09daa3 qtwayland-opensource-src-5.6.3.tar.xz
>  
> -# Hash from: https://download.qt.io/official_releases/qt/5.9/5.9.3/submodules/qtwayland-opensource-src-5.9.3.tar.xz.mirrorlist
> -sha256 308e8c44b0ad13520868365d72786d3e3f0b384da99ee72ba543cd866f655f6d qtwayland-opensource-src-5.9.3.tar.xz
> +# Hash from: https://download.qt.io/official_releases/qt/5.10/5.10.1/submodules/qtwayland-everywhere-src-5.10.1.tar.xz.mirrorlist
> +sha256 f5a7643a5ebcdc50d02b293191e675f387f67dc360c27bf6f94345372fba6356  qtwayland-everywhere-src-5.10.1.tar.xz
>  
>  # Hashes for license files:
>  sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 LICENSE.GPL2
> diff --git a/package/qt5/qt5wayland/qt5wayland.mk b/package/qt5/qt5wayland/qt5wayland.mk
> index 0a7bdb8cf9..3887287174 100644
> --- a/package/qt5/qt5wayland/qt5wayland.mk
> +++ b/package/qt5/qt5wayland/qt5wayland.mk
> @@ -6,7 +6,7 @@
>  
>  QT5WAYLAND_VERSION = $(QT5_VERSION)
>  QT5WAYLAND_SITE = $(QT5_SITE)
> -QT5WAYLAND_SOURCE = qtwayland-opensource-src-$(QT5WAYLAND_VERSION).tar.xz
> +QT5WAYLAND_SOURCE = $(call qt5source,qtwayland,$(QT5WAYLAND_VERSION))
>  QT5WAYLAND_DEPENDENCIES = qt5base qt5declarative wayland
>  QT5WAYLAND_INSTALL_STAGING = YES
>  
> diff --git a/package/qt5/qt5webchannel/qt5webchannel.hash b/package/qt5/qt5webchannel/qt5webchannel.hash
> index 188e5ea1f3..f94942f577 100644
> --- a/package/qt5/qt5webchannel/qt5webchannel.hash
> +++ b/package/qt5/qt5webchannel/qt5webchannel.hash
> @@ -1,8 +1,8 @@
>  # Hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qtwebchannel-opensource-src-5.6.3.tar.xz.mirrorlist
>  sha256 8eb1b0ac2286653c7932758c21e7760788a5d7cfd6162da09afa926d5be50713 qtwebchannel-opensource-src-5.6.3.tar.xz
>  
> -# Hash from: https://download.qt.io/official_releases/qt/5.9/5.9.3/submodules/qtwebchannel-opensource-src-5.9.3.tar.xz.mirrorlist
> -sha256 632795b293f1318e9aaa1e124b6a39b1625c8c1e35b0a9f05a02ea0066458358 qtwebchannel-opensource-src-5.9.3.tar.xz
> +# Hash from: https://download.qt.io/official_releases/qt/5.10/5.10.1/submodules/qtwebchannel-everywhere-src-5.10.1.tar.xz.mirrorlist
> +sha256 c22c449fecb052597d12f8dd59498db39767037f9098123f3defc04eb20a3764  qtwebchannel-everywhere-src-5.10.1.tar.xz
>  
>  # Hashes for license files:
>  sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 LICENSE.GPL2
> diff --git a/package/qt5/qt5webchannel/qt5webchannel.mk b/package/qt5/qt5webchannel/qt5webchannel.mk
> index d46e053a53..20a7c6c1db 100644
> --- a/package/qt5/qt5webchannel/qt5webchannel.mk
> +++ b/package/qt5/qt5webchannel/qt5webchannel.mk
> @@ -6,7 +6,7 @@
>  
>  QT5WEBCHANNEL_VERSION = $(QT5_VERSION)
>  QT5WEBCHANNEL_SITE = $(QT5_SITE)
> -QT5WEBCHANNEL_SOURCE = qtwebchannel-opensource-src-$(QT5WEBCHANNEL_VERSION).tar.xz
> +QT5WEBCHANNEL_SOURCE = $(call qt5source,qtwebchannel,$(QT5WEBCHANNEL_VERSION))
>  QT5WEBCHANNEL_DEPENDENCIES = qt5base qt5websockets
>  QT5WEBCHANNEL_INSTALL_STAGING = YES
>  
> diff --git a/package/qt5/qt5webengine/5.9.3/0002-Load-libEGL-and-libGLES2-symbols-implicitly.patch b/package/qt5/qt5webengine/5.9.3/0002-Load-libEGL-and-libGLES2-symbols-implicitly.patch
> deleted file mode 100644
> index b8ef687f99..0000000000
> --- a/package/qt5/qt5webengine/5.9.3/0002-Load-libEGL-and-libGLES2-symbols-implicitly.patch
> +++ /dev/null
> @@ -1,89 +0,0 @@
> -From d4c621f6a6b87f2a86069fa393b9f7c4f9e7b9ad Mon Sep 17 00:00:00 2001
> -From: Viktor Engelmann <viktor.engelmann@qt.io>
> -Date: Fri, 7 Jul 2017 12:56:19 +0200
> -Subject: [PATCH] Load libEGL and libGLES2 symbols implicitly
> -
> -Instead of explicitly loading libraries from hard-coded locations,
> -we now just call dlopen(NULL, RTLD_LAZY). This returns a handle to
> -the host process'es context, which already contains the symbols of
> -both these libraries, because we link against them.
> -It was necessary to bypass LoadLibrary, because that expects a non-NULL
> -file path, so we couldn't pass NULL through that interface.
> -
> -Task-number: QTBUG-57761
> -Change-Id: I29f037dfe542222b5188a33c7727c81a464a87bb
> -Reviewed-by: Allan Sandfeld Jensen <allan.jensen@qt.io>
> -Reviewed-by: Michal Klocek <michal.klocek@qt.io>
> -Upstream-Status: Merged
> -Signed-off-by: Ga?l PORTAY <gael.portay@savoirfairelinux.com>
> ----
> - src/core/surface_factory_qt.cpp | 40 ++++++++--------------------------------
> - 1 file changed, 8 insertions(+), 32 deletions(-)
> -
> -diff --git a/src/core/surface_factory_qt.cpp b/src/core/surface_factory_qt.cpp
> -index 36c05ec5..e8be8480 100644
> ---- a/src/core/surface_factory_qt.cpp
> -+++ b/src/core/surface_factory_qt.cpp
> -@@ -51,51 +51,27 @@
> - #if defined(USE_OZONE)
> - 
> - #include <EGL/egl.h>
> --
> --#ifndef QT_LIBDIR_EGL
> --#define QT_LIBDIR_EGL "/usr/lib"
> --#endif
> --#ifndef QT_LIBDIR_GLES2
> --#define QT_LIBDIR_GLES2 QT_LIBDIR_EGL
> --#endif
> -+#include <dlfcn.h>
> - 
> - namespace QtWebEngineCore {
> - 
> --base::NativeLibrary LoadLibrary(const base::FilePath& filename) {
> --    base::NativeLibraryLoadError error;
> --    base::NativeLibrary library = base::LoadNativeLibrary(filename, &error);
> --    if (!library) {
> --        LOG(ERROR) << "Failed to load " << filename.MaybeAsASCII() << ": " << error.ToString();
> --        return NULL;
> --    }
> --    return library;
> --}
> --
> - bool SurfaceFactoryQt::LoadEGLGLES2Bindings()
> - {
> --    base::FilePath libEGLPath = QtWebEngineCore::toFilePath(QT_LIBDIR_EGL);
> --    libEGLPath = libEGLPath.Append("libEGL.so.1");
> --    base::NativeLibrary eglLibrary = LoadLibrary(libEGLPath);
> --    if (!eglLibrary)
> --        return false;
> --
> --    base::FilePath libGLES2Path = QtWebEngineCore::toFilePath(QT_LIBDIR_GLES2);
> --    libGLES2Path = libGLES2Path.Append("libGLESv2.so.2");
> --    base::NativeLibrary gles2Library = LoadLibrary(libGLES2Path);
> --    if (!gles2Library)
> -+    base::NativeLibrary eglgles2Library = dlopen(NULL, RTLD_LAZY);
> -+    if (!eglgles2Library) {
> -+        LOG(ERROR) << "Failed to open EGL/GLES2 context " << dlerror();
> -         return false;
> -+    }
> - 
> --    gl::GLGetProcAddressProc get_proc_address = reinterpret_cast<gl::GLGetProcAddressProc>(base::GetFunctionPointerFromNativeLibrary(eglLibrary, "eglGetProcAddress"));
> -+    gl::GLGetProcAddressProc get_proc_address = reinterpret_cast<gl::GLGetProcAddressProc>(base::GetFunctionPointerFromNativeLibrary(eglgles2Library, "eglGetProcAddress"));
> -     if (!get_proc_address) {
> -         LOG(ERROR) << "eglGetProcAddress not found.";
> --        base::UnloadNativeLibrary(eglLibrary);
> --        base::UnloadNativeLibrary(gles2Library);
> -+        base::UnloadNativeLibrary(eglgles2Library);
> -         return false;
> -     }
> - ae0db1d8267aa1554e69824f579f17305f3969fa
> -     gl::SetGLGetProcAddressProc(get_proc_address);
> --    gl::AddGLNativeLibrary(eglLibrary);
> --    gl::AddGLNativeLibrary(gles2Library);
> -+    gl::AddGLNativeLibrary(eglgles2Library);
> -     return true;
> - }
> - 
> --- 
> -2.13.2
> -
> diff --git a/package/qt5/qt5webengine/qt5webengine.hash b/package/qt5/qt5webengine/qt5webengine.hash
> index 35acf8da2c..3b54435822 100644
> --- a/package/qt5/qt5webengine/qt5webengine.hash
> +++ b/package/qt5/qt5webengine/qt5webengine.hash
> @@ -1,5 +1,5 @@
>  # Hash from https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qtwebengine-opensource-src-5.6.3.tar.xz.mirrorlist
>  sha256 009d69fb39f6c0e2b0cd89a7e9302cd0ae1872d02c787d3a37f2cacca5ddb7a7 qtwebengine-opensource-src-5.6.3.tar.xz
>  
> -# Hash from: https://download.qt.io/official_releases/qt/5.9/5.9.3/submodules/qtwebengine-opensource-src-5.9.2.tar.xz.mirrorlist
> -sha256 45ae1142fd87271c100f4d7889427738e774e86db5d8f6bcf9ceb99d18571d37 qtwebengine-opensource-src-5.9.3.tar.xz
> +# Hash from: https://download.qt.io/official_releases/qt/5.10/5.10.1/submodules/qtwebengine-everywhere-src-5.10.1.tar.xz.mirrorlist
> +sha256 12644f8d2ba8354a2a533d5a7f3f5139c6ff168c2f51aa3e21b701db6dbc01de  qtwebengine-everywhere-src-5.10.1.tar.xz
> diff --git a/package/qt5/qt5webengine/qt5webengine.mk b/package/qt5/qt5webengine/qt5webengine.mk
> index 96dd401c6c..b9edacec62 100644ae0db1d8267aa1554e69824f579f17305f3969fa
> --- a/package/qt5/qt5webengine/qt5webengine.mk
> +++ b/package/qt5/qt5webengine/qt5webengine.mk
> @@ -6,7 +6,7 @@
>  
>  QT5WEBENGINE_VERSION = $(QT5_VERSION)
>  QT5WEBENGINE_SITE = $(QT5_SITE)
> -QT5WEBENGINE_SOURCE = qtwebengine-opensource-src-$(QT5WEBENGINE_VERSION).tar.xz
> +QT5WEBENGINE_SOURCE = $(call qt5source,qtwebengine,$(QT5WEBENGINE_VERSION))
>  QT5WEBENGINE_DEPENDENCIES = ffmpeg libglib2 libvpx opus webp qt5base \
>  	qt5declarative qt5webchannel host-bison host-flex host-gperf \
>  	host-pkgconf host-python
> diff --git a/package/qt5/qt5webkit-examples/qt5webkit-examples.mk b/package/qt5/qt5webkit-examples/qt5webkit-examples.mk
> index f81e994dc5..22c1d519d6 100644
> --- a/package/qt5/qt5webkit-examples/qt5webkit-examples.mk
> +++ b/package/qt5/qt5webkit-examples/qt5webkit-examples.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -# no 5.9.2 package available, fall back to 5.9.1 version
> +# no 5.10 package available, fall back to 5.9.1 version
>  ifeq ($(BR2_PACKAGE_QT5_VERSION_LATEST),y)
>  QT5WEBKIT_EXAMPLES_VERSION = 5.9.1
>  QT5WEBKIT_EXAMPLES_SITE = http://download.qt.io/official_releases/qt/5.9/5.9.1/submodules
> diff --git a/package/qt5/qt5websockets/qt5websockets.hash b/package/qt5/qt5websockets/qt5websockets.hash
> index e76482bcfe..34cd6e6ce1 100644ae0db1d8267aa1554e69824f579f17305f3969fa
> --- a/package/qt5/qt5websockets/qt5websockets.hash
> +++ b/package/qt5/qt5websockets/qt5websockets.hash
> @@ -1,8 +1,8 @@
>  # Hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qtwebsockets-opensource-src-5.6.3.tar.xz.mirrorlist
>  sha256 a2439045616c89dfe06333734ff4726075c92e01db6e6b6863bc138e39c028eb qtwebsockets-opensource-src-5.6.3.tar.xz
>  
> -# Hash from: https://download.qt.io/official_releases/qt/5.9/5.9.3/submodules/qtwebsockets-opensource-src-5.9.3.tar.xz.mirrorlist
> -sha256 ce069dff5b552bc6039bcf17e211d2c8837757e2194773bb54054105866111de qtwebsockets-opensource-src-5.9.3.tar.xz
> +# Hash from: https://download.qt.io/official_releases/qt/5.10/5.10.1/submodules/qtwebsockets-everywhere-src-5.10.1.tar.xz.mirrorlist
> +sha256 6ecf790955ffe42dce731e10557f4ba625e359e867953d73f7fb453c0bad53ea  qtwebsockets-everywhere-src-5.10.1.tar.xz
>  
>  # Hashes for license files:
>  sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 LICENSE.GPL2
> diff --git a/package/qt5/qt5websockets/qt5websockets.mk b/package/qt5/qt5websockets/qt5websockets.mk
> index 4cb2aed1db..618c835566 100644
> --- a/package/qt5/qt5websockets/qt5websockets.mkae0db1d8267aa1554e69824f579f17305f3969fa
> +++ b/package/qt5/qt5websockets/qt5websockets.mk
> @@ -6,7 +6,7 @@
>  
>  QT5WEBSOCKETS_VERSION = $(QT5_VERSION)
>  QT5WEBSOCKETS_SITE = $(QT5_SITE)
> -QT5WEBSOCKETS_SOURCE = qtwebsockets-opensource-src-$(QT5WEBSOCKETS_VERSION).tar.xz
> +QT5WEBSOCKETS_SOURCE = $(call qt5source,qtwebsockets,$(QT5WEBSOCKETS_VERSION))
>  QT5WEBSOCKETS_DEPENDENCIES = qt5base
>  QT5WEBSOCKETS_INSTALL_STAGING = YES
>  
> diff --git a/package/qt5/qt5x11extras/qt5x11extras.hash b/package/qt5/qt5x11extras/qt5x11extras.hash
> index e835648c52..173e9e6b57 100644
> --- a/package/qt5/qt5x11extras/qt5x11extras.hash
> +++ b/package/qt5/qt5x11extras/qt5x11extras.hash
> @@ -1,8 +1,8 @@
>  # Hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qtx11extras-opensource-src-5.6.3.tar.xz.mirrorlist
>  sha256 1e7a8e96e0629f2b2b78de684b156b357210cf5df6b42f30789423f2cb07677f qtx11extras-opensource-src-5.6.3.tar.xz
>  
> -# Hash from: https://download.qt.io/official_releases/qt/5.9/5.9.3/submodules/qtx11extras-opensource-src-5.9.3.tar.xz.mirrorlist
> -sha256 e4e0bf8cbb629758ab85b72d240d7424642482f602ce414e06deef4e147bf2be qtx11extras-opensource-src-5.9.3.tar.xz
> +# Hash from: https://download.qt.io/official_releases/qt/5.10/5.10.1/submodules/qtx11extras-everywhere-src-5.10.1.tar.xz.mirrorlist
> +sha256 c38a371fd50b2da976ed809230678284f029cefb02d240253dcbb3d575dc97b4  qtx11extras-everywhere-src-5.10.1.tar.xz
>  
>  # Hashes for license files:
>  sha256 edfe70e99be2a7c109d860b19204609e582720b211c50caedac729da372a1253 LICENSE.GPLv2
> diff --git a/package/qt5/qt5x11extras/qt5x11extras.mk b/package/qt5/qt5x11extras/qt5x11extras.mk
> index 0905d5f738..85af6a2da3 100644
> --- a/package/qt5/qt5x11extras/qt5x11extras.mk
> +++ b/package/qt5/qt5x11extras/qt5x11extras.mk
> @@ -6,7 +6,7 @@
>  
>  QT5X11EXTRAS_VERSION = $(QT5_VERSION)
>  QT5X11EXTRAS_SITE = $(QT5_SITE)
> -QT5X11EXTRAS_SOURCE = qtx11extras-opensource-src-$(QT5X11EXTRAS_VERSION).tar.xz
> +QT5X11EXTRAS_SOURCE = $(call qt5source,qtx11extras,$(QT5X11EXTRAS_VERSION))
>  QT5X11EXTRAS_DEPENDENCIES = qt5base
>  QT5X11EXTRAS_INSTALL_STAGING = YES
>  
> diff --git a/package/qt5/qt5xmlpatterns/qt5xmlpatterns.hash b/package/qt5/qt5xmlpatterns/qt5xmlpatterns.hash
> index e7f9d60fdd..8210993782 100644
> --- a/package/qt5/qt5xmlpatterns/qt5xmlpatterns.hash
> +++ b/package/qt5/qt5xmlpatterns/qt5xmlpatterns.hash
> @@ -1,8 +1,8 @@
>  # Hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qtxmlpatterns-opensource-src-5.6.3.tar.xz.mirrorlist
>  sha256 a461ff9f0d7310de9b9904ff9cd34919e958bf4071a6fc7096450b8990ab51f6 qtxmlpatterns-opensource-src-5.6.3.tar.xz
>  
> -# Hash from: https://download.qt.io/official_releases/qt/5.9/5.9.3/submodules/qtxmlpatterns-opensource-src-5.9.3.tar.xz.mirrorlist
> -sha256 cf9c66a612a963382f7b4b51ac8ee5e920bd035b26ecb5c5957f8f3d3286f0ba qtxmlpatterns-opensource-src-5.9.3.tar.xz
> +# Hash from: https://download.qt.io/official_releases/qt/5.10/5.10.1/submodules/qtxmlpatterns-everywhere-src-5.10.1.tar.xz.mirrorlist
> +sha256 3cdef59ce96a796606e5adc5756c63c8607fb29b281fddb38acee3e674d5e9fe  qtxmlpatterns-everywhere-src-5.10.1.tar.xz
>  
>  # Hashes for license files:
>  sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 LICENSE.GPL2
> diff --git a/package/qt5/qt5xmlpatterns/qt5xmlpatterns.mk b/package/qt5/qt5xmlpatterns/qt5xmlpatterns.mk
> index 65fd9bd345..e670bf51b1 100644
> --- a/package/qt5/qt5xmlpatterns/qt5xmlpatterns.mk
> +++ b/package/qt5/qt5xmlpatterns/qt5xmlpatterns.mk
> @@ -6,7 +6,7 @@
>  
>  QT5XMLPATTERNS_VERSION = $(QT5_VERSION)
>  QT5XMLPATTERNS_SITE = $(QT5_SITE)
> -QT5XMLPATTERNS_SOURCE = qtxmlpatterns-opensource-src-$(QT5XMLPATTERNS_VERSION).tar.xz
> +QT5XMLPATTERNS_SOURCE = $(call qt5source,qtxmlpatterns,$(QT5XMLPATTERNS_VERSION))
>  QT5XMLPATTERNS_DEPENDENCIES = qt5base
>  QT5XMLPATTERNS_INSTALL_STAGING = YES
>  
