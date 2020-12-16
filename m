From: Christian Stewart <christian@paral.in>
Date: Wed, 16 Dec 2020 00:40:58 -0800
Subject: [Buildroot] [PATCH v1 1/1] package/moby-buildkit: new package
Message-ID: <20201216084058.102180-1-christian@paral.in>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Christian Stewart <christian@paral.in>
---
 package/Config.in                        |  1 +
 package/moby-buildkit/Config.in          | 19 +++++++++++++++++++
 package/moby-buildkit/moby-buildkit.hash |  3 +++
 package/moby-buildkit/moby-buildkit.mk   | 24 ++++++++++++++++++++++++
 4 files changed, 47 insertions(+)
 create mode 100644 package/moby-buildkit/Config.in
 create mode 100644 package/moby-buildkit/moby-buildkit.hash
 create mode 100644 package/moby-buildkit/moby-buildkit.mk

diff --git a/package/Config.in b/package/Config.in
index dc7139a49a..ce37a2ed35 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2414,6 +2414,7 @@ menu "System tools"
 	source "package/mender/Config.in"
 	source "package/mender-grubenv/Config.in"
 	source "package/mfoc/Config.in"
+	source "package/moby-buildkit/Config.in"
 	source "package/monit/Config.in"
 	source "package/multipath-tools/Config.in"
 	source "package/ncdu/Config.in"
diff --git a/package/moby-buildkit/Config.in b/package/moby-buildkit/Config.in
new file mode 100644
index 0000000000..14134aa7ae
--- /dev/null
+++ b/package/moby-buildkit/Config.in
@@ -0,0 +1,19 @@
+config BR2_PACKAGE_MOBY_BUILDKIT
+	bool "moby-buildkit"
+	depends on BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
+	depends on BR2_PACKAGE_HOST_GO_TARGET_CGO_LINKING_SUPPORTS
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_TOOLCHAIN_USES_UCLIBC
+	depends on BR2_USE_MMU
+	select BR2_PACKAGE_CGROUPFS_MOUNT if !BR2_PACKAGE_SYSTEMD # runtime dependency
+	help
+	  BuildKit is a toolkit for converting source code to build artifacts in an
+	  efficient, expressive and repeatable manner.
+
+	  https://github.com/moby/buildkit
+
+comment "moby-buildkit needs a glibc or musl toolchain w/ threads"
+	depends on BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
+	depends on BR2_PACKAGE_HOST_GO_TARGET_CGO_LINKING_SUPPORTS
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_TOOLCHAIN_USES_UCLIBC
+	depends on BR2_USE_MMU
diff --git a/package/moby-buildkit/moby-buildkit.hash b/package/moby-buildkit/moby-buildkit.hash
new file mode 100644
index 0000000000..a6bfdce4f1
--- /dev/null
+++ b/package/moby-buildkit/moby-buildkit.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256  0cc31aa4b6dcdead63b07d75e0b89495ecffcc183f4f62695d8bb507433fc8ff  moby-buildkit-0.8.1.tar.gz
+sha256	7c87873291f289713ac5df48b1f2010eb6963752bbd6b530416ab99fc37914a8  LICENSE
diff --git a/package/moby-buildkit/moby-buildkit.mk b/package/moby-buildkit/moby-buildkit.mk
new file mode 100644
index 0000000000..fb4e78e3a6
--- /dev/null
+++ b/package/moby-buildkit/moby-buildkit.mk
@@ -0,0 +1,24 @@
+################################################################################
+#
+# moby-buildkit
+#
+################################################################################
+
+MOBY_BUILDKIT_VERSION = 0.8.1
+MOBY_BUILDKIT_SITE = $(call github,moby,buildkit,v$(MOBY_BUILDKIT_VERSION))
+
+MOBY_BUILDKIT_LICENSE = Apache-2.0
+MOBY_BUILDKIT_LICENSE_FILES = LICENSE
+
+MOBY_BUILDKIT_DEPENDENCIES = host-pkgconf
+MOBY_BUILDKIT_GOMOD = github.com/moby/buildkit
+
+MOBY_BUILDKIT_TAGS = cgo
+MOBY_BUILDKIT_BUILD_TARGETS = cmd/buildctl cmd/buildkitd
+
+MOBY_BUILDKIT_LDFLAGS = \
+	-X $(MOBY_BUILDKIT_GOMOD)/version.Version="$(MOBY_BUILDKIT_VERSION)"
+
+MOBY_BUILDKIT_INSTALL_BINS = $(notdir $(MOBY_BUILDKIT_BUILD_TARGETS))
+
+$(eval $(golang-package))
-- 
2.29.2
