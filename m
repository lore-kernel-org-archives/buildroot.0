Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BF78CAC599
	for <buildroot@archiver.kernel.org>; Tue, 16 Sep 2025 01:45:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DC55E60C28;
	Tue, 16 Sep 2025 01:45:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FiYEYKt3WcLj; Tue, 16 Sep 2025 01:45:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1E4D660D9B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1E4D660D9B;
	Tue, 16 Sep 2025 01:45:45 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 5B114199
 for <buildroot@buildroot.org>; Tue, 16 Sep 2025 01:45:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 47C5540098
 for <buildroot@buildroot.org>; Tue, 16 Sep 2025 01:45:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 742DQkfdDAlq for <buildroot@buildroot.org>;
 Tue, 16 Sep 2025 01:45:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d34; helo=mail-io1-xd34.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 6551940067
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6551940067
Received: from mail-io1-xd34.google.com (mail-io1-xd34.google.com
 [IPv6:2607:f8b0:4864:20::d34])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6551940067
 for <buildroot@buildroot.org>; Tue, 16 Sep 2025 01:45:42 +0000 (UTC)
Received: by mail-io1-xd34.google.com with SMTP id
 ca18e2360f4ac-88758c2a133so446404839f.0
 for <buildroot@buildroot.org>; Mon, 15 Sep 2025 18:45:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757987141; x=1758591941;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/i0oU3rU0hYCeMRIVUNL+ffPSEZ0MpJ2r5JsAqbiKxg=;
 b=aR3FhyZk35W6vQVbYoNW3mYh0yQTqHzwXDHvP1EyaTyssB7tme2v2a1xqs4wyEVdf2
 gMQVgbEkc1iUQHrVj+tb1f+CFtiJpyZuwEJ6Wg6ylmPSDe+zjTgs0Xp2Y/Q1TxxacXYS
 /r4JWw9a/iQHkCmfJ29nPirLlI2XUzGORP80elhJtD+5Hz7vkeyE5N7bu+L4wkEB0bBK
 YwRRJVDvMutPrV5WUJrXp3lqSY9FWYNKa4k/CWNnyGuoAXUSJjmKd0mkHMLwrtygz4//
 JOMIh8iAqoGR1I1CAW/6fOj2iTkux2IOq/2lv2VwRodqmOPNYkoMaskQVgvHPj1ZhL8g
 mJkA==
X-Gm-Message-State: AOJu0YzTD2PUO2fwPXzK7f0+a/uTj//3qKSv6v7Uva6rOqrPoz8pHMXe
 +Q0hBQGJdcKctYpbevwJ8lO6z4XtnqiwrRd0TLm9IPI41lk4V4wRkTsjn/9Z0w==
X-Gm-Gg: ASbGncs4z0KbG2E4u3jb+3lWCrE/JrWC00yDvBDe+dPRgCo4hjtz1qgIlLLatr+gAN/
 jJKR/aXm36wMroqHRPhGQwKPnFXz1PhzUZ+A9Jo2mvf+rcI2gwZQTDhu2uVYpxjL1vJBcTurVDr
 4cFUVX/ut8kIGP4H3YonsZ39XTQhVDjnCjBUcqiJoZu+oXKp9n1xMIe9x6kJIJ9P3FCTa8m27Wo
 p4U+bv4rk3/QjRv9SmDvY8KtJN+iSQUTGEvdMT8xrim9VUc6lKSPYGV1/jaZ6VP3PUm8zMscKBd
 34xoFlbYuZwLM66LBasHT6WEvrPJhbMbShEWkolrB907D6oy4YsNOiSRjBoD+XYZQ2mvllmjMBI
 CcYz/8McTLoA9mvatw1HtewsQAlrciy/0RUDay2L3bpoxtVUHQ8djl6JcQsbq+89SKiIdrHgcqF
 ve8LUqUHIysOU=
X-Google-Smtp-Source: AGHT+IFS9yQWnk/SLhSb2m+FyhBjI4rl9vSrjgYroKD3xGALtaWPifVWkU5gQBx2p7p4Og1Qp13qSg==
X-Received: by 2002:a05:6602:6d12:b0:893:b722:7241 with SMTP id
 ca18e2360f4ac-893b722823fmr354350339f.14.1757987141127; 
 Mon, 15 Sep 2025 18:45:41 -0700 (PDT)
Received: from james-x399.localdomain (71-218-100-179.hlrn.qwest.net.
 [71.218.100.179]) by smtp.gmail.com with ESMTPSA id
 ca18e2360f4ac-88f2fabab2bsm494335539f.24.2025.09.15.18.45.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Sep 2025 18:45:40 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 15 Sep 2025 19:45:39 -0600
Message-ID: <20250916014539.2605745-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1757987141; x=1758591941; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=/i0oU3rU0hYCeMRIVUNL+ffPSEZ0MpJ2r5JsAqbiKxg=;
 b=bDCvJNQeRofoGkOQ8NuQTePGLyqfwuomC81NITBkpzJoWr/4C2wzaPwvoE2Ivx2w5j
 bwodF+Px/eU7ZWLw8Ydl6M6KF2E3Pv9offskv8pxxk/9D/8NM+eAF5Fw3MaXR5XZ0rxX
 quL/eRsiiZIwpLFAabOK0VmREUm30PVpLKhbhpMQ4+RR7fv1t+kcrVBtrCDg0dRWF9Ru
 pG5G7BoxKw4eyTqsWZZqpilo35B5km1KPFlvucRzanrOjKzq/OLv4qHd5SSAHLwjGEm/
 8qcQRvjf/KAQ3Iohja+2+He/jc0goV5QB9vFg1Ln4IjnB7hAzogWk/wgkaB2qZB3dj5E
 QZIQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=bDCvJNQe
Subject: [Buildroot] [PATCH 1/1] package/python-poetry-core: bump to version
 2.2.0
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

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-poetry-core/python-poetry-core.hash | 4 ++--
 package/python-poetry-core/python-poetry-core.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-poetry-core/python-poetry-core.hash b/package/python-poetry-core/python-poetry-core.hash
index 94c876d918..888f220e96 100644
--- a/package/python-poetry-core/python-poetry-core.hash
+++ b/package/python-poetry-core/python-poetry-core.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/poetry-core/json
-md5  799f582e2644e6c2c7865498f3b37394  poetry_core-2.0.1.tar.gz
-sha256  10177c2772469d9032a49f0d8707af761b1c597cea3b4fb31546e5cd436eb157  poetry_core-2.0.1.tar.gz
+md5  dd09886c53c482680536e8ce8ffd483e  poetry_core-2.2.0.tar.gz
+sha256  b4033b71b99717a942030e074fec7e3082e5fde7a8ed10f02cd2413bdf940b1f  poetry_core-2.2.0.tar.gz
 # Locally computed sha256 checksums
 sha256  f1978133782b90f4733bc308ddb19267c3fe04797c88d9ed3bc219032495a982  LICENSE
diff --git a/package/python-poetry-core/python-poetry-core.mk b/package/python-poetry-core/python-poetry-core.mk
index ebbb9b73c2..eac7f75a9f 100644
--- a/package/python-poetry-core/python-poetry-core.mk
+++ b/package/python-poetry-core/python-poetry-core.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_POETRY_CORE_VERSION = 2.0.1
+PYTHON_POETRY_CORE_VERSION = 2.2.0
 PYTHON_POETRY_CORE_SOURCE = poetry_core-$(PYTHON_POETRY_CORE_VERSION).tar.gz
-PYTHON_POETRY_CORE_SITE = https://files.pythonhosted.org/packages/c4/f5/89d11008714e0a49cab9cba7cce89c66ea5a94f37cc6d283798cc1725fac
+PYTHON_POETRY_CORE_SITE = https://files.pythonhosted.org/packages/6c/73/8cc4cdc3992d9e03a749dd0ef7438093042a1ed197df8fcfc9dc9502ef0b
 PYTHON_POETRY_CORE_SETUP_TYPE = pep517
 PYTHON_POETRY_CORE_LICENSE = MIT
 PYTHON_POETRY_CORE_LICENSE_FILES = LICENSE
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
