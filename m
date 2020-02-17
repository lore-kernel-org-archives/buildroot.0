From: Andreas Naumann <anaumann@ultratronik.de>
Date: Mon, 17 Feb 2020 22:23:22 +0100
Subject: [Buildroot] [PATCH v6 00/28] Qt5 qmake infra and per-package
 compatibility
Message-ID: <20200217212350.29750-1-anaumann@ultratronik.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,
this is a reworked version from my previous effort to convert qt5
packages to a qmake-package infra and then make that infrastructure
suitable for per-package builds.

Though combining the two is not strictly necessary, the approach leads
to, hopefully, less complicated and more maintainable code.
The trick for the generic infra is basically to remove most of the
handcrafted target install steps, in favor of relying on the
qmake generated install recipes. How this is done has not changed since
v4 and what we have agreed on back then. Details in the commits. I have
also tried to incorporate the suggestions of the reviews back then, but
dont yell at me if I missed some (v4 was march last year).

Now for the testing:
Since "2215b8a75 qt5: disable for static-only builds" it's not possible
to build with static library only support, so I didn't test it. However,
the patch "qt5base: Do not build shared libs if BR2_STATIC_LIBS is
chosen" is included in case static libs will be reenabled in the future.

This series is now rebased on master from a few days ago, but most of
the testing has been done on top of revision fe033bd 2019-12-15 18:36
FFontaine       o package/samba4: fix build without python3.
That version happened to build almost fine with a modified
imx6-sabresd_qt5_defconfig (all possible qt packages activated, see below).
Afterwards I tried several times to rebuild with newer master version,
only to find the build break in some corner cases, which didnt seem to
relate to the changes I did. Time and again I ran out of time debugging
and fixing those issues.

The aim of my testing was to prove the target and staging results would
not differ between sequential build without the patches and a
parallelized per-package build with them.

However, there are differences, and they are interesting. To find them I
compared the target folders with a rsync dry-run (details below). It
actually revealed that some files are missing in the old install method:
- executables of qt5xmlpatterns (if not desired could be removed inside
POST_INSTALL_TARGET_HOOKS)
- many plain library links (the ones without any version appendix)
- libQt5Nfc.so* altogether
- NFC examples
- liblocationlabsplugin.so (and some more files from qt5location)

The only files that were missing with the new method are *.prl. Those
were explicitly removed in the target-finalize step. This is a little
inconsistent with the way the examples are installed (with source,
Makefiles and all), so I dont know if it's a issue.

After adding the more complicated package conversions some additional
differences inthe target folders become visible:
- webkitqml, webkitwidgets now appear in examples!
- a number of lipi_toolkit libraries appear in the plugins folder
(originate in qt5virtualkeyboard)
- QtWebPluginProcess and QtWebProcess appear in /usr/libexec (originate
from qt5webkit)
- qtwebengine locales appear in usr/translations/qtwebengine_locales/
instead of usr/translations/qtwebengine_locales/qtwebengine_locales/

However, the majority of target files exists equally in both variants
and I was unable to find major inconsistencies.

The same comparison on the host folders showed hardly any difference at
all. Unfortunately I didnt keep the output, so I cant provide evidence
right now.

Finally, on one occassion I think I observed some kind of race condition
in the per-package host assembly. A build would fail complaining about
some missing header. I would look for it, find it, restart the build
which then happily continued..

Ok, enough for now, regards,
Andreas



Detailed rsync line (grep removes directories from the list):
anaumann at wslxew902-$ rsync -avun --ignore-existing --delete
output/target/ ../buildroot-orig/output/target/ | grep -v "/$"
sending incremental file list
usr/bin/xmlpatterns
usr/bin/xmlpatternsvalidator
usr/lib/libEnginio.so -> libEnginio.so.1.6.3
usr/lib/libQt53DAnimation.so -> libQt53DAnimation.so.5.12.5
usr/lib/libQt53DCore.so -> libQt53DCore.so.5.12.5
usr/lib/libQt53DExtras.so -> libQt53DExtras.so.5.12.5
usr/lib/libQt53DInput.so -> libQt53DInput.so.5.12.5
usr/lib/libQt53DLogic.so -> libQt53DLogic.so.5.12.5
usr/lib/libQt53DQuick.so -> libQt53DQuick.so.5.12.5
usr/lib/libQt53DQuickAnimation.so -> libQt53DQuickAnimation.so.5.12.5
usr/lib/libQt53DQuickExtras.so -> libQt53DQuickExtras.so.5.12.5
usr/lib/libQt53DQuickInput.so -> libQt53DQuickInput.so.5.12.5
usr/lib/libQt53DQuickRender.so -> libQt53DQuickRender.so.5.12.5
usr/lib/libQt53DQuickScene2D.so -> libQt53DQuickScene2D.so.5.12.5
usr/lib/libQt53DRender.so -> libQt53DRender.so.5.12.5
usr/lib/libQt5Bluetooth.so -> libQt5Bluetooth.so.5.12.5
usr/lib/libQt5Charts.so -> libQt5Charts.so.5.12.5
usr/lib/libQt5ExtSerialPort.so -> libQt5ExtSerialPort.so.1.2.0
usr/lib/libQt5Location.so -> libQt5Location.so.5.12.5
usr/lib/libQt5Multimedia.so -> libQt5Multimedia.so.5.12.5
usr/lib/libQt5MultimediaGstTools.so -> libQt5MultimediaGstTools.so.5.12.5
usr/lib/libQt5MultimediaQuick.so -> libQt5MultimediaQuick.so.5.12.5
usr/lib/libQt5MultimediaWidgets.so -> libQt5MultimediaWidgets.so.5.12.5
usr/lib/libQt5Nfc.so -> libQt5Nfc.so.5.12.5
usr/lib/libQt5Nfc.so.5 -> libQt5Nfc.so.5.12.5
usr/lib/libQt5Nfc.so.5.12 -> libQt5Nfc.so.5.12.5
usr/lib/libQt5Nfc.so.5.12.5
usr/lib/libQt5Positioning.so -> libQt5Positioning.so.5.12.5
usr/lib/libQt5PositioningQuick.so -> libQt5PositioningQuick.so.5.12.5
usr/lib/libQt5Qml.so -> libQt5Qml.so.5.12.5
usr/lib/libQt5Quick.so -> libQt5Quick.so.5.12.5
usr/lib/libQt5QuickControls2.so -> libQt5QuickControls2.so.5.12.5
usr/lib/libQt5QuickParticles.so -> libQt5QuickParticles.so.5.12.5
usr/lib/libQt5QuickShapes.so -> libQt5QuickShapes.so.5.12.5
usr/lib/libQt5QuickTemplates2.so -> libQt5QuickTemplates2.so.5.12.5
usr/lib/libQt5QuickTest.so -> libQt5QuickTest.so.5.12.5
usr/lib/libQt5QuickWidgets.so -> libQt5QuickWidgets.so.5.12.5
usr/lib/libQt5Script.so -> libQt5Script.so.5.12.5
usr/lib/libQt5ScriptTools.so -> libQt5ScriptTools.so.5.12.5
usr/lib/libQt5Scxml.so -> libQt5Scxml.so.5.12.5
usr/lib/libQt5Sensors.so -> libQt5Sensors.so.5.12.5
usr/lib/libQt5SerialBus.so -> libQt5SerialBus.so.5.12.5
usr/lib/libQt5SerialPort.so -> libQt5SerialPort.so.5.12.5
usr/lib/libQt5Svg.so -> libQt5Svg.so.5.12.5
usr/lib/libQt5WebSockets.so -> libQt5WebSockets.so.5.12.5
usr/lib/libQt5WebView.so -> libQt5WebView.so.5.12.5
usr/lib/libQt5X11Extras.so -> libQt5X11Extras.so.5.12.5
usr/lib/libQt5XmlPatterns.so -> libQt5XmlPatterns.so.5.12.5
deleting usr/lib/qt/examples/multimedia/spectrum/libfftreal.prl
usr/lib/qt/examples/nfc/nfc.pro
usr/lib/qt/examples/nfc/annotatedurl/annotatedurl
usr/lib/qt/examples/nfc/annotatedurl/annotatedurl.cpp
usr/lib/qt/examples/nfc/annotatedurl/annotatedurl.h
usr/lib/qt/examples/nfc/annotatedurl/annotatedurl.pro
usr/lib/qt/examples/nfc/annotatedurl/main.cpp
usr/lib/qt/examples/nfc/annotatedurl/mainwindow.cpp
usr/lib/qt/examples/nfc/annotatedurl/mainwindow.h
usr/lib/qt/examples/nfc/annotatedurl/mainwindow.ui
usr/lib/qt/examples/nfc/corkboard/Mode.qml
usr/lib/qt/examples/nfc/corkboard/NfcFlag.png
usr/lib/qt/examples/nfc/corkboard/cork.jpg
usr/lib/qt/examples/nfc/corkboard/corkboard.pro
usr/lib/qt/examples/nfc/corkboard/corkboard.qrc
usr/lib/qt/examples/nfc/corkboard/corkboards.qml
usr/lib/qt/examples/nfc/corkboard/icon.png
usr/lib/qt/examples/nfc/corkboard/main.cpp
usr/lib/qt/examples/nfc/corkboard/note-yellow.png
usr/lib/qt/examples/nfc/corkboard/qml_corkboard
usr/lib/qt/examples/nfc/corkboard/tack.png
usr/lib/qt/examples/nfc/corkboard/android/AndroidManifest.xml
usr/lib/qt/examples/nfc/ndefeditor/main.cpp
usr/lib/qt/examples/nfc/ndefeditor/mainwindow.cpp
usr/lib/qt/examples/nfc/ndefeditor/mainwindow.h
usr/lib/qt/examples/nfc/ndefeditor/mainwindow.ui
usr/lib/qt/examples/nfc/ndefeditor/mimeimagerecordeditor.cpp
usr/lib/qt/examples/nfc/ndefeditor/mimeimagerecordeditor.h
usr/lib/qt/examples/nfc/ndefeditor/mimeimagerecordeditor.ui
usr/lib/qt/examples/nfc/ndefeditor/ndefeditor
usr/lib/qt/examples/nfc/ndefeditor/ndefeditor.pro
usr/lib/qt/examples/nfc/ndefeditor/textrecordeditor.cpp
usr/lib/qt/examples/nfc/ndefeditor/textrecordeditor.h
usr/lib/qt/examples/nfc/ndefeditor/textrecordeditor.ui
usr/lib/qt/examples/nfc/ndefeditor/urirecordeditor.cpp
usr/lib/qt/examples/nfc/ndefeditor/urirecordeditor.h
usr/lib/qt/examples/nfc/ndefeditor/urirecordeditor.ui
usr/lib/qt/examples/nfc/poster/poster.pro
usr/lib/qt/examples/nfc/poster/poster.qml
usr/lib/qt/examples/nfc/poster/poster.qrc
usr/lib/qt/examples/nfc/poster/qml_poster
usr/lib/qt/examples/nfc/poster/qmlposter.cpp
deleting usr/lib/qt/examples/sensors/grue/libgruesensor.prl
deleting usr/lib/qt/examples/webkitqml/shared/libshared.prl
deleting
usr/lib/qt/examples/widgets/tools/plugandpaint/plugins/libpnp_basictools.prl
usr/qml/Qt/labs/location/liblocationlabsplugin.so
usr/qml/Qt/labs/location/plugins.qmltypes
usr/qml/Qt/labs/location/qmldir
usr/qml/QtNfc/libdeclarative_nfc.so
usr/qml/QtNfc/plugins.qmltypes
usr/qml/QtNfc/qmldir


Packages on top of imx6-sabresd_qt5_defconfig (with toolchain-external-arm-arm)
+BR2_PACKAGE_DIRECTFB=y
+BR2_PACKAGE_QT53D=y
+BR2_PACKAGE_QT5BASE_EXAMPLES=y
+BR2_PACKAGE_QT5BASE_MYSQL=y
+BR2_PACKAGE_QT5BASE_PSQL=y
+BR2_PACKAGE_QT5BASE_SQLITE_QT=y
+BR2_PACKAGE_QT5BASE_XCB=y
+BR2_PACKAGE_QT5BASE_HARFBUZZ=y
+BR2_PACKAGE_QT5BASE_TSLIB=y
+BR2_PACKAGE_QT5CANVAS3D=y
+BR2_PACKAGE_QT5CHARTS=y
+BR2_PACKAGE_QT5CONNECTIVITY=y
+BR2_PACKAGE_QT5ENGINIO=y
+BR2_PACKAGE_QT5IMAGEFORMATS=y
+BR2_PACKAGE_QT5LOCATION=y
+BR2_PACKAGE_QT5SCXML=y
+BR2_PACKAGE_QT5SENSORS=y
+BR2_PACKAGE_QT5SERIALBUS=y
+BR2_PACKAGE_QT5TOOLS_QDOC_TOOL=y
+BR2_PACKAGE_QT5TOOLS_PIXELTOOL=y
+BR2_PACKAGE_QT5TOOLS_QTDIAG=y
+BR2_PACKAGE_QT5TOOLS_QTPATHS=y
+BR2_PACKAGE_QT5TOOLS_QTPLUGININFO=y
+BR2_PACKAGE_QT5VIRTUALKEYBOARD=y
+BR2_PACKAGE_QT5VIRTUALKEYBOARD_HANDWRITING=y
+BR2_PACKAGE_QT5VIRTUALKEYBOARD_ARROW_KEY_NAVIGATION=y
+BR2_PACKAGE_QT5WAYLAND=y
+BR2_PACKAGE_QT5WAYLAND_COMPOSITOR=y
+BR2_PACKAGE_QT5WEBKIT_EXAMPLES=y
+BR2_PACKAGE_QT5WEBENGINE=y
+BR2_PACKAGE_QT5WEBENGINE_PROPRIETARY_CODECS=y
+BR2_PACKAGE_QT5WEBENGINE_ALSA=y
+BR2_PACKAGE_QT5WEBVIEW=y
+BR2_PACKAGE_QT5X11EXTRAS=y
+BR2_PACKAGE_CUTELYST=y
+BR2_PACKAGE_GRANTLEE=y
+BR2_PACKAGE_KF5=y
+BR2_PACKAGE_KF5_KCOREADDONS=y
+BR2_PACKAGE_QEXTSERIALPORT=y
+BR2_PACKAGE_QJSON=y
+BR2_PACKAGE_QUAZIP=y
+BR2_PACKAGE_QWT=y
+BR2_PACKAGE_QWT_SVG=y
+BR2_PACKAGE_QWT_MATHML=y
+BR2_PACKAGE_QWT_OPENGL=y
+BR2_PACKAGE_XORG7=y
+BR2_PACKAGE_XLIB_LIBXDAMAGE=y
+BR2_PACKAGE_QT_WEBKIT_KIOSK=y
+BR2_PACKAGE_QT_WEBKIT_KIOSK_SOUNDS=y
+BR2_PACKAGE_PYTHON=y
+BR2_PACKAGE_PYTHON_PYQT5=y
+BR2_PACKAGE_BLUEZ5_UTILS=y

v4->v6
- Remove the now merged qt.conf.in and la/prl-fixup patches
- rebase to current master
- Split the more complicate to convert packages into single commits
- Added the new webview package to the straigtforward conversion patch
- find and fix hidden dependencies of some packages
- and many more, I lost track to be honest

v4->v5
- Split out the qt.conf.in and la/prl-fixup patch (now merged) from
qmake infra patches (because of limited time for full rework)
- Keep custom settings path /usr instead of resetting to default
/usr/etc/xdg



Andreas Naumann (28):
  package/qt5base: Do not build shared libs if BR2_STATIC_LIBS is chosen
  core/pkg-infra: Add generic qmake package infrastructure
  qt5: Convert straightforward packages to qmake infra
  package/qt5base: Convert to qmake infra
  package/qwt: Partially convert to qmake infra
  package/qwt: Add missing qt5svg dependency
  package/qt5tools: Partially convert to qmake infra
  package/qt5virtualkeyboard: Convert to qmake infra
  package/quazip: Convert to qmake infra
  package/qt5wayland: Convert to qmake infra
  package/qt5webchannel: Convert to qmake infra
  package/qt5webkit: Convert to qmake infra
  package/qt5webkit-examples: Convert  to qmake infra
  package/qt5webengine: Convert to qmake infra
  package/qt-webkit-kiosk: Convert to qmake infra
  package/qt5cinex: Convert to qmake infra
  core/pkg-infra: Fix package file statistics for parallel build
  package/cmake: Fix for using -O in top-level make
  core/pkg-infra: Add per-package support in qmake infra
  qt5: Fix pkgconfig search path for per-package infrastructure
  package/python-sip: Fix qmake usage for per-package build
  package/python-pyqt5: Fix qmake usage for per-package build
  package/qt5webengine: add libXdamage as XCB dependency
  package/qt5webengine: Add optional dependency on qt5quickcontrols2
  package/qt5webengine: Add optional dependency on qt5location
  package/qt5virtualkeyboard: Add optional dependency on
    qt5quickcontrols2
  package/qt53d: Add optional dependency on qt5multimedia
  package/qt5charts: Add optional dependency on qt5multimedia

 Makefile                                      |   5 +-
 docs/manual/adding-packages-qmake.txt         |  85 ++++++++++++++
 docs/manual/adding-packages.txt               |   2 +
 package/Makefile.in                           |   1 +
 package/cmake/cmake.mk                        |   1 +
 package/pkg-generic.mk                        |  14 ++-
 package/pkg-qmake.mk                          | 106 ++++++++++++++++++
 package/python-pyqt5/python-pyqt5.mk          |   1 +
 package/python-sip/python-sip.mk              |   3 +-
 package/qextserialport/qextserialport.mk      |  22 +---
 package/qt-webkit-kiosk/qt-webkit-kiosk.mk    |  11 +-
 package/qt5/qt5.mk                            |  19 +++-
 package/qt5/qt53d/qt53d.mk                    |  42 +------
 package/qt5/qt5base/qt5base.mk                |  97 ++--------------
 package/qt5/qt5canvas3d/qt5canvas3d.mk        |  25 +----
 package/qt5/qt5charts/qt5charts.mk            |  40 +------
 .../qt5/qt5connectivity/qt5connectivity.mk    |  59 +---------
 package/qt5/qt5declarative/qt5declarative.mk  |  47 +-------
 package/qt5/qt5enginio/qt5enginio.mk          |  38 +------
 .../qt5graphicaleffects.mk                    |  18 +--
 .../qt5/qt5imageformats/qt5imageformats.mk    |  20 +---
 package/qt5/qt5location/qt5location.mk        |  49 +-------
 package/qt5/qt5multimedia/qt5multimedia.mk    |  46 +-------
 .../qt5/qt5quickcontrols/qt5quickcontrols.mk  |  41 +------
 .../qt5quickcontrols2/qt5quickcontrols2.mk    |  40 +------
 package/qt5/qt5script/qt5script.mk            |  31 +----
 package/qt5/qt5scxml/qt5scxml.mk              |  36 +-----
 package/qt5/qt5sensors/qt5sensors.mk          |  39 +------
 package/qt5/qt5serialbus/qt5serialbus.mk      |  37 +-----
 package/qt5/qt5serialport/qt5serialport.mk    |  31 +----
 package/qt5/qt5svg/qt5svg.mk                  |  39 +------
 package/qt5/qt5tools/qt5tools.mk              |   6 +-
 .../qt5virtualkeyboard/qt5virtualkeyboard.mk  |  67 ++---------
 package/qt5/qt5wayland/qt5wayland.mk          |  56 +--------
 package/qt5/qt5webchannel/qt5webchannel.mk    |  39 +------
 package/qt5/qt5webengine/Config.in            |   1 +
 package/qt5/qt5webengine/qt5webengine.mk      |  58 +++-------
 .../qt5webkit-examples/qt5webkit-examples.mk  |  23 +---
 package/qt5/qt5webkit/qt5webkit.mk            |  29 ++---
 package/qt5/qt5websockets/qt5websockets.mk    |  39 +------
 package/qt5/qt5webview/qt5webview.mk          |  39 +------
 package/qt5/qt5x11extras/qt5x11extras.mk      |  20 +---
 package/qt5/qt5xmlpatterns/qt5xmlpatterns.mk  |  31 +----
 package/qt5cinex/qt5cinex.mk                  |   9 +-
 package/quazip/quazip.mk                      |  18 +--
 package/qwt/qwt.mk                            |  10 +-
 46 files changed, 313 insertions(+), 1177 deletions(-)
 create mode 100644 docs/manual/adding-packages-qmake.txt
 create mode 100644 package/pkg-qmake.mk

-- 
2.25.0
