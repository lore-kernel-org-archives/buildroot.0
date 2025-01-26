Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D078FC02181
	for <buildroot@archiver.kernel.org>; Sun, 26 Jan 2025 14:15:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 904C781210;
	Sun, 26 Jan 2025 14:15:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id abUbXD32DNRV; Sun, 26 Jan 2025 14:15:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9DAE98120F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9DAE98120F;
	Sun, 26 Jan 2025 14:15:29 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id CEFAE94A
 for <buildroot@buildroot.org>; Sun, 26 Jan 2025 14:15:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BA51D400E0
 for <buildroot@buildroot.org>; Sun, 26 Jan 2025 14:15:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9_vfX6KbIHft for <buildroot@buildroot.org>;
 Sun, 26 Jan 2025 14:15:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::135; helo=mail-il1-x135.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 8F56B4004A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8F56B4004A
Received: from mail-il1-x135.google.com (mail-il1-x135.google.com
 [IPv6:2607:f8b0:4864:20::135])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8F56B4004A
 for <buildroot@buildroot.org>; Sun, 26 Jan 2025 14:15:26 +0000 (UTC)
Received: by mail-il1-x135.google.com with SMTP id
 e9e14a558f8ab-3cfc79a8a95so6961675ab.2
 for <buildroot@buildroot.org>; Sun, 26 Jan 2025 06:15:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737900925; x=1738505725;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=WwYht/z9BDB5xY6LAeQY6OsZNK8V4JOF88y713tXK7U=;
 b=UHUFYyHqg59IBjPi4rzxiQHmwHmQSrRtGICNrpzULq0poKkadUVFpaCB/XX7bwPKyb
 qgqq6Y2qfMI0TBmxBWreAyEZ7+xcd8uDUI0iydRFF6oChHT8CSy6IxhayzTfqCMc5u60
 h4Ah1l/EtTW20KH545HrDfjK05Qju0r+LFXy+/zOPbjTKzKPREK74CywK5evqiIdZq2G
 iD1iRaa+/QszP0dyK0jpaepSKE8xcJ/l/XvRxw+w3YvXjyY30UUbiUZBNP33p8pf1eSk
 bg+b1gwyXmLuzKpE/8qQV3hiJ97eoDoRydYPELtHUo2JbgmyNrtszfUQq6SEfid/r7BU
 rO+g==
X-Gm-Message-State: AOJu0YwgsMuOC46O6OZXeCE3Vef3KqVGFd8OZNFQCcY/ykNrSGhdKphu
 vE6nFkY/+Y9OHpK9FEEPgaSo97E9SY+EoQRoqJ001jr1ZOpDxFxW2N/agMa8
X-Gm-Gg: ASbGncv1rA4buVLCDwJ6YMTdSqwNR65wlW+VfP0Noj8byrqJkioH+2cswP5rQLpMZVE
 slyVJHaVRJxiwwePzEyUiABvt6t01jmjvl+GSsjLLW9Z7rhr3AQN4OGLlZEKXEyZVuVFgUdFkGF
 ZRqWGaUWau+BH/DiBL1PhTwGTfhzWe+ImZkywsvOtcyAJzSxl+BQtknpNbYjYJAIQbXG+qmHjWT
 ieCAKTFxNbKH2PN5dijA/iYGs2C/1Y5HA+IgXNLeTujJG+Eb10WYNiXSAJkCd+jPFIzR/ZVBYxh
 xLJrzqoGqcK+F1YSRhNAK57rwjGYtsUFub1O3mdMoKjrSJdU3vYmjE0=
X-Google-Smtp-Source: AGHT+IHUY0ipuUoNcUf4YHHASBLOtuahpsNxjaXJtaMzf22WsXpTzLE657Om4WPheLMD21k3x2B9bQ==
X-Received: by 2002:a05:6e02:198a:b0:3cf:b4fe:8d02 with SMTP id
 e9e14a558f8ab-3cfb4fe8eb0mr178078485ab.21.1737900925189; 
 Sun, 26 Jan 2025 06:15:25 -0800 (PST)
Received: from james-x399.localdomain (71-218-115-58.hlrn.qwest.net.
 [71.218.115.58]) by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-3cfc740f5dcsm20344865ab.3.2025.01.26.06.15.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Jan 2025 06:15:23 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 26 Jan 2025 07:15:22 -0700
Message-Id: <20250126141522.237768-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1737900925; x=1738505725; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=WwYht/z9BDB5xY6LAeQY6OsZNK8V4JOF88y713tXK7U=;
 b=FgUd8VmJ0T4+udmMbQC9ojHCUGzCxlc7l0I8JzKTXakszuovUC/SQIi4RESnfxrmUN
 2MkmI4WDacjOyM2r2JC2RqofNZMcAocjsaF2Zq6L1Z3Q7+1LE84TPHnn47ybHvmFPqbt
 kERIrpzLUdELp2UHShJKBYetsp5UHCR81UY8YoldHt2XZEd7ON+9PDaf4hjLeyUqglR5
 8BQrAlfyGCuSMkyabxeI+etM+aveJ0zWjooFO5q1+VX/qHSsb3L5/V/2i/0L5IEs/sio
 h91MXgfQY8RdwvndPcGHejqIzGPjwlu5W6aImizQ6KkVhuS2DB/FAN9IhXqCS5OKnvvc
 VP1Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=FgUd8VmJ
Subject: [Buildroot] [PATCH 1/1] package/python-evdev: bump to version 1.8.0
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

License hash changed due to date update:
https://github.com/gvalkov/python-evdev/commit/2e3b843f37f79a9404da4541bbf9cf96dc5a4d57

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-evdev/python-evdev.hash | 6 +++---
 package/python-evdev/python-evdev.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-evdev/python-evdev.hash b/package/python-evdev/python-evdev.hash
index afa74c792b..d31e236989 100644
--- a/package/python-evdev/python-evdev.hash
+++ b/package/python-evdev/python-evdev.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/evdev/json
-md5  c20a623d2d05fd87c1f46d736ee9c3cc  evdev-1.7.1.tar.gz
-sha256  0c72c370bda29d857e188d931019c32651a9c1ea977c08c8d939b1ced1637fde  evdev-1.7.1.tar.gz
+md5  a38ac9e2297940430bb27cea41be964e  evdev-1.8.0.tar.gz
+sha256  45598eee1ae3876a3122ca1dc0ec8049c01931672d12478b5c610afc24e47d75  evdev-1.8.0.tar.gz
 # Locally computed sha256 checksums
-sha256  55fd76d7b3f90d312f161d318631b93c58a0e69d662d07c4f5aca2c6c9ecc85e  LICENSE
+sha256  d4554960d6496150c88c1fd02d7973121a9a57b961ea58fe349fbf8ada3816b2  LICENSE
diff --git a/package/python-evdev/python-evdev.mk b/package/python-evdev/python-evdev.mk
index 269b290dca..f465aff933 100644
--- a/package/python-evdev/python-evdev.mk
+++ b/package/python-evdev/python-evdev.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_EVDEV_VERSION = 1.7.1
+PYTHON_EVDEV_VERSION = 1.8.0
 PYTHON_EVDEV_SOURCE = evdev-$(PYTHON_EVDEV_VERSION).tar.gz
-PYTHON_EVDEV_SITE = https://files.pythonhosted.org/packages/12/bb/f622a8a5e64d46ca83020a761877c0ead19140903c9aaf1431f3c531fdf6
+PYTHON_EVDEV_SITE = https://files.pythonhosted.org/packages/4c/eb/b8900082a13a47bb9f69f415174d03cbf12ce95d07345722e1f4ef0e2093
 PYTHON_EVDEV_SETUP_TYPE = setuptools
 PYTHON_EVDEV_LICENSE = Revised BSD License
 PYTHON_EVDEV_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
