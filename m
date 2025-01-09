Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2994DE77197
	for <buildroot@archiver.kernel.org>; Thu,  9 Jan 2025 20:41:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CCC7C6076C;
	Thu,  9 Jan 2025 20:41:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2RLcYb8Q-9LH; Thu,  9 Jan 2025 20:41:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DB7DA6089F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id DB7DA6089F;
	Thu,  9 Jan 2025 20:41:31 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id E41DF942
 for <buildroot@buildroot.org>; Thu,  9 Jan 2025 20:41:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D1DC783376
 for <buildroot@buildroot.org>; Thu,  9 Jan 2025 20:41:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0pjCNSz5M-Kv for <buildroot@buildroot.org>;
 Thu,  9 Jan 2025 20:41:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d2e; helo=mail-io1-xd2e.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org CEABD83372
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CEABD83372
Received: from mail-io1-xd2e.google.com (mail-io1-xd2e.google.com
 [IPv6:2607:f8b0:4864:20::d2e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CEABD83372
 for <buildroot@buildroot.org>; Thu,  9 Jan 2025 20:41:29 +0000 (UTC)
Received: by mail-io1-xd2e.google.com with SMTP id
 ca18e2360f4ac-844ce213af6so40156039f.1
 for <buildroot@buildroot.org>; Thu, 09 Jan 2025 12:41:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736455288; x=1737060088;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ogn9idKa3PpNKr1tAl5bNJhrX1H4sWwRfoxOJWloTGA=;
 b=qCYqYcRJ0GHuTlYBw4Vo2xj8N5nn71UHym/6TpBqFsuSzAgbdiW6UW+h+wwEosxd86
 NOKBwlUEUiL+AWiNMYTOfqzQJKuNR+QyN6fZVyyDcPveMGGtu4TRrW7kQ7aA9EDWI3Ts
 cGypCNnF70IgPojQUwd+8wdtlo48m71+2lM6+WDGCzL3Eyus7M9d37mTIGhmC0wj0Z/Z
 PVacl6L0OtZCpDK5GkCTc/ySZZ97JqDWH7MsSkzIx8WErE08OenJwTmbex6PsnINd+Aj
 8NHtG3dufwsl1MJgaaiSJUAQGWfeb4dtHA/19Sal/YltAIVuZjOHs+1TTNtqhmHsLvX7
 RtMw==
X-Gm-Message-State: AOJu0Yw3PQdYpVFYQasYbMqCiYf/5+Wn0bGHBkjXK/6MdXZrs+XWiBVj
 /v69Iv3jrsuj3G25UcO2Sr1UzPazpt+WbzAXFsch7M227PTt8ntT/18fBxmr554=
X-Gm-Gg: ASbGncvh4dkPFIToC9M1sNAh26rs6OM7tX3Ok50Ccg6gfHjw2i8JyS+UwYBVARUd4cy
 A8vEqmkOh1pT3aMVpGky1jfOT0INorXrtoTf4Jdyrf7eEigwcgk4TCx1Fds+8zG5JS6pdeCllyM
 UxQF0DZEUSV0ERmJPlN9P6hPaC7FHA9jXb5s9I3E0xj1oodAQlsAhErHh185D5U7+qP0r4dlGvN
 RGoGSPHO20144imd1EKnFuM25UErh5tfo9iHhjZa2meesvGVKNsx5i7TuasI/7/sTVxW2KLaDnc
 RAcCoSKKdHTMhyjkPOAq8BKV/RbxAJQ=
X-Google-Smtp-Source: AGHT+IEUD/pqAaqvUhh4YS63h5H3X+FTKRcgRhvtEok/SwI7XNG5iYaAITSHJeW4zCrVter70TnScA==
X-Received: by 2002:a05:6602:36cf:b0:843:e9c1:930b with SMTP id
 ca18e2360f4ac-84ce0194e69mr792294439f.14.1736455288633; 
 Thu, 09 Jan 2025 12:41:28 -0800 (PST)
Received: from james-x399.localdomain (71-218-115-58.hlrn.qwest.net.
 [71.218.115.58]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4ea1b5f8efdsm497073173.2.2025.01.09.12.41.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jan 2025 12:41:28 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Thu,  9 Jan 2025 13:41:27 -0700
Message-Id: <20250109204127.2390118-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1736455288; x=1737060088; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ogn9idKa3PpNKr1tAl5bNJhrX1H4sWwRfoxOJWloTGA=;
 b=V07QB5QkwitoRcYnSr0M5p6xmeOiLNY4mDBFitenPpJVA4PJ/YdQtW1IBUo1n3yKzp
 gjXl/6JnR4dUFNWRCFdZJXR5fu4no1MlSm+7MA4ixPDMzkk/bWE2dktUrFRFHJNMa7Nx
 YEl4wyebgcK4GXPCR0bKZobB0rnv4JWDI1suWY0suZk7T07DGe8j55uFCTvBzM5dxyJp
 6XazjsiAkZm1qFGpPHgzz6MNbzvDr85uF8L90sK4LRFRWKS0T9xutXWNlNwhkJ8hTnID
 p+8ONiROVVwTpHqCWFy6ndeEvuce1QOx2ZGphyujnMbXntMHPvogl2jeHCwe+9Q1ZiP2
 tM9A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=V07QB5Qk
Subject: [Buildroot] [PATCH 1/1] package/python-dbus-fast: bump to version
 2.28.0
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Marcin Niestroj <m.niestroj@grinn-global.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-dbus-fast/python-dbus-fast.hash | 4 ++--
 package/python-dbus-fast/python-dbus-fast.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-dbus-fast/python-dbus-fast.hash b/package/python-dbus-fast/python-dbus-fast.hash
index 1a618f6060..21cb8d4087 100644
--- a/package/python-dbus-fast/python-dbus-fast.hash
+++ b/package/python-dbus-fast/python-dbus-fast.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/dbus-fast/json
-md5  fc28b83adf21cb05b3286ff3d69aab76  dbus_fast-2.24.4.tar.gz
-sha256  58f97e8342d6cd11ebb2c8ac959c5bb342eb83e29180528690b323a5a5def41c  dbus_fast-2.24.4.tar.gz
+md5  accfe9ff41ee7b1a8c9a67ebd5db6a55  dbus_fast-2.28.0.tar.gz
+sha256  ed2612392a7df775256c67bfad8727607e8862541b3984585b016e464b020b23  dbus_fast-2.28.0.tar.gz
 # Locally computed sha256 checksums
 sha256  c37e9c75110e01d1f0c5360dc7d7776a30ac5f70d2440db214423e4b7a77a6af  LICENSE
diff --git a/package/python-dbus-fast/python-dbus-fast.mk b/package/python-dbus-fast/python-dbus-fast.mk
index 2a9da7d780..73d559f6e0 100644
--- a/package/python-dbus-fast/python-dbus-fast.mk
+++ b/package/python-dbus-fast/python-dbus-fast.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_DBUS_FAST_VERSION = 2.24.4
+PYTHON_DBUS_FAST_VERSION = 2.28.0
 PYTHON_DBUS_FAST_SOURCE = dbus_fast-$(PYTHON_DBUS_FAST_VERSION).tar.gz
-PYTHON_DBUS_FAST_SITE = https://files.pythonhosted.org/packages/1f/91/b04e2dca706bddcd419352b5f623e8860c04adf2dd6ceef6116df4de4f6a
+PYTHON_DBUS_FAST_SITE = https://files.pythonhosted.org/packages/fb/a1/b7bd68329a6f3afc833d5a3d8eeed5f0557cd80e065f3cfbfd5df7193da2
 PYTHON_DBUS_FAST_SETUP_TYPE = poetry
 PYTHON_DBUS_FAST_LICENSE = MIT
 PYTHON_DBUS_FAST_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
