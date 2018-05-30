From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Wed, 30 May 2018 22:22:11 +0200
Subject: [Buildroot] [PATCH 1/1] libraw1394: bump to version 2.1.2
Message-ID: <20180530202211.25190-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- Remove patches (already in version)
- Add hash for license file

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...build-the-CLOCK_MONOTONIC_RAW-test-condit.patch | 38 ----------------------
 package/libraw1394/libraw1394.hash                 |  4 +--
 package/libraw1394/libraw1394.mk                   |  3 +-
 3 files changed, 3 insertions(+), 42 deletions(-)
 delete mode 100644 package/libraw1394/0001-testlibraw-build-the-CLOCK_MONOTONIC_RAW-test-condit.patch

diff --git a/package/libraw1394/0001-testlibraw-build-the-CLOCK_MONOTONIC_RAW-test-condit.patch b/package/libraw1394/0001-testlibraw-build-the-CLOCK_MONOTONIC_RAW-test-condit.patch
deleted file mode 100644
index b87ef715de..0000000000
--- a/package/libraw1394/0001-testlibraw-build-the-CLOCK_MONOTONIC_RAW-test-condit.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-From 94c66ade15d7fc468b52c72dfe76a8c10b1910a7 Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Date: Fri, 12 Feb 2016 10:13:45 +0100
-Subject: [PATCH] testlibraw: build the CLOCK_MONOTONIC_RAW test conditionally
-
-CLOCK_MONOTONIC_RAW is a somewhat recent addition, and some older
-toolchains/kernels may not have the support for it. Therefore, we
-build the part of the test that uses CLOCK_MONOTONIC_RAW only when
-this definition is available.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
----
- tools/testlibraw.c | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/tools/testlibraw.c b/tools/testlibraw.c
-index d8a0702..ae37157 100644
---- a/tools/testlibraw.c
-+++ b/tools/testlibraw.c
-@@ -211,6 +211,7 @@ read_cycle_timer(raw1394handle_t handle)
- 	printf("    local time from CLOCK_MONOTONIC: %lld us\n",
- 	       (unsigned long long)local_time);
- 
-+#if defined(CLOCK_MONOTONIC_RAW)
- 	retval = raw1394_read_cycle_timer_and_clock(handle, &ct, &local_time,
- 						    CLOCK_MONOTONIC_RAW);
- 	if (retval < 0) {
-@@ -221,6 +222,7 @@ read_cycle_timer(raw1394handle_t handle)
- 	       ct >> 25, (ct >> 12) & 0x1fff, ct & 0xfff);
- 	printf("    local time from CLOCK_MONOTONIC_RAW: %lld us\n",
- 	       (unsigned long long)local_time);
-+#endif
- }
- 
- int test_card(int card)
--- 
-2.6.4
-
diff --git a/package/libraw1394/libraw1394.hash b/package/libraw1394/libraw1394.hash
index b785995db1..9a44ab7d41 100644
--- a/package/libraw1394/libraw1394.hash
+++ b/package/libraw1394/libraw1394.hash
@@ -1,4 +1,4 @@
 # From https://www.kernel.org/pub/linux/libs/ieee1394/sha256sums.asc
-sha256	1bab9780189f9d1eb4e973df12679c04f979c21e024240fc98e536ff5b680ee9	libraw1394-2.1.1.tar.xz
+sha256	03ccc69761d22c7deb1127fc301010dd13e70e44bb7134b8ff0d07590259a55e  	libraw1394-2.1.2.tar.xz
 # Locally computed
-sha256	39369c65fbed7fccc2e6d8e645f258f101c414107d67238f10996e6c2009f20d	fix-types.patch
+sha256	5bbcbb737e60fe9deba08ecbd00920cfcc3403ba2e534c64fdeea49d6bb87509	COPYING.LIB
diff --git a/package/libraw1394/libraw1394.mk b/package/libraw1394/libraw1394.mk
index 73517ed2f5..7aa4a3ae01 100644
--- a/package/libraw1394/libraw1394.mk
+++ b/package/libraw1394/libraw1394.mk
@@ -4,10 +4,9 @@
 #
 ################################################################################
 
-LIBRAW1394_VERSION = 2.1.1
+LIBRAW1394_VERSION = 2.1.2
 LIBRAW1394_SOURCE = libraw1394-$(LIBRAW1394_VERSION).tar.xz
 LIBRAW1394_SITE = $(BR2_KERNEL_MIRROR)/linux/libs/ieee1394
-LIBRAW1394_PATCH = http://git.alpinelinux.org/cgit/aports/plain/main/libraw1394/fix-types.patch
 LIBRAW1394_INSTALL_STAGING = YES
 LIBRAW1394_LICENSE = LGPL-2.1+
 LIBRAW1394_LICENSE_FILES = COPYING.LIB
-- 
2.14.1
