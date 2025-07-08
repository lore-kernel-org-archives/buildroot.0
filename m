Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2532BC83F09
	for <buildroot@archiver.kernel.org>; Tue,  8 Jul 2025 12:50:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C6F57817ED;
	Tue,  8 Jul 2025 12:50:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id S97qJJqMYXoL; Tue,  8 Jul 2025 12:50:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EE92F817B0
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id EE92F817B0;
	Tue,  8 Jul 2025 12:50:26 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 7AEAF12E
 for <buildroot@buildroot.org>; Tue,  8 Jul 2025 12:50:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6CDB840A53
 for <buildroot@buildroot.org>; Tue,  8 Jul 2025 12:50:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LlppHL2Oyb4P for <buildroot@buildroot.org>;
 Tue,  8 Jul 2025 12:50:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62c; helo=mail-ej1-x62c.google.com;
 envelope-from=yegorslists@googlemail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 46C8C409FE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 46C8C409FE
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 46C8C409FE
 for <buildroot@buildroot.org>; Tue,  8 Jul 2025 12:50:25 +0000 (UTC)
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-ae3be3eabd8so869185966b.1
 for <buildroot@buildroot.org>; Tue, 08 Jul 2025 05:50:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751979022; x=1752583822;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=JQjGCUvLjc4uioVlUyYaZK4K8pqizlwFTuNC0Ds+cRU=;
 b=kC2uSSIUGaAAFoj1pzmiGvSHUUAki3i3oRwDd4/d9KCBDPgp1G1mZQfvM8wwHR1+Ap
 YV9m0u4Kb6T+yWvbBTIbTIQd7YCh9vzGltcEHhFVYxd3023ftvE5jjfJTCPq/O06I9KL
 R+3NQJvHu7fuk9S8WaL3dEm30I6jWo2e8ac4wuaCZTIEdkMo6jrp8ol0JJEKn1NtV2Hh
 jcL+qF0KWT/yCNV7QteI94AnwwcbEiw6qRkhXf9WLVsDT3aRyn6hFISR3OOE9jZjP72K
 riLeuwTOwhJ6B5qir7VuLt1Hl3Gk2fki01dSPHYcs5bZyHhjeNb6C4mdpdAoaRLZx2KY
 66YQ==
X-Gm-Message-State: AOJu0Yy5LYJlk6oKCvzoygIxJKythaXxxbguk8Cw3UWolmtCGOxvDeeW
 lBYcer1H561BcBcGOI8h1HwJOtxgY3ObflAyMTZXQA1CldlYc6kXcKuTHcnPLw==
X-Gm-Gg: ASbGncu76LR6uxTHqnEH2MhgtjHzbIey7ZOdp5+VHdDVSA+M7XilL3eshVv950jygzn
 1xUPXp8kWq9M/t0mPKHrD5SlB15S+y5n2XKDzRBtHiemMmnGCL7+0+2YTsb/uCM8rzD3Uy4fnWu
 krBMPPWp8JGlGFx3fldKn8kMuOixf1MUzxCVj+11Fr1LkJEjJacSQnHTa7gaO3IvEH6XntM8E8z
 h3y2MK60s2RE0ohaOjbGnBIQ5G1P6FRxo0Ekimfj84oDZl8HDTWgw1OA2UEdyzicRe5pQu99VzA
 jLxZlkbeQQbiCmdwybAX02mr9Pk+Cx1LUqkTArGkklCxRS9cTmzB+TVyelA2wSUFsG/AgxC7aJc
 Qx3+ykNzlo6wkh+zfaJ6zUEUpJc+eoU+5lNS/tTqqnuM=
X-Google-Smtp-Source: AGHT+IEgbmel0kjLJMBiribdMiB1MqN5cDLJyqBdkykswFrfw7VM4eX+atCfUIJ9kY4h1LYl942Slw==
X-Received: by 2002:a17:907:7fa3:b0:ad8:959c:c567 with SMTP id
 a640c23a62f3a-ae6b2ab82f3mr295413166b.10.1751979022294; 
 Tue, 08 Jul 2025 05:50:22 -0700 (PDT)
Received: from development2.visionsystems.local (mail.visionsystems.de.
 [213.209.99.202]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ae3f6b62f36sm888777766b.150.2025.07.08.05.50.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Jul 2025 05:50:21 -0700 (PDT)
To: buildroot@buildroot.org
Date: Tue,  8 Jul 2025 14:50:16 +0200
Message-Id: <20250708125016.808879-1-yegorslists@googlemail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20230601; t=1751979022; x=1752583822; darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=JQjGCUvLjc4uioVlUyYaZK4K8pqizlwFTuNC0Ds+cRU=;
 b=ZQDDj4jkyPfF7VHmWxXZ8QPCM6jHopgdynwHtAg/G+C7W6ESzxRa3ft+C2RF3lDWrO
 vBzYB8dCgEH/Fb4j5FyzVOby/CyJZYbhtzVdmJrbAonSLVSY5DQdYfwClsrKuW1CmfMa
 IU9FNgwRNuxcZIm/71CzjyqyUdLPBbsfqfS0qilp6SWgIdpijFoC5jC3d9B5Tp10oHsa
 bibjTfnJYvVg4MervE/D7YrfwQF9aUJ8IXIP5BajFsCNTtHc1zb9XI/op9oF9x9Vkwlo
 gRXhYyHHdaR2uedhYN9sAZknFFZGzzPyQLw4i12yhOPNTc6tUoy0bOD99GhfM9fkkoho
 gNEg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=googlemail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=googlemail.com header.i=@googlemail.com
 header.a=rsa-sha256 header.s=20230601 header.b=ZQDDj4jk
Subject: [Buildroot] [PATCH] package/libconfig: bump to version 1.8.1
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
From: yegorslists--- via buildroot <buildroot@buildroot.org>
Reply-To: yegorslists@googlemail.com
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Yegor Yefremov <yegorslists@googlemail.com>

For change log, see:

https://github.com/hyperrealm/libconfig/releases/tag/v1.8.1

The download URL now points to
https://hyperrealm.github.io/libconfig/dist.

The COPYING.LIB file has been changed. See the following commit for
details:

https://github.com/hyperrealm/libconfig/commit/be4da0c2fd5d08cefb628af67b68d32907fc972a

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/libconfig/libconfig.hash | 4 ++--
 package/libconfig/libconfig.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/libconfig/libconfig.hash b/package/libconfig/libconfig.hash
index d359301d6f..2b10dfc125 100644
--- a/package/libconfig/libconfig.hash
+++ b/package/libconfig/libconfig.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  545166d6cac037744381d1e9cc5a5405094e7bfad16a411699bcff40bbb31ee7  libconfig-1.7.3.tar.gz
-sha256  d80c9d084ebfb50ea1ed91bfbc2410d6ce542097a32c43b00781b83adcb8c77f  COPYING.LIB
+sha256  87c6f382994b245f9213be34a2bf19c8ee7d033d7abaa51e88fbb7bad79e2dc6  libconfig-1.8.1.tar.gz
+sha256  cbbad55f94feadb16061c4f782910bac254460a44f1c8abd2b91452eff085f55  COPYING.LIB
diff --git a/package/libconfig/libconfig.mk b/package/libconfig/libconfig.mk
index 6cdf603185..3fa2be3563 100644
--- a/package/libconfig/libconfig.mk
+++ b/package/libconfig/libconfig.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-LIBCONFIG_VERSION = 1.7.3
-LIBCONFIG_SITE = https://github.com/hyperrealm/libconfig/releases/download/v$(LIBCONFIG_VERSION)
+LIBCONFIG_VERSION = 1.8.1
+LIBCONFIG_SITE = https://hyperrealm.github.io/libconfig/dist
 LIBCONFIG_LICENSE = LGPL-2.1+
 LIBCONFIG_LICENSE_FILES = COPYING.LIB
 LIBCONFIG_INSTALL_STAGING = YES
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
