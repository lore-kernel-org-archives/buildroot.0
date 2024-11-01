Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D74CE6F06F
	for <buildroot@archiver.kernel.org>; Fri,  1 Nov 2024 17:06:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 08F8C6061A;
	Fri,  1 Nov 2024 17:06:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RyBDyoZqa-UW; Fri,  1 Nov 2024 17:06:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0758C6063F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0758C6063F;
	Fri,  1 Nov 2024 17:06:37 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 68D79979
 for <buildroot@buildroot.org>; Fri,  1 Nov 2024 17:06:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5229E81DFF
 for <buildroot@buildroot.org>; Fri,  1 Nov 2024 17:06:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id upQ0zHN11wof for <buildroot@buildroot.org>;
 Fri,  1 Nov 2024 17:06:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2001:4860:4864:20::31; helo=mail-oa1-x31.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 5553581DFC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5553581DFC
Received: from mail-oa1-x31.google.com (mail-oa1-x31.google.com
 [IPv6:2001:4860:4864:20::31])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5553581DFC
 for <buildroot@buildroot.org>; Fri,  1 Nov 2024 17:06:34 +0000 (UTC)
Received: by mail-oa1-x31.google.com with SMTP id
 586e51a60fabf-28896d9d9deso1007287fac.2
 for <buildroot@buildroot.org>; Fri, 01 Nov 2024 10:06:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730480793; x=1731085593;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=7GwwrIP8X3SbMkaMGa88KGai3ZLL0pwirF5ohujrhWg=;
 b=haK7Rk2oLPMRvfR2m9r0cvgzq8cuZbv2YYRRvSOPofjqY75rLr0cOBaloMSl05CBYF
 0EG0wdYogARBU+gDfUw3AKu+RI05ERDCT24TlONjlbVUeQEUNBVNnhNwUFTGwxIAWIAB
 IGvn+DH4y+usGTlWsdckFoIQ55Dej0BOttk4uTO8S9kz+k7W0JBaodB/wyzvLsfCKzA4
 Rz2f7x5yPJwlf3nYevVdxVm65h4OwfOU8F4R3uGdz1fz291FEbYnGkOWhtn9+b34Sv7U
 VMCn2zrE36kl/myz9gnyctxCFz7a6ru6xk35YesiVwVthTu8ZH/FPgtspuXn0ZDE7Z4+
 EdiQ==
X-Gm-Message-State: AOJu0YxkuLjCq2o4LqY+5abAbJ3k46VfYnbGXo7VbZJYuSTohLSkextg
 /OUs4Kv3zrsz8vgd8Yc9SGCEInh8RXNyU6IIncLNrVb5VP7E0LW1NMN+iQ==
X-Google-Smtp-Source: AGHT+IExwNi2/K49qUB2zpo5LEFb1shHTCIOurAsRNHpR/XHjbHBNTNZv8lLJLiX9O97rjQOqfqNnQ==
X-Received: by 2002:a05:6870:4208:b0:277:ef62:e6a7 with SMTP id
 586e51a60fabf-29464944859mr11908715fac.37.1730480792876; 
 Fri, 01 Nov 2024 10:06:32 -0700 (PDT)
Received: from james-x399.localdomain (97-118-131-57.hlrn.qwest.net.
 [97.118.131.57]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4de049ba80asm786988173.156.2024.11.01.10.06.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Nov 2024 10:06:32 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  1 Nov 2024 11:06:31 -0600
Message-Id: <20241101170631.390786-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1730480793; x=1731085593; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=7GwwrIP8X3SbMkaMGa88KGai3ZLL0pwirF5ohujrhWg=;
 b=bl2fF8CZV+WW8y3NOdQwOs/gQU1ZNV+XaK/YM7J6fWMsbPRLyK4ihCgfg46Wi0/KSd
 PrA5foACXY+mGsIK27eH1ZnvH2BAYSnRtIuI1ykMd+03wUbvIPOtSGbZ3//qlhntAmnk
 r2hH8HEbYg1YNw9ljhgQH2lvo/uhcj+WyPJVSTISZ8PzxaxtnOFMOxgM0dnInQNvgedN
 YZtsKw5yxdk6kjNeOE41DhSgKkyLTKmxUT3LJeeg/2e30QGutVY/RoDOIOujxZjnpzBG
 Ijw3UUbidmwZEPURc3Z5qMVayhQQGyufZZMiKcS/dlGhLJCNCaIJtKV2oYozG7yi2wTf
 j11w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=bl2fF8CZ
Subject: [Buildroot] [PATCH 1/1] package/python-janus: bump to version 1.1.0
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Drop no longer required python-typing-extensions runtime dependency.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-janus/Config.in         | 1 -
 package/python-janus/python-janus.hash | 4 ++--
 package/python-janus/python-janus.mk   | 4 ++--
 3 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/package/python-janus/Config.in b/package/python-janus/Config.in
index 924c1fa97d..1b23653f76 100644
--- a/package/python-janus/Config.in
+++ b/package/python-janus/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_PYTHON_JANUS
 	bool "python-janus"
-	select BR2_PACKAGE_PYTHON_TYPING_EXTENSIONS # runtime
 	help
 	  Mixed sync-async queue to interoperate between asyncio
 	  tasks and classic threads.
diff --git a/package/python-janus/python-janus.hash b/package/python-janus/python-janus.hash
index 7f7ce35caa..9cdf8fdde7 100644
--- a/package/python-janus/python-janus.hash
+++ b/package/python-janus/python-janus.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/janus/json
-md5  2d8c0b884c14f18fc5223858eb16461e  janus-1.0.0.tar.gz
-sha256  df976f2cdcfb034b147a2d51edfc34ff6bfb12d4e2643d3ad0e10de058cb1612  janus-1.0.0.tar.gz
+md5  0e3053f8b41e447e3cabed4075ac9116  janus-1.1.0.tar.gz
+sha256  0634df8b2b31f8afda4311abcf7fea912686fef717d13769eeaa01ae08d2b84c  janus-1.1.0.tar.gz
 # Locally computed sha256 checksums
 sha256  8b177cccb6ddec12a9fc97bd49e7e2bbcd92464625624bd8bdbfad799ae606e9  LICENSE
diff --git a/package/python-janus/python-janus.mk b/package/python-janus/python-janus.mk
index 43df87870d..a6cbfc86db 100644
--- a/package/python-janus/python-janus.mk
+++ b/package/python-janus/python-janus.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_JANUS_VERSION = 1.0.0
+PYTHON_JANUS_VERSION = 1.1.0
 PYTHON_JANUS_SOURCE = janus-$(PYTHON_JANUS_VERSION).tar.gz
-PYTHON_JANUS_SITE = https://files.pythonhosted.org/packages/b8/a8/facab7275d7d3d2032f375843fe46fad1cfa604a108b5a238638d4615bdc
+PYTHON_JANUS_SITE = https://files.pythonhosted.org/packages/45/50/112a19f28a11b545c4c95de29c50a06fa9381a2432eaabbf9316bbd4e046
 PYTHON_JANUS_SETUP_TYPE = setuptools
 PYTHON_JANUS_LICENSE = Apache-2.0
 PYTHON_JANUS_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
