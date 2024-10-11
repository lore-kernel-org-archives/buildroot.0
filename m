Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2A96D24470
	for <buildroot@archiver.kernel.org>; Fri, 11 Oct 2024 17:43:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B6C1C60A83;
	Fri, 11 Oct 2024 17:43:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qmnWGyN3UIkb; Fri, 11 Oct 2024 17:43:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AF43B607CA
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id AF43B607CA;
	Fri, 11 Oct 2024 17:43:36 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3E6D21BF37C
 for <buildroot@lists.busybox.net>; Fri, 11 Oct 2024 17:43:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2D7C7607CA
 for <buildroot@lists.busybox.net>; Fri, 11 Oct 2024 17:43:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id utbWbMKGg_AE for <buildroot@lists.busybox.net>;
 Fri, 11 Oct 2024 17:43:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d2c; helo=mail-io1-xd2c.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 2112260590
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2112260590
Received: from mail-io1-xd2c.google.com (mail-io1-xd2c.google.com
 [IPv6:2607:f8b0:4864:20::d2c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2112260590
 for <buildroot@buildroot.org>; Fri, 11 Oct 2024 17:43:34 +0000 (UTC)
Received: by mail-io1-xd2c.google.com with SMTP id
 ca18e2360f4ac-8323b555a6aso127794339f.3
 for <buildroot@buildroot.org>; Fri, 11 Oct 2024 10:43:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728668614; x=1729273414;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=BSe1UO5KkFgBSHYt5aXKsGT0yt9Pi8uIcc8ks2Bf53M=;
 b=lEh4g53eyBtlqlZQ/qkmErKeoJPDMs7CFmTBa4RJ9+Jr2chRzQ1bYL3aUD7RsRUuuz
 96ci/I/NKVRLraB2V8590t9bzNRuTcYgnYQkqA6TZxbLnI1tOfR3KkxsBibUm6ReYHVT
 dthKeonjllFFeT9M2iQc+pijFITMuKa9d45oAJha5pr6/sdOV0N2dvRgJl/cnxoV0w/O
 rHPKYVaDva2q9k+B5+vJK25rrDI8ixvfPbxv75ykgTnc90HFz6Pvgcgsiv80XOlgp9SD
 xsu3CkxREtuf+BSwqO289jaJ/4KcrbBwweSDVuzR9HvTL1w+pXdiO3LVHF2Kf+PnqzaW
 PkDQ==
X-Gm-Message-State: AOJu0YwsbCHq2G2G1ZsfFeEuFwZZwSCkVM21U40pFaz4L39w1lp+50ax
 opMkepdWNZwK4StxW+PaRBjQS1XSg3q54x/jb9JaJ7wic4KNSVe2aXTOVy4I
X-Google-Smtp-Source: AGHT+IFM/so2ag0NDCtXwQqoKEpUlunTPKv02KwG4E/stZb+GuppsCoVY2CDjz3Ky+bp6Xh58kzl/g==
X-Received: by 2002:a05:6602:1489:b0:835:4d07:9d46 with SMTP id
 ca18e2360f4ac-8379531e3f3mr365365639f.15.1728668613691; 
 Fri, 11 Oct 2024 10:43:33 -0700 (PDT)
Received: from james-x399.localdomain (71-33-159-223.hlrn.qwest.net.
 [71.33.159.223]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4dbad8d713csm731762173.0.2024.10.11.10.43.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Oct 2024 10:43:33 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 11 Oct 2024 11:43:31 -0600
Message-Id: <20241011174331.2762999-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1728668614; x=1729273414; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=BSe1UO5KkFgBSHYt5aXKsGT0yt9Pi8uIcc8ks2Bf53M=;
 b=mvYRH8DcgTW2vT5p7jO/+XOHZi8vfT3Ne+gEGBhS1Q5UKXzCLdl3UB+TzH2GlLuyZd
 a6IBYVAWt9ALea1YrRh+CKqzCKevQLV5Jyp9lX+FJBc5arJn40e/zA/hKyytXNztooN6
 6zSbIcZtBrlGIu5NtPrmQ0yC0/1U5CO3xAUjBJff7JgPiHf6YdKe6GLZYvZGAVOKNKSv
 sSGDkktMMqDxJAVxBqdf24ReX4uH2Q6dTvC52idyCyFSuIu3lyJR+xrKJLF870msGY1N
 VgJ2IX1svlhnnPOR/9xuEY5ymJLtxWS4MLaRoYncnhdz8QMWrXBiKkUSXbLnkTK8286D
 bTYQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=mvYRH8Dc
Subject: [Buildroot] [PATCH 1/1] package/python-bleak: bump to version 0.22.3
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
 Marcin Niestroj <m.niestroj@grinn-global.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-bleak/python-bleak.hash | 4 ++--
 package/python-bleak/python-bleak.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-bleak/python-bleak.hash b/package/python-bleak/python-bleak.hash
index 577811b60a..2213ec2f70 100644
--- a/package/python-bleak/python-bleak.hash
+++ b/package/python-bleak/python-bleak.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/bleak/json
-md5  521fbbba851f4b6e9507ea27d06dc08b  bleak-0.22.2.tar.gz
-sha256  09010c0f4bd843e7dcaa1652e1bfb2450ce690da08d4c6163f0723aaa986e9fe  bleak-0.22.2.tar.gz
+md5  261eb442ba16707ed00a21265cd337fc  bleak-0.22.3.tar.gz
+sha256  3149c3c19657e457727aa53d9d6aeb89658495822cd240afd8aeca4dd09c045c  bleak-0.22.3.tar.gz
 # Locally computed sha256 checksums
 sha256  c4029a2b63b3824ab68be841f414addbdde20cb79cdbe272fa80c0b2abe65374  LICENSE
diff --git a/package/python-bleak/python-bleak.mk b/package/python-bleak/python-bleak.mk
index 4eabd3df75..5cb42aa2a5 100644
--- a/package/python-bleak/python-bleak.mk
+++ b/package/python-bleak/python-bleak.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_BLEAK_VERSION = 0.22.2
+PYTHON_BLEAK_VERSION = 0.22.3
 PYTHON_BLEAK_SOURCE = bleak-$(PYTHON_BLEAK_VERSION).tar.gz
-PYTHON_BLEAK_SITE = https://files.pythonhosted.org/packages/03/76/733131e2935f4fcdc7a0dd47cbc5090e12d578297804fb0482575db43f3c
+PYTHON_BLEAK_SITE = https://files.pythonhosted.org/packages/fb/96/15750b50c0018338e2cce30de939130971ebfdf4f9d6d56c960f5657daad
 PYTHON_BLEAK_SETUP_TYPE = pep517
 PYTHON_BLEAK_LICENSE = MIT
 PYTHON_BLEAK_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
