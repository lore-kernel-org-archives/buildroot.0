From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 24 May 2013 01:12:50 +0200
Subject: [Buildroot] [RFCv3] New version of the out-of-tree build support
Message-ID: <1369350770-7996-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Here is a new version of the per-package out-of-tree support. I think
I've made some good progress. I'm now working on getting an
allyespackageconfig to build. The issue I've stopped at tonight is
related to hooks that are part of steps prior to the configure
step. Those hooks used to be separate for host and target packages,
and now they are the same since the source tree is shared between host
and target packages. The problem is not very complicated, I'm hoping
to fix that soon.

I am not sendinf the 50 patches on the list, since it's still a
RFC. If you want to see the current status, have a look at:

  http://git.free-electrons.com/users/thomas-petazzoni/buildroot/log/?h=out-of-tree-v3

If you want to see the important modifications, i.e the one on the
package infrastructure, you should look at:

  package: fix <pkg>_SRCDIR and <pkg>_BUILDDIR values
  package: prepare removal of <pkg>_DIR
  package: kill the <pkg>_DIR variable
  package: add an intermediate step called 'prepare'
  package/autotools: move autoreconf in the 'prepare' step
  package/autotools: refactor the libtool patching logic
  package/autotools: simplify the libtool patching logic
  package: switch to out-of-tree build

This last one being of course the most important one.

Thomas Petazzoni (50):
  packages: Use @D where possible
  package: fix <pkg>_SRCDIR and <pkg>_BUILDDIR values
  Introduce a global SRC_DIR variable
  package: prepare removal of <pkg>_DIR
  iw: fix to use <pkg>_BUILDDIR and <pkg>_SRCDIR instead of <pkg>_DIR
  owl-linux: fix to use <pkg>_BUILDDIR and <pkg>_SRCDIR instead of
    <pkg>_DIR
  linux-fusion: fix to use <pkg>_BUILDDIR and <pkg>_SRCDIR instead of
    <pkg>_DIR
  hostapd: fix to use <pkg>_BUILDDIR instead of <pkg>_DIR
  gst-fsl-plugins: use <pkg>_SRCDIR instead of <pkg>_DIR
  wpa_supplicant: use <pkg>_BUILDDIR instead of <pkg>_DIR
  busybox: use <pkg>_BUILDDIR instead of <pkg>_DIR
  python3:use <pkg>_BUILDDIR and <pkg>_SRCDIR instead of <pkg>_DIR
  rp-pppoe:use <pkg>_BUILDDIR and <pkg>_SRCDIR instead of <pkg>_DIR
  python: use <pkg>_BUILDDIR and <pkg>_SRCDIR instead of <pkg>_DIR
  dbus: use <pkg>_BUILDDIR and <pkg>_SRCDIR instead of <pkg>_DIR
  rtai: use <pkg>_BUILDDIR and <pkg>_SRCDIR instead of <pkg>_DIR
  perf: use <pkg>_BUILDDIR and <pkg>_SRCDIR instead of <pkg>_DIR
  lttng-modules: use <pkg>_BUILDDIR and <pkg>_SRCDIR instead of
    <pkg>_DIR
  icu: use <pkg>_BUILDDIR and <pkg>_SRCDIR instead of <pkg>_DIR
  imx-lib: use <pkg>_BUILDDIR and <pkg>_SRCDIR instead of <pkg>_DIR
  igh-ethercat: use <pkg>_BUILDDIR and <pkg>_SRCDIR instead of
    <pkg>_DIR
  urg: fix to use <pkg>_SRCDIR instead of <pkg>_DIR
  package: kill the <pkg>_DIR variable
  pkgconf: doesn't support out of tree build
  attr: doesn't support out of tree build
  python: fix out of tree build issues
  busybox: don't copy .config file in a post-extract hook
  package: add an intermediate step called 'prepare'
  package/autotools: move autoreconf in the 'prepare' step
  package/autotools: refactor the libtool patching logic
  package/autotools: simplify the libtool patching logic
  autoconf: fix out-of-tree build
  package: switch to out-of-tree build
  busybox: support out of tree build
  mtd: support out of tree build
  barebox: support out of tree build
  uboot: support out of tree build
  cmake: support out of tree build
  makedevs: support out of tree build
  qt: add out of tree build support
  pkg-stats: generate stats for out of tree support
  jquery: support out of tree
  jquery-validation: support out of tree
  jquery-sparkline: support out of tree
  liberation: support out of tree
  linux-firmware: support out of tree
  linux: support out of tree build
  speex: remove useless BUILD_CMDS
  acl: doesn't support out of tree build
  berkeleydb: fix for out of tree build

 Makefile                                           |    9 +-
 ...-build-when-source-directory-is-read-only.patch |   42 +++++
 boot/barebox/barebox.mk                            |    7 +-
 boot/uboot/uboot.mk                                |    7 +-
 linux/linux.mk                                     |   47 +++--
 package/acl/acl.mk                                 |    4 +
 package/attr/attr.mk                               |    5 +
 package/autoconf/autoconf.mk                       |   10 ++
 package/bash/bash.mk                               |    2 +-
 package/berkeleydb/berkeleydb.mk                   |   36 ++--
 package/busybox/busybox.mk                         |   24 +--
 package/cmake/cmake.mk                             |    4 +-
 package/dbus/dbus.mk                               |    2 +-
 package/dhcp/dhcp.mk                               |    4 +-
 package/dmalloc/dmalloc.mk                         |    2 +-
 package/dnsmasq/dnsmasq.mk                         |   12 +-
 package/fbv/fbv.mk                                 |    2 +-
 package/file/file.mk                               |    2 +-
 package/hostapd/hostapd.mk                         |    2 +-
 package/icu/icu.mk                                 |    2 +-
 package/igh-ethercat/igh-ethercat.mk               |    2 +-
 package/imx-lib/imx-lib.mk                         |    6 +-
 package/iostat/iostat.mk                           |    4 +-
 package/iproute2/iproute2.mk                       |   10 +-
 package/iw/iw.mk                                   |    2 +-
 package/jquery-sparkline/jquery-sparkline.mk       |    4 +-
 package/jquery-validation/jquery-validation.mk     |    4 +-
 package/jquery/jquery.mk                           |    4 +-
 package/kismet/kismet.mk                           |    4 +-
 package/liberation/liberation.mk                   |    8 +-
 package/liblockfile/liblockfile.mk                 |    2 +-
 package/linux-firmware/linux-firmware.mk           |    4 +-
 package/linux-fusion/linux-fusion.mk               |    4 +-
 package/lsof/lsof.mk                               |    2 +-
 package/lttng-modules/lttng-modules.mk             |    4 +-
 package/makedevs/makedevs.mk                       |    2 +
 .../matchbox/matchbox-fakekey/matchbox-fakekey.mk  |    2 +-
 package/mdadm/mdadm.mk                             |    6 +-
 package/mtd/mtd.mk                                 |    8 +-
 .../multimedia/gst-fsl-plugins/gst-fsl-plugins.mk  |    2 +-
 package/nanocom/nanocom.mk                         |    2 +-
 package/ncftp/ncftp.mk                             |    2 +-
 package/ncurses/ncurses.mk                         |   20 +--
 package/netkitbase/netkitbase.mk                   |    4 +-
 package/owl-linux/owl-linux.mk                     |    4 +-
 package/pciutils/pciutils.mk                       |    8 +-
 package/perf/perf.mk                               |    8 +-
 package/php/php.mk                                 |    2 +-
 package/pkg-autotools.mk                           |   93 ++++------
 package/pkg-cmake.mk                               |    8 +-
 package/pkg-generic.mk                             |  183 ++++++++++++--------
 package/pkgconf/pkgconf.mk                         |    4 +
 package/pppd/pppd.mk                               |   36 ++--
 package/prboom/prboom.mk                           |    2 +-
 ...7-015-distutils-cross-compilation-support.patch |   22 +--
 .../python/python-2.7-017-out-of-tree-fix.patch    |   31 ++++
 package/python/python.mk                           |    4 +-
 package/python3/python3.mk                         |    8 +-
 package/qt/qt.mk                                   |   12 +-
 package/rp-pppoe/rp-pppoe.mk                       |    4 +-
 package/rtai/rtai.mk                               |    2 +-
 package/samba/samba.mk                             |    4 +-
 package/speex/speex.mk                             |    4 -
 package/tn5250/tn5250.mk                           |    2 +-
 package/urg/urg.mk                                 |    6 +-
 package/wpa_supplicant/wpa_supplicant.mk           |    2 +-
 support/scripts/pkg-stats                          |   40 +++++
 67 files changed, 493 insertions(+), 333 deletions(-)
 create mode 100644 boot/barebox/barebox-genenv-fix-build-when-source-directory-is-read-only.patch
 create mode 100644 package/python/python-2.7-017-out-of-tree-fix.patch

-- 
1.7.9.5
