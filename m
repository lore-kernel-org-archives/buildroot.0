Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93F21C02194
	for <buildroot@archiver.kernel.org>; Tue,  4 Feb 2025 11:28:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4C36E60BE6;
	Tue,  4 Feb 2025 11:28:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id X1idod7STEfm; Tue,  4 Feb 2025 11:28:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6996D6077D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6996D6077D;
	Tue,  4 Feb 2025 11:28:15 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id CB5EA185
 for <buildroot@buildroot.org>; Tue,  4 Feb 2025 11:28:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AEF8E81F89
 for <buildroot@buildroot.org>; Tue,  4 Feb 2025 11:28:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FnvYl8P2KHW6 for <buildroot@buildroot.org>;
 Tue,  4 Feb 2025 11:28:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.197;
 helo=relay5-d.mail.gandi.net; envelope-from=thomas.bonnefille@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 475B380CA5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 475B380CA5
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 475B380CA5
 for <buildroot@buildroot.org>; Tue,  4 Feb 2025 11:28:12 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 522534429C;
 Tue,  4 Feb 2025 11:28:09 +0000 (UTC)
Date: Tue, 04 Feb 2025 12:27:31 +0100
MIME-Version: 1.0
Message-Id: <20250204-repair_foot-v1-1-498406d0a384@bootlin.com>
X-B4-Tracking: v=1; b=H4sIAKL5oWcC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDIwMT3aLUgsTMovi0/PwSXQsD8yRTU3NLg0TzVCWgjoKi1LTMCrBp0bG
 1tQDSO8mvXQAAAA==
X-Change-ID: 20250204-repair_foot-807b55790a7e
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 =?utf-8?q?Miqu=C3=A8l_Raynal?= <miquel.raynal@bootlin.com>, 
 Adam Duskett <adam.duskett@amarulasolutions.com>, 
 Thomas Bonnefille <thomas.bonnefille@bootlin.com>
X-Mailer: b4 0.14.2
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvtdegtdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephfffufggtgfgkffvvefosehtjeertdertdejnecuhfhrohhmpefvhhhomhgrshcuuehonhhnvghfihhllhgvuceothhhohhmrghsrdgsohhnnhgvfhhilhhlvgessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepteefffdvieevvdfhjeettdfgudeiudduveduledtueelffeihefgffegffffheeunecuffhomhgrihhnpegsuhhilhgurhhoohhtrdhorhhgpdgtohguvggsvghrghdrohhrghenucfkphepuddtledrkeelrddvfedvrdehheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedutdelrdekledrvdefvddrheehpdhhvghloheplgdujedvrdduiedrvddruddtlegnpdhmrghilhhfrhhomhepthhhohhmrghsrdgsohhnnhgvfhhilhhlvgessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohephedprhgtphhtthhopegruggrmhdrughushhkvghtthesrghmrghruhhlrghsohhluhhtihhonhhsrdgtohhmpdhrtghpthhtohepthhhohhmrghsrdgsohhnnhgvfhhilhhlvgessghoohhtlhhinhdrtghomhdprhgtphhtthhopegsuhhilhgurhhoohhtsegsuhhilhgur
 hhoohhtrdhorhhgpdhrtghpthhtohepmhhiqhhuvghlrdhrrgihnhgrlhessghoohhtlhhinhdrtghomhdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomh
X-GND-Sasl: thomas.bonnefille@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1738668489;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=LSEzNQw29OOKllNOyvTJA7ojx1hYM4HC4MnIVMER2Ac=;
 b=cvtrLphT1/4Pyn5tYZKzf8qcbgSK1MygCghhGQsyVDcq69jIIHozLOP708A49Z1LZXu+ID
 adCkMjoamSJU1C3WPSsh/Kz6GiGKgcI8j7Noz1CH1p8Nri9NOwaPVgWS1TbWyT8roLKHKJ
 vf40IuwqdyTQNEw5sN/b4318cDQmPgKbzH7rRKXPpUDz4VbvuKOSqa3lq/Jx9+DDrsucS3
 bqxvn6A5GNQbN11e/OgXGlI3AHWtNZN/SFKFLtO9ObssWGkEdyhK8Wh0n4F973nVVHJV/k
 r6uZ7Ycoc1vm52MGML/6ZMvBrccn87pAdKmef3J4uIWEsGXtmv+diJ7bSbPBLA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=cvtrLphT
Subject: [Buildroot] [PATCH] package/foot: support soft-float architecture
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
 ...wings-handle-architecture-with-soft-float.patch | 41 ++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/package/foot/0001-box-drawings-handle-architecture-with-soft-float.patch b/package/foot/0001-box-drawings-handle-architecture-with-soft-float.patch
new file mode 100644
index 0000000000000000000000000000000000000000..6599da1d80a6ed7a3f0f9944bbff82d083177d48
--- /dev/null
+++ b/package/foot/0001-box-drawings-handle-architecture-with-soft-float.patch
@@ -0,0 +1,41 @@
+From 1f66f85c203e48881f8ce5ed7be0316814dfc388 Mon Sep 17 00:00:00 2001
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
+This commit makes fetestexcept dependant on if the different
+exceptions exist on the target architecture.
+
+Upstream: https://codeberg.org/dnkl/foot/pulls/1944
+Signed-off-by: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
+---
+ box-drawing.c | 7 +++++--
+ 1 file changed, 5 insertions(+), 2 deletions(-)
+
+diff --git a/box-drawing.c b/box-drawing.c
+index 1c613051..e5f67ca7 100644
+--- a/box-drawing.c
++++ b/box-drawing.c
+@@ -1468,8 +1468,11 @@ draw_box_drawings_light_arc(struct buf *buf, char32_t wc)
+         double x = circle_hemisphere * sqrt(c_r2 - (y - c_y) * (y - c_y)) + c_x;
+ 
+         /* See math_error(7) */
+-        if (errno != 0 ||
+-            fetestexcept(FE_INVALID | FE_DIVBYZERO | FE_OVERFLOW | FE_UNDERFLOW))
++        if (errno != 0
++        #if defined (FE_INVALID) && defined (FE_DIVBYZERO) && defined (FE_OVERFLOW) && defined (FE_UNDERFLOW)
++            || fetestexcept(FE_INVALID | FE_DIVBYZERO | FE_OVERFLOW | FE_UNDERFLOW)
++        #endif
++        )
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
