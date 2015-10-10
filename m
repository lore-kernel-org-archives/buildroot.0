From: Romain Naour <romain.naour@openwide.fr>
Date: Sat, 10 Oct 2015 12:03:05 +0200
Subject: [Buildroot] [PATCH v3 00/37] efl bump to 1.15.2
Message-ID: <1444471422-15118-1-git-send-email-romain.naour@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This series bump the efl package to the latest stable release and also update
all other packages which use efl.

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

The sdl2 and libXpresent support has been removed from this series since these
package are not merged in Buildroot.

Thanks to an upstream patch from efl 1.15 stable branch, the dependency on
libXp can be removed, so there is no need to (re)add an xlib_libXp package.

Patch    1       Remove shared version number
Patches  2 to  5 Move existing efl packages outside or package/efl directory.
                 There is no efl package at this point.
Patches  6 to 20 Add a new efl package updated to 1.15.2 and its dependencies.
Patches 21 to 26 Update all other packages which use efl.
Patches 27 to 36 Remove old efl packages.
Patch   37       Add a new package libemotion-generic-players

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

Since v2:
* EFL bump to 1.15.2 instead of 1.15.1
* libelementary bump to 1.15.2 instead of 1.15.2
* enlightenment bump to 0.19.12 instead of 0.19.9
* remove libXp and xproto_printproto packages
* remove libXpresent (can be added later in a followup series)
* add systemd dependency
* enable xinput2.2+

Since v1:
* EFL bump to 1.15.1 instead of 1.14.2
* libelementary bump to 1.15.1 instead of 1.14.2
* enlightenment bump to 0.19.9 instead of 0.19.7

Best regards,
Romain Naour

Romain Naour (36):
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
  package/efl: enable xinput2.2
  package/efl: add systemd dependency
  package/libevas-generic-loaders: bump to version 1.15.0
  package/libevas-generic-loaders: add libraw dependency
  package/libelementary: bump to version 1.15.2
  package/libelementary: add host package
  package/enlightenment: bump to version 0.19.12
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

Vicente Bergas (1):
  package/efl: fix framebuffer support

 Config.in.legacy                                   |  70 ++++
 package/Config.in                                  |   6 +-
 ...ecore_fb_private.h-define-EAPI-before-use.patch |  64 ++++
 package/efl/0002-ecore_x-Remove-XPrint-usage.patch | 153 +++++++++
 package/efl/Config.in                              | 165 ++++++++--
 package/efl/efl.hash                               |   2 +
 package/efl/efl.mk                                 | 362 ++++++++++++++++++++-
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
 package/efl/libeina/libeina.mk                     |  18 -
 package/efl/libeio/Config.in                       |  22 --
 package/efl/libeio/libeio.mk                       |  16 -
 package/efl/libelementary/Config.in                |  17 -
 package/efl/libelementary/libelementary.mk         |  32 --
 package/efl/libembryo/Config.in                    |   9 -
 package/efl/libembryo/libembryo.mk                 |  18 -
 package/efl/libethumb/Config.in                    |  15 -
 package/efl/libethumb/libethumb.mk                 |  27 --
 package/efl/libevas-generic-loaders/Config.in      |  29 --
 .../libevas-generic-loaders.mk                     |  31 --
 package/efl/libevas/0001-giflib.patch              |  98 ------
 package/efl/libevas/Config.in                      | 211 ------------
 package/efl/libevas/libevas.mk                     | 247 --------------
 package/enlightenment/Config.in                    |  36 +-
 package/enlightenment/enlightenment.hash           |   2 +
 package/enlightenment/enlightenment.mk             |  22 +-
 package/expedite/Config.in                         |  17 +
 package/expedite/expedite.mk                       |  25 ++
 package/libelementary/Config.in                    |  18 +
 package/libelementary/libelementary.hash           |   2 +
 package/libelementary/libelementary.mk             |  37 +++
 package/libemotion-generic-players/Config.in       |  20 ++
 .../libemotion-generic-players.hash                |   2 +
 .../libemotion-generic-players.mk                  |  17 +
 package/libevas-generic-loaders/Config.in          |  36 ++
 .../libevas-generic-loaders.hash                   |   2 +
 .../libevas-generic-loaders.mk                     |  37 +++
 48 files changed, 1034 insertions(+), 1254 deletions(-)
 create mode 100644 package/efl/0001-ecore_fb_private.h-define-EAPI-before-use.patch
 create mode 100644 package/efl/0002-ecore_x-Remove-XPrint-usage.patch
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

-- 
2.4.3
