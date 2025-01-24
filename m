Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22360C02181
	for <buildroot@archiver.kernel.org>; Fri, 24 Jan 2025 20:53:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DADC081CD0;
	Fri, 24 Jan 2025 20:53:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ox_zrB3mgFS3; Fri, 24 Jan 2025 20:53:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DD33181C26
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id DD33181C26;
	Fri, 24 Jan 2025 20:53:41 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 7E589941
 for <buildroot@buildroot.org>; Fri, 24 Jan 2025 20:53:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6C4AA423F3
 for <buildroot@buildroot.org>; Fri, 24 Jan 2025 20:53:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bEss4JLBIuZh for <buildroot@buildroot.org>;
 Fri, 24 Jan 2025 20:53:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d34; helo=mail-io1-xd34.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 53487423F2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 53487423F2
Received: from mail-io1-xd34.google.com (mail-io1-xd34.google.com
 [IPv6:2607:f8b0:4864:20::d34])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 53487423F2
 for <buildroot@buildroot.org>; Fri, 24 Jan 2025 20:53:39 +0000 (UTC)
Received: by mail-io1-xd34.google.com with SMTP id
 ca18e2360f4ac-844e7409f8aso73596239f.1
 for <buildroot@buildroot.org>; Fri, 24 Jan 2025 12:53:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737752018; x=1738356818;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=LlURSjFBJX/xCXrNfLAsbu8If7T5OwU+6rA83chEGmE=;
 b=NFsl0Z+fyFluSWh9tl35mJG0Ufyaeh5CEfT2u2JQsN9b+ELNsEgmL/DWbO/fREZbQw
 jt125oSkowdhNE46O89qZ5wLCRzlYCTPWoY96WCbgUTw03Hqxa4cEc+VJ4d0SUWGflBD
 MFsc4JX2xqMAiO7py7VlKNZAd8GeT/ynsPeCoMhDzPNSI/8a6unJTVXRGMKKXHiOoyon
 oWCd3wmHtvvL1CmPiSdRGKTOPaZpuVuDhYKkcQyrYA7IPXMgNVssx2zKpPEL2TXx27I8
 r+SnC8cyNd21DP/QCKmditXRxW4MEZMze6i9lYLerebUMg0SW8pxEreNdhxwpFpcv4KV
 YY9g==
X-Gm-Message-State: AOJu0Yz9ricLE2NU5+Db7DrPn8sX2AcmJr3LSfVoj0Qgby1vSHySl28p
 WdqDKUDLFpIfWMW4hJFXZVd9pBs6f4umORr3SMvvWX2CY3BAB0+3jUHJx826
X-Gm-Gg: ASbGnct+6LjKR62yPWpuvl6Ox3EvxOj2APh3TkrZJ7uJSQfgz7zqcgcheQSUM54AjGi
 AzCEbEZRiRvsaeiVgUyFAeScTaXe/JEslNaHKIE/x72MLeV5RZRfusuJvoQDztJHWxjZwNUi0Lp
 zxGtF6HsxAkVDakRB4DbqWSoIlW03KF0ZLbfsmF1VdZMlf9Y3JYvh0/cM68971BQFYBoIVAhotX
 kQ00F1ZwLvQGOPlGYYiB71BsKIzJa3QoH0Nbd2ha05aITx7vOUoYRftI9UWwYtZ1wqhEWxpN8LM
 lo8FXdymE0CGfSvn5Lnmauz+8j5vKEBiGPbdaW9SqaZU+jf+L9qYUJNlMWO0e0Op8g==
X-Google-Smtp-Source: AGHT+IGk+/QA9egUPQ09d8WL08w3ptece8+ZiVqZJHkUH1aCKuuPcrK/qC55HeW1MDMflYinpZeDdw==
X-Received: by 2002:a05:6602:6408:b0:84f:2929:5ec0 with SMTP id
 ca18e2360f4ac-851b618c4b5mr2827523639f.4.1737752018000; 
 Fri, 24 Jan 2025 12:53:38 -0800 (PST)
Received: from james-x399.localdomain (71-218-115-58.hlrn.qwest.net.
 [71.218.115.58]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4ec1db6c4b0sm843964173.89.2025.01.24.12.53.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Jan 2025 12:53:37 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 24 Jan 2025 13:53:35 -0700
Message-Id: <20250124205335.3859140-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1737752018; x=1738356818; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=LlURSjFBJX/xCXrNfLAsbu8If7T5OwU+6rA83chEGmE=;
 b=bzjEgzoIQiGBduxkXYqHGBjVLGijJkXid43qtIsmHW8dGLYwacr9mhqmep5HK1djAp
 WA1jUk69IEdSD0cxpyMggqBdPJEGqOUlcOsY5FnjzK9kWsroF7A5K7hkYVS5A4l+r+6E
 HaZvQgud5p697n3BzDfRuBbO3ynwndzJebjYTfLE/tTNdaXxhHPQ41ic5eZikWmbEmlT
 dU4TkUCvC15bS5DxkuW2xM4vQI2mNlb0AiJkBq8/6gWf+m05hEVTYqa76tKebwHQvT2P
 08/8PTQTzwK2HJFcWIJHkm+/LyfFHoaoamm+vNrIsqEu6TXFa33ju9Ie+Y/VMv1uVSH9
 kpkg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=bzjEgzoI
Subject: [Buildroot] [PATCH 1/1] package/python-semver: bump to version 3.0.4
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

License hash changed due to placeholder replacement:
https://github.com/python-semver/python-semver/commit/c47774db88386f7db79e5ec9fe3672c07ed7c063

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-semver/python-semver.hash | 6 +++---
 package/python-semver/python-semver.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-semver/python-semver.hash b/package/python-semver/python-semver.hash
index 1e06167610..50d30dd2fb 100644
--- a/package/python-semver/python-semver.hash
+++ b/package/python-semver/python-semver.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/semver/json
-md5  0bbc4d74959c9f1522f75ffb4ae0934d  semver-3.0.2.tar.gz
-sha256  6253adb39c70f6e51afed2fa7152bcd414c411286088fb4b9effb133885ab4cc  semver-3.0.2.tar.gz
+md5  a0d76b528e489bf7ce1255a0a1486123  semver-3.0.4.tar.gz
+sha256  afc7d8c584a5ed0a11033af086e8af226a9c0b206f313e0301f8dd7b6b589602  semver-3.0.4.tar.gz
 # Locally computed sha256 checksums
-sha256  cda490c32e61d3884dc17791fc8078f2a3e564fba98dd18b4dc64eb2720b2b6f  LICENSE.txt
+sha256  cc10179de9ced8655d7765bd3a8ac46438a61e663de7cf1c48d502d2baf9f3d5  LICENSE.txt
diff --git a/package/python-semver/python-semver.mk b/package/python-semver/python-semver.mk
index 65faa8a851..3e4b167848 100644
--- a/package/python-semver/python-semver.mk
+++ b/package/python-semver/python-semver.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_SEMVER_VERSION = 3.0.2
+PYTHON_SEMVER_VERSION = 3.0.4
 PYTHON_SEMVER_SOURCE = semver-$(PYTHON_SEMVER_VERSION).tar.gz
-PYTHON_SEMVER_SITE = https://files.pythonhosted.org/packages/41/6c/a536cc008f38fd83b3c1b98ce19ead13b746b5588c9a0cb9dd9f6ea434bc
+PYTHON_SEMVER_SITE = https://files.pythonhosted.org/packages/72/d1/d3159231aec234a59dd7d601e9dd9fe96f3afff15efd33c1070019b26132
 PYTHON_SEMVER_SETUP_TYPE = setuptools
 PYTHON_SEMVER_LICENSE = BSD-3-Clause
 PYTHON_SEMVER_LICENSE_FILES = LICENSE.txt
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
