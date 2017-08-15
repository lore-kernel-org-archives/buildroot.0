From: Julien Grossholtz <julien.grossholtz@savoirfairelinux.com>
Date: Tue, 15 Aug 2017 18:10:37 -0400 (EDT)
Subject: [Buildroot] [PATCH v8 0/3] Qt WebEngine support
In-Reply-To: <20170815203854.14456-1-gael.portay@savoirfairelinux.com>
References: <20170815203854.14456-1-gael.portay@savoirfairelinux.com>
Message-ID: <488835700.260243.1502835037832.JavaMail.zimbra@savoirfairelinux.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I will test these patchs on a Beaglebone black.

Julien


----- Original Message -----
> From: "Ga?l Portay" <gael.portay@savoirfairelinux.com>
> To: "buildroot @ busybox . net" <buildroot@busybox.net>, "Thomas Petazzoni" <thomas.petazzoni@free-electrons.com>,
> "Peter Seiderer" <ps.report@gmx.net>, "Arnout Vandecappelle" <arnout@mind.be>, "Julien CORJON" <corjon.j@ecagroup.com>
> Cc: "Joshua Henderson" <joshua.henderson@microchip.com>, "Jean-Daniel Michaud" <jean.daniel.michaud@gmail.com>, "brents
> 3" <brents_3@hotmail.com>, "Ga?l Portay" <gael.portay@savoirfairelinux.com>, "gomis" <tuzaklirefik@gmail.com>, "Akihiko
> Odaki" <akihiko.odaki.4i@stu.hosei.ac.jp>
> Sent: Tuesday, August 15, 2017 4:38:52 PM
> Subject: [Buildroot] [PATCH v8 0/3] Qt WebEngine support

> Hi all,
> 
> The purpose of this patch series is to continue the integration of Qt5 WebEngine
> in buildroot; started long time ago by Akihiko Odaki [1] and Julien Corjon [2].
> 
> The first patch provides the Qt WebEngine package.
> 
> The second patch is a special defconfig that provides a Qt WebEngine setup on
> raspberrypi3 to provide a demo.
> 
> I have tested it with a rpi 3; and I will be glad if someone else has another
> EGL platform to test it. You will find instructions to try qtwebengine on rpi3
> in the commit message of the first patch.
> 
> Enjoy ;)
> 
> Note: Tested against:
>        - GCC 6.x and binutils 2.27 on rpi 3.
>        - GCC 7.x and binutils 2.28 on rpi 3.
> 
> [1] https://patchwork.ozlabs.org/patch/640633/
> [2] http://lists.busybox.net/pipermail/buildroot/2015-July/132010.html
> 
> Changes since RFC:
> - rebase to master (use SPDX licenses, remove license approved, update
>   qt5_defconfig...)
> - remove the patch "prefer arm tune"
> - disable build with Qt 5.6 LTS (not working, waiting for 5.6.3 in August)
> - re-order patches
> 
> Changes since v1:
> - manually create symlinks to preserve SONAME
> - add my signed-off-by to the qt webengine patch
> - make qtwe package depends on supported architectures
> - fix Kconfig comment about Qt 5.6
> - sort alphabetically chromium licenses
> 
> Changes since v2:
> - fix build issue when I sorted alphabetically the chromium licenses
> - replace legacy option BR2_TARGET_ROOTFS_EXT2_BLOCK to
>   new option BR2_TARGET_ROOTFS_EXT2_SIZE
> 
> Changes since v3:
> - add my signed-off-by and the PR link to the rpi-userland patch
> - move rpi patch index from 0001 to 0007
> 
> Changes since v4:
> - bump to Qt WebEngine to 5.9.1
> - added the mainlined patch that fixes the build issue with samples when print
>   is not supported
> - udev is selected (required by chromium)
> - add config entry to use system ffmpeg and set it to yes by default
> - the patch concerning the path to CA certificates has been removed since it is
>   no more relevant in 5.9.x
> - increase BR2_TARGET_ROOTFS_EXT2_SIZE to 360MB to support
>   $ du -sk target/
>   312480	target/
> 
> Changes since v5:
> - really add the mainlined patch that fixes the build issue with samples when
>   print is not supported
> - add BR2_PACKAGE_QT5WEBENGINE_ARCH_SUPPORTS to list all supported
>   architectures
> - add BR2_PACKAGE_QT5WEBENGINE missing dependencies (tc, mmu, wchar...)
> - stop using && for depends on relationships
> - update chromium licence list in chromium.inc
> - remove option BR2_PACKAGE_QT5WEBENGINE_SYSTEM_FFMPEG;
>   and compile ffmpeg, opus, libvpx and webp packages
> - reword help and add url to documentation of package qt5webengine
> - remove hash of 5.6.2 version
> - add QT5WEBENGINE_ namespace to QMAKEFLAGS
> - add missing TARGET_MAKE_ENV to BUILD_CMD
> - create python symlink form $(HOST_DIR)/bin (was $(HOST_DIR)/usr/bin)
> - add myself to DEVELOPERS
> 
> Changes since v6:
> - rpi-userland commit message:
>   fix output of ls -l snippet
>   update url to link to qtwe-5.9.1
>   add upstream-status
> - qtwe:
>   add missing host-bison, host-flex and host-pkgconf dependencies
>   select BR2_HOSTARCH_NEEDS_IA32_COMPILER to let v8 compiles its host-tools
>   with the same word-size as the target.
> 
> Changes since v7:
> - rpi-userland:
>   remove rpi-userland patch and apply upstreamed commit suggested by Yann.
> - qtwe:
>   reword the commit message to include notes from the coverletter
>   depends on has udev + comment (udev is needed at runtime)
>   depends on uses glibc + comment (for now, it builds only with glibc)
>   select qtquickcontrols2 (may be needed at runtime)
>   reword BR2_HOSTARCH_NEEDS_IA32_COMPILER comment
> - raspberrypi3_qt5we_defconfig:
>   rename raspberrypi3_qt5_defconfig into raspberrypi3_qt5we_defconfig
>   bump kernel (synced with all rpi defconfigs)
>   add gif, jpeg and options to raspberrypi3_qt5we_defconfig
>   use M suffix with BR2_TARGET_ROOTFS_EXT2_SIZE option
> 
> Ga?l PORTAY (3):
>  qt5webengine: new package
>  configs: new raspberrypi3 qt5we config
> 
> DEVELOPERS                                         |   1 +
> configs/raspberrypi3_qt5we_defconfig               |  50 ++++
> package/qt5/Config.in                              |   1 +
> .../0001-Always-compile-QWebEnginePage-print.patch | 246 ++++++++++++++++
> ...ad-libEGL-and-libGLES2-symbols-implicitly.patch |  89 ++++++
> package/qt5/qt5webengine/Config.in                 |  86 ++++++
> package/qt5/qt5webengine/chromium.inc              | 310 +++++++++++++++++++++
> package/qt5/qt5webengine/qt5webengine.hash         |   2 +
> package/qt5/qt5webengine/qt5webengine.mk           |  80 ++++++
> 9 files changed, 865 insertions(+)
> create mode 100644 configs/raspberrypi3_qt5we_defconfig
> create mode 100644
> package/qt5/qt5webengine/5.9.1/0001-Always-compile-QWebEnginePage-print.patch
> create mode 100644
> package/qt5/qt5webengine/5.9.1/0002-Load-libEGL-and-libGLES2-symbols-implicitly.patch
> create mode 100644 package/qt5/qt5webengine/Config.in
> create mode 100644 package/qt5/qt5webengine/chromium.inc
> create mode 100644 package/qt5/qt5webengine/qt5webengine.hash
> create mode 100644 package/qt5/qt5webengine/qt5webengine.mk
> 
> --
> 2.13.2
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
