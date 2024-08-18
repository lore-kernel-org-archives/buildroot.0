Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45731C52D7C
	for <buildroot@archiver.kernel.org>; Sun, 18 Aug 2024 09:04:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 08D2180D90;
	Sun, 18 Aug 2024 09:04:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jkTW4EHjQG0k; Sun, 18 Aug 2024 09:04:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 442D780F3F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 442D780F3F;
	Sun, 18 Aug 2024 09:04:00 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 76A1F1BF3F7
 for <buildroot@lists.busybox.net>; Sun, 18 Aug 2024 09:03:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 63F074029C
 for <buildroot@lists.busybox.net>; Sun, 18 Aug 2024 09:03:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QvRD2SUWvHQ5 for <buildroot@lists.busybox.net>;
 Sun, 18 Aug 2024 09:03:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.199;
 helo=relay9-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 4A20040289
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4A20040289
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4A20040289
 for <buildroot@buildroot.org>; Sun, 18 Aug 2024 09:03:52 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPA id 91C9EFF808;
 Sun, 18 Aug 2024 09:03:50 +0000 (UTC)
To: Buildroot List <buildroot@buildroot.org>
Date: Sun, 18 Aug 2024 11:03:42 +0200
Message-ID: <20240818090346.947914-5-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240818090346.947914-1-thomas.petazzoni@bootlin.com>
References: <20240818090346.947914-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1723971830;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=u12pStCZltzV2hwUioOPl7ajbQzjjRyhHopvwEeWm14=;
 b=EqfbUumMlKa4oaF/bWQg+rMFSiNqL4PpgyQcbtKsQdkzNXVah7+rLgO1djGvjnPsHDoWid
 OADIiHsgW4l8yavRdO/mm/wt13wHtpLIGzo4QijwankEKnSkXMkQINnBSZaej3ozIFH7wD
 96VU0mCzdOiPPx9PRLX3mpNNctzpRTVZ5FktbPfLfLdGj0q50lDgVL5WSpmtPI83U8W0oa
 kztwXgt7oVznMFAdPdkMp8tJ7VOxvyxnq4SfqXlt+J1+DVWXG0G0eDSUZONkxfKGFmSDfT
 TxxqqLALeIWVg4mCfyS8lw7z4ydN4ShAiHoJF3yO9AmHEKadpcAdlZSutBapxA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=EqfbUumM
Subject: [Buildroot] [PATCH v2 4/5] utils/genrandconfig: do not use
 BR2_BACKUP_SITE for some builds
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In order to test that upstream sites are still working, we need to NOT
fallback to sources.buildroot.net for some builds.

As there is anyway a local cache in the autobuilder instances, we need
to do quite a lot of builds without any BR2_BACKUP_SITE configured to
have a chance to catch issues, which is why a 50% chance is used to
unset BR2_BACKUP_SITE.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 utils/genrandconfig | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/utils/genrandconfig b/utils/genrandconfig
index 0ccb6d83a6..66296e1954 100755
--- a/utils/genrandconfig
+++ b/utils/genrandconfig
@@ -562,6 +562,11 @@ async def gen_config(args):
         configlines.append("BR2_REPRODUCIBLE=y\n")
         configlines.append("BR2_TARGET_ROOTFS_TAR=y\n")
 
+    # From time to time, ignore sources.buildroot.net to really fetch
+    # from upstream
+    if randint(0, 1) == 0:
+        configlines.append("""BR2_BACKUP_SITE=""\n""")
+
     with open(configfile, "a") as configf:
         configf.writelines(configlines)
 
-- 
2.46.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
