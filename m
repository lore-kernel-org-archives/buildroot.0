Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66E3AC71136
	for <buildroot@archiver.kernel.org>; Thu, 19 Jun 2025 07:39:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 007DD60AEE;
	Thu, 19 Jun 2025 07:39:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OSy1xErvUpxA; Thu, 19 Jun 2025 07:39:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 38AFC60711
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 38AFC60711;
	Thu, 19 Jun 2025 07:39:56 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id C8C47181
 for <buildroot@buildroot.org>; Thu, 19 Jun 2025 07:39:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BB1A14044C
 for <buildroot@buildroot.org>; Thu, 19 Jun 2025 07:39:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7bHGMfb8GwNZ for <buildroot@buildroot.org>;
 Thu, 19 Jun 2025 07:39:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=80.12.126.238;
 helo=smtp-out.orange.com; envelope-from=yann.morin@orange.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 4507940092
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4507940092
Received: from smtp-out.orange.com (smtp-out.orange.com [80.12.126.238])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4507940092
 for <buildroot@buildroot.org>; Thu, 19 Jun 2025 07:39:53 +0000 (UTC)
X-CSE-ConnectionGUID: 09+MUEvcRQGurv0OZKPbeA==
X-CSE-MsgGUID: WJImaUGWQ/6+eXDAyt6qIQ==
Received: from unknown (HELO opfedv3rlp0g.nor.fr.ftgroup) ([x.x.x.x]) by
 smtp-out.orange.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jun 2025 09:39:51 +0200
Received: from unknown (HELO OPE16NORMBX305.corporate.adroot.infra.ftgroup)
 ([x.x.x.x]) by opfedv3rlp0g.nor.fr.ftgroup with
 ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 19 Jun 2025 09:39:50 +0200
Received: from yd-6wlzhs3 [x.x.x.x] by
 OPE16NORMBX305.corporate.adroot.infra.ftgroup
 [x.x.x.x] with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39;
 Thu, 19 Jun 2025 09:39:48 +0200
Received: by yd-6wlzhs3 (sSMTP sendmail emulation);
 Thu, 19 Jun 2025 09:39:48 +0200
X-CSE-ConnectionGUID: 5Z12F2R8QKe/kyeM3VBTaQ==
X-CSE-MsgGUID: 1beyanTwQdupSU8iLrxNzg==
X-IronPort-AV: E=Sophos;i="6.16,247,1744063200"; d="scan'208";a="302038046"
From: <yann.morin@orange.com>
To: <buildroot@buildroot.org>
CC: <yann.morin@orange.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 19 Jun 2025 09:39:46 +0200
Message-ID: <026284a73a78b0273882e10fc31b16b5bac5c566.1750318763.git.yann.morin@orange.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1750318763.git.yann.morin@orange.com>
References: <cover.1750318763.git.yann.morin@orange.com>
MIME-Version: 1.0
X-Originating-IP: [10.115.26.50]
X-ClientProxiedBy: OPE16NORMBX301.corporate.adroot.infra.ftgroup
 (10.115.26.10) To OPE16NORMBX305.corporate.adroot.infra.ftgroup
 (10.115.27.10)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=orange.com; i=@orange.com; q=dns/txt; s=orange002;
 t=1750318794; x=1781854794;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ohlwr/ymNxg4I7noeuFl9OIoaY7i0III+kPKTkKenkk=;
 b=gc9c0r29Fk2gJHe6OjFGZQlErQiEIOaAlZDvSMWlmHl/AGPAa+aS647L
 26NXcEf7TQlyhHFsnoqZXLxcBBmOv7jUEgYVl75gTVLi1ZT33k18Hcxb0
 HrmL9CWE3u3PkXinDrNef+QMJ83KgiK5ABBWJ8g0CTkfwIm9OSMj3/HtN
 6C1Kf+CQvJdFNs7ckgSTPs33jg/FMarvxclEF41zrn/Ijg/sIHRGTpDt/
 5m2htdeJedurGIrZLeDdJk0mTaVaepDM+xlnvOjYr7qfoZf/pdAxq6RgV
 Aw+ca15JgO7lHOxGTw6XDnED605BZ5gc6ClVDPW0X8o/Ly0Cv6Y8ARPsa
 w==;
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=orange.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=orange.com header.i=@orange.com header.a=rsa-sha256
 header.s=orange002 header.b=gc9c0r29
Subject: [Buildroot] [PATCH 1/3 v2] package/containers-image-config: new
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: "Yann E. MORIN" <yann.morin@orange.com>

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
---
 package/Config.in                             |  1 +
 package/containers-image-config/Config.in     |  8 ++++++
 .../containers-image-config.hash              |  3 +++
 .../containers-image-config.mk                | 25 +++++++++++++++++++
 package/podman/Config.in                      |  1 +
 package/podman/podman.mk                      | 10 --------
 package/podman/policy.json                    |  7 ------
 package/podman/registries.conf                |  1 -
 8 files changed, 38 insertions(+), 18 deletions(-)
 create mode 100644 package/containers-image-config/Config.in
 create mode 100644 package/containers-image-config/containers-image-config.hash
 create mode 100644 package/containers-image-config/containers-image-config.mk
 delete mode 100644 package/podman/policy.json
 delete mode 100644 package/podman/registries.conf

diff --git a/package/Config.in b/package/Config.in
index 227c81ebed..c4ed3235f9 100644
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
-- 
2.34.1

____________________________________________________________________________________________________________
Ce message et ses pieces jointes peuvent contenir des informations confidentielles ou privilegiees et ne doivent donc
pas etre diffuses, exploites ou copies sans autorisation. Si vous avez recu ce message par erreur, veuillez le signaler
a l'expediteur et le detruire ainsi que les pieces jointes. Les messages electroniques etant susceptibles d'alteration,
Orange decline toute responsabilite si ce message a ete altere, deforme ou falsifie. Merci.

This message and its attachments may contain confidential or privileged information that may be protected by law;
they should not be distributed, used or copied without authorisation.
If you have received this email in error, please notify the sender and delete this message and its attachments.
As emails may be altered, Orange is not liable for messages that have been modified, changed or falsified.
Thank you.

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
