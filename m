From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 14 Feb 2016 21:49:43 +0100
Subject: [Buildroot] [git commit] libraw1394: add patch to fix
	CLOCK_MONOTONIC_RAW build problem
Message-ID: <20160214205002.95C5881842@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=60d71a9cbe3b209e501a339d45860abc789a42d1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

CLOCK_MONOTONIC_RAW is a fairly recent addition, which may not be
available in old C libraries/kernels. This commit adds a libraw1394
patch that makes the use of CLOCK_MONOTONIC_RAW optional. The patch
has been submitted upstream.

Fixes:

  http://autobuild.buildroot.net/results/198149e80be3e62eaf9f4731442031a1aa93409c/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...build-the-CLOCK_MONOTONIC_RAW-test-condit.patch | 38 ++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/package/libraw1394/0001-testlibraw-build-the-CLOCK_MONOTONIC_RAW-test-condit.patch b/package/libraw1394/0001-testlibraw-build-the-CLOCK_MONOTONIC_RAW-test-condit.patch
new file mode 100644
index 0000000..b87ef71
--- /dev/null
+++ b/package/libraw1394/0001-testlibraw-build-the-CLOCK_MONOTONIC_RAW-test-condit.patch
@@ -0,0 +1,38 @@
+From 94c66ade15d7fc468b52c72dfe76a8c10b1910a7 Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+Date: Fri, 12 Feb 2016 10:13:45 +0100
+Subject: [PATCH] testlibraw: build the CLOCK_MONOTONIC_RAW test conditionally
+
+CLOCK_MONOTONIC_RAW is a somewhat recent addition, and some older
+toolchains/kernels may not have the support for it. Therefore, we
+build the part of the test that uses CLOCK_MONOTONIC_RAW only when
+this definition is available.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+---
+ tools/testlibraw.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/tools/testlibraw.c b/tools/testlibraw.c
+index d8a0702..ae37157 100644
+--- a/tools/testlibraw.c
++++ b/tools/testlibraw.c
+@@ -211,6 +211,7 @@ read_cycle_timer(raw1394handle_t handle)
+ 	printf("    local time from CLOCK_MONOTONIC: %lld us\n",
+ 	       (unsigned long long)local_time);
+ 
++#if defined(CLOCK_MONOTONIC_RAW)
+ 	retval = raw1394_read_cycle_timer_and_clock(handle, &ct, &local_time,
+ 						    CLOCK_MONOTONIC_RAW);
+ 	if (retval < 0) {
+@@ -221,6 +222,7 @@ read_cycle_timer(raw1394handle_t handle)
+ 	       ct >> 25, (ct >> 12) & 0x1fff, ct & 0xfff);
+ 	printf("    local time from CLOCK_MONOTONIC_RAW: %lld us\n",
+ 	       (unsigned long long)local_time);
++#endif
+ }
+ 
+ int test_card(int card)
+-- 
+2.6.4
+
