Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AE76CF6482
	for <buildroot@archiver.kernel.org>; Wed, 19 Nov 2025 21:34:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 215B5806AD;
	Wed, 19 Nov 2025 21:34:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vNzlNYAp5-rG; Wed, 19 Nov 2025 21:34:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2C72E8069C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2C72E8069C;
	Wed, 19 Nov 2025 21:34:33 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 136D437F
 for <buildroot@buildroot.org>; Wed, 19 Nov 2025 21:34:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 05A18611B5
 for <buildroot@buildroot.org>; Wed, 19 Nov 2025 21:34:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DzGq_87ejn9S for <buildroot@buildroot.org>;
 Wed, 19 Nov 2025 21:34:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::335; helo=mail-wm1-x335.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org D056F61108
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D056F61108
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D056F61108
 for <buildroot@buildroot.org>; Wed, 19 Nov 2025 21:34:26 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-47118259fd8so1798585e9.3
 for <buildroot@buildroot.org>; Wed, 19 Nov 2025 13:34:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763588064; x=1764192864;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=wmaWjZNgQJKVpa0yqlgTaSjgH0wgNzDctEqxPBgOZE0=;
 b=K972zRK/qbw5tYaR37hUEg6PQBXVIHsepBmUuo9qX4AQb04V6Jij0iYQLQzuIVWrtp
 aKcsir0fgTeEwSFLkDxhydSxhw+7wzMTFxWLjuyFSHZ0+KYkVaT6k3rzNtG6KQj0Ot+g
 +oglplsaJX5ju7IMPnQGndF/+KDsvP9cXs8SdN6a95ZBNFQpZIx2icL+k/WQxwJ8oOqG
 qfwBEo4PrTzGf75wJ/O90XsMCHK2tw1R7jB7+KvZEEv/Se34Oj/OuIplNMc8l7tpFUWG
 RDe8fxU6C59amjFhHLtZO9RSkN0njm6pvRQtPWS828ZlfwdWr1N9aTcIZigid2qogINl
 gEEg==
X-Gm-Message-State: AOJu0Yxd/uv3KQ3SuMfQQWfPdjako9xM4Bvn+OD4PctEEJboaiVTuI/a
 Jm9uYcq6KQGmKqJNYYkhsWow1tFKIEObivky7NFoo4uEYH5WBh7O3/x2WvpfLFMpiNvnjBf9PVo
 XncD9Ob0=
X-Gm-Gg: ASbGncu919oERhmtTNAZZg75Xe+Qk6KvfiNjPw2HuZgAszOBG9C+6wePxh1Nj+l+wfW
 5xfTP0UfoMSiVOsdv3etW3l4PADRENI1oNBKxZl9VtrFiu/Ah6jKA9XMHBYVJU1CKXH89Pxuclr
 0CrBq7QmQOwqbcr47oGX6gelydOaZ/xK9dGq1fFiD71xHr5/XC11x+Zj8SLrUnF/fY5McWz8unm
 FowF4cT2YAC3UARyLMyO3U4pBDvhMCVXXTJlY8oT9XOiE+qUSyIapFiwmKcq/lvvJIQt4GRBQ7n
 KHCw7xnVme7V4h7dWCFO6blz0FP67jB/3s2iTJDD1ilvHxYS2TuojgbCGHDIJ9P+onT+XY/bdk3
 61i5VK/taeqgIBa2Mtyn3zEgKGX8QNOfe67k5eUpbiiPkvV3YbE2ML44gBZOQW6f0Tr83Phiplu
 TgHkz+iFok/COq2yY4c+/95NjHNzLaXq5qpRiJ
X-Google-Smtp-Source: AGHT+IGPaSMuvN5R1LLJUo42kzBQ4vMg6ncoNbFcjD/CdoQa0QI6vZTXyrYtGSy8DXmjOtlCWCvUeQ==
X-Received: by 2002:a05:600c:190a:b0:477:9a28:b0a4 with SMTP id
 5b1f17b1804b1-477b8355eb2mr8708955e9.0.1763588064604; 
 Wed, 19 Nov 2025 13:34:24 -0800 (PST)
Received: from arch (77.109.92.201.static.edpnet.net. [77.109.92.201])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-477b106a9b0sm71362905e9.11.2025.11.19.13.34.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Nov 2025 13:34:24 -0800 (PST)
To: buildroot@buildroot.org
Cc: Sen Hastings <sen@hastings.org>,
	Thomas Perale <thomas.perale@mind.be>
Date: Wed, 19 Nov 2025 22:34:20 +0100
Message-ID: <20251119213420.7480-5-thomas.perale@mind.be>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251119213420.7480-1-thomas.perale@mind.be>
References: <20251119213420.7480-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1763588064; x=1764192864; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wmaWjZNgQJKVpa0yqlgTaSjgH0wgNzDctEqxPBgOZE0=;
 b=LrXnKkGIebIB30/sRynxBEOleGkujY6JI52GAfvjk8faUljdRXZoUWnpCBWqlwe6P3
 heerWywb8gBYoC/0kHzronf0U+TJ3dqxGPZ9TsTE0S0CF4JbPsYJoHS9mSd9awC/35+6
 S3Ah5ufbUssf/FWbLqbYsL3ls9NjH/AV5Wgzzg5Xy+DFMC48/EFCz+m643oPZJZKgxPQ
 9ZAnOnvRJ9V8ZHU/aVAVp9hKXU+YmAIXAalV9I2jBR0J6E8shNGgQhcgcH0Ho8ErkzNj
 LnzfiYCGTVYATAl8OBO+dct3PUVn9LWNPe1NAqQ0hm3d3muxX9D0fuMLRFbGSDLGUhqR
 jubQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=LrXnKkGI
Subject: [Buildroot] [PATCH v2 4/4] docs/manual: add information on CycloneDX
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
