Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB4B9E7718B
	for <buildroot@archiver.kernel.org>; Mon, 23 Dec 2024 16:44:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A64084109F;
	Mon, 23 Dec 2024 16:44:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xZiTCnCn6mMU; Mon, 23 Dec 2024 16:44:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8BD80410B6
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8BD80410B6;
	Mon, 23 Dec 2024 16:44:25 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id C9467D8
 for <buildroot@buildroot.org>; Mon, 23 Dec 2024 16:44:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C4C65606B4
 for <buildroot@buildroot.org>; Mon, 23 Dec 2024 16:44:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id q8J6e8mmeaw0 for <buildroot@buildroot.org>;
 Mon, 23 Dec 2024 16:44:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::133; helo=mail-il1-x133.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org D1C11606A8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D1C11606A8
Received: from mail-il1-x133.google.com (mail-il1-x133.google.com
 [IPv6:2607:f8b0:4864:20::133])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D1C11606A8
 for <buildroot@buildroot.org>; Mon, 23 Dec 2024 16:44:22 +0000 (UTC)
Received: by mail-il1-x133.google.com with SMTP id
 e9e14a558f8ab-3a77980fe3aso16498395ab.0
 for <buildroot@buildroot.org>; Mon, 23 Dec 2024 08:44:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734972261; x=1735577061;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=dsOaBamevyo66+SSSzNtIrQJjjJ3ddAdvRUjknCudk0=;
 b=s3HfV5w4V3q3JCpdrR6srV715ngkh86ATrv3dyQVJrQrBBCKRAxtSZ5rW0DD6eH35R
 5NwIDT6RDzDZH2sfiw5XBkyYvV4eXKcblQGoG/IcvfnPoAbJ/IPiDVYck6O0jBGduSqW
 1Uqur97B4MAK/sUIDlz2ddgPAeSpOB03poKksUO3f61X4oNEeO9YxRUstV0bH+DGBjvP
 IBc5aPOEVHt4j/cRlshtm5UZ7cDJJWkaLmYMzGoTIdhMDnQ/KbqpCcyWPnuNXRP4Cg9O
 Kgksw3dgeqzXFOZ8FRxiddd+e0uBlEzwT9Eoe5M/AWlTmDSemybPpYraVu1uMa7OgiRA
 3hgg==
X-Gm-Message-State: AOJu0YwIjWX5tp28zzUj4jibmowifjZUeMmQ4hqTiNmrdEjF0wJvEoly
 ObT8Se5m7tOtLiomlZEYuiH1LPn7Xhj/wYyv35fQiMQI3C5SQwqhKefRN8QZ7+w=
X-Gm-Gg: ASbGncvTY1DT/ZhMghIjZQDCHh0NwVkj2E2ppQWBS0vcN4irTLE5TL+Fce1x3qnrfSu
 tQrrUHgfaDNB7cwNy9dd2p8Fm3qtxFJoejCxRZNWbD1d+ovqVVxAdEX5ZfumjHdsN7En7Okz2V7
 5tRhff6Hrt5E2I9E+36SDZtMF2N6ogB9B5Bk70CZdlBFUPMRKD3PDMoWuVZjo66vZmWzUMfmHNl
 35rsXOHsA+jYAbnUkNQOmw5hLj2JM9BsB+fkxALxdqYq0JMZhfOvc5SoUyzW6snrEs22KrjCW/o
 Hr8GHATUbDCEyvNULk9i/3vvq+xwV6UUWQ==
X-Google-Smtp-Source: AGHT+IHUqpYM8dB/vj3zxUrM/nTbLNe2TQc/exzSXjbQzUchNiCyaSwABWzuczN1YDKs1pf7mLrQ9w==
X-Received: by 2002:a05:6e02:349c:b0:3a7:d02b:f653 with SMTP id
 e9e14a558f8ab-3c2f9815c0emr124553605ab.0.1734972261587; 
 Mon, 23 Dec 2024 08:44:21 -0800 (PST)
Received: from james-x399.localdomain (71-218-105-232.hlrn.qwest.net.
 [71.218.105.232]) by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-3c0e47d719bsm24489055ab.79.2024.12.23.08.44.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Dec 2024 08:44:21 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 23 Dec 2024 09:44:19 -0700
Message-Id: <20241223164419.1875261-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1734972261; x=1735577061; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=dsOaBamevyo66+SSSzNtIrQJjjJ3ddAdvRUjknCudk0=;
 b=D9YxkZDupZ3mm5qehsGkYKvloHh1q+Ym+X0A3T3yAtR4D2J84x7IrGoujpOjSn1Ibp
 yeH43h4WJa7yi3YTj90D6xDBFqcDfGCcK+ydpGr+ZcKjcy/DOsB/ipK3s6SLOsJvW7i/
 bFLYpVUsmQGbMd9jULTOL51np9xL2nEGEf5Mgs3i4KjyFLbcaRvRbJD74auEBIpovr77
 XJYo7M0vutVgTa7+HNIWna/kcde1oZ6QD0FAHVjyueb4tFfeMjVoRdgdSHshP8lhVAJT
 gCz3gtjK16lT+K4sHTA7U+RbUam73S7lQKSV7Quvea9+VZZn8tUuZONkwQ28DAl+/HTX
 QGEg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=D9YxkZDu
Subject: [Buildroot] [PATCH 1/1] package/python-fonttools: bump to version
 4.55.3
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
 package/python-fonttools/python-fonttools.hash | 4 ++--
 package/python-fonttools/python-fonttools.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-fonttools/python-fonttools.hash b/package/python-fonttools/python-fonttools.hash
index 3c691fbd89..16209aaf84 100644
--- a/package/python-fonttools/python-fonttools.hash
+++ b/package/python-fonttools/python-fonttools.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/fonttools/json
-md5  ed2b78a3c9b7982608ee605f1fd952b0  fonttools-4.54.1.tar.gz
-sha256  957f669d4922f92c171ba01bef7f29410668db09f6c02111e22b2bce446f3285  fonttools-4.54.1.tar.gz
+md5  00874aa8f3bea8d706bec0e6882c43e2  fonttools-4.55.3.tar.gz
+sha256  3983313c2a04d6cc1fe9251f8fc647754cf49a61dac6cb1e7249ae67afaafc45  fonttools-4.55.3.tar.gz
 # Locally computed sha256 checksums
 sha256  6787208f83f659ccbc2223b2fde952ffa6f7e8aca62f1a8a2bf5bc51bb1b2383  LICENSE
diff --git a/package/python-fonttools/python-fonttools.mk b/package/python-fonttools/python-fonttools.mk
index ebb7f14302..d235cf8869 100644
--- a/package/python-fonttools/python-fonttools.mk
+++ b/package/python-fonttools/python-fonttools.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_FONTTOOLS_VERSION = 4.54.1
+PYTHON_FONTTOOLS_VERSION = 4.55.3
 PYTHON_FONTTOOLS_SOURCE = fonttools-$(PYTHON_FONTTOOLS_VERSION).tar.gz
-PYTHON_FONTTOOLS_SITE = https://files.pythonhosted.org/packages/11/1d/70b58e342e129f9c0ce030029fb4b2b0670084bbbfe1121d008f6a1e361c
+PYTHON_FONTTOOLS_SITE = https://files.pythonhosted.org/packages/76/61/a300d1574dc381393424047c0396a0e213db212e28361123af9830d71a8d
 PYTHON_FONTTOOLS_SETUP_TYPE = setuptools
 PYTHON_FONTTOOLS_LICENSE = MIT
 PYTHON_FONTTOOLS_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
