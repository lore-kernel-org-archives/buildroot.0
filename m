Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACD0BE7719E
	for <buildroot@archiver.kernel.org>; Mon, 13 Jan 2025 08:24:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 13084606E1;
	Mon, 13 Jan 2025 08:24:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4awM9MSqMKSc; Mon, 13 Jan 2025 08:24:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 18BD8606F5
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 18BD8606F5;
	Mon, 13 Jan 2025 08:24:02 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 7EDDA95F
 for <buildroot@buildroot.org>; Mon, 13 Jan 2025 08:24:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5FDC8405B9
 for <buildroot@buildroot.org>; Mon, 13 Jan 2025 08:24:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id d4iQjN3fIAJo for <buildroot@buildroot.org>;
 Mon, 13 Jan 2025 08:23:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::221;
 helo=relay1-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 367CE4057A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 367CE4057A
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 367CE4057A
 for <buildroot@buildroot.org>; Mon, 13 Jan 2025 08:23:58 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPA id 6B653240005;
 Mon, 13 Jan 2025 08:23:55 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Buildroot List <buildroot@buildroot.org>
Cc: Alexey Brodkin <Alexey.Brodkin@synopsys.com>,
 Yuriy Kolerov <Yuriy.Kolerov@synopsys.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Romain Naour <romain.naour@gmail.com>
Date: Mon, 13 Jan 2025 09:23:48 +0100
Message-ID: <20250113082350.241613-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1736756635;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=g8Ak7UdtCeM4/aw+H1I4ziFqVZYjArPBUdwOreJ/cSM=;
 b=Vhj9kiPOk+wHyz6Q7atXSeNDW46ZcPkDVq8KXIJ/5TocIaS5yEVYU6mr8bOQMfU/KhXZO7
 Aov6enxlQLmk2NL+L7R0wxwMs/wVGmI71s/0Fm6YTBdiDJzbEV0V+xLmDx1bxDuBBQBUah
 YQ8QTFypCX0XbsJgSVM+vshA5lgVWXvbROXNt4n5xjTbKHMEtl2DptnRUulh7lsNDLRxT3
 3ACkBW0d7inrrtO7px/3vdIDUPwD5utP7vLgP9DtZ/3qb9qLXxDjis/kl7IrlvwQZBku+4
 JrXHf8k8MugTU0yRqAdtkTywbb2O11DXaERtqY2igjZ8eOaCW/RFom97jhhMIw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Vhj9kiPO
Subject: [Buildroot] [PATCH 1/2]
 toolchain/toolchain-external/toolchain-external-synopsys-arc: fix condition
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

The option BR2_TOOLCHAIN_EXTERNAL_SYNOPSYS_ARC just depends on
BR2_arc, but the choice of toolchains that appears once
BR2_TOOLCHAIN_EXTERNAL_SYNOPSYS_ARC=y only has choices for:

	depends on BR2_arc750d || BR2_arc770d

and

	depends on BR2_archs38_64mpy || BR2_archs38_full || \
		BR2_archs4x_rel31 || BR2_archs4x

which means that if you have a BR2_archs38=y configuration, you end up
with no choice of toolchain, and the build fails with "No C library
selected". Fix this by making sure BR2_TOOLCHAIN_EXTERNAL_SYNOPSYS_ARC
can only be selected when an actual toolchain is available.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../toolchain-external-synopsys-arc/Config.in                 | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/toolchain/toolchain-external/toolchain-external-synopsys-arc/Config.in b/toolchain/toolchain-external/toolchain-external-synopsys-arc/Config.in
index dc333f8474..98bfc2513c 100644
--- a/toolchain/toolchain-external/toolchain-external-synopsys-arc/Config.in
+++ b/toolchain/toolchain-external/toolchain-external-synopsys-arc/Config.in
@@ -1,6 +1,8 @@
 config BR2_TOOLCHAIN_EXTERNAL_SYNOPSYS_ARC
 	bool "Synopsys ARC 2024.06 toolchain"
-	depends on BR2_arc
+	depends on BR2_arc750d || BR2_arc770d || \
+		BR2_archs38_64mpy || BR2_archs38_full || \
+		BR2_archs4x_rel31 || BR2_archs4x
 	depends on BR2_HOSTARCH = "x86_64"
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
 	select BR2_INSTALL_LIBSTDCPP
-- 
2.47.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
