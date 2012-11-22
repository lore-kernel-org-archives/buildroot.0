From: Samuel Martin <s.martin49@gmail.com>
Date: Thu, 22 Nov 2012 01:17:50 +0100
Subject: [Buildroot] [PATCH 00/33] Pull request for 2012.11/bug-fixes
Message-ID: <1353543503-8952-1-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

Here is a bug fixes series which targets the 2012.11 released.

Series detail:
- Patches 1 to 16 are random package fixes (help text/source urls/build fixes);
- Patch 17 is linux-fusion package update, which fix directfb build;
- Patch 18 is a python security update;
- Patch 19 is an improvement for the download infrastructure;
- Patch 20 enables rrdtool python bindings;
- Patch 21-33 add license info to most of the packages touched by this series.

IMO, patches 1 to 18 can be integrated for the 2012.11 release.

Patch 19 is more open to be discussed, somehow making echo to what has been
said during the lastest BR dev days.

Patch 20 can be merged in the next branch.


Yours,


Samuel Martin (33):
  libecore: fix build with glibc >=2.16
  libpcap: add pcap.pc file
  tcpdump: use 'pkg-config pcap' instead of pcap-config
  igh-ethercat: disable drivers build with kernel 3.6
  imagemagick: explicitly disable c++ support if no c++ compiler
    available
  sylpheed: fix build disabling gpgme support
  fluxbox: fix build against imlib2
  owl-linux: update help text about linux kernel dependencies.
  linux-fusion: fix build
  ltp-testsuite: add warning about bessel function support if uclibc
    toolchain
  ltp-testsuite: fix build on uClibc exp10
  sconeserver: fix configure.in
  sconeserver: fix imagemagick dependency
  dependencies: build a host python2 if no suitable one can be found
  scons: force to use python2 on the host
  libmad: do not install mad.pc on the target
  matchbox packages: fix broken urls
  linux-fusion: bump to version 8.10.4
  python2: bump to 2.7.3
  pkg-download.mk: add tarball check in the wget method
  rrdtool: add python binding support
  libmad: add license info
  scons: add license info
  efl packages: add license info
  fluxbox: add license info
  igh-ethercat: add license info
  imagemagick: add license info
  imlib2: add license info
  ltp-testsuite: add license info
  matchbox packages: add license info
  owl-linux: add license info
  rrdtool: add license info
  sylpheed: add license info

 package/efl/expedite/expedite.mk                   |  3 +
 ...ecore-ecore_exe-fix-build-with-glibc-2-16.patch | 94 ++++++++++++++++++++++
 package/efl/libecore/libecore.mk                   |  3 +
 package/efl/libedbus/libedbus.mk                   |  3 +
 package/efl/libedje/libedje.mk                     |  3 +
 package/efl/libeet/libeet.mk                       |  3 +
 package/efl/libefreet/libefreet.mk                 |  3 +
 package/efl/libeina/libeina.mk                     |  3 +
 package/efl/libelementary/libelementary.mk         |  3 +
 package/efl/libembryo/libembryo.mk                 |  3 +
 package/efl/libethumb/libethumb.mk                 |  3 +
 package/efl/libevas/libevas.mk                     |  3 +
 package/fluxbox/fluxbox-fix-configure.patch        | 19 +++++
 package/fluxbox/fluxbox.mk                         |  8 +-
 package/igh-ethercat/Config.in                     |  7 +-
 package/igh-ethercat/igh-ethercat.mk               |  4 +
 package/imagemagick/imagemagick.mk                 |  9 +++
 package/imlib2/imlib2.mk                           |  4 +-
 package/libmad/libmad.mk                           |  8 +-
 package/libpcap/libpcap.mk                         | 10 +++
 package/libpcap/pcap.pc                            | 12 +++
 .../linux-fusion/linux-fusion-fix-include.patch    | 43 ++++++++++
 package/linux-fusion/linux-fusion.mk               |  2 +-
 package/ltp-testsuite/Config.in                    |  4 +
 ...tsuite-20101031-fix-build-on-uClibc-exp10.patch | 22 +++++
 package/ltp-testsuite/ltp-testsuite.mk             |  2 +
 .../matchbox/matchbox-common/matchbox-common.mk    |  9 ++-
 .../matchbox/matchbox-desktop/matchbox-desktop.mk  |  8 +-
 .../matchbox/matchbox-fakekey/matchbox-fakekey.mk  |  3 +
 .../matchbox-keyboard/matchbox-keyboard.mk         |  5 +-
 package/matchbox/matchbox-lib/matchbox-lib.mk      |  5 +-
 package/matchbox/matchbox-panel/matchbox-panel.mk  |  9 ++-
 .../matchbox-startup-monitor.mk                    |  3 +
 package/matchbox/matchbox-wm/matchbox-wm.mk        |  5 +-
 package/owl-linux/Config.in                        |  2 +
 package/owl-linux/owl-linux.mk                     |  2 +
 package/pkg-download.mk                            | 13 ++-
 package/python/python-2.7-009-python-symlink.patch | 25 ------
 .../python-2.7-100-optional-test-modules.patch     |  3 +-
 package/python/python-2.7-101-optional-pydoc.patch |  3 +-
 package/python/python-2.7-102-optional-2to3.patch  | 12 +--
 .../python/python-2.7-103-optional-sqlite.patch    | 31 ++++++-
 package/python/python-2.7-104-optional-tk.patch    |  3 +-
 .../python/python-2.7-105-optional-curses.patch    |  3 +-
 package/python/python-2.7-106-optional-expat.patch |  3 +-
 package/python/python-2.7-110-optional-db.patch    |  7 +-
 package/python/python.mk                           |  2 +-
 package/rrdtool/Config.in                          |  8 ++
 package/rrdtool/rrdtool-fix-python-includes.patch  | 29 +++++++
 package/rrdtool/rrdtool.mk                         | 22 ++++-
 package/sconeserver/Config.in                      |  3 +
 ...-dependency-use-pkg-config-instead-of-Mag.patch | 41 ++++++++++
 ...n-do-not-hardcode-mysql-include-directory.patch | 27 +++++++
 package/sconeserver/sconeserver.mk                 |  4 +-
 package/scons/scons.mk                             |  8 +-
 package/sylpheed/sylpheed.mk                       |  4 +-
 ...ump-use-pkg-config-instead-of-pcap-config.patch | 68 ++++++++++++++++
 package/tcpdump/tcpdump.mk                         |  3 +-
 support/dependencies/check-host-python2.mk         |  6 ++
 support/dependencies/check-host-python2.sh         | 13 +++
 support/dependencies/dependencies.sh               |  2 +-
 61 files changed, 599 insertions(+), 76 deletions(-)
 create mode 100644 package/efl/libecore/libecore-ecore_exe-fix-build-with-glibc-2-16.patch
 create mode 100644 package/fluxbox/fluxbox-fix-configure.patch
 create mode 100644 package/libpcap/pcap.pc
 create mode 100644 package/linux-fusion/linux-fusion-fix-include.patch
 create mode 100644 package/ltp-testsuite/ltp-testsuite-20101031-fix-build-on-uClibc-exp10.patch
 delete mode 100644 package/python/python-2.7-009-python-symlink.patch
 create mode 100644 package/rrdtool/rrdtool-fix-python-includes.patch
 create mode 100644 package/sconeserver/sconeserver-180-ImageMagick-dependency-use-pkg-config-instead-of-Mag.patch
 create mode 100644 package/sconeserver/sconeserver-180-configure.in-do-not-hardcode-mysql-include-directory.patch
 create mode 100644 package/tcpdump/tcpdump-use-pkg-config-instead-of-pcap-config.patch
 create mode 100644 support/dependencies/check-host-python2.mk
 create mode 100755 support/dependencies/check-host-python2.sh

--
1.8.0
