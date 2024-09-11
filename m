Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7010EE57CF
	for <buildroot@archiver.kernel.org>; Wed, 11 Sep 2024 20:53:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BEECA60D77;
	Wed, 11 Sep 2024 20:53:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BiScCVCOIkJ7; Wed, 11 Sep 2024 20:53:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3A1DE600B5
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3A1DE600B5;
	Wed, 11 Sep 2024 20:53:33 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 791881BF423
 for <buildroot@lists.busybox.net>; Wed, 11 Sep 2024 20:53:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 677694070B
 for <buildroot@lists.busybox.net>; Wed, 11 Sep 2024 20:53:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WRWOlBCOiDx5 for <buildroot@lists.busybox.net>;
 Wed, 11 Sep 2024 20:53:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::131; helo=mail-il1-x131.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 190AD40BB3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 190AD40BB3
Received: from mail-il1-x131.google.com (mail-il1-x131.google.com
 [IPv6:2607:f8b0:4864:20::131])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 190AD40BB3
 for <buildroot@buildroot.org>; Wed, 11 Sep 2024 20:53:27 +0000 (UTC)
Received: by mail-il1-x131.google.com with SMTP id
 e9e14a558f8ab-39f49600297so1306085ab.1
 for <buildroot@buildroot.org>; Wed, 11 Sep 2024 13:53:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726088006; x=1726692806;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=orsZeAnLIFHCr6lxPvfqrnUGckwaWYhO/co1B95V3Hg=;
 b=Q7gcsD/p4Sjlp6qBw6seOnLS9pzDaayzNxdD3vsEj/QgcEplUsGn2fnhtpM/F1R5hW
 U+N9VfkOb9LDoV0uL7EjvZ+yPbPPwdhb7uHUrBzlXXNUlGPjx7+HdRQp15mJczRKEytv
 tYWdCnsCg91UnGGJnP/frCB7PwCw0FakuPxNFZHmo442j8Ba0JcTBvuN9mDNNaW8Rvb/
 mqhi3V7uCs15vIzwD2G5ePqcMTBvqGU7VVCxhKc3IG8XAYW8IgEYDyoj8Sgwjy/ILLIv
 rGm7Xdotfz+kZvFctDTjpxoxxs11/rxYGmHUAedYh4treCBK121o74BlXhrAZrG6viSG
 DPzA==
X-Gm-Message-State: AOJu0YwxDhhk/Jt31MXoTSyHPar2nIiwPIqGrB9csqTvtGjmaF9AdS3T
 +ui55wuxw+QuMHkORK+Vr9j8f7Qiuu+4GOJoCpOobUbVX6d0NXJJRxje5g==
X-Google-Smtp-Source: AGHT+IHHREcayc+MbU7HqLNgrfLBswEJYbkqeutPhvcgSPvUrxcoX92R94G4pr0YrXrz46ZGAqIgKw==
X-Received: by 2002:a05:6e02:168a:b0:375:deb0:4c28 with SMTP id
 e9e14a558f8ab-3a0848c9257mr5622945ab.6.1726088005753; 
 Wed, 11 Sep 2024 13:53:25 -0700 (PDT)
Received: from james-x399.localdomain (97-118-128-240.hlrn.qwest.net.
 [97.118.128.240]) by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-3a05900e293sm28017215ab.64.2024.09.11.13.53.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Sep 2024 13:53:25 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 11 Sep 2024 14:53:22 -0600
Message-Id: <20240911205322.1772612-2-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240911205322.1772612-1-james.hilliard1@gmail.com>
References: <20240911205322.1772612-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726088006; x=1726692806; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=orsZeAnLIFHCr6lxPvfqrnUGckwaWYhO/co1B95V3Hg=;
 b=bNLkR4NaUIWATw5mX4sWdAeZaE34hBdYERBHFIXoEufYTH7S7rvDSEzgYNUn4WU8aR
 RTU+w9pf0O9zVd6TAPU1fJfXKmSf1sNSYb/6zueYkBXIgBDBSKHl3PytODFrH8wMBqVy
 I1Iq8gygbDaltF7oQqOd5MVVCtt/6Ym+Uyb/fEzKUVDB1h0ApkOXe9w3etnXbPDeGczc
 IeLdjEZ0qgqK/3uA12OkIjfVffmaFl15USnDQFxFd0njD4N9wI5ZUXvx37Cn6CvbjMZO
 wVUSGHlxAYGHRIykW+DzLWK1hYT8HDI5kFhvKFWgJ8P6A1MaCM+iLYH6ME4ELHZG9IGS
 +ZVw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=bNLkR4Na
Subject: [Buildroot] [PATCH 2/2] package/python-aiohttp: bump to version
 3.10.5
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Remove no longer required python-async-timeout runtime dependency.

Add new python-aiohappyeyeballs runtime dependency.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-aiohttp/Config.in           | 2 +-
 package/python-aiohttp/python-aiohttp.hash | 4 ++--
 package/python-aiohttp/python-aiohttp.mk   | 4 ++--
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-aiohttp/Config.in b/package/python-aiohttp/Config.in
index 0507106fe7..01a1ed8a3d 100644
--- a/package/python-aiohttp/Config.in
+++ b/package/python-aiohttp/Config.in
@@ -1,8 +1,8 @@
 config BR2_PACKAGE_PYTHON_AIOHTTP
 	bool "python-aiohttp"
 	select BR2_PACKAGE_PYTHON_AIODNS # runtime
+	select BR2_PACKAGE_PYTHON_AIOHAPPYEYEBALLS # runtime
 	select BR2_PACKAGE_PYTHON_AIOSIGNAL # runtime
-	select BR2_PACKAGE_PYTHON_ASYNC_TIMEOUT # runtime
 	select BR2_PACKAGE_PYTHON_ATTRS # runtime
 	select BR2_PACKAGE_PYTHON_BROTLI # runtime
 	select BR2_PACKAGE_PYTHON_FROZENLIST # runtime
diff --git a/package/python-aiohttp/python-aiohttp.hash b/package/python-aiohttp/python-aiohttp.hash
index 542a46f032..76b79e4586 100644
--- a/package/python-aiohttp/python-aiohttp.hash
+++ b/package/python-aiohttp/python-aiohttp.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/aiohttp/json
-md5  f237bcac4ade112b9e7c4b1098197244  aiohttp-3.9.3.tar.gz
-sha256  90842933e5d1ff760fae6caca4b2b3edba53ba8f4b71e95dacf2818a2aca06f7  aiohttp-3.9.3.tar.gz
+md5  29173b702ff6043fa62da8de0795ddea  aiohttp-3.10.5.tar.gz
+sha256  f071854b47d39591ce9a17981c46790acb30518e2f83dfca8db2dfa091178691  aiohttp-3.10.5.tar.gz
 # Locally computed sha256 checksums
 sha256  9f80d0db7d755a941db4572172c270ecbd8f082ba215ddd095985942ed94a9eb  LICENSE.txt
diff --git a/package/python-aiohttp/python-aiohttp.mk b/package/python-aiohttp/python-aiohttp.mk
index 315d68cb2e..be721c1ed5 100644
--- a/package/python-aiohttp/python-aiohttp.mk
+++ b/package/python-aiohttp/python-aiohttp.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_AIOHTTP_VERSION = 3.9.3
+PYTHON_AIOHTTP_VERSION = 3.10.5
 PYTHON_AIOHTTP_SOURCE = aiohttp-$(PYTHON_AIOHTTP_VERSION).tar.gz
-PYTHON_AIOHTTP_SITE = https://files.pythonhosted.org/packages/18/93/1f005bbe044471a0444a82cdd7356f5120b9cf94fe2c50c0cdbf28f1258b
+PYTHON_AIOHTTP_SITE = https://files.pythonhosted.org/packages/ca/28/ca549838018140b92a19001a8628578b0f2a3b38c16826212cc6f706e6d4
 PYTHON_AIOHTTP_SETUP_TYPE = setuptools
 PYTHON_AIOHTTP_LICENSE = Apache-2.0
 PYTHON_AIOHTTP_LICENSE_FILES = LICENSE.txt
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
