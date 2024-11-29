Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92606D70E03
	for <buildroot@archiver.kernel.org>; Fri, 29 Nov 2024 01:50:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 055E04064D;
	Fri, 29 Nov 2024 01:50:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0-TQDb63b6GZ; Fri, 29 Nov 2024 01:50:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C72E24064F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C72E24064F;
	Fri, 29 Nov 2024 01:50:04 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id A729CAF7
 for <buildroot@buildroot.org>; Fri, 29 Nov 2024 01:50:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9559780E87
 for <buildroot@buildroot.org>; Fri, 29 Nov 2024 01:50:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ajEbUorwhh-q for <buildroot@buildroot.org>;
 Fri, 29 Nov 2024 01:50:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::62f; helo=mail-pl1-x62f.google.com;
 envelope-from=fancp2007@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org D140B8108E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D140B8108E
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com
 [IPv6:2607:f8b0:4864:20::62f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D140B8108E
 for <buildroot@buildroot.org>; Fri, 29 Nov 2024 01:50:01 +0000 (UTC)
Received: by mail-pl1-x62f.google.com with SMTP id
 d9443c01a7336-212874cd62cso6871575ad.3
 for <buildroot@buildroot.org>; Thu, 28 Nov 2024 17:50:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732845000; x=1733449800;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=DdIfnGUUqRVSrXE6anxyiaesq5fOQh+2j0pCuj/2PJU=;
 b=IwfOX4t0kSc6JMa/kyICOGeOpuGGzhsi+ES0GsnrnCBSbttM+oOBTIxyUNNvbsGHvO
 zZA79XJCteM/kt5mrl019nsKVG4BvGEYZNY/WFWO3lemq4L7TVNLfQsabCn19U7lvvC+
 5m/ik+7BKtPhFoyZqh71VewW4IIK78lge7F0bTtqRI2cWF9iFEbNWhXAusrX926v7P72
 kVs2hvc2MjIrmxTCYo5AQVxVkwdTgayfVI/eMEbzk0XNQSasWEjVwvgPLicEcWUylvMa
 M+mM31Q9lbbR+nFtDYmYM6Eg2UFvAyAG9S3QMHAJFBHqpm4JwbcT3YbiImPnHyLTtur8
 AOhg==
X-Gm-Message-State: AOJu0YwBrUe6GVutN1hphpbPfU+P/R7JR2O7cTOVz7j2zUZRzTs39DXS
 9r3htkJ1fcTfAMfGLM4XhcSLhUHhL4jR95XKLlcolWtzalE5HBcWagfslQ==
X-Gm-Gg: ASbGncswYmfV3QpXxqEh+Qjryxkk8ciHzweoveO44jz05aPkUYBFnneAn6hkOyS/+L9
 8ogtdvXNS82kXZW8AMMi3kyfDqKG9r1ye8bhyj3XcIn4pV7jUQiDy+1BWQkN2VpJ+WIbKgtdhO3
 UFm91MJWcN5vJYFXxjijbECEo87zMWTpqVN6koP9qZ9VjkiJwjrA54W1+2eORsYVoRyc8cqmd3U
 ocUYh73Lf1wgNFfjXYjQC3Lo1mwmwR3Wnvu70PG9P56Ggo=
X-Google-Smtp-Source: AGHT+IEFRUD3nlAePHOG0BKKM1HlUfg8yPzE2cnZDMdLCFCXwr0DM2juICtx1n5vIuLuvsvjWN3GCQ==
X-Received: by 2002:a17:903:41c3:b0:212:996:3536 with SMTP id
 d9443c01a7336-2150108c8eemr124438635ad.10.1732844999909; 
 Thu, 28 Nov 2024 17:49:59 -0800 (PST)
Received: from localhost ([66.112.214.180]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-215218f1d99sm20221605ad.44.2024.11.28.17.49.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Nov 2024 17:49:59 -0800 (PST)
From: Scott Fan <fancp2007@gmail.com>
To: buildroot@buildroot.org
Cc: Scott Fan <fancp2007@gmail.com>
Date: Fri, 29 Nov 2024 09:49:52 +0800
Message-ID: <20241129014954.566635-1-fancp2007@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1732845000; x=1733449800; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=DdIfnGUUqRVSrXE6anxyiaesq5fOQh+2j0pCuj/2PJU=;
 b=NGAcsauFZkg8/QCx8yNtzOfTadnsaNrZh8NOaZv49cZy5vAUmGaGW4cJQOlkWhtqnV
 Y7ffqgCrRpNerA0BcO1PQMFT1ul9u4ol3PEspUDSMKTMvspsP1uh8bbmR8iA872RqGv4
 +F0KN1GiZkFkCNSZoOPZj0KhtmDh6KvqrE0jsdu4SzdyppwX3Tm3S+lZct6n/VixrQ+J
 ti8Tt/mvaGtUQCKXnq6SXb9JNwhMba0tY5u4yCny+VfRxCf0jCC+B0oRAK2uafKxD6Ji
 wFWXH5hUL26qChjMt1b7L2XytzJ9nRPznpN9WUwSjOeSOWLWgPLvqSkqtyipTQmNT7j7
 GlIw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=NGAcsauF
Subject: [Buildroot] [PATCH] package/chrony: bump to version 4.6.1
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Release notes: https://chrony-project.org/news.html

This commit also updates the project's homepage and download URL.

The previous homepage URL http://chrony.tuxfamily.org/ now automatically
redirects to https://chrony-project.org/.

Signed-off-by: Scott Fan <fancp2007@gmail.com>
---
 package/chrony/Config.in   | 2 +-
 package/chrony/chrony.hash | 4 ++--
 package/chrony/chrony.mk   | 4 ++--
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/chrony/Config.in b/package/chrony/Config.in
index c22b756c11..453e4f6c3f 100644
--- a/package/chrony/Config.in
+++ b/package/chrony/Config.in
@@ -6,7 +6,7 @@ config BR2_PACKAGE_CHRONY
 	  Chrony is a pair of programs which are used to maintain the
 	  accuracy of the system clock.
 
-	  http://chrony.tuxfamily.org/
+	  https://chrony-project.org/
 
 if BR2_PACKAGE_CHRONY
 
diff --git a/package/chrony/chrony.hash b/package/chrony/chrony.hash
index 2cf6cca031..25535e723e 100644
--- a/package/chrony/chrony.hash
+++ b/package/chrony/chrony.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking pgp signature
-# https://download.tuxfamily.org/chrony/chrony-4.4-tar-gz-asc.txt
-sha256  eafb07e6daf92b142200f478856dfed6efc9ea2d146eeded5edcb09b93127088  chrony-4.4.tar.gz
+# https://chrony-project.org/releases/chrony-4.6.1-tar-gz-asc.txt
+sha256  571ff73fbf0ae3097f0604eca2e00b1d8bb2e91affe1a3494785ff21d6199c5c  chrony-4.6.1.tar.gz
 # Locally calculated
 sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
diff --git a/package/chrony/chrony.mk b/package/chrony/chrony.mk
index bcf69a59db..642e1d8fd6 100644
--- a/package/chrony/chrony.mk
+++ b/package/chrony/chrony.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-CHRONY_VERSION = 4.4
-CHRONY_SITE = http://download.tuxfamily.org/chrony
+CHRONY_VERSION = 4.6.1
+CHRONY_SITE = https://chrony-project.org/releases
 CHRONY_LICENSE = GPL-2.0
 CHRONY_LICENSE_FILES = COPYING
 CHRONY_CPE_ID_VENDOR = tuxfamily
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
