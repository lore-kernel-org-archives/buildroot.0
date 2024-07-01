Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69205C3065A
	for <buildroot@archiver.kernel.org>; Mon,  1 Jul 2024 19:22:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 20EB760AA8;
	Mon,  1 Jul 2024 19:22:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NKiVePsxAncS; Mon,  1 Jul 2024 19:22:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1E84B60AB2
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1E84B60AB2;
	Mon,  1 Jul 2024 19:22:58 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id CBBE51BF362
 for <buildroot@lists.busybox.net>; Mon,  1 Jul 2024 19:22:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B82C941364
 for <buildroot@lists.busybox.net>; Mon,  1 Jul 2024 19:22:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id g-wGDbwWkx66 for <buildroot@lists.busybox.net>;
 Mon,  1 Jul 2024 19:22:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::12c; helo=mail-il1-x12c.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org F06274130E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F06274130E
Received: from mail-il1-x12c.google.com (mail-il1-x12c.google.com
 [IPv6:2607:f8b0:4864:20::12c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id F06274130E
 for <buildroot@buildroot.org>; Mon,  1 Jul 2024 19:22:54 +0000 (UTC)
Received: by mail-il1-x12c.google.com with SMTP id
 e9e14a558f8ab-379c1f83db7so13113875ab.0
 for <buildroot@buildroot.org>; Mon, 01 Jul 2024 12:22:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719861774; x=1720466574;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=nBru488lZF9rnbiDwuzhaZFg9OGfUenB8k/7EKPk0WQ=;
 b=r9IVji5UsVdwVi+WubsjdWFQsturfOuDRI65CSoE4QSomfbIMQeQTuKiJrMtAMXYV3
 Xny+FGBPDmNXsVu7SKHQtEfM7jFiWQrPw3Xd5nGgg+UoWWuq/BKXpqTT2Abld583myuS
 4wpx7Ap6cxrGHnze10K3pKdtGilc6PS6hTpIwe46ty2Jyc/A2sarZJb7AuwcldyszZS2
 M2xfTZc3UHFiyeovlRzis4Dpd4WlEWn1oqG4XyHX8nyElrrNtIl93qdEbZfUmOMCsJTn
 YsLoswPtaIqNQevNzOUfqHowO8sBncAwSI/h2TMUsuw2YJXRDKQ134AlQZCJF2zEOHDe
 I51w==
X-Gm-Message-State: AOJu0YzW6nnMnubVt5fpHQ3rxtEchYM+mP5qu5DomrSsY1GGvvbXK4c4
 21fZOrIEgekKuZQR/xuDYO/SS7q1wPeVATmcAEpra8n4F5DvpBbAo5siaw==
X-Google-Smtp-Source: AGHT+IHb4DMk31y9YAG9wJ4IAq2zZ7tk+b5HjABxaBqKCc5WB3pKGBKKp2onjLx9O3h5pn6dEbtiJg==
X-Received: by 2002:a05:6e02:1d0b:b0:376:d20:1470 with SMTP id
 e9e14a558f8ab-37b2ad6165amr57157965ab.12.1719861773644; 
 Mon, 01 Jul 2024 12:22:53 -0700 (PDT)
Received: from james-x399.localdomain (97-118-179-167.hlrn.qwest.net.
 [97.118.179.167]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4bb73bb3765sm2293687173.32.2024.07.01.12.22.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Jul 2024 12:22:53 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon,  1 Jul 2024 13:22:52 -0600
Message-Id: <20240701192252.1769658-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1719861774; x=1720466574; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=nBru488lZF9rnbiDwuzhaZFg9OGfUenB8k/7EKPk0WQ=;
 b=cHMWxnF31Zp9r9uSoU6+cGJwdzN0sDKZzxDpXRQgkY4glpW3fwI6pqXkcrcnjFR1Mi
 stoVFWPO9yqhtXGJEQr6w8L8gCFNXcazlzvHnF7j5TwisYx17ODYUcnp8x5SLDQ5gTm6
 Jm/cdokoKC7VX75mkpMXNaP5ALVRmk+VX7eEQbLaqysgcitqYiyzjJ/a7V9wZKB16y0U
 LvFhAC+F3e78Sbo6h9y872wv0ZijDZScvBuXpXDCaxffaVVxsup/hBoOOmdl+23XkbZz
 zcdhCPT11TyfrKQVwXsNJAFByau2ArIkmY1Kr5UCbb4WSPIuWQydyTh8fdhoaGBd+fmg
 UIgQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=cHMWxnF3
Subject: [Buildroot] [PATCH 1/1] package/python-pybind: bump to version
 2.13.1
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
 Guillaume William Brs <guillaume.bressaix@gmail.com>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix patch to apply against 2.13.1.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 .../0001-pybind11-commands.py-support-STAGING_DIR.patch      | 5 +++--
 package/python-pybind/python-pybind.hash                     | 2 +-
 package/python-pybind/python-pybind.mk                       | 2 +-
 3 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/python-pybind/0001-pybind11-commands.py-support-STAGING_DIR.patch b/package/python-pybind/0001-pybind11-commands.py-support-STAGING_DIR.patch
index 009f43cdbc..255c484099 100644
--- a/package/python-pybind/0001-pybind11-commands.py-support-STAGING_DIR.patch
+++ b/package/python-pybind/0001-pybind11-commands.py-support-STAGING_DIR.patch
@@ -21,7 +21,8 @@ diff --git a/pybind11/commands.py b/pybind11/commands.py
 index a29c8ca..de8a27c 100644
 --- a/pybind11/commands.py
 +++ b/pybind11/commands.py
-@@ -1,6 +1,7 @@
+@@ -2,7 +2,8 @@ from __future__ import annotations
+ 
  import os
  
 -DIR = os.path.abspath(os.path.dirname(__file__))
@@ -29,7 +30,7 @@ index a29c8ca..de8a27c 100644
 +    os.path.abspath(os.path.dirname(__file__))
  
  
- def get_include(user: bool = False) -> str:  # pylint: disable=unused-argument
+ def get_include(user: bool = False) -> str:  # noqa: ARG001
 -- 
 2.31.1
 
diff --git a/package/python-pybind/python-pybind.hash b/package/python-pybind/python-pybind.hash
index 9d2f43ce0d..c831007d4d 100644
--- a/package/python-pybind/python-pybind.hash
+++ b/package/python-pybind/python-pybind.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256  d475978da0cdc2d43b73f30910786759d593a9d8ee05b1b6846d1eb16c6d2e0c  python-pybind-2.11.1.tar.gz
+sha256  51631e88960a8856f9c497027f55c9f2f9115cafb08c0005439838a05ba17bfc  python-pybind-2.13.1.tar.gz
 # License files, locally calculated
 sha256  83965b843b98f670d3a85bd041ed4b372c8ec50d7b4a5995a83ac697ba675dcb  LICENSE
diff --git a/package/python-pybind/python-pybind.mk b/package/python-pybind/python-pybind.mk
index 5a5d120321..a1cc02ee04 100644
--- a/package/python-pybind/python-pybind.mk
+++ b/package/python-pybind/python-pybind.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PYTHON_PYBIND_VERSION = 2.11.1
+PYTHON_PYBIND_VERSION = 2.13.1
 PYTHON_PYBIND_SITE = $(call github,pybind,pybind11,v$(PYTHON_PYBIND_VERSION))
 PYTHON_PYBIND_LICENSE = BSD-3-Clause
 PYTHON_PYBIND_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
