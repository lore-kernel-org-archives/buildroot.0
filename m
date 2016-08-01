From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 1 Aug 2016 22:59:31 +0200
Subject: [Buildroot] [git commit] toolchain: Bump ARC tools to
	arc-2016.09-eng007 and enable PIE
Message-ID: <20160801205940.76C0381D36@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3897ded714280bf8391c1657335e607634d3ef33
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

As described at:
4520524ba055706236db9f00dd79f1b2e2e87fde
this commit continues a series of updates of ARC tools.
This time we're updating tools to arc-2016.09-eng007 tag plus a
couple of fixes on top of it that will all make its way in the
next engineering build.

We hope this patch will cure most buildroot ARC failures as it
contains important fixes:

1) PIE fix. We have added PIE support to ARC toolchain at last.
So that should prevent breakage of many packages. As ARC now
supports PIE we remove ARC from BR2_TOOLCHAIN_SUPPORTS_PIE
exclusion in toolchain/Config.in file.

2) Assembler fix. This patch also have changes that fixes frequent
assembler failures, e.g.:
http://autobuild.buildroot.net/results/543/5430b902d900943a34c1888e7e410bd5df367bc2//

We still keep GDB as it is of arc-2016.03 release because there're some
issues we'd like to resolve before releasing it to wider audience.

So again note this is next engineering builds of arc-2016.09 series
and it might have all kinds of breakages, please don't use it for
production builds.

Signed-off-by: Vlad Zakharov <vzakhar@synopsys.com>
[Thomas: remove uClibc PIE patch, since we have bumped uClibc in the
mean time, to a version that contains the PIE fix for ARC.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/binutils/Config.in.host                    |   2 +-
 .../0300-ld-makefile.patch                         |   0
 .../0301-check-ldrunpath-length.patch              |   0
 .../0500-add-sysroot-fix-from-bug-3049.patch       |   0
 .../0600-poison-system-directories.patch           |   0
 .../0700-PIE-fixes-in-for-ARC-bfd.patch            | 289 +++++++++++++++++++++
 .../0701-Fixed-init-fini-linker-options.patch      |  43 +++
 ...x-undefined-symbols-aborting-on-PIE-cases.patch |  30 +++
 .../0800-Fixed-issue-in-tvheadend-package.patch    |  26 ++
 package/binutils/binutils.hash                     |   2 +-
 package/binutils/binutils.mk                       |   2 +-
 package/gcc/Config.in.host                         |   2 +-
 .../130-fix_build_with_gcc-6.patch                 |   0
 .../130-pr43538.patch                              |   0
 .../301-missing-execinfo_h.patch                   |   0
 .../305-libmudflap-susv3-legacy.patch              |   0
 .../842-PR60155.patch                              |   0
 .../850-libstdcxx-uclibc-c99.patch                 |   0
 .../851-PR-other-56780.patch                       |   0
 .../930-libgcc-disable-split-stack-nothreads.patch |   0
 package/gcc/gcc.hash                               |   2 +-
 toolchain/Config.in                                |   2 +-
 22 files changed, 394 insertions(+), 6 deletions(-)

Patch is too large, so refusing to show it
