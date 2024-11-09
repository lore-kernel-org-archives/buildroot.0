Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 893EFD5E37C
	for <buildroot@archiver.kernel.org>; Sat,  9 Nov 2024 19:16:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EA4DB402CE;
	Sat,  9 Nov 2024 19:16:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jt4Rx-Di2oag; Sat,  9 Nov 2024 19:16:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 56ED74024F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 56ED74024F;
	Sat,  9 Nov 2024 19:16:23 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0C1EBD92
 for <buildroot@buildroot.org>; Sat,  9 Nov 2024 19:16:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EE1DD6059E
 for <buildroot@buildroot.org>; Sat,  9 Nov 2024 19:16:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BfwJSKnbbMjf for <buildroot@buildroot.org>;
 Sat,  9 Nov 2024 19:16:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d35; helo=mail-io1-xd35.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 041C360596
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 041C360596
Received: from mail-io1-xd35.google.com (mail-io1-xd35.google.com
 [IPv6:2607:f8b0:4864:20::d35])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 041C360596
 for <buildroot@buildroot.org>; Sat,  9 Nov 2024 19:16:20 +0000 (UTC)
Received: by mail-io1-xd35.google.com with SMTP id
 ca18e2360f4ac-8323b555a6aso170860539f.3
 for <buildroot@buildroot.org>; Sat, 09 Nov 2024 11:16:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731179780; x=1731784580;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=UwjMjgwxci8G6rm3oHlOOGtbfyDEAjTUM6xVanzby2E=;
 b=c6cJFiiifmM2fSrtiVrex9X8KHEX60lzHV+INAmWf143JxaMHPFbbHSCOFeL23iMSB
 MiXj0n+K6rdABgGLEs+Lna66VxyiK04uaWwYz/JJldem6MquSHf8wCUuVRpNt3JFYbRP
 tUfSod5M0836g1n9Glr8Z2bLnFcRb2YtzDdxhRLdU515nchJU/zLn2h4blf4y2xcyVGP
 i0AsLH/FaECnL7b/BQ27AmbOHH+OK0qu4/e9YXZ3yaYEtaicTDQPJsh+ZaPJp//LLWi9
 HWTxqVO5fjGOEaWBHCNU+2YUzCWKKwQNc5GUt6INfl0dXPBMAjSQlqCWXUTPTH7mbnmq
 T5mw==
X-Gm-Message-State: AOJu0YzDbbzOQVu57OWey2ywl4zTpHo27zsJ9fj4miFlEZIbRtv1rcpa
 hquHZqyzprhsS9R8aNO+GL2HyNGuOs4+Rj9DjSzssCwFIAe0Bo+sYN2tQA==
X-Google-Smtp-Source: AGHT+IGcq8ZdUv2ZPyE2OVri5o5EI4DLvicgx98cOjdlSrOJYC9pqM412yzSLh4h09ujiSsNiHyJJw==
X-Received: by 2002:a05:6602:2c12:b0:83a:942d:7ded with SMTP id
 ca18e2360f4ac-83e032bb426mr869122939f.6.1731179779863; 
 Sat, 09 Nov 2024 11:16:19 -0800 (PST)
Received: from james-x399.localdomain (71-33-148-91.hlrn.qwest.net.
 [71.33.148.91]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4de787d6cddsm464835173.102.2024.11.09.11.16.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 09 Nov 2024 11:16:19 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  9 Nov 2024 12:16:17 -0700
Message-Id: <20241109191617.794326-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1731179780; x=1731784580; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=UwjMjgwxci8G6rm3oHlOOGtbfyDEAjTUM6xVanzby2E=;
 b=iP8EUVC5q0WNqlBJmNd7BISeU1glJMSRJaF20duAfq3F/i9JOK6sSkwsEKb4j1fYsv
 DLATEypLzFpGfcENJQaJTvku7g+GioRbEA4LwFjJvFmWgxqWvfRELtVDO9ZkxXDDgmSg
 yBiggB6uQMF54I2A8IwHpvaIf7qTTnNI6rX5KupWKPTnhN0lVIs0Rc+t42YNhg22d/sf
 WzxCLHKkxr0QKgiSCSiz5tCJTDmuMyOe2uJQXS0Rafi+eBtRTClDfMYkTA8+U5HxsLwu
 HbbKZKlB0Q4v+smqtBejv3TU07zAm/27NtHHirNBszl3GhvEYl8B3SVmJGyBPgd6ZTZ2
 99Mg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=iP8EUVC5
Subject: [Buildroot] [PATCH 1/1] package/python-scapy: bump to version 2.6.1
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
 package/python-scapy/python-scapy.hash | 4 ++--
 package/python-scapy/python-scapy.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-scapy/python-scapy.hash b/package/python-scapy/python-scapy.hash
index 3ab7eb9386..4f86177e9b 100644
--- a/package/python-scapy/python-scapy.hash
+++ b/package/python-scapy/python-scapy.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/scapy/json
-md5  0fb44b6db8fbb76c0648c9c161067c15  scapy-2.6.0.tar.gz
-sha256  c8f7eb54511c2fab502128ccf18e2e4b98e1f6af6e02ae15b84ad3039143ba3b  scapy-2.6.0.tar.gz
+md5  b8951038f22c9ec447538be8b08ac503  scapy-2.6.1.tar.gz
+sha256  7600d7e2383c853e5c3a6e05d37e17643beebf2b3e10d7914dffcc3bc3c6e6c5  scapy-2.6.1.tar.gz
 # Locally computed sha256 checksums
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE
diff --git a/package/python-scapy/python-scapy.mk b/package/python-scapy/python-scapy.mk
index 8c3cae3348..f1d6ff346b 100644
--- a/package/python-scapy/python-scapy.mk
+++ b/package/python-scapy/python-scapy.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_SCAPY_VERSION = 2.6.0
+PYTHON_SCAPY_VERSION = 2.6.1
 PYTHON_SCAPY_SOURCE = scapy-$(PYTHON_SCAPY_VERSION).tar.gz
-PYTHON_SCAPY_SITE = https://files.pythonhosted.org/packages/70/ca/17cc6ee0dbf342193732312f14bfc879dd162570287fd9f65ac1eb8a9c5f
+PYTHON_SCAPY_SITE = https://files.pythonhosted.org/packages/df/2f/035d3888f26d999e9680af8c7ddb7ce4ea0fd8d0e01c000de634c22dcf13
 PYTHON_SCAPY_SETUP_TYPE = setuptools
 PYTHON_SCAPY_LICENSE = GPL-2.0
 PYTHON_SCAPY_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
