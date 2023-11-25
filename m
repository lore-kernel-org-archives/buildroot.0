Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E44E6C61D9D
	for <buildroot@archiver.kernel.org>; Sat, 25 Nov 2023 04:59:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9618B61520;
	Sat, 25 Nov 2023 04:59:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9618B61520
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id X6fHvz56aZ3l; Sat, 25 Nov 2023 04:59:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0359C61506;
	Sat, 25 Nov 2023 04:59:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0359C61506
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 644FC1BF20B
 for <buildroot@lists.busybox.net>; Sat, 25 Nov 2023 04:59:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 43BB84212F
 for <buildroot@lists.busybox.net>; Sat, 25 Nov 2023 04:59:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 43BB84212F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id F1m3Q1snB4m9 for <buildroot@lists.busybox.net>;
 Sat, 25 Nov 2023 04:59:18 +0000 (UTC)
Received: from mail-il1-x135.google.com (mail-il1-x135.google.com
 [IPv6:2607:f8b0:4864:20::135])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5FF3442129
 for <buildroot@buildroot.org>; Sat, 25 Nov 2023 04:59:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5FF3442129
Received: by mail-il1-x135.google.com with SMTP id
 e9e14a558f8ab-359d559766cso8718885ab.1
 for <buildroot@buildroot.org>; Fri, 24 Nov 2023 20:59:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700888357; x=1701493157;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=RpImPfqHVwNSBN6rcYsRSTN7dFFccyyLABelJR4Mp+8=;
 b=Ai3UMmMAcgpD+e9HG0f9vR0Og/TAXS0tejqedCd+wIMxmpXTct4InrgQsJN23o5fay
 XrjSMpme9uT1ep3f2/C4kcPQu0Kz/lFPLfyoJ6csz5ZsimUrGf199G6Z8DHssDbTPBab
 6QtbVx0C2wAcyXkXc6FTU+24r7vRL6ew7AIxEPk5gTmjuM5gIWwpGcFdTOdHikCJhT5v
 YTAIZsqO/DianXGk7jSVUR4EaU9k7MB+5O1EYmJRcQdmNqxPFB7FbJA4r4GJ6Mzkh7oS
 HN6FXg9F8etcKe4jr9TOlyOnkxUk44GuaTqGlfkC7wqdLaeAQccHyNPtZehGll1WTLGa
 9dKQ==
X-Gm-Message-State: AOJu0YzidT29MVjvhWFGZzrtElS3Gv5MDOZmUecOZeTu3UynqN3M9xTx
 iYGOTq+SPlDM0Zz80uPrHSfP1SjjvUg=
X-Google-Smtp-Source: AGHT+IGwchUGahzfiFwOaZx9sw5xMCSoZWX8RfTFmOG2iAjBuQn/esaeXECb1h8DttGO8Y8B3hfQ5g==
X-Received: by 2002:a05:6e02:2142:b0:35c:94a5:c324 with SMTP id
 d2-20020a056e02214200b0035c94a5c324mr241741ilv.31.1700888356934; 
 Fri, 24 Nov 2023 20:59:16 -0800 (PST)
Received: from james-x399.localdomain (97-118-243-253.hlrn.qwest.net.
 [97.118.243.253]) by smtp.gmail.com with ESMTPSA id
 bo33-20020a056e02342100b0035b0b05189bsm1445770ilb.38.2023.11.24.20.59.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Nov 2023 20:59:16 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 24 Nov 2023 21:59:13 -0700
Message-Id: <20231125045913.260352-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1700888357; x=1701493157; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=RpImPfqHVwNSBN6rcYsRSTN7dFFccyyLABelJR4Mp+8=;
 b=gxmha6irMKiyWdpOwSDoc8ECiwibD3KEgA+oCdibwPPqMBIc14D+vx/NCoChzWC6xs
 28PrXJd5FtR8p5KpP1TE9SSd0LAaN+3iA/GxpNHZIxBHBr1ffVDNKhZiiEt7FnKLOfxU
 fweIOl02G74zaueyGLGYn5cDJ/L+UUqJlGDGXgIYG4lQmSdatP8lEbvNE1h4OdHmK6q6
 XgUpvmsJVcRMNcEkH9RjSPycFxE1JgVusgg0KxjGwtSJLjDeiFSMhcN0DpHthrkb1JZm
 GJD2QGNXf6yEu0GebfrZA2duePMQw/sqkui5HVblPr+pa+fITJ262Bfzs0X7Ps8P9oLx
 3C+Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=gxmha6ir
Subject: [Buildroot] [PATCH 1/1] package/python-paramiko: bump to version
 3.3.1
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

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-paramiko/python-paramiko.hash | 4 ++--
 package/python-paramiko/python-paramiko.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-paramiko/python-paramiko.hash b/package/python-paramiko/python-paramiko.hash
index b327a6b8a9..abc62fc8c2 100644
--- a/package/python-paramiko/python-paramiko.hash
+++ b/package/python-paramiko/python-paramiko.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/paramiko/json
-md5  3f49814473cc153a7189fec31cfacfab  paramiko-2.12.0.tar.gz
-sha256  376885c05c5d6aa6e1f4608aac2a6b5b0548b1add40274477324605903d9cd49  paramiko-2.12.0.tar.gz
+md5  08b1610e3ba9fa89e13973710cd48e35  paramiko-3.3.1.tar.gz
+sha256  6a3777a961ac86dbef375c5f5b8d50014a1a96d0fd7f054a43bc880134b0ff77  paramiko-3.3.1.tar.gz
 # Locally computed sha256 checksums
 sha256  5fa25bf5f395fd26e701c2e1de4ca7d162816986dc791c22f8f4226857ad1bb2  LICENSE
diff --git a/package/python-paramiko/python-paramiko.mk b/package/python-paramiko/python-paramiko.mk
index 621176ed41..512a4630f5 100644
--- a/package/python-paramiko/python-paramiko.mk
+++ b/package/python-paramiko/python-paramiko.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PARAMIKO_VERSION = 2.12.0
+PYTHON_PARAMIKO_VERSION = 3.3.1
 PYTHON_PARAMIKO_SOURCE = paramiko-$(PYTHON_PARAMIKO_VERSION).tar.gz
-PYTHON_PARAMIKO_SITE = https://files.pythonhosted.org/packages/98/75/e78ddbe671a4a59514b59bc6a321263118e4ac3fe88175dd784d1a47a00f
+PYTHON_PARAMIKO_SITE = https://files.pythonhosted.org/packages/44/03/158ae1dcb950bd96f04038502238159e116fafb27addf5df1ba35068f2d6
 PYTHON_PARAMIKO_SETUP_TYPE = setuptools
 PYTHON_PARAMIKO_LICENSE = LGPL-2.1+
 PYTHON_PARAMIKO_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
