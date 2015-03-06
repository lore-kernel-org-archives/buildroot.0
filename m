From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 6 Mar 2015 23:27:07 +0100
Subject: [Buildroot] [git commit] lttng-modules: bump to version 2.6.0
Message-ID: <20150306222734.7BC548019D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=9728dfabf0f81e469cc14a2e7d0b1eb64b34d134
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Philippe Proulx <eeppeliteloop@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/lttng-modules/Config.in          |   34 ++++++++++++++++++++++--------
 package/lttng-modules/lttng-modules.hash |    8 +-----
 package/lttng-modules/lttng-modules.mk   |    2 +-
 3 files changed, 28 insertions(+), 16 deletions(-)

diff --git a/package/lttng-modules/Config.in b/package/lttng-modules/Config.in
index 8cfa874..e8ba9ba 100644
--- a/package/lttng-modules/Config.in
+++ b/package/lttng-modules/Config.in
@@ -2,18 +2,34 @@ config BR2_PACKAGE_LTTNG_MODULES
 	bool "lttng-modules"
 	depends on BR2_LINUX_KERNEL
 	help
-	  Kernel modules for the LTTng 2.0 kernel tracing
+	  Linux kernel modules for the LTTng 2.x kernel tracing
 	  infrastructure.
 
-	  Your kernel must have CONFIG_TRACEPOINTS enabled for this
-	  package to build something useful. You may also want to have
-	  CONFIG_PERF_EVENTS to access perf event counters from
-	  ltt-ng. Note that system call tracing is only available on
-	  architectures that support CONFIG_HAVE_SYSCALL_TRACEPOINTS.
+	  Make sure your target kernel has the following config
+	  options enabled:
 
-	  The packaged version is compatible with kernel 2.6.38,
-	  2.6.39, 3.0 and 3.1.0. See
-	  http://lttng.org/files/bundles/20111214/README.compatible.kernels.txt
+	    * CONFIG_MODULES: loadable module support
+	    * CONFIG_KALLSYMS: this is necessary until the few
+	      required missing symbols are exported to GPL
+	      modules from mainline
+	    * CONFIG_HIGH_RES_TIMERS: needed for LTTng 2.x
+	      clock source
+	    * CONFIG_TRACEPOINTS: kernel tracepoint instrumentation
+	      (enabled as a side-effect of any of the
+	      perf/ftrace/blktrace instrumentation features)
+
+	  The following kernel configuration options will
+	  affect the features available from LTTng:
+
+	    * CONFIG_HAVE_SYSCALL_TRACEPOINTS: system call tracing
+	    * CONFIG_PERF_EVENTS: performance counters
+	    * CONFIG_EVENT_TRACING: needed to allow block layer tracing
+	    * CONFIG_KPROBES: dynamic probes
+	    * CONFIG_KRETPROBES: dynamic function entry/return probes
+	    * CONFIG_KALLSYMS_ALL: state dump of mapping between block
+	      device number and name
+
+	  The packaged version is compatible with Linux 2.6.38 to 3.16.
 
 	  http://lttng.org
 
diff --git a/package/lttng-modules/lttng-modules.hash b/package/lttng-modules/lttng-modules.hash
index 25dba0c..918b4cf 100644
--- a/package/lttng-modules/lttng-modules.hash
+++ b/package/lttng-modules/lttng-modules.hash
@@ -1,6 +1,2 @@
-# From http://lttng.org/files/lttng-modules/lttng-modules-2.5.1.tar.bz2.sha1
-sha1   75d9662ed3f8d7c53833663a5d89fe31c015b3ca  lttng-modules-2.5.1.tar.bz2
-# From http://lttng.org/files/lttng-modules/lttng-modules-2.5.1.tar.bz2.md5
-md5    2d99bb7311ba92e82e3b675f0b8dee7d  lttng-modules-2.5.1.tar.bz2
-# Locally generated
-sha256 962238175f0959ac71b97fdde144a3f76a84f63aea6b3645f94da88512bcccdb  lttng-modules-2.5.1.tar.bz2
+# http://www.lttng.org/files/lttng-modules/lttng-modules-2.6.0.tar.bz2.sha1
+sha1  6402ec848e2a75250e04be35f0c49332bf37a388  lttng-modules-2.6.0.tar.bz2
diff --git a/package/lttng-modules/lttng-modules.mk b/package/lttng-modules/lttng-modules.mk
index 02ec202..6833ad2 100644
--- a/package/lttng-modules/lttng-modules.mk
+++ b/package/lttng-modules/lttng-modules.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LTTNG_MODULES_VERSION = 2.5.1
+LTTNG_MODULES_VERSION = 2.6.0
 LTTNG_MODULES_SITE = http://lttng.org/files/lttng-modules
 LTTNG_MODULES_SOURCE = lttng-modules-$(LTTNG_MODULES_VERSION).tar.bz2
 LTTNG_MODULES_LICENSE = LGPLv2.1/GPLv2 for kernel modules; MIT for lib/bitfield.h and lib/prio_heap/*
