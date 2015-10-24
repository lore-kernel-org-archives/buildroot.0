From: Romain Naour <romain.naour@openwide.fr>
Date: Sat, 24 Oct 2015 23:00:40 +0200
Subject: [Buildroot] [PATCH v5 00/36] efl bump to 1.15.2
Message-ID: <1445720476-21517-1-git-send-email-romain.naour@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This series bump the efl package to the latest stable release and also update
all other packages which use efl.

This series has been tested under Qemu for x86 using the kernel based on
linux config povided in board/qemu/x86. I've enabled CONFIG_FB_CIRRUS
and some other video related options during testing.
An example defconfig can be added in a followup patch.

It also been tested on ARM with a uClibc-ng 1.0.5 + a patch
which has been merged in uClibc-ng 1.0.6 release.
Legacy uClibc toolchains are not supported due to missing mkstemps().

/!\ Warning for autobuilders /!\
All uClibc-ng toolchains must be rebuilt with the latest release.

The libXpresent support has been removed from this series since this
package are not merged in Buildroot yet.

Thanks to an upstream patch from efl 1.15 stable branch, the dependency on
libXp can be removed, so there is no need to (re)add an xlib_libXp package.

Patches  1 and 2 Move expedite and libevas-generic-loaders packages outside of
                 package/efl directory.
Patches  3 to 18 Add a new efl package updated to 1.15.2 and its dependencies.
Patches 19 to 25 Update all other packages which use efl.
Patches 26 to 35 Remove old efl packages.
Patch   36       Add a new package libemotion-generic-players

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

Since v4:
* Use depends on BR2_PACKAGE_EFL instead of select (ThomasP)
* Add sdl2 support

Since v3:
* fix formating patch issue (rename detection in git)
* keep the efl and libelementary in the same sub-directory (package/efl) in
  order to share the same version number.
* keep the menuconfig BR2_PACKAGE_EFL in package/efl/Config.in

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


Romain Naour (35):
  package/expedite: move to package directory
  package/libevas-generic-loaders: move to package directory
  package/efl/libefl: new host-package
  package/efl/libefl: new package
  package/efl/libefl: regenerate the configure script
  package/efl/libefl: add harfbuzz dependency
  package/efl/libefl: add wayland dependency
  package/efl/libefl: add libcurl dependency
  package/efl/libefl: add libblkid dependency
  package/efl/libefl: add webp dependency
  package/efl/libefl: add frame buffer config option
  package/efl/libefl: add jp2k config option
  package/efl/libefl: add X11 support
  package/efl/libefl: add OpenGL/OpenGLES support
  package/efl/libefl: enable xinput2.2
  package/efl/libefl: add systemd dependency
  package/efl/libefl: add sdl2 support
  package/libevas-generic-loaders: bump to version 1.15.0
  package/libevas-generic-loaders: add libraw dependency
  package/efl/libelementary: bump to version 1.15.2
  package/efl/libelementary: add host package
  package/efl: libefl and libelementary share the same version number
  package/enlightenment: bump to version 0.19.12
  package/expedite: bump to efl-1.15 branch
  package/efl/libethumb: remove package
  package/efl/libedje: remove package
  package/efl/libembryo: remove package
  package/efl/libeio: remove package
  package/efl/libefreet: remove package
  package/efl/libedbus: remove package
  package/efl/libecore: remove package
  package/efl/libevas: remove package
  package/efl/libeet: remove package
  package/efl/libeina: remove package
  package/libemotion-generic-players: new package

Vicente Bergas (1):
  package/efl/libefl: fix framebuffer support

 Config.in.legacy                                   |  70 ++++
 package/Config.in                                  |   3 +
 package/efl/Config.in                              |  28 +-
 package/efl/efl.mk                                 |   2 +
 package/efl/libecore/Config.in                     |  46 ---
 package/efl/libecore/libecore.mk                   | 114 -------
 package/efl/libedbus/Config.in                     |  44 ---
 package/efl/libedbus/libedbus.mk                   |  37 --
 package/efl/libedje/Config.in                      |  28 --
 package/efl/libedje/libedje.mk                     |  28 --
 package/efl/libeet/Config.in                       |  11 -
 package/efl/libeet/libeet.mk                       |  27 --
 ...ecore_fb_private.h-define-EAPI-before-use.patch |  64 ++++
 .../libefl/0002-ecore_x-Remove-XPrint-usage.patch  | 153 +++++++++
 package/efl/libefl/Config.in                       | 159 +++++++++
 package/efl/libefl/libefl.hash                     |   2 +
 package/efl/libefl/libefl.mk                       | 373 +++++++++++++++++++++
 package/efl/libefreet/Config.in                    |  10 -
 package/efl/libefreet/libefreet.mk                 |  17 -
 package/efl/libeina/Config.in                      |   6 -
 package/efl/libeina/libeina.mk                     |  18 -
 package/efl/libeio/Config.in                       |  22 --
 package/efl/libeio/libeio.mk                       |  16 -
 package/efl/libelementary/Config.in                |  11 +-
 package/efl/libelementary/libelementary.hash       |   2 +
 package/efl/libelementary/libelementary.mk         |  35 +-
 package/efl/libembryo/Config.in                    |   9 -
 package/efl/libembryo/libembryo.mk                 |  18 -
 package/efl/libethumb/Config.in                    |  15 -
 package/efl/libethumb/libethumb.mk                 |  27 --
 package/efl/libevas/0001-giflib.patch              |  98 ------
 package/efl/libevas/Config.in                      | 211 ------------
 package/efl/libevas/libevas.mk                     | 247 --------------
 package/enlightenment/Config.in                    |  36 +-
 package/enlightenment/enlightenment.hash           |   2 +
 package/enlightenment/enlightenment.mk             |  22 +-
 package/{efl => }/expedite/Config.in               |   9 +-
 package/{efl => }/expedite/expedite.mk             |  13 +-
 package/libemotion-generic-players/Config.in       |  15 +
 .../libemotion-generic-players.hash                |   2 +
 .../libemotion-generic-players.mk                  |  17 +
 .../{efl => }/libevas-generic-loaders/Config.in    |  16 +-
 .../libevas-generic-loaders.hash                   |   2 +
 .../libevas-generic-loaders.mk                     |  18 +-
 44 files changed, 942 insertions(+), 1161 deletions(-)
 delete mode 100644 package/efl/libecore/Config.in
 delete mode 100644 package/efl/libecore/libecore.mk
 delete mode 100644 package/efl/libedbus/Config.in
 delete mode 100644 package/efl/libedbus/libedbus.mk
 delete mode 100644 package/efl/libedje/Config.in
 delete mode 100644 package/efl/libedje/libedje.mk
 delete mode 100644 package/efl/libeet/Config.in
 delete mode 100644 package/efl/libeet/libeet.mk
 create mode 100644 package/efl/libefl/0001-ecore_fb_private.h-define-EAPI-before-use.patch
 create mode 100644 package/efl/libefl/0002-ecore_x-Remove-XPrint-usage.patch
 create mode 100644 package/efl/libefl/Config.in
 create mode 100644 package/efl/libefl/libefl.hash
 create mode 100644 package/efl/libefl/libefl.mk
 delete mode 100644 package/efl/libefreet/Config.in
 delete mode 100644 package/efl/libefreet/libefreet.mk
 delete mode 100644 package/efl/libeina/Config.in
 delete mode 100644 package/efl/libeina/libeina.mk
 delete mode 100644 package/efl/libeio/Config.in
 delete mode 100644 package/efl/libeio/libeio.mk
 create mode 100644 package/efl/libelementary/libelementary.hash
 delete mode 100644 package/efl/libembryo/Config.in
 delete mode 100644 package/efl/libembryo/libembryo.mk
 delete mode 100644 package/efl/libethumb/Config.in
 delete mode 100644 package/efl/libethumb/libethumb.mk
 delete mode 100644 package/efl/libevas/0001-giflib.patch
 delete mode 100644 package/efl/libevas/Config.in
 delete mode 100644 package/efl/libevas/libevas.mk
 create mode 100644 package/enlightenment/enlightenment.hash
 rename package/{efl => }/expedite/Config.in (50%)
 rename package/{efl => }/expedite/expedite.mk (55%)
 create mode 100644 package/libemotion-generic-players/Config.in
 create mode 100644 package/libemotion-generic-players/libemotion-generic-players.hash
 create mode 100644 package/libemotion-generic-players/libemotion-generic-players.mk
 rename package/{efl => }/libevas-generic-loaders/Config.in (54%)
 create mode 100644 package/libevas-generic-loaders/libevas-generic-loaders.hash
 rename package/{efl => }/libevas-generic-loaders/libevas-generic-loaders.mk (64%)

-- 
2.4.3
