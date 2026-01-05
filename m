Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B054CC2A099
	for <buildroot@archiver.kernel.org>; Mon,  5 Jan 2026 10:56:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8480D80964;
	Mon,  5 Jan 2026 10:56:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6wNa6jhl4zkp; Mon,  5 Jan 2026 10:56:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CF8CE807B0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767610574;
	bh=nIRhbg0KB7kcWNNXU0qLxedY5L438+NnEEu1O0bs3C8=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=HuC3JZctKdn2hktGN+SHiDORMJTtB1jZGipaJRbqm4xHRAPLvd7hmF8800y/qCIvt
	 MShM1gqg4gBe9s8M2uKnC7pojOb8b1WAHgcO7je9Bpb/6exCh9qBH2/Ubkmi6MNZDN
	 ZOlx+aenjgEsA54g6yN/+6rj2tM4ErHp24c/BwRjTKrPfKiPCv01yD4gjExxUwQt58
	 jHRuHZZffjCqnKdLYehzzHtaKwCjP0j0pxoWriwj/pIQS3JQW/rAtyNRZavueRAex3
	 +F/973qQZO1vGYLLt4XMhOPFipLJmXw7mh/a5x3brHfL/VK+x9M7Q4DCiJ0n/huAah
	 /Nc9ISf/JvDcg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id CF8CE807B0;
	Mon,  5 Jan 2026 10:56:14 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 5016CE7
 for <buildroot@buildroot.org>; Mon,  5 Jan 2026 10:56:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 372274032C
 for <buildroot@buildroot.org>; Mon,  5 Jan 2026 10:56:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uXNGJoyhWEby for <buildroot@buildroot.org>;
 Mon,  5 Jan 2026 10:56:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=kory.maincent@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 0B56B40327
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0B56B40327
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0B56B40327
 for <buildroot@buildroot.org>; Mon,  5 Jan 2026 10:56:11 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 39FC34E41F6C;
 Mon,  5 Jan 2026 10:56:09 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 0FE0760726;
 Mon,  5 Jan 2026 10:56:09 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id A6B3E103C8494; Mon,  5 Jan 2026 11:56:07 +0100 (CET)
To: buildroot@buildroot.org
Date: Mon,  5 Jan 2026 10:55:51 +0000
Message-ID: <20260105105558.1991-2-kory.maincent@bootlin.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260105105558.1991-1-kory.maincent@bootlin.com>
References: <20260105105558.1991-1-kory.maincent@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1767610568; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=f8o4TZbKy9N+RFdb9Yh//yFhR5Z/Gu29uwgtGYg25pM=;
 b=fl0aAS7IWDlVb8l7Z/lLLxkS2uSPFcc5a2EV2lVVX0VL6QqK8kExOvDoo4m1BfZVqFBd6+
 3Q/6DyBFZX/LPMA2hX5uJWSIT1ZBQK5f5ug/qpayupQXhPXyHr5PS4aX85Ijfw5SJd//Se
 VjCrvIo9ssVRWF4mNjaGwThjgO4X9DqIonvOjuHnXxuxw1BfgaJ2yEi1JulRxZYc5PobLY
 qYAcqzrG9aSSI1xAcisM/6l7iLyBz1OgGgGnLt3gNuNXoXj6CKGzTCcn9wUVn1MXfrQnIq
 NrXzelU/ZyZHkfHDMJMDoSDlSc8on2UbEeVReeyv3tqDVWDV32rxoAQEpxi23g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=fl0aAS7I
Subject: [Buildroot] [PATCH v4 1/4] configs/beaglebone: Bump to Linux
 mainline 6.18.1
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
From: Kory Maincent via buildroot <buildroot@buildroot.org>
Reply-To: Kory Maincent <kory.maincent@bootlin.com>
Cc: "Kory Maincent \(TI.com\)" <kory.maincent@bootlin.com>,
 Lothar Felten <lothar.felten@gmail.com>, Bajjuri Praneeth <praneeth@ti.com>,
 Julien Olivain <ju.o@free.fr>, thomas.petazzoni@bootlin.com,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: "Kory Maincent (TI.com)" <kory.maincent@bootlin.com>

Bumps the Linux kernel to the latest 6.18.1 mainline version.

Tested on BeagleBone Black.

Signed-off-by: Kory Maincent (TI.com) <kory.maincent@bootlin.com>
---
Changes in v4:
- Use omap2plus_defconfig instead of a custom defconfig.

Changes in v3:
- Move linux.config in board/beagleboard/beaglebone instead of
  board/ti/am335x
- Update Linux hash file.
- Update Linux to 6.18.1

Change in v2:
- Use a specific Linux version.
---
 board/beagleboard/beaglebone/patches/linux/linux.hash | 4 ++--
 configs/beaglebone_defconfig                          | 6 +++---
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/board/beagleboard/beaglebone/patches/linux/linux.hash b/board/beagleboard/beaglebone/patches/linux/linux.hash
index e70a999129..99ac4fc57e 100644
--- a/board/beagleboard/beaglebone/patches/linux/linux.hash
+++ b/board/beagleboard/beaglebone/patches/linux/linux.hash
@@ -1,2 +1,2 @@
-# Locally calculated
-sha256  1db327d0743e97ec725fefe05065a6fb779abe3063845fc3b551a4a716247c0a  linux-6.12.34-ti-arm32-r12.tar.gz
+# From https://cdn.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
+sha256  d0a78bf3f0d12aaa10af3b5adcaed5bc767b5b78705e5ef885d5e930b72e25d5  linux-6.18.1.tar.xz
diff --git a/configs/beaglebone_defconfig b/configs/beaglebone_defconfig
index 8a8f618e40..38d5d3b52f 100644
--- a/configs/beaglebone_defconfig
+++ b/configs/beaglebone_defconfig
@@ -11,9 +11,9 @@ BR2_ROOTFS_POST_BUILD_SCRIPT="board/beagleboard/beaglebone/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/beagleboard/beaglebone/genimage.cfg"
 BR2_LINUX_KERNEL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,beagleboard,linux,6.12.34-ti-arm32-r12)/linux-6.12.34-ti-arm32-r12.tar.gz"
-BR2_LINUX_KERNEL_DEFCONFIG="bb.org"
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.18.1"
+BR2_LINUX_KERNEL_DEFCONFIG="omap2plus"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="ti/omap/am335x-evm ti/omap/am335x-bone ti/omap/am335x-boneblack ti/omap/am335x-bonegreen ti/omap/am335x-evmsk ti/omap/am335x-boneblue ti/omap/am335x-boneblack-wireless ti/omap/am335x-bonegreen-wireless"
 BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
