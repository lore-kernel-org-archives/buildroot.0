From: =?UTF-8?q?J=C3=A9r=C3=B4me=20Pouiller?= <jezz@sysmic.org>
Date: Thu, 17 Nov 2016 11:00:24 +0100
Subject: [Buildroot] [PATCH 00/15] Reproducible builds
Message-ID: <1479376839-27795-1-git-send-email-jezz@sysmic.org>
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
  - since gcc versions supporting SOURCE_DATE_EPOCH are not widely available,
    external toolchains probably won't work.
  - /!\ since we build our own toolchain and toolchain include BR2_FULL_VERSION,
    ccache is incompatible with reproducible
  - debug symbols are not reproducible

Since this feature is experimental I did not (yet) reported these
incompatibilities in menuconfig.

Gilles Chanteperdrix (3):
  reproducibility: generate SOURCE_DATE_EPOCH
  reproducibility/linux: override build timestamp
  reproducibility/busybox: disable build timestamps

J?r?me Pouiller (12):
  gcc6: honor SOURCE_DATE_EPOCH
  gcc5: honor SOURCE_DATE_EPOCH
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

 Makefile                                           |   5 +
 fs/common.mk                                       |   3 +
 fs/tar/tar.mk                                      |   2 +-
 linux/linux.mk                                     |  15 ++
 package/busybox/busybox.mk                         |   6 +
 package/fakedate/fakedate                          |  28 +++
 package/fakedate/fakedate.mk                       |  14 ++
 .../gcc/5.4.0/950-honor-SOURCE_DATE_EPOCH.patch    | 213 +++++++++++++++++++
 .../gcc/6.1.0/950-honor-SOURCE_DATE_EPOCH.patch    | 234 +++++++++++++++++++++
 package/python/python.mk                           |  36 ++--
 package/python3/python3.mk                         |  35 +--
 support/dependencies/check-host-tar.sh             |   5 +-
 toolchain/toolchain/toolchain.mk                   |   4 +
 13 files changed, 570 insertions(+), 30 deletions(-)
 create mode 100755 package/fakedate/fakedate
 create mode 100644 package/fakedate/fakedate.mk
 create mode 100644 package/gcc/5.4.0/950-honor-SOURCE_DATE_EPOCH.patch
 create mode 100644 package/gcc/6.1.0/950-honor-SOURCE_DATE_EPOCH.patch

-- 
1.9.1
