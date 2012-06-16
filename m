From: Nathan Lynch <ntl@pobox.com>
Date: Sat, 16 Jun 2012 14:37:17 -0500
Subject: [Buildroot] [PATCHv3 7/7] automatically set PARALLEL_JOBS when
	BR2_JLEVEL is 0
In-Reply-To: <1339466983-19786-8-git-send-email-ntl@pobox.com>
References: <1339466983-19786-8-git-send-email-ntl@pobox.com>
Message-ID: <1339875437-24426-1-git-send-email-ntl@pobox.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When BR2_JLEVEL is 0, set PARALLEL_JOBS to double the number of CPUs
detected.  This allows one to more or less fully utilize the host
system without manually tuning the configuration.

Also make 0 the default value for BR2_JLEVEL.

Signed-off-by: Nathan Lynch <ntl@pobox.com>
---

v3: Added comment to PARALLEL_JOBS calculation per Baruch.

v2: Updated to use double number of detected CPUs per Arnout and Peter.

 Config.in           |    8 +++++---
 package/Makefile.in |    8 ++++++++
 2 files changed, 13 insertions(+), 3 deletions(-)

diff --git a/Config.in b/Config.in
index 95c2e8c..3745255 100644
--- a/Config.in
+++ b/Config.in
@@ -178,10 +178,12 @@ config BR2_DEBIAN_MIRROR
 endmenu
 
 config BR2_JLEVEL
-	int "Number of jobs to run simultaneously"
-	default "2"
+	int "Number of jobs to run simultaneously (0 for auto)"
+	default "0"
 	help
-	  Number of jobs to run simultaneously
+	  Number of jobs to run simultaneously.  If 0, determine
+	  automatically according to number of CPUs on the host
+	  system.
 
 config BR2_CCACHE
 	bool "Enable compiler cache"
diff --git a/package/Makefile.in b/package/Makefile.in
index 9177a1b..ffcb9b6 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -6,7 +6,15 @@ HOSTMAKE=$(MAKE)
 endif
 HOSTMAKE :=$(shell which $(HOSTMAKE) || type -p $(HOSTMAKE) || echo make)
 
+# If BR2_LEVEL is 0, scale the maximum concurrency with the number of
+# CPUs.  A coefficient of 2 is used in order to keep processors busy
+# while waiting on I/O.
+ifeq ($(BR2_JLEVEL),0)
+PARALLEL_JOBS:=$(shell echo \
+	$$((2 * `getconf _NPROCESSORS_ONLN 2>/dev/null || echo 1`)))
+else
 PARALLEL_JOBS:=$(BR2_JLEVEL)
+endif
 
 MAKE1:=$(HOSTMAKE) -j1
 MAKE:=$(HOSTMAKE) -j$(PARALLEL_JOBS)
-- 
1.7.10.2
