Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C81A3C83F2D
	for <buildroot@archiver.kernel.org>; Tue, 15 Jul 2025 23:20:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 839CA40537;
	Tue, 15 Jul 2025 23:20:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BS8sQSimSMeV; Tue, 15 Jul 2025 23:20:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BBE4440542
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id BBE4440542;
	Tue, 15 Jul 2025 23:20:03 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id D0768DCA
 for <buildroot@buildroot.org>; Tue, 15 Jul 2025 23:20:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B758B401CA
 for <buildroot@buildroot.org>; Tue, 15 Jul 2025 23:20:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MRy0RxoYKK00 for <buildroot@buildroot.org>;
 Tue, 15 Jul 2025 23:20:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d2b; helo=mail-io1-xd2b.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org E11E440190
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E11E440190
Received: from mail-io1-xd2b.google.com (mail-io1-xd2b.google.com
 [IPv6:2607:f8b0:4864:20::d2b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E11E440190
 for <buildroot@buildroot.org>; Tue, 15 Jul 2025 23:20:00 +0000 (UTC)
Received: by mail-io1-xd2b.google.com with SMTP id
 ca18e2360f4ac-86d029e2bdeso14352439f.1
 for <buildroot@buildroot.org>; Tue, 15 Jul 2025 16:20:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752621600; x=1753226400;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=z6XjPS2X6w/+bc8bQMW99xA8eYEImVD3c3tOOfT52Yo=;
 b=ewfWHGAItvtnKRichu7038/74SiFu/VYMVb49eqs6f9o8NbmW/H1nIaF6CH4XFcBng
 pHuHx4PShPgNGp+SuRC7bn4N8GXzOUOp7t3XUjFixWUL8gbzUMgMZDbyyloqBDrMisEL
 i6GwWybyfDDG8u09L00hfl4XI2mjzaBrEcEewaZgsXpuQb3unYC5SwqpZvmWI4zBnXek
 3Vutsz/Y/BPIaYZChHfwbVC8ATtt649ESjsgGtgZDNQWMhDBh4mr5denis4Jy2efxmDH
 +YY6b9l7HuTdlZLIssGm2rZNVc28aF4PwKGEl+bBl3WS3eCi7HN7dF5oTpbRl92y78sN
 vNZg==
X-Gm-Message-State: AOJu0YztGE3uVGPif13ixv2e+pkQ68gRXYT92fNP4OGRy7K51EDuWcnd
 BhgUGYI7vKafQeYh9lMbIcNhZVhixZcGqkYUKIxdNnNYqqpB45hAgVvNkTNVk0SwzHg=
X-Gm-Gg: ASbGncvOjJss2htjLQ3Nys5c/eo7t1D0Duh47KMTE0mQzTTATX8CuHgxr5ytS8oEfMx
 qdMNn70QpXnn/i38paWP7iOdJW04tjnvXsvV5KUDSLiq35htdacn/Q5qDzyipwFm0zUlv6dQRIc
 PvG5tWhMQVvpXecIuZEHjITFE8g7T59LhuK6a3Nl9IydWGfAiitEe374NAqIhAf0Ve6l8Ps00bR
 vaizBv4znP1wPTWwVf7ARAvoygKpySxi6RkObdNg/D6WTpr6MgBLvyZMeySWSeLK46C6MVFJ7JB
 E8WUS2zpPB2wAekZ7nrnJQm2r+l/2CyZ1wFdW1mh/xUXnRLvfkLLJI3m4kKjkXiGHllY0EkkT9S
 fnkKY9/UrkMx9SsMHaS8ao4GJgGB/K50s11UHiuCXUKc31dD0ayOsB38+1ydRjxvGj2f3EKlWHu
 6QMUGSxqMqL/CuWP+x9Q==
X-Google-Smtp-Source: AGHT+IFDcsRvriSN7aKD7r5kUY4Ubk+IO7Umaeb8oAULrKj1yxwWiDpfA4QukSp4xbekfq9X6W9dBQ==
X-Received: by 2002:a92:ad05:0:b0:3dd:bb43:1fc0 with SMTP id
 e9e14a558f8ab-3e277cd98efmr42111875ab.11.1752621599570; 
 Tue, 15 Jul 2025 16:19:59 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (71-218-236-108.hlrn.qwest.net.
 [71.218.236.108]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-50556535f39sm2742788173.7.2025.07.15.16.19.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Jul 2025 16:19:59 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 15 Jul 2025 17:19:57 -0600
Message-Id: <20250715231957.833460-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1752621600; x=1753226400; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=z6XjPS2X6w/+bc8bQMW99xA8eYEImVD3c3tOOfT52Yo=;
 b=eJFu1deu4pnKVxo2lnLWNkqyVPGuYkqKrWu9CJKQux0wp+vhFgmCf+3GeNhBBHjYCS
 wn5fAyfSi6FhcRAeXuQrzJ8X8HcVNSAwq77RzED+Fpq3SWq7BWQvVX3h4AUmWhtZgG9i
 /rWa3IB8eycIviorfar5qpSnfcSoKVF6guTUbc1LldjRKFibQz1qB7XiohXyzYP/03Er
 MKAB7g/xg6/8aW05vddtUl5/xW2myFWXfSFD3uKIErbIx6g0ShZRoAm1VnjEwUe5b+1a
 VyFn50Im6nTR/TXdymshd2atAskLOBBrASrLvf0FI4GrUP+P5f6vmnRu2nC17OCVQQbS
 Jq2A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=eJFu1deu
Subject: [Buildroot] [PATCH 1/1] package/python-cython: bump to version 3.1.2
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
Cc: Joseph Kogut <joseph.kogut@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-cython/python-cython.hash | 4 ++--
 package/python-cython/python-cython.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-cython/python-cython.hash b/package/python-cython/python-cython.hash
index cd320eaa2a..25fa1d93ba 100644
--- a/package/python-cython/python-cython.hash
+++ b/package/python-cython/python-cython.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/cython/json
-md5  388b85b7c23f501320d19d991b169f5d  cython-3.0.11.tar.gz
-sha256  7146dd2af8682b4ca61331851e6aebce9fe5158e75300343f80c07ca80b1faff  cython-3.0.11.tar.gz
+md5  6fb2dc869f4d00b4a13e130ec1197bfd  cython-3.1.2.tar.gz
+sha256  6bbf7a953fa6762dfecdec015e3b054ba51c0121a45ad851fa130f63f5331381  cython-3.1.2.tar.gz
 # Locally computed sha256 checksums
 sha256  9568a2b155e66ac3e0ba1fd80b52b827b9460e6cf6f233125e7cbca8e206ddc3  LICENSE.txt
 sha256  e1eb1c49a8508e8173dac30157e4a6439a44ad8846194746c424fbc3fc2b95d7  COPYING.txt
diff --git a/package/python-cython/python-cython.mk b/package/python-cython/python-cython.mk
index 51086bedab..cffd613787 100644
--- a/package/python-cython/python-cython.mk
+++ b/package/python-cython/python-cython.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_CYTHON_VERSION = 3.0.11
+PYTHON_CYTHON_VERSION = 3.1.2
 PYTHON_CYTHON_SOURCE = cython-$(PYTHON_CYTHON_VERSION).tar.gz
-PYTHON_CYTHON_SITE = https://files.pythonhosted.org/packages/84/4d/b720d6000f4ca77f030bd70f12550820f0766b568e43f11af7f7ad9061aa
+PYTHON_CYTHON_SITE = https://files.pythonhosted.org/packages/18/40/7b17cd866158238db704965da1b5849af261dbad393ea3ac966f934b2d39
 PYTHON_CYTHON_SETUP_TYPE = setuptools
 PYTHON_CYTHON_LICENSE = Apache-2.0
 PYTHON_CYTHON_LICENSE_FILES = COPYING.txt LICENSE.txt
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
