From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 18 Nov 2014 14:01:48 -0300
Subject: [Buildroot] [PATCHv3 0/9] SystemV init without busybox series
Message-ID: <1416330117-4458-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This is a patch series that enables busybox-less systemV-init targets
to be built.
It contains fixes that enable it to work seamlessly, some new packages
and a couple of non essential/related bumps.

It's missing documentation on the recommended packages for a normal
boot to take place without any errors or warnings for a default busybox
skeleton.

* debianutils provides run-parts for ifupdown
* ifupdown provides ifup/ifdown
* start-stop-daemon provides start-stop-daemon (sic)

Changes for v2:
 * Drop uclibc wordexp enablement and disable ifupdown for it
 * Add start-stop-daemon package
 * Add useful dhclient-script for ISC dhcp
 * Install dhclient (ISC dhcp) to /sbin for debian ifupdown
 * dhcpcd: install dhcpcd-hooks for PnP simplicity
 * sysvinit: drop tty1/2 for consistency
 * Misc style fixes

Changes for v3:
 * Adjust start-stop-daemon license (Karoly)
 * Fix pathspecs for dhcp clients in network-manager (Arnout)
 * Drop symlink check in S40network (Arnout)
 * Use make install in ifupdown (Arnout)
 * Update dhcpcd to version 6.6.2
 * Ditch dash 0.5.8-2 bump, it's pointless (Peter)

Gustavo Zacarias (9):
  skeleton/S40network: tweak for debian ifupdown
  debianutils: new package
  ifupdown: new package
  start-stop-daemon: new package
  dhcp: install dhclient to /sbin
  dhcp: update dhclient-script
  dhcpcd: bump to version 6.6.2
  dhcpcd: use standard installation
  network-manager: adjust dhclient and dhcpcd directories

 package/Config.in                                  |   7 +
 package/debianutils/Config.in                      |   7 +
 package/debianutils/debianutils.hash               |   2 +
 package/debianutils/debianutils.mk                 |  14 +
 package/dhcp/dhclient-script                       | 284 ++++++++++++++++++++-
 package/dhcp/dhcp.mk                               |   2 +-
 package/dhcpcd/dhcpcd.hash                         |   2 +
 package/dhcpcd/dhcpcd.mk                           |   9 +-
 package/ifupdown/Config.in                         |  17 ++
 package/ifupdown/ifupdown.hash                     |   2 +
 package/ifupdown/ifupdown.mk                       |  24 ++
 package/network-manager/network-manager.mk         |   4 +-
 .../0001-add-uclibc-alias-and-musl.patch           |  42 +++
 package/start-stop-daemon/Config.in                |   8 +
 package/start-stop-daemon/start-stop-daemon.hash   |   2 +
 package/start-stop-daemon/start-stop-daemon.mk     |  27 ++
 system/skeleton/etc/init.d/S40network              |   3 +
 17 files changed, 445 insertions(+), 11 deletions(-)
 create mode 100644 package/debianutils/Config.in
 create mode 100644 package/debianutils/debianutils.hash
 create mode 100644 package/debianutils/debianutils.mk
 create mode 100644 package/dhcpcd/dhcpcd.hash
 create mode 100644 package/ifupdown/Config.in
 create mode 100644 package/ifupdown/ifupdown.hash
 create mode 100644 package/ifupdown/ifupdown.mk
 create mode 100644 package/start-stop-daemon/0001-add-uclibc-alias-and-musl.patch
 create mode 100644 package/start-stop-daemon/Config.in
 create mode 100644 package/start-stop-daemon/start-stop-daemon.hash
 create mode 100644 package/start-stop-daemon/start-stop-daemon.mk

-- 
2.0.4
