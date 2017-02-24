From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 24 Feb 2017 12:00:02 +0100
Subject: [Buildroot] [git commit] util-linux: re-add <pkg>_AUTORECONF = YES
Message-ID: <20170224110156.3B32282280@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a3c07d08eae55deeb1b1731174309750bb0ea628
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit a5015f1025a1aee173c2c2ab39ccac5ce38f30c3 ("util-linux: security
bump to version 2.29.2") incorrectly removed <pkg>_AUTORECONF = YES.

While the patches touching configure.ac have indeed been removed, there
is still a patch touching a Makemodule.am file, which triggers an
autoreconf a build time, which itself fails because autoconf/automake
are not available.

So re-add <pkg>_AUTORECONF, with a comment pointing specifically at the
patch that makes it necessary.

Fixes:

  http://autobuild.buildroot.net/results/309127a532eed00e406bbaf0b1a51b7241a10505/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/util-linux/util-linux.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/util-linux/util-linux.mk b/package/util-linux/util-linux.mk
index 0fc46d4..05e1398 100644
--- a/package/util-linux/util-linux.mk
+++ b/package/util-linux/util-linux.mk
@@ -9,6 +9,9 @@ UTIL_LINUX_VERSION = $(UTIL_LINUX_VERSION_MAJOR).2
 UTIL_LINUX_SOURCE = util-linux-$(UTIL_LINUX_VERSION).tar.xz
 UTIL_LINUX_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/util-linux/v$(UTIL_LINUX_VERSION_MAJOR)
 
+# 0001-build-sys-use-lm-for-scriptreplay-if-necessary.patch
+UTIL_LINUX_AUTORECONF = YES
+
 # README.licensing claims that some files are GPLv2-only, but this is not true.
 # Some files are GPLv3+ but only in tests.
 UTIL_LINUX_LICENSE = GPLv2+, BSD-4c, LGPLv2.1+ (libblkid, libfdisk, libmount), BSD-3c (libuuid)
