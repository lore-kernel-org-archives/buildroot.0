Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7A0EE7719A
	for <buildroot@archiver.kernel.org>; Sat, 11 Jan 2025 16:04:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AA0E56119F;
	Sat, 11 Jan 2025 16:04:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GSP4OAQU-nWC; Sat, 11 Jan 2025 16:04:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AB44D611A4
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id AB44D611A4;
	Sat, 11 Jan 2025 16:04:19 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id CFF80940
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 16:04:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id ADFFB4013D
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 16:04:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zMWEyZprPL7N for <buildroot@buildroot.org>;
 Sat, 11 Jan 2025 16:04:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::135; helo=mail-il1-x135.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 91AB34000B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 91AB34000B
Received: from mail-il1-x135.google.com (mail-il1-x135.google.com
 [IPv6:2607:f8b0:4864:20::135])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 91AB34000B
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 16:04:17 +0000 (UTC)
Received: by mail-il1-x135.google.com with SMTP id
 e9e14a558f8ab-3a8160382d4so7861425ab.0
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 08:04:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736611456; x=1737216256;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=oEzE+eZG/3a1kbefMHqoyNVMi4xkmWzdrhzS8zp9jts=;
 b=cajv2AyiymscS4yQtc7ERulcpI4n9W47bu9WeowHh+9AcI8ZhR2OLuRH7iej4eNK4A
 m8UmEmmEizATmvdnWcPP+QYqhnxL+evGfZ7iwyfEFi46tK1HelLEDHck9yPDvDsRv2Hy
 +xMmbdhwp6IcY7nHoixI7LpEmAOEbqBHtctCuRV445iCoQ1vvcEIB0PDi8uJWQwRZaTk
 pMBcieI/dnZKvz4xcqQhTFSfaCGKQ6t29J4zUCu2Zva9tpQ6h44OxojRWb3/iBylIw6M
 5zrSAwaSiNuHHcEBM9hjfnRQkT8Lf4MyOiMyA2NwyA4g+B3V4DQ2168tLBIx+fhfIXpo
 Zoig==
X-Gm-Message-State: AOJu0YyZARqd1Z19pFr1TTvmumVllybc6hEbEjP7+W72JkU0MKL2fKjr
 eFjqzVDNIRo/M1+FEyKQ/fJLL7uZDQVvNKvnR1BlnUR0GeB76CvaB674Hn9GKg4=
X-Gm-Gg: ASbGncvAUFmY26fdmkmEwoNzrMzw/f8nFXOZw2jBT+JQJw1A0bPOnNwLzjze8Ssarp5
 kcybfzRAB2aeWenDIF8Wt2Z41aQWc8zgTOvlb1Wd4FTEPfxh9WlNqW3L1btcmCRwwM/ChlT+XKD
 qs/aP9/qQX+kXs3Y+UuM043sPELrDn61m3m3JW/KKNsYn+ut2al3A0SD0vDsYK8BUDtsWFqHgd2
 sC0K3lLRUWBf32MPMKWnIf/2IpMWD5Rjtp+j5bBf7R/Nrn4ZHPogSgA4ZavZvs9tSVMQfyaQVJJ
 nsOkbU9N3l+z0/R78P1+ellAzESGAio=
X-Google-Smtp-Source: AGHT+IEjSApfKO1lQwZxq2UunoDjt3C3WQoapge3LwFXnT5Uav4DKXHc8m0YivPYsgxm3OcxmDt6tw==
X-Received: by 2002:a05:6e02:1889:b0:3ab:8db6:12ac with SMTP id
 e9e14a558f8ab-3ce3a9a5e85mr93108005ab.4.1736611456296; 
 Sat, 11 Jan 2025 08:04:16 -0800 (PST)
Received: from james-x399.localdomain (71-218-115-58.hlrn.qwest.net.
 [71.218.115.58]) by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-3ce66186660sm4360325ab.65.2025.01.11.08.04.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 11 Jan 2025 08:04:15 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 11 Jan 2025 09:04:14 -0700
Message-Id: <20250111160414.2863080-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1736611456; x=1737216256; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=oEzE+eZG/3a1kbefMHqoyNVMi4xkmWzdrhzS8zp9jts=;
 b=VdLXaFMgXSWX0J3KJn0ZpPkG46rM088UK2hCsJhscj+qPEGxOotefxXZ63eJj1L23c
 x2Ha/MT8sdGXPdBIMXrF8TxLTBOjYaKdoFl5E4ovyNV4OYCE9V3A25Jtsi4LgYxpt0jR
 Qj2AopqQcw0yo0q61i9xzA51vQTpvpwWeitFYaTY4rwoho8TaGdohw8Y2atEbMZTDHEf
 afZnnJth88qhy0Js4v3M5Iz7mXoRB0+514A4vV0LMf0G7rQql+J/xR5ym8vrLWx2ZdSZ
 TzpNd8xZt2y7EjsL1h3OYGMkklkbmzIX6eL4MFR9DDjVyKXTY7ozT0mLVx+6VQnbXef+
 Ox+w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=VdLXaFMg
Subject: [Buildroot] [PATCH 1/1] package/python-pyparsing: bump to version
 3.2.1
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
 package/python-pyparsing/python-pyparsing.hash | 4 ++--
 package/python-pyparsing/python-pyparsing.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pyparsing/python-pyparsing.hash b/package/python-pyparsing/python-pyparsing.hash
index 458da62888..b6ca80b040 100644
--- a/package/python-pyparsing/python-pyparsing.hash
+++ b/package/python-pyparsing/python-pyparsing.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pyparsing/json
-md5  c9fb29820d6bf6e83651a0bd7411f02c  pyparsing-3.2.0.tar.gz
-sha256  cbf74e27246d595d9a74b186b810f6fbb86726dbf3b9532efb343f6d7294fe9c  pyparsing-3.2.0.tar.gz
+md5  0af29922e2f22dbc2569b88917b44f52  pyparsing-3.2.1.tar.gz
+sha256  61980854fd66de3a90028d679a954d5f2623e83144b5afe5ee86f43d762e5f0a  pyparsing-3.2.1.tar.gz
 # Locally computed sha256 checksums
 sha256  10d5120a16805804ffda8b688c220bfb4e8f39741b57320604d455a309e01972  LICENSE
diff --git a/package/python-pyparsing/python-pyparsing.mk b/package/python-pyparsing/python-pyparsing.mk
index 20faa35d38..cb19f54ca1 100644
--- a/package/python-pyparsing/python-pyparsing.mk
+++ b/package/python-pyparsing/python-pyparsing.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYPARSING_VERSION = 3.2.0
+PYTHON_PYPARSING_VERSION = 3.2.1
 PYTHON_PYPARSING_SOURCE = pyparsing-$(PYTHON_PYPARSING_VERSION).tar.gz
-PYTHON_PYPARSING_SITE = https://files.pythonhosted.org/packages/8c/d5/e5aeee5387091148a19e1145f63606619cb5f20b83fccb63efae6474e7b2
+PYTHON_PYPARSING_SITE = https://files.pythonhosted.org/packages/8b/1a/3544f4f299a47911c2ab3710f534e52fea62a633c96806995da5d25be4b2
 PYTHON_PYPARSING_LICENSE = MIT
 PYTHON_PYPARSING_LICENSE_FILES = LICENSE
 PYTHON_PYPARSING_SETUP_TYPE = flit
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
