From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 3 Oct 2014 21:19:08 +0200
Subject: [Buildroot] [git commit] package/xenomai: bump to version 2.6.4
Message-ID: <20141003200913.4D6CE9D80A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c63d990219cd988210de2868f7a583e789b65217
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Remove upstreamed patches.

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../xenomai-0001-arm-enable-armv5tej-support.patch |   40 --------------------
 ...uild-failure-when-HAVE_OPEN64-is-undefine.patch |   30 ---------------
 package/xenomai/xenomai.mk                         |    2 +-
 3 files changed, 1 insertions(+), 71 deletions(-)

diff --git a/package/xenomai/xenomai-0001-arm-enable-armv5tej-support.patch b/package/xenomai/xenomai-0001-arm-enable-armv5tej-support.patch
deleted file mode 100644
index fdff0aa..0000000
--- a/package/xenomai/xenomai-0001-arm-enable-armv5tej-support.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From ebc2779baa222db4a5936c3d3022803355585b8c Mon Sep 17 00:00:00 2001
-From: Romain Naour <romain.naour@openwide.fr>
-Date: Sat, 28 Dec 2013 13:31:14 +0100
-Subject: [PATCH 1/1] arm: enable armv5tej support
-
-armv5tej are not detected in include/asm-arm/features.h
-
-fixes: http://autobuild.buildroot.net/results/e3b/e3b534dafb6dd7d788b0c3629ccc0b25702790f0/build-end.log
-
-Signed-off-by: Romain Naour <romain.naour@openwide.fr>
----
- include/asm-arm/features.h | 9 +++++----
- 1 file changed, 5 insertions(+), 4 deletions(-)
-
-diff --git a/include/asm-arm/features.h b/include/asm-arm/features.h
-index b83ac2c..bb3ea92 100644
---- a/include/asm-arm/features.h
-+++ b/include/asm-arm/features.h
-@@ -56,13 +56,14 @@
- #define __LINUX_ARM_ARCH__ 4
- #endif /* armv4 */
- 
--#if defined(__ARM_ARCH_5__) || defined(__ARM_ARCH_5T__) \
--	|| defined(__ARM_ARCH_5E__) || defined(__ARM_ARCH_5TE__)
-+#if defined(__ARM_ARCH_5__) || defined(__ARM_ARCH_5T__) || \
-+	defined(__ARM_ARCH_5E__) || defined(__ARM_ARCH_5TE__) || \
-+	defined(__ARM_ARCH_5TEJ__)
- #define __LINUX_ARM_ARCH__ 5
- #endif /* armv5 */
- 
--#if defined(__ARM_ARCH_6__) || defined(__ARM_ARCH_6K__) \
--	|| defined(__ARM_ARCH_6Z__) || defined(__ARM_ARCH_6ZK__)
-+#if defined(__ARM_ARCH_6__) || defined(__ARM_ARCH_6K__) || \
-+	defined(__ARM_ARCH_6Z__) || defined(__ARM_ARCH_6ZK__)
- #define __LINUX_ARM_ARCH__ 6
- #endif /* armv6 */
- 
--- 
-1.8.1.4
-
diff --git a/package/xenomai/xenomai-0002-posix-fix-build-failure-when-HAVE_OPEN64-is-undefine.patch b/package/xenomai/xenomai-0002-posix-fix-build-failure-when-HAVE_OPEN64-is-undefine.patch
deleted file mode 100644
index ce43676..0000000
--- a/package/xenomai/xenomai-0002-posix-fix-build-failure-when-HAVE_OPEN64-is-undefine.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From 71345fe15f126ae3a596af309945d0af6edfbbbb Mon Sep 17 00:00:00 2001
-From: Romain Naour <romain.naour@openwide.fr>
-Date: Sun, 29 Dec 2013 18:00:25 +0100
-Subject: [PATCH 1/1] posix: fix build failure when HAVE_OPEN64 is undefined.
-
-fixes: http://autobuild.buildroot.org/results/d59/d590be34637a4043c929ce615f9db504484be435/build-end.log
-
-Signed-off-by: Romain Naour <romain.naour@openwide.fr>
----
- src/skins/posix/rtdm.c | 3 ++-
- 1 file changed, 2 insertions(+), 1 deletion(-)
-
-diff --git a/src/skins/posix/rtdm.c b/src/skins/posix/rtdm.c
-index 5840c64..d6c87dc 100644
---- a/src/skins/posix/rtdm.c
-+++ b/src/skins/posix/rtdm.c
-@@ -107,8 +107,9 @@ int __wrap_open64(const char *path, int oflag, ...)
- 			errno = EMFILE;
- 			ret = -1;
- 		}
-+	}
- #endif
--	} else {
-+	else {
- 		errno = -ret;
- 		ret = -1;
- 	}
--- 
-1.8.1.4
-
diff --git a/package/xenomai/xenomai.mk b/package/xenomai/xenomai.mk
index 1fd3135..f360c2a 100644
--- a/package/xenomai/xenomai.mk
+++ b/package/xenomai/xenomai.mk
@@ -6,7 +6,7 @@
 
 XENOMAI_VERSION = $(call qstrip,$(BR2_PACKAGE_XENOMAI_VERSION))
 ifeq ($(XENOMAI_VERSION),)
-XENOMAI_VERSION = 2.6.3
+XENOMAI_VERSION = 2.6.4
 endif
 
 XENOMAI_SITE = http://download.gna.org/xenomai/stable
