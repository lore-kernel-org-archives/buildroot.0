Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71F1FC7EE30
	for <buildroot@archiver.kernel.org>; Sun, 29 Jun 2025 16:57:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1CD4C60A4D;
	Sun, 29 Jun 2025 16:57:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AKVYEA5CmlWM; Sun, 29 Jun 2025 16:57:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2D91C60A79
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2D91C60A79;
	Sun, 29 Jun 2025 16:57:01 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 3BAC7DF
 for <buildroot@buildroot.org>; Sun, 29 Jun 2025 16:56:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1F09C60A4D
 for <buildroot@buildroot.org>; Sun, 29 Jun 2025 16:56:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oXCkgtmEsTHm for <buildroot@buildroot.org>;
 Sun, 29 Jun 2025 16:56:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 18E9560906
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 18E9560906
 for <buildroot@buildroot.org>; Sun, 29 Jun 2025 16:56:57 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 12B0884BCC; Sun, 29 Jun 2025 16:56:57 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 29 Jun 2025 15:57:37 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 89ca1bd4f489ff6738f7c317dc6d9cfdbf362bc7
X-Git-Newrev: 4686ab975b97ddd534ef195c87081b930271d616
X-Patchwork-Hint: ignore
Message-Id: <20250629165657.12B0884BCC@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/containers-image-config: new
 package
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=4686ab975b97ddd534ef195c87081b930271d616
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The container/image repository is the standards regpository that drives
the image management in container tools, like podman or skopeo. Besides
a Go library, it also prodvides the template configuration files used
by those tools; those files can also serve as default ones.

Install those files instead of the canned ones we cary in podman, and
change podman to use this new package too.

The registry file needs a fixup, as it by default does not allow
searching unqualified images (i.e. those that do not contain a registry
name) in a default registry, for security reasons. However, the Docker
Hub is traditionally a registry that can be accessed without being
specified, so we make that possible.

As was noted in ebbaac08e3f4 (package/podman: new package), "[p]roviding
actual files is going to be use-case dependent, and interested parties
will have to provide their own config files, e.g. in a rootfs overlay."

Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/Config.in                                  |  1 +
 package/containers-image-config/Config.in          |  8 +++++++
 .../containers-image-config.hash                   |  3 +++
 .../containers-image-config.mk                     | 25 ++++++++++++++++++++++
 package/podman/Config.in                           |  1 +
 package/podman/podman.mk                           | 10 ---------
 package/podman/policy.json                         |  7 ------
 package/podman/registries.conf                     |  1 -
 8 files changed, 38 insertions(+), 18 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index ee0532a0d9..f2c868415f 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2844,6 +2844,7 @@ menu "System tools"
 	source "package/circus/Config.in"
 	source "package/conmon/Config.in"
 	source "package/containerd/Config.in"
+	source "package/containers-image-config/Config.in"
 	source "package/coreutils/Config.in"
 	source "package/cpulimit/Config.in"
 	source "package/cpuload/Config.in"
diff --git a/package/containers-image-config/Config.in b/package/containers-image-config/Config.in
new file mode 100644
index 0000000000..d40712e56d
--- /dev/null
+++ b/package/containers-image-config/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_CONTAINERS_IMAGE_CONFIG
+	bool "containers-image-config"
+	help
+	  Install default, minimalist configuration files used by the
+	  various tools dealing with containers images, like podman,
+	  skopeo...
+
+	  https://github.com/containers/image
diff --git a/package/containers-image-config/containers-image-config.hash b/package/containers-image-config/containers-image-config.hash
new file mode 100644
index 0000000000..0159b0fc62
--- /dev/null
+++ b/package/containers-image-config/containers-image-config.hash
@@ -0,0 +1,3 @@
+# Locally computed:
+sha256  afdbb1487571d4cc8974e11c72bc4e05043fb490cfc0581783789f414c64f87b  containers-image-config-v5.35.0-git4.tar.gz
+sha256  716a8b80635c394681e652823e1e42e411ad2d254e1f202403422d74f4b0b106  LICENSE
diff --git a/package/containers-image-config/containers-image-config.mk b/package/containers-image-config/containers-image-config.mk
new file mode 100644
index 0000000000..2f03f8e8fb
--- /dev/null
+++ b/package/containers-image-config/containers-image-config.mk
@@ -0,0 +1,25 @@
+################################################################################
+#
+# containers-image-config
+#
+################################################################################
+
+CONTAINERS_IMAGE_CONFIG_VERSION = v5.35.0
+CONTAINERS_IMAGE_CONFIG_SITE = https://github.com/containers/image
+CONTAINERS_IMAGE_CONFIG_SITE_METHOD = git
+
+CONTAINERS_IMAGE_CONFIG_LICENSE = Apache-2.0
+CONTAINERS_IMAGE_CONFIG_LICENSE_FILES = LICENSE
+
+define CONTAINERS_IMAGE_CONFIG_INSTALL_TARGET_CMDS
+	$(INSTALL) -D -m 0644 \
+		$(@D)/default-policy.json \
+		$(TARGET_DIR)/etc/containers/policy.json
+	$(INSTALL) -D -m 0644 \
+		$(@D)/registries.conf \
+		$(TARGET_DIR)/etc/containers/registries.conf
+	$(SED) '/^# unqualified-search-registries = .*/s//unqualified-search-registries = ["docker.io"]/' \
+		$(TARGET_DIR)/etc/containers/registries.conf
+endef
+
+$(eval $(generic-package))
diff --git a/package/podman/Config.in b/package/podman/Config.in
index 2bcb8e71d2..6bfd477f38 100644
--- a/package/podman/Config.in
+++ b/package/podman/Config.in
@@ -12,6 +12,7 @@ config BR2_PACKAGE_PODMAN
 	select BR2_PACKAGE_CA_CERTIFICATES  # runtime
 	select BR2_PACKAGE_CGROUPFS_V2_MOUNT if !BR2_PACKAGE_CGROUPFS_MOUNT && !BR2_INIT_SYSTEMD  # runtime
 	select BR2_PACKAGE_CONMON  # runtime
+	select BR2_PACKAGE_CONTAINERS_IMAGE_CONFIG  # runtime
 	select BR2_PACKAGE_LIBGPGME
 	select BR2_PACKAGE_LIBSECCOMP
 	select BR2_PACKAGE_NETAVARK  # runtime
diff --git a/package/podman/podman.mk b/package/podman/podman.mk
index 7ca9b9ddcb..27d9a84712 100644
--- a/package/podman/podman.mk
+++ b/package/podman/podman.mk
@@ -99,16 +99,6 @@ define PODMAN_LINUX_CONFIG_FIXUPS
 	$(PODMAN_LINUX_CONFIG_FIXUPS_BTRFS)
 endef
 
-define PODMAN_CONFIG
-	$(Q)$(INSTALL) -D -m 0644 \
-		$(PODMAN_PKGDIR)/policy.json \
-		$(TARGET_DIR)/etc/containers/policy.json
-	$(Q)$(INSTALL) -D -m 0644 \
-		$(PODMAN_PKGDIR)/registries.conf \
-		$(TARGET_DIR)/etc/containers/registries.conf
-endef
-PODMAN_POST_INSTALL_TARGET_HOOKS += PODMAN_CONFIG
-
 define PODMAN_HELPERS
 	$(Q)mkdir -p $(TARGET_DIR)/usr/libexec/podman
 	$(Q)ln -sf ../../bin/aardvark-dns $(TARGET_DIR)/usr/libexec/podman/aardvark-dns
diff --git a/package/podman/policy.json b/package/podman/policy.json
deleted file mode 100644
index 9333053f93..0000000000
--- a/package/podman/policy.json
+++ /dev/null
@@ -1,7 +0,0 @@
-{
-  "default": [
-    {
-      "type": "insecureAcceptAnything"
-    }
-  ]
-}
diff --git a/package/podman/registries.conf b/package/podman/registries.conf
deleted file mode 100644
index d44d892da3..0000000000
--- a/package/podman/registries.conf
+++ /dev/null
@@ -1 +0,0 @@
-unqualified-search-registries = ["docker.io"]
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
