From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed,  9 Mar 2016 06:58:38 -0300
Subject: [Buildroot] [PATCH v3 0/7] gtk3/wayland/weston bump
Message-ID: <1457517525-7716-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bump libgtk3, companion gtkmm3 and wayland/weston to latest versions.
Add wayland-protocols which is now split from wayland and required for
weston to build since the 1.10+ releases.

The pangomm downgrade can be applied separately without issues.

The gtkmm3 bump is tied to the libgtk3 bump.

libgtk3 now requires an EGL/GLX backend via libepoxy, that's the
upstream take on the subject. When there's no hardware GL support mesa
with swrast can be used (hence the reason for the libepoxy patches, to
support x11-less builds, for example for wayland).

Re-enable libgtk3 wayland support: xdg protocol is normally
version-matched among them, so in the future care must be taken when
bumping one of them to a newer major version. The failure is only
exhibited at runtime - not at build time.

Changes for v3:
 + Newer libgtk3
 + Newer wayland/weston + wayland-protocols (new package)
 + Enhanced libepoxy package/patchset to build with GLX alone, and use
   the github efforts at EGL-alone.

Changes for v2:
 + Bump gtkmm3 as well
 + Drop target_os/host_os patch to libepoxy since it's dubious and not
 required.
 + Roll back pangomm version to stable branch.

Gustavo Zacarias (7):
  libepoxy: move outside x11r7 scope
  libgtk3: bump to version 3.18.8
  pangomm: roll back to version 2.38.1
  gtkmm3: bump to version 3.18.0
  wayland: bump to version 1.10.0
  wayland-protocols: new package
  weston: bump to version 1.10.0

 package/Config.in                                  |   2 +
 package/gtkmm3/Config.in                           |  18 +-
 package/gtkmm3/gtkmm3.hash                         |   4 +-
 package/gtkmm3/gtkmm3.mk                           |  13 +-
 .../0001-make-egl-and-glx-conditional.patch        | 319 +++++++++++++++++++++
 .../0002-Forward-egl-cflags-into-epoxy.pc.patch    |  45 +++
 package/libepoxy/0003-Make-egl-conditional.patch   |  59 ++++
 package/libepoxy/Config.in                         |  12 +
 package/libepoxy/libepoxy.mk                       |  32 +++
 .../0004-Fix-undefined-reference-to-get_xkb.patch  |  33 ---
 .../0005-do-not-build-extract-strings.patch        |  47 ---
 package/libgtk3/Config.in                          |  88 +++---
 package/libgtk3/libgtk3.hash                       |   4 +-
 package/libgtk3/libgtk3.mk                         |  15 +-
 package/pangomm/pangomm.hash                       |   4 +-
 package/pangomm/pangomm.mk                         |   2 +-
 package/wayland-protocols/Config.in                |   9 +
 package/wayland-protocols/wayland-protocols.hash   |   2 +
 package/wayland-protocols/wayland-protocols.mk     |  15 +
 package/wayland/Config.in                          |   3 +-
 package/wayland/wayland.hash                       |   4 +-
 package/wayland/wayland.mk                         |  18 +-
 package/weston/Config.in                           |   1 +
 package/weston/weston.hash                         |   4 +-
 package/weston/weston.mk                           |   9 +-
 package/x11r7/Config.in                            |   1 -
 package/x11r7/libepoxy/Config.in                   |  13 -
 package/x11r7/libepoxy/libepoxy.mk                 |  16 --
 28 files changed, 585 insertions(+), 207 deletions(-)
 create mode 100644 package/libepoxy/0001-make-egl-and-glx-conditional.patch
 create mode 100644 package/libepoxy/0002-Forward-egl-cflags-into-epoxy.pc.patch
 create mode 100644 package/libepoxy/0003-Make-egl-conditional.patch
 create mode 100644 package/libepoxy/Config.in
 create mode 100644 package/libepoxy/libepoxy.mk
 delete mode 100644 package/libgtk3/0004-Fix-undefined-reference-to-get_xkb.patch
 delete mode 100644 package/libgtk3/0005-do-not-build-extract-strings.patch
 create mode 100644 package/wayland-protocols/Config.in
 create mode 100644 package/wayland-protocols/wayland-protocols.hash
 create mode 100644 package/wayland-protocols/wayland-protocols.mk
 delete mode 100644 package/x11r7/libepoxy/Config.in
 delete mode 100644 package/x11r7/libepoxy/libepoxy.mk

-- 
2.4.10
