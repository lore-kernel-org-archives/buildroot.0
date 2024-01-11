Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2433C4707B
	for <buildroot@archiver.kernel.org>; Thu, 11 Jan 2024 06:22:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 50E50421BD;
	Thu, 11 Jan 2024 06:22:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 50E50421BD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eWO4ND8hXvfN; Thu, 11 Jan 2024 06:22:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8B2F04213F;
	Thu, 11 Jan 2024 06:22:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8B2F04213F
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A81931BF846
 for <buildroot@lists.busybox.net>; Thu, 11 Jan 2024 06:22:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8DF084213F
 for <buildroot@lists.busybox.net>; Thu, 11 Jan 2024 06:22:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8DF084213F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9sarlPBJSosY for <buildroot@lists.busybox.net>;
 Thu, 11 Jan 2024 06:22:01 +0000 (UTC)
Received: from mail-io1-xd32.google.com (mail-io1-xd32.google.com
 [IPv6:2607:f8b0:4864:20::d32])
 by smtp4.osuosl.org (Postfix) with ESMTPS id AFFF14213E
 for <buildroot@buildroot.org>; Thu, 11 Jan 2024 06:22:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AFFF14213E
Received: by mail-io1-xd32.google.com with SMTP id
 ca18e2360f4ac-7baa8da5692so215971639f.0
 for <buildroot@buildroot.org>; Wed, 10 Jan 2024 22:22:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704954120; x=1705558920;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=DullVlDLTAmry5xLNFVl0ECZE1y+0yNBbvEqVB09d1M=;
 b=vDGd+E8Ql45QLGMfYuUnmhyjz5VhEQP9ZhYbLQ46Duebxoh392g3PxJoBvNUFJrpLM
 LorEb3xg9FlazD521tPpWPrUavEqbBX6Fs42cuOOuW2RM5IQ+r6DlQ2yCDIr0d4+d+sj
 NziLJVsh/3CaqBMVZE/7J2x1Kdx6s8OVGReBjtRawkN3MDwN4nLHto7ZjkPxxddXb4Q1
 ygC1s9aynw6d+IDCZXcMqcLV9EiKhJygPGpPH8/HFJQ9VidiTDEQJOLC1yKpMgj0133V
 SACYRwe5vTqBLXrWCt6qEDeN8dj2e3XLgIfQhicfoLYBTSg+KNTqdLuksCgH4TeBk/FO
 XEaw==
X-Gm-Message-State: AOJu0Yy1dxxQsgUO9M819SUVcKXYzM36jJY8MfIelEZL9KGZMlebovWV
 cVm+OARaJ613qcwbQBGiX8LYVy/yjbQyeg==
X-Google-Smtp-Source: AGHT+IH3/1lPFq2DO7efOKawaK25UB2N8jXpKduolK7x7+7U73gguw9X3mPsgr3nOwdqh7GEh7l9QA==
X-Received: by 2002:a5d:8510:0:b0:7bc:422b:a6c9 with SMTP id
 q16-20020a5d8510000000b007bc422ba6c9mr934699ion.31.1704954120317; 
 Wed, 10 Jan 2024 22:22:00 -0800 (PST)
Received: from james-x399.localdomain (71-218-103-119.hlrn.qwest.net.
 [71.218.103.119]) by smtp.gmail.com with ESMTPSA id
 n21-20020a6b5915000000b007ba86c3bc41sm92376iob.26.2024.01.10.22.21.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Jan 2024 22:21:59 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 10 Jan 2024 23:21:57 -0700
Message-Id: <20240111062157.3037879-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704954120; x=1705558920; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=DullVlDLTAmry5xLNFVl0ECZE1y+0yNBbvEqVB09d1M=;
 b=WlNrRGmxlBTapZVGBijOTQthgsl3hqM8VTfAbhntIVLgCl+YeRZ9CpGL8MZcZZFvUK
 Lzrg376r5OA1MrTcMeUy739CWeGUvM1PGL6LpbRwQ8URE9pUt/28Tuhfhj674Kd7JLb1
 Y1/tKbh46dsdgYSlN3EBNoqogNq0PugH6UKi4MsQYPZRF3JpirqhwCX1QyL24oLhiWnY
 iiou7pytL55VpDLZimX96MIEhJbXf5WgsIR6UtIuA+KciIKT2JsLYRSB0FN78i9UjNAo
 e4HABQqW9VGrQn8yLqUcDzNKwMJRweRmzwiCdv3lKcxJiQbN25xOpFKqrvwnJyxxhF2b
 Lc2Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=WlNrRGmx
Subject: [Buildroot] [PATCH 1/1] package/python-setproctitle: bump to
 version 1.3.3
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
 Mauro Condarelli <mc5686@mclink.it>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-setproctitle/python-setproctitle.hash | 6 +++---
 package/python-setproctitle/python-setproctitle.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-setproctitle/python-setproctitle.hash b/package/python-setproctitle/python-setproctitle.hash
index ac8fed986a..f60595bf6c 100644
--- a/package/python-setproctitle/python-setproctitle.hash
+++ b/package/python-setproctitle/python-setproctitle.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/setproctitle/json
-md5  fa9771540422a59a8dee1331ad6fd3a9  setproctitle-1.3.2.tar.gz
-sha256  b9fb97907c830d260fa0658ed58afd48a86b2b88aac521135c352ff7fd3477fd  setproctitle-1.3.2.tar.gz
-# Locally computed
+md5  1c042d6717212de791c4f9b63e7b544e  setproctitle-1.3.3.tar.gz
+sha256  c913e151e7ea01567837ff037a23ca8740192880198b7fbb90b16d181607caae  setproctitle-1.3.3.tar.gz
+# Locally computed sha256 checksums
 sha256  4ace14d0836da75079088cfc5cef6f2ddc8ce16f600609b36ee1bf10f8101f61  COPYRIGHT
diff --git a/package/python-setproctitle/python-setproctitle.mk b/package/python-setproctitle/python-setproctitle.mk
index 7055920c08..ca2d0ffbc6 100644
--- a/package/python-setproctitle/python-setproctitle.mk
+++ b/package/python-setproctitle/python-setproctitle.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_SETPROCTITLE_VERSION = 1.3.2
+PYTHON_SETPROCTITLE_VERSION = 1.3.3
 PYTHON_SETPROCTITLE_SOURCE = setproctitle-$(PYTHON_SETPROCTITLE_VERSION).tar.gz
-PYTHON_SETPROCTITLE_SITE = https://files.pythonhosted.org/packages/b5/47/ac709629ddb9779fee29b7d10ae9580f60a4b37e49bce72360ddf9a79cdc
+PYTHON_SETPROCTITLE_SITE = https://files.pythonhosted.org/packages/ff/e1/b16b16a1aa12174349d15b73fd4b87e641a8ae3fb1163e80938dbbf6ae98
 PYTHON_SETPROCTITLE_LICENSE = BSD-3-Clause
 PYTHON_SETPROCTITLE_LICENSE_FILES = COPYRIGHT
 PYTHON_SETPROCTITLE_SETUP_TYPE = setuptools
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
