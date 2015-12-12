From: Romain Naour <romain.naour@openwide.fr>
Date: Sat, 12 Dec 2015 14:33:03 +0100
Subject: [Buildroot] [PATCH v9 00/32] efl bump to 1.15.2
Message-ID: <1449927215-3452-1-git-send-email-romain.naour@openwide.fr>
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

The libXpresent support has been removed from this series since this
package are not merged in Buildroot yet.

Thanks to an upstream patch from efl 1.15 stable branch, the dependency on
libXp can be removed, so there is no need to (re)add an xlib_libXp package.

Patches  1 and 4 Move expedite and libevas-generic-loaders packages outside of
                 package/efl directory. Do some clean up to prepare efl bump.
Patches  5 to 15 Add a new efl package updated to 1.15.2 and its dependencies.
Patches 16 to 22 Update all other packages which use efl.
Patches 23 to 32 Remove old efl packages.
Patch   33       Add a new package libemotion-generic-players

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

Thanks to Vicente Bergas for testing on musl, and thanks to Yann E.Morin for
the review on this series!

Since v8:
* Remove systemd support (It will added in a followup series after more testing)
* Remove OpenGL full support
* Take into acount comments from Yann E.Morin during his second review.

Since v7:
* Take into acount all comments from Yann E.Morin during his second review.

Since v6:
rebased on master after 2015.11

Since v5:
* Take into acount all comments from Yann E.Morin during his review.
  (see in the followup patches)
* Remove sdl2 support (again)
* Remove X11 xcb support

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

Romain Naour (32):
  package/expedite: move to package directory
  package/libevas-generic-loaders: move to package directory
  package/libevas-generic-loaders: add missing MMU dependency
  package/{efl packages}: reorder select/depends
  package/efl/libefl: new host-package
  package/efl/libefl: new package
  package/efl/libefl: add harfbuzz dependency
  package/efl/libefl: add wayland dependency
  package/efl/libefl: add webp dependency
  package/efl/libefl: add frame buffer config option
  package/efl/libefl: add jp2k config option
  package/efl/libefl: add X11 support
  package/efl/libefl: add OpenGLES support
  package/efl/libefl: enable xinput2.2
  package/libevas-generic-loaders: bump to version 1.15.0
  package/libevas-generic-loaders: add libraw dependency
  package/efl/libelementary: bump to version 1.15.2
  package/efl: libefl and libelementary share the same version number
  package/enlightenment: bump to version 0.19.12
  package/expedite: bump to efl-1.15 branch
  package/dbus-cpp: switch to libefl
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

 Config.in.legacy                                   |  70 +++++
 package/Config.in                                  |   3 +
 package/dbus-cpp/dbus-cpp.mk                       |   4 +-
 package/efl/Config.in                              |  35 +--
 package/efl/efl.mk                                 |   2 +
 package/efl/libecore/Config.in                     |  46 ----
 package/efl/libecore/libecore.mk                   | 114 --------
 package/efl/libedbus/Config.in                     |  44 ----
 package/efl/libedbus/libedbus.mk                   |  37 ---
 package/efl/libedje/Config.in                      |  28 --
 package/efl/libedje/libedje.mk                     |  28 --
 package/efl/libeet/Config.in                       |  11 -
 package/efl/libeet/libeet.mk                       |  27 --
 ...ecore_fb_private.h-define-EAPI-before-use.patch |  64 +++++
 .../libefl/0002-ecore_x-Remove-XPrint-usage.patch  | 153 +++++++++++
 package/efl/libefl/Config.in                       | 169 ++++++++++++
 package/efl/libefl/libefl.hash                     |   2 +
 package/efl/libefl/libefl.mk                       | 286 +++++++++++++++++++++
 package/efl/libefreet/Config.in                    |  10 -
 package/efl/libefreet/libefreet.mk                 |  17 --
 package/efl/libeina/Config.in                      |   6 -
 package/efl/libeina/libeina.mk                     |  18 --
 package/efl/libeio/Config.in                       |  22 --
 package/efl/libeio/libeio.mk                       |  16 --
 package/efl/libelementary/Config.in                |  14 +-
 package/efl/libelementary/libelementary.hash       |   2 +
 package/efl/libelementary/libelementary.mk         |  35 +--
 package/efl/libembryo/Config.in                    |   9 -
 package/efl/libembryo/libembryo.mk                 |  18 --
 .../0001-ethumb-drop-unused-dlfcn.h-include.patch  |  28 --
 package/efl/libethumb/Config.in                    |  15 --
 package/efl/libethumb/libethumb.mk                 |  27 --
 package/efl/libevas/0001-giflib.patch              |  98 -------
 package/efl/libevas/Config.in                      | 211 ---------------
 package/efl/libevas/libevas.mk                     | 247 ------------------
 package/enlightenment/Config.in                    |  27 +-
 package/enlightenment/enlightenment.hash           |   2 +
 package/enlightenment/enlightenment.mk             |  26 +-
 package/{efl => }/expedite/Config.in               |   9 +-
 package/{efl => }/expedite/expedite.mk             |  13 +-
 package/libemotion-generic-players/Config.in       |  19 ++
 .../libemotion-generic-players.hash                |   2 +
 .../libemotion-generic-players.mk                  |  17 ++
 .../{efl => }/libevas-generic-loaders/Config.in    |  20 +-
 .../libevas-generic-loaders.hash                   |   2 +
 .../libevas-generic-loaders.mk                     |  19 +-
 46 files changed, 899 insertions(+), 1173 deletions(-)
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
 delete mode 100644 package/efl/libethumb/0001-ethumb-drop-unused-dlfcn.h-include.patch
 delete mode 100644 package/efl/libethumb/Config.in
 delete mode 100644 package/efl/libethumb/libethumb.mk
 delete mode 100644 package/efl/libevas/0001-giflib.patch
 delete mode 100644 package/efl/libevas/Config.in
 delete mode 100644 package/efl/libevas/libevas.mk
 create mode 100644 package/enlightenment/enlightenment.hash
 rename package/{efl => }/expedite/Config.in (56%)
 rename package/{efl => }/expedite/expedite.mk (54%)
 create mode 100644 package/libemotion-generic-players/Config.in
 create mode 100644 package/libemotion-generic-players/libemotion-generic-players.hash
 create mode 100644 package/libemotion-generic-players/libemotion-generic-players.mk
 rename package/{efl => }/libevas-generic-loaders/Config.in (67%)
 create mode 100644 package/libevas-generic-loaders/libevas-generic-loaders.hash
 rename package/{efl => }/libevas-generic-loaders/libevas-generic-loaders.mk (62%)

-- 
2.4.3
