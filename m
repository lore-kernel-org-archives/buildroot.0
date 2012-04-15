From: Samuel Martin <s.martin49@gmail.com>
Date: Sun, 15 Apr 2012 21:17:54 +0200
Subject: [Buildroot] [PATCH 1/3] lttng-libust: bump to version 2.0.1
Message-ID: <1334517476-15258-1-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Samuel Martin <s.martin49@gmail.com>
---
 .../lttng-libust-fix-overflow-32-bits.patch        |   26 --------------------
 package/lttng-libust/lttng-libust.mk               |   11 ++++++---
 2 files changed, 8 insertions(+), 29 deletions(-)
 delete mode 100644 package/lttng-libust/lttng-libust-fix-overflow-32-bits.patch

diff --git a/package/lttng-libust/lttng-libust-fix-overflow-32-bits.patch b/package/lttng-libust/lttng-libust-fix-overflow-32-bits.patch
deleted file mode 100644
index c2a4dd2..0000000
--- a/package/lttng-libust/lttng-libust-fix-overflow-32-bits.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-From dc190cc1f8ddccfa7b0b8323ed157afb29a0ebb7 Mon Sep 17 00:00:00 2001
-From: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
-Date: Wed, 21 Dec 2011 16:24:48 -0500
-Subject: [PATCH] Fix clock source overflow on 32-bit archs
-
-Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
----
- liblttng-ust/clock.h |    2 +-
- 1 files changed, 1 insertions(+), 1 deletions(-)
-
-diff --git a/liblttng-ust/clock.h b/liblttng-ust/clock.h
-index b5d3e77..23294d2 100644
---- a/liblttng-ust/clock.h
-+++ b/liblttng-ust/clock.h
-@@ -39,7 +39,7 @@ static __inline__ uint64_t trace_clock_read64(void)
- 	struct timespec ts;
- 
- 	clock_gettime(CLOCK_MONOTONIC, &ts);
--	return (ts.tv_sec * 1000000000) + ts.tv_nsec;
-+	return ((uint64_t) ts.tv_sec * 1000000000ULL) + ts.tv_nsec;
- }
- 
- static __inline__ uint32_t trace_clock_freq_scale(void)
--- 
-1.7.2.5
-
diff --git a/package/lttng-libust/lttng-libust.mk b/package/lttng-libust/lttng-libust.mk
index f54999e..de1b145 100644
--- a/package/lttng-libust/lttng-libust.mk
+++ b/package/lttng-libust/lttng-libust.mk
@@ -1,6 +1,11 @@
-LTTNG_LIBUST_SITE    = http://lttng.org/files/bundles/20111214/
-LTTNG_LIBUST_VERSION = 1.9.2
-LTTNG_LIBUST_SOURCE  = lttng-ust-$(LTTNG_LIBUST_VERSION).tar.gz
+#############################################################
+#
+# LTTng-UST: the userspace tracing library
+#
+#############################################################
+LTTNG_LIBUST_SITE    = http://lttng.org/files/lttng-ust/
+LTTNG_LIBUST_VERSION = 2.0.1
+LTTNG_LIBUST_SOURCE  = lttng-ust-$(LTTNG_LIBUST_VERSION).tar.bz2
 
 LTTNG_LIBUST_INSTALL_STAGING = YES
 LTTNG_LIBUST_DEPENDENCIES    = liburcu util-linux
-- 
1.7.10
