Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9E70C4167B
	for <buildroot@archiver.kernel.org>; Sun, 26 Nov 2023 02:23:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3BB2D60AB5;
	Sun, 26 Nov 2023 02:23:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3BB2D60AB5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 25QaBWyFl0r2; Sun, 26 Nov 2023 02:23:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A528A60AA4;
	Sun, 26 Nov 2023 02:23:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A528A60AA4
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 79B7E1BF282
 for <buildroot@lists.busybox.net>; Sun, 26 Nov 2023 02:23:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4B50960AA4
 for <buildroot@lists.busybox.net>; Sun, 26 Nov 2023 02:23:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4B50960AA4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3X1LThB_GYS3 for <buildroot@lists.busybox.net>;
 Sun, 26 Nov 2023 02:23:18 +0000 (UTC)
Received: from mail-io1-xd2a.google.com (mail-io1-xd2a.google.com
 [IPv6:2607:f8b0:4864:20::d2a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 409A660AA0
 for <buildroot@buildroot.org>; Sun, 26 Nov 2023 02:23:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 409A660AA0
Received: by mail-io1-xd2a.google.com with SMTP id
 ca18e2360f4ac-7a98fdeaac7so115588239f.1
 for <buildroot@buildroot.org>; Sat, 25 Nov 2023 18:23:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700965397; x=1701570197;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=fC4GAf+8xqj9laKpEJwTA7qPxqj45xOF6Gm6GvnPu3w=;
 b=m6/+NJ9wJigdoGZvGFG2zdzVz0jG2wQsZqphgYLmr0lquo2oBfjl5h7u40c0AEsfxc
 /5CNiuobDTyylGrmA/1mQLH+7CW+526tGpbPUumqwq0JEFoMvt154dV3zG5KmgXEDKn0
 o2xPK1OPykYbQwfMGuLxiQvyDPZ1WLEs/kAtE1x0dDgcQCIM0vvpC20JoYJp+7O56uaV
 7J5fgWDOv5BVERFe/JbbIgsBH1ax1DRl+s+6MmGfhR7tH+HZeRdbVb07WOewlsTh3pTS
 l/szdSaktB2mvSGq/5zIP7R9dFb1DfUNgk3ZVSK9nxhvbQK7o33pKuKrQHjVqtHLLkII
 cK1Q==
X-Gm-Message-State: AOJu0Yw7IYYUt5AWA4EvdMnV+Q80wV9jmbTa8nGjSU1ofYSmP7kZGB3f
 hicGdV/SnqPfnK1rPRWrDZ8wtn9Y8R0=
X-Google-Smtp-Source: AGHT+IF5bjW5p9n7Ru7m1E0EO7xq5zMTQ15CCTI4MDWS6txCCGv6ShVC59VaDh79H2iaXKGDnDRycQ==
X-Received: by 2002:a05:6e02:12e7:b0:357:4a63:2ad2 with SMTP id
 l7-20020a056e0212e700b003574a632ad2mr4368622iln.21.1700965396774; 
 Sat, 25 Nov 2023 18:23:16 -0800 (PST)
Received: from james-x399.localdomain (97-118-243-253.hlrn.qwest.net.
 [97.118.243.253]) by smtp.gmail.com with ESMTPSA id
 by18-20020a056e02261200b003595d948c42sm2047367ilb.5.2023.11.25.18.23.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Nov 2023 18:23:15 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 25 Nov 2023 19:23:13 -0700
Message-Id: <20231126022313.1556191-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1700965397; x=1701570197; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=fC4GAf+8xqj9laKpEJwTA7qPxqj45xOF6Gm6GvnPu3w=;
 b=Zejll8pDBg2WnTvBRvKxdROUKH3tpIrwPjSknU7pJ4OcMLrNbAIzYdbGt0KjHlPuv2
 BjBLqDn07G2F6yK4a1fMRFJmzFxmSh40q6jQfoXuOOcMbZtvQSmHLOgPcnHUdip8QJwx
 Kt7gww4Oa5rY2qFksu6bJbPxWFHeYA/7TPjLw60b/skw+16s6Va46S6ziqt8Lj4F0CmM
 0KD+/k6MhKzA1d8d0a9DQHhmb2bp/FuGU6XyteVEw9fQwyH4S3QQoQ3MWs+VRr2i42gX
 C9fDcVSPkBYrI6nJvMWm62QgnomAG5yT134t3tYeYgmdJ16BluR31BAunHKn5rHqoxnX
 aK9A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Zejll8pD
Subject: [Buildroot] [PATCH 1/1] package/python-bcrypt: migrate to
 setuptools-rust infrastructure
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

Migrate from generic setuptools infrastructure to setuptools-rust
infrastructure.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-bcrypt/python-bcrypt.mk | 15 ++-------------
 1 file changed, 2 insertions(+), 13 deletions(-)

diff --git a/package/python-bcrypt/python-bcrypt.mk b/package/python-bcrypt/python-bcrypt.mk
index cbd6855d9c..96146a3512 100644
--- a/package/python-bcrypt/python-bcrypt.mk
+++ b/package/python-bcrypt/python-bcrypt.mk
@@ -7,20 +7,9 @@
 PYTHON_BCRYPT_VERSION = 4.0.1
 PYTHON_BCRYPT_SOURCE = bcrypt-$(PYTHON_BCRYPT_VERSION).tar.gz
 PYTHON_BCRYPT_SITE = https://files.pythonhosted.org/packages/8c/ae/3af7d006aacf513975fd1948a6b4d6f8b4a307f8a244e1a3d3774b297aad
-PYTHON_BCRYPT_SETUP_TYPE = setuptools
+PYTHON_BCRYPT_SETUP_TYPE = setuptools-rust
 PYTHON_BCRYPT_LICENSE = Apache-2.0
 PYTHON_BCRYPT_LICENSE_FILES = LICENSE
-PYTHON_BCRYPT_DEPENDENCIES = \
-	host-python-setuptools-rust \
-	host-rustc
-PYTHON_BCRYPT_ENV = \
-	$(PKG_CARGO_ENV) \
-	PYO3_CROSS_LIB_DIR="$(STAGING_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)"
-# We need to vendor the Cargo crates at download time
-PYTHON_BCRYPT_DOWNLOAD_POST_PROCESS = cargo
-PYTHON_BCRYPT_DOWNLOAD_DEPENDENCIES = host-rustc
-PYTHON_BCRYPT_DL_ENV = \
-	$(PKG_CARGO_ENV) \
-	BR_CARGO_MANIFEST_PATH=src/_bcrypt/Cargo.toml
+PYTHON_BCRYPT_CARGO_MANIFEST_PATH = src/_bcrypt/Cargo.toml
 
 $(eval $(python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
