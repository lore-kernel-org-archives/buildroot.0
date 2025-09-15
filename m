Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32C75CAC597
	for <buildroot@archiver.kernel.org>; Mon, 15 Sep 2025 23:59:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D447E80E3F;
	Mon, 15 Sep 2025 23:59:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2LSVOo7kcaNS; Mon, 15 Sep 2025 23:59:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DB77E80E72
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id DB77E80E72;
	Mon, 15 Sep 2025 23:59:21 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id E010C22F
 for <buildroot@buildroot.org>; Mon, 15 Sep 2025 23:59:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C6BE34057E
 for <buildroot@buildroot.org>; Mon, 15 Sep 2025 23:59:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kCrIHecRzUm2 for <buildroot@buildroot.org>;
 Mon, 15 Sep 2025 23:59:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::136; helo=mail-il1-x136.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org DA9CD401E0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DA9CD401E0
Received: from mail-il1-x136.google.com (mail-il1-x136.google.com
 [IPv6:2607:f8b0:4864:20::136])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DA9CD401E0
 for <buildroot@buildroot.org>; Mon, 15 Sep 2025 23:59:19 +0000 (UTC)
Received: by mail-il1-x136.google.com with SMTP id
 e9e14a558f8ab-42404af30b0so8680475ab.0
 for <buildroot@buildroot.org>; Mon, 15 Sep 2025 16:59:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757980758; x=1758585558;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=KgnCwKjomux7h2ic7NziTvTq3k0MnnaVof33j+4Wb6o=;
 b=e1vNPiGqWqWEGueSEGRlDfzZ4+lEZhK2ifnhSpEtJa7deEUNXtk3RqMtrmXNh4qL/S
 H2Ini7ge59TfdYAVUblO/SSCpKyfKdYi5MK0vGz3hs3YgavgXnukzm/huANg/ouxDDxl
 OPNmh7YLazNjO9XOQnmwPr01MAv82Nv7CmUpNGuqHRK75UC1/jlOl620VtFtyhk1lByb
 Ea6Yf5X2YQBN5WsJt+ZgAajqGORtQ0HwKmkaBmIxReWa3EEfwn3b4lqxRHStD1Ivt/98
 iKIicC1H5Z4GXbRalFYgo7aEL30/f4Or5pdsy9KH4hfK2epMNHhCD2kd7q5WnNarHq/m
 UanQ==
X-Gm-Message-State: AOJu0YwqXXSBiKrH5eEjqrMt9NbhHYEw1r48NtRN6qx23Z6WtWXg2K2x
 ogEwWV4MPKQtHK7vOcjyi2CNgkvS4lh40u36LUibkUVadhKevqZgihvDBpIuVQ==
X-Gm-Gg: ASbGncutEaafVq8Gk1xjChQKRxcyxzMvB+F4c/LHxC7RBYYyPcsGd411q/oo4GAcmGZ
 kMF4ad7vj7hxFTZ77N1GwAZRnrn7QnpfqxMi4BPV7eClAifIWrWx73CrhyzTdDYXer77aCseJpP
 62bHfEZWEQ4h+wXGnpK1osEJyJsCsFUzH4450PU5V1V23ewmZNk4OjxbtwFUsqXuS2PMBfjHIrj
 YMD9gZOrNG9yEKh7N/wR+1fsLxKdPfhewdZY1pggu8QEy4cBcfY0DTqrW46/dYY0Po0PXStLCGY
 54jdW618rHzJqha6XgDNSS1UeDWfF7XJbtUWaGJ35fbinHQxEhhZXJLmF0wmJRAmCos+q7hSbmD
 uH62yqtKetjUf7tDCPY5O54gYzfM21D1YB6NXM27djUmYBHA4YOEftQePf376/FmnyV9JXR4OhU
 1y
X-Google-Smtp-Source: AGHT+IF2vCPdbEqZRWHnlsO7oBLAAsBvAd/u3sB/KBiYk/dbmQyNfo1KBlJESMvH5xkg/6H1vAojZw==
X-Received: by 2002:a05:6e02:b2d:b0:3fc:733b:326 with SMTP id
 e9e14a558f8ab-420a6110205mr161599905ab.32.1757980758518; 
 Mon, 15 Sep 2025 16:59:18 -0700 (PDT)
Received: from james-x399.localdomain (71-218-100-179.hlrn.qwest.net.
 [71.218.100.179]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-511f309beedsm5152696173.68.2025.09.15.16.59.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Sep 2025 16:59:17 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 15 Sep 2025 17:59:15 -0600
Message-ID: <20250915235915.2456063-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1757980758; x=1758585558; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=KgnCwKjomux7h2ic7NziTvTq3k0MnnaVof33j+4Wb6o=;
 b=h7iH/Nl4vxLilScZAWcwtWomQ/2+mhcb9rJFTlG9LYgk7Vh5Cby7aO5ygpaYlXgpTu
 rSo5MDohr7/oVcE/4Sk1Av4yR9JuKDIt2CswQCeQ0yYW0b7aBpjCX2ODPHJL4qou9PO6
 +rQtrUuZrzaNWw4tYLjz5YDI6mr0h9zWQVl6Kqchw1DWEDpN6cE/bD0gBy6UIYomH/4X
 DmFKky+GJlK+3Z9m7lQ0UQeYDbxTUwV/Bhuk28ze5WwTU0tVYfsg+LVnRP7j1MlzdDin
 f2wz0BrpWYWj10m9vhYnUxzyEVOyWUORn1SWjOxJ0ir7NgNkutr2CRNDkBRpllGPnGlv
 PsQw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=h7iH/Nl4
Subject: [Buildroot] [PATCH 1/1] package/python-httpcore: bump to version
 1.0.9
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
 package/python-httpcore/python-httpcore.hash | 4 ++--
 package/python-httpcore/python-httpcore.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-httpcore/python-httpcore.hash b/package/python-httpcore/python-httpcore.hash
index ced9020a1e..2060762866 100644
--- a/package/python-httpcore/python-httpcore.hash
+++ b/package/python-httpcore/python-httpcore.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/httpcore/json
-md5  4cdb4739273f33bfd49b6d2aa6f011c6  httpcore-1.0.7.tar.gz
-sha256  8551cb62a169ec7162ac7be8d4817d561f60e08eaa485234898414bb5a8a0b4c  httpcore-1.0.7.tar.gz
+md5  5157e7240632c2984cfda1f7ac54dfc7  httpcore-1.0.9.tar.gz
+sha256  6e34463af53fd2ab5d807f399a9b45ea31c3dfa2276f15a2c3f00afff6e176e8  httpcore-1.0.9.tar.gz
 # Locally computed sha256 checksums
 sha256  fdcb59154c74cbaba16a11242f7740bea9f23d6feb5547917d8c5f94a80392a5  LICENSE.md
diff --git a/package/python-httpcore/python-httpcore.mk b/package/python-httpcore/python-httpcore.mk
index 29d1ba1b7c..957641916a 100644
--- a/package/python-httpcore/python-httpcore.mk
+++ b/package/python-httpcore/python-httpcore.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_HTTPCORE_VERSION = 1.0.7
+PYTHON_HTTPCORE_VERSION = 1.0.9
 PYTHON_HTTPCORE_SOURCE = httpcore-$(PYTHON_HTTPCORE_VERSION).tar.gz
-PYTHON_HTTPCORE_SITE = https://files.pythonhosted.org/packages/6a/41/d7d0a89eb493922c37d343b607bc1b5da7f5be7e383740b4753ad8943e90
+PYTHON_HTTPCORE_SITE = https://files.pythonhosted.org/packages/06/94/82699a10bca87a5556c9c59b5963f2d039dbd239f25bc2a63907a05a14cb
 PYTHON_HTTPCORE_SETUP_TYPE = hatch
 PYTHON_HTTPCORE_LICENSE = BSD-3-Clause
 PYTHON_HTTPCORE_LICENSE_FILES = LICENSE.md
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
