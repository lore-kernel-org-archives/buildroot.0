From: Andreas Naumann <anaumann@ultratronik.de>
Date: Thu, 14 Mar 2019 10:40:11 +0100
Subject: [Buildroot] [PATCH v2 00/13] ppsh compatible Qt5 / generic qmake
 target install
Message-ID: <20190314094024.1961-1-anaumann@ultratronik.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

(please disregard v1 of this, which just went out by accident to some of you
directly, but not the mailing list).

here's v2 with your suggestions, especially a generic target install step, taken
in. I ran out of time converting to a qmake infra, but let's first see if the
direction of this is acceptable.

I have separated the general qmake patches from the ppsh-specifics. However, I
included the rebased ppsh-v7 patches and my patches on top of that because it
was my original intend to improve on that. Please let me know if that's ok or
how to go on with it.

Details about the generic install are in the commit message (patch 1+2).

I have spent quite some time testing this:
- I have tested with Qt5.12.1 only. Qt5.6 should but might not always do the right
  thing. However I think it was decided to remove support for 5.6 anyway.?
- I have checked for a few modules that the correct files were installed with/without
  exmaples being selected as well as static vs. dynamic library setting.
- For some modules with options I ran a few different configurations and checked for
  the respective file being installed/absent. However, qt5base has so many options, I
  could not test them all. But overall it went surprisingly well, e.g. I didnt
  notice files being installed that should not be there.

Finally I compared the target folders before/after the patch set, with everything
Qt5 being turned on. That showed some additional files and folders being installed
through the generic method:
- /usr/bin/xmlpatterns
- /usr/bin/xmlpatternsvalidator
- all plain libQt5*.so links
- /usr/lib/libQt5VirtualKeyboard.so.5.12.1 and links
- /usr/lib/qt/plugins/lipi_toolkit/*
- /usr/lib/qt/plugins/virtualkeyboard/*
- /usr/lib/libQt5WaylandCompositor.so.5.12.1 and links
- /usr/libexec/QtWebPluginProcess
- /usr/libexec/QtWebProcess
- /usr/qml/Qt/labs/location/*
- /usr/qml/QtWayland/*

After all, I think those files should probably be there, rather than not.
I still have not yet done any runtime tests.

Another word about the removal of the *.la *.prl fixup. When developing the
generic install, I found that the fixup command touches ALL (not only the qt-
relevant) files. This apparently does no harm, but we have a separate libtool fixup
step anyway. So I checked what it does and found.. no diff. Thats for both,
HOST_DIR being default and custom out of the buildroot dir. Are there other
situations where the qt specific fixup is needed? If so, would it be sensible
to limit it to prl files because la files are already taken care of in the generic
infra?


v1 -> v2:
  - added generic qmake target install
  - added removal of la/prl fixup (optional)
  - rebased and reordered (together with ppsh-v7) on master
  - split patches to separate qmake rework from ppsh specifics
  - added handling of pkg-config search pathes for ppsh


best regards,
Andreas


Andreas Naumann (7):
  qt5base: Do not build shared libs if BR2_STATIC_LIBS is chosen
  qt5: Convert to generic target install command
  qt5base: Fix inconsistencies when overriding qmake properties
  qt5: Remove *.la/*.prl fixup script
  qt5: Use qmake via QT5_QMAKE variable
  qt5: Prepare qmake for per-package infrastructure
  qt5: Fix pkgconfig search path for per-package infrastructure

Thomas Petazzoni (6):
  core: implement per-package SDK and target
  Makefile: allow top-level parallel build with
    BR2_PER_PACKAGE_DIRECTORIES=y
  package/pkg-generic: make libtool .la files compatible with
    per-package directories
  package/pkg-kconfig: handle KCONFIG_DEPENDENCIES with per-package
    directories
  docs/manual: add details about top-level parallel build support
  docs/manual: document the effect of per-package directory on variables

 Config.in                                     | 18 +++++
 Makefile                                      | 48 +++++++------
 docs/manual/adding-packages-generic.txt       |  9 ++-
 docs/manual/common-usage.txt                  | 44 ++++++++++++
 docs/manual/faq-troubleshooting.txt           |  3 +
 docs/manual/quickstart.txt                    |  8 +--
 package/pkg-generic.mk                        | 24 ++++++-
 package/pkg-kconfig.mk                        |  1 +
 package/pkg-utils.mk                          | 26 +++++++
 package/python-sip/python-sip.mk              |  3 +-
 package/qextserialport/qextserialport.mk      |  6 +-
 package/qt5/qt5.mk                            | 30 +++++----
 package/qt5/qt53d/qt53d.mk                    | 24 +------
 package/qt5/qt5base/qt.conf.in                | 17 +----
 package/qt5/qt5base/qt5base.mk                | 67 +++----------------
 package/qt5/qt5canvas3d/qt5canvas3d.mk        | 13 +---
 package/qt5/qt5charts/qt5charts.mk            | 27 +-------
 .../qt5/qt5connectivity/qt5connectivity.mk    | 47 +------------
 package/qt5/qt5declarative/qt5declarative.mk  | 35 +---------
 package/qt5/qt5enginio/qt5enginio.mk          | 26 +------
 .../qt5graphicaleffects.mk                    |  5 +-
 .../qt5/qt5imageformats/qt5imageformats.mk    |  7 +-
 package/qt5/qt5location/qt5location.mk        | 37 +---------
 package/qt5/qt5multimedia/qt5multimedia.mk    | 34 +---------
 .../qt5/qt5quickcontrols/qt5quickcontrols.mk  | 28 +-------
 .../qt5quickcontrols2/qt5quickcontrols2.mk    | 27 +-------
 package/qt5/qt5script/qt5script.mk            | 19 +-----
 package/qt5/qt5scxml/qt5scxml.mk              | 24 +------
 package/qt5/qt5sensors/qt5sensors.mk          | 27 +-------
 package/qt5/qt5serialbus/qt5serialbus.mk      | 25 +------
 package/qt5/qt5serialport/qt5serialport.mk    | 19 +-----
 package/qt5/qt5svg/qt5svg.mk                  | 27 +-------
 package/qt5/qt5tools/qt5tools.mk              |  3 +-
 .../qt5virtualkeyboard/qt5virtualkeyboard.mk  | 37 +---------
 package/qt5/qt5wayland/qt5wayland.mk          | 28 +-------
 package/qt5/qt5webchannel/qt5webchannel.mk    | 26 +------
 package/qt5/qt5webengine/qt5webengine.mk      | 28 +-------
 .../qt5webkit-examples/qt5webkit-examples.mk  | 10 +--
 package/qt5/qt5webkit/qt5webkit.mk            | 13 +---
 package/qt5/qt5websockets/qt5websockets.mk    | 27 +-------
 package/qt5/qt5x11extras/qt5x11extras.mk      |  8 +--
 package/qt5/qt5xmlpatterns/qt5xmlpatterns.mk  | 19 +-----
 package/qt5cinex/qt5cinex.mk                  |  3 +-
 package/qwt/qwt.mk                            |  1 +
 support/scripts/check-host-rpath              | 27 ++++++--
 support/scripts/fix-rpath                     | 29 ++++++--
 46 files changed, 312 insertions(+), 702 deletions(-)

-- 
2.21.0
