Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 703CCE7718B
	for <buildroot@archiver.kernel.org>; Mon, 23 Dec 2024 15:35:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 39F2481990;
	Mon, 23 Dec 2024 15:35:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nEbMk1oZ91rD; Mon, 23 Dec 2024 15:35:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 42E8981AC1
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 42E8981AC1;
	Mon, 23 Dec 2024 15:35:51 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id D9009757
 for <buildroot@buildroot.org>; Mon, 23 Dec 2024 15:35:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B71BA40274
 for <buildroot@buildroot.org>; Mon, 23 Dec 2024 15:35:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id I_Sw4daRYO51 for <buildroot@buildroot.org>;
 Mon, 23 Dec 2024 15:35:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::132; helo=mail-il1-x132.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 928CF40134
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 928CF40134
Received: from mail-il1-x132.google.com (mail-il1-x132.google.com
 [IPv6:2607:f8b0:4864:20::132])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 928CF40134
 for <buildroot@buildroot.org>; Mon, 23 Dec 2024 15:35:47 +0000 (UTC)
Received: by mail-il1-x132.google.com with SMTP id
 e9e14a558f8ab-3a8146a8ddaso14458415ab.1
 for <buildroot@buildroot.org>; Mon, 23 Dec 2024 07:35:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734968146; x=1735572946;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=7z10AdCQBy489zOo+7PabztDYUrkD0ME05kfnNLlWl0=;
 b=Z7NHSQpvxtELPIkJSQyiqHTx68ftGhKW8bdul17LSkuAhjNtHOyZxyjJ/XHxmtCeO/
 Uv/y81p047y+zG3USR0pejZLes2yDzS+/TZESYUv1aUst3YHWjSXC3UCDN0Hs5QJWT1d
 dtj2uA1T9O46CgEtxrpRELyqSf/9DEQllRtZqcWjJFOIboWiOHSQXTJPrQQjvOz/XfOB
 aSTpNSlmMIzyEWkFRgCJu7O2otktCMSBSl2cPBo3tIQpQJBS7A5aB0M7/fWQecyfXP38
 +dd/jliZX7t9ETDXAkKiTvkbN7FmxXFru11/2n1E3OvZKiOoS3l2ug+qKiT491MLSbKK
 SWQg==
X-Gm-Message-State: AOJu0YwbJJQP+/v42qM9QhweqSb8pPjQkk6WKoMdD6XCu3aAHqGYpjHS
 E5gnBDvQ0ncNeZzmY8jCQ9amTX8hm5pxd0Wl5RyedIjzDwJ5qe5Ww+tefRmsOc4=
X-Gm-Gg: ASbGncs/F+pOSlNmIGo5huvttOItjiKtJ/CQ2ln67u88se3k1KujWh2e5EMWrfxUacj
 zKZqhQSPibaxFqtJOacTNM1RKMQZyn6HrEd7cU4j1RHx8TfKyY7Utlehjrk+S6oNImdiSL8kPU/
 VezIFmULTNf6chV02zV9p7ParKJ5cy6ZufRpV5QjcGcdAwl1gJjbgvc9zKNTfhXZ884XI/tjGzW
 3g1Jvuv6BAxPE5Psz7Y+mqDQm7OoWlEGHqHY3SxxB+giN9kemJ3c5XJlBhmMIlW5HOw8maLngb9
 LbXYK1o9UQNBK1pt5a/NrdPP+WzxUdMH1w==
X-Google-Smtp-Source: AGHT+IEkWqmJt9aD5WXhBVwCrkG0fPByLRPO1cWmGVhrnzY2EGEdTBkSQFHPmwoLUJciWh0NMQ3f8w==
X-Received: by 2002:a05:6e02:184c:b0:3a7:c5ca:5f58 with SMTP id
 e9e14a558f8ab-3c2d25667bbmr92855535ab.7.1734968146296; 
 Mon, 23 Dec 2024 07:35:46 -0800 (PST)
Received: from james-x399.localdomain (71-218-105-232.hlrn.qwest.net.
 [71.218.105.232]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4e68c1dda1asm2218856173.116.2024.12.23.07.35.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Dec 2024 07:35:46 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 23 Dec 2024 08:35:44 -0700
Message-Id: <20241223153544.1838610-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1734968146; x=1735572946; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=7z10AdCQBy489zOo+7PabztDYUrkD0ME05kfnNLlWl0=;
 b=jwPAXQViAbyi7KIn1/wG/WxLTy+RGeZafPhCL3hJn6exODJpwOkkkGgbJacqnJ0RDk
 1u1NGlsIiy78fkJUkyXC3tWGoXW6rjooUbEPc3Zw3vlCzEeirZUge3sRQ1NeDvE9zkWC
 XKs9LXWWStt3quC1RTeE9ElBZNXd0mDSy2JzxxUm1NAWZIXGUOQ4kfbD9y7dYeU1Kilc
 cFh/5qiXWljTmgb2cPX6knmYyUbvmVLgsHd6HsN5znPnIC4rKD5SKH7XCArDUTXtLmjI
 DRYT6YGwa4aqiabxwaGyJOUidfphFxFLBReKXjQNMacAcNu2l4XW+sZBDlD4Jy0futbM
 r8fQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=jwPAXQVi
Subject: [Buildroot] [PATCH 1/1] package/python-bcrypt: bump to version 4.2.1
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
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-bcrypt/python-bcrypt.hash | 2 +-
 package/python-bcrypt/python-bcrypt.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/python-bcrypt/python-bcrypt.hash b/package/python-bcrypt/python-bcrypt.hash
index 6855047de6..c17ae6da50 100644
--- a/package/python-bcrypt/python-bcrypt.hash
+++ b/package/python-bcrypt/python-bcrypt.hash
@@ -1,4 +1,4 @@
 # Locally calculated after vendoring
-sha256  2385fd07301cf6d01befc1245d9310a97790492be76e388dd7c0d8de0409806f  python-bcrypt-4.2.0-cargo2.tar.gz
+sha256  cf7284c3284e619553116ec98036d05bdd20d44cab71f907b7cd15137a3f2ec9  python-bcrypt-4.2.1-cargo2.tar.gz
 # Locally computed sha256 checksums
 sha256  8173d5c29b4f956d532781d2b86e4e30f83e6b7878dce18c919451d6ba707c90  LICENSE
diff --git a/package/python-bcrypt/python-bcrypt.mk b/package/python-bcrypt/python-bcrypt.mk
index 0654ea4730..cbbc7bcecf 100644
--- a/package/python-bcrypt/python-bcrypt.mk
+++ b/package/python-bcrypt/python-bcrypt.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_BCRYPT_VERSION = 4.2.0
+PYTHON_BCRYPT_VERSION = 4.2.1
 PYTHON_BCRYPT_SOURCE_PYPI = bcrypt-$(PYTHON_BCRYPT_VERSION).tar.gz
-PYTHON_BCRYPT_SITE_PYPI = https://files.pythonhosted.org/packages/e4/7e/d95e7d96d4828e965891af92e43b52a4cd3395dc1c1ef4ee62748d0471d0
+PYTHON_BCRYPT_SITE_PYPI = https://files.pythonhosted.org/packages/56/8c/dd696962612e4cd83c40a9e6b3db77bfe65a830f4b9af44098708584686c
 PYTHON_BCRYPT_SITE = $(PYTHON_BCRYPT_SITE_PYPI)/$(PYTHON_BCRYPT_SOURCE_PYPI)?buildroot-path=filename
 PYTHON_BCRYPT_SETUP_TYPE = setuptools-rust
 PYTHON_BCRYPT_LICENSE = Apache-2.0
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
