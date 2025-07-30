Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFAD2C83F26
	for <buildroot@archiver.kernel.org>; Wed, 30 Jul 2025 19:01:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 61D1F6140B;
	Wed, 30 Jul 2025 19:01:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id F6BA8O6CRErQ; Wed, 30 Jul 2025 19:01:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7946D6140E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7946D6140E;
	Wed, 30 Jul 2025 19:01:26 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 83DFA12E
 for <buildroot@buildroot.org>; Wed, 30 Jul 2025 19:01:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6A7E46140E
 for <buildroot@buildroot.org>; Wed, 30 Jul 2025 19:01:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2htGLDKueuNx for <buildroot@buildroot.org>;
 Wed, 30 Jul 2025 19:01:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 21F4B6140B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 21F4B6140B
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 21F4B6140B
 for <buildroot@buildroot.org>; Wed, 30 Jul 2025 19:01:22 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0a17.dip0.t-ipconnect.de [91.58.10.23])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 16118A4C101B
 for <buildroot@buildroot.org>; Wed, 30 Jul 2025 21:01:19 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:40410)
 by fli4l.lan.fli4l with esmtp (Exim 4.98.2)
 (envelope-from <bernd@kuhls.net>) id 1uhC3C-000000007xy-28n8
 for buildroot@buildroot.org; Wed, 30 Jul 2025 19:01:18 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Wed, 30 Jul 2025 21:01:18 +0200
Message-Id: <20250730190118.448997-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1753902079;
 bh=4pz/2B7aTODuHPWyqDwSO8Yd7HU5KASf79tvOS2Gklk=;
 h=From:To:Subject:Date:From;
 b=V26OEfEWqw6B0fR+wwhWuOJfSbk7U3CdUjb21xejA4kGFCeS/mrsiGueYKwlsRTia
 8PaanZlsNpU6WmADQ4CyFaxd7BuAVZcAKAifvgMsROx8F8JaOGhQhmjC9DDgYBUAZd
 Wq0ZSvwpRund5EHjacnR4Z7vs8RHHDOQR0eFwg8FRpvvcbIUWEBz4OzSJBSV+eYcyN
 CZ+DJINBppE6XoN+r+ogQnDIjsBSFV2YoYPTAs3sfoMX0+QpbbZnVhfdYZUdr8LSuP
 eKWcM3qy7j+xhZIff2C9iOXDkIxu2ti/oeLC1/MnjhqM0WSqdl5m5lKBalbQ6L0XsC
 pWOTRdx5BfnIQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202506031021 header.b=V26OEfEW
Subject: [Buildroot] [PATCH 1/1] boot/syslinux: fix build with gcc-15.x
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

Fixes build error with gcc-15.x:

drivers/net/3c509-eisa.c:39:26: error:  initialization of 'void (*)(void)'
 from incompatible pointer type 'void (*)(struct nic *, struct eisa_device *)'
 [-Wincompatible-pointer-types]

For a similar fix see https://bugzilla.suse.com/show_bug.cgi?id=1243225

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 boot/syslinux/syslinux.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/boot/syslinux/syslinux.mk b/boot/syslinux/syslinux.mk
index 127f6b3cc1..b8f022b189 100644
--- a/boot/syslinux/syslinux.mk
+++ b/boot/syslinux/syslinux.mk
@@ -65,7 +65,7 @@ define SYSLINUX_BUILD_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE1) \
 		ASCIIDOC_OK=-1 \
 		A2X_XML_OK=-1 \
-		CC="$(TARGET_CC)" \
+		CC="$(TARGET_CC) -std=gnu17" \
 		LD="$(TARGET_LD)" \
 		OBJCOPY="$(TARGET_OBJCOPY)" \
 		AS="$(TARGET_AS)" \
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
