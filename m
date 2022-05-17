Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E0F0C433EF
	for <buildroot@archiver.kernel.org>; Tue, 17 May 2022 03:25:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 271196113B;
	Tue, 17 May 2022 03:25:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id L8ASr2hncxIK; Tue, 17 May 2022 03:25:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 27BA0610D8;
	Tue, 17 May 2022 03:25:34 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id AD7AD1BF322
 for <buildroot@lists.busybox.net>; Tue, 17 May 2022 03:25:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9900E40B95
 for <buildroot@lists.busybox.net>; Tue, 17 May 2022 03:25:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=cosmos-ink.net
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id F0aEC9fftxt6 for <buildroot@lists.busybox.net>;
 Tue, 17 May 2022 03:25:31 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mail.cosmos-ink.net (mail.cosmos-ink.net
 [IPv6:2a01:4f9:4a:25aa::13])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 52CB540496
 for <buildroot@buildroot.org>; Tue, 17 May 2022 03:25:31 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 6BDE71C666DE; Tue, 17 May 2022 05:25:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cosmos-ink.net;
 s=dkim; t=1652757928; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding; bh=WUSBvQhxlgFSeXrCMaHYN9+dLbVepMQAzoQCTmE6taU=;
 b=WZEiwVnhnEaTnuvVojEh5Kry7m0HffcfcdANGOf8wP0C3jzvg+B9GMnTDIrP3E1ChnLHho
 yVmRdd5e/d/jjPvwr6FriDiXKcuG0az2pVNWDeOP3mOwa6Q7KRjo2/r72f8gcxulwR5I5k
 cKxcOM4pIL2ZCpRHyRMMVLta703BSqC/GcEkF+ZLwbuqq6pGuf9Z9QB59XCspGUvmGnZSO
 MB6piBj/negYgrk7nju3ihkoK4CyHcJ9VnXN31sWinvRNqUHPlpZd+kO3a0xF6Nh0lglFm
 9z8qRepEQiPyuaPraXWkgRu3+SMAunK1cykKgV3eT0NPVtvvdfl7f4SVNVc52Q==
To: buildroot@buildroot.org
Date: Tue, 17 May 2022 03:24:58 +0000
Message-Id: <20220517032459.3400-1-linus@cosmos-ink.net>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
Subject: [Buildroot] [PATCH 1/2] fs/squashfs: Add block size option
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
From: Linus Kaschulla via buildroot <buildroot@buildroot.org>
Reply-To: Linus Kaschulla <linus@cosmos-ink.net>
Cc: Linus Kaschulla <linus@cosmos-ink.net>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

One advantage of squashfs over similar technologies is the support for
bigger block sizes. However the default size is not a lot bigger
(typically 128k if no `-b` flag specified).

This patch adds the ability to select from common block sizes
which for example can aid in improving compression ratio.

Signed-off-by: Linus Kaschulla <linus@cosmos-ink.net>
---
 fs/squashfs/Config.in   | 50 +++++++++++++++++++++++++++++++++++++++++
 fs/squashfs/squashfs.mk | 14 +++++++++++-
 2 files changed, 63 insertions(+), 1 deletion(-)

diff --git a/fs/squashfs/Config.in b/fs/squashfs/Config.in
index 70d4a20cf0..341e50a08c 100644
--- a/fs/squashfs/Config.in
+++ b/fs/squashfs/Config.in
@@ -5,6 +5,56 @@ config BR2_TARGET_ROOTFS_SQUASHFS
 
 if BR2_TARGET_ROOTFS_SQUASHFS
 
+choice
+	prompt "block size"
+	default BR2_TARGET_ROOTFS_SQUASHFS_BS_128K
+	help
+	  Data block size. Bigger values can improve
+	  compression ratio.
+
+	  If unsure, leave at 128k (default).
+
+config BR2_TARGET_ROOTFS_SQUASHFS_BS_4K
+	bool "4k"
+
+config BR2_TARGET_ROOTFS_SQUASHFS_BS_8K
+	bool "8k"
+
+config BR2_TARGET_ROOTFS_SQUASHFS_BS_16K
+	bool "16k"
+
+config BR2_TARGET_ROOTFS_SQUASHFS_BS_32K
+	bool "32k"
+
+config BR2_TARGET_ROOTFS_SQUASHFS_BS_64K
+	bool "64k"
+
+config BR2_TARGET_ROOTFS_SQUASHFS_BS_128K
+	bool "128k"
+
+config BR2_TARGET_ROOTFS_SQUASHFS_BS_256K
+	bool "256k"
+
+config BR2_TARGET_ROOTFS_SQUASHFS_BS_512K
+	bool "512k"
+
+config BR2_TARGET_ROOTFS_SQUASHFS_BS_1024K
+	bool "1024k"
+
+endchoice
+
+config BR2_TARGET_ROOTFS_SQUASHFS_BS
+	string
+	default "4K" if BR2_TARGET_ROOTFS_SQUASHFS_BS_4K
+	default "8K" if BR2_TARGET_ROOTFS_SQUASHFS_BS_84K
+	default "16K" if BR2_TARGET_ROOTFS_SQUASHFS_BS_16K
+	default "32K" if BR2_TARGET_ROOTFS_SQUASHFS_BS_32K
+	default "64K" if BR2_TARGET_ROOTFS_SQUASHFS_BS_64K
+	default "128K" if BR2_TARGET_ROOTFS_SQUASHFS_BS_128K
+	default "256K" if BR2_TARGET_ROOTFS_SQUASHFS_BS_256K
+	default "512K" if BR2_TARGET_ROOTFS_SQUASHFS_BS_512K
+	default "1024K" if BR2_TARGET_ROOTFS_SQUASHFS_BS_1024K
+
 config BR2_TARGET_ROOTFS_SQUASHFS_PAD
 	bool "pad to a 4K boundary"
 	default y # legacy was always ON
diff --git a/fs/squashfs/squashfs.mk b/fs/squashfs/squashfs.mk
index 7a5e3e313e..1790773f7e 100644
--- a/fs/squashfs/squashfs.mk
+++ b/fs/squashfs/squashfs.mk
@@ -6,7 +6,19 @@
 
 ROOTFS_SQUASHFS_DEPENDENCIES = host-squashfs
 
-ROOTFS_SQUASHFS_ARGS = -noappend -processors $(PARALLEL_JOBS)
+ROOTFS_SQUASHFS_ARGS = -noappend -processors $(PARALLEL_JOBS) -b $(BR2_TARGET_ROOTFS_SQUASHFS_BS)
+
+ifeq ($(BR2_TARGET_ROOTFS_SQUASHFS4_BS_64K),y)
+ROOTFS_SQUASHFS_ARGS += -b 64K
+else ifeq ($(BR2_TARGET_ROOTFS_SQUASHFS4_BS_128K),y)
+ROOTFS_SQUASHFS_ARGS += -b 128K
+else ifeq ($(BR2_TARGET_ROOTFS_SQUASHFS4_BS_256K),y)
+ROOTFS_SQUASHFS_ARGS += -b 256K
+else ifeq ($(BR2_TARGET_ROOTFS_SQUASHFS4_BS_512K),y)
+ROOTFS_SQUASHFS_ARGS += -b 512K
+else ifeq ($(BR2_TARGET_ROOTFS_SQUASHFS4_BS_1024K),y)
+ROOTFS_SQUASHFS_ARGS += -b 1024K
+endif
 
 ifeq ($(BR2_TARGET_ROOTFS_SQUASHFS_PAD),)
 ROOTFS_SQUASHFS_ARGS += -nopad
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
