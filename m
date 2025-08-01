Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E23AFC87FCB
	for <buildroot@archiver.kernel.org>; Fri,  1 Aug 2025 10:18:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 738BE847EF;
	Fri,  1 Aug 2025 10:18:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wswtExGtekoy; Fri,  1 Aug 2025 10:18:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8556E84793
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8556E84793;
	Fri,  1 Aug 2025 10:18:19 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 8C894C8
 for <buildroot@buildroot.org>; Fri,  1 Aug 2025 10:18:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7B07A84793
 for <buildroot@buildroot.org>; Fri,  1 Aug 2025 10:18:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id I2h-m_ixrnHg for <buildroot@buildroot.org>;
 Fri,  1 Aug 2025 10:18:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.178.249;
 helo=mslow3.mail.gandi.net; envelope-from=thomas.bonnefille@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 532DF84790
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 532DF84790
Received: from mslow3.mail.gandi.net (mslow3.mail.gandi.net [217.70.178.249])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 532DF84790
 for <buildroot@buildroot.org>; Fri,  1 Aug 2025 10:18:16 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by mslow3.mail.gandi.net (Postfix) with ESMTP id 1A65B58321A
 for <buildroot@buildroot.org>; Fri,  1 Aug 2025 09:59:26 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4C0FE43291;
 Fri,  1 Aug 2025 09:59:16 +0000 (UTC)
Date: Fri, 01 Aug 2025 11:59:14 +0200
MIME-Version: 1.0
Message-Id: <20250801-fix_libspdm-v1-1-48138baca30b@bootlin.com>
X-B4-Tracking: v=1; b=H4sIAPGPjGgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDCwND3bTMiviczKTigpRc3bSUNMukJAtDA2MTYyWgjoKiVKA02LTo2Np
 aAMwU2ipdAAAA
X-Change-ID: 20250801-fix_libspdm-fdf9bb810343
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 =?utf-8?q?Miqu=C3=A8l_Raynal?= <miquel.raynal@bootlin.com>, 
 Alistair Francis <alistair@alistair23.me>, 
 Thomas Bonnefille <thomas.bonnefille@bootlin.com>
X-Mailer: b4 0.14.2
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddutdefgedtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhfffugggtgffkvfevofesthejredtredtjeenucfhrhhomhepvfhhohhmrghsuceuohhnnhgvfhhilhhlvgcuoehthhhomhgrshdrsghonhhnvghfihhllhgvsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeduudffjeejfffhleefueeiueetjeeikeevhedtueejgeehjeeftedtfedtleegjeenucffohhmrghinhepsghuihhlughrohhothdrohhrghenucfkphepvdgrtddvmeekgeegtdemhedvtdejmeekudgrvgemvdduudefmegvheejfhemkegvfhelmeguvdgsjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtvdemkeeggedtmeehvddtjeemkedurggvmedvuddufeemvgehjehfmeekvghfleemugdvsgejpdhhvghloheplgdujedvrddujedrtddrudgnpdhmrghilhhfrhhomhepthhhohhmrghsrdgsohhnnhgvfhhilhhlvgessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohephedprhgtphhtthhopehthhhomhgrshdrsghonhhnvghfihhllhgvsegsohhothhlihhnrdgtohhmpdhrtghpthhtohepmhhiqhhuvghlrdhrrgihnhgrlhessghoohhtl
 hhinhdrtghomhdprhgtphhtthhopegrlhhishhtrghirhesrghlihhsthgrihhrvdefrdhmvgdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdprhgtphhtthhopegsuhhilhgurhhoohhtsegsuhhilhgurhhoohhtrdhorhhg
X-GND-Sasl: thomas.bonnefille@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1754042356;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=9pr0Zm2mlLv8/RMGH5wekb5gzoqVhz9UNhQRoZCA+to=;
 b=ikZrIqj2ee6Zmfn5l/930YQeXct55CBGvuADW9SqJBlrxqgNmWVx0OunH15Si2LU7Iqb87
 KAPfmX4wEpW2OPsuMQQ1spMgJ4yT9GAuLiZ0lBie/2gE49JsWarY3cxFii1yR65X3wrlMc
 9IeY/WiBTpSm2ZGBLOCF4fVLC8/VXHsLVKwTVL5hLi1jKcGtK5xvL75UnGXfdYCnGhjVpS
 PmET8vCHaxCYhvpH7gG4fhE2CjEMoHkzFAkEFsVaXY39vdX43ZsRmaBygDiiqZndnQj91D
 qg5wvNE/ioi5ktN2c8rk57v8I21vbeiSk43Hc8HshzjeaL6iFpw/mclDyD34wg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=ikZrIqj2
Subject: [Buildroot] [PATCH] package/libspdm: bump version to 3.8.0
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

Following the upgrade of libopenssl to version 3.5.0 [1], the build
process for libspdm encountered issues due to the new openssl API.
It requires some modifications in the asn1.h file of libspdm.
This build error was addressed by a specific commit [2] in libspdm.

As Buildroot 2025.02 isn't impacted, this commit bumps libspdm to the
latest libspdm version to fix the build error.

[1]: 9868ca6e
[2]: 88797f83:Backport API introduced in openssl 3.5.0

Fixes : https://autobuild.buildroot.org/results/87b/87b8805975ef132a58c40e622e2e023199f6ee2a/build-end.log

Signed-off-by: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
---
 package/libspdm/libspdm.hash | 2 +-
 package/libspdm/libspdm.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libspdm/libspdm.hash b/package/libspdm/libspdm.hash
index e29c5994a32e0a949b807efbb066915348a2f728..cab1c5259e8cb40044dc108ec50d217f5d6a1691 100644
--- a/package/libspdm/libspdm.hash
+++ b/package/libspdm/libspdm.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  7b8a556be64120bab9c321964e67b90f5e6adb59abf3992c5c7937f37a4e7c8f  libspdm-3.5.0.tar.gz
+sha256  e7aefb9bc546bbd3ff10d707a6f05213cfb2e679354438ea0d1b5c483b5daa85  libspdm-3.8.0.tar.gz
 sha256  c6ffa7e6889e63893078cb21b89594070183f7e2cf5b4ea01a4fb23eac59ed32  LICENSE.md
diff --git a/package/libspdm/libspdm.mk b/package/libspdm/libspdm.mk
index 9d8da2a3c6f4fbf374a3ca7186b1b955f204eb97..4d294298117f7673518016cde39248a1aaef4414 100644
--- a/package/libspdm/libspdm.mk
+++ b/package/libspdm/libspdm.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBSPDM_VERSION = 3.5.0
+LIBSPDM_VERSION = 3.8.0
 LIBSPDM_SITE = $(call github,DMTF,libspdm,$(LIBSPDM_VERSION))
 LIBSPDM_LICENSE = BSD-3-Clause
 LIBSPDM_LICENSE_FILES = LICENSE.md

---
base-commit: f5101638b9f917dc4c569828ff3fee0c486ba8f8
change-id: 20250801-fix_libspdm-fdf9bb810343

Best regards,
-- 
Thomas Bonnefille <thomas.bonnefille@bootlin.com>

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
