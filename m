From: Sergio Prado <sergio.prado@e-labworks.com>
Date: Sat, 10 Apr 2021 09:23:57 -0300
Subject: [Buildroot] [PATCH v2 2/2] oci: add new filesystem type
In-Reply-To: <20210410122357.12641-1-sergio.prado@e-labworks.com>
References: <20210410122357.12641-1-sergio.prado@e-labworks.com>
Message-ID: <20210410122357.12641-3-sergio.prado@e-labworks.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add support to generate OCI (Open Container Initiative) images.

An OCI image consists of a manifest, an image index (optional), a set of
filesystem layers, and a configuration. The complete specification is
available in the link below:

https://github.com/opencontainers/image-spec/blob/master/spec.md

The image is generated with the host tool sloci-image, and config
options can be used to configure image parameters.

By default, the image is generated in a directory called rootfs-oci:

$ cd output/images
$ ls rootfs-oci/
blobs  index.json  oci-layout

Optionally, the image can be packed into a tar archive.

The image can be pushed to a registry using containers tools like
skopeo:

$ skopeo copy --dest-creds <user>:<pass> oci:rootfs-oci:<tag> \
	docker://<user>/<image>[:tag]

And then we can pull/run the container image with tools like docker:

$ docker run -it <user>/<image>[:tag]

Signed-off-by: Sergio Prado <sergio.prado@e-labworks.com>
---
 fs/Config.in     |  1 +
 fs/oci/Config.in | 88 ++++++++++++++++++++++++++++++++++++++++++
 fs/oci/oci.mk    | 99 ++++++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 188 insertions(+)
 create mode 100644 fs/oci/Config.in
 create mode 100644 fs/oci/oci.mk

diff --git a/fs/Config.in b/fs/Config.in
index 37a2aa21f8ac..eee5e26bb2b3 100644
--- a/fs/Config.in
+++ b/fs/Config.in
@@ -11,6 +11,7 @@ source "fs/f2fs/Config.in"
 source "fs/initramfs/Config.in"
 source "fs/iso9660/Config.in"
 source "fs/jffs2/Config.in"
+source "fs/oci/Config.in"
 source "fs/romfs/Config.in"
 source "fs/squashfs/Config.in"
 source "fs/tar/Config.in"
diff --git a/fs/oci/Config.in b/fs/oci/Config.in
new file mode 100644
index 000000000000..dd7112ea8a1e
--- /dev/null
+++ b/fs/oci/Config.in
@@ -0,0 +1,88 @@
+config BR2_TARGET_ROOTFS_OCI
+	bool "oci image"
+	help
+	  Build an OCI (Open Container Initiative) image.
+
+	  By default, the image is generated in a directory called
+	  rootfs-oci:
+
+	  $ cd output/images
+	  $ ls rootfs-oci/
+	  blobs  index.json  oci-layout
+
+	  You can push the image to a registry. Example using skopeo:
+
+	  $ skopeo copy --dest-creds <user>:<pass> \
+	           oci:rootfs-oci:<tag> docker://<user>/<image>[:tag]
+
+	  And pull/run it with docker:
+
+	  $ docker run -it <user>/<image>[:tag]
+
+if BR2_TARGET_ROOTFS_OCI
+
+config BR2_TARGET_ROOTFS_OCI_AUTHOR
+	string "author name and/or email address"
+	default "Buildroot"
+	help
+	  Name and/or email address of the person which created the
+	  image.
+
+config BR2_TARGET_ROOTFS_OCI_TAG
+	string "image tag"
+	default "latest"
+	help
+	  Tag to be used in the container image. If empty, 'latest' will
+	  be used by default.
+
+config BR2_TARGET_ROOTFS_OCI_ENTRYPOINT
+	string "entrypoint"
+	default "sh"
+	help
+	  Command to execute when the container starts.
+
+config BR2_TARGET_ROOTFS_OCI_ENTRYPOINT_ARGS
+	string "entrypoint arguments"
+	help
+	  Default arguments to the entrypoint of the container.
+
+config BR2_TARGET_ROOTFS_OCI_WORKDIR
+	string "working directory"
+	help
+	  Working directory of the entrypoint process in the
+	  container.
+
+config BR2_TARGET_ROOTFS_OCI_UID
+	string "username or UID"
+	default "0"
+	help
+	  The username or UID of user the process run as.
+
+config BR2_TARGET_ROOTFS_OCI_ENV_VARS
+	string "environment variables"
+	help
+	  Default environment variables for the container.
+
+config BR2_TARGET_ROOTFS_OCI_PORTS
+	string "ports"
+	help
+	  Default set of ports to expose from a container running
+	  this image in the following format:
+
+	  <port>/tcp, <port>/udp, <port> (same as <port>/tcp).
+
+config BR2_TARGET_ROOTFS_OCI_LABELS
+	string "labels"
+	help
+	  Metadata in the format KEY=VALUE for the container compliant
+	  with OCI annotation rules. If KEY starts with a dot, it will
+	  be prefixed with "org.opencontainers.image"
+	  (e.g. .url -> org.opencontainers.image.url).
+
+config BR2_TARGET_ROOTFS_OCI_ARCHIVE
+	bool "pack oci image into a tar archive"
+	default n
+	help
+	  Select whether the image should be packed into a TAR archive.
+
+endif
diff --git a/fs/oci/oci.mk b/fs/oci/oci.mk
new file mode 100644
index 000000000000..09c3e88069ca
--- /dev/null
+++ b/fs/oci/oci.mk
@@ -0,0 +1,99 @@
+################################################################################
+#
+# Build the oci image
+#
+################################################################################
+
+ROOTFS_OCI_IMAGE_NAME = rootfs-oci
+
+ROOTFS_OCI_DEPENDENCIES = host-sloci-image
+
+# architecture
+OCI_SLOCI_IMAGE_OPTS = --arch $(BR2_ARCH)
+
+# architecture variant (typically used only for arm)
+ifeq ($(BR2_ARM_CPU_HAS_ARM),y)
+ifeq ($(BR2_ARM_CPU_ARMV5),y)
+OCI_SLOCI_IMAGE_OPTS += --arch-variant v5
+else ifeq ($(BR2_ARM_CPU_ARMV6),y)
+OCI_SLOCI_IMAGE_OPTS += --arch-variant v6
+else ifeq ($(BR2_ARM_CPU_ARMV7A),y)
+OCI_SLOCI_IMAGE_OPTS += --arch-variant v7
+else ifeq ($(BR2_ARM_CPU_ARMV8A),y)
+OCI_SLOCI_IMAGE_OPTS += --arch-variant v8
+endif
+endif
+
+# entrypoint
+OCI_ENTRYPOINT = $(call qstrip,$(BR2_TARGET_ROOTFS_OCI_ENTRYPOINT))
+ifneq ($(OCI_ENTRYPOINT),)
+OCI_SLOCI_IMAGE_OPTS += --entrypoint $(OCI_ENTRYPOINT)
+endif
+
+# entrypoint arguments
+OCI_ENTRYPOINT_ARGS = $(call qstrip,$(BR2_TARGET_ROOTFS_OCI_ENTRYPOINT_ARGS))
+ifneq ($(OCI_ENTRYPOINT_ARGS),)
+OCI_SLOCI_IMAGE_OPTS += --cmd "$(OCI_ENTRYPOINT_ARGS)"
+endif
+
+# author
+OCI_AUTHOR = $(call qstrip,$(BR2_TARGET_ROOTFS_OCI_AUTHOR))
+ifneq ($(OCI_AUTHOR),)
+OCI_SLOCI_IMAGE_OPTS += --author "$(OCI_AUTHOR)"
+endif
+
+# username or UID
+OCI_UID = $(call qstrip,$(BR2_TARGET_ROOTFS_OCI_UID))
+ifneq ($(OCI_UID),)
+OCI_SLOCI_IMAGE_OPTS += --user $(OCI_UID)
+endif
+
+# labels
+OCI_LABELS = $(call qstrip,$(BR2_TARGET_ROOTFS_OCI_LABELS))
+ifneq ($(OCI_LABELS),)
+OCI_SLOCI_IMAGE_OPTS += \
+	$(foreach label,$(OCI_LABELS),--label $(label))
+endif
+
+# environment variables
+OCI_ENV_VARS = $(call qstrip,$(BR2_TARGET_ROOTFS_OCI_ENV_VARS))
+ifneq ($(OCI_ENV_VARS),)
+OCI_SLOCI_IMAGE_OPTS += \
+	$(foreach var,$(OCI_ENV_VARS),--env $(var))
+endif
+
+# working directory
+OCI_WORKDIR = $(call qstrip,$(BR2_TARGET_ROOTFS_OCI_WORKDIR))
+ifneq ($(OCI_WORKDIR),)
+OCI_SLOCI_IMAGE_OPTS += --working-dir $(OCI_WORKDIR)
+endif
+
+# ports
+OCI_PORTS = $(call qstrip,$(BR2_TARGET_ROOTFS_OCI_PORTS))
+ifneq ($(OCI_PORTS),)
+OCI_SLOCI_IMAGE_OPTS += \
+	$(foreach port,$(OCI_PORTS),--port $(port))
+endif
+
+# tag
+OCI_TAG = $(call qstrip,$(BR2_TARGET_ROOTFS_OCI_TAG))
+ifeq ($(OCI_TAG),)
+# we need a tag, so if it is empty, it is safe to override here
+# check-package OverriddenVariable
+OCI_TAG = latest
+endif
+
+# enable tar archive
+ifeq ($(BR2_TARGET_ROOTFS_OCI_ARCHIVE),y)
+OCI_SLOCI_IMAGE_OPTS += --tar
+endif
+
+define ROOTFS_OCI_CMD
+	(cd $(BINARIES_DIR); \
+		rm -rf $(ROOTFS_OCI_IMAGE_NAME)*
+		$(HOST_DIR)/bin/sloci-image $(OCI_SLOCI_IMAGE_OPTS) $(TARGET_DIR) \
+			$(ROOTFS_OCI_IMAGE_NAME):$(OCI_TAG)
+	)
+endef
+
+$(eval $(rootfs))
-- 
2.17.1
