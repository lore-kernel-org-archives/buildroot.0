From: Romain Naour <romain.naour@openwide.fr>
Date: Sun, 26 Jul 2015 20:55:10 +0200
Subject: [Buildroot] [RFC 00/37] efl bump to 1.14.2
Message-ID: <1437936947-17632-1-git-send-email-romain.naour@openwide.fr>
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
A example defconfig will be added in a followup patch.

It also been builded tested with a ARM toolchain.

The sdl2 support has been droped in this series since some libevas gl module
still use sdl v1 headers.
Also the new efl package is no longer available for other libc than glibc due
to use of mkstemps() function.

Patches  1 to  3 add some new packages used by efl
Patches  4 to  8 move existing efl packages outside or package/efl directory.
                 There is no efl package at this point.
Patches  9 to 20 add a new efl package updated to 1.14.2.
Patches 21 to 26 update all other packages which use efl.
Patches 27 to 36 remove old efl packages.
Patch 37 add a new package libemotion-generic-players

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

Best regards,
Romain Naour

Bernd Kuhls (1):
  package/x11r7/xlib_libXpresent: new package

Romain Naour (36):
  package/x11r7/xproto_printproto: new package
  package/x11r7/xlib_libXp: new package
  package/efl: remove shared version number
  package/expedite: move to package directory
  package/libelementary: move to package directory
  package/libevas-generic-loaders: move to package directory
  package/efl: move one directory higher
  package/efl: new host-package
  package/efl: new package
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
  package/libevas-generic-loaders: bump to version 1.14.0
  package/libevas-generic-loaders: add libraw dependency
  package/libelementary: bump to version 1.14.2
  package/libelementary: add host package
  package/enlightenment: bump to version 0.19.7
  package/expedite: bump to efl-1.14 branch
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
 package/efl/Config.in                              | 166 ++++++++--
 package/efl/efl.hash                               |   2 +
 package/efl/efl.mk                                 | 352 ++++++++++++++++++++-
 package/efl/expedite/Config.in                     |  15 -
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
 package/efl/libevas/0001-giflib.patch              |  98 ------
 package/efl/libevas/Config.in                      | 211 ------------
 package/efl/libevas/libevas.mk                     | 247 ---------------
 package/enlightenment/Config.in                    |  35 +-
 package/enlightenment/enlightenment.hash           |   2 +
 package/enlightenment/enlightenment.mk             |  22 +-
 package/expedite/Config.in                         |  16 +
 package/{efl => }/expedite/expedite.mk             |  11 +-
 package/libelementary/Config.in                    |  17 +
 package/libelementary/libelementary.hash           |   2 +
 package/libelementary/libelementary.mk             |  37 +++
 package/libemotion-generic-players/Config.in       |  18 ++
 .../libemotion-generic-players.hash                |   2 +
 .../libemotion-generic-players.mk                  |  17 +
 package/libevas-generic-loaders/Config.in          |  35 ++
 .../libevas-generic-loaders.hash                   |   2 +
 .../libevas-generic-loaders.mk                     |  18 +-
 package/x11r7/Config.in                            |   3 +
 package/x11r7/xlib_libXp/Config.in                 |  11 +
 package/x11r7/xlib_libXp/xlib_libXp.mk             |  20 ++
 package/x11r7/xlib_libXpresent/Config.in           |  19 ++
 .../x11r7/xlib_libXpresent/xlib_libXpresent.hash   |   4 +
 package/x11r7/xlib_libXpresent/xlib_libXpresent.mk |  22 ++
 package/x11r7/xproto_printproto/Config.in          |   7 +
 .../x11r7/xproto_printproto/xproto_printproto.hash |   2 +
 .../x11r7/xproto_printproto/xproto_printproto.mk   |  16 +
 53 files changed, 864 insertions(+), 1212 deletions(-)
 create mode 100644 package/efl/efl.hash
 delete mode 100644 package/efl/expedite/Config.in
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
 delete mode 100644 package/efl/libevas/0001-giflib.patch
 delete mode 100644 package/efl/libevas/Config.in
 delete mode 100644 package/efl/libevas/libevas.mk
 create mode 100644 package/enlightenment/enlightenment.hash
 create mode 100644 package/expedite/Config.in
 rename package/{efl => }/expedite/expedite.mk (61%)
 create mode 100644 package/libelementary/Config.in
 create mode 100644 package/libelementary/libelementary.hash
 create mode 100644 package/libelementary/libelementary.mk
 create mode 100644 package/libemotion-generic-players/Config.in
 create mode 100644 package/libemotion-generic-players/libemotion-generic-players.hash
 create mode 100644 package/libemotion-generic-players/libemotion-generic-players.mk
 create mode 100644 package/libevas-generic-loaders/Config.in
 create mode 100644 package/libevas-generic-loaders/libevas-generic-loaders.hash
 rename package/{efl => }/libevas-generic-loaders/libevas-generic-loaders.mk (64%)
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
