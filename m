From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 22 Dec 2011 10:57:19 +0100
Subject: [Buildroot] [PATCH 3/7] lttng-tools: new package
In-Reply-To: <cover.1324547779.git.thomas.petazzoni@free-electrons.com>
References: <cover.1324547779.git.thomas.petazzoni@free-electrons.com>
Message-ID: <87c288f7b512b7ff2d9db878a8453964be21b63b.1324547779.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                  |    1 +
 package/lttng-tools/Config.in      |   19 +++++++++++++++++++
 package/lttng-tools/lttng-tools.mk |   12 ++++++++++++
 3 files changed, 32 insertions(+), 0 deletions(-)
 create mode 100644 package/lttng-tools/Config.in
 create mode 100644 package/lttng-tools/lttng-tools.mk

diff --git a/package/Config.in b/package/Config.in
index f0cc4f2..df49778 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -25,6 +25,7 @@ source "package/lmbench/Config.in"
 source "package/lsof/Config.in"
 source "package/ltp-testsuite/Config.in"
 source "package/lttng-modules/Config.in"
+source "package/lttng-tools/Config.in"
 source "package/ltrace/Config.in"
 source "package/memstat/Config.in"
 source "package/netperf/Config.in"
diff --git a/package/lttng-tools/Config.in b/package/lttng-tools/Config.in
new file mode 100644
index 0000000..5bd7349
--- /dev/null
+++ b/package/lttng-tools/Config.in
@@ -0,0 +1,19 @@
+config BR2_PACKAGE_LTTNG_TOOLS
+	bool "lttng-tools"
+	depends on BR2_PACKAGE_LTTNG_MODULES
+	select BR2_PACKAGE_LIBURCU
+	select BR2_PACKAGE_POPT
+	help
+	  Userspace utilities for the LTTng 2.0 tracing
+	  infrastructure.
+
+	  Those utilities are required on the target system to start
+	  and stop tracing sessions. Analysis of the trace can be done
+	  on the host machine using the babeltrace utility. This
+	  utility is automatically built by Buildroot in
+	  $(O)/host/usr/bin/babeltrace, as a dependency of
+	  lttng-tools. However, there is also a lttng-babeltrace
+	  package for the target, if babeltrace on the target is
+	  interesting.
+
+	  http://lttng.org
diff --git a/package/lttng-tools/lttng-tools.mk b/package/lttng-tools/lttng-tools.mk
new file mode 100644
index 0000000..474f3c1
--- /dev/null
+++ b/package/lttng-tools/lttng-tools.mk
@@ -0,0 +1,12 @@
+LTTNG_TOOLS_VERSION = 2.0-pre15
+LTTNG_TOOLS_SITE    = http://lttng.org/files/bundles/20111214/
+LTTNG_TOOLS_SOURCE  = lttng-tools-$(LTTNG_TOOLS_VERSION).tar.bz2
+
+# The host-lttng-babeltrace technically isn't a required build
+# dependency. However, having the babeltrace utilities built for the
+# host is very useful, since those tools allow to convert the binary
+# trace format into an human readable format.
+LTTNG_TOOLS_DEPENDENCIES = liburcu popt host-lttng-babeltrace
+
+$(eval $(call AUTOTARGETS))
+
-- 
1.7.4.1
