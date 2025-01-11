Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 325CEE7719A
	for <buildroot@archiver.kernel.org>; Sat, 11 Jan 2025 15:02:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EC00483A93;
	Sat, 11 Jan 2025 15:02:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bbRsGQ5hvQbf; Sat, 11 Jan 2025 15:02:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0F80C83A9F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0F80C83A9F;
	Sat, 11 Jan 2025 15:02:16 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0F09B950
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 15:02:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E409B83A89
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 15:02:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fNerLok0RbG9 for <buildroot@buildroot.org>;
 Sat, 11 Jan 2025 15:02:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::12d; helo=mail-il1-x12d.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org C04E383A87
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C04E383A87
Received: from mail-il1-x12d.google.com (mail-il1-x12d.google.com
 [IPv6:2607:f8b0:4864:20::12d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C04E383A87
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 15:02:12 +0000 (UTC)
Received: by mail-il1-x12d.google.com with SMTP id
 e9e14a558f8ab-3cdce23f3e7so21053955ab.0
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 07:02:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736607731; x=1737212531;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=YB/c8sKuDC0KKs89ukRqVLAnRTuH7p89Ux7PdhWO798=;
 b=R9xYjdrC64j3LuNMQdCG6b9mGEcbDXiU2MDRLMRxolufl0xcZHzbqj6hR2v1tF+hLd
 Ucj2E1gzd1AroSqiSFq8UMsb8JPW2g+HPzv4cESivS5o9etZ+SKIZ27YbeRlXuJ/vnwm
 jsbghjZ3DuxXbCwpdQ9UmVv2xox+YU7bBy8MhDd9F6uSdS4wE8quacSNJ0JmZiu98cNj
 xT9AIkehcCeExnaHRLctVWWOqFvP7PQ8++z9aoFyf5EC4wSNaH2P7Z4ldxH/XWWDD6h7
 ycronTRd+2dhrO7ND+gwuucX8O0qgCivys2XPJoANqMqtTssc3KsMcpHF2dB0osY8ba4
 utpA==
X-Gm-Message-State: AOJu0Yy2jR+7bYe4Oia3eWg04iq3bTCpmkulqpN6PwkZ326YQpp23S/n
 hYHiqupvZ53IXDfNhCH8w4UvWSvP1QNK+Uj8RPO23CGX3VFmkZfO9P51feb7dW8=
X-Gm-Gg: ASbGncscjZQZ/oh10gW6tawRWakdtM2vUiTBfwsJTpkfoZL/cnmmvP9Cw77a20+wwLS
 2n5aU43VaalVQ2n/k5Q2o+or/uEcEy77oMEF0JEcglQccX0GBKw4IuLbRsV5ydl5d4wKpZx6TMx
 37bZNLOwyr9QMbar2USQN7RUy3XkreG9ODgWDfG8ytQZTLMAAQzXl6MT2RNFS2OU7/otAU7gPbd
 VAoZMsg46ifvr5ptSCEdvgy+xp1B9Z4FVBbzcQdYPSNkqU8PlocI5ELUAhxcnJyw2fZ6iQAjCfm
 PI8QUDYsE0iaWoEt6DhyNnfvfEc6B7Q=
X-Google-Smtp-Source: AGHT+IEH0pFxiTIPMBIEOwHNBtTozs7FlezXJmiAhozo9xHNpFZU9b3kwxgonLRBkVIiOoc5SFTkwA==
X-Received: by 2002:a05:6e02:1a2c:b0:3a7:7ded:5219 with SMTP id
 e9e14a558f8ab-3ce3aa7c938mr119123555ab.21.1736607731524; 
 Sat, 11 Jan 2025 07:02:11 -0800 (PST)
Received: from james-x399.localdomain (71-218-115-58.hlrn.qwest.net.
 [71.218.115.58]) by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-3ce4afc3dd0sm15759085ab.67.2025.01.11.07.02.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 11 Jan 2025 07:02:11 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 11 Jan 2025 08:02:09 -0700
Message-Id: <20250111150209.2823450-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1736607731; x=1737212531; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=YB/c8sKuDC0KKs89ukRqVLAnRTuH7p89Ux7PdhWO798=;
 b=Cixca5Sed64/qw1YBKh8B5OLA0QTp0An704oaVnmw8PZvxwL0/CAn9af2Ruh/iLIAB
 yUVPsDcaoDm8BrLmDpyKSOOnOcM1Gsibnh1IYhpm3ICq55ABYnITbm5IYKI1V1K+IyXO
 a6Z1/xMSIW6/EVPqrf7wI3GPSP65rvl8o27sMflGyzKpanq2zQqwX6z83zQWeuLmbBQS
 /7DOFYrIqsgXjwC8n9n/Ps+6GPsxLxyT3+/e3Gh9WN2r5XC+W1mxKblu1DkJNYf/pG5u
 Fb9pNPehFXSe4FVzsfKe6rQOU/osanGINSERV0HN9EfxA/HZss8/sIfSqZzdym88WlIF
 /wNA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=Cixca5Se
Subject: [Buildroot] [PATCH 1/1] package/python-pillow: bump to version
 11.1.0
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
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

License hash changed due to end year removal:
https://github.com/python-pillow/Pillow/commit/513fe2ca2d23c7f1685b089fc6087ab02b2828df

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-pillow/python-pillow.hash | 6 +++---
 package/python-pillow/python-pillow.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-pillow/python-pillow.hash b/package/python-pillow/python-pillow.hash
index 0ef6ebc820..abc5a4bf2e 100644
--- a/package/python-pillow/python-pillow.hash
+++ b/package/python-pillow/python-pillow.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pillow/json
-md5  22912b3db645a51ab4b4ff036b559ca8  pillow-11.0.0.tar.gz
-sha256  72bacbaf24ac003fea9bff9837d1eedb6088758d41e100c1552930151f677739  pillow-11.0.0.tar.gz
+md5  ede5dce0bbbeff02099e2e297919a82a  pillow-11.1.0.tar.gz
+sha256  368da70808b36d73b4b390a8ffac11069f8a5c85f29eff1f1b01bcf3ef5b2a20  pillow-11.1.0.tar.gz
 # Locally computed sha256 checksums
-sha256  cf234c27a3f275f5a050f4df3946f8855704226fe4e7ca8b33928cbcecbced37  LICENSE
+sha256  17f240ae101143707e5e7303a5d800450d9ccc7475b463cedb555cefdb3c6ece  LICENSE
diff --git a/package/python-pillow/python-pillow.mk b/package/python-pillow/python-pillow.mk
index 9626268b6e..1053bec5d6 100644
--- a/package/python-pillow/python-pillow.mk
+++ b/package/python-pillow/python-pillow.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-PYTHON_PILLOW_VERSION = 11.0.0
-PYTHON_PILLOW_SITE = https://files.pythonhosted.org/packages/a5/26/0d95c04c868f6bdb0c447e3ee2de5564411845e36a858cfd63766bc7b563
+PYTHON_PILLOW_VERSION = 11.1.0
+PYTHON_PILLOW_SITE = https://files.pythonhosted.org/packages/f3/af/c097e544e7bd278333db77933e535098c259609c4eb3b85381109602fb5b
 PYTHON_PILLOW_SOURCE = pillow-$(PYTHON_PILLOW_VERSION).tar.gz
 PYTHON_PILLOW_LICENSE = HPND
 PYTHON_PILLOW_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
