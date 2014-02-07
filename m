From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Fri,  7 Feb 2014 14:21:31 +0100
Subject: [Buildroot] [PATCH v7 0/4] udev is now provided by systemd or eudev
Message-ID: <1391779295-19140-1-git-send-email-eric.le.bihan.dev@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This series converts udev to a virtual package, either provided by systemd or
eudev.

Starting with version 183, udev has been merged into systemd. This forces the
use of systemd as the init system if /dev is to be dynamically managed by
udev. eudev is a fork of udev, maintained by Gentoo, but isolated from
systemd, so it can be used with any init system.

Systemd has been bumped to v207 and a new eudev package has been added.
Version 1.3 of eudev is in sync with systemd v207.

The bump of systemd to v207 also introduces new options, like the activation
of the journal gateway.

In the end:

  - if systemd is selected as init system, the /dev management will handled by
    udev. No other choice possible.
  - if busybox or SysV is chosen, the user can choose to manage /dev
    statically, or dynamically using mdev or eudev.

Changes v6 -> v7:
  - updated udev related symbols and improved help text in Config.in.legacy
    (suggested by ThomasDS).
  - removed redundant comments on dependencies for systemd and eudev
    (suggested by ThomasDS).
  - fixed packages not properly converted to BR2_PACKAGE_HAS_UDEV
    (reported by SamuelM).

Changes v5 -> v6:
  - fixed packages not properly converted to BR2_PACKAGE_HAS_UDEV
    (reported by Samuel M.).
  - forced inotify support in Linux if eudev is used for /dev management.
  - forced inotify support in Linux if systemd is used as init system.
  - updated information about systemd requirements.

Changes v4 -> v5:
  - disabled systemd and eudev on avr32.
  - reverted Busybox binaries overwrite fix.

Changes v3 -> v4:
  - updated /dev management section in user manual.
  - fixed indentation of conditionals in Makefiles (suggested by Thomas P).
  - added missing comments on dependencies (suggested by Thomas P, Thomas DS).
  - fixed some packages not being converted to BR2_PACKAGE_HAS_UDEV.

Changes v2 -> v3:
  - reordered patches for better bisectability (suggested by Thomas).
  - removed uClibc support for Systemd (suggested by Arnout).
  - bumped systemd to v207 (no more backport patches).
  - bumped eudev to 1.3.

Changes v1 -> v2:
  - split patch for better readability.
  - promoted init system selection above /dev management in "System
    Configuration" menu.
  - /dev management selection is not displayed if systemd is chosen as init
    system, as udev is the only possible choice (suggested by Arnout).
  - added "Dynamic with eudev" choice in /dev management selection.
  - less patches for systemd/uclibc compatibility, thanks to recent update of
    uclibc 0.9.33.2.
  - autoreconf not needed anymore for systemd (thanks to removal of
    configure.ac patch).
  - ACL/Gudev support in systemd activated only if acl/libglib2 are
    selected (suggested by Arnout).
  - udev package provides BR2_PACKAGE_HAS_UDEV (suggested by Thomas).
  - converted packages depending on
    BR2_PACKAGE_UDEV/BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_UDEV to
    BR2_PACKAGE_HAS_UDEV.
  - eudev source code fetched as a tarball, not from Git tree (suggested by
    Arnout).
  - removed "enable all extras" option from eudev configuration: Gudev support
    is activated if libglib2 is selected (suggested by Arnout).
  - added option to build udev rule generator in eudev, as it was in previous
    version of udev.
  - removed dependency on hwdata for systemd and eudev, as both embed their
    own hardware database.

Best regards,
ELB

Eric Le Bihan (4):
  eudev: new package.
  udev: convert to virtual package.
  systemd: bump to v207.
  manual: update /dev management section.

 Config.in.legacy                                   |   64 +++++++++++++
 docs/manual/adding-packages-directory.txt          |    3 +-
 docs/manual/configure.txt                          |   20 ++--
 linux/linux.mk                                     |    5 +-
 package/Config.in                                  |    1 +
 package/ccid/ccid.mk                               |    2 +-
 package/eudev/Config.in                            |   38 ++++++++
 package/{udev => eudev}/S10udev                    |    2 +-
 package/eudev/eudev.mk                             |   43 +++++++++
 package/gpsd/gpsd.mk                               |    2 +-
 package/libatasmart/Config.in                      |    4 +-
 package/libcec/libcec.mk                           |    2 +-
 package/libdrm/libdrm.mk                           |    2 +-
 package/libmbim/Config.in                          |    5 +-
 package/libusb/libusb.mk                           |    2 +-
 package/modem-manager/Config.in                    |    6 +-
 package/network-manager/Config.in                  |    8 +-
 package/ofono/ofono.mk                             |    2 +-
 package/pcsc-lite/Config.in                        |    2 +-
 package/pcsc-lite/pcsc-lite.mk                     |    2 +-
 package/pulseaudio/pulseaudio.mk                   |    2 +-
 package/systemd/Config.in                          |   47 +++++++++-
 package/systemd/systemd-fix-getty-unit.patch       |   36 ++++---
 package/systemd/systemd-fix-page-size.patch        |   43 ---------
 package/systemd/systemd-uclibc-fix.patch           |   59 ------------
 package/systemd/systemd.mk                         |   98 ++++++++++++++------
 package/udev/Config.in                             |   51 +---------
 package/udev/udev.mk                               |   47 ++--------
 package/udisks/Config.in                           |   14 +--
 package/usbmount/Config.in                         |    4 +-
 package/vlc/vlc.mk                                 |    2 +-
 package/weston/Config.in                           |    4 +-
 package/x11r7/xdriver_xf86-input-evdev/Config.in   |    4 +-
 .../xserver_xorg-server/xserver_xorg-server.mk     |    2 +-
 package/xenomai/xenomai.mk                         |    2 +-
 system/Config.in                                   |   42 ++++-----
 36 files changed, 361 insertions(+), 311 deletions(-)
 create mode 100644 package/eudev/Config.in
 copy package/{udev => eudev}/S10udev (98%)
 create mode 100644 package/eudev/eudev.mk
 delete mode 100644 package/systemd/systemd-fix-page-size.patch
 delete mode 100644 package/systemd/systemd-uclibc-fix.patch

-- 
1.7.9.5
