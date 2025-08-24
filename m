Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C509CCA0EEB
	for <buildroot@archiver.kernel.org>; Sun, 24 Aug 2025 09:02:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 77450616C1;
	Sun, 24 Aug 2025 09:02:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3-dyQ_jHryhv; Sun, 24 Aug 2025 09:02:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A816860A57
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A816860A57;
	Sun, 24 Aug 2025 09:02:55 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 23F4C19C
 for <buildroot@buildroot.org>; Sun, 24 Aug 2025 09:02:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1FA1F41ABE
 for <buildroot@buildroot.org>; Sun, 24 Aug 2025 09:02:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eLnzSAOPv2Ey for <buildroot@buildroot.org>;
 Sun, 24 Aug 2025 09:02:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 3798C41A36
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3798C41A36
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3798C41A36
 for <buildroot@buildroot.org>; Sun, 24 Aug 2025 09:02:53 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 4E8891A0936
 for <buildroot@buildroot.org>; Sun, 24 Aug 2025 09:02:51 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 1A97D605F1
 for <buildroot@buildroot.org>; Sun, 24 Aug 2025 09:02:51 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 36EA91C22AB0F; 
 Sun, 24 Aug 2025 11:02:50 +0200 (CEST)
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 24 Aug 2025 11:02:42 +0200
Message-ID: <20250824090244.281771-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1756026170; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding; bh=FuhboK0tSSTAwpfkruAWdgNUle0pqVt8mv94cv/TGrw=;
 b=rfBN6/umm4udLKDf1ffUog4QBHwnKNOYZg2qmmmHAUIUJHdfYmYI+KDeTqNLSTvOqWP3F+
 qUMPVB8o3BA9JHnMumvs2BpUe3WYL+oHuyyTW7YV0or2SFta4gDXS+r00mfJf790kwFtMs
 69CPjbA6OTOria4h1tkI2/GmJBIx7KiuVZtmDGs2TlIbkobwcqpIKEGCQK949DURkA58f0
 xxU4I/Tpd7lVUoT7+P2+SQbxFEB11/FGlSIB3aElQECjXVS3RAKnY5fYdnhJDdqc+srRaH
 WSUJq7vMdBfLImWWn2U+JWmvjsYuUwjnSllJPpSzqIv7awtII3zwcCHaoJJ/Mw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=rfBN6/um
Subject: [Buildroot] [PATCH 1/2] package/linux-headers: do not allow old
 kernel headers on Loongarch
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Loongarch support was added to the upstream Linux kernel in version
5.19, so when versions 5.4, 5.10 or 5.15 are selected, the "build" of
the kernel headers fails:

Makefile:717: arch/loongarch/Makefile: No such file or directory
make[1]: *** No rule to make target 'arch/loongarch/Makefile'.  Stop.

Fixes:

  https://autobuild.buildroot.net/results/b27fc299d14b7bc59dab5dae6deb9cc8bd400a3d/ (5.15)
  https://autobuild.buildroot.net/results/1621e9de1170acc5229f99568b35155b6c668b05/ (5.10)
  https://autobuild.buildroot.net/results/2a28e37ee8500d165137c14945000770346e9541/ (5.4)

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/linux-headers/Config.in.host | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index b49eeb1e94..66a9670de5 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -26,14 +26,20 @@ config BR2_KERNEL_HEADERS_AS_KERNEL
 
 config BR2_KERNEL_HEADERS_5_4
 	bool "Linux 5.4.x kernel headers"
+	# Support was introduced in Linux 5.19
+	depends on !BR2_loongarch64
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
 
 config BR2_KERNEL_HEADERS_5_10
 	bool "Linux 5.10.x kernel headers"
+	# Support was introduced in Linux 5.19
+	depends on !BR2_loongarch64
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10
 
 config BR2_KERNEL_HEADERS_5_15
 	bool "Linux 5.15.x kernel headers"
+	# Support was introduced in Linux 5.19
+	depends on !BR2_loongarch64
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
 
 config BR2_KERNEL_HEADERS_6_1
-- 
2.50.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
