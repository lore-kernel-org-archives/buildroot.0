Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE33FC369DC
	for <buildroot@archiver.kernel.org>; Wed,  7 May 2025 04:52:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 20FC980E04;
	Wed,  7 May 2025 04:52:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yDq9PyvTLx-m; Wed,  7 May 2025 04:52:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4BB4E80DAD
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4BB4E80DAD;
	Wed,  7 May 2025 04:52:31 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id D77B7CD
 for <buildroot@buildroot.org>; Wed,  7 May 2025 04:52:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C8E0840983
 for <buildroot@buildroot.org>; Wed,  7 May 2025 04:52:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8YH-vs283RTR for <buildroot@buildroot.org>;
 Wed,  7 May 2025 04:52:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::62a; helo=mail-pl1-x62a.google.com;
 envelope-from=kadambini.nema@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org F335E40590
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F335E40590
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com
 [IPv6:2607:f8b0:4864:20::62a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id F335E40590
 for <buildroot@buildroot.org>; Wed,  7 May 2025 04:52:29 +0000 (UTC)
Received: by mail-pl1-x62a.google.com with SMTP id
 d9443c01a7336-225477548e1so68240715ad.0
 for <buildroot@buildroot.org>; Tue, 06 May 2025 21:52:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746593548; x=1747198348;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=BL32sF134CYoroWL1JQPk5KFox6xLrQMrSmATdxioZk=;
 b=pn2S/0sTMJjyeGiowVIkjMXzjzL/rd/K1OG/VCd1kgnAZXce9cCL0sVle/NQ34ZFGW
 GRdSOsRVE6X9xySrpc+ruHymnyEs/hpCUWT7uhVh+GNW2Awq1HlgyfaCf21NoBX3iqAS
 zt7WNf17LIhQepzH5f8Gcjyaeo56QeZi4Jx4QS9b2XB4EVQF03ubfIsQ5yD8s4OKXWQw
 1Fdk3sHLmgJRzK59v+vroxmhQPEb1ijD9u+se0OWfIxn4DfJUP++8MKDqlpROt9QCJuu
 hxAoq+/mkxcy8tgHMKaQ74BRguWCZDdwN9CZ5UxupfAhH0WcFddD00iSnAgEIDbzGNAk
 hL8g==
X-Gm-Message-State: AOJu0YwpQKY3sgSCNqwoyOzHOYJlne3jE8dRCxpZ7GOEENaDe2Ei3W16
 UVkgNp6t+53S5CetcZ8ioEglCQm8pSo4GxV6et0FQ/rPuTp9i0FRJFL/o3Rt
X-Gm-Gg: ASbGncsBsym24YRMBedJw9ON6WRUUtHKePqXWtrTaK2bb95Ueg2TKYVtgZj2vImWyvV
 Of4C4q51+OLpnvNdFRjYkTuXrdpVpgpOgjNpoL2rGCsKkP1pAuYoTGoU1T85LL6rzQIsvABzi+o
 q7+9Cr/NXU5zxik7l5cBW2RefDkmQxvR95EjeYdXsd5XaKXsyqFUNIamY2Y5iNvahpjX4RdIwes
 Ii3lsznt6tx2LGhaZmtNdL5klFb8wtTXVBjAOZaI2s9gJFHXIPsMKPZbMTd6hG5UFNRRyMiELfK
 h4VW52hkMHjpMWWILuIJWtZx86DwgXbxBmNvHgEpqp7BmntVQ3cXp+tmOanNz4pM83hzQDXiU0r
 h9SkD9K4PBNHLloceKiGYa0o70owX9HgCf7cKZg==
X-Google-Smtp-Source: AGHT+IH1WvBNESRN8WrvdREmDDqqePwjSB6YIwpWfz+awyuE/FeJZPxCogwSS4fg1gDoVhImeuHlXA==
X-Received: by 2002:a17:902:f789:b0:224:1001:6787 with SMTP id
 d9443c01a7336-22e5ea2e466mr28851735ad.4.1746593548225; 
 Tue, 06 May 2025 21:52:28 -0700 (PDT)
Received: from localhost.localdomain (ip72-203-121-181.oc.oc.cox.net.
 [72.203.121.181]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-22e152320f5sm83566025ad.236.2025.05.06.21.52.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 May 2025 21:52:27 -0700 (PDT)
From: Kadambini Nema <kadambini.nema@gmail.com>
To: buildroot@buildroot.org
Cc: Martin Bark <martin@barkynet.com>,
 Kadambini Nema <kadambini.nema@gmail.com>
Date: Tue,  6 May 2025 21:52:23 -0700
Message-Id: <20250507045223.4747-1-kadambini.nema@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1746593548; x=1747198348; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=BL32sF134CYoroWL1JQPk5KFox6xLrQMrSmATdxioZk=;
 b=YmLQyX335+3r0CyMdGf9KQqG8R47Wd3dn7/Vv4nYYQ7Ko1BOiVzIvAoIWtmnzZuZq+
 S9D22QB73C2ONirL8BkXAiI3hdaLfE17pH/eULuI5XDnd9DhyiI3e2c6L8TN2siMKBcG
 GFKriYu/Nrw2//4/WOhtvp7gaeaE6dHtUZR/RbphXpRqfUANIm6xsS+WdWTs2si72LmI
 4Zpd4Jmt2Wf1w0dr+zaPhhJJczaGp2IOr2q6AEQKHZykUOakG2K5iFZHi1h3jNqm0eo4
 HRoFetYwo1dZ92J+qSG/qOnuKbJNz2tUGS6KtBUWr3y93Vmp8fpkQZMM1n1On35pQ/P2
 0ckQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=YmLQyX33
Subject: [Buildroot] [PATCH 1/1] package/zic: bump version to 2025b
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Release notes:
https://lists.iana.org/hyperkitty/list/tz-announce@iana.org/thread/6JVHNHLB6I2WAYTQ75L6KEPEQHFXAJK3/

Signed-off-by: Kadambini Nema <kadambini.nema@gmail.com>
---
 package/zic/zic.hash | 4 ++--
 package/zic/zic.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/zic/zic.hash b/package/zic/zic.hash
index 9e89aad23a..b9daccb381 100644
--- a/package/zic/zic.hash
+++ b/package/zic/zic.hash
@@ -1,4 +1,4 @@
-# https://lists.iana.org/hyperkitty/list/tz-announce@iana.org/thread/MWII7R3HMCEDNUCIYQKSSTYYR7UWK4OQ/
-sha512  308f6a3d6ebfa18446f8296e5c799e18dccecd79ace3ba004d3f233892c7428faae152b217b22d229c59dd4e0faafee797d8b3583b58fa982b81f7cc7347f502  tzcode2025a.tar.gz
+# https://lists.iana.org/hyperkitty/list/tz-announce@iana.org/thread/6JVHNHLB6I2WAYTQ75L6KEPEQHFXAJK3/
+sha512  19826b12968c10fc4db7e4b07ba782bfb8590eeebaec6f719d74b92a2e642ab817bd72bceff0015ce52a838edfdb00753b3cd87dd84b35abf2606e5bee445f76  tzcode2025b.tar.gz
 # Locally computed:
 sha256  0613408568889f5739e5ae252b722a2659c02002839ad970a63dc5e9174b27cf  LICENSE
diff --git a/package/zic/zic.mk b/package/zic/zic.mk
index 71454d4fe0..1abeb2d70e 100644
--- a/package/zic/zic.mk
+++ b/package/zic/zic.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ZIC_VERSION = 2025a
+ZIC_VERSION = 2025b
 ZIC_SOURCE = tzcode$(ZIC_VERSION).tar.gz
 ZIC_SITE = https://www.iana.org/time-zones/repository/releases
 ZIC_STRIP_COMPONENTS = 0
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
