From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sat, 26 Mar 2016 16:35:06 -0300
Subject: [Buildroot] [PATCH 0/5] Webkitgtk 2.12.x bump
Message-ID: <1459020911-20593-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This series bumps webkitgtk from the current 2.4.x series to 2.12.x and
midori to match as well.

It's a major bump that deprecates the 2.4.x series since it isn't 100%
security supported by upstream.

Patch 5 are proof-of-concept sample defconfigs that build both x11 and
wayland-based bootable images intended to run on qemu and/or real
hardware burned to pendrive media directly.

It's not supposed to be committed as-is - there's no EFI support in it
yet, just BIOS. The directory hierarchy isn't too nice either.
And documentation is missing as well.

In general it's geared towards intel-based hardware, though there are
some other drivers enabled as well mostly for video and wifi hardware.
Networking settings can be changed/set via the connman-gtk app.
Both Webkit's MiniBrowser and midori are provided, with the addition
of wireshark-gtk as another libgtk3-using application intended for
testing.
Permament/Volatile storage isn't properly implemented yet, it's only
running on volatile yet.

Gustavo Zacarias (5):
  cairo: enable opengl for cairo-gl
  webkitgtk: new package
  midori: bump to version 0.5.11
  webkitgtk24: mark as deprecated
  qemu/x86_64: add midori samples for wayland and x11r7

 board/qemu/x86_64/busybox-extras.config            |  1 +
 board/qemu/x86_64/genimage-x86_64.cfg              | 24 +++++++
 board/qemu/x86_64/grub.cfg                         | 10 +++
 board/qemu/x86_64/linux-extras.config              | 51 +++++++++++++
 .../x86_64/midori_overlay/etc/X11/xinit/xinitrc    |  3 +
 board/qemu/x86_64/midori_overlay/etc/fb.modes      |  4 ++
 .../x86_64/midori_overlay/etc/init.d/S00rootfs     |  5 ++
 .../qemu/x86_64/midori_overlay/etc/init.d/S98audio |  6 ++
 board/qemu/x86_64/midori_overlay/etc/init.d/S99gui | 21 ++++++
 board/qemu/x86_64/midori_overlay/etc/weston.ini    | 43 +++++++++++
 .../x86_64/midori_overlay/usr/share/fluxbox/init   |  7 ++
 .../x86_64/midori_overlay/usr/share/fluxbox/menu   | 29 ++++++++
 board/qemu/x86_64/post-image.sh                    | 20 ++++++
 board/qemu/x86_64/post-process.sh                  |  8 +++
 configs/midori_wayland_x86_64_defconfig            | 63 ++++++++++++++++
 configs/midori_x11_x86_64_defconfig                | 76 ++++++++++++++++++++
 package/Config.in                                  |  1 +
 package/cairo/cairo.mk                             | 10 ++-
 package/midori/0001-disable-libnotify.patch        | 43 -----------
 package/midori/0001-fix-bug-1492932.patch          | 44 ++++++++++++
 package/midori/0002-gcr-for-x11-only.patch         | 32 +++++++++
 package/midori/0002-new-vala.patch                 | 26 -------
 package/midori/Config.in                           | 36 ++++------
 package/midori/midori.hash                         |  2 +-
 package/midori/midori.mk                           | 36 +++-------
 package/{webkitgtk24 => webkitgtk}/Config.in       | 46 ++++++------
 package/webkitgtk/webkitgtk.hash                   |  4 ++
 package/webkitgtk/webkitgtk.mk                     | 83 ++++++++++++++++++++++
 package/webkitgtk24/Config.in                      |  2 +
 29 files changed, 588 insertions(+), 148 deletions(-)
 create mode 100644 board/qemu/x86_64/busybox-extras.config
 create mode 100644 board/qemu/x86_64/genimage-x86_64.cfg
 create mode 100644 board/qemu/x86_64/grub.cfg
 create mode 100644 board/qemu/x86_64/linux-extras.config
 create mode 100644 board/qemu/x86_64/midori_overlay/etc/X11/xinit/xinitrc
 create mode 100644 board/qemu/x86_64/midori_overlay/etc/fb.modes
 create mode 100755 board/qemu/x86_64/midori_overlay/etc/init.d/S00rootfs
 create mode 100755 board/qemu/x86_64/midori_overlay/etc/init.d/S98audio
 create mode 100755 board/qemu/x86_64/midori_overlay/etc/init.d/S99gui
 create mode 100644 board/qemu/x86_64/midori_overlay/etc/weston.ini
 create mode 100644 board/qemu/x86_64/midori_overlay/usr/share/fluxbox/init
 create mode 100644 board/qemu/x86_64/midori_overlay/usr/share/fluxbox/menu
 create mode 100755 board/qemu/x86_64/post-image.sh
 create mode 100755 board/qemu/x86_64/post-process.sh
 create mode 100644 configs/midori_wayland_x86_64_defconfig
 create mode 100644 configs/midori_x11_x86_64_defconfig
 delete mode 100644 package/midori/0001-disable-libnotify.patch
 create mode 100644 package/midori/0001-fix-bug-1492932.patch
 create mode 100644 package/midori/0002-gcr-for-x11-only.patch
 delete mode 100644 package/midori/0002-new-vala.patch
 copy package/{webkitgtk24 => webkitgtk}/Config.in (60%)
 create mode 100644 package/webkitgtk/webkitgtk.hash
 create mode 100644 package/webkitgtk/webkitgtk.mk

-- 
2.7.3
