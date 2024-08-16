Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77B2AC3DA4A
	for <buildroot@archiver.kernel.org>; Fri, 16 Aug 2024 12:07:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2ED8560DCB;
	Fri, 16 Aug 2024 12:07:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Li4a_B64pDN3; Fri, 16 Aug 2024 12:07:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 97DE860752
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 97DE860752;
	Fri, 16 Aug 2024 12:07:01 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E6F4E1BF37E
 for <buildroot@lists.busybox.net>; Fri, 16 Aug 2024 12:06:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DE78B4032C
 for <buildroot@lists.busybox.net>; Fri, 16 Aug 2024 12:06:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8zY97VmWWCZq for <buildroot@lists.busybox.net>;
 Fri, 16 Aug 2024 12:06:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.197;
 helo=relay5-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org C84604026A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C84604026A
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C84604026A
 for <buildroot@buildroot.org>; Fri, 16 Aug 2024 12:06:47 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPA id B61991C0007;
 Fri, 16 Aug 2024 12:06:45 +0000 (UTC)
To: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 16 Aug 2024 14:06:31 +0200
Message-ID: <20240816120635.606346-5-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240816120635.606346-1-thomas.petazzoni@bootlin.com>
References: <20240816120635.606346-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1723810006;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hSjJGpJK5FMfAf612kjtkiE6mj58/mwurVMYMNb5+Yk=;
 b=hUagxGNCS37qca3XwpIDcZdnRLbRNTXFH5wJgFu+rtRgzwKkN6WbmSZNHxogR0aLuF+qoV
 VAvJ5BmhjfpavzZN09I6mYg1u0zwNEmHXBYCAii8wDqlNwS5vRG7QdSLPnnD3bp6WZQ3nN
 +d/AFQNjuIX65SumQUyLjmAqu/qEHJEXTgNiETuN0TvJPcw5/hvzFpoC//cIt8koTMz+8b
 AQruQKLHPambrix0oZ2+eu+ozl6ujO/bEl8SQnX8qJmq5nx4f1Ck48vkM/CTRXiSKJxkL9
 WUzNxJGcX+WG9SOwc5Ehbrtxc5A1npXYiNr66c1KGRwPSuGy1P6yZ4h73Y1+yg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=hUagxGNC
Subject: [Buildroot] [PATCH 4/5] utils/genrandconfig: do not use
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Buildroot List <buildroot@buildroot.org>
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
index 7dc50682c9..7118807e9b 100755
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
     with open(configfile, "w+") as configf:
         configf.writelines(configlines)
 
-- 
2.46.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
