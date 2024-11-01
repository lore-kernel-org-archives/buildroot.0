Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 383A6E6F075
	for <buildroot@archiver.kernel.org>; Fri,  1 Nov 2024 18:09:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F18E1605E5;
	Fri,  1 Nov 2024 18:09:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id b35tJkFwV6oM; Fri,  1 Nov 2024 18:09:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0FC85605EA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0FC85605EA;
	Fri,  1 Nov 2024 18:09:21 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 52823979
 for <buildroot@buildroot.org>; Fri,  1 Nov 2024 18:09:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 32F53605EA
 for <buildroot@buildroot.org>; Fri,  1 Nov 2024 18:09:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id l_sjFBuS0hOe for <buildroot@buildroot.org>;
 Fri,  1 Nov 2024 18:09:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::12c; helo=mail-il1-x12c.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 4CA79605E5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4CA79605E5
Received: from mail-il1-x12c.google.com (mail-il1-x12c.google.com
 [IPv6:2607:f8b0:4864:20::12c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4CA79605E5
 for <buildroot@buildroot.org>; Fri,  1 Nov 2024 18:09:19 +0000 (UTC)
Received: by mail-il1-x12c.google.com with SMTP id
 e9e14a558f8ab-3a4e5e574b6so7351335ab.0
 for <buildroot@buildroot.org>; Fri, 01 Nov 2024 11:09:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730484558; x=1731089358;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=f7Oi+gB/WTVGJvh/ONUbS9UWz3sUTIKHZSWJ19UHaHg=;
 b=UH83hVFUHaUxp6D/xeFbpjghYBscWBK+1C/qYZ4b2M/5zILs/StMMaodQVlRcedF5h
 FE6lhONYlCRIlV8aJUXeufN6va5zUxPhQz4UKa+hIUEG9xDQ74877XpPuYUQmd05KnLt
 Y7pZQ1K50PR+QvBmynsRY5JbaVsE1UWmiqpRRvXfyL59xePkvMEdNDletGOvmyYgy1Up
 bOMPWmAxjUuLC2V2EZVwT4a8MxIzUhP+gbJFV9sOOLR2bClUE3RtLbVyqxJESfYBGJF1
 DQ3gk54yrGchlsd/IN6AT7qT11mW0tx/cS8ghy5L/77LU79EqGFqf6Pqv0SR6a/EXVep
 UPFw==
X-Gm-Message-State: AOJu0YzRmr4UKvxqOwjuonw3d+A6ljTLr287LGUrkWWYlraG9HgBsMDT
 GoFMRrhx0chFPvwwLapEJte6OjKBtiHBVr+1XpXWg9SIPGPPLyerCnDXLw==
X-Google-Smtp-Source: AGHT+IFGILIwsfqkS+wX9w6qY0/bWqEqBY7oAoB0DfyHnLAixG7Y1tDYYTrJKw86YO3ZrWHDPC70Yw==
X-Received: by 2002:a92:d10e:0:b0:3a6:bafd:5650 with SMTP id
 e9e14a558f8ab-3a6bafd5803mr11244485ab.10.1730484557854; 
 Fri, 01 Nov 2024 11:09:17 -0700 (PDT)
Received: from james-x399.localdomain (97-118-131-57.hlrn.qwest.net.
 [97.118.131.57]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4de049c8498sm823434173.157.2024.11.01.11.09.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Nov 2024 11:09:17 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  1 Nov 2024 12:09:16 -0600
Message-Id: <20241101180916.1036264-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1730484558; x=1731089358; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=f7Oi+gB/WTVGJvh/ONUbS9UWz3sUTIKHZSWJ19UHaHg=;
 b=nsHViAmsYaMt23pL5jgUcTRQGi5kKB73KbTeofDKncGV8MTLBtrwoHDdaX76qAVa6o
 oO3NU7dO7AoJ8D7vPeMT5Fexf4CJZjrK1+ECS9r/SzBdfTYrIbz8LQXMLfeXOQxBnfcq
 M8xi/vNSAnYdbmzX0/49D/y24NJVNlrH2utKsq7GuUZtv6UpN6eB8CywQ71dH49V6+be
 x3WOQramVyDa2iHd7tffBYUUmsynhYW8v6sqo2R2Y8gDehhpSnl0m3BXbOuaQ4a42MqX
 B9icXerpAV5UnCL8xqVIQ+27TixtGIhtF9yJPC/+7/H7FKnudmu7QN5YEusDY0Vwq1dB
 bPoQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=nsHViAms
Subject: [Buildroot] [PATCH 1/1] package/python-m2crypto: bump to version
 0.43.0
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
 Gustavo Heinz <gustavo@gsthnz.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-m2crypto/python-m2crypto.hash | 4 ++--
 package/python-m2crypto/python-m2crypto.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-m2crypto/python-m2crypto.hash b/package/python-m2crypto/python-m2crypto.hash
index aa8fe09c14..98307af0cf 100644
--- a/package/python-m2crypto/python-m2crypto.hash
+++ b/package/python-m2crypto/python-m2crypto.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/m2crypto/json
-md5  b88bcb1d4aeb817f91eb627d08b673a2  m2crypto-0.42.0.tar.gz
-sha256  42b62df2caf623161b1d643a7235464c2fe2a3105049ebc498a6d47dc08f64b4  m2crypto-0.42.0.tar.gz
+md5  75c50150857eb60e4f447b04d13ff507  m2crypto-0.43.0.tar.gz
+sha256  6c2c1c7bb0e8aa768f7ca803da7dbc2666d4003b26bd7adf70233afc59d8cf33  m2crypto-0.43.0.tar.gz
 # Locally computed sha256 checksums
 sha256  4eca478396f4b2b020729a111fce3f096456d74500bfd8f2b0388c3c69f997c0  LICENCE
diff --git a/package/python-m2crypto/python-m2crypto.mk b/package/python-m2crypto/python-m2crypto.mk
index 79dfc1beb2..b5142c9bb2 100644
--- a/package/python-m2crypto/python-m2crypto.mk
+++ b/package/python-m2crypto/python-m2crypto.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_M2CRYPTO_VERSION = 0.42.0
+PYTHON_M2CRYPTO_VERSION = 0.43.0
 PYTHON_M2CRYPTO_SOURCE = m2crypto-$(PYTHON_M2CRYPTO_VERSION).tar.gz
-PYTHON_M2CRYPTO_SITE = https://files.pythonhosted.org/packages/85/9f/b8977ce2971cf5f823db3fdb31e7e061b9662da318a17b6bf0c653f84aee
+PYTHON_M2CRYPTO_SITE = https://files.pythonhosted.org/packages/ff/1b/4771f0ecfdd9df6752ae5d0cf040545bb3cfe8a504af87e05c9ac4a6a499
 PYTHON_M2CRYPTO_SETUP_TYPE = setuptools
 PYTHON_M2CRYPTO_LICENSE = MIT
 PYTHON_M2CRYPTO_LICENSE_FILES = LICENCE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
