From: Philippe Proulx <eeppeliteloop@gmail.com>
Date: Sat, 29 Oct 2016 14:03:34 -0400
Subject: [Buildroot] [PATCH 0/5] Update LTTng packages to 2.8.x and
	Babeltrace to 1.4.0
Message-ID: <20161029180339.24535-1-eeppeliteloop@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch set updates the LTTng packages to the 2.8-series. It also
updates Babeltrace to 1.4.x, which supports printing debug information
from LTTng traces when elfutils is available.

A host lttng-babeltrace is not built anymore with this patch set. I
believe this is not necessary. Babeltrace is packaged for pretty much
all the major Linux distributions, so if a developer needs the tool on
the host side, it's easy to get.

I also added the `--enable-python-agent` configure option to
lttng-libust to have the LTTng-UST Python agent (Python package which
adds LTTng tracing to Python's standard logging when imported) when
Python is available on the target.

Most patch files exist to make the packages work with uClibc-ng and
musl. I tested all the packages with glibc, uClibc-ng, and musl.

Philippe Proulx (5):
  lttng-libust: bump to version 2.8.1
  lttng-tools: bump to version 2.8.2
  lttng-tools: remove dependency on host-lttng-babeltrace
  lttng-modules: bump to version 2.8.3
  lttng-babeltrace: bump to version 1.4.0

 ...c-remove-elfutils-version-test-for-Buildr.patch |  25 ++
 .../0001-no-posix-fallocate-in-uclibc.patch        |  37 --
 ...ix-uuid-support-detection-on-static-build.patch |  63 ---
 ...b-Makefile.am-remove-unneeded-static-flag.patch |  31 ++
 package/lttng-babeltrace/Config.in                 |  21 +-
 package/lttng-babeltrace/lttng-babeltrace.hash     |  11 +-
 package/lttng-babeltrace/lttng-babeltrace.mk       |  15 +-
 ...lf.c-define-NT_GNU_BUILD_ID-if-not-define.patch |  31 ++
 package/lttng-libust/lttng-libust.hash             |  12 +-
 package/lttng-libust/lttng-libust.mk               |  10 +-
 package/lttng-modules/lttng-modules.hash           |   8 +-
 package/lttng-modules/lttng-modules.mk             |  27 +-
 ...ld-failure-when-__GLIBC_PREREQ-is-missing.patch |  55 ---
 ...Fix-snapshot-del-output-with-name-on-musl.patch |  11 +
 .../0002-Fix-add-missing-sys-types.h-header.patch  |  29 --
 ...Fix-strerror_r-behavior-is-glibc-specific.patch |  26 ++
 ...et-thread-stack-size-to-ulimit-soft-value.patch | 427 +++++++++++++++++++++
 package/lttng-tools/lttng-tools.hash               |   8 +-
 package/lttng-tools/lttng-tools.mk                 |  17 +-
 19 files changed, 634 insertions(+), 230 deletions(-)
 create mode 100644 package/lttng-babeltrace/0001-configure.ac-remove-elfutils-version-test-for-Buildr.patch
 delete mode 100644 package/lttng-babeltrace/0001-no-posix-fallocate-in-uclibc.patch
 delete mode 100644 package/lttng-babeltrace/0002-configure-fix-uuid-support-detection-on-static-build.patch
 create mode 100644 package/lttng-babeltrace/0002-tests-lib-Makefile.am-remove-unneeded-static-flag.patch
 create mode 100644 package/lttng-libust/0001-lttng-ust-elf.c-define-NT_GNU_BUILD_ID-if-not-define.patch
 delete mode 100644 package/lttng-tools/0001-Fix-build-failure-when-__GLIBC_PREREQ-is-missing.patch
 create mode 100644 package/lttng-tools/0001-Fix-snapshot-del-output-with-name-on-musl.patch
 delete mode 100644 package/lttng-tools/0002-Fix-add-missing-sys-types.h-header.patch
 create mode 100644 package/lttng-tools/0002-Fix-strerror_r-behavior-is-glibc-specific.patch
 create mode 100644 package/lttng-tools/0003-Set-thread-stack-size-to-ulimit-soft-value.patch

--
2.9.3
