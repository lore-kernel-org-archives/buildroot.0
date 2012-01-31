From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 31 Jan 2012 23:42:45 +0100
Subject: [Buildroot] [git commit] lttng-modules: new package
Message-ID: <20120131232309.AD8ED90953@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=16891da22d99ec73696aa22c7564083146d664ec
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Config.in                      |    1 +
 package/lttng-modules/Config.in        |   18 ++++++++++++++++++
 package/lttng-modules/lttng-modules.mk |   15 +++++++++++++++
 3 files changed, 34 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index d15e934..d437e6e 100644
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
index 0000000..1820c8f
--- /dev/null
+++ b/package/lttng-modules/lttng-modules.mk
@@ -0,0 +1,15 @@
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
