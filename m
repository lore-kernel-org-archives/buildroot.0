From: Christian Stewart <christian@paral.in>
Date: Fri, 19 Jun 2020 11:04:31 -0700
Subject: [Buildroot] [PATCH v2 1/1] package/fuse-overlayfs: new package
Message-ID: <20200619180431.57528-1-christian@paral.in>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

FUSE-overlayfs is an implementation of overlay+shiftfs in FUSE, intended to be
used as the backing filesystem for rootless containers.

Reference: http://github.com/containers/fuse-overlayfs

Signed-off-by: Christian Stewart <christian@paral.in>

---

v1 -> v2:

 - remove superfluous autoconf, automake deps
 - fix check-package warnings about Config.in

---
 DEVELOPERS                                 |  1 +
 package/Config.in                          |  1 +
 package/fuse-overlayfs/Config.in           | 15 +++++++++++++++
 package/fuse-overlayfs/fuse-overlayfs.hash |  4 ++++
 package/fuse-overlayfs/fuse-overlayfs.mk   | 15 +++++++++++++++
 5 files changed, 36 insertions(+)
 create mode 100644 package/fuse-overlayfs/Config.in
 create mode 100644 package/fuse-overlayfs/fuse-overlayfs.hash
 create mode 100644 package/fuse-overlayfs/fuse-overlayfs.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 7cd67a5540..dc9fa8a718 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -539,6 +539,7 @@ F:	package/docker-cli/
 F:	package/docker-containerd/
 F:	package/docker-engine/
 F:	package/docker-proxy/
+F:	package/fuse-overlayfs/
 F:	package/go/
 F:	package/mosh/
 F:	package/pkg-golang.mk
diff --git a/package/Config.in b/package/Config.in
index 7e4476d337..dc24921e0f 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -203,6 +203,7 @@ menu "Filesystem and flash utilities"
 	source "package/f2fs-tools/Config.in"
 	source "package/flashbench/Config.in"
 	source "package/fscryptctl/Config.in"
+	source "package/fuse-overlayfs/Config.in"
 	source "package/fwup/Config.in"
 	source "package/genext2fs/Config.in"
 	source "package/genpart/Config.in"
diff --git a/package/fuse-overlayfs/Config.in b/package/fuse-overlayfs/Config.in
new file mode 100644
index 0000000000..7647c5a1a4
--- /dev/null
+++ b/package/fuse-overlayfs/Config.in
@@ -0,0 +1,15 @@
+config BR2_PACKAGE_FUSE_OVERLAYFS
+	bool "fuse-overlayfs"
+	depends on !BR2_STATIC_LIBS # libfuse3
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libfuse3
+	depends on BR2_USE_MMU # libfuse3
+	select BR2_PACKAGE_LIBFUSE3
+	help
+	  FUSE-overlayfs is an implementation of overlay+shiftfs in
+	  FUSE, intended to be used for rootless containers.
+
+	  http://github.com/containers/fuse-overlayfs
+
+comment "fuse-overlayfs needs a toolchain w/ threads, dynamic library"
+	depends on BR2_USE_MMU
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
diff --git a/package/fuse-overlayfs/fuse-overlayfs.hash b/package/fuse-overlayfs/fuse-overlayfs.hash
new file mode 100644
index 0000000000..ee1eb694c9
--- /dev/null
+++ b/package/fuse-overlayfs/fuse-overlayfs.hash
@@ -0,0 +1,4 @@
+# Locally computed
+sha256	060168c2d5a8c6cc768b4542eba9953b7ff4a31f94bfb2e05b3d1051390838b1  fuse-overlayfs-1.1.0.tar.gz
+# Locally computed
+sha256	8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/fuse-overlayfs/fuse-overlayfs.mk b/package/fuse-overlayfs/fuse-overlayfs.mk
new file mode 100644
index 0000000000..25f4eadd11
--- /dev/null
+++ b/package/fuse-overlayfs/fuse-overlayfs.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# fuse-overlayfs
+#
+################################################################################
+
+FUSE_OVERLAYFS_VERSION = 1.1.0
+FUSE_OVERLAYFS_SITE = $(call github,containers,fuse-overlayfs,v$(FUSE_OVERLAYFS_VERSION))
+FUSE_OVERLAYFS_LICENSE = GPL-3.0
+FUSE_OVERLAYFS_LICENSE_FILES = COPYING
+
+FUSE_OVERLAYFS_AUTORECONF = YES
+FUSE_OVERLAYFS_DEPENDENCIES = libfuse3 host-pkgconf
+
+$(eval $(autotools-package))
-- 
2.27.0
