From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 11 Feb 2017 15:16:01 +0100
Subject: [Buildroot] [git commit] util-linux: enable AUTORECONF
Message-ID: <20170211141610.A93A582122@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=59c86d0e1775b18452064378bb8e9b3208e58ea6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit 55a9737895cb ("util-linux: link scriptreplay with libm (for isnan)")
added two patches that touch configure.ac and Makemodule.am. But forgot
to enable AUTORECONF.

When AUTORECONF is disabled and configure.ac is patched, it looks like
make will detect change in timestamps and trigger reconfig. But it
later fails because of missing dependencies. To fix this, explicitly
enable AUTORECONF.

Fixes:
  http://autobuild.buildroot.net/results/544/544e8da290d40424ea3d1bffad7e0b8a566de495

Fixes: 55a9737895cb ("util-linux: link scriptreplay with libm (for isnan)")
Signed-off-by: Rahul Bedarkar <rahul.bedarkar@imgtec.com>
Cc: Carlos Santos <casantos@datacom.ind.br>
Acked-by: Carlos Santos <casantos@datacom.ind.br>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/util-linux/util-linux.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/util-linux/util-linux.mk b/package/util-linux/util-linux.mk
index 84c4f0e..441c252 100644
--- a/package/util-linux/util-linux.mk
+++ b/package/util-linux/util-linux.mk
@@ -8,6 +8,9 @@ UTIL_LINUX_VERSION_MAJOR = 2.29
 UTIL_LINUX_VERSION = $(UTIL_LINUX_VERSION_MAJOR).1
 UTIL_LINUX_SOURCE = util-linux-$(UTIL_LINUX_VERSION).tar.xz
 UTIL_LINUX_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/util-linux/v$(UTIL_LINUX_VERSION_MAJOR)
+# For 0001-build-sys-use-lm-for-scriptreplay-if-necessary.patch and
+# 0002-build-sys-improve-detection-of-the-isnan-function-in.patch
+UTIL_LINUX_AUTORECONF = YES
 
 # README.licensing claims that some files are GPLv2-only, but this is not true.
 # Some files are GPLv3+ but only in tests.
