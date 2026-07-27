Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1DF4C531D0
	for <buildroot@archiver.kernel.org>; Mon, 27 Jul 2026 11:49:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 32F28606DA;
	Mon, 27 Jul 2026 11:49:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CicCw3ZEKH2q; Mon, 27 Jul 2026 11:49:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9D84760639
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1785152979;
	bh=Us5mBfMmdKaRicxoU4Iin0AOTdjHLC45kdl1EqOCiac=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:Cc:From;
	b=HtQU275Gkw7jvWcMm8Eix5wWYXpbFPcfKRMmnSjOQBxQFJmzid46LjT6N/Yh70H25
	 pJTSONJaRLvR7xl9iD/AD9eUHoAqLUasb3ERSr2FUAHGaIaxYbj6mQG4hbqcYPLdAO
	 a9whoYZuydeqOAke0nJYeoAwFjZZ0CrFKisrRYDP+qgdIp5yszGT+7Sr8gYxP43vQy
	 OEp+hdcVyLpt3yZ7zcrlXX/h/fpFg0v9mJKkzPzotnVGN8IMXhwX5F1juNA1b+5uTg
	 NN68+JK5kJCaHbpbUUtHeeO6CbVFgdU2Sc1LpkMkN6rpOR7+vrNQ5Bfz35w0ySD+1N
	 4jk9/rYbms83A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9D84760639;
	Mon, 27 Jul 2026 11:49:39 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 66AA826C
 for <buildroot@buildroot.org>; Mon, 27 Jul 2026 11:49:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4C6A580B6A
 for <buildroot@buildroot.org>; Mon, 27 Jul 2026 11:49:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AGzmH1V_E7s2 for <buildroot@buildroot.org>;
 Mon, 27 Jul 2026 11:49:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32e; helo=mail-wm1-x32e.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org A5B0180BA9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A5B0180BA9
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A5B0180BA9
 for <buildroot@buildroot.org>; Mon, 27 Jul 2026 11:49:34 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-49550ec592cso22745725e9.0
 for <buildroot@buildroot.org>; Mon, 27 Jul 2026 04:49:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1785152973; x=1785757773;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=3egU80PVSbprHO/HtFbFrBBnANCrs+VGs3a0doQwcts=;
 b=hfhjSwSN872L8+QAofxVF7Nupud5A3z9x+zGEUKivwJQMC0B/KXqUf38p64YUUG+qN
 KYbpZCuQKMF9l0MNJhEhlEPxNlZN19Ot+L2yv23c9Gxlc+8n/YiWPDZIB9GdD+X7MGop
 ZWFLWDtd9SAmc+MPwPys4BA9udMmNZITki9fe3MZ7oh4pRBVqZhrdvNb9kS5S5dgC8yO
 K024Kx/WtEzhNnRBmrdGggVfJ57S52B0qgoFtd2bd19kG4ftrzXDid+Vp89J5Xagb8lz
 fBYDM6V4bV0PAm0lRPMKAeg/VH8X7lcN/4JZf0O9a4ypO3T1LiIs+MASJ8GsyW+mmow8
 6abA==
X-Gm-Message-State: AOJu0YzJ3FA7EPIlIB+/GurSx/T07FApz9aS1GJjoZjeSM3ucreE2hTD
 WD0YfB6vg5G4HJPhPza9e01d83uR09WDuuhKBO3RC+rOTL5sPtATYuIF5beCBaSpICR6nnuVCdq
 Cyfk/
X-Gm-Gg: AR+sD12606RurpYGKdaN39SBKuzF+vg4GoYVZ57htL3drmoIp43b3+uvOemAcUTmiwz
 Yxnb08ceoUPYhqiUd9jak+ehDLsy0zSk6fmAM00cScr9QZbiqb0xbVMK3FzOsg5FYxazLBCBwa0
 VzlKS4NBiHMhHGLRp9f2dxI/JFE4xH68/Hw9dOY9PTAhCMSyZEW7ymQ7+UK1kKFUmnl48nIKM9X
 D+yCms8gJx/pLUqBiMuXsSvvBJkyCAqbIMPfl+WB4dOWQ93SQKUrr0xrbQB17/oSU4NoPys8fuk
 gQWr+V4+1QClq4Lyk+KTG4afkWgoKNIlc5CKNj2zqBgNIsdgrZSeZzu+bRyp8Nhn96ObK/Yk888
 o6YN+krUbPpryYM7vKmVx19IEp5MIjNxE/wYzbx4Ir8Qq0O2CX9RoaUqinT7a1eylW38YVRGl+t
 dDmHVIZRTsZ00GoJNWL+qoXxqXz8Ufpz+pzX8EynUe+Etj91ryln3bPDU5+jmE
X-Received: by 2002:a05:600c:3047:b0:495:4393:ff48 with SMTP id
 5b1f17b1804b1-496ba8a1391mr45631765e9.11.1785152972737; 
 Mon, 27 Jul 2026 04:49:32 -0700 (PDT)
Received: from mindpad (ip-94-140-185-241.reverse.destiny.be. [94.140.185.241])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47f85c6287csm49082140f8f.25.2026.07.27.04.49.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jul 2026 04:49:32 -0700 (PDT)
To: buildroot@buildroot.org
Date: Mon, 27 Jul 2026 13:49:31 +0200
Message-ID: <20260727114931.368449-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1785152973; x=1785757773; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=3egU80PVSbprHO/HtFbFrBBnANCrs+VGs3a0doQwcts=;
 b=Z0BvprDe/8SivnMANVypzK+WvwpHJik77JTO29tn2V2/pfbZxemwiUBKDqLgSUGvMx
 j9JVVIsDSFKTrM5qd0nLYQ4Mt/TR2aUxpGvwHpjpSKAbD+c7v1Qrr2VXx5vBIbmgO24Y
 cTz0JgDS1c83n9N6oCDpA7fUdSS6upREyphzXoTwPEX5tJjMxcEQ3ARIcto7PGg9rzpk
 EHV9lfNibr4WTLi8KE903QLDrmd14XXoIxTL6Uipzu9G1RF92RUsF8Zue22fLqoSR0qk
 dm2QbYGLqY+T5MXc80UXdKs2G7VdmG3SKuekxZ1+DdnCz733+96PTgp1siFIB+ImTHb1
 2wsA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=Z0BvprDe
Subject: [Buildroot] [PATCH 1/1] docs/manual: update 'releases' to reflect
 LTS changes
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Cc: Titouan Christophe <titouan.christophe@mind.be>,
 Fiona Klute <fiona.klute@gmx.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

With the release of 2025.02, LTS releases are now made every two years
with a 3-year support.

This reflect the table showed at https://lts.buildroot.org/#releases.

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 docs/manual/release-engineering.adoc | 22 ++++++++++++----------
 1 file changed, 12 insertions(+), 10 deletions(-)

diff --git a/docs/manual/release-engineering.adoc b/docs/manual/release-engineering.adoc
index 0cf38183f9..e202e70868 100644
--- a/docs/manual/release-engineering.adoc
+++ b/docs/manual/release-engineering.adoc
@@ -5,19 +5,21 @@
 == Release Engineering
 === Releases
 
-The Buildroot project makes quarterly releases with monthly bugfix
-releases.  The first release of each year is a long term support
-release, LTS.
+The Buildroot project makes quarterly releases with monthly bugfix releases.
+Starting with 2025.02, long-term stable (LTS) releases are made every two years
+and supported for three years.
 
- - Quarterly releases: 2020.02, 2020.05, 2020.08, and 2020.11
- - Bugfix releases: 2020.02.1, 2020.02.2, ...
- - LTS releases: 2020.02, 2021.02, ...
+ - LTS releases: 2025.02, 2027.02, 2029.02 ...
+ - Stable releases: 2025.05, 2025.08, 2025.11 and 2026.02, ...
+ - Bugfix releases: 2025.02.1, 2025.02.2, ...
 
-Releases are supported until the first bugfix release of the next
-release, e.g., 2020.05.x is EOL when 2020.08.1 is released.
+Stable releases are supported until the next release, e.g., 2025.05.x is EOL
+when 2025.08 is released.
 
-LTS releases are supported until the first bugfix release of the next
-LTS, e.g., 2020.02.x is supported until 2021.02.1 is released.
+LTS releases are supported for three years, with a one-year overlap with the
+next LTS release, e.g., 2025.02.x is EOL when 2028.02 is released.
+
+See the table at https://lts.buildroot.org/#releases[lts.buildroot.org].
 
 === Development
 
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
