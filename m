Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45ABAD1358A
	for <buildroot@archiver.kernel.org>; Sun, 27 Oct 2024 22:52:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0AB12605C4;
	Sun, 27 Oct 2024 22:52:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1foVTeg0V5Pv; Sun, 27 Oct 2024 22:51:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 123FA605C6
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 123FA605C6;
	Sun, 27 Oct 2024 22:51:59 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 6D291971
 for <buildroot@buildroot.org>; Sun, 27 Oct 2024 22:51:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4DA4F4017E
 for <buildroot@buildroot.org>; Sun, 27 Oct 2024 22:51:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0migkFR5SUi4 for <buildroot@buildroot.org>;
 Sun, 27 Oct 2024 22:51:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::130; helo=mail-il1-x130.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 2C126401C2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2C126401C2
Received: from mail-il1-x130.google.com (mail-il1-x130.google.com
 [IPv6:2607:f8b0:4864:20::130])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2C126401C2
 for <buildroot@buildroot.org>; Sun, 27 Oct 2024 22:51:56 +0000 (UTC)
Received: by mail-il1-x130.google.com with SMTP id
 e9e14a558f8ab-3a3b0247d67so13226195ab.3
 for <buildroot@buildroot.org>; Sun, 27 Oct 2024 15:51:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730069515; x=1730674315;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=7bP5cC+Q3485rXCaFzvNkOz4xwO9Po+OYtysrykOaF0=;
 b=jCcTYFXqDT/8EPEeiwxihHWCBw8HULFrquB4GtJRxy2nAD9InSPaZTfa2VYLKaPZGE
 HO3SxRIXTKd0blpKZikXI7Ko24iBG1vcWX5lj9Ia4vs2ZFUdEw2nsBlcanDO1BArX2IX
 Nn/pyu/SuL7fSH9A0xWgh5m/SkkLFw7HjUEx0063D/fICAgm+Cw73fKt6uiGGup8HhJj
 3T1IlDRhV97GOjyDGKAMd8qNyvrYeiYBjzaXmyWY8QgHY7p5dHiA1QSpE1BXKXouIhxJ
 nUe44OcqhFsU6XZVI3aSwP+CF1CfPBFGY4h5UFeLZPnP/SEhy7u3UcukrKODPQhrWTzq
 0GIw==
X-Gm-Message-State: AOJu0YxoyO0XX7uUyULg8qDSlcWbWIlY9Mv8bjvGZqCQJ1W23lMJ6kCQ
 RqwYy83Nc2CQ5OMUW4PeMa+SAQIR7B+TJ8HqLD+XH9g9cPbTmpBSN/l81Q==
X-Google-Smtp-Source: AGHT+IGc831KEnx0y6qkJLnNTmFHJE5CImCvo3uSS4rSr98dvMq8oP6qpxVAoXTPEDlYBGeonP8NXA==
X-Received: by 2002:a05:6e02:1545:b0:3a3:b497:f951 with SMTP id
 e9e14a558f8ab-3a4ed351c49mr47529135ab.23.1730069514818; 
 Sun, 27 Oct 2024 15:51:54 -0700 (PDT)
Received: from james-x399.localdomain (97-118-131-57.hlrn.qwest.net.
 [97.118.131.57]) by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-3a4e6df57d2sm13416135ab.37.2024.10.27.15.51.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 27 Oct 2024 15:51:54 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 27 Oct 2024 16:51:52 -0600
Message-Id: <20241027225152.3867361-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1730069515; x=1730674315; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=7bP5cC+Q3485rXCaFzvNkOz4xwO9Po+OYtysrykOaF0=;
 b=G3F7oi4dyLZLV8zWeTfARtHWfgpNEmWXA6UV5ovp3soxuZvyggoy7eCF+47zRT6KPG
 1JrWmjUxFS3XszXYxA2vSt1L10v9Opoo3n+OZT3k1deGEpsIf9XYnI2J+5EVNPh3sAul
 ZTz71SnLvNIeIgZSattTcnMDp7LKhtsuWbAF8Jj6A7TLEjpMImL5M2MeLOqh66RcCK1C
 8Jw81Wu62QM/oScr6RtBAw9qW/rvO7/Be+NAGzDiwvqT8kxaTkD56DflZ8cZt629o7qa
 fAU3BBuYoj3QmiyAH2IhBYAWRGtXS85NZGldQQt0MjkcGqmutyqf7M0yFC6XEaNtmt9w
 23yA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=G3F7oi4d
Subject: [Buildroot] [PATCH 1/1] package/python-falcon: bump to version 4.0.1
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
 Grzegorz Blach <grzegorz@blach.pl>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-falcon/python-falcon.hash | 4 ++--
 package/python-falcon/python-falcon.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-falcon/python-falcon.hash b/package/python-falcon/python-falcon.hash
index 2d54d27837..ee9a063fe8 100644
--- a/package/python-falcon/python-falcon.hash
+++ b/package/python-falcon/python-falcon.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/falcon/json
-md5  22a5c32f3d9dd96d498febe8e16ddffe  falcon-3.1.3.tar.gz
-sha256  23335dbccd44f29e85ec55f2f35d5a0bc12bd7a509f641ab81f5c64b65626263  falcon-3.1.3.tar.gz
+md5  52f6ca66eb192890b703e99699d9f8e7  falcon-4.0.1.tar.gz
+sha256  fc0d2dd661dea0a61e149d81960a9cbd5b7bd0857749c8aa41fbd69c3a054755  falcon-4.0.1.tar.gz
 # Locally computed sha256 checksums
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/python-falcon/python-falcon.mk b/package/python-falcon/python-falcon.mk
index 6c96bf16eb..e4f16ed631 100644
--- a/package/python-falcon/python-falcon.mk
+++ b/package/python-falcon/python-falcon.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_FALCON_VERSION = 3.1.3
+PYTHON_FALCON_VERSION = 4.0.1
 PYTHON_FALCON_SOURCE = falcon-$(PYTHON_FALCON_VERSION).tar.gz
-PYTHON_FALCON_SITE = https://files.pythonhosted.org/packages/3b/30/a7bc770025b6a7a36d0508e3d735dca239df7c27b862856e54d661f24632
+PYTHON_FALCON_SITE = https://files.pythonhosted.org/packages/29/11/66692243aff20eec2269cbc553af1d30c029a6caebd3bd8bf301ba8b2aad
 PYTHON_FALCON_SETUP_TYPE = setuptools
 PYTHON_FALCON_LICENSE = Apache-2.0
 PYTHON_FALCON_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
