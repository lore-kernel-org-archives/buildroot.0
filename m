Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B190FC6FA82
	for <buildroot@archiver.kernel.org>; Tue, 20 Sep 2022 21:29:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1CD054192C;
	Tue, 20 Sep 2022 21:29:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1CD054192C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id T5uxbSHcrvDU; Tue, 20 Sep 2022 21:29:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1999F4192B;
	Tue, 20 Sep 2022 21:29:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1999F4192B
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id CE9A61BF2A7
 for <buildroot@lists.busybox.net>; Tue, 20 Sep 2022 21:29:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9870640C9D
 for <buildroot@lists.busybox.net>; Tue, 20 Sep 2022 21:29:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9870640C9D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OGbN0iYtzCYY for <buildroot@lists.busybox.net>;
 Tue, 20 Sep 2022 21:29:25 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8DC48401A4
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8DC48401A4
 for <buildroot@buildroot.org>; Tue, 20 Sep 2022 21:29:25 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPA id 4F5B060007;
 Tue, 20 Sep 2022 21:29:23 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Tue, 20 Sep 2022 23:29:20 +0200
Message-Id: <20220920212921.732287-2-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220920212921.732287-1-thomas.petazzoni@bootlin.com>
References: <20220920212921.732287-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1663709363;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=k/k7JQXp1K3+/nG4tcVjN4E51hspF7Jxs01jDqEQ2kk=;
 b=YhEw/QLKZn1Ds+3xoLuhtosBjEGmY9wJg29NGM75X6E+F9FBIp4A2irodZl8EnHKglu0gh
 bz8s9b2e9cabvoU6Hv0mu82GNcUsC6E4WhMfkS+Wk51OsilV5xtZserMN1TroRIHZTEu3C
 /makr25wCBVPJJzeEfKIoffEDfOEEDePyY90fFNQj8F+Ua70Q56kCgR14M3KQ2n37tiyhx
 Va8Sv+w1hanX2DxAYI1pQ9jTTHQUPABwYclir94j6/Bjuw+/yleVNRL8v9vkgZcaFoEMFU
 /D709rf5RJEoeTQsguf1V/bXzCzRwChvnZ9/MptgloVjvNaQRXBt+MVXmyXkcw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=YhEw/QLK
Subject: [Buildroot] [PATCH 2/2] boot/grub2: ignore CVE-2021-46705
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This CVE is specific to the SUSE distribution. See
https://security-tracker.debian.org/tracker/CVE-2021-46705.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 boot/grub2/grub2.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/boot/grub2/grub2.mk b/boot/grub2/grub2.mk
index f04be05227..875884cf5c 100644
--- a/boot/grub2/grub2.mk
+++ b/boot/grub2/grub2.mk
@@ -32,6 +32,8 @@ GRUB2_IGNORE_CVES += CVE-2019-14865
 GRUB2_IGNORE_CVES += CVE-2020-15705
 # 0002-grub-mkconfig-Restore-umask-for-the-grub.cfg.patch
 GRUB2_IGNORE_CVES += CVE-2021-3981
+# vulnerability is specific to the SUSE distribution
+GRUB2_IGNORE_CVES += CVE-2021-46705
 
 ifeq ($(BR2_TARGET_GRUB2_INSTALL_TOOLS),y)
 GRUB2_INSTALL_TARGET = YES
-- 
2.37.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
