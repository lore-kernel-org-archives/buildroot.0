Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8655AE77188
	for <buildroot@archiver.kernel.org>; Thu, 19 Dec 2024 01:54:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 21116850AC;
	Thu, 19 Dec 2024 01:54:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JhzGGfUssb4D; Thu, 19 Dec 2024 01:54:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2F81B850AF
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2F81B850AF;
	Thu, 19 Dec 2024 01:54:25 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 581C5CE
 for <buildroot@buildroot.org>; Thu, 19 Dec 2024 01:54:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 461BD614D0
 for <buildroot@buildroot.org>; Thu, 19 Dec 2024 01:54:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2pqg1JPw39Op for <buildroot@buildroot.org>;
 Thu, 19 Dec 2024 01:54:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::133; helo=mail-il1-x133.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 3F01F614A8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3F01F614A8
Received: from mail-il1-x133.google.com (mail-il1-x133.google.com
 [IPv6:2607:f8b0:4864:20::133])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3F01F614A8
 for <buildroot@buildroot.org>; Thu, 19 Dec 2024 01:54:22 +0000 (UTC)
Received: by mail-il1-x133.google.com with SMTP id
 e9e14a558f8ab-3a7d7c1b190so897005ab.3
 for <buildroot@buildroot.org>; Wed, 18 Dec 2024 17:54:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734573261; x=1735178061;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ViBPcJi/Fkf5byzVdrkLxCsRp7bwgLCW4DUgZbjDei0=;
 b=prfI0uO9aO3b7OLUak1duZbr1tRoDU8fH5YEuSFZOvgeDu6reRRmvEoKAuULcD3/LT
 gz3H99OOsDfU9R3yPg9ViUZG4fJLtjWnEA6vntl4uUFP1oJW2vGvIwmQxJ+ADDE32Hj9
 Y8V/dheGdyHuO7YYlGmslctXGr//eGlTFaQrfSvrsmsVzNev4e+AHnpfEj/Y0IpTw7H9
 Sxvm4YWXqTAhfiTI+IUyg2iT+24JR++XxwYCNPSPHMPH+vQ43ODmdYGBTHRDKdqbEXIj
 2iR6uUaITjrqocn8oorQ3KJUDCrdnq7e2n5bLwASrx6hJeWolcwtOUqiZMJdgfctKH8c
 UnBg==
X-Gm-Message-State: AOJu0YzjPd12o7VT1y5FxcwiF0rrn7niYGmTYJEjf684LRttm+cpXatQ
 7HVCgUdxeE+x55qFlGHuLGwUthAvu16fe7TrkYo8PprATK/djVbCFyjpd0BeGDk=
X-Gm-Gg: ASbGnct+JfyokZ+9yyiLqXmMJ6xDbsMIwNtXeH8/iRmgmRhVZ3ZMlldlbm3tUezWdpm
 k6xvI0n/iix/ewmORr+TGbeqQG+qW3z2ivSmBym65I5mNAN/VZZG79jp+oYH9QBo/cdywlKUjl8
 jUJsSbKdfs1zs49acS7icW4gvKtBaRf82SWnjBpbOGe8AsfaGg1CLMmJ7rHyDRi7f8L+X3XNOzw
 lG/2dF7GiaMieyJsHspjhtILLUJPbSEIdO3AgD0XsL0xzW+toTROyzwm2yVcoP7YPpdWgL228rp
 IV3Uc+kZZKQ04JtPZQhPW+gX/FG3ZNjAKw==
X-Google-Smtp-Source: AGHT+IHBGmeyMdECWn3LxnIbsPRWZ6EKPEFruNCrr1wrVh9EsLlYS451lkgSkB5fMxiuELIU8y5UqA==
X-Received: by 2002:a05:6e02:3cc5:b0:3a7:6d14:cc29 with SMTP id
 e9e14a558f8ab-3c010629a88mr19890355ab.1.1734573261005; 
 Wed, 18 Dec 2024 17:54:21 -0800 (PST)
Received: from james-x399.localdomain (71-218-105-232.hlrn.qwest.net.
 [71.218.105.232]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4e68bf4f349sm47873173.14.2024.12.18.17.54.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Dec 2024 17:54:20 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 18 Dec 2024 18:54:18 -0700
Message-Id: <20241219015418.262875-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1734573261; x=1735178061; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ViBPcJi/Fkf5byzVdrkLxCsRp7bwgLCW4DUgZbjDei0=;
 b=B73do8WR7WP+jTVAw823Bsej19swekn3dYnjzZwrV05lVqG/gbR+kWF95StkrCbCq1
 vP/DMXz8fteodaNuEEHk0J4oFI7DttfD81bo1HPwLPqD+s8/jkCgh9TtYGCTf4p6wwwk
 l79USjqDxeBk/o+DNbF/tydbfjBjUTCoblhdxRFXPqLdCNkml6IrYLzsHrn1UPk7WKrE
 T/ZkKxRlCddNFgbZ6IoJJP0r7FSACiJNOnoePMQse1wlAHAlv5aE5ttniAC5ZurlvHSl
 dzOUJTE70lb3ogsFJ/Kl7akmfO/CmlnwbAluz5IgNNzuJ2K6U+Zw1Ntc43rQj21T4gPq
 Zenw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=B73do8WR
Subject: [Buildroot] [PATCH 1/1] package/python-fastapi: bump to version
 0.115.6
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
 package/python-fastapi/python-fastapi.hash | 4 ++--
 package/python-fastapi/python-fastapi.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-fastapi/python-fastapi.hash b/package/python-fastapi/python-fastapi.hash
index 6c7451ebd0..11e5837a3a 100644
--- a/package/python-fastapi/python-fastapi.hash
+++ b/package/python-fastapi/python-fastapi.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/fastapi/json
-md5  feecf6d0db305d63ee9e6fcb77c81673  fastapi-0.115.4.tar.gz
-sha256  db653475586b091cb8b2fec2ac54a680ac6a158e07406e1abae31679e8826349  fastapi-0.115.4.tar.gz
+md5  977d2052173cde94dd66c669110c2ac4  fastapi-0.115.6.tar.gz
+sha256  9ec46f7addc14ea472958a96aae5b5de65f39721a46aaf5705c480d9a8b76654  fastapi-0.115.6.tar.gz
 # Locally computed sha256 checksums
 sha256  4ec89ffc81485b97fec584b2d4a961032eeffe834453894fd9c1274906cc744e  LICENSE
diff --git a/package/python-fastapi/python-fastapi.mk b/package/python-fastapi/python-fastapi.mk
index 95eb565b23..9f275ad8a8 100644
--- a/package/python-fastapi/python-fastapi.mk
+++ b/package/python-fastapi/python-fastapi.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_FASTAPI_VERSION = 0.115.4
+PYTHON_FASTAPI_VERSION = 0.115.6
 PYTHON_FASTAPI_SOURCE = fastapi-$(PYTHON_FASTAPI_VERSION).tar.gz
-PYTHON_FASTAPI_SITE = https://files.pythonhosted.org/packages/a9/db/5781f19bd30745885e0737ff3fdd4e63e7bc691710f9da691128bb0dc73b
+PYTHON_FASTAPI_SITE = https://files.pythonhosted.org/packages/93/72/d83b98cd106541e8f5e5bfab8ef2974ab45a62e8a6c5b5e6940f26d2ed4b
 PYTHON_FASTAPI_SETUP_TYPE = pep517
 PYTHON_FASTAPI_LICENSE = MIT
 PYTHON_FASTAPI_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
