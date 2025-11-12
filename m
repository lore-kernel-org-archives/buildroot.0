Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FE9DCCFA1A
	for <buildroot@archiver.kernel.org>; Wed, 12 Nov 2025 11:06:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8A26E40A88;
	Wed, 12 Nov 2025 11:06:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QcpI01aTPSZ9; Wed, 12 Nov 2025 11:06:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4F03540944
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4F03540944;
	Wed, 12 Nov 2025 11:06:55 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1303C230
 for <buildroot@buildroot.org>; Wed, 12 Nov 2025 11:06:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 050444088D
 for <buildroot@buildroot.org>; Wed, 12 Nov 2025 11:06:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fIIL3cUYrD35 for <buildroot@buildroot.org>;
 Wed, 12 Nov 2025 11:06:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peko@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 0398040862
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0398040862
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0398040862
 for <buildroot@buildroot.org>; Wed, 12 Nov 2025 11:06:49 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 851007684; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 12 Nov 2025 11:06:47 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peko@dell.be.48ers.dk>) id 1vJ8gY-00H0s3-2J;
 Wed, 12 Nov 2025 12:06:46 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 12 Nov 2025 12:06:41 +0100
Message-Id: <20251112110644.4054902-1-peter@korsgaard.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-MIME-Autoconverted: from 8bit to quoted-printable by Purelymail
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=M4m61xXz2ZcBuBAbCiR1ybZefomw9bCvgo/RZd14pzMnYrHHBwgb1Mqmmset6MH/cqQoGgmVllRsR/Vl4bRzYuasuzR/vqXVOBHrtadZrndzccSFMeBcz9Vxj4Kvz9e9H0tvz2DIEDpCW7EtyykrmvgiPAjwQkgOiYn3tBz2PtscAgS8sIAZO9kwI9oNo9vQcGuK9bkDesfBZDNBHjvIkpUMtuU8xONrAQ/CqOWuGmBo3EQEhuJf/yDsE11WYvsrmF6rCu8VjUH5sZWRU+Wh9wwENwuYq7dqN596w68AIcuyuOcVUsvurS1QR6iIRlbnGxLUGkucY7Etz+xlxQ4hRw==;
 s=purelymail3; d=purelymail.com; v=1;
 bh=Ck0QoA/hI0X+x+WYn8aa/6nTsoMrqSPKOB4ytJX7RQ8=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail3 header.b=M4m61xXz
X-Mailman-Original-Authentication-Results: purelymail.com; auth=pass
Subject: [Buildroot] [PATCH 1/3] package/psplash: drop 'default n' for
 fullscreen mode
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
Cc: Phil Eichinger <phil.eichinger@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Commit a028f0a51de0ed ("package/psplash: add support for fullscreen config
option") added a 'default n' line to Config.in, but booleans default to 'n',
so we typically do not add such redundant lines.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/psplash/Config.in | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/psplash/Config.in b/package/psplash/Config.in
index ca39cd0ee3..118801e8ef 100644
--- a/package/psplash/Config.in
+++ b/package/psplash/Config.in
@@ -49,7 +49,6 @@ config BR2_PACKAGE_PSPLASH_STARTUP_MSG
 
 config BR2_PACKAGE_PSPLASH_FULL_SCREEN
 	bool "use fullscreen mode"
-	default n
 	help
 	  Enable displaying the psplash image in fullscreen mode.
 
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
