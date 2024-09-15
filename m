Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE55FC35FE4
	for <buildroot@archiver.kernel.org>; Sun, 15 Sep 2024 12:39:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4893740577;
	Sun, 15 Sep 2024 12:39:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CpkOvIOt9kE0; Sun, 15 Sep 2024 12:39:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 16AB04059A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 16AB04059A;
	Sun, 15 Sep 2024 12:39:44 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id AED781BF3FC
 for <buildroot@lists.busybox.net>; Sun, 15 Sep 2024 12:39:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A2527400D3
 for <buildroot@lists.busybox.net>; Sun, 15 Sep 2024 12:39:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LPbUj37VYtlY for <buildroot@lists.busybox.net>;
 Sun, 15 Sep 2024 12:39:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.196;
 helo=relay4-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 418A0400E5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 418A0400E5
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 418A0400E5
 for <buildroot@buildroot.org>; Sun, 15 Sep 2024 12:39:34 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPA id 1CB2AE0002;
 Sun, 15 Sep 2024 12:39:33 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 15 Sep 2024 14:37:28 +0200
Message-ID: <20240915123729.800902-2-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240915123729.800902-1-thomas.petazzoni@bootlin.com>
References: <20240915123729.800902-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1726403973;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zfMDAXd2Jl8q6s/maP0cyDjWybLtZfdJDCwsdyxNXeY=;
 b=bEiK7Zic1rifc9eIWlwBIl2Frnyxlelk0O3IuMKNHqwdJnzJAlQFqH2r0Zs2/LLoon+p9w
 8RgfhicN3SN2Z6GYdyp6XPytu73Flc6LEJfGyZb5RfVM566dRhgelX6Pt+vh7WiBCMjqZX
 n4Gev2WUmR7+0Lb4MYUNGaKur8y+LeR3M+Mdi3EufjGA6NeyKFvX+6VMP6WWz9VtDJwrpS
 KtCDrIzZ5gWyYIfms1+D+/SPyjoGqPApghxEyUqThQhRw24cv/nLsV1VcJ0ZWPiiyL3050
 2ioVlbAr5dWlxTrmqsyWPPk6nR3oSlsYz9u9t4nkFXsHA62LNN4rgZgAL/9v7Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=bEiK7Zic
Subject: [Buildroot] [PATCH 2/2] linux: handle empty
 BR2_LINUX_KERNEL_IMAGE_TARGET_NAME situation
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

When BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM=y,
BR2_LINUX_KERNEL_IMAGE_TARGET_NAME should be set or the build will
fail. Instead of miserably failing the build, let's catch this earlier
and warn the user in a more informative way.

Related to:

  http://autobuild.buildroot.net/results/1d104a051c83bb31e98565369a2ec7badfa21eca/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 linux/linux.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/linux/linux.mk b/linux/linux.mk
index 16d9f19470..b52f07a0cc 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -644,6 +644,10 @@ $(error No kernel device tree source specified, check your \
 	BR2_LINUX_KERNEL_INTREE_DTS_NAME / BR2_LINUX_KERNEL_CUSTOM_DTS_PATH settings)
 endif
 
+ifeq ($(BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM):$(call qstrip,$(BR2_LINUX_KERNEL_IMAGE_TARGET_NAME)),y:)
+$(error No image name specified in BR2_LINUX_KERNEL_IMAGE_TARGET_NAME despite BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM=y)
+endif
+
 endif # BR_BUILDING
 
 $(eval $(kconfig-package))
-- 
2.46.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
