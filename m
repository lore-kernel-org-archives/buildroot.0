From: Julien CORJON <corjon.j@ecagroup.com>
Date: Thu, 10 Nov 2016 09:22:05 +0000
Subject: [Buildroot] [PATCH 1/5] qt5: bump to 5.8.0-beta
In-Reply-To: <1478601048-21388-2-git-send-email-anaumann@ultratronik.de>
References: <1478601048-21388-1-git-send-email-anaumann@ultratronik.de>
 <1478601048-21388-2-git-send-email-anaumann@ultratronik.de>
Message-ID: <37e1e097-613b-4627-ae6a-0538794a5728@MAIL-SINTERS-01.sinters-int.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Andreas,

Also, super-quick review...

Le 08/11/2016 ? 11:30, Andreas Naumann a ?crit :
> Removed all hashes (until final release).

As Arnout said, please do this in a first commit

> - qt5base: renamed library to EglFSDeviceIntegration ([1])
> - qt5base: remove ras-pi patch

> - qt5base: remove obsolete config-option -large ([2])
> - qt5base: make the directfb platform plugin compile ([3])
> - qt53d/quickcontrols2/serialbus: move out of tech-preview

Please keep the names qt5* : qt53d/qt5quickcontrol2/qt5serialbus

> - qt5enginio: remove discontinued module

Qt5Engino is still kept in the repository (as Qt5Webkit) : 
http://download.qt.io/snapshots/qt/5.8/5.8.0-beta/latest_src/submodules/qtenginio-opensource-src-1.6.2.tar.xz

> diff --git a/package/qt5/Config.in b/package/qt5/Config.in
> index 234dfdd..a4dc481 100644
> --- a/package/qt5/Config.in
> +++ b/package/qt5/Config.in

Qt5 need C++11 support since 5.7, you should have
depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 in the menuconfig and 
!BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 in comment section.

See https://wiki.qt.io/New_Features_in_Qt_5.7

> @@ -31,16 +31,18 @@ menuconfig BR2_PACKAGE_QT5
>
>  if BR2_PACKAGE_QT5
>  source "package/qt5/qt5base/Config.in"
> +source "package/qt5/qt53d/Config.in"
>  source "package/qt5/qt5canvas3d/Config.in"
>  source "package/qt5/qt5connectivity/Config.in"
>  source "package/qt5/qt5declarative/Config.in"
> -source "package/qt5/qt5enginio/Config.in"

Please move qt5enginio in legacy compatibility section

>  source "package/qt5/qt5graphicaleffects/Config.in"
>  source "package/qt5/qt5imageformats/Config.in"
>  source "package/qt5/qt5location/Config.in"
>  source "package/qt5/qt5multimedia/Config.in"
>  source "package/qt5/qt5quickcontrols/Config.in"
> +source "package/qt5/qt5quickcontrols2/Config.in"
>  source "package/qt5/qt5sensors/Config.in"
> +source "package/qt5/qt5serialbus/Config.in"
>  source "package/qt5/qt5serialport/Config.in"
>  source "package/qt5/qt5svg/Config.in"
>  source "package/qt5/qt5tools/Config.in"
> @@ -49,9 +51,6 @@ source "package/qt5/qt5websockets/Config.in"
>  source "package/qt5/qt5x11extras/Config.in"
>  source "package/qt5/qt5xmlpatterns/Config.in"
>  comment "technology preview"
> -source "package/qt5/qt53d/Config.in"
> -source "package/qt5/qt5quickcontrols2/Config.in"
> -source "package/qt5/qt5serialbus/Config.in"
>  comment "legacy compatibility"
>  source "package/qt5/qt5script/Config.in"
>  source "package/qt5/qt5webkit/Config.in"

> diff --git a/package/qt5/qt5base/0001-directfb-make-platform-plugin-compile.patch b/package/qt5/qt5base/0001-directfb-make-platform-plugin-compile.patch

Sames comment as Arnout. Also, please include the link of bug report in 
the commit message.

> diff --git a/package/qt5/qt5base/0006-eglfs-rasp-pi-header-inclusion.patch b/package/qt5/qt5base/0006-eglfs-rasp-pi-header-inclusion.patch
> deleted file mode 100644
> index f1f6d9b..0000000
> --- a/package/qt5/qt5base/0006-eglfs-rasp-pi-header-inclusion.patch
> +++ /dev/null
> @@ -1,45 +0,0 @@
> -From 91c3b111e45dd476aba057836b1b618eacf90f3f Mon Sep 17 00:00:00 2001
> -From: Julien Corjon <corjon.j@ecagroup.com>
> -Date: Tue, 21 Jul 2015 09:58:14 +0200
> -Subject: [PATCH] eglfs - fix rasp-pi header inclusion
> -
> -eglplateform.h include headers for low level instruction and fail on brcm
> -headers inclusion
> -  For the brcm presence test we use egl pkg-config file
> -  For the eglfs-plugin compilation we use the egl configuration
> -
> -Upstream-Status: https://bugreports.qt.io/browse/QTBUG-47339
> -Signed-off-by: Julien Corjon <corjon.j@ecagroup.com>

You're right, commit c0cc5052097c723d0331a7619d686af9eb93d33c in qt5base 
fix this bug. Please add this in comment.

At the end Qt5.7 drop LGPLv2.1. There is probably some adjustement in 
all mk files. See : http://blog.qt.io/blog/2016/06/16/qt-5-7-released/

Regards,

Julien
