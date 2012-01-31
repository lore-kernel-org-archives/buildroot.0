From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 31 Jan 2012 20:40:01 +0100
Subject: [Buildroot] [PATCH 3/8] lttng-modules: new package
In-Reply-To: <cover.1328038759.git.thomas.petazzoni@free-electrons.com>
References: <cover.1328038759.git.thomas.petazzoni@free-electrons.com>
Message-ID: <69c816343f0b9438709666446e4627814946c356.1328038759.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                      |    1 +
 package/lttng-modules/Config.in        |   18 ++++++++++++++++++
 package/lttng-modules/lttng-modules.mk |   16 ++++++++++++++++
 3 files changed, 35 insertions(+), 0 deletions(-)
 create mode 100644 package/lttng-modules/Config.in
 create mode 100644 package/lttng-modules/lttng-modules.mk

diff --git a/package/Config.in b/package/Config.in
index 31bee7f..d016ac2 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -24,6 +24,7 @@ source "package/kexec/Config.in"
 source "package/lmbench/Config.in"
 source "package/lsof/Config.in"
 source "package/ltp-testsuite/Config.in"
+source "package/lttng-modules/Config.in"
 source "package/ltrace/Config.in"
 source "package/memstat/Config.in"
 source "package/netperf/Config.in"
diff --git a/package/lttng-modules/Config.in b/package/lttng-modules/Config.in
new file mode 100644
index 0000000..2a0f938
--- /dev/null
+++ b/package/lttng-modules/Config.in
@@ -0,0 +1,18 @@
+config BR2_PACKAGE_LTTNG_MODULES
+	bool "lttng-modules"
+	depends on BR2_LINUX_KERNEL
+	help
+	  Kernel modules for the LTTng 2.0 kernel tracing
+	  infrastructure.
+
+	  Your kernel must have CONFIG_TRACEPOINTS enabled for this
+	  package to build something useful. You may also want to have
+	  CONFIG_PERF_EVENTS to access perf event counters from
+	  ltt-ng. Note that system call tracing is only available on
+	  architectures that support CONFIG_HAVE_SYSCALL_TRACEPOINTS.
+
+	  The packaged version is compatible with kernel 2.6.38,
+	  2.6.39, 3.0 and 3.1.0. See
+	  http://lttng.org/files/bundles/20111214/README.compatible.kernels.txt
+
+	  http://lttng.org
diff --git a/package/lttng-modules/lttng-modules.mk b/package/lttng-modules/lttng-modules.mk
new file mode 100644
index 0000000..450a40c
--- /dev/null
+++ b/package/lttng-modules/lttng-modules.mk
@@ -0,0 +1,16 @@
+LTTNG_MODULES_VERSION = 2.0-pre11
+LTTNG_MODULES_SITE    = http://lttng.org/files/bundles/20111214/
+LTTNG_MODULES_SOURCE  = lttng-modules-$(LTTNG_MODULES_VERSION).tar.bz2
+
+LTTNG_MODULES_DEPENDENCIES = linux
+
+define LTTNG_MODULES_BUILD_CMDS
+	$(MAKE) -C $(@D) $(LINUX_MAKE_FLAGS) KERNELDIR=$(LINUX_DIR)
+endef
+
+define LTTNG_MODULES_INSTALL_TARGET_CMDS
+	$(MAKE) -C $(@D) $(LINUX_MAKE_FLAGS) KERNELDIR=$(LINUX_DIR) modules_install
+endef
+
+$(eval $(call GENTARGETS))
+
-- 
1.7.4.1
