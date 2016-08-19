From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 19 Aug 2016 23:40:23 +0200
Subject: [Buildroot] [git commit branch/next] util-linux: bump version to
	2.28.1
Message-ID: <20160819214510.A797781F80@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a351f375973072eecafc09f1c233c5c53bbaad3f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Drop upstream patch 0001-build-sys-fix-uClibc-ng-scanf-check.patch.

Release notes:
https://www.kernel.org/pub/linux/utils/util-linux/v2.28/v2.28.1-ReleaseNotes

Signed-off-by: Rahul Bedarkar <rahul.bedarkar@imgtec.com>
[Thomas: remove --enable-libuuid-force-uuidd support.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../0001-build-sys-fix-uClibc-ng-scanf-check.patch | 34 ----------------------
 package/util-linux/util-linux.hash                 |  2 +-
 package/util-linux/util-linux.mk                   |  7 ++---
 3 files changed, 4 insertions(+), 39 deletions(-)

diff --git a/package/util-linux/0001-build-sys-fix-uClibc-ng-scanf-check.patch b/package/util-linux/0001-build-sys-fix-uClibc-ng-scanf-check.patch
deleted file mode 100644
index 801b72b..0000000
--- a/package/util-linux/0001-build-sys-fix-uClibc-ng-scanf-check.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From bac7fbdb2d141879526ca4342d56d2c749ba8af5 Mon Sep 17 00:00:00 2001
-From: Waldemar Brodkorb <wbx@uclibc-ng.org>
-Date: Fri, 3 Jun 2016 04:23:28 +0200
-Subject: [PATCH] build-sys: fix uClibc-ng scanf check
-
-uClibc-ng tries to be compatible with GNU libc and defines
-__GLIBC__ and pretend to be version 2.2.
-We once changed it to 2.10, but then some hard to fix problems
-in different software packages (gcc) occured.
-It would be better if we disable the special GNU libc checks
-for uClibc-ng here. uClibc-ng implements the required scanf
-functionality.
-
-Signed-off-by: Waldemar Brodkorb <wbx@uclibc-ng.org>
----
- configure.ac | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/configure.ac b/configure.ac
-index 3ba723f..ec197ee 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -581,7 +581,7 @@ AC_CACHE_VAL([scanf_cv_alloc_modifier],
-      #include <stdio.h>
-      #include <unistd.h>
- 
--     #ifdef __GLIBC__
-+     #if defined(__GLIBC__) && !defined(__UCLIBC__)
- 
-      #if !(__GLIBC_PREREQ(2, 7))
-      #error %m is not available
--- 
-2.1.4
-
diff --git a/package/util-linux/util-linux.hash b/package/util-linux/util-linux.hash
index ca58102..17094f4 100644
--- a/package/util-linux/util-linux.hash
+++ b/package/util-linux/util-linux.hash
@@ -1,2 +1,2 @@
 # From https://www.kernel.org/pub/linux/utils/util-linux/v2.28/sha256sums.asc
-sha256	395847e2a18a2c317170f238892751e73a57104565344f8644090c8b091014bb	util-linux-2.28.tar.xz
+sha256	3ece4ea4a34ef786b68f5c415e848390424232abd1ee00f7ee5bddc30657b60f	util-linux-2.28.1.tar.xz
diff --git a/package/util-linux/util-linux.mk b/package/util-linux/util-linux.mk
index 9c7bd87..3c8496a 100644
--- a/package/util-linux/util-linux.mk
+++ b/package/util-linux/util-linux.mk
@@ -4,16 +4,15 @@
 #
 ################################################################################
 
-UTIL_LINUX_VERSION = 2.28
+UTIL_LINUX_VERSION_MAJOR = 2.28
+UTIL_LINUX_VERSION = $(UTIL_LINUX_VERSION_MAJOR).1
 UTIL_LINUX_SOURCE = util-linux-$(UTIL_LINUX_VERSION).tar.xz
-UTIL_LINUX_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/util-linux/v$(UTIL_LINUX_VERSION)
+UTIL_LINUX_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/util-linux/v$(UTIL_LINUX_VERSION_MAJOR)
 
 # README.licensing claims that some files are GPLv2-only, but this is not true.
 # Some files are GPLv3+ but only in tests.
 UTIL_LINUX_LICENSE = GPLv2+, BSD-4c, libblkid and libmount LGPLv2.1+, libuuid BSD-3c
 UTIL_LINUX_LICENSE_FILES = README.licensing Documentation/licenses/COPYING.GPLv2 Documentation/licenses/COPYING.UCB Documentation/licenses/COPYING.LGPLv2.1 Documentation/licenses/COPYING.BSD-3
-# For 0001-build-sys-fix-uClibc-ng-scanf-check.patch
-UTIL_LINUX_AUTORECONF = YES
 UTIL_LINUX_INSTALL_STAGING = YES
 UTIL_LINUX_DEPENDENCIES = host-pkgconf
 # uClibc needs NTP_LEGACY for sys/timex.h -> ntp_gettime() support
