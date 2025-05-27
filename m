Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE08AC54ED1
	for <buildroot@archiver.kernel.org>; Tue, 27 May 2025 19:51:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 766C960BF3;
	Tue, 27 May 2025 19:51:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8FcDqV8y2EIw; Tue, 27 May 2025 19:51:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E076660BEB
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E076660BEB;
	Tue, 27 May 2025 19:51:52 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 60663B66
 for <buildroot@buildroot.org>; Tue, 27 May 2025 19:51:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 46BC6408C3
 for <buildroot@buildroot.org>; Tue, 27 May 2025 19:51:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PF4lGCwqBYsT for <buildroot@buildroot.org>;
 Tue, 27 May 2025 19:51:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.178.249;
 helo=mslow3.mail.gandi.net; envelope-from=thomas.bonnefille@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 09E98405F4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 09E98405F4
Received: from mslow3.mail.gandi.net (mslow3.mail.gandi.net [217.70.178.249])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 09E98405F4
 for <buildroot@buildroot.org>; Tue, 27 May 2025 19:51:49 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by mslow3.mail.gandi.net (Postfix) with ESMTP id 443B85844B9
 for <buildroot@buildroot.org>; Tue, 27 May 2025 19:23:50 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id AF992432D8;
 Tue, 27 May 2025 19:23:43 +0000 (UTC)
Date: Tue, 27 May 2025 21:23:19 +0200
MIME-Version: 1.0
Message-Id: <20250527-fix_gmrender-v1-1-9a66d16c8167@bootlin.com>
X-B4-Tracking: v=1; b=H4sIACYRNmgC/x2MQQqAIBAAvxJ7TtCFUvpKRFhutocsVogg/HvSc
 RhmXsgkTBmG5gWhmzOfqYJpG1h3nyIpDpUBNXa6Q6s2fuZ4CKVAooyziIsmb3sHNbmEqv9341T
 KB/ZI6NVeAAAA
X-Change-ID: 20250527-fix_gmrender-18722b0ea768
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 =?utf-8?q?Miqu=C3=A8l_Raynal?= <miquel.raynal@bootlin.com>, 
 Hiroshi Kawashima <kei-k@ca2.so-net.ne.jp>, 
 Thomas Bonnefille <thomas.bonnefille@bootlin.com>
X-Mailer: b4 0.14.2
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddtgddvuddvudculddtuddrgeefvddrtddtmdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephfffufggtgfgkffvvefosehtjeertdertdejnecuhfhrohhmpefvhhhomhgrshcuuehonhhnvghfihhllhgvuceothhhohhmrghsrdgsohhnnhgvfhhilhhlvgessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepudduffejjeffhfelfeeuieeuteejieekveehtdeujeegheejfeettdeftdelgeejnecuffhomhgrihhnpegsuhhilhgurhhoohhtrdhorhhgnecukfhppedvrgdtudemtggsudelmeelledvieemfhektddtmeduuddumegtughfjeemgeeghehfmeeisgejheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudelmeelledvieemfhektddtmeduuddumegtughfjeemgeeghehfmeeisgejhedphhgvlhhopegludelvddrudeikedruddruddvngdpmhgrihhlfhhrohhmpehthhhomhgrshdrsghonhhnvghfihhllhgvsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeehpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtohepsghuihhlughrohhot
 hessghuihhlughrohhothdrohhrghdprhgtphhtthhopehkvghiqdhksegtrgdvrdhsohdqnhgvthdrnhgvrdhjphdprhgtphhtthhopehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmpdhrtghpthhtohepthhhohhmrghsrdgsohhnnhgvfhhilhhlvgessghoohhtlhhinhdrtghomh
X-GND-Sasl: thomas.bonnefille@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1748373825;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=YstAJWXOcokomWCQFHQ23cfORJLWAC3n5UVDMS6/tUo=;
 b=HEdnE32/D2f7s8Oor7vSRZJGkk79VpOxp9ATg8+MATq2q9ApW8LYUOg/VoFgLKlkAlKA+C
 mDMCl5DjeLCHgq2sqy4SVWLviATxfREZH4jS6CBwY/tzqTuXsHDSakfW/WAhN1IdtQ6faV
 Q4ImMO2mQ9YINXfIgInjc8IzO90nJGOJ5wuQGPYDqaVOL25l5mEjC+ibMjUWcSJqmE6w12
 LeRaY/vyGb+RYCGMThfEIJAU8+2pBzIaKpgu+3Nudqnuer9eWCiQQKrSjZU3IydMqFDHBC
 ZLOj3WVOieVp3+sqMkYl0725uQpU3cAJltHb1QoG6Yslpj5RP8AoqMoCPuxvBA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=HEdnE32/
Subject: [Buildroot] [PATCH] package/gmrender-resurrect: bump to version 0.3
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

Version 0.3 (and 0.2) of gmrender-resurrect bring some bugfixes.

Fixes:
    https://autobuild.buildroot.org/results/1e1/1e1e5a494bf1ca5ba920c4e06a1affff4ad61033//

Signed-off-by: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
---
As the package is broken on 2025.02 and v0.3 and 0.2 only contains
bugfixes, I think this patch can be backported to 2025.02
---
 package/gmrender-resurrect/gmrender-resurrect.hash | 2 +-
 package/gmrender-resurrect/gmrender-resurrect.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/gmrender-resurrect/gmrender-resurrect.hash b/package/gmrender-resurrect/gmrender-resurrect.hash
index f14abffc3b91b90571520a5f650b777fb30f9dd3..91b9a6c9a16dc378d488298583ae9892afa5c56e 100644
--- a/package/gmrender-resurrect/gmrender-resurrect.hash
+++ b/package/gmrender-resurrect/gmrender-resurrect.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  550b07bc6a073176ad7de0efd603663c9875311dfb81ae1075263e3fd6974335  gmrender-resurrect-0.1.tar.gz
+sha256  dbe0d41b01339a4805fdd0edf914fbc4870dba2eb9c54ad5bf9446ccfd3fa482  gmrender-resurrect-0.3.tar.gz
 sha256  c38aee9e3c8c4d5d594ff548a1be05453023016d6286931f6512db215ec1fd42  COPYING
diff --git a/package/gmrender-resurrect/gmrender-resurrect.mk b/package/gmrender-resurrect/gmrender-resurrect.mk
index 77ac83ca410ad1521993a1e0d9d3990c4b0f0c32..d5b411f46aa4fa514d8baa54421902bebda1a04a 100644
--- a/package/gmrender-resurrect/gmrender-resurrect.mk
+++ b/package/gmrender-resurrect/gmrender-resurrect.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GMRENDER_RESURRECT_VERSION = 0.1
+GMRENDER_RESURRECT_VERSION = 0.3
 GMRENDER_RESURRECT_SITE = $(call github,hzeller,gmrender-resurrect,v$(GMRENDER_RESURRECT_VERSION))
 # Original distribution does not have default configure,
 # so we need to autoreconf:

---
base-commit: 9d92c7e3ff80f8c9a2d05a141b34dfb164e7e81f
change-id: 20250527-fix_gmrender-18722b0ea768

Best regards,
-- 
Thomas Bonnefille <thomas.bonnefille@bootlin.com>

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
