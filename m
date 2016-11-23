From: =?UTF-8?q?J=C3=A9r=C3=B4me=20Pouiller?= <jezz@sysmic.org>
Date: Wed, 23 Nov 2016 13:58:39 +0100
Subject: [Buildroot] [PATCH v4 00/18] Reproducible builds
Message-ID: <1479905937-17241-1-git-send-email-jezz@sysmic.org>
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

Since this feature is experimental I did not (yet) reported these
incompatibilities in menuconfig.

Gilles Chanteperdrix (3):
  reproducibility: generate SOURCE_DATE_EPOCH
  reproducibility/linux: override build timestamp
  reproducibility/busybox: disable build timestamps

J?r?me Pouiller (15):
  reproducible: fix DATE/TIME macros in toolchain-wrapper
  reproducible: add '-n' to gzip invocations
  fs/tar: make results reproducible
  reproducibility/linux: inhibit build-id
  reproducible: lock modification times in $TARGET_DIR
  fakedate: new package
  core: do not reset DEPENDENCIES_HOST_PREREQ in dependencies.mk
  reproducible: enable fakedate
  pycompile: allow to force compilation
  python2: generate reproducible .pyc
  python3: generate reproducible .pyc
  python2: remove full path from .pyc
  python3: remove full path from .pyc
  reproducible: improve help text
  reproducible: fix coding style

 Config.in                            |  6 +++
 Makefile                             | 12 ++++--
 fs/common.mk                         |  3 ++
 fs/tar/tar.mk                        |  3 +-
 linux/linux.mk                       | 15 ++++++++
 package/busybox/busybox.mk           |  6 +++
 package/fakedate/fakedate            | 59 ++++++++++++++++++++++++++++
 package/fakedate/fakedate.mk         | 15 ++++++++
 package/python/python.mk             | 15 ++++++--
 package/python3/python3.mk           | 15 ++++++--
 support/dependencies/dependencies.mk |  2 -
 support/scripts/pycompile.py         | 11 +++++-
 toolchain/toolchain-wrapper.c        | 74 +++++++++++++++++++++++++++++++++++-
 13 files changed, 222 insertions(+), 14 deletions(-)
 create mode 100755 package/fakedate/fakedate
 create mode 100644 package/fakedate/fakedate.mk

-- 
1.9.1
