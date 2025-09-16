Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EE04CAC599
	for <buildroot@archiver.kernel.org>; Tue, 16 Sep 2025 01:21:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0E9D24091E;
	Tue, 16 Sep 2025 01:21:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1rgcWePQvVbk; Tue, 16 Sep 2025 01:21:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4A0C34096E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4A0C34096E;
	Tue, 16 Sep 2025 01:21:21 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id B02C6199
 for <buildroot@buildroot.org>; Tue, 16 Sep 2025 01:21:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A1F454091C
 for <buildroot@buildroot.org>; Tue, 16 Sep 2025 01:21:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5fO_PWG3flox for <buildroot@buildroot.org>;
 Tue, 16 Sep 2025 01:21:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::132; helo=mail-il1-x132.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org D89934091E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D89934091E
Received: from mail-il1-x132.google.com (mail-il1-x132.google.com
 [IPv6:2607:f8b0:4864:20::132])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D89934091E
 for <buildroot@buildroot.org>; Tue, 16 Sep 2025 01:21:18 +0000 (UTC)
Received: by mail-il1-x132.google.com with SMTP id
 e9e14a558f8ab-407ec3048a0so52938215ab.3
 for <buildroot@buildroot.org>; Mon, 15 Sep 2025 18:21:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757985678; x=1758590478;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=f4+AT5jKP+y/es0/AVybG0v2VVkx/a9jW8azPGQ2dO0=;
 b=MXuOw7SCVpumZY22/mjivMzFfWF1KZ6DQW1U8uGuBUx7Eu9yhol907QMy722PAMNSS
 qCrqwYnaECKDRZd+YgHyeR/WiW7htUf3kkYNC4Og8eeEZqt+8wGuLFDMGZwlga2St9ag
 iSU/oZrjUoPIr+Jxr76nMFZ2TTu56q4gDiRVuO644LvRfyS4aMuIrdoW0Kss95zDP6xw
 XWprSoR38vNMo8QL+Xs5cVao0QInVVAXkAr3XfbvYSwSZpbXUxc5BrcWZ3E9dpdKqe/o
 xd3ck0DbU0600bk0eQ9+I5fKoej6UNdwz/+PZGMlmjbkYcOcKBc5WQ46CyGd0aZSYz0R
 kPBA==
X-Gm-Message-State: AOJu0Yyk8ghny92Z/vEjtZEP8UgXfyR7BYp7ApWICiqSI5kboE3ymhRv
 h6H4kAFecqi4y60QO1sdLqDqQuCWB17GIKsUITym7eIBObyCM/p+REq8kJwG/g==
X-Gm-Gg: ASbGnctyG0Cy3z801K8cc2vdOV4AS9gtq04PP/KJ1h69FceJlgqnNbak4UflCnADA8D
 1VgR9jBZBRTrV0h9Ry16XohCpa+mNCDAuNlE35INJ1bHtfjLVmiP1xb8Ed8PrUEPXVY1WJ5+7uZ
 AiKZn1dXbE9RubMhl+XgcST5H/1dRPFgFaoR+t5eEOF389e17p2Zk1D/8Ztqpj4uWpV3zoeYuf8
 nFw0B4UmEQqvZyuUQVsOAejrWl/IfZEPRh832Tic5Q19N/yMJPHptqneOg2Vy+usjZJufoX0aw1
 IzPO+70Umh2eiH7V4mvChClvmHFdxg7B+yCDf8zsFzAZYTjQdeJbLFc09MvOSvn/80uxITHHgph
 cMOwNpx65mQra1au/V86rOgbPZRqxAwpXkMGNgbZihoauDHOSSrRb/Vs1SZHmzmL5pk9zT2lr2w
 vEgMDQ0+qckyw=
X-Google-Smtp-Source: AGHT+IEx8h+TNMbP2cksZN1ulu6qpeaTOS/N2BWAEYpQRA+an/bYgJGry+2HaCVRraoYiH8i8wzh4A==
X-Received: by 2002:a05:6e02:4406:10b0:422:62f8:20ef with SMTP id
 e9e14a558f8ab-42262f82257mr101979065ab.19.1757985677693; 
 Mon, 15 Sep 2025 18:21:17 -0700 (PDT)
Received: from james-x399.localdomain (71-218-100-179.hlrn.qwest.net.
 [71.218.100.179]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-5120ef21180sm3444508173.55.2025.09.15.18.21.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Sep 2025 18:21:17 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 15 Sep 2025 19:21:10 -0600
Message-ID: <20250916012110.2570851-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1757985678; x=1758590478; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=f4+AT5jKP+y/es0/AVybG0v2VVkx/a9jW8azPGQ2dO0=;
 b=Bt+GGmkJeI8mdWa14DYrsZigAPmMgXjKA+Aquzk9DmUorf+govpzNep3DR3rKy69wz
 BAU+UG4tjYwzkUkpD59rz1217viHg/N+jBhf/sy5Yxj72EOOx5QdwRQU+iCzOua40yiF
 R1f4MiOlw9k7RhU8tkPWBwguRHC0LJTFSk6q6/iI5w2Y9l7PXS8Y1xcQsU6/DGZ7dBqO
 ZK8RkX692dlgd/tgq7HYMK1IVNmJvuFB4j2PkWREAMMk0qSY4hWXh9S+f/KTT/1pxVwL
 JYF5/rliz8knrZGd7I2XUMMU1nlxngrZc6oJw1qyX1wD5v8b10qeJwNxqHWaejIl2faN
 unog==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Bt+GGmkJ
Subject: [Buildroot] [PATCH 1/1] package/python-uswid: bump to version 0.5.2
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
 package/python-uswid/python-uswid.hash | 4 ++--
 package/python-uswid/python-uswid.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-uswid/python-uswid.hash b/package/python-uswid/python-uswid.hash
index eb9011bad6..3385fc58a0 100644
--- a/package/python-uswid/python-uswid.hash
+++ b/package/python-uswid/python-uswid.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/uswid/json
-md5  dc9a4aa4f9293b9e24c35c14dad6f296  uswid-0.5.1.tar.gz
-sha256  92b48a8f6601687c1cc556878571abf9ddb0bdbaf244713b7ff838c48fcb68b3  uswid-0.5.1.tar.gz
+md5  3d4295821faf35512528381716126c03  uswid-0.5.2.tar.gz
+sha256  1d6c53acf160edc9b42e4ba535343b3567f2f341d289b9e63ca6a84372c2c518  uswid-0.5.2.tar.gz
 # Locally computed sha256 checksums
 sha256  98bc07f3fb70d05b01ff740e8191b9f29c080159f01588991fbd872c611236f9  LICENSE
diff --git a/package/python-uswid/python-uswid.mk b/package/python-uswid/python-uswid.mk
index e6ca702742..8596307938 100644
--- a/package/python-uswid/python-uswid.mk
+++ b/package/python-uswid/python-uswid.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_USWID_VERSION = 0.5.1
+PYTHON_USWID_VERSION = 0.5.2
 PYTHON_USWID_SOURCE = uswid-$(PYTHON_USWID_VERSION).tar.gz
-PYTHON_USWID_SITE = https://files.pythonhosted.org/packages/5c/67/9244d29d6391d49f30128da6c73a61c7a6c1f8bfcf0181f83298aa050832
+PYTHON_USWID_SITE = https://files.pythonhosted.org/packages/15/64/d200424bf8f87ef25b516d438d745b03aa4ec381756d86cc3ff6bf29393c
 PYTHON_USWID_SETUP_TYPE = setuptools
 PYTHON_USWID_LICENSE = BSD-2-Clause-Patent
 PYTHON_USWID_LICENSE_FILES = LICENSE
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
