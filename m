From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Tue,  3 Mar 2015 10:17:05 +0100
Subject: [Buildroot] [RFC v3 00/30]   Add per-package staging feature
Message-ID: <1425374255-6827-1-git-send-email-fabio.porcedda@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,
this patch set aims to improve build reproducibility by using a
per-package staging directory.
Also this feature aims to enable as default the top-level parallel make.

Every package instead of installing the files in the shared staging
directory (STAGING_DIR) install all files in a subdirectory of the
STAGINGPKG_DIR.

At the begginning of the configure stage, all the dependencies staging
directory are copied in the package staging directory, e.g.:

zlib-install-staging: insall files in /output/stagingpkg/zlib/

cramsfs-configure: copy all files from /output/stagingpkg/zlib/* to
  /output/stagingpkg/cramfs/

The STAGING_DIR variable is redefined for every package in order to
point to the per-package directory, so a package cannot access
automatically to staging files of packages that aren't in the
(PKG)_DENDENDENCIES variable.

The most significant changes are in the pkg-generic.mk files.

The other modifications are just to be able to access to per-package
staging directory, like adding -L$(STAGING)/usr/lib or -I$(STAGING)/usr/include

This patch set is a working in progess, but it seems to builds fine
the configuration that i mangaged to test.

TODO:
 - clean up
 - rebase over master, right now is based on the 2015.02 release (I've
   not rebased it because there are some regressions on master after
   the merge of the next branch)
 - test more packages (I've not done it, because there are already
   build problems without using this patch set, at least on Fedora 21)

For convenience this patch set is avaiable in the branch "pps-2015.02"
of the repository https://github.com/fabio-porcedda/buildroot.git

This patch set is based on the release 2015.02, it builds fine the
following configuration on a Fedora 21:
  make distclean defconfig allyespackageconfig -s && sed -e "s/BR2_PACKAGE_LUAJIT=y//" -i .config && yes '' | make oldconfig
  make BR2_JLEVEL= -j$((`getconf _NPROCESSORS_ONLN`+1))

Best regards

Fabio Porcedda (30):
  rtmpdump: use TARGET_LDFLAGS instead of TARGET_CFLAGS for XLDFLAGS
  xinetd: use TARGET_LDFLAGS in order to support per-package staging
  iproute2: use the TARGET_LDFLAGS variable
  opentyrian: use TARGET_LDFLAGS
  pppd: use TARGET_LDFLAGS
  openswan: set LDFLAGS
  exim: use TARGET_LDFLAGS
  fbv: use TARGET_LDFLAGS
  cups: use TARGET_LDFLAGS
  faifa: use TARGET_LDFLAGS
  iw: use TARGET_CONFIGURE_OPTS
  dhcpdump: use TARGET_CONFIGURE_OPTS in order to support PPS
  dtc: add add support for per-package staging directory
  openssh: add support to the per-package staging directory.
  mjpg-streamer: add support for the per-package staging directory
  tcpreplay: delay the execution of pcap-config
  erlang: add support for the per-package staging directory
  perl: don't loose the -shared flag when TARGET_LDFLAGS isn't empty
  erlang-p1-iconv: bump to a version that use TARGET_CFLAGS
  erlang-p1-zlib: bump to a version that use TARGET_CFLAGS
  lmbench: to be checked
  Makefile: add the STAGINGNOPKG_DIR variable
  gpsd: add support for per-package staging directory
  triggerhappy: add support for per-package staging directory
  ipsec-tools: add support for per-package staging directory
  pkg-cmake: add support for per-package staging directory
  pkg-luarocks: add support for per-package staging directory
  pkgconf: Move PKG_CONFIG_HOST_BINARY to Makefile.in
  pkg-generic: ADD_TOOLCHAIN_DEPENDENCY is true only for target packages
  pkg-generic: add support for per-package staging directory

 Makefile                                           |  2 +-
 package/Makefile.in                                |  4 ++
 package/cups/cups.mk                               |  1 +
 package/dhcpdump/dhcpdump.mk                       |  2 +-
 package/dtc/dtc.mk                                 |  7 +--
 package/erlang-p1-iconv/erlang-p1-iconv.mk         |  2 +-
 package/erlang-p1-zlib/erlang-p1-zlib.mk           |  2 +-
 package/erlang/erlang.mk                           |  2 +-
 package/exim/exim.mk                               |  1 +
 ...-handle-LDFLAGS-passed-to-the-configure-s.patch | 40 ++++++++++++++
 package/fbv/fbv.mk                                 |  2 +-
 package/gpsd/gpsd.mk                               |  4 +-
 package/iproute2/iproute2.mk                       |  2 +-
 package/ipsec-tools/ipsec-tools.mk                 |  2 +-
 package/iw/iw.mk                                   |  5 +-
 package/lmbench/lmbench.mk                         |  5 +-
 package/mjpg-streamer/mjpg-streamer.mk             |  3 +-
 package/openssh/openssh.mk                         |  2 +-
 package/openswan/openswan.mk                       |  3 +-
 package/opentyrian/opentyrian.mk                   |  2 +-
 package/perl/perl.mk                               |  4 +-
 package/pkg-cmake.mk                               |  7 +++
 package/pkg-generic.mk                             | 63 ++++++++++++++++++++--
 package/pkg-luarocks.mk                            |  5 +-
 package/pkgconf/pkgconf.mk                         |  2 -
 package/pppd/pppd.mk                               |  2 +-
 package/rtmpdump/rtmpdump.mk                       |  2 +-
 package/tcpreplay/tcpreplay.mk                     |  4 +-
 package/triggerhappy/triggerhappy.mk               |  2 +-
 package/xinetd/xinetd.mk                           |  1 +
 support/misc/toolchainfile.cmake.in                |  6 ++-
 31 files changed, 151 insertions(+), 40 deletions(-)
 create mode 100644 package/faifa/0001-Makefile.in-handle-LDFLAGS-passed-to-the-configure-s.patch

-- 
2.3.1
