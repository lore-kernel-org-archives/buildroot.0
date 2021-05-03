From: Christian Stewart <christian@paral.in>
Date: Sun,  2 May 2021 19:33:05 -0700
Subject: [Buildroot] [PATCH v1 3/3] package/genuinetools-img: new host and
 target package
In-Reply-To: <20210503023305.161122-1-christian@paral.in>
References: <20210503023305.161122-1-christian@paral.in>
Message-ID: <20210503023305.161122-3-christian@paral.in>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Img is a standalone, daemon-less, unprivileged Dockerfile and OCI compatible
container image builder. It uses the moby-buildkit solver internally. The
commands/UX mirror the Docker CLI for workflow compatibility.

Using the genuinetools- prefix due to the generic nature of the "img" name.

Adds both host and target variants. fuse-overlayfs can be used as an
unprivileged and rootless overlay filesystem backend.

https://github.com/genuinetools/img

Signed-off-by: Christian Stewart <christian@paral.in>
---
 package/Config.in                             |  1 +
 package/Config.in.host                        |  1 +
 package/genuinetools-img/Config.in            | 23 ++++++++++++++++
 package/genuinetools-img/Config.in.host       |  9 +++++++
 .../genuinetools-img/genuinetools-img.hash    |  3 +++
 package/genuinetools-img/genuinetools-img.mk  | 27 +++++++++++++++++++
 6 files changed, 64 insertions(+)
 create mode 100644 package/genuinetools-img/Config.in
 create mode 100644 package/genuinetools-img/Config.in.host
 create mode 100644 package/genuinetools-img/genuinetools-img.hash
 create mode 100644 package/genuinetools-img/genuinetools-img.mk

diff --git a/package/Config.in b/package/Config.in
index 7ac10b9d42..f352f6b168 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2444,6 +2444,7 @@ menu "System tools"
 	source "package/emlog/Config.in"
 	source "package/ftop/Config.in"
 	source "package/getent/Config.in"
+	source "package/genuinetools-img/Config.in"
 	source "package/gkrellm/Config.in"
 	source "package/htop/Config.in"
 	source "package/ibm-sw-tpm2/Config.in"
diff --git a/package/Config.in.host b/package/Config.in.host
index 0dbf63f2c8..391742856d 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -32,6 +32,7 @@ menu "Host utilities"
 	source "package/genext2fs/Config.in.host"
 	source "package/genimage/Config.in.host"
 	source "package/genpart/Config.in.host"
+	source "package/genuinetools-img/Config.in.host"
 	source "package/gnupg/Config.in.host"
 	source "package/go/Config.in.host"
 	source "package/go-bootstrap/Config.in.host"
diff --git a/package/genuinetools-img/Config.in b/package/genuinetools-img/Config.in
new file mode 100644
index 0000000000..eb4992db07
--- /dev/null
+++ b/package/genuinetools-img/Config.in
@@ -0,0 +1,23 @@
+config BR2_PACKAGE_GENUINETOOLS_IMG
+	bool "genuinetools-img"
+	depends on BR2_USE_MMU # fuse-overlayfs libfuse3
+	depends on !BR2_STATIC_LIBS # fuse-overlayfs libfuse3
+	depends on BR2_TOOLCHAIN_HAS_THREADS # fuse-overlayfs libfuse3
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_15 # fuse-overlayfs
+	depends on BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
+	depends on BR2_PACKAGE_HOST_GO_TARGET_CGO_LINKING_SUPPORTS
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_TOOLCHAIN_USES_UCLIBC
+	select BR2_PACKAGE_CGROUPFS_MOUNT if !BR2_PACKAGE_SYSTEMD # runtime dependency
+	select BR2_PACKAGE_FUSE_OVERLAYFS # runtime dependency
+	select BR2_PACKAGE_LIBFUSE3 # fuse-overlayfs
+	help
+	  Img is a standalone, daemon-less, unprivileged Dockerfile
+	  and OCI compatible container image builder.
+
+	  https://github.com/genuinetools/img
+
+comment "genuinetools-img needs a toolchain w/ threads, dynamic library, headers >= 3.15"
+	depends on BR2_USE_MMU
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS || \
+		!BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_15
diff --git a/package/genuinetools-img/Config.in.host b/package/genuinetools-img/Config.in.host
new file mode 100644
index 0000000000..bbef88acf6
--- /dev/null
+++ b/package/genuinetools-img/Config.in.host
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_HOST_GENUINETOOLS_IMG
+	bool "host genuinetools-img"
+	depends on BR2_PACKAGE_HOST_GO_HOST_ARCH_SUPPORTS
+	select BR2_PACKAGE_HOST_FUSE_OVERLAYFS # runtime dependency
+	help
+	  Img is a standalone, daemon-less, unprivileged Dockerfile
+	  and OCI compatible container image builder.
+
+	  https://github.com/genuinetools/img
diff --git a/package/genuinetools-img/genuinetools-img.hash b/package/genuinetools-img/genuinetools-img.hash
new file mode 100644
index 0000000000..097ad17d91
--- /dev/null
+++ b/package/genuinetools-img/genuinetools-img.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256  c6d805ab899db639fa08f0e33fe6673593be8336d288bb1cb4cb81a3229a916f  genuinetools-img-0.5.11.tar.gz
+sha256	c696614021eafe355c7fb0af3e724fc7fa8729a0c10c27cbed2505bf30a853ce  LICENSE
diff --git a/package/genuinetools-img/genuinetools-img.mk b/package/genuinetools-img/genuinetools-img.mk
new file mode 100644
index 0000000000..08330d1113
--- /dev/null
+++ b/package/genuinetools-img/genuinetools-img.mk
@@ -0,0 +1,27 @@
+################################################################################
+#
+# genuinetools-img
+#
+################################################################################
+
+GENUINETOOLS_IMG_VERSION = 0.5.11
+GENUINETOOLS_IMG_SITE = $(call github,genuinetools,img,v$(GENUINETOOLS_IMG_VERSION))
+
+GENUINETOOLS_IMG_LICENSE = MIT
+GENUINETOOLS_IMG_LICENSE_FILES = LICENSE
+
+GENUINETOOLS_IMG_DEPENDENCIES = host-pkgconf
+GENUINETOOLS_IMG_GOMOD = github.com/genuinetools/img
+
+GENUINETOOLS_IMG_TAGS = cgo noembed
+GENUINETOOLS_IMG_LDFLAGS = \
+	-X $(GENUINETOOLS_IMG_GOMOD)/version.VERSION="$(GENUINETOOLS_IMG_VERSION)"
+
+HOST_GENUINETOOLS_IMG_TAGS = $(GENUINETOOLS_IMG_TAGS)
+HOST_GENUINETOOLS_IMG_LDFLAGS = $(GENUINETOOLS_IMG_LDFLAGS)
+
+HOST_GENUINETOOLS_IMG_BIN_NAME = genuinetools-img
+HOST_GENUINETOOLS_IMG_INSTALL_BINS = $(HOST_GENUINETOOLS_IMG_BIN_NAME)
+
+$(eval $(golang-package))
+$(eval $(host-golang-package))
-- 
2.31.1
