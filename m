From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Tue, 23 Sep 2014 18:21:08 +0200
Subject: [Buildroot] [PATCH 0/3] Re-introducing libgtk3
Message-ID: <1411489271-26899-1-git-send-email-eric.le.bihan.dev@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi!

This small series re-introduces libgtk3.

The following changes have been made to the latest version posted by H.
Bouteville:

 - Introduction of pkg-config-native, provided by host-pkgconf. This variant
   of pkg-config uses the host sysroot and is needed by the Gtk+ build system
   to build some tools.
 - Add multiple backend support (X11, Wayland, Broadway).
 - GSettings schemas compilation after installation (needed by gtk3-demo).
 - Introduction of hicolor-icon-theme (needed by gtk3-demo).

The following tests have been performed:

 - running gtk3-demo in QEMU x86/ARM in a X11/Fluxbox environment.
 - running gtk3-demo in QEMU x86/ARM in a Wayland/Weston environment.

Note: since wayland has been bumped to 1.6.0, running gtk3-demo in Weston does
not work anymore. Gtk+ 3.12.2 uses protocol version 3, whereas wayland 1.6.0
introduces version 4. A runtime check is performed and the program refuses to
start. This is solved with Gtk+ 3.14.0. Once this series is accepted, I will
provide a series bumping libgtk3 and friends (libglib2, pango, etc).

Best regards,
ELB

Eric Le Bihan (2):
  host-pkgconf: install pkg-config-native
  hicolor-icon-theme: new package

Hadrien Boutteville (1):
  libgtk3: new package

 package/Config.in                                  |   2 +
 package/hicolor-icon-theme/Config.in               |   4 +
 package/hicolor-icon-theme/hicolor-icon-theme.mk   |  12 ++
 package/libgtk3/Config.in                          |  87 +++++++++++
 package/libgtk3/libgtk3-0001-no-gtk-doc.patch      |  25 +++
 .../libgtk3-0002-fix-introspection-check.patch     |  28 ++++
 .../libgtk3/libgtk3-0003-disable-atk-bridge.patch  |  45 ++++++
 package/libgtk3/libgtk3.mk                         | 174 +++++++++++++++++++++
 package/pkgconf/pkg-config-native.in               |   3 +
 package/pkgconf/pkgconf.mk                         |   8 +
 10 files changed, 388 insertions(+)
 create mode 100644 package/hicolor-icon-theme/Config.in
 create mode 100644 package/hicolor-icon-theme/hicolor-icon-theme.mk
 create mode 100644 package/libgtk3/Config.in
 create mode 100644 package/libgtk3/libgtk3-0001-no-gtk-doc.patch
 create mode 100644 package/libgtk3/libgtk3-0002-fix-introspection-check.patch
 create mode 100644 package/libgtk3/libgtk3-0003-disable-atk-bridge.patch
 create mode 100644 package/libgtk3/libgtk3.mk
 create mode 100644 package/pkgconf/pkg-config-native.in

--
1.9.1
