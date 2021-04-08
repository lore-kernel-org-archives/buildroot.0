From: Asaf Kahlon <asafka7@gmail.com>
Date: Thu,  8 Apr 2021 22:46:31 +0300
Subject: [Buildroot] [PATCH v2 1/1] package/uftrace: new package
Message-ID: <20210408194631.313188-1-asafka7@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The uftrace tool is to trace and analyze execution of a
program written in C/C++.

This package contains a ./configure script to check for possible
extentions. This script is called directly from the Makefile,
so we don't need to call it explicitly.

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
---
v1->v2:
* amend commit message
* use github macro
* add _ARCH_SUPPORT
* more minor refactors

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
---
 DEVELOPERS                   |  1 +
 package/Config.in            |  1 +
 package/uftrace/Config.in    | 19 +++++++++++++++++++
 package/uftrace/uftrace.hash |  3 +++
 package/uftrace/uftrace.mk   | 26 ++++++++++++++++++++++++++
 5 files changed, 50 insertions(+)
 create mode 100644 package/uftrace/Config.in
 create mode 100644 package/uftrace/uftrace.hash
 create mode 100644 package/uftrace/uftrace.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 7699c471d3..f8187dfb4d 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -240,6 +240,7 @@ F:	package/python*
 F:	package/snmpclitools/
 F:	package/spdlog/
 F:	package/uftp/
+F:	package/uftrace/
 F:	package/uvw/
 F:	package/zeromq/
 
diff --git a/package/Config.in b/package/Config.in
index 1269bc7b51..cd5cd17576 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -144,6 +144,7 @@ menu "Debugging, profiling and benchmark"
 	source "package/trace-cmd/Config.in"
 	source "package/trinity/Config.in"
 	source "package/uclibc-ng-test/Config.in"
+	source "package/uftrace/Config.in"
 	source "package/valgrind/Config.in"
 	source "package/vmtouch/Config.in"
 	source "package/whetstone/Config.in"
diff --git a/package/uftrace/Config.in b/package/uftrace/Config.in
new file mode 100644
index 0000000000..2a969445f2
--- /dev/null
+++ b/package/uftrace/Config.in
@@ -0,0 +1,19 @@
+config BR2_PACKAGE_UFTRACE_ARCH_SUPPORTS
+	bool
+	default y if BR2_arm
+	default y if BR2_aarch64
+	default y if BR2_i386
+	default y if BR2_x86_64
+
+config BR2_PACKAGE_UFTRACE
+	bool "uftrace"
+	depends on BR2_PACKAGE_UFTRACE_ARCH_SUPPORTS
+	help
+	  The uftrace tool is to trace and analyze execution of a
+	  program written in C/C++. It was heavily inspired by the
+	  ftrace framework of the Linux kernel (especially function
+	  graph tracer) and supports userspace programs.
+	  It supports various kind of commands and filters to help
+	  analysis of the program execution and performance.
+
+	  https://github.com/namhyung/uftrace
diff --git a/package/uftrace/uftrace.hash b/package/uftrace/uftrace.hash
new file mode 100644
index 0000000000..fb1e116be6
--- /dev/null
+++ b/package/uftrace/uftrace.hash
@@ -0,0 +1,3 @@
+# Locally computed
+sha256	418d30c959d3b6d0dcafd55e588a5d414a9984b30f2522a5af004a268824a5a2  uftrace-0.9.4.tar.gz
+sha256	8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/uftrace/uftrace.mk b/package/uftrace/uftrace.mk
new file mode 100644
index 0000000000..20425a9c48
--- /dev/null
+++ b/package/uftrace/uftrace.mk
@@ -0,0 +1,26 @@
+################################################################################
+#
+# uftrace
+#
+################################################################################
+
+UFTRACE_VERSION = 0.9.4
+UFTRACE_SITE = $(call github,namhyung,uftrace,v$(UFTRACE_VERSION))
+UFTRACE_LICENSE = GPL-2.0
+UFTRACE_LICENSE_FILES = COPYING
+
+# uftrace always compiles a small test program to check if elfutils exists, so
+# there's no special flag for it, we just need to make sure it's installed.
+ifeq ($(BR2_PACKAGE_ELFUTILS),y)
+UFTRACE_DEPENDENCIES += elfutils
+endif
+
+define UFTRACE_BUILD_CMDS
+	$(TARGET_CONFIGURE_OPTS) ARCH=$(BR2_ARCH) $(MAKE) -C $(@D)
+endef
+
+define UFTRACE_INSTALL_TARGET_CMDS
+	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) DESTDIR=$(TARGET_DIR) install
+endef
+
+$(eval $(generic-package))
-- 
2.30.0
