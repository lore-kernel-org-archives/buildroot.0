From: Andreas Naumann <anaumann@ultratronik.de>
Date: Thu, 26 Jan 2017 15:04:11 +0100
Subject: [Buildroot] [PATCH v5 00/10] bump/choice for qt 5.8.0
Message-ID: <1485439461-4797-1-git-send-email-anaumann@ultratronik.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Finally bumping to Qt 5.8.0 release version, keeping 5.6.2 as an option.
This mainly involved making some configure options conditional as well as
different licensing. Also, 5.8 supports Quick and modules depending on it on
non-GL platforms.

Currently no more qt-patches are needed for 5.8.0. Moved 5.6.2 patches to separate
directory.

Split up the qt5quickcontrols patch for hopefully more clarity.

Changed python-pyqt5 to depend on Qt5 instead of a bunch of toolchain
requirements (as suggested by Thomas). The same for pyqt for consistency.


Andreas Naumann (7):
  qt5: add choice between version 5.6.2 and 5.8.0
  qt5declarative: enable Quick for non-GL platforms for Qt 5.8.0
  qt5quickcontrols: More deterministic target install
  qt5quickcontrols/qt5quickcontrols2: enable for software renderer for
    Qt 5.8.0
  python-pyqt5: Depend directly on Qt5 rather than its toolchain
    requirements
  python-pyqt: Depend directly on Qt rather than its toolchain
    requirements
  python-pyqt5: Fix for Qt 5.8.0

Julien Corjon (3):
  qt5enginio : move into legacy compatibility
  qt53d/qt5quickcontrols2/qt5serialbus : move out of tech preview
  Conditional revert "qt5base: install bundled fonts to target"

 package/python-pyqt/Config.in                      | 10 ++--
 package/python-pyqt5/0002-fix-qt-5.6.2.patch       | 28 ------------
 package/python-pyqt5/0002-fix-qt5.8-build.patch    | 28 ++++++++++++
 package/python-pyqt5/Config.in                     | 13 ++----
 package/qt5/Config.in                              | 27 ++++++++---
 package/qt5/qt5.mk                                 |  8 ++++
 package/qt5/qt53d/qt53d.hash                       |  3 ++
 .../0006-eglfs-rasp-pi-header-inclusion.patch      | 45 ------------------
 ...fs-fix-eglfs_mali-compile-for-odroid-mali.patch | 53 ----------------------
 .../0006-eglfs-rasp-pi-header-inclusion.patch      | 45 ++++++++++++++++++
 ...fs-fix-eglfs_mali-compile-for-odroid-mali.patch | 53 ++++++++++++++++++++++
 package/qt5/qt5base/qt5base.hash                   |  3 ++
 package/qt5/qt5base/qt5base.mk                     | 15 ++++++
 package/qt5/qt5canvas3d/qt5canvas3d.hash           |  3 ++
 package/qt5/qt5connectivity/qt5connectivity.hash   |  3 ++
 package/qt5/qt5connectivity/qt5connectivity.mk     |  5 ++
 package/qt5/qt5declarative/Config.in               |  6 +--
 package/qt5/qt5declarative/qt5declarative.hash     |  3 ++
 package/qt5/qt5declarative/qt5declarative.mk       |  5 ++
 .../qt5graphicaleffects/qt5graphicaleffects.hash   |  3 ++
 .../qt5/qt5graphicaleffects/qt5graphicaleffects.mk |  5 ++
 package/qt5/qt5imageformats/qt5imageformats.hash   |  3 ++
 package/qt5/qt5imageformats/qt5imageformats.mk     |  5 ++
 package/qt5/qt5location/qt5location.hash           |  3 ++
 package/qt5/qt5location/qt5location.mk             |  5 ++
 package/qt5/qt5multimedia/qt5multimedia.hash       |  3 ++
 package/qt5/qt5multimedia/qt5multimedia.mk         |  8 ++++
 package/qt5/qt5quickcontrols/Config.in             |  4 +-
 package/qt5/qt5quickcontrols/qt5quickcontrols.hash |  3 ++
 package/qt5/qt5quickcontrols/qt5quickcontrols.mk   |  5 +-
 package/qt5/qt5quickcontrols2/Config.in            |  4 +-
 .../qt5/qt5quickcontrols2/qt5quickcontrols2.hash   |  3 ++
 package/qt5/qt5quickcontrols2/qt5quickcontrols2.mk | 12 +++++
 package/qt5/qt5script/qt5script.hash               |  3 ++
 package/qt5/qt5sensors/qt5sensors.hash             |  3 ++
 package/qt5/qt5sensors/qt5sensors.mk               |  5 ++
 package/qt5/qt5serialbus/qt5serialbus.hash         |  3 ++
 package/qt5/qt5serialport/qt5serialport.hash       |  3 ++
 package/qt5/qt5serialport/qt5serialport.mk         |  5 ++
 package/qt5/qt5svg/qt5svg.hash                     |  3 ++
 package/qt5/qt5svg/qt5svg.mk                       |  5 ++
 package/qt5/qt5tools/qt5tools.hash                 |  3 ++
 package/qt5/qt5tools/qt5tools.mk                   |  5 ++
 package/qt5/qt5webchannel/qt5webchannel.hash       |  3 ++
 package/qt5/qt5webchannel/qt5webchannel.mk         |  5 ++
 package/qt5/qt5webkit/qt5webkit.hash               |  3 ++
 package/qt5/qt5websockets/qt5websockets.hash       |  3 ++
 package/qt5/qt5websockets/qt5websockets.mk         |  5 ++
 package/qt5/qt5x11extras/qt5x11extras.hash         |  3 ++
 package/qt5/qt5x11extras/qt5x11extras.mk           |  5 ++
 package/qt5/qt5xmlpatterns/qt5xmlpatterns.hash     |  3 ++
 package/qt5/qt5xmlpatterns/qt5xmlpatterns.mk       |  5 ++
 52 files changed, 337 insertions(+), 158 deletions(-)
 delete mode 100644 package/python-pyqt5/0002-fix-qt-5.6.2.patch
 create mode 100644 package/python-pyqt5/0002-fix-qt5.8-build.patch
 delete mode 100644 package/qt5/qt5base/0006-eglfs-rasp-pi-header-inclusion.patch
 delete mode 100644 package/qt5/qt5base/0007-eglfs-fix-eglfs_mali-compile-for-odroid-mali.patch
 create mode 100644 package/qt5/qt5base/5.6.2/0006-eglfs-rasp-pi-header-inclusion.patch
 create mode 100644 package/qt5/qt5base/5.6.2/0007-eglfs-fix-eglfs_mali-compile-for-odroid-mali.patch

-- 
1.9.1
