From: sam at gpsm.co.uk <sam@gpsm.co.uk>
Date: Thu, 30 Aug 2018 17:28:07 +0100
Subject: [Buildroot] [PATCH 1/1] package/delve: new package
Message-ID: <20180830162807.1721-1-sam@gpsm.co.uk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Sam Lancia <sam@gpsm.co.uk>

Including "Delve", the debugger for Go applications.

Signed-off-by: Sam Lancia <sam@gpsm.co.uk>
---
 package/Config.in        |  1 +
 package/delve/Config.in  | 18 ++++++++++++++++++
 package/delve/delve.hash |  2 ++
 package/delve/delve.mk   | 19 +++++++++++++++++++
 4 files changed, 40 insertions(+)
 create mode 100644 package/delve/Config.in
 create mode 100644 package/delve/delve.hash
 create mode 100644 package/delve/delve.mk

diff --git a/package/Config.in b/package/Config.in
index f5a17492c7..dbf609b29d 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -83,6 +83,7 @@ menu "Debugging, profiling and benchmark"
 	source "package/blktrace/Config.in"
 	source "package/bonnie/Config.in"
 	source "package/cache-calibrator/Config.in"
+        source "package/delve/Config.in"
 	source "package/dhrystone/Config.in"
 	source "package/dieharder/Config.in"
 	source "package/dmalloc/Config.in"
diff --git a/package/delve/Config.in b/package/delve/Config.in
new file mode 100644
index 0000000000..5c6045513c
--- /dev/null
+++ b/package/delve/Config.in
@@ -0,0 +1,18 @@
+config BR2_PACKAGE_DELVE
+	bool "delve"
+	depends on BR2_PACKAGE_HOST_GO_ARCH_SUPPORTS
+	depends on BR2_PACKAGE_HOST_GO_CGO_LINKING_SUPPORTS
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	help
+          Delve is a debugger for the Go programming language.
+          The goal of the project is to provide a simple, full featured debugging tool for Go.
+          Delve should be easy to invoke and easy to use.
+          Chances are if you're using a debugger, things aren't going your way.
+          With that in mind, Delve should stay out of your way as much as possible.
+
+          https://github.com/derekparker/delve
+
+comment "delve needs a toolchain w/ threads"
+	depends on BR2_PACKAGE_HOST_GO_ARCH_SUPPORTS && \
+		BR2_PACKAGE_HOST_GO_CGO_LINKING_SUPPORTS
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/delve/delve.hash b/package/delve/delve.hash
new file mode 100644
index 0000000000..37fad79c3d
--- /dev/null
+++ b/package/delve/delve.hash
@@ -0,0 +1,2 @@
+# Locally computed:
+sha256  de023318accf33ffe7cbb393f5a301551390111db8c0849fe5f4002b6c476583  delve-v1.1.0.tar.gz
diff --git a/package/delve/delve.mk b/package/delve/delve.mk
new file mode 100644
index 0000000000..d4da282e2a
--- /dev/null
+++ b/package/delve/delve.mk
@@ -0,0 +1,19 @@
+
+################################################################################
+#
+# delve
+#
+################################################################################
+
+DELVE_VERSION = v1.1.0
+DELVE_SITE = $(call github,derekparker,delve,$(DELVE_VERSION))
+
+DELVE_LICENSE = MIT
+DELVE_LICENSE_FILES = LICENSE
+
+DELVE_DEPENDENCIES = host-go host-pkgconf
+
+DELVE_BUILD_TARGETS = cmd/dlv
+DELVE_INSTALL_BINS = dlv
+
+$(eval $(golang-package))
-- 
2.17.1
