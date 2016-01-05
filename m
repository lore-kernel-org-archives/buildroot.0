From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue,  5 Jan 2016 11:20:24 -0300
Subject: [Buildroot] [PATCH v2 0/6] gtk3/wayland/weston bump
Message-ID: <1452003630-14516-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bump libgtk3, companion gtkmm3 and wayland/weston to latest versions.

The pangomm downgrade can be applied separately without issues.

The gtkmm3 bump is tied to the libgtk3 bump.

libgtk3 now requires an EGL backend via libepoxy, that's the upstream
take on the subject. When there's no hardware EGL support mesa with
swrast can be used (hence the reason for the libepoxy patches, to
support x11-less builds, for example for wayland).

Re-enable libgtk3 wayland support: xdg protocol is normally
version-matched among them, so in the future care must be taken when
bumping one of them to a newer major version. The failure is only
exhibited at runtime - not at build time.

Changes for v2:
 + Bump gtkmm3 as well
 + Drop target_os/host_os patch to libepoxy since it's dubious and not
   required.
 + Roll back pangomm version to stable branch.

Gustavo Zacarias (6):
  libepoxy: move outside x11r7 scope
  libgtk3: bump to version 3.18.6
  pangomm: roll back to version 2.38.1
  gtkmm3: bump to version 3.18.0
  wayland: bump to version 1.9.0
  weston: bump to version 1.9.0

 package/Config.in                                  |   1 +
 package/gtkmm3/Config.in                           |  18 ++--
 package/gtkmm3/gtkmm3.hash                         |   4 +-
 package/gtkmm3/gtkmm3.mk                           |  13 +--
 package/libepoxy/0001-Make-glx-conditional.patch   | 109 +++++++++++++++++++++
 .../0002-Forward-egl-cflags-into-epoxy.pc.patch    |  45 +++++++++
 package/{x11r7 => }/libepoxy/Config.in             |   1 -
 package/{x11r7 => }/libepoxy/libepoxy.mk           |   7 +-
 .../0004-Fix-undefined-reference-to-get_xkb.patch  |  33 -------
 .../0005-do-not-build-extract-strings.patch        |  47 ---------
 package/libgtk3/Config.in                          |  25 +++--
 package/libgtk3/libgtk3.hash                       |   4 +-
 package/libgtk3/libgtk3.mk                         |  15 +--
 package/pangomm/pangomm.hash                       |   4 +-
 package/pangomm/pangomm.mk                         |   2 +-
 package/wayland/wayland.hash                       |   4 +-
 package/wayland/wayland.mk                         |  15 +--
 package/weston/weston.hash                         |   4 +-
 package/weston/weston.mk                           |   2 +-
 package/x11r7/Config.in                            |   1 -
 20 files changed, 206 insertions(+), 148 deletions(-)
 create mode 100644 package/libepoxy/0001-Make-glx-conditional.patch
 create mode 100644 package/libepoxy/0002-Forward-egl-cflags-into-epoxy.pc.patch
 rename package/{x11r7 => }/libepoxy/Config.in (90%)
 rename package/{x11r7 => }/libepoxy/libepoxy.mk (72%)
 delete mode 100644 package/libgtk3/0004-Fix-undefined-reference-to-get_xkb.patch
 delete mode 100644 package/libgtk3/0005-do-not-build-extract-strings.patch

-- 
2.4.10
