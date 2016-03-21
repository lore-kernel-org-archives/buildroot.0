From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 21 Mar 2016 09:05:46 -0300
Subject: [Buildroot] [PATCH v4 0/2] gtk3 bump
Message-ID: <1458561948-13971-1-git-send-email-gustavo@zacarias.com.ar>
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

Changes for v4:
 + Only libgtk3/gtkmm3 patches remain, the rest applied
 + Bump to libgtk3 3.18.9
 + Drop choice comment from libgtk3 commit msg

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

Gustavo Zacarias (2):
  libgtk3: bump to version 3.18.9
  gtkmm3: bump to version 3.18.0

 package/gtkmm3/Config.in                           | 18 +++--
 package/gtkmm3/gtkmm3.hash                         |  4 +-
 package/gtkmm3/gtkmm3.mk                           | 13 +---
 .../0004-Fix-undefined-reference-to-get_xkb.patch  | 33 --------
 .../0005-do-not-build-extract-strings.patch        | 47 ------------
 package/libgtk3/Config.in                          | 88 +++++++++++++---------
 package/libgtk3/libgtk3.hash                       |  4 +-
 package/libgtk3/libgtk3.mk                         | 15 +---
 8 files changed, 71 insertions(+), 151 deletions(-)
 delete mode 100644 package/libgtk3/0004-Fix-undefined-reference-to-get_xkb.patch
 delete mode 100644 package/libgtk3/0005-do-not-build-extract-strings.patch

-- 
2.7.3
