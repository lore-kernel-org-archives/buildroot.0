From: spdawson at gmail.com <spdawson@gmail.com>
Date: Tue, 24 Jul 2012 21:03:59 +0100
Subject: [Buildroot] [PATCH] gpsd: remove timing configuration option
Message-ID: <1343160239-18430-1-git-send-email-spdawson@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Simon Dawson <spdawson@gmail.com>

When gpsd is built with RECONFIGURE_ENABLE disabled, the min_cycle field
of the gps_type_t field does not exist, but the code still uses it if
TIMING_ENABLE is enabled.

This can be seen in the following test build failure.

  http://autobuild.buildroot.org/results/dd01fa0220bfd3a8aabcc85d89d624afeeda757b/build-end.log

This patch removes the configuration option that, ultimately, drives
TIMING_ENABLE.

Signed-off-by: Simon Dawson <spdawson@gmail.com>
---
 package/gpsd/Config.in |    3 ---
 package/gpsd/gpsd.mk   |    3 ---
 2 files changed, 6 deletions(-)

diff --git a/package/gpsd/Config.in b/package/gpsd/Config.in
index db6bec2..8643492 100644
--- a/package/gpsd/Config.in
+++ b/package/gpsd/Config.in
@@ -20,9 +20,6 @@ config BR2_PACKAGE_GPSD_DEVICES
 menu "Features"
 	depends on BR2_PACKAGE_GPSD
 
-config BR2_PACKAGE_GPSD_TIMING
-	bool "latency timing support"
-
 config BR2_PACKAGE_GPSD_CLIENT_DEBUG
 	bool "client debugging support"
 
diff --git a/package/gpsd/gpsd.mk b/package/gpsd/gpsd.mk
index dd15386..3a2697f 100644
--- a/package/gpsd/gpsd.mk
+++ b/package/gpsd/gpsd.mk
@@ -175,9 +175,6 @@ endif
 ifeq ($(BR2_PACKAGE_GPSD_PROFILING),y)
 	GPSD_SCONS_OPTS += profiling=yes
 endif
-ifeq ($(BR2_PACKAGE_GPSD_TIMING),y)
-	GPSD_SCONS_OPTS += timing=yes
-endif
 ifneq ($(BR2_PACKAGE_GPSD_CLIENT_DEBUG),y)
 	GPSD_SCONS_OPTS += clientdebug=no
 endif
-- 
1.7.9.5
