From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed,  2 Sep 2015 00:01:01 +0200
Subject: [Buildroot] [PATCHv3 00/15] DirectFB stack bump
Message-ID: <1441144876-2628-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Here is the third version of the DirectFB bump. The previous version
was submitted in February by Peter Seiderer, so it's time to move
forward on this topic. There are too many changes compared to Peter's
version to really list all of them, it's better to think of this
series almost as a new one: it combines changes from Peter with
changes I had also prepared on my side.

The patch series bumps DirectFB, DirectFB-examples and linux-fusion,
but also does a number of related cleanups (remove unused/useless
options, simplify the DirectFB-examples package, remove no longer
useful packages, etc.).

I did quite a bit of build testing: I built 10 different Buildroot
configurations, to test each of the 10 direct reverse dependencies of
DirectFB:

 - Cairo
 - EFL (libevas and libecore)
 - GStreamer 0.10 DirectFB bad plugin
 - Gstreamer 1.x DirectFB bad plugin
 - Links with DirectFB support
 - Lite
 - Qt4 with DirectFB backend (required a patch)
 - Qt5 with DirectFB backend
 - SDL with DirectFB backend
 - VLC with DirectFB backend

All of them built successfully.

Thanks,

Thomas

Peter Seiderer (3):
  qt: fix directfb-1.7.7 compiler errors
  directfb: do not use inexistant configure options
  directfb: add new TIFF option

Thomas Petazzoni (12):
  directfb: bump to 1.7.7
  directfb: mark as available only for gcc >= 4.5
  directfb: remove broken X.org support
  directfb: remove BR2_PACKAGE_DIRECTFB_UNIQUE option
  directfb: add options for divine and sawman
  divine: remove package
  sawman: remove package
  linux-fusion: bump to 9.0.3, use .tar.xz
  linux-fusion: use a more traditional style to define
    LINUX_FUSION_MAKE_OPTS
  directfb-examples: remove options for each example
  directfb-examples: do not install to staging
  directfb-examples: bump to 1.7.0

 Config.in.legacy                                   | 232 +++++++++++++++++++++
 package/Config.in                                  |   2 -
 package/directfb-examples/Config.in                | 151 --------------
 package/directfb-examples/directfb-examples.hash   |   4 +-
 package/directfb-examples/directfb-examples.mk     |  96 +--------
 .../0003-remove-redefinition-of-__typeof__.patch   |  28 ---
 ...region-lock.patch => 0003-setregion-lock.patch} |  39 ++--
 ...-use-gcc-link.patch => 0004-use-gcc-link.patch} |   0
 .../directfb/0005-add-missing-idivine-header.patch |  65 ++++++
 package/directfb/Config.in                         |  23 +-
 package/directfb/directfb.hash                     |   4 +-
 package/directfb/directfb.mk                       |  32 +--
 package/divine/Config.in                           |   8 -
 package/divine/divine.mk                           |  19 --
 package/gstreamer/gst-plugins-bad/Config.in        |   4 +
 package/gstreamer1/gst1-plugins-bad/Config.in      |   4 +
 package/linux-fusion/linux-fusion.hash             |   4 +-
 package/linux-fusion/linux-fusion.mk               |  19 +-
 ...ion-constructor-error-for-legacy-c-compil.patch | 163 +++++++++++++++
 package/qt5/qt5base/Config.in                      |   4 +
 .../sawman/0001-link-using-gcc-instead-of-ld.patch |  19 --
 package/sawman/Config.in                           |  11 -
 package/sawman/sawman.mk                           |  16 --
 23 files changed, 547 insertions(+), 400 deletions(-)
 delete mode 100644 package/directfb/0003-remove-redefinition-of-__typeof__.patch
 rename package/directfb/{0004-setregion-lock.patch => 0003-setregion-lock.patch} (79%)
 rename package/directfb/{0005-use-gcc-link.patch => 0004-use-gcc-link.patch} (100%)
 create mode 100644 package/directfb/0005-add-missing-idivine-header.patch
 delete mode 100644 package/divine/Config.in
 delete mode 100644 package/divine/divine.mk
 create mode 100644 package/qt/0008-Fix-conversion-constructor-error-for-legacy-c-compil.patch
 delete mode 100644 package/sawman/0001-link-using-gcc-instead-of-ld.patch
 delete mode 100644 package/sawman/Config.in
 delete mode 100644 package/sawman/sawman.mk

-- 
2.5.1
