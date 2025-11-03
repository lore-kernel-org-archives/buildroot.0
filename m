Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD68BCCF9F8
	for <buildroot@archiver.kernel.org>; Mon,  3 Nov 2025 21:12:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 90C5960A77;
	Mon,  3 Nov 2025 21:12:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WpSngHCMNFoV; Mon,  3 Nov 2025 21:11:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A45B860A6E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A45B860A6E;
	Mon,  3 Nov 2025 21:11:59 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 80B18462
 for <buildroot@buildroot.org>; Mon,  3 Nov 2025 21:11:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 674A140542
 for <buildroot@buildroot.org>; Mon,  3 Nov 2025 21:11:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tUzUMVQsUPjy for <buildroot@buildroot.org>;
 Mon,  3 Nov 2025 21:11:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::329; helo=mail-wm1-x329.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 7B74740502
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7B74740502
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7B74740502
 for <buildroot@buildroot.org>; Mon,  3 Nov 2025 21:11:52 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-475d9de970eso32742295e9.1
 for <buildroot@buildroot.org>; Mon, 03 Nov 2025 13:11:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762204310; x=1762809110;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wmaWjZNgQJKVpa0yqlgTaSjgH0wgNzDctEqxPBgOZE0=;
 b=CYysR30lMc67OZcVDc92ADryxblCvMWRUFDH63+d+IrmDh03saoyLsinC84T1ZOgrC
 RaWLp9QweeAyoZ0caMDanBeuFTkXCstQXSxc9KwFGcZtKtlirEqZ8idU4wnmD32lRQBB
 LDukOmv/twiiF3QaGO9X8S1tmv9xBF1ARTadiPJf+siw/8s3vq7nVQ8YZ5Y48zoa4juy
 e+PTu3M8bS09xP3OVu/LXDO2/qIsu2K56ZwOtmAt0aMGaowi4gncNlTNgxbrxOhlZ2+Q
 yKB+K4cIUSas+yQ6ii3FMur7Gfx3/nE8oDBIk61uVSOBGDBWTdH13TZBtNJR7w3+8z8B
 /+Ng==
X-Gm-Message-State: AOJu0YwGpB8VLBjHP9nheDgloaB3KAEfwT2ZyX9u6/VckEr4gXAkNngR
 uQPzF6/qiHLmSqPyYWmiIUciQjbq5b5D1NMFwPb8BjYwfvIB5R5AxUHOArnxB31lHhZYUvnMJBb
 lmRKb
X-Gm-Gg: ASbGncuRHVLOoGB745T2yWkyHuhD9GX9jpXZu4XM+WBHGvHU7vzQuC2Tve7y+2Mhb19
 ++Q6VgNF66eSnd8OAUdw+CAtkTvvVpbyI0egoD81P7A1p5029zKv0MWOyLi+9ogyfYy8Nf0updT
 DSCjJQPdYjqISZgVYJ9lyqbdNfnAiedvgP8ZIWqFtKaY8Kt2Tuzqe+z44dznO1hJQVr85ilYRhz
 mip1sQUMJgvvvIKUYjzILFQAt6daCGK6UFzEB60L91UqmO9mvVBSV4RK0HES4FtLjCcQK/yC0an
 5BhtT08D+DlaS7VEI033KSv6V4N0QK3S17RDayHF4uu5L97uyQ22AtwIxknatBakUOcwS/HiPdo
 du1y2G1qRs2s1ym7lpM+pGOlrliEupKlFir4RvlIU8r5mWtPN4Fb0XCtzqqb+UiiTTMNjxSusc3
 u7lsaPOV+OI/jpfKUhdIQY9YNb5A==
X-Google-Smtp-Source: AGHT+IFHKClBkC8aTbagrS3MAGvJKDJwhK/P8+hMa7QDFrhjRVzhUIfsL1jwZsXweM52pxNJyMiP8Q==
X-Received: by 2002:a05:600c:3548:b0:471:16b1:b824 with SMTP id
 5b1f17b1804b1-4773088be8bmr161767725e9.28.1762204310201; 
 Mon, 03 Nov 2025 13:11:50 -0800 (PST)
Received: from arch (77.109.92.202.static.edpnet.net. [77.109.92.202])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4773c383b45sm179630745e9.9.2025.11.03.13.11.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Nov 2025 13:11:50 -0800 (PST)
To: buildroot@buildroot.org
Cc: Sen Hastings <sen@hastings.org>, Thomas Perale <thomas.perale@mind.be>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon,  3 Nov 2025 22:11:46 +0100
Message-ID: <20251103211146.57344-7-thomas.perale@mind.be>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251103211146.57344-1-thomas.perale@mind.be>
References: <20251103211146.57344-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1762204310; x=1762809110; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wmaWjZNgQJKVpa0yqlgTaSjgH0wgNzDctEqxPBgOZE0=;
 b=RxFZ9PYz2H4IyWagVuRsEBED+iSNwbXfkrIYs1Cqkl4vHmzkbnSS68FNz3/+YOC7+K
 WlLC1+BPeRDd8hWvXtoSvFbhmJt4Y/tj8bMHnCBuDugc+Schp6MBO+RfolcGsfDLaxPF
 AogXeeXX+yhoOJ6i1iI56XghKdwpAfbPP34p/woHaygO/HW2W/+gIFYqQXEUnaykpfaE
 sJKiZ2ZbJQ8VD+Dn43g/Shd0MZLluCmEY6n6NZQVlWoWIuBR2zrk/6Xe0eUqS9kNEagU
 pSH4aPlWfpmeI7MOYLDv5tm9qETixEGWFq6XoiX6lIU7zSPwE0Nyjuj7H+RrUph8gI7h
 4cYA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=RxFZ9PYz
Subject: [Buildroot] [PATCH 6/6] docs/manual: add information on CycloneDX
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This patch adds information on how to generate a CycloneDX SBOM in
Buildroot. It also mentions how to track CVEs with that given SBOM.

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 docs/manual/common-usage.adoc | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/docs/manual/common-usage.adoc b/docs/manual/common-usage.adoc
index 43caa3a9bc..c561944be5 100644
--- a/docs/manual/common-usage.adoc
+++ b/docs/manual/common-usage.adoc
@@ -180,6 +180,33 @@ a newer upstream version for those packages.
 make pkg-stats
 ----
 
+=== Generating CycloneDX SBOM
+
+Based on the output of +show-info+ Buildroot can generate SBOM in the CycloneDX
+format specification. While it doesn't offer any additional informations,
+CycloneDX is a format specification that can be consumed by other projects.
+
+----
+make show-info | utils/generate-cyclonedx
+----
+
+For more information check the help of the +generate-cyclonedx+ script, the
+script call can be tailored to your project.
+
+----
+utils/generate-cyclonedx --help
+----
+
+Similarly to +pkg-stats+, CycloneDX SBOM's can be enriched with vulnerability
+analysis from the NVD database.
+
+----
+make show | utils/generate-cyclonedx > sbom.cdx.json
+cat sbom.cdx.json | support/scripts/cve-check --nvd-path dl/buildroot-nvd/
+----
+
+For more information about CycloneDX see https://cyclonedx.org/[].
+
 === Graphing the dependencies between packages
 
 [[graph-depends]]
-- 
2.51.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
