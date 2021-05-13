From: Adrian Perez de Castro <aperez@igalia.com>
Date: Thu, 13 May 2021 19:33:19 +0300
Subject: [Buildroot] [PATCH 0/6] Update Cage, wlroots, and wayland
Message-ID: <20210513163325.1775639-1-aperez@igalia.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello!

This patch set updates Cage to 0.1.3, which by itself does not have functional
changes over the previous version, but it pulls in wlroots 0.13.0 which does
include a good number of improvements. The latter also needs a bump to the
wayland package, so that gets updated as well.

Last but not least, wlroots can now libseat to broker sessions, so three of
the patches deal with adding a package for it, installing the daemon init
scripts (if the daemon is enabled, as it is optional), and arranging for
wlroots to use libseat when available. I reckon that these three patches
dealing with libseat could be split in a separate patch set, but I opted
for including them in the series for context. It looks like libseat is
gaining momentum in the Wayland ecosystem and for example Weston can also
use it since half a year ago [1]. At any rate, let me know if you would
rather have the libseat patches in a separate submission, and I will be
happy to make it happen :)

Best regards,
-Adrian


[1] https://gitlab.freedesktop.org/wayland/weston/-/commit/6c4a993a999048a2054ec97e71d32839b312c642

Adrian Perez de Castro (6):
  package/wayland: bump to version 1.19.0
  package/wlroots: bump to version 0.13.0
  package/seatd: new package
  package/seatd: install init scripts
  package/wlroots: use libseat when available
  package/cage: bump to version 0.1.3

 package/Config.in                             |  1 +
 package/cage/cage.hash                        |  2 +-
 package/cage/cage.mk                          |  7 ++-
 ...pport-building-builtin-without-seatd.patch | 37 ++++++++++++
 package/seatd/Config.in                       | 48 ++++++++++++++++
 package/seatd/S70seatd                        | 38 +++++++++++++
 package/seatd/seatd.hash                      |  5 ++
 package/seatd/seatd.mk                        | 52 +++++++++++++++++
 ...01-build-add-option-to-disable-tests.patch | 25 ++++----
 .../0002-meson-do-not-check-for-c.patch       | 29 ----------
 ...002-meson-only-require-cpp-for-tests.patch | 57 +++++++++++++++++++
 package/wayland/wayland.hash                  |  8 +--
 package/wayland/wayland.mk                    |  2 +-
 package/wlroots/wlroots.hash                  |  4 +-
 package/wlroots/wlroots.mk                    | 12 ++--
 15 files changed, 268 insertions(+), 59 deletions(-)
 create mode 100644 package/seatd/0001-meson-Support-building-builtin-without-seatd.patch
 create mode 100644 package/seatd/Config.in
 create mode 100755 package/seatd/S70seatd
 create mode 100644 package/seatd/seatd.hash
 create mode 100644 package/seatd/seatd.mk
 delete mode 100644 package/wayland/0002-meson-do-not-check-for-c.patch
 create mode 100644 package/wayland/0002-meson-only-require-cpp-for-tests.patch

-- 
2.31.1
