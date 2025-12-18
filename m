Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC3B1D6E2CA
	for <buildroot@archiver.kernel.org>; Thu, 18 Dec 2025 19:26:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7E86E80DB6;
	Thu, 18 Dec 2025 19:26:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZbL1U0Iwl52z; Thu, 18 Dec 2025 19:26:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A2BA480DE4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766086001;
	bh=mYn3mP9t6vF90nqd/ZWmVC9iNWdVUEbbsowYy0g4BhY=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=omURYya6aoZ1RdHrVzRFPFJj5k8ImBtG4DrqUvJX+ldyi64jlfIEQBm3BezzEi7Q6
	 +xB4urvrgU59LEuB/rQOSZ+OzNEgPbxwhoLoCDVMSAVZwkANIPw2YFuDsZ5jl/uEFZ
	 ZojdXmwd6LlQoxXqem1FTYCn6VG0tMkjjNtSn8cc389JcthIbgumTZVLVRE70Otj/X
	 ViR4k+BXrGhpKJl/ba9cADZo0pGKO/RYWH1ii6NtwFwSpDfMDmOk2Fe9HOwEoffpGH
	 c8ZPkJzgA/e5dB4HduLFDZEMApLAmP4nQa7ZM9dmMEEjiZqt2IoSZkHEC2xxHmukDU
	 H0IsVMHdLjcoQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A2BA480DE4;
	Thu, 18 Dec 2025 19:26:41 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id AB184361
 for <buildroot@buildroot.org>; Thu, 18 Dec 2025 19:26:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9183A80DB6
 for <buildroot@buildroot.org>; Thu, 18 Dec 2025 19:26:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QndiodfTSX88 for <buildroot@buildroot.org>;
 Thu, 18 Dec 2025 19:26:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.156.72;
 helo=smtpcmd0872.aruba.it; envelope-from=giulio.benetti@benettiengineering.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 7039980D71
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7039980D71
Received: from smtpcmd0872.aruba.it (smtpcmd0872.aruba.it [62.149.156.72])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7039980D71
 for <buildroot@buildroot.org>; Thu, 18 Dec 2025 19:26:36 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba SMTP with ESMTPSA
 id WJdxvtlkJZCONWJdxvUXp3; Thu, 18 Dec 2025 20:26:33 +0100
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Thu, 18 Dec 2025 20:23:16 +0100
Message-ID: <20251218192316.940103-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfOUqqCTzr/JcPpxYwcSvtTWKaDnyfZ8EHXkdPeWHLJoOmVoFYmbZQplUp27nfqVJvKsfyrIF9/N/UzJy1XBokPAmI0pjno7pmLxKiUHLzLQ0pP4OdKAr
 yND+Q1IHftVfb/NAC2u8tlPaBBy8jxbXULHhVzqvoZMUn7CXzNNopCZbZc0GYec5LCt+41hrunOXxY+hsBivzkRxn2RS/TGgxHlNow5BYWUd+Mga3r9Y2wIh
 EnCS9OR2I7zJPwgGF915+jemc23APWZ8596Vpkl2StE=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1766085993; bh=f+iNVtmppT+A1kp0ZV/RIfU/vcJmac1aRH6wB5ARtIE=;
 h=From:To:Subject:Date:MIME-Version;
 b=WnPq5cgX4qgalG6484UYYP29cCL6eBrO/ZtYoQ0rVue5Ypg0keqWcElEtAoIYeDuq
 RoVDuieQK7t29KDqU1mv9LlVRF1jkyyhiqQqygKqlxrr78Gb3BV0FtrMVWt2s/sAq/
 qnc57EvuGS0gONlwV/wCTfrCx2SLREnd/kY7sg9GVL7V2ShTzztw54RkakHeb9lzX9
 XynYkweoE2MGoJcB6BNe0tM1Jb5ByqyCDeb2B2e5aAecByoJN1zwZj5H3FU2dL26OH
 kiCCuSC6UMozIIPWLLdKVFG0Bm8uaX6cSn6ZW+z2rZZuCAAnfbgsxqWkYoukFZ3zWi
 /aJnMYY9rfGkA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=WnPq5cgX
Subject: [Buildroot] [PATCH] package/cryptsetup: bump version to 2.8.2
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

For release note, see:
https://gitlab.com/cryptsetup/cryptsetup/-/blob/v2.8.2/docs/v2.8.2-ReleaseNotes

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/cryptsetup/cryptsetup.hash | 2 +-
 package/cryptsetup/cryptsetup.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/cryptsetup/cryptsetup.hash b/package/cryptsetup/cryptsetup.hash
index bd165f2356..e85607cdb6 100644
--- a/package/cryptsetup/cryptsetup.hash
+++ b/package/cryptsetup/cryptsetup.hash
@@ -1,5 +1,5 @@
 # From https://www.kernel.org/pub/linux/utils/cryptsetup/v2.8/sha256sums.asc
-sha256  2c3379eb76597dcab50911449b013e2697c4bffcc716dbbf0d9b0e8fbbb46fb4  cryptsetup-2.8.1.tar.xz
+sha256  dd9ede9875976cb25f3d29bfabf343b1c60f6186646b67ef5e40e60ab4935ec1  cryptsetup-2.8.2.tar.xz
 sha256  45670cce8b6a0ddd66c8016cd8ccef6cd71f35717cbacc7f1e895b3855207b33  COPYING
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  docs/licenses/COPYING.Apache-2.0
 sha256  28a9529c7d0bb4dc51f4bf5c116a3d16ef247a052f7591466768ddf563fd1cf5  docs/licenses/COPYING.CC-BY-SA-4.0
diff --git a/package/cryptsetup/cryptsetup.mk b/package/cryptsetup/cryptsetup.mk
index ebe9c865b3..8421543f41 100644
--- a/package/cryptsetup/cryptsetup.mk
+++ b/package/cryptsetup/cryptsetup.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 CRYPTSETUP_VERSION_MAJOR = 2.8
-CRYPTSETUP_VERSION = $(CRYPTSETUP_VERSION_MAJOR).1
+CRYPTSETUP_VERSION = $(CRYPTSETUP_VERSION_MAJOR).2
 CRYPTSETUP_SOURCE = cryptsetup-$(CRYPTSETUP_VERSION).tar.xz
 CRYPTSETUP_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/cryptsetup/v$(CRYPTSETUP_VERSION_MAJOR)
 CRYPTSETUP_DEPENDENCIES = \
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
