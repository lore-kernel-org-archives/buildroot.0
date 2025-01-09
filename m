Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BFC3E77197
	for <buildroot@archiver.kernel.org>; Thu,  9 Jan 2025 21:18:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B5F1260B2E;
	Thu,  9 Jan 2025 21:18:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NRVlUd6NnDnB; Thu,  9 Jan 2025 21:18:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BD0B560B30
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id BD0B560B30;
	Thu,  9 Jan 2025 21:18:49 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id D6242942
 for <buildroot@buildroot.org>; Thu,  9 Jan 2025 21:18:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C3DED60B2E
 for <buildroot@buildroot.org>; Thu,  9 Jan 2025 21:18:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id c-7y4tj_agGx for <buildroot@buildroot.org>;
 Thu,  9 Jan 2025 21:18:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d29; helo=mail-io1-xd29.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org CFC0B60B13
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CFC0B60B13
Received: from mail-io1-xd29.google.com (mail-io1-xd29.google.com
 [IPv6:2607:f8b0:4864:20::d29])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CFC0B60B13
 for <buildroot@buildroot.org>; Thu,  9 Jan 2025 21:18:47 +0000 (UTC)
Received: by mail-io1-xd29.google.com with SMTP id
 ca18e2360f4ac-844df397754so41408439f.2
 for <buildroot@buildroot.org>; Thu, 09 Jan 2025 13:18:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736457526; x=1737062326;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=r2NGONPSR+XhYAwgsNhYqYCI+MhfgnsMXh+D7hDQyQw=;
 b=xOlpcfePZe+w1notkpHJTs780QXs+LXPaqnhuM7mOfYpGXSO32bwxqV4CJQ9s2J0vJ
 gzEwCj0aP2zaj7j5k0f95KSYKbVPRbB3Y/6v65l0VBnwU95tsnoRd1MB4gltMFptJYTY
 5HNDlmWUzpPPqvLKQfy517jRR1+PuQrAkHkKxbOfOeM6F2I1QXrB223DUKnkS/Hcq7Ak
 LRh/CkmcZfrTurt5sWhJRWvdzaLANPChweiDtvZn9q/EN0LOfMiT4RkYNWEaN11F7SLy
 27vFZAkoIFkUlEodD3qrBIIYSyPb1MTGiRxldvkq0oplXB0srjoVFng/K8zk/4bkmX/h
 60uA==
X-Gm-Message-State: AOJu0YzPicv/Nb2lW0BMAyuVvL1bH4kDSPMpyQ02SQWZqXkP1zBHwOGi
 0gXOkBeA+QnybBSRR7ew4ujytqFcTB6J0p0ogDxKqTKGR+FCtrFUwOnq0whLDIM=
X-Gm-Gg: ASbGncvNOfBAbw5kn66tyx8rfMa2hfHyzcJtB9I06p7zTwnr/1l0cWS0lTRfAnJWyLc
 ca6Hid3C1ZGDO80ED2QUIptirzl8iZGyG/fnaMgrPtta+8GHgoW/PKEZcerInqgc5FyT8WxzOy8
 05Kc+9KSOg0F1zbuulx2raLWaV296nwxLHgCvuoOUKnlMHWf1bMhbPMiC9484y7f1X1Dzn7+Msv
 kEnsgzUUouMJNnmLc8flCqvszOs6umUEuSB5FLLSajnQRxB4UBjhw+hfYs6QHcPhiSkJwI/ECRt
 USdLo8uj6/v0qqIksgxruMmb/HL7ap8=
X-Google-Smtp-Source: AGHT+IHbsHOmV58omjm2O0WHJRKESBtTdx1WlhIDDPHuWdVpl6pvXnb5CpmqzB5ocP/2KKwDMzqa0Q==
X-Received: by 2002:a05:6e02:1f84:b0:3a7:8d8e:e760 with SMTP id
 e9e14a558f8ab-3ce3a90ed40mr63356925ab.4.1736457526383; 
 Thu, 09 Jan 2025 13:18:46 -0800 (PST)
Received: from james-x399.localdomain (71-218-115-58.hlrn.qwest.net.
 [71.218.115.58]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4ea1b5f93d2sm511587173.22.2025.01.09.13.18.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jan 2025 13:18:46 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Thu,  9 Jan 2025 14:18:44 -0700
Message-Id: <20250109211844.2401761-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1736457526; x=1737062326; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=r2NGONPSR+XhYAwgsNhYqYCI+MhfgnsMXh+D7hDQyQw=;
 b=BojcU/W6/jMOGxOJwA7aWFCHj6XeNcnrBOIogoRxyrnRfpgL5hdlPAIbfeQd1cN99o
 3nu8AAjO+qsmSt7lGzWAxDGDXX49ZdP5VJXxaVfw2lDYWIXdc3Cze+FPXAjai//Lu4NL
 jijbBg+H+DA5dLCqSph0uyrucSXEsEV4GL5qFPDvnhpbyZ0vTpfdt1QeVO6u32z0dfWw
 VxdfKyRGNUQaFrKXN0E/7YfRl/u2w+vaL/KhyGBu2hlNNuloybMdxxlUtZV+G36yV0sI
 g+D60gfal9svuffBuN81aXVL2ea8f7B6QZzhxoNTBI2zZDRP2dBzbpH2XsZIfPvzD1sL
 lJLw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=BojcU/W6
Subject: [Buildroot] [PATCH 1/1] package/python-hiredis: bump to version
 3.1.0
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Grzegorz Blach <grzegorz@blach.pl>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-hiredis/python-hiredis.hash | 4 ++--
 package/python-hiredis/python-hiredis.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-hiredis/python-hiredis.hash b/package/python-hiredis/python-hiredis.hash
index d4d98d85df..07b0d96582 100644
--- a/package/python-hiredis/python-hiredis.hash
+++ b/package/python-hiredis/python-hiredis.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/hiredis/json
-md5  c0b7f7def9f945e8a900a4275df2d3af  hiredis-3.0.0.tar.gz
-sha256  fed8581ae26345dea1f1e0d1a96e05041a727a45e7d8d459164583e23c6ac441  hiredis-3.0.0.tar.gz
+md5  56a3997b44753c11a0cdb2dc4aa50352  hiredis-3.1.0.tar.gz
+sha256  51d40ac3611091020d7dea6b05ed62cb152bff595fa4f931e7b6479d777acf7c  hiredis-3.1.0.tar.gz
 # Locally computed sha256 checksums
 sha256  3256b5b77e98aa34ff31a4d2c2c10f7f177b0f3058753a6044430a168987353b  LICENSE
 sha256  dca05ce8fc87a8261783b4aed0deef8becc9350b6aa770bc714d0c1833b896eb  vendor/hiredis/COPYING
diff --git a/package/python-hiredis/python-hiredis.mk b/package/python-hiredis/python-hiredis.mk
index 59e036c845..b938650caf 100644
--- a/package/python-hiredis/python-hiredis.mk
+++ b/package/python-hiredis/python-hiredis.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_HIREDIS_VERSION = 3.0.0
+PYTHON_HIREDIS_VERSION = 3.1.0
 PYTHON_HIREDIS_SOURCE = hiredis-$(PYTHON_HIREDIS_VERSION).tar.gz
-PYTHON_HIREDIS_SITE = https://files.pythonhosted.org/packages/8b/80/740fb0dfa7a42416ce8376490f41dcdb1e5deed9c3739dfe4200fad865a9
+PYTHON_HIREDIS_SITE = https://files.pythonhosted.org/packages/38/e5/789cfa8993ced0061a6ef7ea758302ef5cf3439629bf0d39c85a6ede4641
 PYTHON_HIREDIS_SETUP_TYPE = setuptools
 PYTHON_HIREDIS_LICENSE = MIT, BSD-3-Clause
 PYTHON_HIREDIS_LICENSE_FILES = LICENSE vendor/hiredis/COPYING
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
