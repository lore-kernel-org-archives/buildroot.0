Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54F9DD3610E
	for <buildroot@archiver.kernel.org>; Tue,  5 Nov 2024 19:17:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 212F080F8B;
	Tue,  5 Nov 2024 19:17:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id v8PxwGrBD5tk; Tue,  5 Nov 2024 19:17:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3E60380F94
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3E60380F94;
	Tue,  5 Nov 2024 19:17:08 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 2E58A3B
 for <buildroot@buildroot.org>; Tue,  5 Nov 2024 19:17:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0F83360878
 for <buildroot@buildroot.org>; Tue,  5 Nov 2024 19:17:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id X4EYvueiky3d for <buildroot@buildroot.org>;
 Tue,  5 Nov 2024 19:17:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d29; helo=mail-io1-xd29.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 0829360872
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0829360872
Received: from mail-io1-xd29.google.com (mail-io1-xd29.google.com
 [IPv6:2607:f8b0:4864:20::d29])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0829360872
 for <buildroot@buildroot.org>; Tue,  5 Nov 2024 19:17:04 +0000 (UTC)
Received: by mail-io1-xd29.google.com with SMTP id
 ca18e2360f4ac-83a9be2c0e6so229468739f.2
 for <buildroot@buildroot.org>; Tue, 05 Nov 2024 11:17:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730834223; x=1731439023;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=w0PalD8i166DsxmWvITXYjPpzASDaz6w4exEDkUZwXc=;
 b=Gf794eq4tmTVWFJcubCKtmmgZr/NTKvz2tRJKrx3zyv3fV4OcLsZ21ZU2753msLvtU
 Bglu2VDdirgufyTWocLPjFG8VemvP79XPNzhkaUDSOSUqtvt0Wo649Ub+WVrOfTvv+Af
 Lts8oD1TFHa7xF9bzzZIvlAhoPPBoQrLpsXisSdVozGSuZy2vOhWLaZxH1BQ8E6cTsOK
 KptQfd6sXour/qVLcvpBD/t/RgJZTxNLhCP33Bx6BcT+ePbmdADaHrgthSeuNNTcLXPa
 74yt7qB2IXECFvNzRorDR29X/rdzexkXhwku2ebDvEnFuzdDVQY2HaGCGufX6qUmx2Td
 wheg==
X-Gm-Message-State: AOJu0Yytcub0bmnpNBuJVMLN2M1AaLj9gznV5H4nQ9v+jIpPDM2KEoO2
 8SweIQHAovFH+s4wlKVsJULTX+3l+syGNw8WVNyVfv0QXeyYzmIC1/lbWg==
X-Google-Smtp-Source: AGHT+IF178aDTcq+rotcNLUFgyRoo4K9PLl9XGwaOy58FzzjnWvPT2ra1wB73h479JKjfIHLtFqlug==
X-Received: by 2002:a05:6602:15ca:b0:83a:d3cc:779a with SMTP id
 ca18e2360f4ac-83b719f04a6mr1867315839f.11.1730834223475; 
 Tue, 05 Nov 2024 11:17:03 -0800 (PST)
Received: from james-x399.localdomain (97-118-131-57.hlrn.qwest.net.
 [97.118.131.57]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4de04889521sm2557797173.24.2024.11.05.11.17.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Nov 2024 11:17:03 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  5 Nov 2024 12:17:02 -0700
Message-Id: <20241105191702.1582087-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1730834223; x=1731439023; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=w0PalD8i166DsxmWvITXYjPpzASDaz6w4exEDkUZwXc=;
 b=aDslqPX8Q2f9K3PBrLVpcl39C9Dh3Ld2PBsiG7LKP/MsuIZ6X++u93o65bSGTgsQ3w
 0WYpXDez3U8IJFMyhiTOhzZ+ApntazN2UpGGiRsF/SRuFr7It7tYKRhSJXjEzu2+j8Vp
 r1IT4j7TP6FlGG9FbSyhg7x3+9wu4KBPxe5Ukx5Q6srV5EZdOMKPoiUfj7L6+F09Bkma
 5beJLhXTqTRtTdQ9pb1xSFpJTuviXMXXnoZy+Jtk/LErGW23sJyuF1E9oY0bPVfAmTFu
 3CXPNTShOmpeKo0LHUB+Ogi3IMyDlGLEhcq0uQ4HliDJM11DLZaRmjbAqJWdEfNLMdkX
 1tuA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=aDslqPX8
Subject: [Buildroot] [PATCH 1/1] package/python-watchdog: bump to version
 6.0.0
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-watchdog/python-watchdog.hash | 4 ++--
 package/python-watchdog/python-watchdog.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-watchdog/python-watchdog.hash b/package/python-watchdog/python-watchdog.hash
index 4377871db2..508cf88b27 100644
--- a/package/python-watchdog/python-watchdog.hash
+++ b/package/python-watchdog/python-watchdog.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/watchdog/json
-md5  83499e8a193ba23bb68436fbdc249589  watchdog-5.0.3.tar.gz
-sha256  108f42a7f0345042a854d4d0ad0834b741d421330d5f575b81cb27b883500176  watchdog-5.0.3.tar.gz
+md5  d3adf236e17e5747e397f7d0b93e05b4  watchdog-6.0.0.tar.gz
+sha256  9ddf7c82fda3ae8e24decda1338ede66e1c99883db93711d8fb941eaa2d8c282  watchdog-6.0.0.tar.gz
 # Locally computed sha256 checksums
 sha256  39f081828db6f94c70123fa4fb30c1bce3e215a8fdece53a49991fe076a69c08  COPYING
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/python-watchdog/python-watchdog.mk b/package/python-watchdog/python-watchdog.mk
index f5ef770fcf..888cce6e1a 100644
--- a/package/python-watchdog/python-watchdog.mk
+++ b/package/python-watchdog/python-watchdog.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_WATCHDOG_VERSION = 5.0.3
+PYTHON_WATCHDOG_VERSION = 6.0.0
 PYTHON_WATCHDOG_SOURCE = watchdog-$(PYTHON_WATCHDOG_VERSION).tar.gz
-PYTHON_WATCHDOG_SITE = https://files.pythonhosted.org/packages/a2/48/a86139aaeab2db0a2482676f64798d8ac4d2dbb457523f50ab37bf02ce2c
+PYTHON_WATCHDOG_SITE = https://files.pythonhosted.org/packages/db/7d/7f3d619e951c88ed75c6037b246ddcf2d322812ee8ea189be89511721d54
 PYTHON_WATCHDOG_SETUP_TYPE = setuptools
 PYTHON_WATCHDOG_LICENSE = Apache-2.0
 PYTHON_WATCHDOG_LICENSE_FILES = LICENSE COPYING
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
