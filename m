Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE7FCC35FE8
	for <buildroot@archiver.kernel.org>; Sun, 15 Sep 2024 06:52:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8780740290;
	Sun, 15 Sep 2024 06:52:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1HKU2OBUDZjI; Sun, 15 Sep 2024 06:52:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3AB3E404D8
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3AB3E404D8;
	Sun, 15 Sep 2024 06:52:42 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 652FE1BF47D
 for <buildroot@lists.busybox.net>; Sun, 15 Sep 2024 06:52:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 533AA4034D
 for <buildroot@lists.busybox.net>; Sun, 15 Sep 2024 06:52:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GBfiY8jklY0V for <buildroot@lists.busybox.net>;
 Sun, 15 Sep 2024 06:52:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::133; helo=mail-il1-x133.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 284D840340
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 284D840340
Received: from mail-il1-x133.google.com (mail-il1-x133.google.com
 [IPv6:2607:f8b0:4864:20::133])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 284D840340
 for <buildroot@buildroot.org>; Sun, 15 Sep 2024 06:52:40 +0000 (UTC)
Received: by mail-il1-x133.google.com with SMTP id
 e9e14a558f8ab-3a08e9ae822so4994105ab.0
 for <buildroot@buildroot.org>; Sat, 14 Sep 2024 23:52:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726383159; x=1726987959;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=KcjYy/+9jHm4fy9XCwuI0UmeJP2bMieV5uL5C+5rBYo=;
 b=d33dRf4LY8gDEDDf94XGuE2Z0hDtHnRfWJmIK/F0zWdeLGLH1kkESudPyccnbCFixP
 zEcPQ3EQU6EZI6a2HJsonxIVPYZSx0r3y/n5Y5K6xjXgYAVmq8NaweCj3xvWtbovCd5v
 vNcgJK/qvFfO1PLleyjSVIpXppzcg9xM+mYicqdwrj7Wz+birFmYM2HRymfyXkSpU++L
 SjWBdiDTbOVdQNYNpL8zcddfSTwwYaK17ZxfUiRhNaitAqpQO9E+VANYdJK+O2NsNxtD
 qCQNe2utTymWtFTbCkZpOe30BQYbb+gJmb3s98tnLKUclcNzC6MLHVE+WNOGZkguiIp0
 we/g==
X-Gm-Message-State: AOJu0Yz8pWDJbutj3tFgf36se+YKJ7zNArkycRTB2wHPQjP/Pe6N573+
 ePAg9GtTrXb74EvyF8vTOWjJ7+mefTpJ5OquHJoRkxJEnGGDCrS2iv2UCA==
X-Google-Smtp-Source: AGHT+IEq7E1/Ew1qIxEDr7YmKB5B3IqIF/poWy4f9tTJkgQwyYM66cYaEi30HVV9g+b7RR/I8pIcWg==
X-Received: by 2002:a92:870a:0:b0:3a0:8c6e:f125 with SMTP id
 e9e14a558f8ab-3a08c6ef181mr47920855ab.26.1726383158803; 
 Sat, 14 Sep 2024 23:52:38 -0700 (PDT)
Received: from james-x399.localdomain (71-218-252-223.hlrn.qwest.net.
 [71.218.252.223]) by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-3a092e8fed6sm8681295ab.82.2024.09.14.23.52.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 14 Sep 2024 23:52:38 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 15 Sep 2024 00:52:36 -0600
Message-Id: <20240915065236.1532492-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726383159; x=1726987959; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=KcjYy/+9jHm4fy9XCwuI0UmeJP2bMieV5uL5C+5rBYo=;
 b=TdH2X5NWlyqAPIUg0mH2BbnLkv5mWU88gjkxOVQ41fD5KaIXhzsgnZmImR5fxCDCBG
 0U4b8uGCyGN+FgIOdlReqTknltw0wb7q4qedf7j8l8ZePysuB04aEVhcSuQbB87mxZmi
 OJGlRFecWrSWnC6ZwkNj0g8vq0w3f5WTmpVdoHOX4VmhKYnNIIy/oPj2B8urv/3QWqwC
 Kpk0/1ZpnYg7akPmje2g/qI+vCumgvUj7ODetkYRWAHtM/Kym7GwaVGqnPowLDqHCmkH
 RWaJmUsnIPfl06Z22yJrINPwpfVWBfAsodW1tWzQpGyRbU49rPB1OnAMyxbiHMuJUeWq
 trqQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=TdH2X5NW
Subject: [Buildroot] [PATCH 1/1] package/python-future: bump to version 1.0.0
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
Cc: Louis Aussedat <aussedat.louis@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

License hash changed due to date update:
https://github.com/PythonCharmers/python-future/commit/6eef83de7db1086633c98ba2e104de1b471944d0

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-future/python-future.hash | 6 +++---
 package/python-future/python-future.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-future/python-future.hash b/package/python-future/python-future.hash
index 3b2bbb0212..8839d80c91 100644
--- a/package/python-future/python-future.hash
+++ b/package/python-future/python-future.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/future/json
-md5  dedcb70d14b23388670d54145aab8be4  future-0.18.3.tar.gz
-sha256  34a17436ed1e96697a86f9de3d15a3b0be01d8bc8de9c1dffd59fb8234ed5307  future-0.18.3.tar.gz
+md5  028bd8af5a7dd853fd12c8bf627236a9  future-1.0.0.tar.gz
+sha256  bd2968309307861edae1458a4f8a4f3598c03be43b97521076aebf5d94c07b05  future-1.0.0.tar.gz
 # Locally computed sha256 checksums
-sha256  916e561392d48471b9c23437f56e2652f320cb3b119ceaa162edf41016f746b9  LICENSE.txt
+sha256  beba04103c3a9fff928b59c77d5fbeb03a3e4bd0d7ac3d1e1f8994a21e30ee3b  LICENSE.txt
diff --git a/package/python-future/python-future.mk b/package/python-future/python-future.mk
index 57bf13d83b..698863a13d 100644
--- a/package/python-future/python-future.mk
+++ b/package/python-future/python-future.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_FUTURE_VERSION = 0.18.3
+PYTHON_FUTURE_VERSION = 1.0.0
 PYTHON_FUTURE_SOURCE = future-$(PYTHON_FUTURE_VERSION).tar.gz
-PYTHON_FUTURE_SITE = https://files.pythonhosted.org/packages/8f/2e/cf6accf7415237d6faeeebdc7832023c90e0282aa16fd3263db0eb4715ec
+PYTHON_FUTURE_SITE = https://files.pythonhosted.org/packages/a7/b2/4140c69c6a66432916b26158687e821ba631a4c9273c474343badf84d3ba
 PYTHON_FUTURE_SETUP_TYPE = setuptools
 PYTHON_FUTURE_LICENSE = MIT
 PYTHON_FUTURE_LICENSE_FILES = LICENSE.txt
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
