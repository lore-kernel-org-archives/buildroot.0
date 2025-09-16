Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DAC9CAC597
	for <buildroot@archiver.kernel.org>; Tue, 16 Sep 2025 00:44:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B60CE814C8;
	Tue, 16 Sep 2025 00:44:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FugT1PglU8DI; Tue, 16 Sep 2025 00:44:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CB673814DD
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id CB673814DD;
	Tue, 16 Sep 2025 00:44:11 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 7AEBD22F
 for <buildroot@buildroot.org>; Tue, 16 Sep 2025 00:44:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6C6C5814DD
 for <buildroot@buildroot.org>; Tue, 16 Sep 2025 00:44:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hBLEaIGAiJWY for <buildroot@buildroot.org>;
 Tue, 16 Sep 2025 00:44:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::132; helo=mail-il1-x132.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org A094E814C8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A094E814C8
Received: from mail-il1-x132.google.com (mail-il1-x132.google.com
 [IPv6:2607:f8b0:4864:20::132])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A094E814C8
 for <buildroot@buildroot.org>; Tue, 16 Sep 2025 00:44:09 +0000 (UTC)
Received: by mail-il1-x132.google.com with SMTP id
 e9e14a558f8ab-423fc1532bdso31647985ab.1
 for <buildroot@buildroot.org>; Mon, 15 Sep 2025 17:44:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757983448; x=1758588248;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=OL4qZl2KHhktMtSOFnMxSYDfkRajE82qZfClM5ciec4=;
 b=jVM/1no49fkVmQRjBMk9W3OjzTxpPbTy7muMxQox8uEL7iqjCxkB4orixsPDMR/TJj
 az7GBAWcCWDbcynYUlhzOAVa2LL+mWGBygtn821y5VjUFpSEYve85lJAEHpLP6juPXlI
 GRY83konq+tYLtJAmJlwmnGv9G0ReYAdZrgKqz3sD2ZKqhyzAYfJzeAVDjV4kXIsMExL
 DYinEC8BA4G61hcnxjPyk/UjawSJxNlLdDjY0dKhi/rJ0vWqSP6GNNM/HcJ99G1SxBH4
 qroNovkdUSqoPZnBJqRA+iDi54SiKgrVzJH9DSe8LG8jKrlCeI4VykEqfP9A3ODPgBzR
 bsPw==
X-Gm-Message-State: AOJu0Ywfi170zrA9/D8i7kzdgbSgPQsPNAUhFtHOvaHGU1gpqfoD7nGP
 7IqIdj+PnI2ebVJt5esVrnnjWJ3NKut9jDc1FIcSfc4DhaCfqBiBOdCHnNtCUw==
X-Gm-Gg: ASbGncv9RfGcCorENtGdapgspgmo+CNp+VeArCk9tCjMJMvGsBp4QU9QIvNTV4VsCpK
 kfFnRn3BZMPjm49HdU6azYpF/HJo7B1h0EH998zrV2+xlf+S40+L9PVAuLvj6/5B4I/Mu6+drGr
 FFixM78ANpTRvGTiSna58188abGCL9HEuouOVAQ691QGtj0H8f3zsDhFVqyKVMR50uCbXCHzQmg
 XtFcrwFT+18An2Uic7uiHQjK4o0GSiemny7yhr4lX3V/ChBRE/DZKGps5nq3xT/mDnKbhUNXIct
 kFpBLAos36mEDjNsK4hcX7mDw3q5BV6o+ganDbY9Vx3XfoFVVTeG3rs/7TW4PWFeXOxQMM6lACY
 87kRDkWIgo0YcX/tZ7oCiJpFdlwk/5JwA19m2eMnvgkbz/22mPBQT5du3+dNsDRrBd3juFANVAL
 ewadXmUCr2Tnq2W73HzZ2bQQ==
X-Google-Smtp-Source: AGHT+IGjRlaimTht+c43FNGomfod2b945o8AJADvKXcuKfpBavWTuYqMhhVfgo4C3uvP0b3NZias/g==
X-Received: by 2002:a92:ca0d:0:b0:423:fb73:315f with SMTP id
 e9e14a558f8ab-423fb733533mr82926455ab.6.1757983448196; 
 Mon, 15 Sep 2025 17:44:08 -0700 (PDT)
Received: from james-x399.localdomain (71-218-100-179.hlrn.qwest.net.
 [71.218.100.179]) by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-41dfb14c032sm62268535ab.40.2025.09.15.17.44.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Sep 2025 17:44:07 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 15 Sep 2025 18:44:06 -0600
Message-ID: <20250916004406.2522667-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1757983448; x=1758588248; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=OL4qZl2KHhktMtSOFnMxSYDfkRajE82qZfClM5ciec4=;
 b=SXA5tjKiL6evngE7wqIctdAb9TQgssidIZ0Q8dYJp723OR5dREg9W1elmXeU/AmpLm
 vYD3g7nJWJ/mR6ri26bsERC12lNnt6Ye5x57IsTEQ3n0TMJCn592EJ7ZecH1d91o7vP6
 SzGBwlvTsVLeRn93KH9WTvvO3yqeq4jibxFp4XeWnLaI5elgyFIwVZYekEd8Ch4rnAoS
 IOMZT/XVwR9b6+EXbjOX/c7z8vqcZxXBUTnDBQFop4JkTAEMvk1J19d4PiuRObNEX4KO
 oitdoLEvNVdw9vbIETMDhCNZFRQmFYA1H8FbtKscsId50qkkRK25S3ecsMlbqI43RhI8
 B3dw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=SXA5tjKi
Subject: [Buildroot] [PATCH 1/1] package/python-pypika-tortoise: bump to
 version 0.6.2
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

Migrate pep517 build backend from poetry to pdm-backend.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-pypika-tortoise/python-pypika-tortoise.hash | 4 ++--
 package/python-pypika-tortoise/python-pypika-tortoise.mk   | 7 ++++---
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/package/python-pypika-tortoise/python-pypika-tortoise.hash b/package/python-pypika-tortoise/python-pypika-tortoise.hash
index a2798b5c20..7e9f397638 100644
--- a/package/python-pypika-tortoise/python-pypika-tortoise.hash
+++ b/package/python-pypika-tortoise/python-pypika-tortoise.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pypika-tortoise/json
-md5  1a80beca2d767b93ff62ebe9fbce6a63  pypika_tortoise-0.6.1.tar.gz
-sha256  36ec2c88c255b9ed7ef49a6068cdeac10dafd4ddfeb828205d3afc092507fc3a  pypika_tortoise-0.6.1.tar.gz
+md5  5b5c1be4096c75dd6994336f71936383  pypika_tortoise-0.6.2.tar.gz
+sha256  f95ab59d9b6454db2e8daa0934728458350a1f3d56e81d9d1debc8eebeff26b3  pypika_tortoise-0.6.2.tar.gz
 # Locally computed sha256 checksums
 sha256  c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4  LICENSE
diff --git a/package/python-pypika-tortoise/python-pypika-tortoise.mk b/package/python-pypika-tortoise/python-pypika-tortoise.mk
index f0e92faff5..7fa451f67d 100644
--- a/package/python-pypika-tortoise/python-pypika-tortoise.mk
+++ b/package/python-pypika-tortoise/python-pypika-tortoise.mk
@@ -4,11 +4,12 @@
 #
 ################################################################################
 
-PYTHON_PYPIKA_TORTOISE_VERSION = 0.6.1
+PYTHON_PYPIKA_TORTOISE_VERSION = 0.6.2
 PYTHON_PYPIKA_TORTOISE_SOURCE = pypika_tortoise-$(PYTHON_PYPIKA_TORTOISE_VERSION).tar.gz
-PYTHON_PYPIKA_TORTOISE_SITE = https://files.pythonhosted.org/packages/db/03/c293fd42c3669e5a79d508c3ed1ca3ffa501600d93abd904a0f86d493ba0
-PYTHON_PYPIKA_TORTOISE_SETUP_TYPE = poetry
+PYTHON_PYPIKA_TORTOISE_SITE = https://files.pythonhosted.org/packages/1a/7b/0a31165e22e599ba149ba35d4323d343205a70d91a4f6e8c6565f5b4fa08
+PYTHON_PYPIKA_TORTOISE_SETUP_TYPE = pep517
 PYTHON_PYPIKA_TORTOISE_LICENSE = Apache-2.0
 PYTHON_PYPIKA_TORTOISE_LICENSE_FILES = LICENSE
+PYTHON_PYPIKA_TORTOISE_DEPENDENCIES = host-python-pdm-backend
 
 $(eval $(python-package))
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
