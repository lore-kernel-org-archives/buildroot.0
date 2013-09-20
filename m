From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Fri, 20 Sep 2013 14:24:01 +0200
Subject: [Buildroot] [PATCH v2 0/6] package: udev is now provided by systemd
	or eudev
Message-ID: <1379679847-16141-1-git-send-email-eric.le.bihan.dev@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello!

This series converts udev to a virtual package, either provided by systemd or
eudev.

Starting with version 183, udev has been merged into systemd. This forces the
use of systemd as the init system if /dev is to be dynamically managed by
udev. eudev is a fork of udev, maintained by Gentoo, but isolated from
systemd, so it can be used with any init system.

Systemd has been bumped to v206 and a new eudev package has been added.
Version 1.2 of eudev is in sync with systemd v206 (v1.3 will be in sync with
v207).

The bump of systemd to v206 also introduces new options, like the activation
of the journal gateway.

In the end:

  - if systemd is selected as init system, the /dev management will handled by
    udev. No either choice possible.
  - if busybox or SysV is chosen, the user can choose to manage /dev
    statically, or dynamically using mdev or eudev.

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

Eric Le Bihan (6):
  system: move init system option above /dev management.
  sysvinit: depend on SysV selected as init system.
  systemd: bump to v206.
  systemd: set correct firmware search path
  package: update dependency on udev.
  eudev: new package.

 Config.in.legacy                                   |    7 ++
 package/Config.in                                  |    1 +
 package/eudev/Config.in                            |   26 ++++++
 package/eudev/S10udev                              |   48 +++++++++++
 package/eudev/eudev.mk                             |   50 ++++++++++++
 package/libatasmart/Config.in                      |    4 +-
 package/network-manager/Config.in                  |    6 +-
 package/pcsc-lite/Config.in                        |    2 +-
 package/systemd/Config.in                          |   36 +++++++--
 package/systemd/systemd-fix-getty-unit.patch       |   36 ++++-----
 package/systemd/systemd-fix-page-size.patch        |   43 ----------
 .../systemd/systemd-optional-secure-getenv.patch   |   20 +++++
 package/systemd/systemd-uclibc-fix.patch           |   59 --------------
 ...systemd-use-cap_mknod-conditioncapability.patch |   26 ++++++
 package/systemd/systemd.mk                         |   83 +++++++++++++++-----
 package/sysvinit/Config.in                         |    1 +
 package/udev/Config.in                             |   43 +---------
 package/udev/udev.mk                               |   49 +++---------
 package/udisks/Config.in                           |    8 +-
 package/usbmount/Config.in                         |    4 +-
 package/weston/Config.in                           |    4 +-
 package/x11r7/xdriver_xf86-input-evdev/Config.in   |    4 +-
 system/Config.in                                   |   68 ++++++++--------
 23 files changed, 352 insertions(+), 276 deletions(-)
 create mode 100644 package/eudev/Config.in
 create mode 100644 package/eudev/S10udev
 create mode 100644 package/eudev/eudev.mk
 delete mode 100644 package/systemd/systemd-fix-page-size.patch
 create mode 100644 package/systemd/systemd-optional-secure-getenv.patch
 delete mode 100644 package/systemd/systemd-uclibc-fix.patch
 create mode 100644 package/systemd/systemd-use-cap_mknod-conditioncapability.patch

--
1.7.9.5
