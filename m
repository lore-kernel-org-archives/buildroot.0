Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABD3FC8303F
	for <buildroot@archiver.kernel.org>; Thu, 28 Aug 2025 08:54:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5A0C580B4E;
	Thu, 28 Aug 2025 08:54:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zeLlaNLSE9Js; Thu, 28 Aug 2025 08:54:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7EE4680BF7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7EE4680BF7;
	Thu, 28 Aug 2025 08:54:36 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id B506CB8C
 for <buildroot@buildroot.org>; Thu, 28 Aug 2025 08:54:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A566640703
 for <buildroot@buildroot.org>; Thu, 28 Aug 2025 08:54:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2DVE3OP37BfG for <buildroot@buildroot.org>;
 Thu, 28 Aug 2025 08:54:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peko@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 43D1040692
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 43D1040692
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 43D1040692
 for <buildroot@buildroot.org>; Thu, 28 Aug 2025 08:54:33 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -58680551; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Thu, 28 Aug 2025 08:54:29 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peko@dell.be.48ers.dk>) id 1urYOp-005MjN-3A;
 Thu, 28 Aug 2025 10:54:27 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 28 Aug 2025 10:54:11 +0200
Message-Id: <20250828085412.1278996-1-peter@korsgaard.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-MIME-Autoconverted: from 8bit to quoted-printable by Purelymail
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=qIrS/caLrR6Qk0no+U21K9jSKXMPOLd0XYYsHkX+vKxPcEOKIutlXve60+CoyHzOUZvKORv8kvxxwBIEA1vHoChQWP3cLRRt8fLn9vdg00AckGQ9coUXkt5l/gSwiRhJFm67UmPhS/Al1iPgUGAKo6ifMEdsSxIr3a7ja/eajdj0mxJYzExHcEAVPmc0mrjwbctrFz30uzy9kt4rSHmsxP4a5l8ghdCrCzF8yafl4PhsrS/Jm3Ww6iaZqUOas/f+HVRxOxYq2dL0EKx/M2kCZ9C3J4zTcBtnXrduOwBB/CQcjN9AIxCdSxj8wTvjJ119KqG1VNzIGIWK31tvyYZqog==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=H6Lj3DwBAMN7YsIOm1u02ImekOSsvQ/Uoipyz2B+5eA=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=qIrS/caL
X-Mailman-Original-Authentication-Results: purelymail.com; auth=pass
Subject: [Buildroot] [PATCH-NEXT] package/rauc: drop uboot-tools select
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
Cc: Heiko Thiery <heiko.thiery@gmail.com>, Andrey Yurovsky <yurovsky@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Users may be building U-Boot outside Buildroot or Build U-Boot but not use
the rauc u-boot bootloader backend (E.G. as using the U-Boot environment is
tricky in secure boot setups) - So replace the selects by a note in the help
text.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/rauc/Config.in | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/rauc/Config.in b/package/rauc/Config.in
index 8d0c0a4f2a..9a910963a3 100644
--- a/package/rauc/Config.in
+++ b/package/rauc/Config.in
@@ -9,14 +9,15 @@ config BR2_PACKAGE_RAUC
 	# uses ENGINE_* API
 	select BR2_PACKAGE_LIBOPENSSL_ENGINES
 	select BR2_PACKAGE_SQUASHFS # run-time dependency
-	select BR2_PACKAGE_UBOOT_TOOLS if BR2_TARGET_UBOOT # run-time dependency
-	select BR2_PACKAGE_UBOOT_TOOLS_FWPRINTENV if BR2_TARGET_UBOOT
 	help
 	  RAUC is the Robust Auto-Update Controller developed by
 	  Pengutronix. It supports updating embedded Linux
 	  systems over the network or from disks and provides a
 	  d-bus interface.
 
+	  Notice: The U-Boot bootloader support requires fw_getenv /
+	  fw_setenv from uboot-tools.
+
 	  http://rauc.io/
 
 if BR2_PACKAGE_RAUC
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
