Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C24ED0EE20
	for <buildroot@archiver.kernel.org>; Fri, 11 Oct 2024 18:47:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CD13E84436;
	Fri, 11 Oct 2024 18:47:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2jaussMlKWzh; Fri, 11 Oct 2024 18:47:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E88668437F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E88668437F;
	Fri, 11 Oct 2024 18:47:22 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2D8271BF57F
 for <buildroot@lists.busybox.net>; Fri, 11 Oct 2024 18:47:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 182FD406EC
 for <buildroot@lists.busybox.net>; Fri, 11 Oct 2024 18:47:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JoZOrFYeGxyV for <buildroot@lists.busybox.net>;
 Fri, 11 Oct 2024 18:47:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d32; helo=mail-io1-xd32.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org DC406406DA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DC406406DA
Received: from mail-io1-xd32.google.com (mail-io1-xd32.google.com
 [IPv6:2607:f8b0:4864:20::d32])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DC406406DA
 for <buildroot@buildroot.org>; Fri, 11 Oct 2024 18:47:19 +0000 (UTC)
Received: by mail-io1-xd32.google.com with SMTP id
 ca18e2360f4ac-8377fd76196so50398439f.2
 for <buildroot@buildroot.org>; Fri, 11 Oct 2024 11:47:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728672438; x=1729277238;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=QJO+wdr3nVv0Q8AQmCfr+4Gzeashqbk+au5TPu4bDJk=;
 b=btUuzQyEuJyurCgwjKeq03zMAe9mk3sBRnA7P0WROX+9WzJJ5gS7Lcu9oUK4V00O+N
 O6Qv4x9YA3c1sqjDYcxt5Rf3Hk3akGfJcGJQaNWHjcqTEAgTZ5nL9qkO020zBtqGcpTK
 6cHzYvaz2sbz9FHciCraKWaJ4JinJ5FLDbE26SEHkSoTRBbc2bTiW+XYTifeW8+00odX
 jDRA4SWQiSLIqnQ4znn8lppvGcXafFHk5w0KLH0jBy/O6UcDyp0kg9PReIZaWPPrILCd
 YWUOhZ+hmo3gbrMOxnQl8SdjATa3IlcV24ImKy6hjrfUjVtcH87kewIRaM5QLUbMkLMy
 mriQ==
X-Gm-Message-State: AOJu0Yxk401MU58iwaeN9NE90+Z7Zgw440azCd7+B2x89wsDZOvP4Q75
 WFLhBDHL78aJ0bkd8TMJco+uHDNxJJZsOYNJuaAtE9aPLdOUdZi95HEtYw==
X-Google-Smtp-Source: AGHT+IHP8Qakc/SVK8uHBAqYp2kdZxVIieE48/PkAGzBZLnJQ553XhRDV1tcEu8qWB95sxqK/EFeTQ==
X-Received: by 2002:a92:c267:0:b0:3a3:b45b:fb92 with SMTP id
 e9e14a558f8ab-3a3bce029c1mr3298095ab.23.1728672438535; 
 Fri, 11 Oct 2024 11:47:18 -0700 (PDT)
Received: from james-x399.localdomain (71-33-159-223.hlrn.qwest.net.
 [71.33.159.223]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4dbad9b1104sm742589173.16.2024.10.11.11.47.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Oct 2024 11:47:18 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 11 Oct 2024 12:47:16 -0600
Message-Id: <20241011184716.2773638-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1728672438; x=1729277238; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=QJO+wdr3nVv0Q8AQmCfr+4Gzeashqbk+au5TPu4bDJk=;
 b=bazEPqCib1vJrL8zLVxtJJJCT8VWTp7+4Uk2rbnPbW3gWtYJI4bNi7Du6FZthdlUkD
 oxqzhF9kzvC0I8LJNcQrQt/+btnVlrYXk0o5QnAiP57V0fQb9wXeAHV5r0QOk0/tuEyX
 87kzqqEno+k4HIteoq7y9um2eTvFkEdVAFwz50ZQqpvmv7oidA/uSPrnA2UhEoWkgEJR
 mvRs0++pmsJHzyJbjYT8DrCQoCAN+01/R4VnP8wCVrjebUxvNNZYUuGGohDSCrgK/HG2
 TGTAE7xT+iQfNNZwK4hORvbaqKGrVBcvAWVClcZw66Iis/9UCHKVhfPikem8SffX7stM
 L7Rw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=bazEPqCi
Subject: [Buildroot] [PATCH 1/1] package/python-google-api-core: bump to
 version 2.21.0
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
 package/python-google-api-core/python-google-api-core.hash | 4 ++--
 package/python-google-api-core/python-google-api-core.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-google-api-core/python-google-api-core.hash b/package/python-google-api-core/python-google-api-core.hash
index 966a9b3a14..90fe60c6fe 100644
--- a/package/python-google-api-core/python-google-api-core.hash
+++ b/package/python-google-api-core/python-google-api-core.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/google-api-core/json
-md5  72fec88a65cd809c31c35f4284a72274  google_api_core-2.20.0.tar.gz
-sha256  f74dff1889ba291a4b76c5079df0711810e2d9da81abfdc99957bc961c1eb28f  google_api_core-2.20.0.tar.gz
+md5  1fd24ef85c43d7df429c6f953c5b2e87  google_api_core-2.21.0.tar.gz
+sha256  4a152fd11a9f774ea606388d423b68aa7e6d6a0ffe4c8266f74979613ec09f81  google_api_core-2.21.0.tar.gz
 # Locally computed sha256 checksums
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/python-google-api-core/python-google-api-core.mk b/package/python-google-api-core/python-google-api-core.mk
index 18669a71e4..ec8cf671cf 100644
--- a/package/python-google-api-core/python-google-api-core.mk
+++ b/package/python-google-api-core/python-google-api-core.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_GOOGLE_API_CORE_VERSION = 2.20.0
+PYTHON_GOOGLE_API_CORE_VERSION = 2.21.0
 PYTHON_GOOGLE_API_CORE_SOURCE = google_api_core-$(PYTHON_GOOGLE_API_CORE_VERSION).tar.gz
-PYTHON_GOOGLE_API_CORE_SITE = https://files.pythonhosted.org/packages/c8/5c/31c1742a53b79c8a0c4757b5fae2e8ab9c519cbd7b98c587d4294e1d2d16
+PYTHON_GOOGLE_API_CORE_SITE = https://files.pythonhosted.org/packages/28/c8/046abf3ea11ec9cc3ea6d95e235a51161039d4a558484a997df60f9c51e9
 PYTHON_GOOGLE_API_CORE_SETUP_TYPE = setuptools
 PYTHON_GOOGLE_API_CORE_LICENSE = Apache-2.0
 PYTHON_GOOGLE_API_CORE_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
