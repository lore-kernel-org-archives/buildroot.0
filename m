From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Wed,  6 Nov 2013 16:34:33 +0100
Subject: [Buildroot] [PATCH v3 0/5] udev is now provided by systemd or eudev
Message-ID: <1383752078-25315-1-git-send-email-eric.le.bihan.dev@free.fr>
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
    udev. No either choice possible.
  - if busybox or SysV is chosen, the user can choose to manage /dev
    statically, or dynamically using mdev or eudev.

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

Eric Le Bihan (5):
  system: move init system option above /dev management.
  sysvinit: depend on SysV selected as init system.
  eudev: new package.
  udev: convert to virtual package.
  systemd: bump to v207.

 Config.in.legacy                                 |    8 ++
 package/Config.in                                |    1 +
 package/eudev/Config.in                          |   25 +++++++
 package/eudev/S10udev                            |   48 ++++++++++++
 package/eudev/eudev.mk                           |   50 +++++++++++++
 package/libatasmart/Config.in                    |    4 +-
 package/network-manager/Config.in                |    6 +-
 package/pcsc-lite/Config.in                      |    2 +-
 package/systemd/Config.in                        |   43 +++++++++--
 package/systemd/systemd-fix-getty-unit.patch     |   36 +++++----
 package/systemd/systemd-fix-page-size.patch      |   43 -----------
 package/systemd/systemd-uclibc-fix.patch         |   59 ---------------
 package/systemd/systemd.mk                       |   85 +++++++++++++++++-----
 package/sysvinit/Config.in                       |    1 +
 package/udev/Config.in                           |   43 +----------
 package/udev/udev.mk                             |   47 +++---------
 package/udisks/Config.in                         |    8 +-
 package/usbmount/Config.in                       |    4 +-
 package/weston/Config.in                         |    4 +-
 package/x11r7/xdriver_xf86-input-evdev/Config.in |    4 +-
 system/Config.in                                 |   81 ++++++++++++---------
 21 files changed, 326 insertions(+), 276 deletions(-)
 create mode 100644 package/eudev/Config.in
 create mode 100755 package/eudev/S10udev
 create mode 100644 package/eudev/eudev.mk
 delete mode 100644 package/systemd/systemd-fix-page-size.patch
 delete mode 100644 package/systemd/systemd-uclibc-fix.patch

--
1.7.9.5
