Return-Path: <SRS0=HL2s=OB=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 298A0C433F5
	for <buildroot@archiver.kernel.org>; Sat, 11 Sep 2021 12:53:28 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9460C611B0
	for <buildroot@archiver.kernel.org>; Sat, 11 Sep 2021 12:53:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9460C611B0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5BE5983B10;
	Sat, 11 Sep 2021 12:53:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3AYyVVwTmuAG; Sat, 11 Sep 2021 12:53:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 912BA837C0;
	Sat, 11 Sep 2021 12:53:25 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 951B31BF31A
 for <buildroot@lists.busybox.net>; Sat, 11 Sep 2021 12:53:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 83AAF40684
 for <buildroot@lists.busybox.net>; Sat, 11 Sep 2021 12:53:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SN1AmnHABltH for <buildroot@lists.busybox.net>;
 Sat, 11 Sep 2021 12:53:10 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 82D764044C
 for <buildroot@buildroot.org>; Sat, 11 Sep 2021 12:53:10 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 8688688F3A; Sat, 11 Sep 2021 12:51:32 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sat, 11 Sep 2021 14:52:41 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e83974e2f9f5b7380e78f417b1ef5e0d919d724c
X-Git-Newrev: ccda2f4bdc97d2f5a4a1efdb357ece8e5b57e10d
X-Patchwork-Hint: ignore
Message-Id: <20210911125132.8688688F3A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] fs: new OCI filesystem type
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=ccda2f4bdc97d2f5a4a1efdb357ece8e5b57e10d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
[Arnout:
 - mention in help text that options are space separated;
 - use GO_GOARCH and GO_GOARM for architecture;
 - quote all arguments;
 - don't cd to BINARIES_DIR;
 - remove ROOTFS_OCI_IMAGE_NAME variable;
 - remove wildcard from rm.
]
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 fs/Config.in     |  1 +
 fs/oci/Config.in | 89 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 fs/oci/oci.mk    | 80 ++++++++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 170 insertions(+)

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
index 0000000000..176785810a
--- /dev/null
+++ b/fs/oci/Config.in
@@ -0,0 +1,89 @@
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
+	  Space-separated list of variable=value assignments.
+
+config BR2_TARGET_ROOTFS_OCI_PORTS
+	string "ports"
+	help
+	  Default set of ports to expose from a container running
+	  this image as a space-separted list of ports in the following
+	  format:
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
+	help
+	  Select whether the image should be packed into a TAR archive.
+
+endif
diff --git a/fs/oci/oci.mk b/fs/oci/oci.mk
new file mode 100644
index 0000000000..aa81920d36
--- /dev/null
+++ b/fs/oci/oci.mk
@@ -0,0 +1,80 @@
+################################################################################
+#
+# Build the oci image
+#
+################################################################################
+
+ROOTFS_OCI_DEPENDENCIES = host-sloci-image
+
+# architecture - take it from Go
+OCI_SLOCI_IMAGE_OPTS = --arch $(GO_GOARCH)
+
+# architecture variant (typically used only for arm)
+OCI_SLOCI_IMAGE_OPTS += $(and $(GO_GOARM),--arch-variant v$(GO_GOARM))
+
+# entrypoint
+OCI_ENTRYPOINT = $(call qstrip,$(BR2_TARGET_ROOTFS_OCI_ENTRYPOINT))
+ifneq ($(OCI_ENTRYPOINT),)
+OCI_SLOCI_IMAGE_OPTS += --entrypoint "$(OCI_ENTRYPOINT)"
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
+OCI_SLOCI_IMAGE_OPTS += --user "$(OCI_UID)"
+endif
+
+# labels
+OCI_LABELS = $(call qstrip,$(BR2_TARGET_ROOTFS_OCI_LABELS))
+ifneq ($(OCI_LABELS),)
+OCI_SLOCI_IMAGE_OPTS += \
+	$(foreach label,$(OCI_LABELS),--label "$(label)")
+endif
+
+# environment variables
+OCI_ENV_VARS = $(call qstrip,$(BR2_TARGET_ROOTFS_OCI_ENV_VARS))
+ifneq ($(OCI_ENV_VARS),)
+OCI_SLOCI_IMAGE_OPTS += \
+	$(foreach var,$(OCI_ENV_VARS),--env "$(var)")
+endif
+
+# working directory
+OCI_WORKDIR = $(call qstrip,$(BR2_TARGET_ROOTFS_OCI_WORKDIR))
+ifneq ($(OCI_WORKDIR),)
+OCI_SLOCI_IMAGE_OPTS += --working-dir "$(OCI_WORKDIR)"
+endif
+
+# ports
+OCI_PORTS = $(call qstrip,$(BR2_TARGET_ROOTFS_OCI_PORTS))
+ifneq ($(OCI_PORTS),)
+OCI_SLOCI_IMAGE_OPTS += \
+	$(foreach port,$(OCI_PORTS),--port "$(port)")
+endif
+
+# tag
+OCI_TAG = $(or $(call qstrip,$(BR2_TARGET_ROOTFS_OCI_TAG)),latest)
+
+# enable tar archive
+ifeq ($(BR2_TARGET_ROOTFS_OCI_ARCHIVE),y)
+OCI_SLOCI_IMAGE_OPTS += --tar
+endif
+
+define ROOTFS_OCI_CMD
+	rm -rf $(BINARIES_DIR)/rootfs-oci
+	$(HOST_DIR)/bin/sloci-image $(OCI_SLOCI_IMAGE_OPTS) $(TARGET_DIR) \
+		$(BINARIES_DIR)/rootfs-oci:$(OCI_TAG)
+endef
+
+$(eval $(rootfs))
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
