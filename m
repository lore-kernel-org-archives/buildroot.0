From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 31 Jan 2012 23:43:36 +0100
Subject: [Buildroot] [git commit] lttng-libust: new package
Message-ID: <20120131232309.C179190953@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=dc77b0824e6d7adf40b4543243cbca8d8d03695b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Config.in                                  |    1 +
 package/lttng-libust/Config.in                     |   10 +++++++
 .../lttng-libust-fix-overflow-32-bits.patch        |   26 ++++++++++++++++++++
 package/lttng-libust/lttng-libust.mk               |    8 ++++++
 4 files changed, 45 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index d437e6e..ed91605 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -378,6 +378,7 @@ source "package/libical/Config.in"
 source "package/libnspr/Config.in"
 source "package/libsigc/Config.in"
 source "package/liburcu/Config.in"
+source "package/lttng-libust/Config.in"
 source "package/orc/Config.in"
 source "package/poco/Config.in"
 source "package/startup-notification/Config.in"
diff --git a/package/lttng-libust/Config.in b/package/lttng-libust/Config.in
new file mode 100644
index 0000000..335a956
--- /dev/null
+++ b/package/lttng-libust/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_LTTNG_LIBUST
+	bool "lttng-libust"
+	select BR2_PACKAGE_LIBURCU
+	help
+	  Userspace tracing library for the Lttng tracing
+	  infrastructure. It allows userspace programs to create
+	  custom trace events that are integrated with all other
+	  events gathered by LTTng.
+
+	  http://lttng.org
diff --git a/package/lttng-libust/lttng-libust-fix-overflow-32-bits.patch b/package/lttng-libust/lttng-libust-fix-overflow-32-bits.patch
new file mode 100644
index 0000000..c2a4dd2
--- /dev/null
+++ b/package/lttng-libust/lttng-libust-fix-overflow-32-bits.patch
@@ -0,0 +1,26 @@
+From dc190cc1f8ddccfa7b0b8323ed157afb29a0ebb7 Mon Sep 17 00:00:00 2001
+From: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
+Date: Wed, 21 Dec 2011 16:24:48 -0500
+Subject: [PATCH] Fix clock source overflow on 32-bit archs
+
+Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
+---
+ liblttng-ust/clock.h |    2 +-
+ 1 files changed, 1 insertions(+), 1 deletions(-)
+
+diff --git a/liblttng-ust/clock.h b/liblttng-ust/clock.h
+index b5d3e77..23294d2 100644
+--- a/liblttng-ust/clock.h
++++ b/liblttng-ust/clock.h
+@@ -39,7 +39,7 @@ static __inline__ uint64_t trace_clock_read64(void)
+ 	struct timespec ts;
+ 
+ 	clock_gettime(CLOCK_MONOTONIC, &ts);
+-	return (ts.tv_sec * 1000000000) + ts.tv_nsec;
++	return ((uint64_t) ts.tv_sec * 1000000000ULL) + ts.tv_nsec;
+ }
+ 
+ static __inline__ uint32_t trace_clock_freq_scale(void)
+-- 
+1.7.2.5
+
diff --git a/package/lttng-libust/lttng-libust.mk b/package/lttng-libust/lttng-libust.mk
new file mode 100644
index 0000000..a2cef2a
--- /dev/null
+++ b/package/lttng-libust/lttng-libust.mk
@@ -0,0 +1,8 @@
+LTTNG_LIBUST_SITE    = http://lttng.org/files/bundles/20111214/
+LTTNG_LIBUST_VERSION = 1.9.2
+LTTNG_LIBUST_SOURCE  = lttng-ust-$(LTTNG_LIBUST_VERSION).tar.gz
+
+LTTNG_LIBUST_INSTALL_STAGING = YES
+LTTNG_LIBUST_DEPENDENCIES    = liburcu
+
+$(eval $(call AUTOTARGETS))
