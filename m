From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 2 Feb 2017 23:01:54 +0100
Subject: [Buildroot] [PATCH v6 1/9] qt5: add choice between version
 5.6.2 and 5.8.0
In-Reply-To: <1485849551-20469-2-git-send-email-mr.zoltan.gyarmati@gmail.com>
References: <1485849551-20469-1-git-send-email-mr.zoltan.gyarmati@gmail.com>
 <1485849551-20469-2-git-send-email-mr.zoltan.gyarmati@gmail.com>
Message-ID: <47c54695-a165-9198-d45c-098628014394@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Zoltan, Andreas,

 Pretty incomplete review, but it will get you a little further :-)

On 31-01-17 08:59, Zoltan Gyarmati wrote:
> From: Naumann Andreas <ANaumann@ultratronik.de>
> 
> For 5.8.0
> - add hashes
> - qt5 need C++11 compliant compiler since 5.7 ([1])
> - use different licenses: since version 5.7 Qt removed the LGPL v2.1 option in favor
>   of v3 with a different exception
> - qt5base: renamed library to EglFSDeviceIntegration ([2])
> - qt5base: remove ras-pi patch, commit c0cc5052097c723d0331a7619d686af9eb93d33c fix it ([3])
> - qt5base: remove 0007-eglfs-fix-eglfs_mali-compile-for-odroid-mali.patch (upstream committed [3b])
> - qt5base: remove obsolete config-option -large ([4])
> - qt5base: remove gstreamer related config-option ([5])

 Maybe explicitly add here "GStreamer support is fully moved to qt5multimedia".

> 
> For 5.6.2
> - moved patches to subdir
> 
> [1]  http://blog.qt.io/blog/2016/06/16/qt-5-7-released/
> [2]  https://code.qt.io/cgit/qt/qtbase.git/commit/?id=ec4eb4db61094179bc6a9ec26ec68fb710177053
> [3]  https://codereview.qt-project.org/#/c/167172/
> [3b] https://code.qt.io/cgit/qt/qtbase.git/commit/?id=f1b4bd4790860e1ff5afcec111a359bc3a91cfda
> [4]  https://code.qt.io/cgit/qt/qtbase.git/commit/?id=84d3a21c9efe7efb2cce6d3bd14af1f9580b1108
> [5]  https://code.qt.io/cgit/qt/qtbase.git/commit/?id=7d4da559afb62a779b3d90a65fb679cb5433f203
> 
> Signed-off-by: Andreas Naumann <anaumann@ultratronik.de>
> Signed-off-by: Julien Corjon <corjon.j@ecagroup.com>
> Signed-off-by: Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>
> ---
>  package/qt5/Config.in                              | 18 +++++++-
>  package/qt5/qt5.mk                                 |  8 ++++
>  package/qt5/qt53d/qt53d.hash                       |  3 ++
>  .../0006-eglfs-rasp-pi-header-inclusion.patch      | 45 ------------------
>  ...fs-fix-eglfs_mali-compile-for-odroid-mali.patch | 53 ----------------------
>  .../0006-eglfs-rasp-pi-header-inclusion.patch      | 45 ++++++++++++++++++
>  ...fs-fix-eglfs_mali-compile-for-odroid-mali.patch | 53 ++++++++++++++++++++++
>  package/qt5/qt5base/qt5base.hash                   |  3 ++
>  package/qt5/qt5base/qt5base.mk                     | 13 ++++++
>  package/qt5/qt5canvas3d/qt5canvas3d.hash           |  3 ++
>  package/qt5/qt5connectivity/qt5connectivity.hash   |  3 ++
>  package/qt5/qt5connectivity/qt5connectivity.mk     |  5 ++
>  package/qt5/qt5declarative/qt5declarative.hash     |  3 ++
>  package/qt5/qt5declarative/qt5declarative.mk       |  5 ++
>  .../qt5graphicaleffects/qt5graphicaleffects.hash   |  3 ++
>  .../qt5/qt5graphicaleffects/qt5graphicaleffects.mk |  5 ++
>  package/qt5/qt5imageformats/qt5imageformats.hash   |  3 ++
>  package/qt5/qt5imageformats/qt5imageformats.mk     |  5 ++
>  package/qt5/qt5location/qt5location.hash           |  3 ++
>  package/qt5/qt5location/qt5location.mk             |  5 ++
>  package/qt5/qt5multimedia/qt5multimedia.hash       |  3 ++
>  package/qt5/qt5multimedia/qt5multimedia.mk         |  5 ++
>  package/qt5/qt5quickcontrols/qt5quickcontrols.hash |  3 ++
>  .../qt5/qt5quickcontrols2/qt5quickcontrols2.hash   |  3 ++
>  package/qt5/qt5script/qt5script.hash               |  3 ++
>  package/qt5/qt5sensors/qt5sensors.hash             |  3 ++
>  package/qt5/qt5sensors/qt5sensors.mk               |  5 ++
>  package/qt5/qt5serialbus/qt5serialbus.hash         |  3 ++
>  package/qt5/qt5serialport/qt5serialport.hash       |  3 ++
>  package/qt5/qt5serialport/qt5serialport.mk         |  5 ++
>  package/qt5/qt5svg/qt5svg.hash                     |  3 ++
>  package/qt5/qt5svg/qt5svg.mk                       |  5 ++
>  package/qt5/qt5tools/qt5tools.hash                 |  3 ++
>  package/qt5/qt5tools/qt5tools.mk                   |  5 ++
>  package/qt5/qt5webchannel/qt5webchannel.hash       |  3 ++
>  package/qt5/qt5webchannel/qt5webchannel.mk         |  5 ++
>  package/qt5/qt5webkit/qt5webkit.hash               |  3 ++
>  package/qt5/qt5websockets/qt5websockets.hash       |  3 ++
>  package/qt5/qt5websockets/qt5websockets.mk         |  5 ++
>  package/qt5/qt5x11extras/qt5x11extras.hash         |  3 ++
>  package/qt5/qt5x11extras/qt5x11extras.mk           |  5 ++
>  package/qt5/qt5xmlpatterns/qt5xmlpatterns.hash     |  3 ++
>  package/qt5/qt5xmlpatterns/qt5xmlpatterns.mk       |  5 ++
>  43 files changed, 271 insertions(+), 100 deletions(-)
>  delete mode 100644 package/qt5/qt5base/0006-eglfs-rasp-pi-header-inclusion.patch
>  delete mode 100644 package/qt5/qt5base/0007-eglfs-fix-eglfs_mali-compile-for-odroid-mali.patch
>  create mode 100644 package/qt5/qt5base/5.6.2/0006-eglfs-rasp-pi-header-inclusion.patch
>  create mode 100644 package/qt5/qt5base/5.6.2/0007-eglfs-fix-eglfs_mali-compile-for-odroid-mali.patch

 Please generate patches with the -M option, so git detects this as a rename
rather than a delete/create.

> 
> diff --git a/package/qt5/Config.in b/package/qt5/Config.in
> index 234dfdd..eb97fba 100644
> --- a/package/qt5/Config.in
> +++ b/package/qt5/Config.in
> @@ -11,15 +11,16 @@ config BR2_PACKAGE_QT5_JSCORE_AVAILABLE
>  	depends on !BR2_ARM_CPU_ARMV4
>  	default y
>  
> -comment "Qt5 needs a toolchain w/ wchar, NPTL, C++, dynamic library"
> +comment "Qt5 needs a toolchain w/ wchar, NPTL, C++11, dynamic library"
>  	depends on !BR2_PACKAGE_QT
> -	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS_NPTL || BR2_STATIC_LIBS
> +	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS_NPTL || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 || BR2_STATIC_LIBS

 The new dependencies are only for v5.8, not for v5.6. So they shouldn't be
changed here...

>  
>  menuconfig BR2_PACKAGE_QT5
>  	bool "Qt5"
>  	depends on BR2_INSTALL_LIBSTDCPP
>  	depends on BR2_USE_WCHAR
>  	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
> +	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8

 ... and here. Instead, the dependency should be added ...

>  	depends on !BR2_STATIC_LIBS
>  	depends on !BR2_PACKAGE_QT
>  	select BR2_PACKAGE_QT5BASE
> @@ -30,6 +31,19 @@ menuconfig BR2_PACKAGE_QT5
>  	  http://qt.io
>  
>  if BR2_PACKAGE_QT5
> +
> +choice
> +	prompt "Qt5 version"
> +	default BR2_QT5_VERSION_5_8
> +
> +config BR2_QT5_VERSION_5_8
> +	bool "5.8"

 ... here.

 Also, I think it makes sense to add a brief help text explaining that 5.8 is
(L)GPLv3+ while 5.6 is (L)GPLv2+. That was the reason to offer both versions, right?

 Also, I think this symbol should be named BR2_QT5_VERSION_LATEST. The idea is
that we will keep only two versions: a frozen 5.6 and 5.8 that will evolve into
5.9 etc. We don't want to add legacy symbols every time the version is bumped...

> +
> +config BR2_QT5_VERSION_5_6
> +	bool "5.6"
> +
> +endchoice
> +
>  source "package/qt5/qt5base/Config.in"
>  source "package/qt5/qt5canvas3d/Config.in"
>  source "package/qt5/qt5connectivity/Config.in"
[snip]
> diff --git a/package/qt5/qt5base/qt5base.mk b/package/qt5/qt5base/qt5base.mk
> index bbbaf0f..c09bf58 100644
> --- a/package/qt5/qt5base/qt5base.mk
> +++ b/package/qt5/qt5base/qt5base.mk
> @@ -41,12 +41,19 @@ else
>  QT5BASE_CONFIGURE_OPTS += -release
>  endif
>  
> +ifeq ($(BR2_QT5_VERSION_5_6),y)
>  QT5BASE_CONFIGURE_OPTS += -largefile
> +endif
>  
>  ifeq ($(BR2_PACKAGE_QT5BASE_LICENSE_APPROVED),y)
>  QT5BASE_CONFIGURE_OPTS += -opensource -confirm-license
> +ifeq ($(BR2_QT5_VERSION_5_8),y)

 I'd prefer to invert this condition, i.e. check for VERSION_5_6 all the time.
Makes it easier to read the code IMHO.

> +QT5BASE_LICENSE = GPLv2+ or LGPLv3, GPLv3 with exception(tools), GFDLv1.3 (docs)
> +QT5BASE_LICENSE_FILES = LICENSE.GPL2 LICENSE.GPLv3 LICENSE.GPL3-EXCEPT LICENSE.LGPLv3 LICENSE.FDL
> +else
>  QT5BASE_LICENSE = GPLv3 or LGPLv2.1 with exception or LGPLv3, GFDLv1.3 (docs)
>  QT5BASE_LICENSE_FILES = LICENSE.GPLv3 LICENSE.LGPLv21 LGPL_EXCEPTION.txt LICENSE.LGPLv3 LICENSE.FDL
> +endif
>  ifeq ($(BR2_PACKAGE_QT5BASE_EXAMPLES),y)
>  QT5BASE_LICENSE := $(QT5BASE_LICENSE), BSD-3c (examples)
>  QT5BASE_LICENSE_FILES += header.BSD
> @@ -158,12 +165,14 @@ QT5BASE_DEPENDENCIES   += $(if $(BR2_PACKAGE_QT5BASE_ICU),icu)
>  QT5BASE_CONFIGURE_OPTS += $(if $(BR2_PACKAGE_QT5BASE_EXAMPLES),-make,-nomake) examples
>  
>  # gstreamer 0.10 support is broken in qt5multimedia

 The comment should be inside the version condition, otherwise it looks like it
relates to the version.

> +ifeq ($(BR2_QT5_VERSION_5_6),y)
>  ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BASE),y)
>  QT5BASE_CONFIGURE_OPTS += -gstreamer 1.0
>  QT5BASE_DEPENDENCIES   += gst1-plugins-base
>  else
>  QT5BASE_CONFIGURE_OPTS += -no-gstreamer
>  endif
> +endif
>  
>  ifeq ($(BR2_PACKAGE_LIBINPUT),y)
>  QT5BASE_CONFIGURE_OPTS += -libinput
> @@ -181,7 +190,11 @@ QT5BASE_INSTALL_LIBS_$(BR2_PACKAGE_QT5BASE_SQL)        += Qt5Sql
>  QT5BASE_INSTALL_LIBS_$(BR2_PACKAGE_QT5BASE_TEST)       += Qt5Test
>  QT5BASE_INSTALL_LIBS_$(BR2_PACKAGE_QT5BASE_XML)        += Qt5Xml
>  QT5BASE_INSTALL_LIBS_$(BR2_PACKAGE_QT5BASE_OPENGL_LIB) += Qt5OpenGL
> +ifeq ($(BR2_QT5_VERSION_5_8),y)
> +QT5BASE_INSTALL_LIBS_$(BR2_PACKAGE_QT5BASE_EGLFS)      += Qt5EglFSDeviceIntegration
> +else
>  QT5BASE_INSTALL_LIBS_$(BR2_PACKAGE_QT5BASE_EGLFS)      += Qt5EglDeviceIntegration
> +endif
>  
>  QT5BASE_INSTALL_LIBS_$(BR2_PACKAGE_QT5BASE_GUI)          += Qt5Gui
>  QT5BASE_INSTALL_LIBS_$(BR2_PACKAGE_QT5BASE_WIDGETS)      += Qt5Widgets
[snip]
> diff --git a/package/qt5/qt5connectivity/qt5connectivity.mk b/package/qt5/qt5connectivity/qt5connectivity.mk
> index c0a4d40..b005a6f 100644
> --- a/package/qt5/qt5connectivity/qt5connectivity.mk
> +++ b/package/qt5/qt5connectivity/qt5connectivity.mk
> @@ -11,8 +11,13 @@ QT5CONNECTIVITY_DEPENDENCIES = qt5base
>  QT5CONNECTIVITY_INSTALL_STAGING = YES
>  
>  ifeq ($(BR2_PACKAGE_QT5BASE_LICENSE_APPROVED),y)
> +ifeq ($(BR2_QT5_VERSION_5_8),y)

 Same here, I prefer a condition of 5_6. And in all other files of course.


 Regards,
 Arnout

> +QT5CONNECTIVITY_LICENSE = GPLv2+ or LGPLv3, GPLv3 with exception(tools), GFDLv1.3 (docs)
> +QT5CONNECTIVITY_LICENSE_FILES = LICENSE.GPLv2 LICENSE.GPLv3 LICENSE.GPL3-EXCEPT LICENSE.LGPLv3 LICENSE.FDL
> +else
>  QT5CONNECTIVITY_LICENSE = GPLv2 or GPLv3 or LGPLv2.1 with exception or LGPLv3, GFDLv1.3 (docs)
>  QT5CONNECTIVITY_LICENSE_FILES = LICENSE.GPLv2 LICENSE.GPLv3 LICENSE.LGPLv21 LGPL_EXCEPTION.txt LICENSE.LGPLv3 LICENSE.FDL
> +endif
>  ifeq ($(BR2_PACKAGE_QT5BASE_EXAMPLES),y)
>  QT5CONNECTIVITY_LICENSE := $(QT5CONNECTIVITY_LICENSE), BSD-3c (examples)
>  endif
[snip]

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
