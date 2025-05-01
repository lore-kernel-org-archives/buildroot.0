Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12F3CC3ABA3
	for <buildroot@archiver.kernel.org>; Thu,  1 May 2025 07:38:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8F94683DF4;
	Thu,  1 May 2025 07:38:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kydXMizSOpgn; Thu,  1 May 2025 07:38:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CEB6783DF7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id CEB6783DF7;
	Thu,  1 May 2025 07:38:20 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 3F90F113
 for <buildroot@buildroot.org>; Thu,  1 May 2025 07:38:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3D05E42445
 for <buildroot@buildroot.org>; Thu,  1 May 2025 07:38:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RMarwYFgZT2R for <buildroot@buildroot.org>;
 Thu,  1 May 2025 07:38:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::534; helo=mail-pg1-x534.google.com;
 envelope-from=kadambini.nema@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 8285F42441
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8285F42441
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com
 [IPv6:2607:f8b0:4864:20::534])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8285F42441
 for <buildroot@buildroot.org>; Thu,  1 May 2025 07:38:19 +0000 (UTC)
Received: by mail-pg1-x534.google.com with SMTP id
 41be03b00d2f7-b1396171fb1so397466a12.2
 for <buildroot@buildroot.org>; Thu, 01 May 2025 00:38:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746085098; x=1746689898;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=gcNgOn0HxR+UF6GtNJPdlGOTWbk3+vZ4s/BkKgXZfgA=;
 b=jTF0R2atAecUCGJ9cbe9MQ7dYpjz05fKJaGqfEntdSj5zHnBhJI8bA86w0s5OcE9fI
 KDX9TUmSuEsl8varqvPiGT7Xa61mmGzDSn0fUeV0Lr1KsceYgOhDWzn0SpCgbaKaHnc9
 eMR1O1c7kxnsixOqeuTSqXoqQxIJBdXeDd3a5UpKIfCoNsLRyDzQija4Z1vrUd4fl0Dq
 VdGcroP7X1RvDXK6r7wp1VPmenfiJZlzLLNstomPqA/IpUIDZCmBN9xKayjmrhk78pIf
 fxgd5VYzawKxlBZSninFTf/Y4iwEeuzZskKyD6OBPOuCwltu/mLPh+dsTcom7UcLqRLE
 2NrQ==
X-Gm-Message-State: AOJu0Yy8GBU9++p7+5/O5ZBGrdDTtuTKxeuuQBCeyC/MOd3l6BDT/Ro3
 dOs0laXIz5I09i3B+ukJT5fMsfCe3+oSIheqsmBCl4uI6SCWwG8hPO1jCAz4
X-Gm-Gg: ASbGncvJ/Hf26vFFYKxhLPgkI7MKs1wGvAM1XuphhN4fcE3lucIZBw46ovPMIrf/t8k
 0wr2WvxzpwAN0RrP0n5CJagv7vx++3j0TOQbwpK7rrP0sEXFjfvEHrAIm67N57Ga8pSF+OTmRLK
 AaDll0TPDcDUND8t+ol10lj9AAaXociR7yqOvwdkSDABpYQiEqG8y4kNxFoYBTLQfTAW1A8IZ+X
 JkdTg96DGeBtTCo2+23J/9A/faNgPHd7bPcH6/NHYFJq2Mv1GHY6hvMmzpROKW2BQ0dIab4umnt
 rk8GPtpvEDYmkBGUvyrc9cLY8fKcYOl2OLst/wtmI+yRcdTB6drZnoyFs+o6kvDiZeBG0Bg+t2e
 CylGfZ2lXEFXOwXTtZKJzIlDSEVk=
X-Google-Smtp-Source: AGHT+IFij7AN5yIJ1l+2v5CIyEF8CHSikGj05gycDvER9fYfkti9HWevXfAhZQ1c0z58FL5dZBJhcg==
X-Received: by 2002:a17:90b:384b:b0:2fe:7f40:420a with SMTP id
 98e67ed59e1d1-30a41e66d4cmr3081985a91.17.1746085097715; 
 Thu, 01 May 2025 00:38:17 -0700 (PDT)
Received: from localhost.localdomain (ip72-203-121-181.oc.oc.cox.net.
 [72.203.121.181]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-22e0bb04d25sm1363795ad.44.2025.05.01.00.38.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 May 2025 00:38:17 -0700 (PDT)
From: Kadambini Nema <kadambini.nema@gmail.com>
To: buildroot@buildroot.org
Cc: Kadambini Nema <kadambini.nema@gmail.com>
Date: Thu,  1 May 2025 00:37:27 -0700
Message-Id: <20250501073727.12431-1-kadambini.nema@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1746085098; x=1746689898; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=gcNgOn0HxR+UF6GtNJPdlGOTWbk3+vZ4s/BkKgXZfgA=;
 b=KdkdmZv3EMSqUAh4UVSXVUKDu+4LaZB5DN/7A3letxLZQF7uFjge3+CYXjUZjezz2B
 ZM2sWHDmQ2WpsACKQxNoJ3c4HILs8RRIuKMhBwdCFHU9+1U8MUyJHG5x5nfEphIiXOeG
 sfgE8QW6GgHShzlPR5l36hePLVbk9N/LKMv+IfLV/W/QZFI20+D4+cyERFt0SCjpAdXN
 yRMcHeTbXw0pPG+RSgGGRFo4+Iu9CZL9+pGSZE3t97sI9e74qVOyi3VP5TPCLfgaUMZ4
 tnsValf1vEHyO/EpUHp8NFDea5PpxL+OpVO+Wq8zwlf9PrpsxIBCbTM2AagJSyHRD47b
 nf/g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=KdkdmZv3
Subject: [Buildroot] [PATCH 1/1] package/hwdata: bump version to 0.394
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
https://github.com/vcrhonek/hwdata/releases/tag/v0.394

Changelog:
https://github.com/vcrhonek/hwdata/compare/v0.392...v0.394

Signed-off-by: Kadambini Nema <kadambini.nema@gmail.com>
---
 package/hwdata/hwdata.hash | 2 +-
 package/hwdata/hwdata.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/hwdata/hwdata.hash b/package/hwdata/hwdata.hash
index 9c8d37323d..eb4ecc191d 100644
--- a/package/hwdata/hwdata.hash
+++ b/package/hwdata/hwdata.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256  1f472d8f2ec824d4efe6a75480767c4ce240fa5d91b6428d9f8775035da3ba1f  hwdata-0.392.tar.gz
+sha256  b7c3fd7214a3b7c49d2661db127a712dc11cffd1799f793947aa1cb20aaf3298  hwdata-0.394.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
 sha256  21d0406f93e884a050426ebc21931839a45d56bfcbcbfdda7686d583f36f107f  LICENSE
diff --git a/package/hwdata/hwdata.mk b/package/hwdata/hwdata.mk
index eb9166dc72..f47df2ebb8 100644
--- a/package/hwdata/hwdata.mk
+++ b/package/hwdata/hwdata.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-HWDATA_VERSION = 0.392
+HWDATA_VERSION = 0.394
 HWDATA_SITE = $(call github,vcrhonek,hwdata,v$(HWDATA_VERSION))
 HWDATA_LICENSE = GPL-2.0+, BSD-3-Clause, XFree86 1.0
 HWDATA_LICENSE_FILES = COPYING LICENSE
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
