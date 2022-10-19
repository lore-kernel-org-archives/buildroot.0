Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95744C4332F
	for <buildroot@archiver.kernel.org>; Wed, 19 Oct 2022 19:46:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E356560AE4;
	Wed, 19 Oct 2022 19:46:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E356560AE4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id adP6VnI0nwZv; Wed, 19 Oct 2022 19:46:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9FFC660AF1;
	Wed, 19 Oct 2022 19:46:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9FFC660AF1
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B30F71BF41F
 for <buildroot@lists.busybox.net>; Wed, 19 Oct 2022 19:46:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8BBF841D06
 for <buildroot@lists.busybox.net>; Wed, 19 Oct 2022 19:46:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8BBF841D06
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id s8E4RTai1Q03 for <buildroot@lists.busybox.net>;
 Wed, 19 Oct 2022 19:46:17 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 68B7141D05
Received: from mail-io1-xd30.google.com (mail-io1-xd30.google.com
 [IPv6:2607:f8b0:4864:20::d30])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 68B7141D05
 for <buildroot@buildroot.org>; Wed, 19 Oct 2022 19:46:17 +0000 (UTC)
Received: by mail-io1-xd30.google.com with SMTP id y80so15405769iof.3
 for <buildroot@buildroot.org>; Wed, 19 Oct 2022 12:46:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=yfqdZcQ4CSNTuzNP1fXHblo+fLKG+mLBTqBU68dRo1Y=;
 b=CEna1S9G/t7H6ZxVgxHpuVwVN8NNXMp+itZCSYyelFoSPqbh0G1j3m2BC0mWEg2OB1
 eR0sz/oIsNfhhM688RDEzY/mjjp5srN6rp/Orzq1GNfUAnrRqoyuJTyYCP7D3b5jIad5
 AyYEID4L/RHyP/y0PpD3X8I8tkXY5+Z7yw2fwY+TDMA+kDGkHOAAj7vJUkOfs8ekwfrn
 iYaSJJ1JexAgLOnwvnHtxQwwFlSY05GsuhRTtHY9ElypvjYSzO2P/WQz4hocO24jXbT6
 q9ARMjTozkEXVr230eeILLMxTBKgWyiol6bD/TCLO8w3x1Bp5jHm83+Z83TzPhwTC0OM
 3DJA==
X-Gm-Message-State: ACrzQf2agEWOtfLNhDY2dhe4fOrKG/JSpJBeVqOt82lkGItZfwc9tr67
 SrXhFQE4YSKaiGP1nXKTD+n5Vdn8ZxLH4Q==
X-Google-Smtp-Source: AMsMyM7wW8kr+1i/odb2aRqZbsQSbU2kszd1R9eo3WAKDiSNUBniKUhVvmGE0E7Aobrd4ais6fUzhw==
X-Received: by 2002:a6b:5f17:0:b0:6bb:e3d9:8abd with SMTP id
 t23-20020a6b5f17000000b006bbe3d98abdmr6786095iob.51.1666208776072; 
 Wed, 19 Oct 2022 12:46:16 -0700 (PDT)
Received: from james-x399.localdomain (71-218-240-5.hlrn.qwest.net.
 [71.218.240.5]) by smtp.gmail.com with ESMTPSA id
 g7-20020a02a087000000b00363753f4730sm2423729jah.91.2022.10.19.12.46.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Oct 2022 12:46:15 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 19 Oct 2022 13:46:13 -0600
Message-Id: <20221019194613.145290-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=yfqdZcQ4CSNTuzNP1fXHblo+fLKG+mLBTqBU68dRo1Y=;
 b=Gtdctwomsx2VNDJ5ZVxyimgnZC0l5/RfyX/QqiTb/SRyriFXCcvPSjgiK33p5fkXoQ
 Kz5FyHksm81pOyllVx/sBDZPrtYF9gNIzwDYNgi8GbbWF3YgkBfPORxX6p4dd79UObDX
 YQW8iZfvPZtgz2xeyDVpbp10NLCFkCjvkmwrqpTEHQQp8vL/r1R8FS2ATkmtQ++5lLXW
 uZPzaFnjETMKCGuoijEoiIBCCKLKDr3O+E0Wl49KowVdsjTAblHo+FvZii1zCnwNyKt6
 JDDtVWNHKlLzEiM75uYkiKdU2UkfQx9ufObY3gc8wKw8KAw/qtA16cA2GXS7pygucUmI
 Pbyg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=Gtdctwom
Subject: [Buildroot] [PATCH 1/1] package/python-setuptools: bump to version
 65.5.0
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
 package/python-setuptools/python-setuptools.hash | 4 ++--
 package/python-setuptools/python-setuptools.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-setuptools/python-setuptools.hash b/package/python-setuptools/python-setuptools.hash
index 3f68084068..2592fc201c 100644
--- a/package/python-setuptools/python-setuptools.hash
+++ b/package/python-setuptools/python-setuptools.hash
@@ -1,4 +1,4 @@
 # From https://pypi.org/pypi/setuptools/json
-md5  66c6b8819c5306c12c38d7fad41b7f99  setuptools-65.3.0.tar.gz
-sha256  7732871f4f7fa58fb6bdcaeadb0161b2bd046c85905dbaa066bdcbcc81953b57  setuptools-65.3.0.tar.gz
+md5  9018a18990e7c16159ec3972affba76c  setuptools-65.5.0.tar.gz
+sha256  512e5536220e38146176efb833d4a62aa726b7bbff82cfbc8ba9eaa3996e0b17  setuptools-65.5.0.tar.gz
 sha256  db3f0246b1f9278f15845b99fec478b8b506eb76487993722f8c6e254285faf8  LICENSE
diff --git a/package/python-setuptools/python-setuptools.mk b/package/python-setuptools/python-setuptools.mk
index b7483c6347..9dc0a6a38b 100644
--- a/package/python-setuptools/python-setuptools.mk
+++ b/package/python-setuptools/python-setuptools.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_SETUPTOOLS_VERSION = 65.3.0
+PYTHON_SETUPTOOLS_VERSION = 65.5.0
 PYTHON_SETUPTOOLS_SOURCE = setuptools-$(PYTHON_SETUPTOOLS_VERSION).tar.gz
-PYTHON_SETUPTOOLS_SITE = https://files.pythonhosted.org/packages/cc/83/7ea9d9b3a6ff3225aca2fce5e4df373bee7e0a74c539711a4fbfda53374f
+PYTHON_SETUPTOOLS_SITE = https://files.pythonhosted.org/packages/c5/41/247814d8b7a044717164c74080725a6c8f3d2b5fc82b34bd825b617df663
 PYTHON_SETUPTOOLS_LICENSE = MIT
 PYTHON_SETUPTOOLS_LICENSE_FILES = LICENSE
 PYTHON_SETUPTOOLS_CPE_ID_VENDOR = python
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
