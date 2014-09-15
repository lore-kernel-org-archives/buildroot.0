From: Danomi Manchego <danomimanchego123@gmail.com>
Date: Sun, 14 Sep 2014 21:31:12 -0400
Subject: [Buildroot] [PATCH v2 2/2] pkg-infra: make timing of steps optional
In-Reply-To: <1410744672-32698-1-git-send-email-danomimanchego123@gmail.com>
References: <1410744672-32698-1-git-send-email-danomimanchego123@gmail.com>
Message-ID: <1410744672-32698-2-git-send-email-danomimanchego123@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Commit 17d4eb1e0261793a9f89e4a2253602c7ab926d2e added a hook to log timing
of steps to a build-time.log file, which provides data for the "graph-build"
target for examining build time stats.  If one uses buildroot on a daily
basis as part of a build system, then its conceivable that there might be
long periods of time between "make clean" ops.  So the log file continues
to grow.  This patch makes the accumulation of the timing data optional, to
avoid having a silent endlessly growing log in the build directory.

Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>

---

Changes v1 -> v2:
- Switch test to positive logic, per feedback from Yann Morin.
---
 Config.in              | 6 ++++++
 package/pkg-generic.mk | 2 ++
 2 files changed, 8 insertions(+)

diff --git a/Config.in b/Config.in
index 14ff55b..78ee165 100644
--- a/Config.in
+++ b/Config.in
@@ -574,6 +574,12 @@ config BR2_GLOBAL_PATCH_DIR
 	  Otherwise, if the directory <global-patch-dir>/<packagename> exists,
 	  then all *.patch files in the directory will be applied.
 
+config BR2_GATHER_BUILD_TIME_STATS
+	bool "Gather build time statistics"
+	help
+	  Record the start and end time of each step in the build process, so
+	  that buildroot can generate graphs of the build times.
+
 endmenu
 
 source "toolchain/Config.in"
diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 4b6d818..ac74b0b 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -48,12 +48,14 @@ endef
 # Actual steps hooks
 
 # Time steps
+ifeq ($(BR2_GATHER_BUILD_TIME_STATS),y)
 define step_time
 	printf "%s:%-5.5s:%-20.20s: %s\n"           \
 	       "$$(date +%s)" "$(1)" "$(2)" "$(3)"  \
 	       >>"$(BUILD_DIR)/build-time.log"
 endef
 GLOBAL_INSTRUMENTATION_HOOKS += step_time
+endif
 
 # User-supplied script
 ifneq ($(BR2_INSTRUMENTATION_SCRIPTS),)
-- 
1.9.1
