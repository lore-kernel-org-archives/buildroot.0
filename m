Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A4A5C4706F
	for <buildroot@archiver.kernel.org>; Thu,  4 Jan 2024 03:33:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6363941A4D;
	Thu,  4 Jan 2024 03:33:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6363941A4D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sXEI0t6QNTfM; Thu,  4 Jan 2024 03:33:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3A29F419FB;
	Thu,  4 Jan 2024 03:33:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3A29F419FB
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id AA5551BF37C
 for <buildroot@lists.busybox.net>; Thu,  4 Jan 2024 03:32:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9159A60BD8
 for <buildroot@lists.busybox.net>; Thu,  4 Jan 2024 03:32:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9159A60BD8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id y01rtEEx1q0B for <buildroot@lists.busybox.net>;
 Thu,  4 Jan 2024 03:32:55 +0000 (UTC)
Received: from mail-io1-xd35.google.com (mail-io1-xd35.google.com
 [IPv6:2607:f8b0:4864:20::d35])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C217860B20
 for <buildroot@buildroot.org>; Thu,  4 Jan 2024 03:32:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C217860B20
Received: by mail-io1-xd35.google.com with SMTP id
 ca18e2360f4ac-7b7fdde8b98so3004439f.1
 for <buildroot@buildroot.org>; Wed, 03 Jan 2024 19:32:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704339174; x=1704943974;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gcQSEl6otMOumwpHFugKkblX3AduRtzLG4/EEg1oAO8=;
 b=Hi6QSwIiBq45zEI8tEQJaWFk9E4ZuuzPNAD3yUG7w06SPvvPZKOAqLpTG6dhNH/KbZ
 Aibe0vKK95hqymt67A9Zlcg8IocoPzcMCXXsLCjYRF2gJl+8lzDp3Af2fsdQri/8qB8h
 UYMho+lyHJ/geXOVd5hWZ628avcW7ZsnLX0b3+nLZInlx6CISBGXUpAlt/C7CAl0Cqsl
 vAPtvWzNHLrHRNBb3F2GIbRZzXAoLBCn+/6NuAgBLpQw3eFN6c72gmhSk3Biox0n6DOR
 PuKvud4G0nTT88gtrV7HNgQwrO8dKy1Up3QUV8DG7VywHx8J70LQcacum1Imrxg+z5BZ
 vEtQ==
X-Gm-Message-State: AOJu0YxpDRZv1jzuzBaBhrHMLge/sVs6xweWOMFAoOBcoGYVqcoSN/bv
 xX9YtfLUKl5ocvBJTKzoYPc1PfL0BEFSaA==
X-Google-Smtp-Source: AGHT+IGFY7Me/KSi69H2vQE6H3jTiw7/KdhXyFy5jCaey3lc/cfZ8jRkGW1O9fC8PIMQPYcW2Z3wgQ==
X-Received: by 2002:a6b:730f:0:b0:7bb:4a79:3d77 with SMTP id
 e15-20020a6b730f000000b007bb4a793d77mr38389ioh.24.1704339174337; 
 Wed, 03 Jan 2024 19:32:54 -0800 (PST)
Received: from james-x399.localdomain (71-218-103-119.hlrn.qwest.net.
 [71.218.103.119]) by smtp.gmail.com with ESMTPSA id
 ck20-20020a0566383f1400b0046dc3a36544sm1833664jab.171.2024.01.03.19.32.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Jan 2024 19:32:53 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  3 Jan 2024 20:32:49 -0700
Message-Id: <20240104033249.3256088-2-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240104033249.3256088-1-james.hilliard1@gmail.com>
References: <20240104033249.3256088-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704339174; x=1704943974; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gcQSEl6otMOumwpHFugKkblX3AduRtzLG4/EEg1oAO8=;
 b=PKhN60OL6bc0SOTmF7kS8uvE7HLsS0EzrbDmy7QA/Ch7qUXaPgq0FctieivQr1IDfL
 fOzRCH+k81puSAv016ogISaFGI47KAo5VLO2RavqNyrLL9ZbDmEDpoGtYQDvq3izTKKE
 hDjOFRCSOY6e/hUkRyuqIsJu5r2fkOjuznNBVNzy2sA5hAobgBbox3/RYG+0+wuxbSG8
 Ut7grZQoHm6wR12Fhri53+9JsDepnrC7czkYEmg67R664pMrUE8w7MIYh5L9qHGlsbXG
 avJRiIt+boxAcbrmbqck9MjmXTQ7nu/eAeDVcM0AIQ99a+os5vW7sxvcBj3QbD1eeoEO
 769w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=PKhN60OL
Subject: [Buildroot] [PATCH 2/2] package/python-aiomonitor: bump to version
 0.7.0
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
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add new runtime dependencies:
 - python-attrs
 - python-aiohttp
 - python-click
 - python-janus
 - python-trafaret
 - python-typing-extensions
 - python-prompt-toolkit

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-aiomonitor/Config.in              | 10 +++++++++-
 package/python-aiomonitor/python-aiomonitor.hash |  4 ++--
 package/python-aiomonitor/python-aiomonitor.mk   |  4 ++--
 3 files changed, 13 insertions(+), 5 deletions(-)

diff --git a/package/python-aiomonitor/Config.in b/package/python-aiomonitor/Config.in
index 435900ae32..9f3787f9b3 100644
--- a/package/python-aiomonitor/Config.in
+++ b/package/python-aiomonitor/Config.in
@@ -1,7 +1,15 @@
 config BR2_PACKAGE_PYTHON_AIOMONITOR
 	bool "python-aiomonitor"
-	select BR2_PACKAGE_PYTHON_TERMINALTABLES # runtime
 	select BR2_PACKAGE_PYTHON_AIOCONSOLE # runtime
+	select BR2_PACKAGE_PYTHON_AIOHTTP # runtime
+	select BR2_PACKAGE_PYTHON_ATTRS # runtime
+	select BR2_PACKAGE_PYTHON_CLICK # runtime
+	select BR2_PACKAGE_PYTHON_JANUS # runtime
+	select BR2_PACKAGE_PYTHON_JINJA2 # runtime
+	select BR2_PACKAGE_PYTHON_PROMPT_TOOLKIT # runtime
+	select BR2_PACKAGE_PYTHON_TERMINALTABLES # runtime
+	select BR2_PACKAGE_PYTHON_TRAFARET # runtime
+	select BR2_PACKAGE_PYTHON_TYPING_EXTENSIONS # runtime
 	help
 	  aiomonitor adds monitor and python REPL capabilities for
 	  asyncio application.
diff --git a/package/python-aiomonitor/python-aiomonitor.hash b/package/python-aiomonitor/python-aiomonitor.hash
index b67d68e478..f1c0e37667 100644
--- a/package/python-aiomonitor/python-aiomonitor.hash
+++ b/package/python-aiomonitor/python-aiomonitor.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/aiomonitor/json
-md5  0f786c8278a68e7df8b24317e7d33271  aiomonitor-0.6.0.tar.gz
-sha256  31d30d1e9c0a23926edba2a2242b8572c6e8639af9aae2692dee863064d27e48  aiomonitor-0.6.0.tar.gz
+md5  75fc8f84c0ff385931d76c46265cfc0d  aiomonitor-0.7.0.tar.gz
+sha256  109b9ad309a44c0c5db1219d106f4062615151ad3f0e288a0c104fbb004d0398  aiomonitor-0.7.0.tar.gz
 # Locally computed sha256 checksums
 sha256  98397c300949e0cc1ddc68b0e48e67b10f2d0a4ffada4903d891a1315fe04156  LICENSE
diff --git a/package/python-aiomonitor/python-aiomonitor.mk b/package/python-aiomonitor/python-aiomonitor.mk
index 1a3b999b90..8eaddcbfa6 100644
--- a/package/python-aiomonitor/python-aiomonitor.mk
+++ b/package/python-aiomonitor/python-aiomonitor.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_AIOMONITOR_VERSION = 0.6.0
+PYTHON_AIOMONITOR_VERSION = 0.7.0
 PYTHON_AIOMONITOR_SOURCE = aiomonitor-$(PYTHON_AIOMONITOR_VERSION).tar.gz
-PYTHON_AIOMONITOR_SITE = https://files.pythonhosted.org/packages/13/ab/36fbaf36c1c7cb4d5a81b945faf69e95a48dd38cbc9b57915d41d9445f55
+PYTHON_AIOMONITOR_SITE = https://files.pythonhosted.org/packages/50/30/1d903b716489c2b5d0a92baccf172f972e97c2de94d4ea41c154287e9b60
 PYTHON_AIOMONITOR_SETUP_TYPE = setuptools
 PYTHON_AIOMONITOR_LICENSE = Apache-2.0
 PYTHON_AIOMONITOR_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
