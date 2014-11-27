From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 27 Nov 2014 14:00:26 -0300
Subject: [Buildroot] [PATCHv4 0/4] SystemV init without busybox series
Message-ID: <1417107630-14909-1-git-send-email-gustavo@zacarias.com.ar>
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

Changes for v4:
 * Add comment about the start-stop-daemon naming (Arnout)
 * Fixes to static builds of start-stop-daemon (Arnout)
 * Fix line wrapping style for start-stop-daemon CONF_OPTS (Arnout)
 * Fix rebuild/reinstall of ifupdown

Gustavo Zacarias (4):
  dhcp: update dhclient-script
  skeleton/S40network: tweak for debian ifupdown
  ifupdown: new package
  start-stop-daemon: new package

 package/Config.in                                  |   6 +
 package/dhcp/dhclient-script                       | 284 ++++++++++++++++++++-
 .../ifupdown/0001-dont-use-dpkg-architecture.patch |  17 ++
 package/ifupdown/Config.in                         |  17 ++
 package/ifupdown/ifupdown.hash                     |   2 +
 package/ifupdown/ifupdown.mk                       |  26 ++
 .../0001-add-uclibc-alias-and-musl.patch           |  42 +++
 package/start-stop-daemon/Config.in                |   8 +
 package/start-stop-daemon/start-stop-daemon.hash   |   2 +
 package/start-stop-daemon/start-stop-daemon.mk     |  36 +++
 system/skeleton/etc/init.d/S40network              |   3 +
 11 files changed, 442 insertions(+), 1 deletion(-)
 create mode 100644 package/ifupdown/0001-dont-use-dpkg-architecture.patch
 create mode 100644 package/ifupdown/Config.in
 create mode 100644 package/ifupdown/ifupdown.hash
 create mode 100644 package/ifupdown/ifupdown.mk
 create mode 100644 package/start-stop-daemon/0001-add-uclibc-alias-and-musl.patch
 create mode 100644 package/start-stop-daemon/Config.in
 create mode 100644 package/start-stop-daemon/start-stop-daemon.hash
 create mode 100644 package/start-stop-daemon/start-stop-daemon.mk

-- 
2.0.4
