Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1484C021A9
	for <buildroot@archiver.kernel.org>; Mon, 17 Feb 2025 18:43:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8B52181179;
	Mon, 17 Feb 2025 18:43:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id P8VqHb1Ypky7; Mon, 17 Feb 2025 18:43:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 60AAB82033
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 60AAB82033;
	Mon, 17 Feb 2025 18:43:46 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id BF43972
 for <buildroot@buildroot.org>; Mon, 17 Feb 2025 18:43:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A2F06400B8
 for <buildroot@buildroot.org>; Mon, 17 Feb 2025 18:43:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eFWqFU3YZqlb for <buildroot@buildroot.org>;
 Mon, 17 Feb 2025 18:43:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::228;
 helo=relay8-d.mail.gandi.net; envelope-from=thomas.bonnefille@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 268E5400C8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 268E5400C8
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 268E5400C8
 for <buildroot@buildroot.org>; Mon, 17 Feb 2025 18:43:42 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3E4FB44437;
 Mon, 17 Feb 2025 18:43:38 +0000 (UTC)
Date: Mon, 17 Feb 2025 19:43:34 +0100
MIME-Version: 1.0
Message-Id: <20250217-repair_foot-v2-1-f118f9a8282f@bootlin.com>
X-B4-Tracking: v=1; b=H4sIAFWDs2cC/22MQQ6CMBAAv0L2bM22tgKe/IchpsAim2hLtoRoC
 H+3cvY4k8yskEiYElyKFYQWThxDBnMooBt9eJDiPjMYNA4NWiU0eZb7EOOsKixb58oafUmQi0l
 o4Pd+uzWZR05zlM8+X/TP/v8sWmll68riuUd/quy1zfrJ4djFFzTbtn0BEjYegqgAAAA=
X-Change-ID: 20250204-repair_foot-807b55790a7e
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 =?utf-8?q?Miqu=C3=A8l_Raynal?= <miquel.raynal@bootlin.com>, 
 Adam Duskett <adam.duskett@amarulasolutions.com>, 
 Thomas Bonnefille <thomas.bonnefille@bootlin.com>
X-Mailer: b4 0.14.2
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdehleduhecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephfffufggtgfgkffvvefosehtjeertdertdejnecuhfhrohhmpefvhhhomhgrshcuuehonhhnvghfihhllhgvuceothhhohhmrghsrdgsohhnnhgvfhhilhhlvgessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepudefhfefhfdtgfegteejuddvueeujedtgeeljeejfefgteejgfehleehieffueelnecuffhomhgrihhnpegsuhhilhgurhhoohhtrdhorhhgpdhkvghrnhgvlhdrohhrghdptghouggvsggvrhhgrdhorhhgnecukfhppedvrgdtudemtggsudelmeelhegsleemrggttddtmegvsgdttgemuggrsgefmeekieguleemfedugegvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgduleemleehsgelmegrtgdttdemvggstdgtmegurggsfeemkeeiugelmeefudegvgdphhgvlhhopegludelvddrudeikedruddruddvngdpmhgrihhlfhhrohhmpehthhhomhgrshdrsghonhhnvghfihhllhgvsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeehpdhrtghpthhtoheprggurghmrdguuhhskhgvthhtsegrmhgrrhhulhgrshholhhuthhiohhnshdrt
 ghomhdprhgtphhtthhopehthhhomhgrshdrsghonhhnvghfihhllhgvsegsohhothhlihhnrdgtohhmpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtohepsghuihhlughrohhothessghuihhlughrohhothdrohhrghdprhgtphhtthhopehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhm
X-GND-Sasl: thomas.bonnefille@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1739817819;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=fdTju8+lBiu4slPVMb2kjrzDX7F9X/qNRbZGdCqTgow=;
 b=gq9Ksu5ceHz7Zvw5Zv5nALSKqqI400P8xAnvSFSEdz6rPtdNM1Rezjf4191e6UddzbJuaN
 G+OVhkvlApsjOhP0EJjrmyDxbjoOin3echcSK5cqq78ZGtpPnjeotD9XElJFiM2XJj+NC5
 nRVNLaG30FUMlvGHw4OjOl/FwCs+AXHgotCNK49WruDIUgnb35aXIGQCoirWGcuZqHsngM
 wBTnPOOsPCkySGmsA4AvUCR2U4XGeKFhoV0hHtycW5OKky6YKAZP0wCVvzVX69VuvYun/p
 AhsMjNacwSfdDDGyMRCxgecwVFeA4PGC2ifF3/hE4wPJjwvcs1/rK3pqOYTJxg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=gq9Ksu5c
Subject: [Buildroot] [PATCH v2] package/foot: support soft-float architecture
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
From: Thomas Bonnefille via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Architecture using soft float don't support the math FE_* exceptions.
This commit adds a patch to conditionnally build the FE_* exception
handling.

Fixes:
    https://autobuild.buildroot.org/results/88d/88d764dd12bdbdbe633ebc703c461ebe95b75693/

Signed-off-by: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
---
Changes in v2:
- Reworked patch and got it merged to the initial project
- Link to v1: https://lore.kernel.org/r/20250204-repair_foot-v1-1-498406d0a384@bootlin.com
---
 ...wings-handle-architecture-with-soft-float.patch | 42 ++++++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/package/foot/0001-box-drawings-handle-architecture-with-soft-float.patch b/package/foot/0001-box-drawings-handle-architecture-with-soft-float.patch
new file mode 100644
index 0000000000000000000000000000000000000000..1120fa44c178a968d6a7109d3af18ab06847abb7
--- /dev/null
+++ b/package/foot/0001-box-drawings-handle-architecture-with-soft-float.patch
@@ -0,0 +1,42 @@
+From 9443ac7e2937bb4f26cf44c73bb8150860c5df45 Mon Sep 17 00:00:00 2001
+From: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
+Date: Tue, 4 Feb 2025 09:48:13 +0100
+Subject: [PATCH] box-drawings: handle architecture with soft-float
+
+Currently, architecture using soft-floats doesn't support instructions
+FE_INVALID, FE_DIVBYZERO, FE_OVERFLOW and FE_UNDERFLOW and so building
+on those architectures results with a build error.
+As the sqrt math function should set errno to EDOM if an error occurs,
+fetestexcept shouldn't be mandatory.
+
+This commit removes the float environment error handling.
+
+Upstream: https://codeberg.org/dnkl/foot/commit/9443ac7e2937bb4f26cf44c73bb8150860c5df45
+Signed-off-by: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
+---
+ box-drawing.c | 4 +---
+ 1 file changed, 1 insertion(+), 3 deletions(-)
+
+diff --git a/box-drawing.c b/box-drawing.c
+index 1c613051..421ff54d 100644
+--- a/box-drawing.c
++++ b/box-drawing.c
+@@ -1462,14 +1462,12 @@ draw_box_drawings_light_arc(struct buf *buf, char32_t wc)
+      */
+     for (double i = y_min*16; i <= y_max*16; i++) {
+         errno = 0;
+-        feclearexcept(FE_ALL_EXCEPT);
+ 
+         double y = i / 16.;
+         double x = circle_hemisphere * sqrt(c_r2 - (y - c_y) * (y - c_y)) + c_x;
+ 
+         /* See math_error(7) */
+-        if (errno != 0 ||
+-            fetestexcept(FE_INVALID | FE_DIVBYZERO | FE_OVERFLOW | FE_UNDERFLOW))
++        if (errno != 0)
+         {
+             continue;
+         }
+-- 
+2.48.1
+

---
base-commit: d5b3795e92727c6565901cddf0c0f17c7854df56
change-id: 20250204-repair_foot-807b55790a7e

Best regards,
-- 
Thomas Bonnefille <thomas.bonnefille@bootlin.com>

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
