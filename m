From: Mike Williams <mike@mikebwilliams.com>
Date: Tue, 21 Apr 2015 13:50:33 -0400
Subject: [Buildroot] [PATCH 0/5] systemd service file cleanups
Message-ID: <1429638638-28695-1-git-send-email-mike@mikebwilliams.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

All,

This set of patches fixes and cleans up some systemd service files for various packages.

avahi was build-tested on both systemd and busybox init. psplash started but failed due to lack of a framebuffer on my device. rsyslog, ofono, and connman appeared to be working correctly.

The previous versions of this series also moved the systemd installation location, and fixed a number of packages' udev rules installation directory. For now, I recommend those patches be dropped. When systemd is built to be installed in its default directory, it no longer searches /lib/udev for rules as the upstream default is /usr/lib/udev.

Unfortunately, it appears that either many packages are built assuming an un-split /usr/lib and /lib, or they are only tested on systems where systemd is installed to /lib when the split exists. I'm not sure its worth the effort to patch all of these upstream packages, and I instead recommend that we merge /lib and /usr/lib for systemd systems.

Finally, the gpsd patch has been dropped for now because it was attempting to incorrectly interact with the host systemd.

Mike Williams (5):
  avahi: systemd cleanups
  psplash: move systemd service files to /usr/lib
  rsyslog: fix systemd service installation
  ofono: enable systemd service by default
  connman: enable systemd service by default

 package/avahi/0002-disable-systemd-support.patch | 22 ----------------------
 package/avahi/avahi.mk                           | 12 ++++++++++--
 package/connman/connman.mk                       |  5 +++++
 package/ofono/ofono.mk                           |  6 ++++++
 package/psplash/psplash.mk                       |  8 ++++----
 package/rsyslog/rsyslog.mk                       |  7 ++++---
 6 files changed, 29 insertions(+), 31 deletions(-)
 delete mode 100644 package/avahi/0002-disable-systemd-support.patch

-- 
2.1.4
