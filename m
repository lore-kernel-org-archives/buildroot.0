Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BE5ACAC597
	for <buildroot@archiver.kernel.org>; Mon, 15 Sep 2025 22:26:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 014AC406B1;
	Mon, 15 Sep 2025 22:26:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TvMA5CxPoa3s; Mon, 15 Sep 2025 22:26:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 34CC44069D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 34CC44069D;
	Mon, 15 Sep 2025 22:26:19 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id BD60E22F
 for <buildroot@buildroot.org>; Mon, 15 Sep 2025 22:26:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A3D33404E0
 for <buildroot@buildroot.org>; Mon, 15 Sep 2025 22:26:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id intgvy_PQp0g for <buildroot@buildroot.org>;
 Mon, 15 Sep 2025 22:26:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::133; helo=mail-il1-x133.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org C973840103
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C973840103
Received: from mail-il1-x133.google.com (mail-il1-x133.google.com
 [IPv6:2607:f8b0:4864:20::133])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C973840103
 for <buildroot@buildroot.org>; Mon, 15 Sep 2025 22:26:16 +0000 (UTC)
Received: by mail-il1-x133.google.com with SMTP id
 e9e14a558f8ab-423fc1532bdso30524495ab.1
 for <buildroot@buildroot.org>; Mon, 15 Sep 2025 15:26:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757975175; x=1758579975;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=LxVI48QLCLRZ8Burf2bUIRXs2Z+MglUdvBZuB3yF8rQ=;
 b=qM1LZY6pe5uhzhuPlrIZiLONm4Vovz573qxDyBNrrzhs61xBn6k1QlbVvB/f0BJI8R
 6riD+zietYDCFOOM+tbha/49SGKUJrT1YlwW9Id/YiRirs/we9OBf5cfzACMa1ugOztg
 Go8RiHVaaSCxjBBW52nusdzM6nGKiTL8WgaKYo3B0jXw6jA5zrL41wdEzJi/dYScGvg6
 3a5P6unEj3utQA03n73MfrpjAhU1N+9ZpUnTkf7oqSWathHHTs7sYSSWPC3kT8VV9qs2
 cWLAk2khmkSTy12lwjE3gH51hxJ8hLLdFpwFTuv85kB7t4oruz0NiJ0+uo3ezjOwLXd5
 vElQ==
X-Gm-Message-State: AOJu0Yxai8GjJNVvo9UpjXWP75pJD3X0MRoxahTJqCi/t067JT8qQ+e6
 eUCZ1VIxBueReQhpy4L4nlB8nLDQQo8n0PVuNWEa6PdkrOSekIFRnT4LZmjX1g==
X-Gm-Gg: ASbGncsFfR4z1KZIv0ODN8g0jJdAiGRqwDC+uoksrjh5PLFgXi3EcNTnkbDKHYx4lI/
 N9yR19yPLFCVzAIVIy9gr8zk7guCrYIReHKZnhWt9LDYFx345OcAHDB0M1D/eVAdJrcGbCxu3Kj
 pvtLBos6wU2ysSQxzmw+Sv3nyHWBW1Cz75BDSUsmYH1bTaw2Y7gQEHpeFWJWYbLuFtBceUbHNb4
 98kGNlFcutjbBHrj10eSpDin1AthD1AdTqJMwT6P9Xc2fVgl/qk6kYP9Fe+nC2AfKsxebE/y8Af
 eg4CXr/SzvZlhv2u6Oya8oE7NgK0/6CD3Z4exnydLWgdMnSnvh2Wf4Fym7g3btkWmUYFWJvpS4G
 bNAYrJFWqkoDi8SuoxZ2bGB7yZCtjDGHo/jpYTLwx0grfsO1uHrZTguci4sSObtdbvjjCRwSInA
 Hjq1cA7URuX0Q=
X-Google-Smtp-Source: AGHT+IHzmnZpSjbHGJ85FApkL2W5ZJpxNzimg/GOHYAuMRypNDStBQ0TKm9XrJboI8nzMiivQLrCkQ==
X-Received: by 2002:a05:6e02:164b:b0:405:59ba:4f10 with SMTP id
 e9e14a558f8ab-4209f692828mr183794315ab.14.1757975175299; 
 Mon, 15 Sep 2025 15:26:15 -0700 (PDT)
Received: from james-x399.localdomain (71-218-100-179.hlrn.qwest.net.
 [71.218.100.179]) by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-41df02f4e8csm64759095ab.19.2025.09.15.15.26.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Sep 2025 15:26:14 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 15 Sep 2025 16:26:13 -0600
Message-ID: <20250915222613.1653854-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1757975175; x=1758579975; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=LxVI48QLCLRZ8Burf2bUIRXs2Z+MglUdvBZuB3yF8rQ=;
 b=VBy8cCWh+B22I0SM0TxXVKa/jWUftSNZnU/xYZ2uCSxpH/T8C1XskqsZCbnjOOz1Fe
 T4fb8nrsQuzdgOMgn/AL1JynMUVZk1qWJgsTrxDIoGJOEkQhc6e1TbMTmaISzCcvN2bh
 HQqr3a53BlEd3wyHhQvmTnX0C9wZrLH2HxK0MjjZf7yp+DgmaRbU37IY1Bqrfw+mn/F4
 pFKBj09fC4h2NCDqspHHzY/dvtE/bB+FWrLg9hk6C0hlyCnjZPW5obLoLTJ0H0GonkZW
 CJvcBtb+hViO8WQyuoYO8DMvH/9SpEyMsHLbplcGAUyt8hZ56iuLmFuseu02KRow4LwP
 HanQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=VBy8cCWh
Subject: [Buildroot] [PATCH 1/1] package/python-cffi: bump to version 2.0.0
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

License has changed due to license change from regular MIT to
MIT-no-attribution:
https://github.com/python-cffi/cffi/commit/67a170dc7972dc9361743690b38da3d963b200ef

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-cffi/python-cffi.hash | 6 +++---
 package/python-cffi/python-cffi.mk   | 6 +++---
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/python-cffi/python-cffi.hash b/package/python-cffi/python-cffi.hash
index 2847d38b55..347a6f3ede 100644
--- a/package/python-cffi/python-cffi.hash
+++ b/package/python-cffi/python-cffi.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/cffi/json
-md5  4336ca58b2df0cc3b163884d5fa2e5e2  cffi-1.17.1.tar.gz
-sha256  1c39c6016c32bc48dd54561950ebd6836e1670f2ae46128f67cf49e789c52824  cffi-1.17.1.tar.gz
+md5  5e897f6251e614f6bd128a73e81801a4  cffi-2.0.0.tar.gz
+sha256  44d1b5909021139fe36001ae048dbdde8214afa20200eda0f64c068cac5d5529  cffi-2.0.0.tar.gz
 # Locally computed sha256 checksums
-sha256  04b80f5b077bbed68808cfebadeb5e3523f2a8c9a96495c587bd96df1eac2a33  LICENSE
+sha256  5ba24ddc57067f9249add644c3afc41a5d6dc37e23433ef759d95df370b0af63  LICENSE
diff --git a/package/python-cffi/python-cffi.mk b/package/python-cffi/python-cffi.mk
index 152009e8ca..ab9068b101 100644
--- a/package/python-cffi/python-cffi.mk
+++ b/package/python-cffi/python-cffi.mk
@@ -4,12 +4,12 @@
 #
 ################################################################################
 
-PYTHON_CFFI_VERSION = 1.17.1
+PYTHON_CFFI_VERSION = 2.0.0
 PYTHON_CFFI_SOURCE = cffi-$(PYTHON_CFFI_VERSION).tar.gz
-PYTHON_CFFI_SITE = https://files.pythonhosted.org/packages/fc/97/c783634659c2920c3fc70419e3af40972dbaf758daa229a7d6ea6135c90d
+PYTHON_CFFI_SITE = https://files.pythonhosted.org/packages/eb/56/b1ba7935a17738ae8453301356628e8147c79dbb825bcbc73dc7401f9846
 PYTHON_CFFI_SETUP_TYPE = setuptools
 PYTHON_CFFI_DEPENDENCIES = host-pkgconf libffi
-PYTHON_CFFI_LICENSE = MIT
+PYTHON_CFFI_LICENSE = MIT-0
 PYTHON_CFFI_LICENSE_FILES = LICENSE
 
 # This host package uses pkg-config to find libffi, so we have to
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
