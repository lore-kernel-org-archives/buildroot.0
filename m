Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 555B2107BCE2
	for <buildroot@archiver.kernel.org>; Fri, 13 Mar 2026 21:51:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2829960E43;
	Fri, 13 Mar 2026 21:51:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CcnfBVURVgCI; Fri, 13 Mar 2026 21:51:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 457B760E4B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773438700;
	bh=5jL2/+6hnM2+glay4wXfbE+iH58HtQ0J1U8u2FuW1HI=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=ZksJPib0dSb7UmwxIR+jvMrdVR72uzvTBtS/VFzGR4Hg+AcXs6Fpeo4fsCyOnnont
	 bsO1j9VmXLXjyW1nyQLXc/Wbsa+XbDQc3SoYsGnYe+UFPDYPQ6PhqlOl0fNRcJXnEh
	 IMZmH8hols1gpnR+yqKY5zC1PY4AXc7QiBQkTmBKuEPgLuZrCP0HGLFKyhpjMnslCj
	 w6vcA/uv3Lu9CZu9aB69N5addc5qLThyEWA89SNss/CnfnicBfpxpXnp3qQFuoqgZc
	 QfxAgYpt4xetJdHD29zyl/J8wyY7EghUFYutzt5mXyEXhJj56EMSdrC6aXrY/CNsnr
	 ZZTUHi+cOzWRw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 457B760E4B;
	Fri, 13 Mar 2026 21:51:40 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 03B581AF
 for <buildroot@buildroot.org>; Fri, 13 Mar 2026 21:51:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E927140EFF
 for <buildroot@buildroot.org>; Fri, 13 Mar 2026 21:51:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AfO2C3IikwFZ for <buildroot@buildroot.org>;
 Fri, 13 Mar 2026 21:51:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.4;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org DC31040EC2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DC31040EC2
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DC31040EC2
 for <buildroot@buildroot.org>; Fri, 13 Mar 2026 21:51:37 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:1065:2100:52d9:65fe:2df3:c492])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id 60F3919F5A7;
 Fri, 13 Mar 2026 22:51:29 +0100 (CET)
To: buildroot@buildroot.org
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Eric Le Bihan <eric.le.bihan.dev@free.fr>, Julien Olivain <ju.o@free.fr>,
 Philippe Proulx <eeppeliteloop@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 13 Mar 2026 22:50:42 +0100
Message-ID: <20260313215044.2406044-6-ju.o@free.fr>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260313215044.2406044-1-ju.o@free.fr>
References: <20260313215044.2406044-1-ju.o@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1773438696;
 bh=Gq/c2l7Ef0OT2qKowOlDYf3x/xAK2/4ZinQ1065qhHg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=RuwcxwCqrBWIhalRqepNh17ABXZP0wQEd4EoLsJW7KCOfJGTcbgbWx1kQbPz7EKvX
 4s+WpqJh8LgDASCbDnfBVN1lxXRq/HkQIHrNCT+BTpsEZz195+eEymXAk2OkVOkrsA
 Lg4fSxSHumJQP3MawYCnthqCuNPlCTjFwQuhtvi6enn+kzyUmHS/FpkWEEbMEKrzdJ
 m3+3XigIr+9ggGY58HZqpcQcqKKS0aKVQwycSj7cZYQhYReVwl6oLKc4y8Sdo5UvMI
 8Zp2Mj2GhJ+pdZ693tOjX9dHT47/RMdo/m2vO19rwwwYCv49zyUevf0y3yVItlF1DM
 LfdKqwa1ZDSEw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=RuwcxwCq
Subject: [Buildroot] [PATCH v2 6/7] fs/xfs: add support for generating a xfs
 image
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

mkfs.xfs is able to populate a filesystem from a directory since
upstream commit [1], included since v6.17.

With this option, it is now possible to create XFS rootfs in
Buildroot. This commit adds this new feature.

[1] https://git.kernel.org/pub/scm/fs/xfs/xfsprogs-dev.git/commit/?id=8a4ea72724930cfe262ccda03028264e1a81b145

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 fs/Config.in     |  1 +
 fs/xfs/Config.in | 34 ++++++++++++++++++++++++++++++++++
 fs/xfs/xfs.mk    | 33 +++++++++++++++++++++++++++++++++
 3 files changed, 68 insertions(+)
 create mode 100644 fs/xfs/Config.in
 create mode 100644 fs/xfs/xfs.mk

diff --git a/fs/Config.in b/fs/Config.in
index 42b0e608ac..be2a47b855 100644
--- a/fs/Config.in
+++ b/fs/Config.in
@@ -15,6 +15,7 @@ source "fs/squashfs/Config.in"
 source "fs/tar/Config.in"
 source "fs/ubi/Config.in"
 source "fs/ubifs/Config.in"
+source "fs/xfs/Config.in"
 source "fs/yaffs2/Config.in"
 
 endmenu
diff --git a/fs/xfs/Config.in b/fs/xfs/Config.in
new file mode 100644
index 0000000000..49dd5ed4aa
--- /dev/null
+++ b/fs/xfs/Config.in
@@ -0,0 +1,34 @@
+config BR2_TARGET_ROOTFS_XFS
+	bool "xfs root filesystem"
+	select BR2_PACKAGE_HOST_XFSPROGS
+	help
+	  Build a xfs root filesystem. If you enable this option, you
+	  probably want to enable the xfsprogs package too.
+
+if BR2_TARGET_ROOTFS_XFS
+
+config BR2_TARGET_ROOTFS_XFS_LABEL
+	string "filesystem label"
+	default "rootfs"
+
+config BR2_TARGET_ROOTFS_XFS_SIZE
+	string "exact size"
+	default "300M"
+	help
+	  The size of the filesystem image. This size is passed to the
+	  "truncate -s", so this option recognizes unit suffixes such
+	  as K,M,G (see the manual page truncate(1)). Note the XFS
+	  minimal filesystem size is 300M.
+
+config BR2_TARGET_ROOTFS_XFS_MKFS_OPTIONS
+	string "additional mkfs.xfs options"
+	help
+	  Specify a space-separated list of mkfs.xfs options.
+
+	  For more information about the mke2fs options, see the
+	  manual page mkfs.xfs(8).
+
+	  For more information about the XFS features which can be
+	  set, see also the manual page xfs(5).
+
+endif # BR2_TARGET_ROOTFS_XFS
diff --git a/fs/xfs/xfs.mk b/fs/xfs/xfs.mk
new file mode 100644
index 0000000000..2706822550
--- /dev/null
+++ b/fs/xfs/xfs.mk
@@ -0,0 +1,33 @@
+################################################################################
+#
+# Build the xfs root filesystem image
+#
+################################################################################
+
+ROOTFS_XFS_SIZE = $(call qstrip,$(BR2_TARGET_ROOTFS_XFS_SIZE))
+ifeq ($(BR2_TARGET_ROOTFS_XFS)-$(ROOTFS_XFS_SIZE),y-)
+$(error BR2_TARGET_ROOTFS_XFS_SIZE cannot be empty)
+endif
+
+ROOTFS_XFS_MKFS_OPTS = $(call qstrip,$(BR2_TARGET_ROOTFS_XFS_MKFS_OPTIONS))
+
+# qstrip results in stripping consecutive spaces into a single one. So the
+# variable is not qstrip-ed to preserve the integrity of the string value.
+ROOTFS_XFS_LABEL = $(subst ",,$(BR2_TARGET_ROOTFS_XFS_LABEL))
+#" comment to balance quotes/parenthesis for syntax highlighting)
+
+ROOTFS_XFS_OPTS = \
+	-f \
+	-p '$(TARGET_DIR)' \
+	-L '$(ROOTFS_XFS_LABEL)' \
+	$(ROOTFS_XFS_MKFS_OPTS)
+
+ROOTFS_XFS_DEPENDENCIES = host-xfsprogs
+
+define ROOTFS_XFS_CMD
+	$(RM) -f $@
+	truncate -s $(ROOTFS_XFS_SIZE) $@
+	$(HOST_DIR)/sbin/mkfs.xfs $(ROOTFS_XFS_OPTS) $@
+endef
+
+$(eval $(rootfs))
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
