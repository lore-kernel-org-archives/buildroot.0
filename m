Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5F11E7719C
	for <buildroot@archiver.kernel.org>; Sat, 11 Jan 2025 14:06:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8708483CBE;
	Sat, 11 Jan 2025 14:06:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id P5AVAPRZP-y0; Sat, 11 Jan 2025 14:06:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 90CB783CC2
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 90CB783CC2;
	Sat, 11 Jan 2025 14:06:24 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id EBC0B940
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 14:06:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D997061156
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 14:06:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id q3futf2D6bW5 for <buildroot@buildroot.org>;
 Sat, 11 Jan 2025 14:06:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d2a; helo=mail-io1-xd2a.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org DDC85610BE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DDC85610BE
Received: from mail-io1-xd2a.google.com (mail-io1-xd2a.google.com
 [IPv6:2607:f8b0:4864:20::d2a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DDC85610BE
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 14:06:21 +0000 (UTC)
Received: by mail-io1-xd2a.google.com with SMTP id
 ca18e2360f4ac-84a1ce51187so87385839f.1
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 06:06:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736604380; x=1737209180;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=zjtNqY9DKAddjvR0WunpqTw6RTdlqNOgy9UAja/0ixo=;
 b=qKh72qEgbrubFpZGtPc4TQCKE2/N41ZssKmYyMmWrx47S0ErC/AoFmUoiusW82rMI5
 wYM1jpCT4OGkFOa7OPkWAAhOPW4W30hyklj5SBVXrfUSXvSLCA+0LwbNPLBkzo/qkKCa
 vKKf0yZcZsS1PcbAysuF+uF+oaV1/Ngg2Ug9Is+yYS307VkF+wct6bwoz25lxl8UHId1
 QTsNEpL1y3gr2jMQbqcH2IQr6S6txiEi34Rc0z5Q4lCyRtslxdAI8VxF76hAQBbFQvBV
 HCyp32iZYm3CR1S52nOE64nqolKsFmgHzJJ1A4lPN4eIiHeVKhSUdS+IC9kwv+EZHi3m
 SwxQ==
X-Gm-Message-State: AOJu0Ywf2LDOpcBGcHhGHuyYntIG8bbWTOF9FhgclZ0H8ppG4GiCdSML
 1tGfFmpGk6Ugdlly5uUKpevXxNV4Pv95AzDqidp2VYMa09o8eojoZdb8Ms9pyuE=
X-Gm-Gg: ASbGncvRpA3TVdcHyVA+VF7lLPHtsKZnmOchkSh5Gk3d4TfroTebqIO3bsiCcQbYF6e
 3OCqHzQBx1YCLzthctTqu4yONo1BPiXGZELfhUAP00fQabUJtbX8DW1t3y7QVFRTc9StkquyIKP
 gTudltJ6VvxtdEzknO12ce7KWowKLH2PvTpC8I7i+TNFz/00BmU4MaMEMYpZK+Di2iTqa9vND/p
 TITqhHasmF+YG9iv1nl8+UiTYuNGZitxKCClwX/CE1hauBsNSjhttHyywQZ/2cpPO/cEQ6SxJyI
 0wxCtDsO0UjPz7WTjbvcu6yaHtDOc+A=
X-Google-Smtp-Source: AGHT+IH1J/ccGEQaYaWLir/JIWi8R7auMT5QiQOngWsKrzmiZuR1/ZWlN2prQqNWr6+ObWeu9mU+Og==
X-Received: by 2002:a92:c24f:0:b0:3a7:e592:55ee with SMTP id
 e9e14a558f8ab-3ce3aa746d1mr116083875ab.20.1736604380634; 
 Sat, 11 Jan 2025 06:06:20 -0800 (PST)
Received: from james-x399.localdomain (71-218-115-58.hlrn.qwest.net.
 [71.218.115.58]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4ea1b5fb20esm1527568173.16.2025.01.11.06.06.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 11 Jan 2025 06:06:20 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 11 Jan 2025 07:06:18 -0700
Message-Id: <20250111140618.2511466-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1736604380; x=1737209180; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=zjtNqY9DKAddjvR0WunpqTw6RTdlqNOgy9UAja/0ixo=;
 b=dcikj20qv48t1Sd8239SRoo7s3UVsRXCKN/QTDyuy/c4oMM7LvChuzmRDUhuAhBz1d
 n1bcS7VkC3i0Joo0vwtQw6TZrNl4Iuy/71j1J1qHup80XTS7PPFtNGT+/SatnaKNCbp6
 NTeMVELA3qpiR5yU/yKA8RrPsHPnQyjzyD0eLYX8Ai0NCmBfbH6D7dMD5PgN3mplsN5w
 WcUAZa0YcE8wbemfPkBq60ozi1yIKWwcnaeslD97tpeuyXraOPu24aSPXFKlNLmqylhg
 VTavNho7Gv/HX/FpRP+vWeK4QdPuez2InQI7cSAHIuBu6xHKMYylNSccBNgqj5aCpj4T
 jBrg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=dcikj20q
Subject: [Buildroot] [PATCH 1/1] package/python-mistune: bump to version
 3.1.0
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Mauro Condarelli <mc5686@mclink.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-mistune/python-mistune.hash | 4 ++--
 package/python-mistune/python-mistune.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-mistune/python-mistune.hash b/package/python-mistune/python-mistune.hash
index 7dee76cfa2..7f119f4a58 100644
--- a/package/python-mistune/python-mistune.hash
+++ b/package/python-mistune/python-mistune.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/mistune/json
-md5  8c02b3476d0343e0a4c75a2321729f01  mistune-3.0.2.tar.gz
-sha256  fc7f93ded930c92394ef2cb6f04a8aabab4117a91449e72dcc8dfa646a508be8  mistune-3.0.2.tar.gz
+md5  fb1f89ef8e8e0313d69ac82cb7c1627b  mistune-3.1.0.tar.gz
+sha256  dbcac2f78292b9dc066cd03b7a3a26b62d85f8159f2ea5fd28e55df79908d667  mistune-3.1.0.tar.gz
 # Locally computed sha256 checksums
 sha256  539013fd8e19f744f8bf0e27a532bbff54cd689ecef7a800f56ae5dc824be870  LICENSE
diff --git a/package/python-mistune/python-mistune.mk b/package/python-mistune/python-mistune.mk
index ac900c82ba..80c1ac83e2 100644
--- a/package/python-mistune/python-mistune.mk
+++ b/package/python-mistune/python-mistune.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_MISTUNE_VERSION = 3.0.2
+PYTHON_MISTUNE_VERSION = 3.1.0
 PYTHON_MISTUNE_SOURCE = mistune-$(PYTHON_MISTUNE_VERSION).tar.gz
-PYTHON_MISTUNE_SITE = https://files.pythonhosted.org/packages/ef/c8/f0173fe3bf85fd891aee2e7bcd8207dfe26c2c683d727c5a6cc3aec7b628
+PYTHON_MISTUNE_SITE = https://files.pythonhosted.org/packages/79/6e/96fc7cb3288666c5de2c396eb0e338dc95f7a8e4920e43e38783a22d0084
 PYTHON_MISTUNE_LICENSE = BSD-3-Clause
 PYTHON_MISTUNE_LICENSE_FILES = LICENSE
 PYTHON_MISTUNE_SETUP_TYPE = setuptools
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
