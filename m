From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue, 30 Apr 2019 19:01:15 +0200
Subject: [Buildroot] [PATCH v2,
 1/1] package/uboot-tools: fix build with host-openssl
Message-ID: <20190430170115.27891-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

As suggested by Arnout during review of previous iteration, add a patch
to uboot-tools so it uses CFLAGS and not HOSTCFLAGS when building cross
tools

Fixes:
 - http://autobuild.buildroot.org/results/915b509e814bda16be54a24276b9c740c51e5770

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
Changes v1 -> v2 (after review of Arnout Vandecappelle):
 - Add an upstreamable patch instead of enforcing gcc >= 4.7

 ...ix-HOSTCFLAGS-with-CROSS_BUILD_TOOLS.patch | 28 +++++++++++++++++++
 1 file changed, 28 insertions(+)
 create mode 100644 package/uboot-tools/0005-tools-Makefile-fix-HOSTCFLAGS-with-CROSS_BUILD_TOOLS.patch

diff --git a/package/uboot-tools/0005-tools-Makefile-fix-HOSTCFLAGS-with-CROSS_BUILD_TOOLS.patch b/package/uboot-tools/0005-tools-Makefile-fix-HOSTCFLAGS-with-CROSS_BUILD_TOOLS.patch
new file mode 100644
index 0000000000..5c54f4cea6
--- /dev/null
+++ b/package/uboot-tools/0005-tools-Makefile-fix-HOSTCFLAGS-with-CROSS_BUILD_TOOLS.patch
@@ -0,0 +1,28 @@
+From 9f2dce5887bb52e8c7f9ef40a6733d70af72ff1c Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Tue, 30 Apr 2019 18:45:17 +0200
+Subject: [PATCH] tools/Makefile: fix HOSTCFLAGS with CROSS_BUILD_TOOLS
+
+When CROSS_BUILD_TOOLS is set, set HOSTCFLAGS to CFLAGS otherwise CC
+will be used with HOSTCFLAGS which seems wrong
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ tools/Makefile | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/tools/Makefile b/tools/Makefile
+index 12a3027e23..eadeba417d 100644
+--- a/tools/Makefile
++++ b/tools/Makefile
+@@ -272,6 +272,7 @@ subdir- += env
+ 
+ ifneq ($(CROSS_BUILD_TOOLS),)
+ override HOSTCC = $(CC)
++override HOSTCFLAGS = $(CFLAGS)
+ 
+ quiet_cmd_crosstools_strip = STRIP   $^
+       cmd_crosstools_strip = $(STRIP) $^; touch $@
+-- 
+2.20.1
+
-- 
2.20.1
