Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63318CAC59E
	for <buildroot@archiver.kernel.org>; Tue, 17 Sep 2024 20:34:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 30281817AD;
	Tue, 17 Sep 2024 20:34:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WPIQ_o4jjfiH; Tue, 17 Sep 2024 20:34:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2EDCB81836
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2EDCB81836;
	Tue, 17 Sep 2024 20:34:10 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 835831BF2C3
 for <buildroot@lists.busybox.net>; Tue, 17 Sep 2024 20:34:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7FCB760E18
 for <buildroot@lists.busybox.net>; Tue, 17 Sep 2024 20:34:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xBP0u6FbBl4i for <buildroot@lists.busybox.net>;
 Tue, 17 Sep 2024 20:34:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::12e; helo=mail-il1-x12e.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 83606607A5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 83606607A5
Received: from mail-il1-x12e.google.com (mail-il1-x12e.google.com
 [IPv6:2607:f8b0:4864:20::12e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 83606607A5
 for <buildroot@buildroot.org>; Tue, 17 Sep 2024 20:34:07 +0000 (UTC)
Received: by mail-il1-x12e.google.com with SMTP id
 e9e14a558f8ab-3a056727fdfso18944305ab.3
 for <buildroot@buildroot.org>; Tue, 17 Sep 2024 13:34:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726605246; x=1727210046;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=tzn844gx7/gOz0THZ7o8vU7HvQWD17ky2nF3nzIkCHE=;
 b=AoJ0r4yNKa2+/dD07qUP2K2PjtrMFd+cgSnheNmyqVM+vgwJkNyipZ6URgkx9OI+7X
 lbz1OygsG+rYP9iV0fguZIYNlUHMdlc3zZofYO/QB3nfoBvR/P3JINzgzwpGFqDM4ObP
 ofczpyaSuUuSIFfUWwmcV1rYL7OEyWQkXEM3cvZLYD2q6seiwOk3wFIJd8bJshU2lF1b
 H7bd+idMd/VebVDYYtqf7QKM0loT+X+LC3fUqihKoItd8icbuSoERfZUacMrKKRlXiBl
 pbjm6wqkV4aiY89T5m2ZPT2Tvc/XWEhJRhuOwhpn64KsXg6VCTRI/TKmVeUF5+4uWbVT
 KmGA==
X-Gm-Message-State: AOJu0YyVarBqX47RXKV4xACcuQO38aAztvcUwdUufscOKuqKmEnbL6P2
 u4Q4+rje7RhyOGFm0INdVojW5TQJUZji68W5t0En6LFCVPOKlsjKSfudRw==
X-Google-Smtp-Source: AGHT+IFCRvWEafjpIEWPOodgy+H4Ir4CoIoWeoM7ST45yOVQGges6z2IBswsKmP2DBn6C0YxzJw9rQ==
X-Received: by 2002:a05:6e02:1649:b0:3a0:a0bd:f92b with SMTP id
 e9e14a558f8ab-3a0a0bdfbe5mr67422805ab.10.1726605246272; 
 Tue, 17 Sep 2024 13:34:06 -0700 (PDT)
Received: from james-x399.localdomain (71-218-252-223.hlrn.qwest.net.
 [71.218.252.223]) by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-3a092e8fdb2sm23665825ab.78.2024.09.17.13.34.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Sep 2024 13:34:05 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 17 Sep 2024 14:34:04 -0600
Message-Id: <20240917203404.4020567-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726605246; x=1727210046; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=tzn844gx7/gOz0THZ7o8vU7HvQWD17ky2nF3nzIkCHE=;
 b=doAxJVgVg31nxxTALaXtNNF0vxql3bMn6uIlwAZS81eSPhN0gTB91VcKfQZ2xTsOsT
 m/y1PgACCIxg6TieYGRqQO0VGg+ZXvaCQy0oE4VHwT7I/B6E0I3Ss3Zw8UpDf4TsfapE
 UQTIrT2R/J6BGvnpuEsJJJfIJC5w+rchfVxInzQDt9GIgEqDenwKffG/7WYOlXNYpM8L
 oPnxoWYLIqjVisqE/q1zChGA9eIOlTs9gC9buZL56FfGhKWM6KY9V2pBmQFRamTSruOK
 A/dlIeLAPb2ZdkjhSI0Z50NkmG1LBVjYu/3O5P1hQ7niHwq1iG19x5l3z9II+xH9bmI+
 RSYw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=doAxJVgV
Subject: [Buildroot] [PATCH 1/1] package/python-psutil: bump to version 6.0.0
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
 package/python-psutil/python-psutil.hash | 4 ++--
 package/python-psutil/python-psutil.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-psutil/python-psutil.hash b/package/python-psutil/python-psutil.hash
index c5f4f39fe0..f85a293557 100644
--- a/package/python-psutil/python-psutil.hash
+++ b/package/python-psutil/python-psutil.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/psutil/json
-md5  afcc40a779f84f6d909570a8934cebc3  psutil-5.9.7.tar.gz
-sha256  3f02134e82cfb5d089fddf20bb2e03fd5cd52395321d1c8458a9e58500ff417c  psutil-5.9.7.tar.gz
+md5  5874bd773d2fe7da3c0817424f383033  psutil-6.0.0.tar.gz
+sha256  8faae4f310b6d969fa26ca0545338b21f73c6b15db7c4a8d934a5482faa818f2  psutil-6.0.0.tar.gz
 # Locally computed sha256 checksums
 sha256  b89c063b3786e28e0c0a38f1931db61fed35e69dd2a2966fbecffee0f46c8d10  LICENSE
diff --git a/package/python-psutil/python-psutil.mk b/package/python-psutil/python-psutil.mk
index e83193f20f..b6dee0ce7f 100644
--- a/package/python-psutil/python-psutil.mk
+++ b/package/python-psutil/python-psutil.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PSUTIL_VERSION = 5.9.7
+PYTHON_PSUTIL_VERSION = 6.0.0
 PYTHON_PSUTIL_SOURCE = psutil-$(PYTHON_PSUTIL_VERSION).tar.gz
-PYTHON_PSUTIL_SITE = https://files.pythonhosted.org/packages/a0/d0/c9ae661a302931735237791f04cb7086ac244377f78692ba3b3eae3a9619
+PYTHON_PSUTIL_SITE = https://files.pythonhosted.org/packages/18/c7/8c6872f7372eb6a6b2e4708b88419fb46b857f7a2e1892966b851cc79fc9
 PYTHON_PSUTIL_SETUP_TYPE = setuptools
 PYTHON_PSUTIL_LICENSE = BSD-3-Clause
 PYTHON_PSUTIL_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
