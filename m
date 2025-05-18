Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 259FBC3ABD8
	for <buildroot@archiver.kernel.org>; Sun, 18 May 2025 08:57:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E68E460E61;
	Sun, 18 May 2025 08:57:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QZPoTJEWIj3P; Sun, 18 May 2025 08:57:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 236A060E46
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 236A060E46;
	Sun, 18 May 2025 08:57:55 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 7C0B0E4
 for <buildroot@buildroot.org>; Sun, 18 May 2025 08:57:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 78F4B41003
 for <buildroot@buildroot.org>; Sun, 18 May 2025 08:57:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Wb8AtdaZOv4k for <buildroot@buildroot.org>;
 Sun, 18 May 2025 08:57:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.197;
 helo=relay5-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org A74CE400C6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A74CE400C6
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A74CE400C6
 for <buildroot@buildroot.org>; Sun, 18 May 2025 08:57:36 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPA id 030CF432FD;
 Sun, 18 May 2025 08:57:34 +0000 (UTC)
To: Buildroot List <buildroot@buildroot.org>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 18 May 2025 10:57:06 +0200
Message-ID: <20250518085723.23020-14-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250518085723.23020-1-thomas.petazzoni@bootlin.com>
References: <20250518085723.23020-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdefudektdelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefvhhhomhgrshcurfgvthgriiiiohhnihcuoehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnheptedtgedutdfghfetfeelhfdtteevvdeludekkeeiudegjeehgfevudeuudeutefhnecukfhppedvrgdtvdemkeegvdgrmeeghegrtgemleegtddumegufeduvgemvdefheemtgehvgdvmegvugekfeenucevlhhushhtvghrufhiiigvpeefnecurfgrrhgrmhepihhnvghtpedvrgdtvdemkeegvdgrmeeghegrtgemleegtddumegufeduvgemvdefheemtgehvgdvmegvugekfedphhgvlhhopeifihhnughsuhhrfhdrrddpmhgrihhlfhhrohhmpehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepfedprhgtphhtthhopegsuhhilhgurhhoohhtsegsuhhilhgurhhoohhtrdhorhhgpdhrtghpthhtoheprhgrphhhrggvlhdrmhgvlhhothhtvgesmhhinhgurdgsvgdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtl
 hhinhdrtghomh
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1747558655;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=niobLRXx78cA+/kF3bVXVq2iv4wh0yYGllOmA2IKIII=;
 b=HnW2ug0oS4S3KQQ4dLT0h65+jToZr6azhr6HPPXRC3ucTyVtjiuP/uToKZN7Kaox+DZJFL
 cCG59ZQybNjrvHogtyGuk9A6nUKEezqQedl+wEm9Tn18FzcdUpDDmVSnxUD12LKbBle9Jj
 QxuF8h9YpmNCce00eKgYTBPDaehPOukTUlAlDkT7Za2SxM5uSwYO4Nch5hyImAuvzxGaPm
 SizuqBr3UBBPUU9OQNwQH3tZCdePXbJtrjaDzavHoEGeEyOztqdPZyVpfkgIZxRq69qHz6
 aOrma+RWh2wEyCktEu60P2bvUD1oOyVc3bAB2xrGQIhqdcGPSTne/ZZAtoTy0Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=HnW2ug0o
Subject: [Buildroot] [PATCH 13/22] package/sox: annotate ignore CVE entries
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

Commit b6871f9d93055ec94d6fb88779d44b3235b29ce9 ("package/sox:
security bump to latest git commit") forgot to annotate the ignore CVE
entries, so let's do this.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/sox/sox.mk | 42 ++++++++++++++++++++++++++++++++++++++----
 1 file changed, 38 insertions(+), 4 deletions(-)

diff --git a/package/sox/sox.mk b/package/sox/sox.mk
index 42e47a916c..8922f98d5c 100644
--- a/package/sox/sox.mk
+++ b/package/sox/sox.mk
@@ -19,10 +19,44 @@ SOX_AUTORECONF = YES
 SOX_AUTORECONF_OPTS = --include=$(HOST_DIR)/share/autoconf-archive
 SOX_INSTALL_STAGING = YES
 
-SOX_IGNORE_CVES += CVE-2017-11332 CVE-2017-11358 CVE-2017-11359 \
-	CVE-2017-15370 CVE-2017-15371 CVE-2017-15372 CVE-2017-15642 \
-	CVE-2017-18189 CVE-2019-8354 CVE-2019-8355 CVE-2019-8356 \
-	CVE-2019-8357 CVE-2019-13590
+# sox-14.4.2-6-g6e177c45
+SOX_IGNORE_CVES += CVE-2017-11332
+
+# sox-14.4.2-7-ge410d00c
+SOX_IGNORE_CVES += CVE-2017-11358
+
+# sox-14.4.2-8-g7b3f30e1
+SOX_IGNORE_CVES += CVE-2017-11359
+
+# sox-14.4.2-9-ge076a7ad
+SOX_IGNORE_CVES += CVE-2017-15370
+
+# sox-14.4.2-10-g968c689a
+SOX_IGNORE_CVES += CVE-2017-15371
+
+# sox-14.4.2-11-g515b9861
+SOX_IGNORE_CVES += CVE-2017-15372
+
+# sox-14.4.2-12-gf56c0dbc
+SOX_IGNORE_CVES += CVE-2017-15642
+
+# sox-14.4.2-13-g09d7388c
+SOX_IGNORE_CVES += CVE-2017-18189
+
+# sox-14.4.2-38-gf7091126
+SOX_IGNORE_CVES += CVE-2019-8354
+
+# sox-14.4.2-39-gf8587e2d
+SOX_IGNORE_CVES += CVE-2019-8355
+
+# sox-14.4.2-40-gb7883ae1
+SOX_IGNORE_CVES += CVE-2019-8356
+
+# sox-14.4.2-41-g2ce02fea
+SOX_IGNORE_CVES += CVE-2019-8357
+
+# sox-14.4.2-44-g7b6a8892
+SOX_IGNORE_CVES += CVE-2019-13590
 
 SOX_CONF_OPTS = \
 	--with-distro="Buildroot" \
-- 
2.49.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
