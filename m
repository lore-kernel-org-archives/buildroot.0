Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FC57EB64CB
	for <buildroot@archiver.kernel.org>; Sat,  7 Sep 2024 21:17:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E71C060644;
	Sat,  7 Sep 2024 21:16:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OyQlfBTp7Nlc; Sat,  7 Sep 2024 21:16:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E2E9260676
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E2E9260676;
	Sat,  7 Sep 2024 21:16:58 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 53A6B1BF41F
 for <buildroot@lists.busybox.net>; Sat,  7 Sep 2024 21:16:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 40FE4400F2
 for <buildroot@lists.busybox.net>; Sat,  7 Sep 2024 21:16:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GJXc5CMbmQ26 for <buildroot@lists.busybox.net>;
 Sat,  7 Sep 2024 21:16:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d29; helo=mail-io1-xd29.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 181FA40026
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 181FA40026
Received: from mail-io1-xd29.google.com (mail-io1-xd29.google.com
 [IPv6:2607:f8b0:4864:20::d29])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 181FA40026
 for <buildroot@buildroot.org>; Sat,  7 Sep 2024 21:16:56 +0000 (UTC)
Received: by mail-io1-xd29.google.com with SMTP id
 ca18e2360f4ac-82a2a035b59so166903139f.0
 for <buildroot@buildroot.org>; Sat, 07 Sep 2024 14:16:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725743816; x=1726348616;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=HNObtABniOth1MFbY7dW+4VGs80eGtwI8vq5WVzjoFw=;
 b=OuF5n8fuUMkimI26pADukr/gaChvSECog626nxwqV2YYBmDIYKsaBqz1P2T2OUzy9r
 h/CHXEDRbkU9JKCPUqutl1bl/hK4SE85VPwOQplmwbURGkomWc6l5isEl6Ug7VueeVNY
 MEsAd8DdNStaP+F3r7y9lA1cnkR/KLxLsEG1DrsL0V66hZ/3dIRcixGhS7GJqywueTqc
 JbnZ00X0KwZd2AZLbJM97Bo8orIBQtB2X1TfBAYu0wqslMxYIutI6hTVlZATHQ++7aRJ
 YtOAG4nM6aGId58LnQh2jhi+4qRnGQJwuH1+U0jcZ75ey02iEflPLMP8FdDsZI+bwcUf
 j/Pg==
X-Gm-Message-State: AOJu0YyDxXrjr3qQrFC4tlSmAwz4oV6CUmOlIcgQpeD5bilAwVkCx+3w
 Xt+8kINESEi4I8mvzULGwex4nZAxsGcrlt1lVBP4XNjUVbfROwbAr1laLA==
X-Google-Smtp-Source: AGHT+IEFP2bSogHdLQucHPdcDpOqpzr+Y0CFQFV2t7orFIC6q79rtLW9V/jU6/ydBgW2G1Bk15fNzA==
X-Received: by 2002:a05:6602:6c0b:b0:82a:2701:e715 with SMTP id
 ca18e2360f4ac-82a961891d2mr623146239f.5.1725743815749; 
 Sat, 07 Sep 2024 14:16:55 -0700 (PDT)
Received: from james-x399.localdomain (97-118-128-240.hlrn.qwest.net.
 [97.118.128.240]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4d09462f5f3sm362713173.90.2024.09.07.14.16.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Sep 2024 14:16:55 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  7 Sep 2024 15:16:38 -0600
Message-Id: <20240907211638.945542-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1725743816; x=1726348616; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=HNObtABniOth1MFbY7dW+4VGs80eGtwI8vq5WVzjoFw=;
 b=YJFqoPFQQTcQNQBq/JkhlZu1EOfujOMJC8gw8UWTA7CtNURt7JJpQsfWp9qF1+ppG3
 eVSGfkQMdm9BnSyhXs8DETy5rSbSRJiQWhAP/LXsGDUmU7jrjNQra/ooPBdD4/MH2c8C
 IRiXTyB6+WLfX/xOM6+a0rpN9aytRW04c1GfxjA+q41KJ1Vz08EycNRfZwAfppABFBsN
 A46/1ssjqAP8AaTAC22cCSTZzPmRP19xNn0UIsoJumka9WHuJ4HwPglpPZS460TzBwqG
 2KH2UeKkH/O7+I+c0TUWXwYIp2gamXyuJcDeAsm+PdG/ASWll/H/IBP50IzXtESwGzFC
 kvlA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=YJFqoPFQ
Subject: [Buildroot] [PATCH 1/1] package/python-maturin: bump to version
 1.7.1
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

Restore cargo2 archive suffix format as well.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-maturin/python-maturin.hash | 2 +-
 package/python-maturin/python-maturin.mk   | 7 ++++---
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/python-maturin/python-maturin.hash b/package/python-maturin/python-maturin.hash
index 3c5f836ad5..2b601d6ee9 100644
--- a/package/python-maturin/python-maturin.hash
+++ b/package/python-maturin/python-maturin.hash
@@ -1,5 +1,5 @@
 # Locally calculated after vendoring
-sha256  56c18b09d38080f9975fb679be1fda01b936d21f5ef233967cda3dd74905e683  maturin-1.7.0.tar.gz
+sha256  92c5fc2a24f32623a6994334b523a587dca63ebb5b46ae14a255a2ebc25fd3f7  python-maturin-1.7.1-cargo2.tar.gz
 # Locally computed sha256 checksums
 sha256  a60eea817514531668d7e00765731449fe14d059d3249e0bc93b36de45f759f2  license-apache
 sha256  ea7882c559733766ad08343bde1d1ec80a4967c03a738fb8e0058ef6289f7b7c  license-mit
diff --git a/package/python-maturin/python-maturin.mk b/package/python-maturin/python-maturin.mk
index 70cdb15949..76f136826a 100644
--- a/package/python-maturin/python-maturin.mk
+++ b/package/python-maturin/python-maturin.mk
@@ -4,9 +4,10 @@
 #
 ################################################################################
 
-PYTHON_MATURIN_VERSION = 1.7.0
-PYTHON_MATURIN_SOURCE = maturin-$(PYTHON_MATURIN_VERSION).tar.gz
-PYTHON_MATURIN_SITE = https://files.pythonhosted.org/packages/80/da/a4bbd6e97f3645f4ebd725321aa235e22e31037dfd92caf4539f721c0a5a
+PYTHON_MATURIN_VERSION = 1.7.1
+PYTHON_MATURIN_SOURCE_PYPI = maturin-$(PYTHON_MATURIN_VERSION).tar.gz
+PYTHON_MATURIN_SITE_PYPI = https://files.pythonhosted.org/packages/1d/ec/1f688d6ad82a568fd7c239f1c7a130d3fc2634977df4ef662ee0ac58a153
+PYTHON_MATURIN_SITE = $(PYTHON_MATURIN_SITE_PYPI)/$(PYTHON_MATURIN_SOURCE_PYPI)?buildroot-path=filename
 PYTHON_MATURIN_SETUP_TYPE = setuptools-rust
 PYTHON_MATURIN_LICENSE = Apache-2.0 or MIT
 PYTHON_MATURIN_LICENSE_FILES = license-apache license-mit
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
