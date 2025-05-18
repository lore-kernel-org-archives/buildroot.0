Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1095EC3ABD8
	for <buildroot@archiver.kernel.org>; Sun, 18 May 2025 08:58:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D3F6F60D53;
	Sun, 18 May 2025 08:58:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VP6WBiX5wOpA; Sun, 18 May 2025 08:58:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A787A60EC5
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A787A60EC5;
	Sun, 18 May 2025 08:58:02 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 9031FE4
 for <buildroot@buildroot.org>; Sun, 18 May 2025 08:57:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7667240FE0
 for <buildroot@buildroot.org>; Sun, 18 May 2025 08:57:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cKYfId18h8WC for <buildroot@buildroot.org>;
 Sun, 18 May 2025 08:57:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.197;
 helo=relay5-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 0ED37400C6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0ED37400C6
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0ED37400C6
 for <buildroot@buildroot.org>; Sun, 18 May 2025 08:57:38 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPA id 41786432FA;
 Sun, 18 May 2025 08:57:36 +0000 (UTC)
To: Buildroot List <buildroot@buildroot.org>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 18 May 2025 10:57:08 +0200
Message-ID: <20250518085723.23020-16-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250518085723.23020-1-thomas.petazzoni@bootlin.com>
References: <20250518085723.23020-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -51
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdefudektdelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenogfuuhhsphgvtghtffhomhgrihhnucdlgeelmdenucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefvhhhomhgrshcurfgvthgriiiiohhnihcuoehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepudefhfdugfetheevleegiefghfegtefhtddvgfeltedvgeeggeethedttedtieehnecuffhomhgrihhnpehsohhurhgtvghfohhrghgvrdhnvghtnecukfhppedvrgdtvdemkeegvdgrmeeghegrtgemleegtddumegufeduvgemvdefheemtgehvgdvmegvugekfeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtvdemkeegvdgrmeeghegrtgemleegtddumegufeduvgemvdefheemtgehvgdvmegvugekfedphhgvlhhopeifihhnughsuhhrfhdrrddpmhgrihhlfhhrohhmpehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepfedprhgtphhtthhopegsuhhilhgurhhoohhtsegsuhhilhgurhhoohhtrdhorhhgpdhrtghpthhtoheprhgrphhhrggvlhdrm
 hgvlhhothhtvgesmhhinhgurdgsvgdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomh
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1747558656;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mSMUoxsBcTuTpwcS7NJnNh55vtat97fB+/lDmaqII7c=;
 b=gDRy6wSRy4adT87EfXSSPzNB5TEsUw/yHobGwvyKpv1r8CjuGr+jo67jIOp9f95hPwGErs
 FkKelscqI0FHwWgdmGOuN4MBtA+4ewWqchn9MLdB5TchkZvfDfj8ss5btN9I6LDkmlUYTP
 1+O7yJlcznmyrkfjp5Z/2AmhwK0Bqfq33t4zUSSBNPg1AfIowpFZqbl/9BtvkILIoFlQJz
 dKFA4IO/GKN9tqU1UogsZrUBKMbI/DtgRfc7c5Kvf09hwvknJSFRkNGphvnY4vbx4nm7eK
 OEs2HdNIHtmR5ckRVBUo/5VyBzBwmbxgWt830wun33aTyT0ZacPDNA3F37EAIg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=gDRy6wSR
Subject: [Buildroot] [PATCH 15/22] package/sox: rework the 0001 patch to
 make it Git-applicable
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

Due to the "From:" in the commit log itself, this patch was not
applicable using git am:

$ git am 0001-Make-SoX-support-uclibc-based-toolchains.patch
Applying: Make SoX support uclibc-based toolchains
fatal: empty ident name (for <>) not allowed

Thanks to Arnout who found the issue.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../0001-Make-SoX-support-uclibc-based-toolchains.patch  | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/package/sox/0001-Make-SoX-support-uclibc-based-toolchains.patch b/package/sox/0001-Make-SoX-support-uclibc-based-toolchains.patch
index 3d21b570f1..9d004321f7 100644
--- a/package/sox/0001-Make-SoX-support-uclibc-based-toolchains.patch
+++ b/package/sox/0001-Make-SoX-support-uclibc-based-toolchains.patch
@@ -1,10 +1,9 @@
-From 5d51acafe9c38fb05939b4d2d6a9dcde12476458 Mon Sep 17 00:00:00 2001
+From a1c913c52f70ee7c70e1e5ae1473ee407cd1494c Mon Sep 17 00:00:00 2001
 From: Gustavo Zacarias <gustavo@zacarias.com.ar>
-Date: Sat, 29 Jun 2024 12:28:54 +0200
+Date: Sat, 17 May 2025 22:12:23 +0200
 Subject: [PATCH] Make SoX support uclibc-based toolchains
 
-From:
-http://sourceforge.net/p/sox/bugs/179/
+From http://sourceforge.net/p/sox/bugs/179/
 
 Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
 [Julien: rebased patch on package git version 7524160,
@@ -36,5 +35,5 @@ index 3fcf4382..9fc001bd 100644
    (void)fp;
  #endif
 -- 
-2.45.2
+2.49.0
 
-- 
2.49.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
