Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59AC5E7718F
	for <buildroot@archiver.kernel.org>; Sun, 29 Dec 2024 12:38:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8C2FA40554;
	Sun, 29 Dec 2024 12:38:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TJ6EkuB4299C; Sun, 29 Dec 2024 12:38:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 65DEA4053C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 65DEA4053C;
	Sun, 29 Dec 2024 12:38:03 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 61477CA
 for <buildroot@buildroot.org>; Sun, 29 Dec 2024 12:37:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A2AF88048A
 for <buildroot@buildroot.org>; Sun, 29 Dec 2024 12:37:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9pixTg0h8XXr for <buildroot@buildroot.org>;
 Sun, 29 Dec 2024 12:37:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::229;
 helo=relay9-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 88BCE8048C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 88BCE8048C
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 88BCE8048C
 for <buildroot@buildroot.org>; Sun, 29 Dec 2024 12:37:56 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPA id CEDC5FF805;
 Sun, 29 Dec 2024 12:37:54 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Buildroot List <buildroot@buildroot.org>
Date: Sun, 29 Dec 2024 13:37:46 +0100
Message-ID: <20241229123751.639378-3-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241229123751.639378-1-thomas.petazzoni@bootlin.com>
References: <20241229123751.639378-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1735475875;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mZmQrvzzjTeVpabofjrVfplZ0qVBuqjOE2ceyg+cjYc=;
 b=mi8z5WT577h7MTvDHDYxy3qgTG5thglzJaO8GZE0swdyD2y4swf/YwfImKgEzKYhWbraeb
 8OxzEecqCn8FltFh1m35ySCUv6wTWtwvtoPd6VsaZzqPWBXDhZnz3uaWCoE6EqKqk6PXne
 +it+9/7CO9vllRa/MttQpaaLfTtJHC9MdGCwaiLXFb5AmLtKtrZmipMTu8PpW4AQWP16oA
 dXcct97Ki3WXVBcKJmaqGh0FzsaJGcq567YnBXM+/UwYJCUjXpuT7us+M46v3t8wvS0he7
 ZRohv8fVuSUb2MfDFWrTgTt2Z2SmScJvsiL12aHCTGKb94b8EN6oD/CuErASrw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=mi8z5WT5
Subject: [Buildroot] [PATCH 2/4] linux: select host-uboot-tools on nios2
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In the latest kernel, U-Boot images are always generated when building
a kernel for NIOS2. Note that we build the kernel with:

  make all
  make <selected-image>

so the selected image through Buildroot options doesn't matter: a
U-Boot image is always generated.

Therefore, in order to fix autobuilder issues, make sure
host-uboot-tools are always selected when building the latest kernel
version. We do not select it in general as custom versions may be
different.

Fixes:

  http://autobuild.buildroot.net/results/1d4c249887bdd78dab40152ad3a4fcef16458a1a/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 linux/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/linux/Config.in b/linux/Config.in
index 07e92c455e..19662568a7 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -33,6 +33,8 @@ config BR2_LINUX_KERNEL_LATEST_VERSION
 	# mips always generates an ITB image
 	select BR2_PACKAGE_HOST_UBOOT_TOOLS if BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el
 	select BR2_PACKAGE_HOST_UBOOT_TOOLS_FIT_SUPPORT if BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el
+	# nios2 always generates a U-Boot image
+	select BR2_PACKAGE_HOST_UBOOT_TOOLS if BR2_nios2
 
 config BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	bool "Latest CIP SLTS version (5.10.162-cip24)"
-- 
2.47.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
