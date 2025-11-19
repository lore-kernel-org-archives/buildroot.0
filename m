Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78E73CF58FE
	for <buildroot@archiver.kernel.org>; Wed, 19 Nov 2025 21:34:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4F60080641;
	Wed, 19 Nov 2025 21:34:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9B-Myte1TRUT; Wed, 19 Nov 2025 21:34:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6A19E8063C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6A19E8063C;
	Wed, 19 Nov 2025 21:34:27 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 16DFA2A9
 for <buildroot@buildroot.org>; Wed, 19 Nov 2025 21:34:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1486B412B5
 for <buildroot@buildroot.org>; Wed, 19 Nov 2025 21:34:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BOqlG8mSfaIO for <buildroot@buildroot.org>;
 Wed, 19 Nov 2025 21:34:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::336; helo=mail-wm1-x336.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org A7F4D411A5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A7F4D411A5
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A7F4D411A5
 for <buildroot@buildroot.org>; Wed, 19 Nov 2025 21:34:23 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-4779a637712so1449215e9.1
 for <buildroot@buildroot.org>; Wed, 19 Nov 2025 13:34:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763588062; x=1764192862;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uaTjw3Rk7EevRjCXZnqLG05Vji9HyKY1wcqGCpOptls=;
 b=XAtwlKXyBl2omHcsD+R0vgb0Tqrd6nwLwaTiiNFBsx4+d4WPcN9nUfQHU92oBxH8Gv
 74wLGx9iuEX8y1wkENWj9mY/OQDVs+OpxJdiMTFnsXNiWtL+K/h9YahSGHRZujOs1x/g
 I4Gx5lnfZFBd0FSDNPSLtSn+DBKshaaGbBeIVjrC1Cf8xFLiji2En60GER6JM0tT836R
 G2WdLFb5asKcKY5z2L4qZswp7Fs+HaALsKpHzszs/gkzg2T5CRICGNXjEVb/ctDq3Q8D
 l1Iloo/Pc3teJx5Wq+8xoKnLLpi5C53Wh2lRCKa8SgmvnOqItKFgc4K5ETN1VsnBmRND
 zwIA==
X-Gm-Message-State: AOJu0YyrOjGMasFJsx1IW8wl068+rzsUa76Dqb+H7irpbx/N0JgCxqfY
 p+eS3VsdhNOjvEjgvybpR08mdaot3wDzQs4NpWOx+F5Fe/UVEsM1uncEBIbqjR+SP21yscAu1LG
 dwgZ6lJM=
X-Gm-Gg: ASbGncutcnMfPv8seCykSjxH4QDl0cj31XiPEDuvz9D8JcGifRhB0VA+UffMxkTiCxh
 y+iNxDF8UUaaJ/T+OcIR1/S494SUvVWP4IS1sKRfPR7ay3jcz/weSEzi2wuXZ2CLJjnIwPGbe+O
 zcjZ4ZutLfYQ9dpKpa0Ixm4Zbk9+IYUZKVlWN7gvaC0DFsrl4ftWiO2C60pj5qw654Tjby5dl2r
 OEyyMU4AvfC/UhIGRktZ+DCXu1qft0tF4LCFlmazJM5Lfa9pWD6ERBovHfxxCwBCOeH/zwdkhxl
 R+rnVQLXnFpdHjqoPPP2DGY1MRcBZrhVZqcbsEAe6Xgb0fA7osej+miJjHtiUGbWS/uaKlrrtCa
 t3SUxkVODOX6Cs/2nqjX30bk3sqcrjY5rNJcSUDJFxEqMThyJ3E0gP2wdsFO//L0KIFwbU5HR1G
 63DxmkUlLvQDnabjM47STOYIQ/W4ZtRyLP2hq+
X-Google-Smtp-Source: AGHT+IHpdqknxnLRi5UpyzXX8fH2iCmkrauJkXUMXDNE+3M7JU9cFlI7NgSjTJGAXYafWqCmR1kEVA==
X-Received: by 2002:a7b:c844:0:b0:477:55c9:c3ea with SMTP id
 5b1f17b1804b1-477b9e53668mr518595e9.35.1763588061896; 
 Wed, 19 Nov 2025 13:34:21 -0800 (PST)
Received: from arch (77.109.92.201.static.edpnet.net. [77.109.92.201])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-477b106a9b0sm71362905e9.11.2025.11.19.13.34.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Nov 2025 13:34:21 -0800 (PST)
To: buildroot@buildroot.org
Cc: Sen Hastings <sen@hastings.org>,
	Thomas Perale <thomas.perale@mind.be>
Date: Wed, 19 Nov 2025 22:34:16 +0100
Message-ID: <20251119213420.7480-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1763588062; x=1764192862; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=uaTjw3Rk7EevRjCXZnqLG05Vji9HyKY1wcqGCpOptls=;
 b=C3bYb5hggPEjjDT8ts9muj891MRlvU+wYlNG3TyvyxPgJXfY3NwYoarBHcI6cSk6ht
 9PGbbVN4WAAknfjRHjOfwLwK5V9oLuX/NV08za2xbOYVAmxQ+ODftjd/rj7zlM/NW2Xe
 XpDRBsKmsEt1p9nTWcfsLGyL9UHHjgeHpY9o9eliPhz2uojwL+0F0OHINWIhovuYBMsk
 42HC0kwkqQXj1OPI/rnNVp/rZSRGqhrAYC8/WGKQIJRtwJYHrjLxPjP1wdR1SiHhilXS
 YhvJHVH99U13ngvYllgvFlPuNZgznpzCzolFAqNRMIXeuMf/1w6MpAJySiqEern1XI8b
 be1w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=C3bYb5hg
Subject: [Buildroot] [PATCH v2 0/4] add cve-check script
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

Enriches the input CycloneDX SBOM with vulnerability information and
analysis from the NVD database.

The NVD database is cloned using a mirror of it and the content is compared
locally. By default the path 'dl/buildroot-nvd' is used.

Example usage to analyse vulnerabilities of an input CycloneDX SBOM:

$ make show-info | utils/generate-cyclonedx | support/script/cve-check

The 'cve-check' can also be used to only enrich the vulnerabilities
present on the input SBOM with a set metadata (description, cvss,
references, ...) without applying an analysis.

With the following command the vulnerabilities ignored by Buildroot
present in the CycloneDX SBOM are enriched with description, cvss, etc
...

$ make show-info | utils/generate-cyclonedx | support/script/cve-check --enrich-only

v1 --> v2:
    - Add support for only enriching the current content of the SBOM
      without analysis.
    - Improve the CVE to CycloneDX matching of metadata.

Thomas Perale (4):
  support/scripts/cve.py: don't call download_nvd
  support/scripts/cve-check: add cve-check script
  DEVELOPERS: add Thomas Perale to cve-check & cve.py
  docs/manual: add information on CycloneDX

 DEVELOPERS                    |   2 +
 docs/manual/common-usage.adoc |  27 +++
 support/scripts/cve-check     | 323 ++++++++++++++++++++++++++++++++++
 support/scripts/cve.py        |  29 ++-
 support/scripts/pkg-stats     |   2 +
 5 files changed, 381 insertions(+), 2 deletions(-)
 create mode 100755 support/scripts/cve-check

-- 
2.51.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
