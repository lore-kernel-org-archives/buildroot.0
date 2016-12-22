From: Andreas Naumann <anaumann@ultratronik.de>
Date: Thu, 22 Dec 2016 15:21:06 +0100
Subject: [Buildroot] [PATCH v4 00/10] qt bump to 5.8.0-rc
Message-ID: <1482416476-20306-1-git-send-email-anaumann@ultratronik.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi, 

since today the release candidate is fixed
http://blog.qt.io/blog/2016/12/22/qt-5-8-0-release-candidate-available/
So here is v4 of bumping to Qt 5.8.

In this version I have updated the hashes and hopefully taken all comments
into account.

I've tested building for SAMA5D3, but didnt go through imx6 and others again.

The issues found by me and Julien, QTBUG-57176, QTBUG-57039 and QTBUG-55950
have been fixed upstream so these patches disappeared.

@Peter: I did not yet add the BSD license for examples as you suggested.
I think that if we want this, we should do this for all modules with examples
and I wanted to get this thing finished first.
Also, I have not added your suggested link to the Qt licensing page. At the
moment http://doc.qt.io/qt-5.8/licensing.html is not yet available and the
one with .../qt-5/licensing.html is a moving/changing target.
-> todo for the release version.

Also, the python-pyqt patch is not strictly necessary for this, but I wanted to
keep things similar to python-pyqt5, as suggested by Thomas.

Now I'm curious what the autobuilder says, however next week I will be mostly
offline...


cheers,
Andreas



Andreas Naumann (7):
  qt5: bump to 5.8.0-rc
  qt5declarative: enable Quick for non-GL platforms
  qt5quickcontrols1/2: enable for software renderer
  python-pyqt5: Depend directly on Qt5 rather than its toolchain
    requirements
  python-pyqt: Depend directly on Qt rather than its toolchain
    requirements
  python-pyqt5: Fix for Qt 5.8.0
  poppler: Compile with -std=c++11

Julien Corjon (3):
  qt5enginio : move into legacy compatibility
  qt53d/qt5quickcontrols2/qt5serialbus : move out of tech preview
  Revert "qt5base: install bundled fonts to target"

 package/poppler/poppler.mk                         |  2 +
 package/python-pyqt/Config.in                      | 10 ++---
 package/python-pyqt5/0002-fix-qt-5.6.2.patch       | 28 --------------
 package/python-pyqt5/0002-fix-qt5.8-build.patch    | 28 ++++++++++++++
 package/python-pyqt5/Config.in                     | 13 ++-----
 package/qt5/Config.in                              | 14 +++----
 package/qt5/qt5.mk                                 |  6 +--
 package/qt5/qt53d/qt53d.hash                       |  4 +-
 .../0006-eglfs-rasp-pi-header-inclusion.patch      | 45 ----------------------
 package/qt5/qt5base/qt5base.hash                   |  4 +-
 package/qt5/qt5base/qt5base.mk                     | 26 ++-----------
 package/qt5/qt5canvas3d/qt5canvas3d.hash           |  4 +-
 package/qt5/qt5connectivity/qt5connectivity.hash   |  4 +-
 package/qt5/qt5connectivity/qt5connectivity.mk     |  4 +-
 package/qt5/qt5declarative/Config.in               |  6 +--
 package/qt5/qt5declarative/qt5declarative.hash     |  4 +-
 package/qt5/qt5declarative/qt5declarative.mk       |  4 +-
 .../qt5graphicaleffects/qt5graphicaleffects.hash   |  4 +-
 .../qt5/qt5graphicaleffects/qt5graphicaleffects.mk |  4 +-
 package/qt5/qt5imageformats/qt5imageformats.hash   |  4 +-
 package/qt5/qt5imageformats/qt5imageformats.mk     |  4 +-
 package/qt5/qt5location/qt5location.hash           |  4 +-
 package/qt5/qt5location/qt5location.mk             |  4 +-
 package/qt5/qt5multimedia/qt5multimedia.hash       |  4 +-
 package/qt5/qt5multimedia/qt5multimedia.mk         |  7 +++-
 package/qt5/qt5quickcontrols/Config.in             |  4 --
 package/qt5/qt5quickcontrols/qt5quickcontrols.hash |  4 +-
 package/qt5/qt5quickcontrols/qt5quickcontrols.mk   |  5 ++-
 package/qt5/qt5quickcontrols2/Config.in            |  4 --
 .../qt5/qt5quickcontrols2/qt5quickcontrols2.hash   |  4 +-
 package/qt5/qt5quickcontrols2/qt5quickcontrols2.mk |  8 ++--
 package/qt5/qt5script/qt5script.hash               |  4 +-
 package/qt5/qt5sensors/qt5sensors.hash             |  4 +-
 package/qt5/qt5sensors/qt5sensors.mk               |  4 +-
 package/qt5/qt5serialbus/qt5serialbus.hash         |  4 +-
 package/qt5/qt5serialport/qt5serialport.hash       |  4 +-
 package/qt5/qt5serialport/qt5serialport.mk         |  4 +-
 package/qt5/qt5svg/qt5svg.hash                     |  4 +-
 package/qt5/qt5svg/qt5svg.mk                       |  4 +-
 package/qt5/qt5tools/qt5tools.hash                 |  4 +-
 package/qt5/qt5tools/qt5tools.mk                   |  4 +-
 package/qt5/qt5webchannel/qt5webchannel.hash       |  4 +-
 package/qt5/qt5webchannel/qt5webchannel.mk         |  4 +-
 package/qt5/qt5webkit/qt5webkit.hash               |  4 +-
 package/qt5/qt5websockets/qt5websockets.hash       |  4 +-
 package/qt5/qt5websockets/qt5websockets.mk         |  4 +-
 package/qt5/qt5x11extras/qt5x11extras.hash         |  4 +-
 package/qt5/qt5x11extras/qt5x11extras.mk           |  4 +-
 package/qt5/qt5xmlpatterns/qt5xmlpatterns.hash     |  4 +-
 package/qt5/qt5xmlpatterns/qt5xmlpatterns.mk       |  4 +-
 50 files changed, 134 insertions(+), 212 deletions(-)
 delete mode 100644 package/python-pyqt5/0002-fix-qt-5.6.2.patch
 create mode 100644 package/python-pyqt5/0002-fix-qt5.8-build.patch
 delete mode 100644 package/qt5/qt5base/0006-eglfs-rasp-pi-header-inclusion.patch

-- 
1.9.1
