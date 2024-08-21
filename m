Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF267C5321D
	for <buildroot@archiver.kernel.org>; Wed, 21 Aug 2024 13:15:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 721A24015F;
	Wed, 21 Aug 2024 13:15:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mOVEAEnVBfWP; Wed, 21 Aug 2024 13:15:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 37F794016A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 37F794016A;
	Wed, 21 Aug 2024 13:15:34 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1B9101BF3C0
 for <buildroot@lists.busybox.net>; Wed, 21 Aug 2024 13:15:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2AE044015F
 for <buildroot@lists.busybox.net>; Wed, 21 Aug 2024 13:15:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id F-zKn5XTAoca for <buildroot@lists.busybox.net>;
 Wed, 21 Aug 2024 13:15:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.199;
 helo=relay9-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org EDA044016A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EDA044016A
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp4.osuosl.org (Postfix) with ESMTPS id EDA044016A
 for <buildroot@buildroot.org>; Wed, 21 Aug 2024 13:15:29 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPA id 1109FFF805;
 Wed, 21 Aug 2024 13:15:26 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 21 Aug 2024 15:15:23 +0200
Message-ID: <20240821131525.2038862-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1724246127;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=JTs0Wt1GO9CL34YHJmEs3WUy/PgqcuC5GKyTpZQhQ5o=;
 b=Ze5g4W+yqec+brjQkQY9238m2zprSM+NbIzlw7R6nvcEtEU5OBsh9ZhHowhfmtPW/AhXlF
 6lCSDFQXoCugUBLxVntcZyi3T6zxPNp6R0JlIodiGYwH5LZz9Pu+GhqgQWIhPp6KRNSsX4
 62BneJLYn7PBtpGUFke8cZ+4TF/BhG/5xNgQgntQES1Onm1awAHBBhgOuZ+vMS8lswb4SA
 yMxMjn3Iu0BJDUMPPlRDu0ej4RVx6ipOrUQG06Cph+ODS9T4hNoMXMX0TZ9dzpwsAEHHib
 uDUd3mQzFV6NASLVdv41wg5Fcp7wvnF5vjJ14Cka0cpz8YI3YY/hkTCRLrSqPw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Ze5g4W+y
Subject: [Buildroot] [PATCH 1/2] boot/grub2: ignore CVE-2024-1048
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

As explained in:

  https://security-tracker.debian.org/tracker/CVE-2024-1048
  https://www.openwall.com/lists/oss-security/2024/02/06/3

CVE-2024-1048 is related to a tool called grub-set-bootflag which only
exists in the Redhat fork of Grub, and which we don't use in
Buildroot, so this CVE should be ignored.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 boot/grub2/grub2.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/boot/grub2/grub2.mk b/boot/grub2/grub2.mk
index 6d0d71c47d..19544b6e12 100644
--- a/boot/grub2/grub2.mk
+++ b/boot/grub2/grub2.mk
@@ -25,6 +25,9 @@ GRUB2_IGNORE_CVES += CVE-2019-14865
 GRUB2_IGNORE_CVES += CVE-2020-15705
 # vulnerability is specific to the SUSE distribution
 GRUB2_IGNORE_CVES += CVE-2021-46705
+# vulnerability is specific to the Redhat distribution, affects the
+# grub2-set-bootflag tool, which doesn't exist upstream
+GRUB2_IGNORE_CVES += CVE-2024-1048
 
 ifeq ($(BR2_TARGET_GRUB2_INSTALL_TOOLS),y)
 GRUB2_INSTALL_TARGET = YES
-- 
2.46.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
