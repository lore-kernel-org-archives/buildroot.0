Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 177A3C83F1B
	for <buildroot@archiver.kernel.org>; Wed, 16 Jul 2025 09:34:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C190583DC5;
	Wed, 16 Jul 2025 09:34:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HfcEZgH0S0sS; Wed, 16 Jul 2025 09:34:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E33F383C45
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E33F383C45;
	Wed, 16 Jul 2025 09:34:19 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 66BC61514
 for <buildroot@buildroot.org>; Wed, 16 Jul 2025 09:34:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4CE164092F
 for <buildroot@buildroot.org>; Wed, 16 Jul 2025 09:34:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Bb9486mF9f-L for <buildroot@buildroot.org>;
 Wed, 16 Jul 2025 09:34:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::430; helo=mail-wr1-x430.google.com;
 envelope-from=fabien.lehoussel@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 7425541418
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7425541418
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7425541418
 for <buildroot@buildroot.org>; Wed, 16 Jul 2025 09:34:17 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-3a4ef2c2ef3so4792477f8f.2
 for <buildroot@buildroot.org>; Wed, 16 Jul 2025 02:34:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752658455; x=1753263255;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lnxTH9zrFWPCVZj7uqVXF2ig5gfDanm79bbngeXtTLY=;
 b=pMwwlJiqgq2srr4PNE0cWAv8bT99fI3DJ3u3QoRwlwN3BoJttSL0TdJt43Ldp5LgMK
 V4HDetogtZVjLyuZgxsl6JYLxlGjMfDk7yZHgYwZfIFgrdX2aAwEL1zShPQpi84k4frx
 8bvDXXICTjuch2eUTT8WIpgf8/us2Kwy6yVoS1CYlHHlGZcwIjOwhMRvN73obU7PZ9Xw
 oXRVQPWGnwXPA0BXw+yLVkmw99w7hXLf5UefvO/ouLQbsccwE8u3bp3ojqv4s22m+Qz6
 e+quse8H7M2JlnWn2mxPvuFIegBcCsuaUN2vVxgArUhxFAh2+h+5WzbdN25iSVfEB2SN
 Qevw==
X-Gm-Message-State: AOJu0YynsnxPKN+JcYGrHp3geaCacZd6s2hkVH57ucXNpAa8mgXs9/dE
 1B+l6A2D2tuLbxmLt4KvtuxSLOS099/7GLvRSP8akBz9bLTiDSEAygaVR3WE7KATom2MGs6Wdnp
 0uAKI
X-Gm-Gg: ASbGnctdH90EAyNUIzNsAYUSCMKh60+71EXj1hnxcFpzRNzqqeFN17G9Rd1CppTiiV2
 xNj1NNesfwEyO0SwvxJLjrlohB/SChiRLUMBBlSZ4R/ft8hwXOgjiBjy1eieVosXpWL5yrrhooE
 L/KjRx5jNKB/FsBhJjFR3AH93Qu6ro4THelz9Veo2c/CYpXMm821zV0rlsq8WhL1tgryJBo7ypJ
 8OfcG2S2p5cGOwm2xFJ+xxZ3OyKLCpRa0V8JSiLumot72EweXHyRgVtk8GZ6pUxGhfG/gs6ULAy
 U7hFQ1DqlvD27aEhJzclsm2Mu3dhqEuHRgyTUmAXzujY4dsl4/czXqFxhzn2MgRsiBkcpVPnJoz
 8cpjD8mKqNUPwhr0gAupEK6kcpzwuxtdhlmUvOlbFqDwHL7VeE1HzraL7Y75VYoVciSHgx1iWUh
 UU0mI9AW7EbZZ7405TBosVh6Mj/UnC3Ble
X-Google-Smtp-Source: AGHT+IGp6yc0giWArNjftTynDK4g7UXDfsHFZKOs1rBPgmBYl1WsFVITQSA96j4HkkP0Tj+FMIHH6A==
X-Received: by 2002:a5d:5d88:0:b0:3b5:f8b3:d4fc with SMTP id
 ffacd0b85a97d-3b60e51811dmr1350690f8f.53.1752658455047; 
 Wed, 16 Jul 2025 02:34:15 -0700 (PDT)
Received: from NV4XMB-ME-MZ.idf.intranet
 (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4562e802984sm15415205e9.12.2025.07.16.02.34.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Jul 2025 02:34:14 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Thomas Perale <thomas.perale@mind.be>,
 Fabien Lehoussel <fabien.lehoussel@smile.fr>
Date: Wed, 16 Jul 2025 11:33:48 +0200
Message-ID: <20250716093401.1213358-5-fabien.lehoussel@smile.fr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250716093401.1213358-1-fabien.lehoussel@smile.fr>
References: <20250716093401.1213358-1-fabien.lehoussel@smile.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1752658455; x=1753263255; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lnxTH9zrFWPCVZj7uqVXF2ig5gfDanm79bbngeXtTLY=;
 b=UeDLJaJORh1A4T7ffYoyXA3cEP6SUBVqRKFqWCCREI2KUENSfIIUvCu9q42rka9Pzi
 g56XyEuijb4y+swWK0sVi8kknICi6xvj7sBXSabhNeMru+Q5TFmfALwd4gaLUsP9VsCV
 997yeZ84TMl2EmXGqwiDMNVOGQusJ/Esw7+cA=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=smile.fr header.i=@smile.fr
 header.a=rsa-sha256 header.s=google header.b=UeDLJaJO
Subject: [Buildroot] [PATCH v2 5/5] utils/generate-cyclonedx: add source
 field to CVE entries
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
From: Fabien Lehoussel via buildroot <buildroot@buildroot.org>
Reply-To: Fabien Lehoussel <fabien.lehoussel@smile.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Mandatory for DependencyTrack compatibility

Signed-off-by: Fabien Lehoussel <fabien.lehoussel@smile.fr>
---
 utils/generate-cyclonedx | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/utils/generate-cyclonedx b/utils/generate-cyclonedx
index d28750735f..5effa0282c 100755
--- a/utils/generate-cyclonedx
+++ b/utils/generate-cyclonedx
@@ -228,6 +228,10 @@ def cyclonedx_vulnerabilities(show_info_dict):
 
     return [{
         "id": cve,
+        "source": {
+            "name": "NVD",
+            "url": "https://nvd.nist.gov/vuln/detail/" + cve
+        },
         "analysis": {
             "state": "in_triage",
             "detail": f"The CVE '{cve}' has been marked as ignored by Buildroot"
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
