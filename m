Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F00DBE7717F
	for <buildroot@archiver.kernel.org>; Mon, 16 Dec 2024 22:36:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A743F61178;
	Mon, 16 Dec 2024 22:36:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cFJfWLCCvjzD; Mon, 16 Dec 2024 22:36:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C6303610C2
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C6303610C2;
	Mon, 16 Dec 2024 22:36:26 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 05770C5
 for <buildroot@buildroot.org>; Mon, 16 Dec 2024 22:36:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E75328454E
 for <buildroot@buildroot.org>; Mon, 16 Dec 2024 22:36:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 89DflWqnzWjz for <buildroot@buildroot.org>;
 Mon, 16 Dec 2024 22:36:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::228;
 helo=relay8-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org D04838451C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D04838451C
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D04838451C
 for <buildroot@buildroot.org>; Mon, 16 Dec 2024 22:36:24 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPA id D11891BF204;
 Mon, 16 Dec 2024 22:36:22 +0000 (UTC)
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Jannik Becher <becher.jannik@gmail.com>
Date: Mon, 16 Dec 2024 23:36:18 +0100
Message-ID: <20241216223620.1125276-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1734388583;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=1tqQBkFMMCspcJPDFYXfAJUU0MiHwPtlViYODPOpKM8=;
 b=dWZUFD8WNexRxnLog6sOg8K0bHm20tmbskePSq5UBzFTSkzWklst0FnK+aFzUh9Uzoexf2
 QlvhYV8sXilN8ZFB6R/ch0JqRuGKgwyZNR/QinGEd2j/P5X6Tm9Wstw+iaxO0HL3h6kcYP
 hg7QD1Nf16mnEZyzRcpih1C3YblB3378jLDV3ez2bv7Qi3H/8Z/9h6YdmQm5UGYEwFW6yk
 Bdvu3UBKXrTc+ohtXrPNW1xMsy5pgbO5k4/c1Khiws97Iljv2WtaMAgLMDwGbL08Z6qS4f
 phaahjtWDHULVH6qPMjjTtZPLknKcZLvQciUXS8/KyIUpQCO8IEzNIQuoOEjhw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=dWZUFD8W
Subject: [Buildroot] [PATCH] utils/genrandconfig: more igh-ethercat tweaks
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

utils/genrandconfig already had some logic to disable building
igh-ethercat drivers since they are highly kernel version
specific. Commit
eec3a1108a65ab8de4a313a7f34205c5d5ad8f2b ("package/igh-ethercat: add
configuration options") recently added a number of additional config
options to build more igh-ethercat drivers, which causes a number of
autobuilder failures. This commit therefore updates genrandconfig to
also not build those new drivers.

Fixes:

  https://autobuild.buildroot.org/results/9489b68967a35aa398e608d663824b2d2be9cae5/ (stmmac driver)
  https://autobuild.buildroot.org/results/ec2c24f16b365a3e7de8964fc8d73cb570c74abe/ (igc driver)
  https://autobuild.buildroot.org/results/65e17f8e03ab14dd9f39386f2176629677b8ba8c/ (genet driver)

Cc: Jannik Becher <becher.jannik@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 utils/genrandconfig | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/utils/genrandconfig b/utils/genrandconfig
index 0698cc5ff0..67f0ea9f73 100755
--- a/utils/genrandconfig
+++ b/utils/genrandconfig
@@ -504,7 +504,8 @@ async def fixup_config(sysinfo, configfile):
 
     # Don't build igh-ethercat driver as they are highly
     # kernel-version specific
-    for opt in ['8139TOO', 'E100', 'E1000', 'E1000E', 'R8169']:
+    for opt in ['8139TOO', 'E100', 'E1000', 'E1000E', 'R8169', 'GENET',
+                'IGB', 'IGC', 'STMMAC_PCI', 'STMMAC', 'DWMAC_INTEL', 'CCAT']:
         optstr = 'BR2_PACKAGE_IGH_ETHERCAT_%s=y\n' % opt
         if optstr in configlines:
             configlines.remove(optstr)
-- 
2.47.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
