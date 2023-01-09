Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F7B8C54EBD
	for <buildroot@archiver.kernel.org>; Mon,  9 Jan 2023 04:43:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C24054020C;
	Mon,  9 Jan 2023 04:43:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C24054020C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0sHZBs2Q-iiS; Mon,  9 Jan 2023 04:43:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id BDD28400EC;
	Mon,  9 Jan 2023 04:43:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BDD28400EC
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 57FCD1BF357
 for <buildroot@lists.busybox.net>; Mon,  9 Jan 2023 04:43:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2F6A260A9D
 for <buildroot@lists.busybox.net>; Mon,  9 Jan 2023 04:43:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2F6A260A9D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pzU8okSjzf0R for <buildroot@lists.busybox.net>;
 Mon,  9 Jan 2023 04:43:05 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 460D660773
Received: from mail-io1-xd35.google.com (mail-io1-xd35.google.com
 [IPv6:2607:f8b0:4864:20::d35])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 460D660773
 for <buildroot@buildroot.org>; Mon,  9 Jan 2023 04:43:05 +0000 (UTC)
Received: by mail-io1-xd35.google.com with SMTP id d123so4040705iof.6
 for <buildroot@buildroot.org>; Sun, 08 Jan 2023 20:43:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=gDLsJyg2Nv7by9zunUboAepZWY0RG30i7PJYzkaCyZU=;
 b=qSu0kRYd2gNAQv+6Fg6qSixNv5KZ/IW7e9VIBMCEE3/73gkts6YAc9pDKZscQk07oU
 Am10smcGWVQFrnGbEQK6BOxS+PTLPDGYCHlcwOPWF5UORrmVTxyAIAVsEexDxjHV/GiP
 jab5V8BZxI0AGPJHA64FSVvl21u7a/32TgK+nHIbC/2hkaeKE0h3FDQLGWMlC1gimLBu
 CdwwT7UbEPxZPLigqXcil//17JlmiJ6Hjxkw1S9XeaGddfzqKAWg3zTmGFTJPIZTaiE1
 Mhu9JgwP3+Y/5nceKKL4uCMMVGdlBrYC0azUu8EVSc1PLHE7WvXb0dXOLwKIo1KXllEj
 HRnA==
X-Gm-Message-State: AFqh2krED7R76dQ0Uf9vQhBJHrZlgxW6n3ZuT6HmL11mS/BrdRHePYEq
 JZByPSNBukiQK+KVg8jajGGEhL0YrB1ZdMuL
X-Google-Smtp-Source: AMrXdXsrPTtaYHK36fHWA14jKShzwJDByxne+WXpRKSlWrHZn32r4LJvj2gRJA8b7PJfhNjxs2ATww==
X-Received: by 2002:a6b:e819:0:b0:6e0:2251:853 with SMTP id
 f25-20020a6be819000000b006e022510853mr52443241ioh.10.1673239384222; 
 Sun, 08 Jan 2023 20:43:04 -0800 (PST)
Received: from james-x399.localdomain (71-33-132-231.hlrn.qwest.net.
 [71.33.132.231]) by smtp.gmail.com with ESMTPSA id
 o9-20020a6b5a09000000b006c0cb1e1ea8sm2762964iob.12.2023.01.08.20.43.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Jan 2023 20:43:03 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  8 Jan 2023 21:43:01 -0700
Message-Id: <20230109044301.2418184-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=gDLsJyg2Nv7by9zunUboAepZWY0RG30i7PJYzkaCyZU=;
 b=pU5PB4h+HYOQCFD//AdCWWt1ba7VM/kwd/LSFix7EkC4fEcwj4Bdrv/KN99Mcdf6rc
 5+NOMNHZICOW7miRwnJ1Lg8F6+DjORQEG5Vk37ct2Ezo0sLj27Aud/PwEWdlHLH0NjKO
 t6ngfAl7gupQAO3Yk16alw5YyjBb+Xjm3R5JLR4q9+1pKeetYPnpmEJZoZB0aZk8U2DJ
 0b25NW56+GwI78OQfGeuvt59aqRDOag9DXbvrXvrNqR/BMGf5NA1VEskuQqcWmDJEGNC
 0oyfpZiPu3N91utN5E0lV365CJDcd2ZlfOszOiTE0ElqwiBhT70o5Z0Tm+SQnJFr+XMI
 KXBg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=pU5PB4h+
Subject: [Buildroot] [PATCH 1/1] package/python-networkx: bump to version 3.0
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

Drop no longer required decorator dependency.

License hash changed due to year update:
https://github.com/networkx/networkx/commit/49f20fe11d2a804a83d538759e06511eb90ad5a3

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-networkx/Config.in            | 1 -
 package/python-networkx/python-networkx.hash | 6 +++---
 package/python-networkx/python-networkx.mk   | 5 ++---
 3 files changed, 5 insertions(+), 7 deletions(-)

diff --git a/package/python-networkx/Config.in b/package/python-networkx/Config.in
index 0f3e86f497..e2fc6ae478 100644
--- a/package/python-networkx/Config.in
+++ b/package/python-networkx/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_PYTHON_NETWORKX
 	bool "python-networkx"
-	select BR2_PACKAGE_PYTHON_DECORATOR # runtime
 	help
 	  A Python package for the creation, manipulation,
 	  and study of the structure, dynamics, and
diff --git a/package/python-networkx/python-networkx.hash b/package/python-networkx/python-networkx.hash
index d166f0b8d8..96ef9777da 100644
--- a/package/python-networkx/python-networkx.hash
+++ b/package/python-networkx/python-networkx.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/networkx/json
-md5  22139ab5a47818fa00cbaa91eb126381  networkx-2.8.8.tar.gz
-sha256  230d388117af870fce5647a3c52401fcf753e94720e6ea6b4197a5355648885e  networkx-2.8.8.tar.gz
+md5  1bfbb5cd184b486feae8345f541a5e50  networkx-3.0.tar.gz
+sha256  9a9992345353618ae98339c2b63d8201c381c2944f38a2ab49cb45a4c667e412  networkx-3.0.tar.gz
 # Locally computed sha256 checksums
-sha256  aae9f809fb1a1592ed72e9f52df10cfad8fe226b8d4d28385f90dd4341ce7119  LICENSE.txt
+sha256  50b5a27cb43f7a20cede7aa7b9ab2033552e0412c9a1fde51d38885c1417e95f  LICENSE.txt
diff --git a/package/python-networkx/python-networkx.mk b/package/python-networkx/python-networkx.mk
index f097671d66..d369df1a04 100644
--- a/package/python-networkx/python-networkx.mk
+++ b/package/python-networkx/python-networkx.mk
@@ -4,15 +4,14 @@
 #
 ################################################################################
 
-PYTHON_NETWORKX_VERSION = 2.8.8
+PYTHON_NETWORKX_VERSION = 3.0
 PYTHON_NETWORKX_SOURCE = networkx-$(PYTHON_NETWORKX_VERSION).tar.gz
-PYTHON_NETWORKX_SITE = https://files.pythonhosted.org/packages/cd/16/c44e8550012735b8f21b3df7f39e8ba5a987fb764ac017ad5f3589735889
+PYTHON_NETWORKX_SITE = https://files.pythonhosted.org/packages/99/f9/d45c9ecf50a6b67a200e0bbd324201b5cd777dfc0e6c8f6d1620ce5a7ada
 PYTHON_NETWORKX_LICENSE = BSD-3-Clause
 PYTHON_NETWORKX_LICENSE_FILES = LICENSE.txt
 PYTHON_NETWORKX_CPE_ID_VENDOR = python
 PYTHON_NETWORKX_CPE_ID_PRODUCT = networkx
 PYTHON_NETWORKX_SETUP_TYPE = setuptools
-HOST_PYTHON_NETWORKX_DEPENDENCIES = host-python-decorator
 
 $(eval $(python-package))
 $(eval $(host-python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
