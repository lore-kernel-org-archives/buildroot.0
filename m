Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5483CC25B74
	for <buildroot@archiver.kernel.org>; Sun,  2 Jun 2024 21:33:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0D97583B07;
	Sun,  2 Jun 2024 21:33:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id v9M7u8_T9V6u; Sun,  2 Jun 2024 21:33:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 146FA83B75
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 146FA83B75;
	Sun,  2 Jun 2024 21:33:39 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3C7721BF5AA
 for <buildroot@lists.busybox.net>; Sun,  2 Jun 2024 21:33:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 27C8D83B75
 for <buildroot@lists.busybox.net>; Sun,  2 Jun 2024 21:33:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GA6JGxmuZUBp for <buildroot@lists.busybox.net>;
 Sun,  2 Jun 2024 21:33:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d30; helo=mail-io1-xd30.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 296BC83B07
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 296BC83B07
Received: from mail-io1-xd30.google.com (mail-io1-xd30.google.com
 [IPv6:2607:f8b0:4864:20::d30])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 296BC83B07
 for <buildroot@buildroot.org>; Sun,  2 Jun 2024 21:33:36 +0000 (UTC)
Received: by mail-io1-xd30.google.com with SMTP id
 ca18e2360f4ac-7eacb1bc636so181785039f.2
 for <buildroot@buildroot.org>; Sun, 02 Jun 2024 14:33:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717364015; x=1717968815;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=APtz+POfQ993uzifIIxjfYfSa2WpSdPZb3e5BTWtSUQ=;
 b=hzrX0qs4dW/WmYYk+fz93ElKn1Mxfy7u7oqwl/UATVLLEHaie5a/pvNV/4xXqjeeyB
 7RblpbbPW2RxAxu8tx/ZNHY5qaVkxOpN5gX7+HyidXcXS1SsOh9xtuBREgqx5O294OTP
 ymIshIdteTpnLsOg4ENtsnAp3I5t9IhTNwiJJc3XV45qrjZS7rAaKLrmg15j2EnALd+s
 JvUv0TCRjJioh+9ru356TSjnc1hRJ6wFDrUtXYYSqNIOUwEuBOc+cioQ7qf4cADARmg4
 I9/cx+35ZpbS+Xglpmv3cgOPxf70dJU6tn3jtSFFUSfWDOlPLHiA2n3Qu3d9c/y/XB/w
 vO7w==
X-Gm-Message-State: AOJu0YyH4MXFK9hLqUBa2yyEQMnip3mLnbPZEW1mKwRmBxv6NfKUQP7K
 NBfXw9iOcDrZWwM+1gDltb2C8oYAIypkLClUHoxMICYofG8jqRGysJsQzA==
X-Google-Smtp-Source: AGHT+IEUh+d4Xw9xzBYXe/ufKtjYDGbPyqfT5/U727WDppd567Wyt/YnVampBHctkA43VWiod+zIlw==
X-Received: by 2002:a05:6602:6d16:b0:7e1:b4c8:7750 with SMTP id
 ca18e2360f4ac-7eaffea8d27mr945788639f.9.1717364015569; 
 Sun, 02 Jun 2024 14:33:35 -0700 (PDT)
Received: from james-x399.localdomain (97-118-179-167.hlrn.qwest.net.
 [97.118.179.167]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4b4e41e65a2sm1550904173.73.2024.06.02.14.33.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 Jun 2024 14:33:35 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  2 Jun 2024 15:33:33 -0600
Message-Id: <20240602213333.2597981-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1717364015; x=1717968815; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=APtz+POfQ993uzifIIxjfYfSa2WpSdPZb3e5BTWtSUQ=;
 b=XX2/oUESV0k0Oub76+OA+9Vi387MzBH4m+Ff90jBjB7f7OrdSqFYUjoHL5JVL3CTGu
 SNrvJ0BtSbUnhYPZmBve1iv2HQckCHnwQV+NL3i478QLzR8QIE/4Ywi2CTO3TUcYZWxG
 1bZjowlqS8uZs8Nf9eyMYHxhFi/PzMD8BWjViiJG/ygcHkXtxgOf+bv87etc98GqG0n0
 s8S+iLnJDyZIDL9okED3Ozt+6iZsJQEYsu6BFFPOdfFiuOyvBLrUjVpsJTlEhVrHPH79
 4yo0SbUzZGKDcR2/mYYq8zKUDuJPWk/T0RgS04DqgzDJ+5pl7cRuHQHfW08e7zFFvm8k
 C+xw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=XX2/oUES
Subject: [Buildroot] [PATCH 1/1] package/python-bcrypt: bump to version 4.1.3
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
 package/python-bcrypt/python-bcrypt.hash |  2 +-
 package/python-bcrypt/python-bcrypt.mk   | 19 ++++---------------
 2 files changed, 5 insertions(+), 16 deletions(-)

diff --git a/package/python-bcrypt/python-bcrypt.hash b/package/python-bcrypt/python-bcrypt.hash
index 8e660a158b..f3e0517429 100644
--- a/package/python-bcrypt/python-bcrypt.hash
+++ b/package/python-bcrypt/python-bcrypt.hash
@@ -1,4 +1,4 @@
 # Locally calculated after vendoring
-sha256  f0b2c7d5d79a6537e3d291b07d2be70dd122a15ea871854d4ce95b447c6873a5  python-bcrypt-4.0.1-cargo2.tar.gz
+sha256  630f29d9eccca3aea0521eaeff7e4aab43611f1bbf4f8afcdf590aeee9fc8187  python-bcrypt-4.1.3-cargo2.tar.gz
 # Locally computed sha256 checksums
 sha256  8173d5c29b4f956d532781d2b86e4e30f83e6b7878dce18c919451d6ba707c90  LICENSE
diff --git a/package/python-bcrypt/python-bcrypt.mk b/package/python-bcrypt/python-bcrypt.mk
index f3137401d7..3d1aeab288 100644
--- a/package/python-bcrypt/python-bcrypt.mk
+++ b/package/python-bcrypt/python-bcrypt.mk
@@ -4,24 +4,13 @@
 #
 ################################################################################
 
-PYTHON_BCRYPT_VERSION = 4.0.1
+PYTHON_BCRYPT_VERSION = 4.1.3
 PYTHON_BCRYPT_SOURCE_PYPI = bcrypt-$(PYTHON_BCRYPT_VERSION).tar.gz
-PYTHON_BCRYPT_SITE_PYPI = https://files.pythonhosted.org/packages/8c/ae/3af7d006aacf513975fd1948a6b4d6f8b4a307f8a244e1a3d3774b297aad
+PYTHON_BCRYPT_SITE_PYPI = https://files.pythonhosted.org/packages/ca/e9/0b36987abbcd8c9210c7b86673d88ff0a481b4610630710fb80ba5661356
 PYTHON_BCRYPT_SITE = $(PYTHON_BCRYPT_SITE_PYPI)/$(PYTHON_BCRYPT_SOURCE_PYPI)?buildroot-path=filename
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
