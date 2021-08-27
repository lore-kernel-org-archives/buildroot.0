Return-Path: <SRS0=sHoS=NS=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-21.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C8C3C432BE
	for <buildroot@archiver.kernel.org>; Fri, 27 Aug 2021 20:54:44 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EDDE460F4F
	for <buildroot@archiver.kernel.org>; Fri, 27 Aug 2021 20:54:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org EDDE460F4F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=busybox.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B7916427B8;
	Fri, 27 Aug 2021 20:54:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id l127EmcfTFbg; Fri, 27 Aug 2021 20:54:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1B60D427C2;
	Fri, 27 Aug 2021 20:54:39 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2FF8F1BF4D6
 for <buildroot@lists.busybox.net>; Fri, 27 Aug 2021 20:54:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1FC4F80D85
 for <buildroot@lists.busybox.net>; Fri, 27 Aug 2021 20:54:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GjolyfX1nHWO for <buildroot@lists.busybox.net>;
 Fri, 27 Aug 2021 20:54:33 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from secvs05.rockwellcollins.com (secvs05.rockwellcollins.com
 [205.175.225.131])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2526180D1F
 for <buildroot@buildroot.org>; Fri, 27 Aug 2021 20:54:32 +0000 (UTC)
IronPort-SDR: gCvsHc7fNdSN97uaYej7LzI+L1UAezslr/IEnEJCB15BUYXEDSUqPEJYmgZBPPoM1rVyHOEG5J
 4QuPjP/30zP7RlNtc2JItCjZeLpzkX/Fv9brQwYhp9TcBP8gZ3VbsltMGlRUc8VFLjCeO+1xSZ
 YU/0FXGltnu7X5VVCl79dXgl0bZFkYS4QR5UUpxXs45ufDVYed6KdAey/IxOymgJ+CWZ2fBj73
 5g5gctnQcv3ZqFpo/HNZKl1I8X6RLBI6I4LDYgB5hXAAu4Sf1KWbBNSWJVxIfNf4fHB7SUI24V
 J4A=
Received: from ofwgwc03.rockwellcollins.com (HELO
 ciulimr02.rockwellcollins.com) ([205.175.225.12])
 by secvs05.rockwellcollins.com with ESMTP; 27 Aug 2021 15:54:31 -0500
X-Received: from biscuits.rockwellcollins.com (biscuits.rockwellcollins.lab
 [10.148.119.137])
 by ciulimr02.rockwellcollins.com (Postfix) with ESMTP id E577F201D5;
 Fri, 27 Aug 2021 15:54:30 -0500 (CDT)
To: buildroot@buildroot.org
Date: Fri, 27 Aug 2021 15:54:29 -0500
Message-Id: <20210827205430.39745-3-matthew.weber@collins.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210827205430.39745-1-matthew.weber@collins.com>
References: <20210827205430.39745-1-matthew.weber@collins.com>
Subject: [Buildroot] [PATCH v3 2/3] fs: new OCI filesystem type
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
From: Matthew Weber via buildroot <buildroot@busybox.net>
Reply-To: Matthew Weber <matthew.weber@collins.com>
Cc: Sergio Prado <sergio.prado@e-labworks.com>,
 Matthew Weber <matthew.weber@collins.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

From: Sergio Prado <sergio.prado@e-labworks.com>

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
Signed-off-by: Matthew Weber <matthew.weber@collins.com>
---
 fs/Config.in     |  1 +
 fs/oci/Config.in | 88 ++++++++++++++++++++++++++++++++++++++++++
 fs/oci/oci.mk    | 99 ++++++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 188 insertions(+)
 create mode 100644 fs/oci/Config.in
 create mode 100644 fs/oci/oci.mk

diff --git a/fs/Config.in b/fs/Config.in
index 37a2aa21f8..eee5e26bb2 100644
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
index 0000000000..dd7112ea8a
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
index 0000000000..09c3e88069
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

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
