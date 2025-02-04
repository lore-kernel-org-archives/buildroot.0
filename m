Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A095C02193
	for <buildroot@archiver.kernel.org>; Tue,  4 Feb 2025 16:17:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 342EC81E1E;
	Tue,  4 Feb 2025 16:17:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 19e7JxcQOq5L; Tue,  4 Feb 2025 16:16:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 15DDA81DF4
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 15DDA81DF4;
	Tue,  4 Feb 2025 16:16:58 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 1A04B12F
 for <buildroot@buildroot.org>; Tue,  4 Feb 2025 16:16:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0951040965
 for <buildroot@buildroot.org>; Tue,  4 Feb 2025 16:16:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id se0xzsY2HwN8 for <buildroot@buildroot.org>;
 Tue,  4 Feb 2025 16:16:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::223;
 helo=relay3-d.mail.gandi.net; envelope-from=thomas.bonnefille@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org EB4D74056A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EB4D74056A
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp2.osuosl.org (Postfix) with ESMTPS id EB4D74056A
 for <buildroot@buildroot.org>; Tue,  4 Feb 2025 16:16:54 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 05A9B204AC;
 Tue,  4 Feb 2025 16:16:51 +0000 (UTC)
Date: Tue, 04 Feb 2025 17:16:26 +0100
MIME-Version: 1.0
Message-Id: <20250204-repair_mimic-v1-1-c8e8f29b6c1e@bootlin.com>
X-B4-Tracking: v=1; b=H4sIAFk9omcC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDIwMT3aLUgsTMovjczNzMZF0jI0tLCzPDNFML0yQloJaCotS0zAqwcdG
 xtbUA0MG0EV4AAAA=
X-Change-ID: 20250204-repair_mimic-2299861f585b
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 =?utf-8?q?Miqu=C3=A8l_Raynal?= <miquel.raynal@bootlin.com>, 
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, 
 Thomas Bonnefille <thomas.bonnefille@bootlin.com>
X-Mailer: b4 0.14.2
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvtdelkecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephfffufggtgfgkffvvefosehtjeertdertdejnecuhfhrohhmpefvhhhomhgrshcuuehonhhnvghfihhllhgvuceothhhohhmrghsrdgsohhnnhgvfhhilhhlvgessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnheptdelteegueeugfejfeejtdfhjeeuhfffudfgfeetgeefheevleelueeiueejfffhnecukfhppedutdelrdekledrvdefvddrheehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddtledrkeelrddvfedvrdehhedphhgvlhhopegludejvddrudeirddvrddutdelngdpmhgrihhlfhhrohhmpehthhhomhgrshdrsghonhhnvghfihhllhgvsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeehpdhrtghpthhtohepsghuihhlughrohhothessghuihhlughrohhothdrohhrghdprhgtphhtthhopehthhhomhgrshdrsghonhhnvghfihhllhgvsegsohhothhlihhnrdgtohhmpdhrtghpthhtohepmhhiqhhuvghlrdhrrgihnhgrlhessghoohhtlhhinhdrtghomhdprhgtphhtthhopegviigvqhhuihgvlhesvhgrnhhguhgrrhguihgrshhurhdrtghomhdrr
 ghrpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhm
X-GND-Sasl: thomas.bonnefille@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1738685812;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=QmG9ke0pujiiDEmh/h9TIdFIgzoGND+NYsuDaVlzLic=;
 b=ZU+kRljDLfBxPtbp1Jf/KjJe99y+lCQVTGtZOtDCe91FBBW1AaJ44eBAS7G09E6oVXjy+O
 tLKAi8HVnn8X+OYgPd4DpsXowvUkrpL/3gPZ6IecSN5GjhRegQkewa/LlnE/sXuR7rYljr
 LvOzVX9lGUEuuJ1K4w7YQ2e0D/wW13UfOZB/GRY/i5ba0y9xOFysqfjpFbOEBOsK6zPmWg
 GlC8w53GKBwa4+NtpW5DNLWvusNATDJoXirLkg22hY9MT4x4/qtJob1a585/10juapVZ9K
 o7RZvuNHhocssxjOifWLTKjWXmFy0fmCXoir6A4O9OzwDuiNJ+wBA2G6Go5L+Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=ZU+kRljD
Subject: [Buildroot] [PATCH] package/mimic: update url
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

MycroftAI just moved mimic to "mimic1" on Github as multiple versions of
it have been released, this cause the sha256 of the package to be
modified.
This commit modify the URL of the package to avoid this issue.

Signed-off-by: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
---
This package hasn't been updated since 2021 so the issue also affects
all versions since then.
---
 package/mimic/mimic.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/mimic/mimic.mk b/package/mimic/mimic.mk
index 2d246561c96696ae80e97d69a577d8f25180fc06..48ebc479c8cf6d47819aa19ce95197ef08a970ad 100644
--- a/package/mimic/mimic.mk
+++ b/package/mimic/mimic.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 MIMIC_VERSION = 1.1.0
-MIMIC_SITE = $(call github,MycroftAI,mimic,$(MIMIC_VERSION))
+MIMIC_SITE = $(call github,MycroftAI,mimic1,$(MIMIC_VERSION))
 MIMIC_LICENSE = MIT
 MIMIC_LICENSE_FILES = COPYING
 

---
base-commit: d5b3795e92727c6565901cddf0c0f17c7854df56
change-id: 20250204-repair_mimic-2299861f585b

Best regards,
-- 
Thomas Bonnefille <thomas.bonnefille@bootlin.com>

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
