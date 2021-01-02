From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 2 Jan 2021 18:28:02 +0100
Subject: [Buildroot] [git commit] package/delve: new package
Message-ID: <20210102171015.86D158267F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=59b46150e17bb4086e3805d8fbe2ca1716edf2bb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Delve is a debugger for the Go programming language.

Signed-off-by: Christian Stewart <christian@paral.in>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS               |  1 +
 package/Config.in        |  1 +
 package/delve/Config.in  | 22 ++++++++++++++++++++++
 package/delve/delve.hash |  3 +++
 package/delve/delve.mk   | 17 +++++++++++++++++
 5 files changed, 44 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index a618b11d98..b19a12be5a 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -505,6 +505,7 @@ F:	linux/linux-ext-aufs.mk
 F:	package/aufs/
 F:	package/aufs-util/
 F:	package/batman-adv/
+F:	package/delve/
 F:	package/docker-cli/
 F:	package/docker-containerd/
 F:	package/docker-engine/
diff --git a/package/Config.in b/package/Config.in
index 9f55133c12..2a516df4c6 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -88,6 +88,7 @@ menu "Debugging, profiling and benchmark"
 	source "package/cache-calibrator/Config.in"
 	source "package/clinfo/Config.in"
 	source "package/dacapo/Config.in"
+	source "package/delve/Config.in"
 	source "package/dhrystone/Config.in"
 	source "package/dieharder/Config.in"
 	source "package/dmalloc/Config.in"
diff --git a/package/delve/Config.in b/package/delve/Config.in
new file mode 100644
index 0000000000..9428e4016a
--- /dev/null
+++ b/package/delve/Config.in
@@ -0,0 +1,22 @@
+# Supported architectures are listed in
+# pkg/proc/native/support_sentinel.go
+config BR2_PACKAGE_DELVE_ARCH_SUPPORTS
+	bool
+	default y if BR2_aarch64
+	default y if BR2_i386
+	default y if BR2_x86_64
+	depends on BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
+	depends on BR2_PACKAGE_HOST_GO_TARGET_CGO_LINKING_SUPPORTS
+
+config BR2_PACKAGE_DELVE
+	bool "delve"
+	depends on BR2_PACKAGE_DELVE_ARCH_SUPPORTS
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	help
+	  Delve is a debugger for the Go programming language.
+
+	  https://github.com/go-delve/delve
+
+comment "delve needs a toolchain w/ threads"
+	depends on BR2_PACKAGE_DELVE_ARCH_SUPPORTS
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/delve/delve.hash b/package/delve/delve.hash
new file mode 100644
index 0000000000..e8bb9c37ad
--- /dev/null
+++ b/package/delve/delve.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256  f8bbaecdfc9d1ff6148900d3dea44b6dd06a7f0197be4e9a75c289b7f62682ab  delve-1.5.0.tar.gz
+sha256	778864b990007e8cef6633f8c372dd05bac1fada6cf67b008afb1483f83b38f5  LICENSE
diff --git a/package/delve/delve.mk b/package/delve/delve.mk
new file mode 100644
index 0000000000..f574bc5c08
--- /dev/null
+++ b/package/delve/delve.mk
@@ -0,0 +1,17 @@
+################################################################################
+#
+# delve
+#
+################################################################################
+
+DELVE_VERSION = 1.5.0
+DELVE_SITE = $(call github,go-delve,delve,v$(DELVE_VERSION))
+DELVE_LICENSE = MIT
+DELVE_LICENSE_FILES = LICENSE
+DELVE_DEPENDENCIES = host-pkgconf
+
+DELVE_TAGS = cgo
+DELVE_BUILD_TARGETS = cmd/dlv
+DELVE_INSTALL_BINS = $(notdir $(DELVE_BUILD_TARGETS))
+
+$(eval $(golang-package))
