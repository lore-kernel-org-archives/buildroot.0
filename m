Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B35BC021BE
	for <buildroot@archiver.kernel.org>; Sat, 14 Sep 2024 22:42:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0EB81605A5;
	Sat, 14 Sep 2024 22:42:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id etMYe8uK1ipT; Sat, 14 Sep 2024 22:42:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DC831607DF
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id DC831607DF;
	Sat, 14 Sep 2024 22:42:01 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id AFBB31BF3DB
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 22:42:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9ECF3607DF
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 22:42:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7ZgzyEZkapAJ for <buildroot@lists.busybox.net>;
 Sat, 14 Sep 2024 22:41:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::12d; helo=mail-il1-x12d.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 82620607DD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 82620607DD
Received: from mail-il1-x12d.google.com (mail-il1-x12d.google.com
 [IPv6:2607:f8b0:4864:20::12d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 82620607DD
 for <buildroot@buildroot.org>; Sat, 14 Sep 2024 22:41:59 +0000 (UTC)
Received: by mail-il1-x12d.google.com with SMTP id
 e9e14a558f8ab-3a097ff7d89so2078575ab.3
 for <buildroot@buildroot.org>; Sat, 14 Sep 2024 15:41:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726353718; x=1726958518;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=XYvuPvb1eSxkKMzU7odtfnPCnHu+DDMQ1hlXGCQSfQ0=;
 b=j53AtSHyiR8StmakslZ8xR4L7fRdI/a52AXSl/9iWpPPePSz7mBTrc6RWSuSMUrCEg
 NiapR9p1Xcx6l3UltN6+oACMetDDdlgh6sOYQkanU/iDpUeopsSzs9/nROaaZsSkAlyP
 pZvGidZBrO+jAubV60aUYHUtEistjttNFZ0+p/2Fgbe+UuQ952MF5sC7MAE50bVcr2tC
 5a+5z7j31jpzKkEPph+hUbsVJlbHf5pFzmrV7F/4c8tlENT5sjnr0LS8QbiLOS/EsLs6
 a4+eO9X7+AjyYCl9yDf6UCstggLERD5impWHyRebXbKpfumT9IBEFNvvBXzWk6rcn1su
 OQRQ==
X-Gm-Message-State: AOJu0YztUBFY2MbAzHmYiy0xuBwxrn3+j9wwg5O9GREUizcjimD9vtXi
 npkeUkpsyBp8MQ0CVUa8lBmJMEvBDUtkIi4iQSLWfSrJTWvx4Vp9yCy+0w==
X-Google-Smtp-Source: AGHT+IHHIG+ni4QfLNTmfr4QPha1b+C20GR54DIHkL67aPV67rKLWb9/+VQXFYKEr49vHHRWvgx4xg==
X-Received: by 2002:a05:6e02:b23:b0:3a0:4d41:b8ee with SMTP id
 e9e14a558f8ab-3a08b79c88amr77112295ab.21.1726353718210; 
 Sat, 14 Sep 2024 15:41:58 -0700 (PDT)
Received: from james-x399.localdomain (71-218-252-223.hlrn.qwest.net.
 [71.218.252.223]) by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-3a092e14a93sm6810665ab.29.2024.09.14.15.41.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 14 Sep 2024 15:41:57 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 14 Sep 2024 16:41:56 -0600
Message-Id: <20240914224156.1363470-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726353718; x=1726958518; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=XYvuPvb1eSxkKMzU7odtfnPCnHu+DDMQ1hlXGCQSfQ0=;
 b=ZiRdodIKUGKQXzxvcDPUPc/0kUWSaQ23ac8rfUYco3mADtBW0zvxsAkI5rpqZeaZLP
 /0ibEfRNGXnleSQXu5FjyFvGZZhXhJjsJ4F2xfeDmr8OR6gcTFxlw5mLdNiw3X0sgGNF
 LsAEOkn9dOaj0vQeGzJh0VYlTLO+OMkhaJpZvjBwMDxONM4MDyqo618MkIpYjwkcsU77
 sr/gg/Iw2r0lCs+Xlgacai3JOM60R1UMkaymAPjBvNDtZUdNgVanDnots4yRcXqtJz3D
 CObpBQ1ZPJsIJof1teaMHfZZbDAhxsc6/4davvp/cv2RTxBcg72sGTusLAhsdPWRAKMd
 adKg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=ZiRdodIK
Subject: [Buildroot] [PATCH 1/1] package/python-bottle: bump to version
 0.13.1
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

License hash changed due to year update:
https://github.com/bottlepy/bottle/commit/98bf0d7e555ad0f6901280c9937b853f5c10bd54

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-bottle/python-bottle.hash | 6 +++---
 package/python-bottle/python-bottle.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-bottle/python-bottle.hash b/package/python-bottle/python-bottle.hash
index 48a576aaec..1b3f28c0ce 100644
--- a/package/python-bottle/python-bottle.hash
+++ b/package/python-bottle/python-bottle.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/bottle/json
-md5  7d79d6131ecd524530f4e919bc60f444  bottle-0.12.25.tar.gz
-sha256  e1a9c94970ae6d710b3fb4526294dfeb86f2cb4a81eff3a4b98dc40fb0e5e021  bottle-0.12.25.tar.gz
+md5  d4f5cf1d573c2166fbd25093a54b0d6c  bottle-0.13.1.tar.gz
+sha256  a48852dc7a051353d3e4de3dd5590cd25de370bcfd94a72237561e314ceb0c88  bottle-0.13.1.tar.gz
 # Locally computed sha256 checksums
-sha256  d0e7211f1c3c1a1c56f39d18bcb07f27f480c8a9552617756dda3a335933b8a6  LICENSE
+sha256  af150257b1f7cce92b6207854f2e8f90ea9ae52d7cac758d13a47bd12e2a2443  LICENSE
diff --git a/package/python-bottle/python-bottle.mk b/package/python-bottle/python-bottle.mk
index b35f726f95..567c7a2ffd 100644
--- a/package/python-bottle/python-bottle.mk
+++ b/package/python-bottle/python-bottle.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_BOTTLE_VERSION = 0.12.25
+PYTHON_BOTTLE_VERSION = 0.13.1
 PYTHON_BOTTLE_SOURCE = bottle-$(PYTHON_BOTTLE_VERSION).tar.gz
-PYTHON_BOTTLE_SITE = https://files.pythonhosted.org/packages/fd/04/1c09ab851a52fe6bc063fd0df758504edede5cc741bd2e807bf434a09215
+PYTHON_BOTTLE_SITE = https://files.pythonhosted.org/packages/87/7e/eae463f832f64b3a1cb640384d155079e7dd2905116ab925e9bb04f66e75
 PYTHON_BOTTLE_LICENSE = MIT
 PYTHON_BOTTLE_LICENSE_FILES = LICENSE
 PYTHON_BOTTLE_CPE_ID_VENDOR = bottlepy
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
