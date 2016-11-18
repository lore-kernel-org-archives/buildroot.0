From: =?UTF-8?q?J=C3=A9r=C3=B4me=20Pouiller?= <jezz@sysmic.org>
Date: Fri, 18 Nov 2016 10:10:09 +0100
Subject: [Buildroot] [PATCH v2 00/15] Reproducible builds
Message-ID: <1479460224-6119-1-git-send-email-jezz@sysmic.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This series try to continue work initiated by Gilles Chanteperdrix:
  http://lists.busybox.net/pipermail/buildroot/2016-April/thread.html#160064
  http://lists.busybox.net/pipermail/buildroot/2016-June/thread.html#163905

I dropped some patchs from original series because either:
  - I handled things differently (timestamps in images, support SOURCE_DATE_EPOCH
    in gcc, ...)
  - I didn't had time to test them them (sysroot, cpio, cdrkit, iso9660,...)
  - They doesn't seems necessary anymore (libtool, libgcrypt, libgpg-error, ...)

This version focuses on timestamps. It provide good enough results as soon as
OUTDIR and TOPDIR are the same. Indeed build path appear in plenty of files.
Only patch called "remove full path from .pyc" try to solve this issue. Another
big step could be done by removing rpaths from ELF generated with libtool.

Other thing known to break reproducibility:
  - use of lzop (it unconditionally include timestamps in result)
  - /!\ since we build our own toolchain and toolchain include BR2_FULL_VERSION,
    ccache is incompatible with reproducible
  - debug symbols are not reproducible

Since this feature is experimental I did not (yet) reported these
incompatibilities in menuconfig.

v2:
  - overload __TIME__ and __DATE__ instead of patching gcc
  - improve BR2_REPRODUCIBLE help text

Gilles Chanteperdrix (3):
  reproducibility: generate SOURCE_DATE_EPOCH
  reproducibility/linux: override build timestamp
  reproducibility/busybox: disable build timestamps

J?r?me Pouiller (12):
  reproducible: fix DATE/TIME macros in toolchain-wrapper
  reproducible: add '-n' to gzip invocations
  fs/tar: make results reproducible
  reproducibility/linux: inhibit build-id
  reproducible: lock modification times in $TARGET_DIR
  fakedate: new package
  reproducible: enable fakedate
  python2: generate reproducible .pyc
  python3: generate reproducible .pyc
  python2: remove full path from .pyc
  python3: remove full path from .pyc
  reproducible: improve help text

 Config.in                              |  5 +++++
 Makefile                               |  5 +++++
 fs/common.mk                           |  3 +++
 fs/tar/tar.mk                          |  2 +-
 linux/linux.mk                         | 15 ++++++++++++++
 package/busybox/busybox.mk             |  6 ++++++
 package/fakedate/fakedate              | 28 ++++++++++++++++++++++++++
 package/fakedate/fakedate.mk           | 14 +++++++++++++
 package/python/python.mk               | 36 ++++++++++++++++++++++------------
 package/python3/python3.mk             | 35 +++++++++++++++++++++------------
 support/dependencies/check-host-tar.sh |  5 ++---
 toolchain/toolchain-wrapper.c          |  9 +++++++++
 toolchain/toolchain-wrapper.mk         |  5 +++++
 toolchain/toolchain/toolchain.mk       |  4 ++++
 14 files changed, 142 insertions(+), 30 deletions(-)
 create mode 100755 package/fakedate/fakedate
 create mode 100644 package/fakedate/fakedate.mk

-- 
1.9.1
