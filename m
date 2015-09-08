From: Romain Naour <romain.naour@openwide.fr>
Date: Tue,  8 Sep 2015 23:19:34 +0200
Subject: [Buildroot] [PACH v2 00/38] efl bump to 1.15.1
Message-ID: <1441747212-27421-1-git-send-email-romain.naour@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This series bump the efl package to the latest release and also update all
other packages which use efl.

The elf related packages are no longer in package/efl directory to
follow the Buildroot recommendations.

This series has been tested under Qemu for x86 using the kernel based on
linux config povided in board/qemu/x86. I've enabled CONFIG_FB_CIRRUS
and some other video related options during testing.
An example defconfig can be added in a followup patch.

It also been tested on ARM with a uClibc-ng 1.0.5 + a patch
which has been merged in uClibc-ng 1.0.6 release.
Legacy uClibc toolchains are not supported due to missing mkstemps().

/!\ Warning for autobuilders /!\
All uClibc-ng toolchains must be rebuilt with the latest release.

The sdl2 support has been removed from this series since sdl2 package
is not merged upstream yet.

Patches  1 to  3 add some new packages used by efl
Patches  4 to  8 move existing efl packages outside or package/efl directory.
                 There is no efl package at this point.
Patches  9 to 21 add a new efl package updated to 1.14.2.
Patches 22 to 27 update all other packages which use efl.
Patches 28 to 37 remove old efl packages.
Patch 38 add a new package libemotion-generic-players

This is a first part, other packages which use efl are ready and will be
sent in a followup series:

* rage
* terminology
* empc
* ecrire
* python-efl
* econnman
* libetrophy
* elemines
* libcanberra
* e-cho

Thanks to Vicente Bergas for testing on musl!

Since v1:
* EFL bump to 1.15.1 instead of 1.14.2
* libelementary bump to 1.15.1 instead of 1.14.2
* enlightenment bump to 0.19.9 instead of 0.19.7

Best regards,
Romain Naour

Bernd Kuhls (1):
  package/x11r7/xlib_libXpresent: new package

Romain Naour (37):
  package/x11r7/xproto_printproto: new package
  package/x11r7/xlib_libXp: new package
  package/efl: remove shared version number
  package/expedite: move to package directory
  package/libelementary: move to package directory
  package/libevas-generic-loaders: move to package directory
  package/efl: move one directory higher
  package/efl: new host-package
  package/efl: new package
  package/efl: regenerate the configure script
  package/efl: add harfbuzz dependency
  package/efl: add wayland dependency
  package/efl: add libcurl dependency
  package/efl: add libblkid dependency
  package/efl: add webp dependency
  package/efl: add frame buffer config option
  package/efl: add jp2k config option
  package/efl: add X11 support
  package/efl: add OpenGL/OpenGLES support
  package/efl: add Xpresent dependency
  package/libevas-generic-loaders: bump to version 1.15.0
  package/libevas-generic-loaders: add libraw dependency
  package/libelementary: bump to version 1.15.1
  package/libelementary: add host package
  package/enlightenment: bump to version 0.19.9
  package/expedite: bump to efl-1.15 branch
  package/libethumb: remove package
  package/libedje: remove package
  package/libembryo: remove package
  package/libeio: remove package
  package/libefreet: remove package
  package/libedbus: remove package
  package/libecore: remove package
  package/libevas: remove package
  package/libeet: remove package
  package/libeina: remove package
  package/libemotion-generic-players: new package

 Config.in.legacy                                   |  70 ++++
 package/Config.in                                  |   6 +-
 package/efl/Config.in                              | 165 ++++++++--
 package/efl/efl.hash                               |   2 +
 package/efl/efl.mk                                 | 357 ++++++++++++++++++++-
 package/efl/expedite/Config.in                     |  15 -
 package/efl/expedite/expedite.mk                   |  20 --
 package/efl/libecore/Config.in                     |  46 ---
 package/efl/libecore/libecore.mk                   | 114 -------
 package/efl/libedbus/Config.in                     |  44 ---
 package/efl/libedbus/libedbus.mk                   |  37 ---
 package/efl/libedje/Config.in                      |  28 --
 package/efl/libedje/libedje.mk                     |  28 --
 package/efl/libeet/Config.in                       |  11 -
 package/efl/libeet/libeet.mk                       |  27 --
 package/efl/libefreet/Config.in                    |  10 -
 package/efl/libefreet/libefreet.mk                 |  17 -
 package/efl/libeina/Config.in                      |   6 -
 package/efl/libeina/libeina.mk                     |  18 --
 package/efl/libeio/Config.in                       |  22 --
 package/efl/libeio/libeio.mk                       |  16 -
 package/efl/libelementary/Config.in                |  17 -
 package/efl/libelementary/libelementary.mk         |  32 --
 package/efl/libembryo/Config.in                    |   9 -
 package/efl/libembryo/libembryo.mk                 |  18 --
 package/efl/libethumb/Config.in                    |  15 -
 package/efl/libethumb/libethumb.mk                 |  27 --
 package/efl/libevas-generic-loaders/Config.in      |  29 --
 .../libevas-generic-loaders.mk                     |  31 --
 package/efl/libevas/0001-giflib.patch              |  98 ------
 package/efl/libevas/Config.in                      | 211 ------------
 package/efl/libevas/libevas.mk                     | 247 --------------
 package/enlightenment/Config.in                    |  36 +--
 package/enlightenment/enlightenment.hash           |   2 +
 package/enlightenment/enlightenment.mk             |  22 +-
 package/expedite/Config.in                         |  17 +
 package/expedite/expedite.mk                       |  25 ++
 package/libelementary/Config.in                    |  18 ++
 package/libelementary/libelementary.hash           |   2 +
 package/libelementary/libelementary.mk             |  37 +++
 package/libemotion-generic-players/Config.in       |  20 ++
 .../libemotion-generic-players.hash                |   2 +
 .../libemotion-generic-players.mk                  |  17 +
 package/libevas-generic-loaders/Config.in          |  36 +++
 .../libevas-generic-loaders.hash                   |   2 +
 .../libevas-generic-loaders.mk                     |  37 +++
 package/x11r7/Config.in                            |   3 +
 package/x11r7/xlib_libXp/Config.in                 |  11 +
 package/x11r7/xlib_libXp/xlib_libXp.mk             |  20 ++
 package/x11r7/xlib_libXpresent/Config.in           |  19 ++
 .../x11r7/xlib_libXpresent/xlib_libXpresent.hash   |   4 +
 package/x11r7/xlib_libXpresent/xlib_libXpresent.mk |  22 ++
 package/x11r7/xproto_printproto/Config.in          |   7 +
 .../x11r7/xproto_printproto/xproto_printproto.hash |   2 +
 .../x11r7/xproto_printproto/xproto_printproto.mk   |  16 +
 55 files changed, 916 insertions(+), 1254 deletions(-)
 create mode 100644 package/efl/efl.hash
 delete mode 100644 package/efl/expedite/Config.in
 delete mode 100644 package/efl/expedite/expedite.mk
 delete mode 100644 package/efl/libecore/Config.in
 delete mode 100644 package/efl/libecore/libecore.mk
 delete mode 100644 package/efl/libedbus/Config.in
 delete mode 100644 package/efl/libedbus/libedbus.mk
 delete mode 100644 package/efl/libedje/Config.in
 delete mode 100644 package/efl/libedje/libedje.mk
 delete mode 100644 package/efl/libeet/Config.in
 delete mode 100644 package/efl/libeet/libeet.mk
 delete mode 100644 package/efl/libefreet/Config.in
 delete mode 100644 package/efl/libefreet/libefreet.mk
 delete mode 100644 package/efl/libeina/Config.in
 delete mode 100644 package/efl/libeina/libeina.mk
 delete mode 100644 package/efl/libeio/Config.in
 delete mode 100644 package/efl/libeio/libeio.mk
 delete mode 100644 package/efl/libelementary/Config.in
 delete mode 100644 package/efl/libelementary/libelementary.mk
 delete mode 100644 package/efl/libembryo/Config.in
 delete mode 100644 package/efl/libembryo/libembryo.mk
 delete mode 100644 package/efl/libethumb/Config.in
 delete mode 100644 package/efl/libethumb/libethumb.mk
 delete mode 100644 package/efl/libevas-generic-loaders/Config.in
 delete mode 100644 package/efl/libevas-generic-loaders/libevas-generic-loaders.mk
 delete mode 100644 package/efl/libevas/0001-giflib.patch
 delete mode 100644 package/efl/libevas/Config.in
 delete mode 100644 package/efl/libevas/libevas.mk
 create mode 100644 package/enlightenment/enlightenment.hash
 create mode 100644 package/expedite/Config.in
 create mode 100644 package/expedite/expedite.mk
 create mode 100644 package/libelementary/Config.in
 create mode 100644 package/libelementary/libelementary.hash
 create mode 100644 package/libelementary/libelementary.mk
 create mode 100644 package/libemotion-generic-players/Config.in
 create mode 100644 package/libemotion-generic-players/libemotion-generic-players.hash
 create mode 100644 package/libemotion-generic-players/libemotion-generic-players.mk
 create mode 100644 package/libevas-generic-loaders/Config.in
 create mode 100644 package/libevas-generic-loaders/libevas-generic-loaders.hash
 create mode 100644 package/libevas-generic-loaders/libevas-generic-loaders.mk
 create mode 100644 package/x11r7/xlib_libXp/Config.in
 create mode 100644 package/x11r7/xlib_libXp/xlib_libXp.mk
 create mode 100644 package/x11r7/xlib_libXpresent/Config.in
 create mode 100644 package/x11r7/xlib_libXpresent/xlib_libXpresent.hash
 create mode 100644 package/x11r7/xlib_libXpresent/xlib_libXpresent.mk
 create mode 100644 package/x11r7/xproto_printproto/Config.in
 create mode 100644 package/x11r7/xproto_printproto/xproto_printproto.hash
 create mode 100644 package/x11r7/xproto_printproto/xproto_printproto.mk

-- 
2.4.3
