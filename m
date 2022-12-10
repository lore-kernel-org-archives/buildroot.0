Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4E32C4332F
	for <buildroot@archiver.kernel.org>; Sat, 10 Dec 2022 21:17:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 51A6560AE4;
	Sat, 10 Dec 2022 21:17:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 51A6560AE4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id E3VV9GpuRRJV; Sat, 10 Dec 2022 21:17:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8DEEC60A70;
	Sat, 10 Dec 2022 21:17:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8DEEC60A70
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E688B1BF3DF
 for <buildroot@lists.busybox.net>; Sat, 10 Dec 2022 21:17:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C0257409E3
 for <buildroot@lists.busybox.net>; Sat, 10 Dec 2022 21:17:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C0257409E3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id t-NcVVfbyx01 for <buildroot@lists.busybox.net>;
 Sat, 10 Dec 2022 21:17:47 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4350A409DD
Received: from mail-io1-xd2e.google.com (mail-io1-xd2e.google.com
 [IPv6:2607:f8b0:4864:20::d2e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4350A409DD
 for <buildroot@buildroot.org>; Sat, 10 Dec 2022 21:17:47 +0000 (UTC)
Received: by mail-io1-xd2e.google.com with SMTP id y4so2282490iof.0
 for <buildroot@buildroot.org>; Sat, 10 Dec 2022 13:17:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=XRBCMxs6MfKruqa9pIXBN8UpigGUL+3hZFVVGlRGsV8=;
 b=fYKKIouz0F8mjOVGHBSKtPlUAp/Hxck2CWzTMIklQ/AtEaDOvppP3t/soNRISztRsT
 IeCAtXV8AC7eXhoFBUOtii6RMvRWrGmphg13MLIJJqKJjAH14WfJhErt3BARreAQ3U38
 cjkt/Ihos5/FVT8ZGvzKDOqFweiYvGbChB42v0ArS7jR62zSRRubL8dpKeEGtD8Btchv
 umkl1GHFdleJxihxifSPrgC3B3i4E1YMEs87u8B/pzTR6irA8LHyShFyfM1tllu3DfBt
 20hP6reOKM1/LYD0q7+hkGiBq7nVGMyHu67YNxuiDs03004AZSvZoXvmf+WTHUMYYqXi
 OzYw==
X-Gm-Message-State: ANoB5pnU/HtwXSwuYgOkMmWTd9AvHTgY8JiVG5Q5In5eYB8TVxAC4UU2
 MGtY6HvGUKn1ATvdRHfYd4a3D5mEQS9gWqQe
X-Google-Smtp-Source: AA0mqf4iuzafpW19ynlm2qZjpHRDPFf4FwsYjtD1AjSiSCHMZClzI+3AK5YWadGZdRbclQ8Tjv3mBQ==
X-Received: by 2002:a6b:f104:0:b0:6e2:dfef:d54 with SMTP id
 e4-20020a6bf104000000b006e2dfef0d54mr3772029iog.17.1670707066137; 
 Sat, 10 Dec 2022 13:17:46 -0800 (PST)
Received: from james-x399.localdomain (71-33-132-231.hlrn.qwest.net.
 [71.33.132.231]) by smtp.gmail.com with ESMTPSA id
 d12-20020a023f0c000000b00375217ea9b6sm1701557jaa.45.2022.12.10.13.17.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 10 Dec 2022 13:17:45 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 10 Dec 2022 14:17:44 -0700
Message-Id: <20221210211744.3682923-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=XRBCMxs6MfKruqa9pIXBN8UpigGUL+3hZFVVGlRGsV8=;
 b=U2lU0aWlREPkTvG7qjbyM1G5orzceNG7vUp1Md5tEnm0i+TgPKE02ftzcYoE3HOK1K
 Z8aQ9FG4ZSJjysDNUB/HXRUCZGKFmZ5Wg9EcnARZbRyLuE53S9d8snbdM9Rg1qU7RDau
 Quxr7Xp8nUCTzQd+Y6x+YYhIckkCS5BVS2rK0jDQYQwuN93x1ztPnhZQ9Jifc9GaEwQ3
 SPC55hCYgO1e2yZs5Qv1F1rW0adRNC4/Yut4zV4dxMPGLo924QbZOC5auta0zm7VJS9X
 RrtLvd2NEL+Www2Zj0+bIUTXz0A9wOvAVHq82Rcl/y1gQ0a9zSNdkETNtQmsWk8ZQOic
 Hn8w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=U2lU0aWl
Subject: [Buildroot] [PATCH 1/1] package/python-zopfli: bump to version 0.2.2
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
 package/python-zopfli/python-zopfli.hash | 4 ++--
 package/python-zopfli/python-zopfli.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-zopfli/python-zopfli.hash b/package/python-zopfli/python-zopfli.hash
index 969ed97992..29bdfe5e5b 100644
--- a/package/python-zopfli/python-zopfli.hash
+++ b/package/python-zopfli/python-zopfli.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/zopfli/json
-md5  505ea595d86b8a7fec55620c839a4859  zopfli-0.2.1.zip
-sha256  e5263d2806e2c1ccb23f52b2972a235d31d42f22f3fa3032cc9aded51e9bf2c6  zopfli-0.2.1.zip
+md5  0c1e41e5403524e0180f3ed9aaa356ec  zopfli-0.2.2.zip
+sha256  2d49db7540d9991976af464ebc1b9ed12988c04d90691bcb51dc4a373a9e2afc  zopfli-0.2.2.zip
 # Locally computed sha256 checksums
 sha256  018b1cb87efdf7a04c2fcc13d57ed63f62149113fb207b27ea13430d64f13513  COPYING
diff --git a/package/python-zopfli/python-zopfli.mk b/package/python-zopfli/python-zopfli.mk
index 689634fefa..d6af6e4b5f 100644
--- a/package/python-zopfli/python-zopfli.mk
+++ b/package/python-zopfli/python-zopfli.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_ZOPFLI_VERSION = 0.2.1
+PYTHON_ZOPFLI_VERSION = 0.2.2
 PYTHON_ZOPFLI_SOURCE = zopfli-$(PYTHON_ZOPFLI_VERSION).zip
-PYTHON_ZOPFLI_SITE = https://files.pythonhosted.org/packages/91/25/ba6f370e18359292f05ca4df93642eb7d1c424721ef61f61b8610a63d0c5
+PYTHON_ZOPFLI_SITE = https://files.pythonhosted.org/packages/9a/ed/d004d5737f9546167eecf0ecd995ee1a796703e512deb2f2ea26cdbe4b3e
 PYTHON_ZOPFLI_SETUP_TYPE = setuptools
 PYTHON_ZOPFLI_LICENSE = Apache-2.0
 PYTHON_ZOPFLI_LICENSE_FILES = COPYING
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
