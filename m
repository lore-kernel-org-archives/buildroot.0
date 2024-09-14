Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 270AAC0219E
	for <buildroot@archiver.kernel.org>; Sat, 14 Sep 2024 21:31:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B3415405A2;
	Sat, 14 Sep 2024 21:31:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VchXHjofT_BS; Sat, 14 Sep 2024 21:31:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 73CCB40603
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 73CCB40603;
	Sat, 14 Sep 2024 21:31:53 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 18A5B1BF470
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 21:31:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1526280C4C
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 21:31:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Hw0LNqKxm73v for <buildroot@lists.busybox.net>;
 Sat, 14 Sep 2024 21:31:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d33; helo=mail-io1-xd33.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 0F9C980C4A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0F9C980C4A
Received: from mail-io1-xd33.google.com (mail-io1-xd33.google.com
 [IPv6:2607:f8b0:4864:20::d33])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0F9C980C4A
 for <buildroot@buildroot.org>; Sat, 14 Sep 2024 21:31:50 +0000 (UTC)
Received: by mail-io1-xd33.google.com with SMTP id
 ca18e2360f4ac-82aa7c3b482so69164939f.2
 for <buildroot@buildroot.org>; Sat, 14 Sep 2024 14:31:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726349510; x=1726954310;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=6IyXMCngOjcTOWRnZy6GEyJAfKKEyURNo7A1ngYEIPU=;
 b=o6IOKKH/ypZdXVDjgfgFBblEDLzgVX1K+MRpmmamNB4erSeh+gjWOfNXeRpV4XhJi6
 jsCBeAloVu37xZ0uUb/h2lmZEJyPavV67wLwcAq+4j2G4FzOZQu74HDg+TrZra00uMzD
 mxNuYH3s+mhqxMUGK6KOJl+jSsLtwWUVHxYeHx0Fy22uyKLqlqdHFEyCWxsVOmPFOJWq
 o7Q8L/J9Te4SBwBA+JTfJE3L/OKVeKMYMIU4PH03DPcfr1Chb6O1Hd2ujXHUb1CaD2uV
 05USSbXVsnQ5utv66KFywTbYuVrzs4y83yAeE4EHPfwVIE0raHwyEe5gS8hOU1FtGFJC
 jS7A==
X-Gm-Message-State: AOJu0YxQ05tobZrIPF4qBrGSg9evHdj8v0E1uFzivxgBdzHwyeZmeTx1
 IT4SeenPSkFxptz1O1S4Cw/DiUthKRx2yQFniwhA7OKqHT6wishcFY/FSQ==
X-Google-Smtp-Source: AGHT+IE7UiqV6J4sAZwEgSMgO+6r571VZp64FsfWMAYIRe+jdoNdXz0WmE/xthYTFnSzBnptU9g7dA==
X-Received: by 2002:a05:6e02:1a09:b0:375:8b0e:4434 with SMTP id
 e9e14a558f8ab-3a08b78a0b0mr62419955ab.16.1726349509613; 
 Sat, 14 Sep 2024 14:31:49 -0700 (PDT)
Received: from james-x399.localdomain (71-218-252-223.hlrn.qwest.net.
 [71.218.252.223]) by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-3a092e8d268sm6457045ab.71.2024.09.14.14.31.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 14 Sep 2024 14:31:49 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 14 Sep 2024 15:31:47 -0600
Message-Id: <20240914213147.1279228-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726349510; x=1726954310; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=6IyXMCngOjcTOWRnZy6GEyJAfKKEyURNo7A1ngYEIPU=;
 b=ewltGw6zfoUQLntIoc6F12VpUxqN4wjEQ64cXHxFBE75PTIwh1FZmU3dra9s21RAwe
 8NmKNXCG8h59q6sZ58CEO+IRQcApHoZjx+z1qZTdktBFGyOlPCAZnNQoVs2EOKNm+RCE
 bkwEWnbvKNi7alMdE7XNm3VFazpByFxjIR5Rr4u2wEhOb+NsZN1lS7cbF2H7l9kvDJd3
 mABmce4wqaDp+UtiT7Vqf4VSo3nQxoEn+fBH/0hJ1D6Ie8ZBDEObN9lXoo9ZxRho7Sm1
 iZ6TbXVoEK2GJf1bwdtvdI3VQ0Zq9Y/M5lnpzrjQkOjvSK5UacK57Ja30mBSewQnos+Z
 oSLQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=ewltGw6z
Subject: [Buildroot] [PATCH 1/1] package/python-attrs: bump to version 24.2.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-attrs/python-attrs.hash | 4 ++--
 package/python-attrs/python-attrs.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-attrs/python-attrs.hash b/package/python-attrs/python-attrs.hash
index d8c6d147d5..5cd15dbed7 100644
--- a/package/python-attrs/python-attrs.hash
+++ b/package/python-attrs/python-attrs.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/attrs/json
-md5  60588a146fb413a997c7519d77198a5e  attrs-23.2.0.tar.gz
-sha256  935dc3b529c262f6cf76e50877d35a4bd3c1de194fd41f47a2b7ae8f19971f30  attrs-23.2.0.tar.gz
+md5  031a41b703d7fc47ec204d0369b68dcd  attrs-24.2.0.tar.gz
+sha256  5cfb1b9148b5b086569baec03f20d7b6bf3bcacc9a42bebf87ffaaca362f6346  attrs-24.2.0.tar.gz
 # Locally computed sha256 checksums
 sha256  882115c95dfc2af1eeb6714f8ec6d5cbcabf667caff8729f42420da63f714e9f  LICENSE
diff --git a/package/python-attrs/python-attrs.mk b/package/python-attrs/python-attrs.mk
index fb1729e62f..aec96793c6 100644
--- a/package/python-attrs/python-attrs.mk
+++ b/package/python-attrs/python-attrs.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_ATTRS_VERSION = 23.2.0
+PYTHON_ATTRS_VERSION = 24.2.0
 PYTHON_ATTRS_SOURCE = attrs-$(PYTHON_ATTRS_VERSION).tar.gz
-PYTHON_ATTRS_SITE = https://files.pythonhosted.org/packages/e3/fc/f800d51204003fa8ae392c4e8278f256206e7a919b708eef054f5f4b650d
+PYTHON_ATTRS_SITE = https://files.pythonhosted.org/packages/fc/0f/aafca9af9315aee06a89ffde799a10a582fe8de76c563ee80bbcdc08b3fb
 PYTHON_ATTRS_SETUP_TYPE = pep517
 PYTHON_ATTRS_LICENSE = MIT
 PYTHON_ATTRS_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
