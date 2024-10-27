Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50891D1358B
	for <buildroot@archiver.kernel.org>; Sun, 27 Oct 2024 23:45:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 09F20812EC;
	Sun, 27 Oct 2024 23:45:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7sZvOj3T96KK; Sun, 27 Oct 2024 23:45:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 03FA0812F4
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 03FA0812F4;
	Sun, 27 Oct 2024 23:45:41 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id D855A1DAA
 for <buildroot@buildroot.org>; Sun, 27 Oct 2024 23:45:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C5AD14064E
 for <buildroot@buildroot.org>; Sun, 27 Oct 2024 23:45:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3liulUec_IPe for <buildroot@buildroot.org>;
 Sun, 27 Oct 2024 23:45:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::12a; helo=mail-il1-x12a.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 901B040602
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 901B040602
Received: from mail-il1-x12a.google.com (mail-il1-x12a.google.com
 [IPv6:2607:f8b0:4864:20::12a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 901B040602
 for <buildroot@buildroot.org>; Sun, 27 Oct 2024 23:45:37 +0000 (UTC)
Received: by mail-il1-x12a.google.com with SMTP id
 e9e14a558f8ab-3a3bd42955bso14584805ab.1
 for <buildroot@buildroot.org>; Sun, 27 Oct 2024 16:45:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730072736; x=1730677536;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Hd6wmZjj+zCq7xxL7zPP5+Mz0wTRfR4x0pZCD5/kLQE=;
 b=VyGAkVfqeUOS0p3rlbtZ9CbHKxDofMvEAqcFFosWAcPgWy96J7X/y+H0d7pCpj91k4
 1XnQyWnsiZ/otlRXq8qwgR8zZlcYCqe/gn9+Pa39S3LWcXALqYCAJjvPkisgGjt8vNUS
 qmzBRLFntR49f/OyPivF3C/EEbusng7g+qrdZRFgrw8ddCnISCxVjNf249A74ONXTH40
 mbH9fW/w499Y2vgQWBTeMpDdTfzTTEnp+rGlkxm1lsDwc+fLPrIA3O+XSMO46rxBqJLF
 WaxbiVIhOeo+pjKMcb72b+xd2Mm/+fMZjYDvasQZUlXqku07255GbQ3m+gLbPoUxKTuP
 WPcQ==
X-Gm-Message-State: AOJu0Ywkx0fgUIgYKL/dAf25G83vVdfuwmJJqS2F5Hao1nFWOzs0eepl
 57zU21idbsGvfzC6poa39+RTo0Mkvpub72+7pkF3QWK0kzYcZXZyjd034w==
X-Google-Smtp-Source: AGHT+IFGEjmUxUAzy3ROa4u6F2YyxQiy0feQPQTHlRBRPLa4kz8s59f8L8HPUOBTWaNaOEwih9xExA==
X-Received: by 2002:a05:6e02:1548:b0:3a3:b07b:6b1 with SMTP id
 e9e14a558f8ab-3a4ed326ba9mr45276585ab.26.1730072736183; 
 Sun, 27 Oct 2024 16:45:36 -0700 (PDT)
Received: from james-x399.localdomain (97-118-131-57.hlrn.qwest.net.
 [97.118.131.57]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4dc727b17e5sm1354152173.160.2024.10.27.16.45.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 27 Oct 2024 16:45:35 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 27 Oct 2024 17:45:34 -0600
Message-Id: <20241027234534.3984942-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1730072736; x=1730677536; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Hd6wmZjj+zCq7xxL7zPP5+Mz0wTRfR4x0pZCD5/kLQE=;
 b=mHlQZSE+yrtPqTeEakHu4pogRrCmJAJ/gDbjErJ/xjZ05NtlCv499M5CXLglCqqxZj
 dSlD5DZqEpe7tAXcwN+Q3SMJgPCmDz1c4Dtyx7aGIgKX1CXHusWNelqrhatFgdeTSSDu
 /ucPHgkY5fLUIyAsJbph3VIsxMSToAdFPr4wUOpBeJqkzIzeJ54vm5p4HN6sEB9HvZeF
 C7OFplTDxpNaSUQc9INKnNfs//OVvR6bacpyoRpSNoJDzy/xt9xWPOqCc2E6fSWJg6NF
 y4OoCYO9foDumm6MOtXfmExLebxTv27ZuW9K9e93fCV5J64bNL8DYTGg/gUmTdKF1EmP
 X1kw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=mHlQZSE+
Subject: [Buildroot] [PATCH 1/1] package/python-sentry-sdk: bump to version
 2.17.0
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
Cc: Joseph Kogut <joseph.kogut@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-sentry-sdk/python-sentry-sdk.hash | 4 ++--
 package/python-sentry-sdk/python-sentry-sdk.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-sentry-sdk/python-sentry-sdk.hash b/package/python-sentry-sdk/python-sentry-sdk.hash
index 12c41fccdf..d2ec964dc0 100644
--- a/package/python-sentry-sdk/python-sentry-sdk.hash
+++ b/package/python-sentry-sdk/python-sentry-sdk.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/sentry-sdk/json
-md5  4849080466b6656849557cf251ced724  sentry_sdk-2.16.0.tar.gz
-sha256  90f733b32e15dfc1999e6b7aca67a38688a567329de4d6e184154a73f96c6892  sentry_sdk-2.16.0.tar.gz
+md5  74b67571ab1edd296ae68ed43843c308  sentry_sdk-2.17.0.tar.gz
+sha256  dd0a05352b78ffeacced73a94e86f38b32e2eae15fff5f30ca5abb568a72eacf  sentry_sdk-2.17.0.tar.gz
 # Locally computed sha256 checksums
 sha256  6d7ec62dc20e8b92cb88b89fb3b55ee8576505f3e1afa57952548f6eea5d008e  LICENSE
diff --git a/package/python-sentry-sdk/python-sentry-sdk.mk b/package/python-sentry-sdk/python-sentry-sdk.mk
index fbf4f847dd..a7cdd2d3d7 100644
--- a/package/python-sentry-sdk/python-sentry-sdk.mk
+++ b/package/python-sentry-sdk/python-sentry-sdk.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_SENTRY_SDK_VERSION = 2.16.0
+PYTHON_SENTRY_SDK_VERSION = 2.17.0
 PYTHON_SENTRY_SDK_SOURCE = sentry_sdk-$(PYTHON_SENTRY_SDK_VERSION).tar.gz
-PYTHON_SENTRY_SDK_SITE = https://files.pythonhosted.org/packages/80/63/59640a54963747d2c4b2d149412b2024abed13bacd4e8d16ae5babb97da0
+PYTHON_SENTRY_SDK_SITE = https://files.pythonhosted.org/packages/b1/83/7d0956a71ac894717099be3669ca7b8f164bccbcfb570b2f02817d0a0068
 PYTHON_SENTRY_SDK_SETUP_TYPE = setuptools
 PYTHON_SENTRY_SDK_LICENSE = MIT
 PYTHON_SENTRY_SDK_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
