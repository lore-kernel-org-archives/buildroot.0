Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA98AC3601A
	for <buildroot@archiver.kernel.org>; Sun,  6 Apr 2025 01:14:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EE2BC81F5A;
	Sun,  6 Apr 2025 01:14:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nyr4qU48AC7q; Sun,  6 Apr 2025 01:14:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1F00C81F55
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1F00C81F55;
	Sun,  6 Apr 2025 01:14:23 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 839051C7
 for <buildroot@buildroot.org>; Sun,  6 Apr 2025 01:14:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EA1DF40461
 for <buildroot@buildroot.org>; Sun,  6 Apr 2025 01:14:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id j4m7sMA-YTOa for <buildroot@buildroot.org>;
 Sun,  6 Apr 2025 01:14:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.178.249;
 helo=mslow3.mail.gandi.net; envelope-from=thomas.bonnefille@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 0A608400BD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0A608400BD
Received: from mslow3.mail.gandi.net (mslow3.mail.gandi.net [217.70.178.249])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0A608400BD
 for <buildroot@buildroot.org>; Sun,  6 Apr 2025 01:14:14 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by mslow3.mail.gandi.net (Postfix) with ESMTP id 1ABC5584523
 for <buildroot@buildroot.org>; Sun,  6 Apr 2025 00:49:14 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id BCAD0443E8;
 Sun,  6 Apr 2025 00:49:09 +0000 (UTC)
Date: Sun, 06 Apr 2025 02:48:57 +0200
MIME-Version: 1.0
Message-Id: <20250406-fix_zxing-v2-4-0bce0e835a60@bootlin.com>
References: <20250406-fix_zxing-v2-0-0bce0e835a60@bootlin.com>
In-Reply-To: <20250406-fix_zxing-v2-0-0bce0e835a60@bootlin.com>
To: buildroot@buildroot.org
X-Mailer: b4 0.14.2
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdduleehkeehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhfffugggtgffkfhgjvfevofesthejredtredtjeenucfhrhhomhepvfhhohhmrghsuceuohhnnhgvfhhilhhlvgcuoehthhhomhgrshdrsghonhhnvghfihhllhgvsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeekffdtfeffveffhfejveevvedutdefffeitdeljeeuleffuefgvedtlefhteejffenucffohhmrghinhepfhhrvggvuggvshhkthhophdrohhrghenucfkphepvdgrtddumegtsgduleemleelvdeimehfkedttdemudduudemtggufhejmeeggeehfhemiegsjeehnecuvehluhhsthgvrhfuihiivgepudefnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudelmeelledvieemfhektddtmeduuddumegtughfjeemgeeghehfmeeisgejhedphhgvlhhopegludelvddrudeikedruddruddvngdpmhgrihhlfhhrohhmpehthhhomhgrshdrsghonhhnvghfihhllhgvsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeehpdhrtghpthhtohepthhhohhmrghsrdgsohhnnhgvfhhilhhlvgessghoohhtlhhinhdrtghomhdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiio
 hhnihessghoohhtlhhinhdrtghomhdprhgtphhtthhopegsuhhilhgurhhoohhtsegsuhhilhgurhhoohhtrdhorhhgpdhrtghpthhtohepfhhhuhhnlhgvthhhsehtrhhoohguohhnqdhsohhfthifrghrvgdrtghomhdprhgtphhtthhopehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhm
X-GND-Sasl: thomas.bonnefille@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1743900550;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bYUC2+IpH6b5ePu8zCtbzCSBunYnf1jYb7rVoQjSg5w=;
 b=XassqckHdZuX0tgaYB2Sf+bjvk/ulgEaMHeyr/OFa+VQJMSYA6aWYsT1RDsafFeD8m8yLi
 Pr9zXphC0mru/fo17l1awyhV9Olc1ultj7XAo1rUARlpFXv1yw41nYwg1C6Gfvi/ORPBQL
 DaHKr+8rvGZugKNj0pLbvF3n1CKvBUi7RXaQ+mmZgtWid/mqWTP6uuuhTaV/FElg5OaPje
 Dr5aAWp5orm1srAGJ34yADYtmDd6kdi/6ef8lcjkunYLDY+f6Yl8ocM7r7eFxhYYUI58S6
 6+QO/mvSViZFXuUguFIk5f4odHlqsX1Ay0HNzF39CaFI9zIrcrKdSF6hk242ZA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=XassqckH
Subject: [Buildroot] [PATCH v2 04/11] package/gstreamer1/gst1-libav: bump
 version to 1.24.11
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
Cc: Thomas Bonnefille <thomas.bonnefille@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 =?utf-8?q?Miqu=C3=A8l_Raynal?= <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

No functional change, but bump for consistency. For details, see the
release notes:

    https://gstreamer.freedesktop.org/releases/1.24/

Signed-off-by: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
---
 package/gstreamer1/gst1-libav/gst1-libav.hash | 4 ++--
 package/gstreamer1/gst1-libav/gst1-libav.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gstreamer1/gst1-libav/gst1-libav.hash b/package/gstreamer1/gst1-libav/gst1-libav.hash
index b6130ac146aa4c9478a18ae6ff89d0635dfeea47..cc11ab55f818fdd407580c0d8efad8b589702aa0 100644
--- a/package/gstreamer1/gst1-libav/gst1-libav.hash
+++ b/package/gstreamer1/gst1-libav/gst1-libav.hash
@@ -1,3 +1,3 @@
-# From https://gstreamer.freedesktop.org/src/gst-libav/gst-libav-1.22.12.tar.xz.sha256sum
-sha256  3b60d4cac2fbcd085a93e9389ca23e0443bee1ca75574d31d4f12bb1bbecab48  gst-libav-1.22.12.tar.xz
+# From https://gstreamer.freedesktop.org/src/gst-libav/gst-libav-1.24.11.tar.xz.sha256sum
+sha256  13776fc16f7ce587d437d56d83e08c9224768dddc897dd3c88208d970a6aa422  gst-libav-1.24.11.tar.xz
 sha256  ad2eec519ebd4b5df86ea84dff24ae3bfa2edea846a703b58902dd221ae375db  COPYING
diff --git a/package/gstreamer1/gst1-libav/gst1-libav.mk b/package/gstreamer1/gst1-libav/gst1-libav.mk
index 142ea7ed9592afce8be99974ea0765b59777e1a4..42b0b568b87499a65125289e26237e67b6e8c566 100644
--- a/package/gstreamer1/gst1-libav/gst1-libav.mk
+++ b/package/gstreamer1/gst1-libav/gst1-libav.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GST1_LIBAV_VERSION = 1.22.12
+GST1_LIBAV_VERSION = 1.24.11
 GST1_LIBAV_SOURCE = gst-libav-$(GST1_LIBAV_VERSION).tar.xz
 GST1_LIBAV_SITE = https://gstreamer.freedesktop.org/src/gst-libav
 GST1_LIBAV_LICENSE = LGPL-2.1+

-- 
2.49.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
