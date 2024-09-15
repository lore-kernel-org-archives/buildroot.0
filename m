Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C83EC35FE5
	for <buildroot@archiver.kernel.org>; Sun, 15 Sep 2024 04:58:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D2E3B400EF;
	Sun, 15 Sep 2024 04:58:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TpekTERVAXiA; Sun, 15 Sep 2024 04:58:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 97F4540169
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 97F4540169;
	Sun, 15 Sep 2024 04:58:55 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3F19B1BF383
 for <buildroot@lists.busybox.net>; Sun, 15 Sep 2024 04:58:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3A5EE406BE
 for <buildroot@lists.busybox.net>; Sun, 15 Sep 2024 04:58:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7hHhWWNsNbbQ for <buildroot@lists.busybox.net>;
 Sun, 15 Sep 2024 04:58:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::132; helo=mail-il1-x132.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 0AB3C406B1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0AB3C406B1
Received: from mail-il1-x132.google.com (mail-il1-x132.google.com
 [IPv6:2607:f8b0:4864:20::132])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0AB3C406B1
 for <buildroot@buildroot.org>; Sun, 15 Sep 2024 04:58:52 +0000 (UTC)
Received: by mail-il1-x132.google.com with SMTP id
 e9e14a558f8ab-39f49600297so12701465ab.1
 for <buildroot@buildroot.org>; Sat, 14 Sep 2024 21:58:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726376332; x=1726981132;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Me+lZnXmVmE9vqRPNaHH4DcR2ckYmG5YFrRZEHEfCUo=;
 b=YdpN5QBIrbdlZ0cOm3y2peayn5zmt4Tu9+B1v7gxJ80NqWXnC8v/BWK8WgEbJAOdsK
 oo55wNxq4YjMQtsPyc9TdLTbyvlWXhBKv/lvX/TzEn3fJXP2MniU0SzT+UlUg0m+hhkv
 PvriOlVdrWnpcnXLOVy2jv17a3zbS3rNAInM02lS7Pn7YB/e2pINsJjgh9nQxkzkq0Fk
 aJq+pZ1XcWsLrgaEIeBWDGy9byFB7xoE3jIgXkbHiVRrwyIdhljxU6HXRl6xcZpitiAn
 G2LlwmMtHjytL78+09FFE5eVGe6j1dr5wqDViO7L3bzOkvnc7QCJyXAPdrIuB2Z0jsZS
 Pv6A==
X-Gm-Message-State: AOJu0Yz4R27G9tpEkE1UQLhwqeWJjA4WTcN0H0QHu2CNO8ftwxTFRGMi
 o5eVzohAQaDzKLDLkZIHaxubqjshfxYRD+YphkqD7MBEbDTrcZiUYorZDA==
X-Google-Smtp-Source: AGHT+IG/LNivSOHEL9PsCYFf5ufneJSHEwVv2/9cNYFul9QzfZAgkpQq4ydESQzM0So2bLFi4zsEzA==
X-Received: by 2002:a05:6e02:156a:b0:39f:5abe:ec17 with SMTP id
 e9e14a558f8ab-3a0848ae910mr107280525ab.3.1726376331765; 
 Sat, 14 Sep 2024 21:58:51 -0700 (PDT)
Received: from james-x399.localdomain (71-218-252-223.hlrn.qwest.net.
 [71.218.252.223]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4d37ed60f34sm745776173.173.2024.09.14.21.58.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 14 Sep 2024 21:58:51 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 14 Sep 2024 22:58:49 -0600
Message-Id: <20240915045849.1407040-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726376332; x=1726981132; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Me+lZnXmVmE9vqRPNaHH4DcR2ckYmG5YFrRZEHEfCUo=;
 b=HyTQv3X6astoeCTu6/WatMZyrsoQkpP6yGNcXT2k+JCi+hVS3+YaaXsIqXPDQ9tpZo
 bYo19ISMoUNtJisVtJrILp0I+Q62DlVlXeKckjx/CDjf5LZqMZBHywU8pNNXakBagVVH
 +kQ64gA3GwbCfclTqw31lwm0Tp1/gHDK+u4qUtdy4ieDnIAwQqgcWlFHqVfF9JNs2Mfe
 /yTTa0jYwUuGnWLnpYPXqXqBGJ7JRY2vx0l8EzWL4FNUvHsqZx41UYPRjPCgP0Oyfick
 HRZzRHikPrpeJPtb37giRiLy75l8BfWUzGPt7ToHdFgBVyVO9QfUA0FVIP/Agy45j2kK
 CA1Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=HyTQv3X6
Subject: [Buildroot] [PATCH 1/1] package/python-dtschema: bump to version
 2024.9
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
 package/python-dtschema/python-dtschema.hash | 4 ++--
 package/python-dtschema/python-dtschema.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-dtschema/python-dtschema.hash b/package/python-dtschema/python-dtschema.hash
index 3e1dd22133..ca5867cf16 100644
--- a/package/python-dtschema/python-dtschema.hash
+++ b/package/python-dtschema/python-dtschema.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/dtschema/json
-md5  cc4be8cfc01804cc31a123b56f68aeb1  dtschema-2023.11.tar.gz
-sha256  cf9a449ea743c0a955cf6034ef246668fa5ea177684977c61fef7604af5f273b  dtschema-2023.11.tar.gz
+md5  1bd2cb19c8d9da652e4d7c5be16c7d20  dtschema-2024.9.tar.gz
+sha256  1e5cc422736d5e4167f764478e50093f340bbede95b569ed66d60748dbc39ab2  dtschema-2024.9.tar.gz
 # Locally computed sha256 checksums
 sha256  ca0d66263406dc684fe9db60577b234f65ffdf620d7e041c708e969447b69111  LICENSE.txt
diff --git a/package/python-dtschema/python-dtschema.mk b/package/python-dtschema/python-dtschema.mk
index e1dd5009fd..c848b547c0 100644
--- a/package/python-dtschema/python-dtschema.mk
+++ b/package/python-dtschema/python-dtschema.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_DTSCHEMA_VERSION = 2023.11
+PYTHON_DTSCHEMA_VERSION = 2024.9
 PYTHON_DTSCHEMA_SOURCE = dtschema-$(PYTHON_DTSCHEMA_VERSION).tar.gz
-PYTHON_DTSCHEMA_SITE = https://files.pythonhosted.org/packages/5a/94/7890ef663fba1cca84cf0ab64c7f68685343c921ab883f0356cd9978b605
+PYTHON_DTSCHEMA_SITE = https://files.pythonhosted.org/packages/6e/ed/38406756269a83b341ceb5884874692f18eeae820b70a198e8f3699c11da
 PYTHON_DTSCHEMA_SETUP_TYPE = setuptools
 PYTHON_DTSCHEMA_LICENSE = BSD-2-Clause
 PYTHON_DTSCHEMA_LICENSE_FILES = LICENSE.txt
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
