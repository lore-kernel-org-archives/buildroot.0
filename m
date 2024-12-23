Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C80BE7718B
	for <buildroot@archiver.kernel.org>; Mon, 23 Dec 2024 14:53:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 394308164B;
	Mon, 23 Dec 2024 14:53:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OuGifYxoCWhE; Mon, 23 Dec 2024 14:53:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 53A4881758
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 53A4881758;
	Mon, 23 Dec 2024 14:53:44 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 14BE3757
 for <buildroot@buildroot.org>; Mon, 23 Dec 2024 14:53:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E0251606B4
 for <buildroot@buildroot.org>; Mon, 23 Dec 2024 14:53:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XFtj_2A2MsNT for <buildroot@buildroot.org>;
 Mon, 23 Dec 2024 14:53:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::135; helo=mail-il1-x135.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 0495E606B6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0495E606B6
Received: from mail-il1-x135.google.com (mail-il1-x135.google.com
 [IPv6:2607:f8b0:4864:20::135])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0495E606B6
 for <buildroot@buildroot.org>; Mon, 23 Dec 2024 14:53:41 +0000 (UTC)
Received: by mail-il1-x135.google.com with SMTP id
 e9e14a558f8ab-3a9d9c86920so14612945ab.2
 for <buildroot@buildroot.org>; Mon, 23 Dec 2024 06:53:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734965621; x=1735570421;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=3tGUyXry7j6NoN2vdcy6H26SDpkFy6kUGm/b+UrS3AA=;
 b=cVtIRJhBVT5OKn84iYKZeScl9AdoXWiwxG5Iu9iR9sKfNwuEgVWICCtheftsJ1Bf4u
 /vCKeBDFVJLqUoKXwkr9EhDO+JAMgYHaBYQIl4Ru27haRTpjXrYRhY4bK6iu5Q3yM0gy
 hCycLfZ4xbs21UlMTIovnekJK2t0ULlFegnrm5U2YxuG5l7iv0MqueRth+XUVti4+xh4
 cW6T8iVrVk+sBwnpfIaBto3REnNTsTfawlXGJk2yVWVmritSN4/txKk5mn6AiteIX7g9
 olfiXZ9fMBlfiCwB69cozOphtn32DVcvs724wJBcQPqgMBebaOsmTp+YzIuMbmidXzYu
 +Vbw==
X-Gm-Message-State: AOJu0YzHqks2X21F3uDT51571e35WdPvKQPtpnEgoak67KC7wIvokNyO
 fgFF9XNGYc3nxgbS2ZXXCX1wKrVQlnKct47Hvg9IhACpv9mAKC+75rhrpI5kpEo=
X-Gm-Gg: ASbGncvW7Oqt+Fkp7P8Oua4+yPU+BakqWXpUDC0FeX+lhKwkgfc1/pu9YOaf6KhVMLl
 buiLUSTxMZgiF7d7dIsGVzk5ybol6rBaRdWkwWZ0qbhqD762UbjGkYhXrfgbu74wpy7a1G2kYxl
 zbYzt0mpV+OcRyu5eRkL4H25DWFPg93G6ntZBivnwRTVtz8xa1gbfrbgSQ2k16Ci3jf1lHyq8BR
 HCYioHMI2b817MQlFtgwqkO0TxdTLQ8+yAZz9ZGL1B1t2SMMK1Hd70iDKRiTV2TiLatDXStxgOU
 kwabliurwQp4j9lKsJgfBBYOciDhwMRwEg==
X-Google-Smtp-Source: AGHT+IEnK1nrdTg5A6dgScrrfoggKCnToYA2V1z1jECFnDEk+eltiQqTPOSFy30WBcUHB7lwm9Xqow==
X-Received: by 2002:a05:6e02:1448:b0:3a7:7a68:44e2 with SMTP id
 e9e14a558f8ab-3c2d48a3763mr103037345ab.15.1734965620770; 
 Mon, 23 Dec 2024 06:53:40 -0800 (PST)
Received: from james-x399.localdomain (71-218-105-232.hlrn.qwest.net.
 [71.218.105.232]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4e68c1db8dbsm2206617173.132.2024.12.23.06.53.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Dec 2024 06:53:40 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 23 Dec 2024 07:53:38 -0700
Message-Id: <20241223145338.1721041-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1734965621; x=1735570421; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=3tGUyXry7j6NoN2vdcy6H26SDpkFy6kUGm/b+UrS3AA=;
 b=jMAs3DbvUrkO/8Ct6dgHeSUVY0YlG4/HtyIkcPBD3CYVuMy0zxcfckNd3f09kjPSRu
 h29OBEv/O39pFKt8xVijn9AMVI6VccomlVPzeXkWIEkXPCO6fmxhBnDFLZlVkRuj/Iu5
 q79AI9tcF3VttZMEn8IO31OnDRJXIkpTAz2IVksZa4ieKyKBJaFZrn5oOLrPfZ9a4IFt
 OlNNi+kHq8sKXgElHA5nHsvxi3LwjqakXDmpPkR06gXKs70eA/LeSafbG63hvuyGRfqz
 lbTVlBLrpa7QSuZ4JCJvNbPyF2VMs0k57Hxt6tjYiP0tK5oEtXzjYAlNpJGnYwSlrrw9
 cjow==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=jMAs3Dbv
Subject: [Buildroot] [PATCH 1/1] package/python-aiorwlock: bump to version
 1.5.0
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

Migrate from setuptools to poetry build backend.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-aiorwlock/python-aiorwlock.hash | 4 ++--
 package/python-aiorwlock/python-aiorwlock.mk   | 6 +++---
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-aiorwlock/python-aiorwlock.hash b/package/python-aiorwlock/python-aiorwlock.hash
index 50a670280f..6ba5269c16 100644
--- a/package/python-aiorwlock/python-aiorwlock.hash
+++ b/package/python-aiorwlock/python-aiorwlock.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/aiorwlock/json
-md5  669ff2887392cfa393205cea23661c2f  aiorwlock-1.4.0.tar.gz
-sha256  4cea5bec4e9d03533a26919299394822a1422aa519bca9dd09178ec490f8d1cc  aiorwlock-1.4.0.tar.gz
+md5  094d8676f4fa812ab35225e3737edbc8  aiorwlock-1.5.0.tar.gz
+sha256  b529da24da659bdedcf68faf216595bde00db228c905197ac554773620e7fd2f  aiorwlock-1.5.0.tar.gz
 # Locally computed sha256 checksums
 sha256  fa99ee9d7727194a9f8994c67d1948dc42e8e00ab809fd4a47acfae119d11403  LICENSE
diff --git a/package/python-aiorwlock/python-aiorwlock.mk b/package/python-aiorwlock/python-aiorwlock.mk
index 4209ae407c..7f41b50442 100644
--- a/package/python-aiorwlock/python-aiorwlock.mk
+++ b/package/python-aiorwlock/python-aiorwlock.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-PYTHON_AIORWLOCK_VERSION = 1.4.0
+PYTHON_AIORWLOCK_VERSION = 1.5.0
 PYTHON_AIORWLOCK_SOURCE = aiorwlock-$(PYTHON_AIORWLOCK_VERSION).tar.gz
-PYTHON_AIORWLOCK_SITE = https://files.pythonhosted.org/packages/ba/c5/882b4c89d71d6f9c7d0d8dee18d267025e71d4c3241eb3b16ab39105a0d1
-PYTHON_AIORWLOCK_SETUP_TYPE = setuptools
+PYTHON_AIORWLOCK_SITE = https://files.pythonhosted.org/packages/c5/bf/d1ddcd676be027a963b3b01fdf9915daf4590b4dfd03bf1c8c2858aac7e3
+PYTHON_AIORWLOCK_SETUP_TYPE = poetry
 PYTHON_AIORWLOCK_LICENSE = Apache-2.0
 PYTHON_AIORWLOCK_LICENSE_FILES = LICENSE
 
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
