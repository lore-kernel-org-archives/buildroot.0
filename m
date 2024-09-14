Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F10A8FC6176
	for <buildroot@archiver.kernel.org>; Sat, 14 Sep 2024 22:19:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A373C404D9;
	Sat, 14 Sep 2024 22:19:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OhqB2oQ1UV8K; Sat, 14 Sep 2024 22:19:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5E984405F2
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5E984405F2;
	Sat, 14 Sep 2024 22:19:25 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 418F01BF3DB
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 22:19:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2D35B40130
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 22:19:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kBGbKttKLES8 for <buildroot@lists.busybox.net>;
 Sat, 14 Sep 2024 22:19:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d2a; helo=mail-io1-xd2a.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 0B7D74054B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0B7D74054B
Received: from mail-io1-xd2a.google.com (mail-io1-xd2a.google.com
 [IPv6:2607:f8b0:4864:20::d2a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0B7D74054B
 for <buildroot@buildroot.org>; Sat, 14 Sep 2024 22:19:21 +0000 (UTC)
Received: by mail-io1-xd2a.google.com with SMTP id
 ca18e2360f4ac-82cdadeeb2eso112219039f.2
 for <buildroot@buildroot.org>; Sat, 14 Sep 2024 15:19:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726352361; x=1726957161;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=yzU+bwVUM+Qfo7FE2jisrG8kt+29QO0UTAQk708/hVo=;
 b=t238NtVWlC2gj0P9KkjDHftz8vVTI/Kb0OR+TYJbega4vuBdVM/I9tLzIC+9rOxHAf
 yqb9OYZmICSQ6p5we9OFC1QjLz6KlQY2TJcmyZtk5DLu3qcw4MwxS5zg1F2EMAdN73+Q
 wtJIboepL9FhhiEHuhPR0xmwu6atA0P1yaPEDdJixRhcHURHmYPiXPHgHj9pgc3hS1Y+
 RcnxiYQaN30dXNb9oeXN9+N9RJHyNZQaCDP5hP9wpHMoLBG4iFTDNupH2ty5/O93xZVZ
 /DGh67O67YzlmMLF5mJ/S2i1aR0Gz4XfEENn06m47s+5ed9Sq4e+/0yq4UceGjL7zA+2
 6VAQ==
X-Gm-Message-State: AOJu0YxUiw/Zmwmt0O1XfAppLU8y1oxvNfnz2Ojt3+aDh7DjpUhB+00Z
 T8h/XpgDIO5KRZeqkGiEsKrNXiziOpxvXqwOdOc82x78P7mvt7vSw/f9QA==
X-Google-Smtp-Source: AGHT+IGHLACTOyIJXpFBuHYKno5ow5/mdpGpG5q3MHdDFf9ALElyZDT0rAZWE9isfHdc0IDJnUThBA==
X-Received: by 2002:a05:6e02:184a:b0:3a0:436a:5f99 with SMTP id
 e9e14a558f8ab-3a08496173dmr110862145ab.21.1726352360654; 
 Sat, 14 Sep 2024 15:19:20 -0700 (PDT)
Received: from james-x399.localdomain (71-218-252-223.hlrn.qwest.net.
 [71.218.252.223]) by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-3a092e10b83sm6642475ab.31.2024.09.14.15.19.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 14 Sep 2024 15:19:20 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 14 Sep 2024 16:19:18 -0600
Message-Id: <20240914221918.1347292-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726352361; x=1726957161; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=yzU+bwVUM+Qfo7FE2jisrG8kt+29QO0UTAQk708/hVo=;
 b=Twci0ty/05Y+cZXC/+UtUJfvdt5FaB3uaEvM1suxs6OCF0y5YzQEN3jHfVVer83Czs
 4/0HY2x/JiS7RmE2GxiGJx+/H5e1wQYeKMi3+zR3Smb38j1FfuCP9os48WLne4f5TJp3
 Y69e8r06lTP8Snb/sxWyyB7O3ifdatvdy0AH06Rs8d7QdpvR/6DiTHb4EDV3RdRahH6s
 s3N4GHbI6SNAXuv72seLW+SfHYKgzSWdFWldXhdQ1cDIhxEDc13uBeox+RHLDvkaKvlU
 sVH84D10tvOCIRkdDp9IcjX4mdMIYpttqokM3g0NVggJLRX3FX6SLupgS/LBZ7lzbi/3
 EIhg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Twci0ty/
Subject: [Buildroot] [PATCH 1/1] package/python-bitstring: bump to version
 4.2.3
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
 package/python-bitstring/python-bitstring.hash | 4 ++--
 package/python-bitstring/python-bitstring.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-bitstring/python-bitstring.hash b/package/python-bitstring/python-bitstring.hash
index 1889983f47..e1b66c76b0 100644
--- a/package/python-bitstring/python-bitstring.hash
+++ b/package/python-bitstring/python-bitstring.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/bitstring/json
-md5  3909415d89586edabd577b62b0d0c1be  bitstring-4.1.4.tar.gz
-sha256  94f3f1c45383ebe8fd4a359424ffeb75c2f290760ae8fcac421b44f89ac85213  bitstring-4.1.4.tar.gz
+md5  5edecacd8fa0356601f7035977d0749e  bitstring-4.2.3.tar.gz
+sha256  e0c447af3fda0d114f77b88c2d199f02f97ee7e957e6d719f40f41cf15fbb897  bitstring-4.2.3.tar.gz
 # Locally computed sha256 checksums
 sha256  3705eed5a923f35d9bfaca1f10e9136cc84d6e576570aec661bda69991f129ea  LICENSE
diff --git a/package/python-bitstring/python-bitstring.mk b/package/python-bitstring/python-bitstring.mk
index 983491303d..fcb40365d4 100644
--- a/package/python-bitstring/python-bitstring.mk
+++ b/package/python-bitstring/python-bitstring.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_BITSTRING_VERSION = 4.1.4
+PYTHON_BITSTRING_VERSION = 4.2.3
 PYTHON_BITSTRING_SOURCE = bitstring-$(PYTHON_BITSTRING_VERSION).tar.gz
-PYTHON_BITSTRING_SITE = https://files.pythonhosted.org/packages/7f/07/0fd502a29127b968bada3d1824a8af997546d2b9ff73f00e800b3d9888cb
+PYTHON_BITSTRING_SITE = https://files.pythonhosted.org/packages/d8/d0/d6f57409bb50f54fe2894ec5a50b5c04cb41aa814c3bdb8a7eeb4a0f7697
 PYTHON_BITSTRING_SETUP_TYPE = setuptools
 PYTHON_BITSTRING_LICENSE = MIT
 PYTHON_BITSTRING_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
