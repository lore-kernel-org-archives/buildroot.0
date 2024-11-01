Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1001E6F06F
	for <buildroot@archiver.kernel.org>; Fri,  1 Nov 2024 16:52:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 655D642444;
	Fri,  1 Nov 2024 16:52:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FNCTlKBu8dYN; Fri,  1 Nov 2024 16:52:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 277F541E5E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 277F541E5E;
	Fri,  1 Nov 2024 16:52:04 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 2AD9C979
 for <buildroot@buildroot.org>; Fri,  1 Nov 2024 16:52:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0E30640458
 for <buildroot@buildroot.org>; Fri,  1 Nov 2024 16:52:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id n4nXK7cF7h7t for <buildroot@buildroot.org>;
 Fri,  1 Nov 2024 16:52:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::134; helo=mail-il1-x134.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 44436400D7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 44436400D7
Received: from mail-il1-x134.google.com (mail-il1-x134.google.com
 [IPv6:2607:f8b0:4864:20::134])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 44436400D7
 for <buildroot@buildroot.org>; Fri,  1 Nov 2024 16:52:01 +0000 (UTC)
Received: by mail-il1-x134.google.com with SMTP id
 e9e14a558f8ab-3a3c00f2c75so8172475ab.2
 for <buildroot@buildroot.org>; Fri, 01 Nov 2024 09:52:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730479920; x=1731084720;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=vNAal98h/ToNt9EXacf4h+xU/K88qMRqOim0Rc38zQo=;
 b=FEUOTR84mvxlIDW39BuDQd1O7J4JGkRLHr5eenqXbBx9r5oWIIDwCXpcB4NGDOMzDg
 6zDlM8m66VhrbagkkB27EMujPxRNMyFVTT98e3Es95Y8I3ndngbadgQ3JAO6wVDoB4rW
 H7QaRYPoJVZtUd17+iHwVRTSKhv2jWMtxzgN7lBHhXVoF9mJE4sTA5GZYbpgKiLumR7g
 qvuP2Tmk7G/t1jV6kGnct4knBPEJ9lctxWtcCqfs7ODbJ27WMpLfSkn5XbACXVoTsNhJ
 LvQYe0zv0O+Ww6FlZSBorZuBt7V7olU1QnuduORNPMOZw8WQPPXRgFuM5yfXo9nw0cUp
 EW7w==
X-Gm-Message-State: AOJu0Yy3RyAuUGA9mca3A3rbUrHS4XeTNxN1cYmJ6wMDbjXP7ZgAPP9r
 UYr6tW9xCcUlqTUQqcE/JKugU9I3JNrDtyUsDTeHP4axYep1t1O2i0KpeQ==
X-Google-Smtp-Source: AGHT+IFLCYyDCpjLahpHZK83WVAqFfrZQk8iJ45m/rz8mMeIUXRGeVhu7QhKTADQrPKk2k04//gzVA==
X-Received: by 2002:a05:6e02:1487:b0:3a6:aa75:5a59 with SMTP id
 e9e14a558f8ab-3a6b0288ce3mr46538915ab.1.1730479919910; 
 Fri, 01 Nov 2024 09:51:59 -0700 (PDT)
Received: from james-x399.localdomain (97-118-131-57.hlrn.qwest.net.
 [97.118.131.57]) by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-3a6a97b0058sm9168915ab.5.2024.11.01.09.51.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Nov 2024 09:51:59 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  1 Nov 2024 10:51:57 -0600
Message-Id: <20241101165157.379660-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1730479920; x=1731084720; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=vNAal98h/ToNt9EXacf4h+xU/K88qMRqOim0Rc38zQo=;
 b=lXw22+zqsEpbpipYrPQ2x2KDxSBKEiFvBdFNL0KeJ8brG0Jxpxh4w4zRV6lmw3NBZL
 HDOQ/z7Ys0NJigyFtR/8Cegg8ZWC/U8HrI4tzmJwU1hRo/wJqgrCbEcmC0WvDXFiwt4X
 QMvRgyl6hj+ikrvLxnRb+M1frOPRBmyhFwW9RSRhiUV1FTlMw+/u4sIudsbqcis0H4AL
 LhCJkGZA/gN0lEdTQq0usGHO8QfOcnndSZyuQvNms/kSjM6No3eKdpdjotakH3nxd+5G
 Qg2lfibrKS7yIsSU4AlplCkQCvbwSXVJ84m+ZdLiA3R+/XrNfeW0+fr16pzAvqfjllxg
 LDCQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=lXw22+zq
Subject: [Buildroot] [PATCH 1/1] package/python-google-api-core: bump to
 version 2.22.0
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
 package/python-google-api-core/python-google-api-core.hash | 4 ++--
 package/python-google-api-core/python-google-api-core.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-google-api-core/python-google-api-core.hash b/package/python-google-api-core/python-google-api-core.hash
index 90fe60c6fe..397ce7cb40 100644
--- a/package/python-google-api-core/python-google-api-core.hash
+++ b/package/python-google-api-core/python-google-api-core.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/google-api-core/json
-md5  1fd24ef85c43d7df429c6f953c5b2e87  google_api_core-2.21.0.tar.gz
-sha256  4a152fd11a9f774ea606388d423b68aa7e6d6a0ffe4c8266f74979613ec09f81  google_api_core-2.21.0.tar.gz
+md5  b69067b81abd55aa7eecc22858ea326c  google_api_core-2.22.0.tar.gz
+sha256  26f8d76b96477db42b55fd02a33aae4a42ec8b86b98b94969b7333a2c828bf35  google_api_core-2.22.0.tar.gz
 # Locally computed sha256 checksums
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/python-google-api-core/python-google-api-core.mk b/package/python-google-api-core/python-google-api-core.mk
index ec8cf671cf..b48d934e73 100644
--- a/package/python-google-api-core/python-google-api-core.mk
+++ b/package/python-google-api-core/python-google-api-core.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_GOOGLE_API_CORE_VERSION = 2.21.0
+PYTHON_GOOGLE_API_CORE_VERSION = 2.22.0
 PYTHON_GOOGLE_API_CORE_SOURCE = google_api_core-$(PYTHON_GOOGLE_API_CORE_VERSION).tar.gz
-PYTHON_GOOGLE_API_CORE_SITE = https://files.pythonhosted.org/packages/28/c8/046abf3ea11ec9cc3ea6d95e235a51161039d4a558484a997df60f9c51e9
+PYTHON_GOOGLE_API_CORE_SITE = https://files.pythonhosted.org/packages/00/c2/425f97c2087affbd452a05d3faa08d97de333f2ca554733e1becab55ee4e
 PYTHON_GOOGLE_API_CORE_SETUP_TYPE = setuptools
 PYTHON_GOOGLE_API_CORE_LICENSE = Apache-2.0
 PYTHON_GOOGLE_API_CORE_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
