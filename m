Return-Path: <SRS0=K+5a=O6=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 502BFC433F5
	for <buildroot@archiver.kernel.org>; Sun, 10 Oct 2021 23:48:06 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CE86960E94
	for <buildroot@archiver.kernel.org>; Sun, 10 Oct 2021 23:48:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CE86960E94
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=buildroot.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8BA8A403A4;
	Sun, 10 Oct 2021 23:48:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QDlWrp5retoU; Sun, 10 Oct 2021 23:48:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id DCEDD403C8;
	Sun, 10 Oct 2021 23:48:03 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E110B1BF3E8
 for <buildroot@lists.busybox.net>; Sun, 10 Oct 2021 23:47:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DC7C860648
 for <buildroot@lists.busybox.net>; Sun, 10 Oct 2021 23:47:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RevkScKzTihB for <buildroot@lists.busybox.net>;
 Sun, 10 Oct 2021 23:47:04 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com
 [209.85.210.169])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2609C60627
 for <buildroot@buildroot.org>; Sun, 10 Oct 2021 23:47:04 +0000 (UTC)
Received: by mail-pf1-f169.google.com with SMTP id y7so3744195pfg.8
 for <buildroot@buildroot.org>; Sun, 10 Oct 2021 16:47:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NXoTDHiLCv/RmS437pDyOkCriYmnt0AjOmdN8LgrxBs=;
 b=NClERUxrqI44WuOp4ToGDmqB/u0TBDlGeS9cX2bNLs+z2eelpdDP8MgqLwDieWMg00
 HR9HweU9Q2Zdwrfke6eLjLf++4Ln1tAIx6/PNunS/13muciwff0mczjM4vJbV9CQesWi
 KAqvVVlrbuDNRCke41rDKdDu5uNVz+Ba9Wt1zxEFJfJmqNkWlliXpuhPdVBcmJcrHM+L
 UxclNOMMVH7NhlS8IAlQPEB8R0S2zwf9s5av6jUaU8p7ZsWY6Jy+J/sJ+/voDAarlHsT
 Xxl+voePlW3sjjBFmp8AEy2bW+KWXvloO8gl9d/airadAHZXx+/dM6GPWrI6KsV2EkkH
 NHMQ==
X-Gm-Message-State: AOAM532I1uAoWgIlBOtVPJreJaJFSjAG+rMz4jcVyvNmbITlZDYE5Zy4
 d57yiHLWO5tUbgiZaJANeCX8SpR1sTxmyg==
X-Google-Smtp-Source: ABdhPJxDiET7xoqePJEYpcBzINdHhlj9UQkCHs+HTB0jIf3SMTu1b+kj7PawqhOc9sUAC+w9i38UJQ==
X-Received: by 2002:a63:d19:: with SMTP id c25mr15370819pgl.393.1633909623399; 
 Sun, 10 Oct 2021 16:47:03 -0700 (PDT)
Received: from localhost.localdomain (ip68-111-8-11.sb.sd.cox.net.
 [68.111.8.11])
 by smtp.gmail.com with ESMTPSA id t6sm5662547pfh.63.2021.10.10.16.47.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 10 Oct 2021 16:47:03 -0700 (PDT)
To: buildroot@buildroot.org
Date: Sun, 10 Oct 2021 16:46:55 -0700
Message-Id: <20211010234655.585526-6-christian@paral.in>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211010234655.585526-1-christian@paral.in>
References: <20211010234655.585526-1-christian@paral.in>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH-NEXT v3 6/6] package/gocryptfs: new package
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Christian Stewart via buildroot <buildroot@buildroot.org>
Reply-To: Christian Stewart <christian@paral.in>
Cc: Christian Stewart <christian@paral.in>, Anisse Astier <anisse@astier.eu>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Adds the gocryptfs encrypted FUSE filesystem.

Currently uses without_openssl build tag, to use the native Go cryptography.
However, the package could be improved by conditionally enabling openssl if it
is also configured to be built by Buildroot.

Signed-off-by: Christian Stewart <christian@paral.in>
---
 package/Config.in                |  1 +
 package/gocryptfs/Config.in      | 12 ++++++++++++
 package/gocryptfs/gocryptfs.hash |  3 +++
 package/gocryptfs/gocryptfs.mk   | 19 +++++++++++++++++++
 4 files changed, 35 insertions(+)
 create mode 100644 package/gocryptfs/Config.in
 create mode 100644 package/gocryptfs/gocryptfs.hash
 create mode 100644 package/gocryptfs/gocryptfs.mk

diff --git a/package/Config.in b/package/Config.in
index 7a833909aa..30c2abbb6a 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -220,6 +220,7 @@ menu "Filesystem and flash utilities"
 	source "package/genext2fs/Config.in"
 	source "package/genpart/Config.in"
 	source "package/genromfs/Config.in"
+	source "package/gocryptfs/Config.in"
 	source "package/imx-usb-loader/Config.in"
 	source "package/mmc-utils/Config.in"
 	source "package/mtd/Config.in"
diff --git a/package/gocryptfs/Config.in b/package/gocryptfs/Config.in
new file mode 100644
index 0000000000..2630cafdcf
--- /dev/null
+++ b/package/gocryptfs/Config.in
@@ -0,0 +1,12 @@
+config BR2_PACKAGE_GOCRYPTFS
+	bool "gocryptfs"
+	depends on BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	help
+	  gocryptfs is an encrypted FUSE overlay filesystem.
+
+	  https://github.com/rfjakob/gocryptfs
+
+comment "gocryptfs needs a toolchain w/ threads"
+	depends on BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/gocryptfs/gocryptfs.hash b/package/gocryptfs/gocryptfs.hash
new file mode 100644
index 0000000000..f54dce1626
--- /dev/null
+++ b/package/gocryptfs/gocryptfs.hash
@@ -0,0 +1,3 @@
+# Locally computed
+sha256  9581bd579fd1c527bc7a7fe2cd1a8761947797a36bad493902f186a4f5967cf8  gocryptfs-2.2.0.tar.gz
+sha256  322a7e3b02cf18e38b7e6b18cafefb773df8676c65634b34e8a2beb931294a4b  LICENSE
diff --git a/package/gocryptfs/gocryptfs.mk b/package/gocryptfs/gocryptfs.mk
new file mode 100644
index 0000000000..2a00e9a959
--- /dev/null
+++ b/package/gocryptfs/gocryptfs.mk
@@ -0,0 +1,19 @@
+################################################################################
+#
+# gocryptfs
+#
+################################################################################
+
+GOCRYPTFS_VERSION = 2.2.0
+GOCRYPTFS_SITE = $(call github,rfjakob,gocryptfs,v$(GOCRYPTFS_VERSION))
+GOCRYPTFS_LICENSE = MIT
+GOCRYPTFS_LICENSE_FILES = LICENSE
+
+GOCRYPTFS_GOMOD = github.com/rfjakob/gocryptfs/v2
+
+GOCRYPTFS_LDFLAGS = \
+	-X main.GitVersion=$(GOCRYPTFS_VERSION) \
+	-X main.GitVersionFuse=[vendored]
+GOCRYPTFS_TAGS = without_openssl
+
+$(eval $(golang-package))
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
