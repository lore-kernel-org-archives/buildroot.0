Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50612C282EC
	for <buildroot@archiver.kernel.org>; Mon, 17 Mar 2025 22:34:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1777481760;
	Mon, 17 Mar 2025 22:34:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fz6CixBm5SYm; Mon, 17 Mar 2025 22:34:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1BA6981765
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1BA6981765;
	Mon, 17 Mar 2025 22:34:36 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 7A1AC16E
 for <buildroot@buildroot.org>; Mon, 17 Mar 2025 22:34:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5D9FF40934
 for <buildroot@buildroot.org>; Mon, 17 Mar 2025 22:34:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5OvQz-17WH0p for <buildroot@buildroot.org>;
 Mon, 17 Mar 2025 22:34:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::129; helo=mail-il1-x129.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 35D9A4099B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 35D9A4099B
Received: from mail-il1-x129.google.com (mail-il1-x129.google.com
 [IPv6:2607:f8b0:4864:20::129])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 35D9A4099B
 for <buildroot@buildroot.org>; Mon, 17 Mar 2025 22:34:34 +0000 (UTC)
Received: by mail-il1-x129.google.com with SMTP id
 e9e14a558f8ab-3d43c972616so15891275ab.0
 for <buildroot@buildroot.org>; Mon, 17 Mar 2025 15:34:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742250873; x=1742855673;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=2mhCXlFEYiGJ0PDwls2BDPSXO75yI+Z/PHk5Bfoj4vE=;
 b=ZdoWphepR04g0y2GBOXf0/GmVwa8yBrdSJ1qsR3X4OOvZoFGBZqsQCr3XRvbbu3aBe
 GX3OyYP5mxAIGvN53o8c0Lj9roUIvxYp60hKjpy34QCDxWPLuXAAycM+VUjbmg7f2YV4
 ovbwLjnO7qAgfn94JrnbmmXhQh0j/c1NrxZllcoRcf7A81xq8W6+5NgvsVEGWbj6/wNt
 Ot3nxb2j6z3ubwGp9l95SivHGiStxamtXf6CU3wuY6t2wS3w6Uqc7ik9R3YHHwDl6JTN
 FLx/JiYi8dcYk95LFg/mS0psDKAzOmD4M//i+ggfTRxcupeMDIDNXe0cxOW8VMx7BRY0
 iU7A==
X-Gm-Message-State: AOJu0YyJULugWni3i7nbX2y15VhTIDrfixEnDvWByHAfbAykcepvMKJC
 nkb/QPen7DonbrZbCwVql3id+f68J7vcbMqCxdHf7+11tku1Nlr9pi55YQ==
X-Gm-Gg: ASbGncsAyTt1H2VH8+xljsrnTRYnGdHM+HlVKiKcerKJUUo43Agsrt5sAnc2JImD8i+
 lC9DRPxXzIZOehduqiMGsLD9XBa3pUvGiOZVWJ+Cgnf4WEV2d3i/cJQPAjHtxkEXs3/M0p1fv0+
 4hKUHFRYFUPVEsoGfBbC4lvnwKS7zpHPJYQe2vyEgc+nKwc338+hHeayWnzYCJAdwUTNawko9fw
 +ea3WfFGEXMHlgL5wMtn+uMmT7SzMO5TJ8E/5klanJspbz7QHOPTytpphpYFu7++pmDYYesX8Op
 SqfUPNJRxB7V4FuWV+AWJyEd+ATOa0eBystEfFrYi9a8ONCqPzj21bPKwFURZ/d0hlNRM1pCvCJ
 p64xlz8H95TLCZfU4wUhs
X-Google-Smtp-Source: AGHT+IH0JqXWKZnyTRgIFX4x0UBl2oH+yI+Lk88DkdnEPAw8VVRbf9XAMHNrBoTYOf19BEUnmgrnEQ==
X-Received: by 2002:a05:6e02:1a6d:b0:3d3:f72c:8fd8 with SMTP id
 e9e14a558f8ab-3d57c1e03c7mr14146455ab.6.1742250873007; 
 Mon, 17 Mar 2025 15:34:33 -0700 (PDT)
Received: from james-x399.localdomain (71-218-115-58.hlrn.qwest.net.
 [71.218.115.58]) by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-3d47a67f035sm28564475ab.36.2025.03.17.15.34.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Mar 2025 15:34:32 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 17 Mar 2025 16:34:29 -0600
Message-Id: <20250317223429.3068047-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1742250873; x=1742855673; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=2mhCXlFEYiGJ0PDwls2BDPSXO75yI+Z/PHk5Bfoj4vE=;
 b=gT2cDbTcJvJsYE6dGj2Eb+Bmg2GRB99Q8itdJZKbmyPPiCQaIAFpEIeoz8+kCNAJxQ
 iPTXSPrHwloNiAl2Yr731N9478hfLKjeHaO4ncHLjX1YNprs+U7ozMu2/Sa1vT+2dqVO
 Cv73laNRYpwQzodZjEvA1oQ82L8mLTBBvPVub6P3cPs+p8koPWJycZgiYBsAyKH3ohqU
 CR+4X7AcVTT2EC2k2Wq67jzqAg5ReEOR/cCaabYgsqREa4Zc5IwxVZIIryUFDssO6ES1
 BCOJ403F9CMv0CcR8vORANZD3+v04u2ii0od0iH5Kg3P59t7Kv1b/Xtmo83v+gS97DrY
 S/2g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=gT2cDbTc
Subject: [Buildroot] [PATCH 1/1] package/python-setuptools: bump to version
 76.0.0
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
 package/python-setuptools/python-setuptools.hash | 4 ++--
 package/python-setuptools/python-setuptools.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-setuptools/python-setuptools.hash b/package/python-setuptools/python-setuptools.hash
index 87a4d877ea..d2aa961b04 100644
--- a/package/python-setuptools/python-setuptools.hash
+++ b/package/python-setuptools/python-setuptools.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/setuptools/json
-md5  a42b075e3e18e724580f4caf7944354a  setuptools-75.8.0.tar.gz
-sha256  c5afc8f407c626b8313a86e10311dd3f661c6cd9c09d4bf8c15c0e11f9f2b0e6  setuptools-75.8.0.tar.gz
+md5  a15701d19326a1d4132fce56f2861a60  setuptools-76.0.0.tar.gz
+sha256  43b4ee60e10b0d0ee98ad11918e114c70701bc6051662a9a675a0496c1a158f4  setuptools-76.0.0.tar.gz
 # Locally computed sha256 checksums
 sha256  86da0f01aeae46348a3c3d465195dc1ceccde79f79e87769a64b8da04b2a4741  LICENSE
diff --git a/package/python-setuptools/python-setuptools.mk b/package/python-setuptools/python-setuptools.mk
index af59e54d11..7157b1c771 100644
--- a/package/python-setuptools/python-setuptools.mk
+++ b/package/python-setuptools/python-setuptools.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_SETUPTOOLS_VERSION = 75.8.0
+PYTHON_SETUPTOOLS_VERSION = 76.0.0
 PYTHON_SETUPTOOLS_SOURCE = setuptools-$(PYTHON_SETUPTOOLS_VERSION).tar.gz
-PYTHON_SETUPTOOLS_SITE = https://files.pythonhosted.org/packages/92/ec/089608b791d210aec4e7f97488e67ab0d33add3efccb83a056cbafe3a2a6
+PYTHON_SETUPTOOLS_SITE = https://files.pythonhosted.org/packages/32/d2/7b171caf085ba0d40d8391f54e1c75a1cda9255f542becf84575cfd8a732
 PYTHON_SETUPTOOLS_LICENSE = MIT
 PYTHON_SETUPTOOLS_LICENSE_FILES = LICENSE
 PYTHON_SETUPTOOLS_CPE_ID_VENDOR = python
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
