Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DECBC3ABD8
	for <buildroot@archiver.kernel.org>; Fri, 16 May 2025 14:37:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 31F2540882;
	Fri, 16 May 2025 14:37:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id F5jdzdPmV9YD; Fri, 16 May 2025 14:37:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6D7A740897
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6D7A740897;
	Fri, 16 May 2025 14:37:46 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 769E7185
 for <buildroot@buildroot.org>; Fri, 16 May 2025 14:37:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 682CD608FA
 for <buildroot@buildroot.org>; Fri, 16 May 2025 14:37:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7M7UUom8N7Dl for <buildroot@buildroot.org>;
 Fri, 16 May 2025 14:37:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::221;
 helo=relay1-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 993F9608B0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 993F9608B0
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 993F9608B0
 for <buildroot@buildroot.org>; Fri, 16 May 2025 14:37:43 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPA id 6C6FC43A5C;
 Fri, 16 May 2025 14:37:41 +0000 (UTC)
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Julien Olivain <ju.o@free.fr>
Date: Fri, 16 May 2025 16:37:39 +0200
Message-ID: <20250516143740.239419-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdefudeftdduucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecunecujfgurhephffvvefufffkofgggfestdekredtredttdenucfhrhhomhepvfhhohhmrghsucfrvghtrgiiiihonhhiuceothhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpedvfeeivdfhveeitefgtefhgfeihfejveefffdthfdtvdffueeileduheefgeeugfenucfkphepvdgrtddvmeekgedvrgemgeehrggtmeelgedtudemugefudgvmedvfeehmegthegvvdemvggukeefnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddvmeekgedvrgemgeehrggtmeelgedtudemugefudgvmedvfeehmegthegvvdemvggukeefpdhhvghlohepfihinhgushhurhhfrddrpdhmrghilhhfrhhomhepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeefpdhrtghpthhtohepsghuihhlughrohhothessghuihhlughrohhothdrohhrghdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdprhgtphhtthhopehjuhdrohesfhhrvggvrdhfrh
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1747406261;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=jffGeMv2F7sD1GiQ/DvP3SEosRnEVC+LX1lJ030UMfk=;
 b=CWb8dY3HrClozJNswuN+DUc1hiliz3o+cQUxDYdi/DkqZIW7YlvVEdL+X2PxzamVA/L3kz
 GUr5cjpEzXgbmtLvmOsefKo2u+ct9aJgDLapkF8g90v+CZpLl4UEaluaVayf6Ri1w70EkO
 iXzYY+ZSr+50FMPiTuqvnzs6wVTP3vsMVVwoVjmAyAK8bAx81fTjnmg6QyaQtFmV4v7QY+
 QdIsGBWpT/ATgGNjBk0KLIec6HHK1Lysf+g5MFV4GKTeNylURHXNvINn9WesUujCuvNHsb
 FG5/stpvI4RrZ5YoKjRhJcqG+sifBgzIcZ3wdEDI0x2c6urjWPcV1bxShLVaTw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=CWb8dY3H
Subject: [Buildroot] [PATCH] docs/migrating.adoc: document the tarball
 suffix update for Cargo-fetch packages
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

It seems relevant to mention this change in the documentation, which
was introduced in commit
b80278613e4aa23ab4f016a5ec65cfcd5201e4ec ("package/pkg-download:
switch from cargo2 to cargo3").

Reported-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 docs/manual/migrating.adoc | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/docs/manual/migrating.adoc b/docs/manual/migrating.adoc
index 1b55bc6173..8c81efa9a9 100644
--- a/docs/manual/migrating.adoc
+++ b/docs/manual/migrating.adoc
@@ -209,3 +209,8 @@ or with a startup script.
 Note that systems using systemd are not impacted: systemd always ensures
 that `/run` is writable. Systems further using systemd-resolved already
 had a `/etc/resolv.conf` that pointed into `/run` anyway.
+
+Due to the update of Rust to a version greater than 1.84.0 making the
+Cargo.lock file mandatory, tarballs generated by Cargo-fetched
+packages have changed. Therefore the suffix of such tarballs has been
+changed from +-cargo2+ to +-cargo3+.
-- 
2.49.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
