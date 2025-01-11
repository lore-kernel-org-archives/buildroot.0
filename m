Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57EDBE7719A
	for <buildroot@archiver.kernel.org>; Sat, 11 Jan 2025 17:36:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 24BBA83B1D;
	Sat, 11 Jan 2025 17:36:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LFDrIxOx7mkL; Sat, 11 Jan 2025 17:36:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2AD0583B60
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2AD0583B60;
	Sat, 11 Jan 2025 17:36:26 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 86718940
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 17:36:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7407C411E8
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 17:36:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PW17Dkzooh5Z for <buildroot@buildroot.org>;
 Sat, 11 Jan 2025 17:36:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d34; helo=mail-io1-xd34.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org A4C2441238
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A4C2441238
Received: from mail-io1-xd34.google.com (mail-io1-xd34.google.com
 [IPv6:2607:f8b0:4864:20::d34])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A4C2441238
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 17:36:23 +0000 (UTC)
Received: by mail-io1-xd34.google.com with SMTP id
 ca18e2360f4ac-844cd85f5ebso233487939f.3
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 09:36:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736616982; x=1737221782;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/57/Z1Xu+pab5vawwcXM164Rnm1OhjveAqe2oCdsrJg=;
 b=CSKhwqMd3IaY57rrRb3FGWL0iBMsWYlLMU+jkO3M2RAMZFSB3euGsUT1dj8X460k1S
 Z18ecieS0ETX6EJBgwAnq69ez4HxtAMCFeJBYbJC6OowE2B8jswJqv0ACOB4IYDSYA5a
 QpJHenZJJ5E6Emol2pLH98f9vFOPtGFR2Pt4hlXRSUpzrl+WuHQEF7JRjTDQygOOcW/L
 TsNcMX36dF+ypGMN51usrvEl+yC+oFpRPtztjY1eZL+Rnip9Mmvv+MJRw9d8/QnKKP6D
 9qwdAeBsZre+dbQV+8WLkNkXKlC8DsWF5ZwlBWpQqcdlpN9K8IoonRwzFPLSifF95Lsl
 rE4g==
X-Gm-Message-State: AOJu0Yy5qdmraFnpGEC737zTbMNb+inXb/KA8Sd1HZXPNSFyhHINmqiU
 xWANN/FQOUukiCboQQ671c235NQS3uSvJLej41U9qEW2fvGkGGIyuU4WqnS4sic=
X-Gm-Gg: ASbGncsx68ZWYnevkvENrZpOPZ3XAlLbP9Ja9C1KE+ZoM5g5MU0/w7+fTdgJ4iKCxAz
 cWt8pnZTK5WANEGIsnNAJzVZR8NnBXvst1CA4F3bSND45wJ4fU2/VwHh+C7FtxlXgZZ8owcNPrG
 H3Ah/o6FNqmtZFUtRjvVYi4QO/w3yEtvQL2TQTxwC+KpApgQxu7Vp7AcIhVTFkhRkXWQRmgvkNy
 QeKALRu0BoMzJ2B/m4JBxoQhADydLnNeuZHyf6ebY5samxR3Xjfm/SmyyI4qlSqdePvmlo1xNCL
 UmdkK8zVl2Wbq0p6T62Kxq2Ks9c9Wl0=
X-Google-Smtp-Source: AGHT+IG7rVXmnLX9HkLjiY4bPnUrXBzvdrcxtYYo+dV5ua3G8I1BLvDjyKST/T0hp1+rTSRu9uuEsg==
X-Received: by 2002:a05:6602:3a09:b0:83a:b500:3513 with SMTP id
 ca18e2360f4ac-84ce00a3e64mr1432831339f.8.1736616982382; 
 Sat, 11 Jan 2025 09:36:22 -0800 (PST)
Received: from james-x399.localdomain (71-218-115-58.hlrn.qwest.net.
 [71.218.115.58]) by smtp.gmail.com with ESMTPSA id
 ca18e2360f4ac-84d61fa3d8asm158930739f.31.2025.01.11.09.36.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 11 Jan 2025 09:36:21 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 11 Jan 2025 10:36:20 -0700
Message-Id: <20250111173620.2917971-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1736616982; x=1737221782; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=/57/Z1Xu+pab5vawwcXM164Rnm1OhjveAqe2oCdsrJg=;
 b=mIYvmet6++6SDp6HIA6mJLlcO/QG26x0yo2VaQF6XLZFRPTevmm/SYwo58g6MIy3Gn
 At2CLSHGix41/OV2/31auJednKloUQAB0mIn/eFs1A8GJQgyUTQAGFc5OTcC2TFic1Fz
 fQ47xtiTXfmDwttz1KkIBGllsQYuuMUJ482fIsJc9t2emFL7Iwmeqc4gLlw3kbzn6u7D
 CvwG9mBotgd1MwHXpjesVsam1FhZbkSQAC7vN+gehjPI0CSYGi3PxqLC75h3IREAUmXP
 iD1R8i7lLNniDQ23Xr2aetbkRSZIQ7PtlzslmgGfpdLIvhyJSUk1hY6rXzQdRm/ybL0J
 pPGw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=mIYvmet6
Subject: [Buildroot] [PATCH 1/1] package/python-sqlalchemy: bump to version
 2.0.37
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
Cc: =?UTF-8?q?Fl=C3=A1vio=20Tapaj=C3=B3s?= <flavio.tapajos@newtesc.com.br>,
 James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-sqlalchemy/python-sqlalchemy.hash | 6 +++---
 package/python-sqlalchemy/python-sqlalchemy.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-sqlalchemy/python-sqlalchemy.hash b/package/python-sqlalchemy/python-sqlalchemy.hash
index 4e38d4ec58..cfa326cfdc 100644
--- a/package/python-sqlalchemy/python-sqlalchemy.hash
+++ b/package/python-sqlalchemy/python-sqlalchemy.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/sqlalchemy/json
-md5  7a4444524e4930a29f22dbca0cb16d4b  sqlalchemy-2.0.36.tar.gz
-sha256  7f2767680b6d2398aea7082e45a774b2b0767b5c8d8ffb9c8b683088ea9b29c5  sqlalchemy-2.0.36.tar.gz
+md5  b7b1514b01796c1b98d7b7ddd2b2c79a  sqlalchemy-2.0.37.tar.gz
+sha256  12b28d99a9c14eaf4055810df1001557176716de0167b91026e648e65229bffb  sqlalchemy-2.0.37.tar.gz
 # Locally computed sha256 checksums
-sha256  3c0f59ab887d041de6a4e52ffe3e9edb5d9522de909fae9a6cd7adb6e7be3293  LICENSE
+sha256  9821720b58d4a565b61321007a8ad43ab6991a3959e66cd5db4dd9eae69c7dfc  LICENSE
diff --git a/package/python-sqlalchemy/python-sqlalchemy.mk b/package/python-sqlalchemy/python-sqlalchemy.mk
index 1bc2f3929a..c8d919c3cd 100644
--- a/package/python-sqlalchemy/python-sqlalchemy.mk
+++ b/package/python-sqlalchemy/python-sqlalchemy.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_SQLALCHEMY_VERSION = 2.0.36
+PYTHON_SQLALCHEMY_VERSION = 2.0.37
 PYTHON_SQLALCHEMY_SOURCE = sqlalchemy-$(PYTHON_SQLALCHEMY_VERSION).tar.gz
-PYTHON_SQLALCHEMY_SITE = https://files.pythonhosted.org/packages/50/65/9cbc9c4c3287bed2499e05033e207473504dc4df999ce49385fb1f8b058a
+PYTHON_SQLALCHEMY_SITE = https://files.pythonhosted.org/packages/3b/20/93ea2518df4d7a14ebe9ace9ab8bb92aaf7df0072b9007644de74172b06c
 PYTHON_SQLALCHEMY_SETUP_TYPE = setuptools
 PYTHON_SQLALCHEMY_LICENSE = MIT
 PYTHON_SQLALCHEMY_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
