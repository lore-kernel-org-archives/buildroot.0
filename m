From: Vincent Stehle <vincent.stehle@laposte.net>
Date: Sun, 25 Jun 2017 21:37:43 +0200
Subject: [Buildroot] [PATCH] uftrace: new package
Message-ID: <20170625193743.8424-1-vincent.stehle@laposte.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Vincent Stehl? <vincent.stehle@laposte.net>

Add a package for uftrace, a simple function call tracer for user programs.

The x86_64 and arm/aarch64 architectures are supported.

Tracing necessitates that the executable you want to trace be compiled with
-pg or -finstrument-functions option.

See https://github.com/namhyung/uftrace

Signed-off-by: Vincent Stehl? <vincent.stehle@laposte.net>
---
 DEVELOPERS                   |  3 ++-
 package/Config.in            |  1 +
 package/uftrace/Config.in    | 20 ++++++++++++++++++++
 package/uftrace/uftrace.hash |  2 ++
 package/uftrace/uftrace.mk   | 28 ++++++++++++++++++++++++++++
 5 files changed, 53 insertions(+), 1 deletion(-)
 create mode 100644 package/uftrace/Config.in
 create mode 100644 package/uftrace/uftrace.hash
 create mode 100644 package/uftrace/uftrace.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 9e421f4b4..5f2a6b0db 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1706,9 +1706,10 @@ F:	package/openmpi/
 F:	package/pinentry/
 F:	package/trinity/
 
-N:	Vincent Stehl? <vincent.stehle@intel.com>
+N:	Vincent Stehl? <vincent.stehle@laposte.net>
 F:	package/i7z/
 F:	package/msr-tools/
+F:	package/uftrace/
 
 N:	Vinicius Tinti <viniciustinti@gmail.com>
 F:	package/python-thrift/
diff --git a/package/Config.in b/package/Config.in
index f69f67f3e..d9639b040 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -121,6 +121,7 @@ menu "Debugging, profiling and benchmark"
 	source "package/trace-cmd/Config.in"
 	source "package/trinity/Config.in"
 	source "package/uclibc-ng-test/Config.in"
+	source "package/uftrace/Config.in"
 	source "package/valgrind/Config.in"
 	source "package/whetstone/Config.in"
 endmenu
diff --git a/package/uftrace/Config.in b/package/uftrace/Config.in
new file mode 100644
index 000000000..bb766238c
--- /dev/null
+++ b/package/uftrace/Config.in
@@ -0,0 +1,20 @@
+config BR2_PACKAGE_UFTRACE
+	bool "uftrace"
+	depends on BR2_aarch64 || BR2_arm || BR2_x86_64
+	depends on !(BR2_arm &&?BR2_ARM_SOFT_FLOAT)
+	depends on BR2_PACKAGE_ELFUTILS
+	depends on BR2_TOOLCHAIN_USES_GLIBC
+	help
+	  A simple function call tracer for user programs.
+
+	  Note that the executable you want to trace should be compiled
+	  with -pg or -finstrument-functions option.
+
+	  https://github.com/namhyung/uftrace
+
+comment "uftrace needs a glibc toolchain and elfutils"
+	depends on BR2_aarch64 || BR2_arm || BR2_x86_64
+	depends on !BR2_PACKAGE_ELFUTILS || !BR2_TOOLCHAIN_USES_GLIBC
+
+comment "uftrace needs a toolchain with hardware floats on ARM"
+	depends on BR2_arm &&?BR2_ARM_SOFT_FLOAT
diff --git a/package/uftrace/uftrace.hash b/package/uftrace/uftrace.hash
new file mode 100644
index 000000000..8509197cc
--- /dev/null
+++ b/package/uftrace/uftrace.hash
@@ -0,0 +1,2 @@
+# Locally computed:
+sha256 afa698053ef10582c2ed3973ea134c0775d7ff4dcece3034905026185c52b272 uftrace-v0.7.tar.gz
diff --git a/package/uftrace/uftrace.mk b/package/uftrace/uftrace.mk
new file mode 100644
index 000000000..e23f01816
--- /dev/null
+++ b/package/uftrace/uftrace.mk
@@ -0,0 +1,28 @@
+################################################################################
+#
+# uftrace
+#
+################################################################################
+
+UFTRACE_VERSION = v0.7
+UFTRACE_SITE = $(call github,namhyung,uftrace,$(UFTRACE_VERSION))
+UFTRACE_DEPENDENCIES = elfutils
+UFTRACE_LICENSE = GPL-2.0
+UFTRACE_LICENSE_FILES = COPYING
+
+define UFTRACE_CONFIGURE_CMDS
+	cd $(@D) && \
+	$(TARGET_MAKE_ENV) CC="$(TARGET_CC)" CFLAGS="$(TARGET_CFLAGS)" \
+	LD="$(TARGET_LD)" ARCH="$(ARCH)" \
+	./configure --prefix=/usr
+endef
+
+define UFTRACE_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)
+endef
+
+define UFTRACE_INSTALL_TARGET_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) install DESTDIR="$(TARGET_DIR)"
+endef
+
+$(eval $(generic-package))
-- 
2.11.0
