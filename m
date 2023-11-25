Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7824DC61D9D
	for <buildroot@archiver.kernel.org>; Sat, 25 Nov 2023 04:56:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2386061520;
	Sat, 25 Nov 2023 04:56:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2386061520
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FXroN69J_J1j; Sat, 25 Nov 2023 04:56:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6EF9361506;
	Sat, 25 Nov 2023 04:56:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6EF9361506
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0D3471BF288
 for <buildroot@lists.busybox.net>; Sat, 25 Nov 2023 04:56:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D6EC582280
 for <buildroot@lists.busybox.net>; Sat, 25 Nov 2023 04:56:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D6EC582280
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id k6ROWjVBwEJw for <buildroot@lists.busybox.net>;
 Sat, 25 Nov 2023 04:56:26 +0000 (UTC)
Received: from mail-il1-x12c.google.com (mail-il1-x12c.google.com
 [IPv6:2607:f8b0:4864:20::12c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CCA2A8227A
 for <buildroot@buildroot.org>; Sat, 25 Nov 2023 04:56:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CCA2A8227A
Received: by mail-il1-x12c.google.com with SMTP id
 e9e14a558f8ab-359c22c44d6so9729855ab.2
 for <buildroot@buildroot.org>; Fri, 24 Nov 2023 20:56:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700888184; x=1701492984;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=XAv2Q517c+6Nkdj6mOJ9M025QjV7xeb927g4ljNlNHw=;
 b=vvO0mc25hRYBSz7htrvygH9ZJKCl/1+8qiHHCPJmtxRJQrane2T5vWOTPTwmLzGm8j
 GC0/NzjuyJm/ZFEUdlw2cMeaouJAWxxb4S/3Ym+hBKuy5D5lNwiHkYs2BwD5BZnpXbVN
 kGcfx0hHvoOJkNTO+TLLOJg9JYilqBY3TuMu3booBaqfRyZIXNPQ9eVJW/215HS5SqO+
 TnXdBwEjEOWJYaCYDXv483wOdsM1cD56N082fn1Pjop8tbIjFI8fV/pvLH+6zTWlm1Ml
 cY6LKqshrzaOMIis82YgYthZDQ2DUTLfcLCyhyrdpBb3AYwmX2V4rAe+bql46IYznA8E
 cZEQ==
X-Gm-Message-State: AOJu0YxpTCDjEdLVT5P0ZnVJQKBXxZzu3IrIBNK6OAANvyNem2ljlU0S
 8Zz+6iJorlYIBDYHkdNZbYE1vtW2qx0=
X-Google-Smtp-Source: AGHT+IHwkOMY5b+AVV0/kZ0rKLX8SmNQZNsGeGyGttRbA2O2VeJb7S5z4f6B4KsC+iFiLFvqV8SGAQ==
X-Received: by 2002:a05:6602:1556:b0:7b3:75a6:fff1 with SMTP id
 h22-20020a056602155600b007b375a6fff1mr347949iow.10.1700888184325; 
 Fri, 24 Nov 2023 20:56:24 -0800 (PST)
Received: from james-x399.localdomain (97-118-243-253.hlrn.qwest.net.
 [97.118.243.253]) by smtp.gmail.com with ESMTPSA id
 m21-20020a0566380ad500b0042b3e04510asm1165657jab.98.2023.11.24.20.56.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Nov 2023 20:56:23 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 24 Nov 2023 21:56:21 -0700
Message-Id: <20231125045621.258476-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1700888184; x=1701492984; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=XAv2Q517c+6Nkdj6mOJ9M025QjV7xeb927g4ljNlNHw=;
 b=AvUf72T+o2tjhm4kNYS4E1vt1ILrW4PMWiFmMV4fol8XM+dNH1Lv5uBo0f3KEgJbfx
 RmgItSmKb0ua0Jeu+15OgaTQkiWLgnyet97siVFXFeLuK+NOi/L/UuZRUFK86u8zdIFG
 jC5YoOEBg111n5vG37YXeF5xWnB7SlynqdYi2g2Qx57fmLv2Y+j0myhxs97xp0SKKKWQ
 8s9Wq13Kp/bPkEoAhfgZR3Am2EwNuq9zE48S6uAPmH81GrCT8O6+Sk7TXKSrLJtIp6r/
 BVTyNuXqxaj5BAHNaToJGk8ejg2oMkJ1Cp4k0CO1kgJpVJbQy0szkB4IE7ID5VEgbM+q
 0JLA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=AvUf72T+
Subject: [Buildroot] [PATCH 1/1] package/python-packaging: bump to version
 23.2
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
 package/python-packaging/python-packaging.hash | 4 ++--
 package/python-packaging/python-packaging.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-packaging/python-packaging.hash b/package/python-packaging/python-packaging.hash
index 0e339ea573..df75c3505c 100644
--- a/package/python-packaging/python-packaging.hash
+++ b/package/python-packaging/python-packaging.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/packaging/json
-md5  f7d5c39c6f92cc2dfa1293ba8f6c097c  packaging-23.1.tar.gz
-sha256  a392980d2b6cffa644431898be54b0045151319d1e7ec34f0cfed48767dd334f  packaging-23.1.tar.gz
+md5  d54eeff8c7ca86980528f4132f258d54  packaging-23.2.tar.gz
+sha256  048fb0e9405036518eaaf48a55953c750c11e1a1b68e0dd1a9d62ed0c092cfc5  packaging-23.2.tar.gz
 # Locally computed sha256 checksums
 sha256  cad1ef5bd340d73e074ba614d26f7deaca5c7940c3d8c34852e65c4909686c48  LICENSE
 sha256  0d542e0c8804e39aa7f37eb00da5a762149dc682d7829451287e11b938e94594  LICENSE.APACHE
diff --git a/package/python-packaging/python-packaging.mk b/package/python-packaging/python-packaging.mk
index aac4d76ee2..3e0f85c00a 100644
--- a/package/python-packaging/python-packaging.mk
+++ b/package/python-packaging/python-packaging.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PACKAGING_VERSION = 23.1
+PYTHON_PACKAGING_VERSION = 23.2
 PYTHON_PACKAGING_SOURCE = packaging-$(PYTHON_PACKAGING_VERSION).tar.gz
-PYTHON_PACKAGING_SITE = https://files.pythonhosted.org/packages/b9/6c/7c6658d258d7971c5eb0d9b69fa9265879ec9a9158031206d47800ae2213
+PYTHON_PACKAGING_SITE = https://files.pythonhosted.org/packages/fb/2b/9b9c33ffed44ee921d0967086d653047286054117d584f1b1a7c22ceaf7b
 PYTHON_PACKAGING_SETUP_TYPE = flit
 PYTHON_PACKAGING_LICENSE = Apache-2.0 or BSD-2-Clause
 PYTHON_PACKAGING_LICENSE_FILES = LICENSE LICENSE.APACHE LICENSE.BSD
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
