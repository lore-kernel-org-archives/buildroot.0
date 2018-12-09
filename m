From: Peter Seiderer <ps.report@gmx.net>
Date: Sun, 9 Dec 2018 23:17:07 +0100
Subject: [Buildroot] raspberrypi3_qt5we_defconfig fails to build
 qt5webengine
In-Reply-To: <20181209165328.1d320e03@windsurf>
References: <20181209165328.1d320e03@windsurf>
Message-ID: <20181209231707.103f56f9@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

On Sun, 9 Dec 2018 16:53:28 +0100, Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:

> Hello Peter and Ga?l,
> 
> According to
> https://gitlab.com/buildroot.org/buildroot/-/jobs/131217091, the
> raspberrypi3_qt5we_defconfig fails to build qt5webengine:
> 
> [...]
> Qt WebEngine on Linux requires clang or GCC.
> QtWebEngine will not be built.
> [...]
> >>> qt5webengine 5.11.2 Installing to target  
> cp -dpf /builds/buildroot.org/buildroot/output/host/arm-buildroot-linux-gnueabihf/sysroot/usr/lib/libQt5WebEngine*.so.* /builds/buildroot.org/buildroot/output/target/usr/lib
> cp: cannot stat '/builds/buildroot.org/buildroot/output/host/arm-buildroot-linux-gnueabihf/sysroot/usr/lib/libQt5WebEngine*.so.*': No such file or directory
> package/pkg-generic.mk:315: recipe for target '/builds/buildroot.org/buildroot/output/build/qt5webengine-5.11.2/.stamp_target_installed' failed
> 
> Do you have any idea?

Quick fix by:

diff --git a/package/qt5/qt5base/qmake.conf.in b/package/qt5/qt5base/qmake.conf.in
index f14527aa7f..150f84e45d 100644
--- a/package/qt5/qt5base/qmake.conf.in
+++ b/package/qt5/qt5base/qmake.conf.in
@@ -9,6 +9,7 @@
 include(../common/linux_device_pre.conf)
 
 # modifications to g++-unix.conf
+QMAKE_COMPILER          = gcc
 QMAKE_CC                = $${CROSS_COMPILE}gcc
 QMAKE_CXX               = $${CROSS_COMPILE}g++


But QMAKE_COMPILER should already be set in mkspecs/common/g++-base.conf, but
is changed by buildroot package/qt5/qt5base/qt5base.mk from 'gcc' to
'/usr/bin/gcc' by

  # This allows to use ccache when available
  define QT5BASE_CONFIGURE_HOSTCC
          $(SED) 's,^QMAKE_COMPILER\s*=.*,QMAKE_COMPILER = $(HOSTCC),' $(@D)/mkspecs/common/g++-base.conf
          $(SED) 's,^QMAKE_CC\s*=.*,QMAKE_CC = $(HOSTCC),' $(@D)/mkspecs/common/g++-base.conf
          $(SED) 's,^QMAKE_CXX\s*=.*,QMAKE_CXX = $(HOSTCXX),' $(@D)/mkspecs/common/g++-base.conf
  endef

The rigth fix should be removing the first sed line, QMAKE_COMPILER is the
compiler flavour and not a compiler path (see e.g. [1])...

Will send a proper patch (after some testing) soon...

Regards,
Peter

[1] http://code.qt.io/cgit/qt/qtbase.git/commit/?id=fff5a8f9c987e5e285b2665c4d0a1c5bbe3e6276

> 
> Best regards,
> 
> Thomas
