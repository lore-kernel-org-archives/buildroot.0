Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AB4AF483D7
	for <buildroot@archiver.kernel.org>; Mon, 23 Mar 2026 19:23:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1730D816E9;
	Mon, 23 Mar 2026 19:23:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bHO2XaLOhiFH; Mon, 23 Mar 2026 19:23:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CB695816D5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1774293818;
	bh=UPKaJE/jzlbkiR5Bd6sNLKIY5m1MBZQSeZXsbc/Fif8=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=Q6ce+2TmgR410v5U4/ZVT/J+8gWl8swAJ8xy/LDrgQv5Tr4OYJWr7js5YgdS5F2S8
	 mwETtfJo/1Xg0vTrfmvHonr9SAgz/eW+lqpPPV0oZ7aF2Z5kwmpZ69cxlXdtEe9AVR
	 mk/iZHqvzsaPImDO/RVD6hWmYDZL3i/IG7MbNcnEqAsRrh5vwCVX+/MtODTzGx54bK
	 H+NcsLITaPeZ3R145uAFWXrgqGdd2bzpT1NnB2RVSCLG+idNyMV34qjF45PNQSVdh2
	 S573odLo18SnMVhUxUBJYJIZ1z3x7e7fWfgshGcBMcxlwwXjb2WoTDcdd9zFhXqu7t
	 1vva0PzUOfybg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id CB695816D5;
	Mon, 23 Mar 2026 19:23:38 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id B7CA6F4
 for <buildroot@buildroot.org>; Mon, 23 Mar 2026 19:23:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A9F2B40056
 for <buildroot@buildroot.org>; Mon, 23 Mar 2026 19:23:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WHzDoEd2I92u for <buildroot@buildroot.org>;
 Mon, 23 Mar 2026 19:23:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::330; helo=mail-wm1-x330.google.com;
 envelope-from=flaviu.nistor@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 9AACB4007D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9AACB4007D
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9AACB4007D
 for <buildroot@buildroot.org>; Mon, 23 Mar 2026 19:23:36 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-486b96760easo4818165e9.2
 for <buildroot@buildroot.org>; Mon, 23 Mar 2026 12:23:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1774293814; x=1774898614;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SSSf6rnFttAhnxwKFlm7EfLkQ5PLN/6dvlKHeHOteh4=;
 b=agi0JImm5bCb2X5vqDbDEaPXqguGpjze+D+ge/+as619A0stowAHWFxK3wqtmr2Mhd
 XBgccIoejoxYtV2N0t3eARrg7exJnnM0OEcCGKRahSRwDOeVUT8yl+osYfY3bEqrzAye
 8Lzpw9EF3iS92xFbKDX13+GjyLevH+daLYUhlbBe8sIaLS3SMQM0zK7C/X32PXl7HTA/
 WNK4cT5gu+4sFbbUlNY2gRI9Dswtqagae8MG7la3DToe129GHIkKYdEsp+q7t+9zIdS5
 4n0RJTHNcc1vPc/iGxQyjx4IfX3N3GsQwIRnRFVi9CaHtA36/7UKfsKff9+5CkcQHA2D
 eMpA==
X-Gm-Message-State: AOJu0YzZGthgqT1MMIak8b8WkPbLIO1+/DN6BIySxhvDTddGQP8mILGR
 gl854pC1Ne6Pkvhyyx4Q5pOltaO6ghZU3eLnSWQstPGB1J8OYBZISeGdheDy4HKW
X-Gm-Gg: ATEYQzwASEIyoz+ycvjKE5JSGuj/o/xHrQCO5WYc8NK1880VgJhY8h22pPNzDcrv8lw
 uDLeAfmrmx6LAyZePzRHjX/xZTUhNctfuO949sQRgkCAWsP3srmnjVpKyNltvPQVyXOBhT2fKQJ
 WipFV0bA3O7uDv6oNYjOciOQB2QcfAxybICU11b36ayqOOT7SewJb+/b4bYWzRTn6LuNIFLRWB2
 YYZbsR7Yi/iKaxuLTV9v5q7Kvc6tB4q+LOOSgUJMrri+jiEn4v2IngNa4vpgy5pQ77vibAmuIsG
 Rp97RV6w/WJ3iJqnOhk1xwlGwgmLzgaWpMS9aJH0kIRWXpPA48JOCEy1bWmCMjEDz2OcaOMtznF
 6kvFWhUGECn6G5Th9qedtnjijMhjz0SVyC4RwTdgY6Zjkp6WDv4X7pNT0AqAcpPuBBe6QxV8pyu
 bNRLVqvOLdDvU9gSsUq6awMEUKqUuEO5iB+QodYymWcSffGFFg8Lp8lpxUq6GcoiXuSdYJzwUoE
 S5bd+dKrEw=
X-Received: by 2002:a05:600c:a43:b0:485:40ed:2d1 with SMTP id
 5b1f17b1804b1-486fee0fa3dmr180073085e9.17.1774293813998; 
 Mon, 23 Mar 2026 12:23:33 -0700 (PDT)
Received: from flaviu-Aspire-E5-572G.. ([5.15.232.50])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4870f66a148sm3727295e9.1.2026.03.23.12.23.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Mar 2026 12:23:33 -0700 (PDT)
From: Flaviu Nistor <flaviu.nistor@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 23 Mar 2026 21:23:25 +0200
Message-ID: <20260323192325.14899-1-flaviu.nistor@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1774293814; x=1774898614; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=SSSf6rnFttAhnxwKFlm7EfLkQ5PLN/6dvlKHeHOteh4=;
 b=hiGAlAXa4GDosepkz6QAuKR6+3Dv70nJgx4iRjLiA4DaauAMNvHk/UyViO0DLJnLeg
 VQoJ76wgQJRjYNAniutZh10IBhqTwhMKDusHqd71zLtc7ixoPooRWwUoHDK3eIEUaRGP
 zv9LwbpGQ4ItUR/jxnskGx1C08LNXZnynw5xmgWU7lN4ROtnrip2CKFqkzI4ilwid+0D
 aBI8v9YaWyPAdn/wHe9JcOFiRifO0J/29KtOo+BR6K7FkIXs249NVBUEc5IrVStbEUsx
 uMvVxBcm3XnLKhpb0DBow5PaBdwR6MzBsIDPr8ZcbyWiUycC9hCHiLmVCneoH8AKSw2I
 NPnA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=hiGAlAXa
Subject: [Buildroot] [PATCH 1/1] package/python-smmap2: bump to version 5.0.3
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
Cc: Flaviu Nistor <flaviu.nistor@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Flaviu Nistor <flaviu.nistor@gmail.com>
---
 package/python-smmap2/python-smmap2.hash | 4 ++--
 package/python-smmap2/python-smmap2.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-smmap2/python-smmap2.hash b/package/python-smmap2/python-smmap2.hash
index 6b040519ae..366a121c0a 100644
--- a/package/python-smmap2/python-smmap2.hash
+++ b/package/python-smmap2/python-smmap2.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/smmap/json
-md5  1b691646da8ef92e9e178bd9b23c2540  smmap-5.0.2.tar.gz
-sha256  26ea65a03958fa0c8a1c7e8c7a58fdc77221b8910f6be2131affade476898ad5  smmap-5.0.2.tar.gz
+md5  3f2bb4ecf6ec521559d9c6038697e89b  smmap-5.0.3.tar.gz
+sha256  4d9debb8b99007ae47165abc08670bd74cb74b5227dda7f643eccc4e9eb5642c  smmap-5.0.3.tar.gz
 # Locally computed sha256 checksums
 sha256  88e9d93f708d110b328a834302dd1d5c6afbda530e7721d15d80b3511d86f235  LICENSE
diff --git a/package/python-smmap2/python-smmap2.mk b/package/python-smmap2/python-smmap2.mk
index 23517c3958..e7af384789 100644
--- a/package/python-smmap2/python-smmap2.mk
+++ b/package/python-smmap2/python-smmap2.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_SMMAP2_VERSION = 5.0.2
+PYTHON_SMMAP2_VERSION = 5.0.3
 PYTHON_SMMAP2_SOURCE = smmap-$(PYTHON_SMMAP2_VERSION).tar.gz
-PYTHON_SMMAP2_SITE = https://files.pythonhosted.org/packages/44/cd/a040c4b3119bbe532e5b0732286f805445375489fceaec1f48306068ee3b
+PYTHON_SMMAP2_SITE = https://files.pythonhosted.org/packages/1f/ea/49c993d6dfdd7338c9b1000a0f36817ed7ec84577ae2e52f890d1a4ff909
 PYTHON_SMMAP2_SETUP_TYPE = setuptools
 PYTHON_SMMAP2_LICENSE = BSD-3-Clause
 PYTHON_SMMAP2_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
