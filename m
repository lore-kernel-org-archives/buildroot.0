Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A83D5C83F22
	for <buildroot@archiver.kernel.org>; Wed, 16 Jul 2025 10:22:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 62BCF613AE;
	Wed, 16 Jul 2025 10:22:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PXjM1cls6m1w; Wed, 16 Jul 2025 10:22:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7870E60BB1
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7870E60BB1;
	Wed, 16 Jul 2025 10:22:28 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id BC23D11AA
 for <buildroot@buildroot.org>; Wed, 16 Jul 2025 10:22:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A28AA60BB1
 for <buildroot@buildroot.org>; Wed, 16 Jul 2025 10:22:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zppUlHNk-31D for <buildroot@buildroot.org>;
 Wed, 16 Jul 2025 10:22:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::429; helo=mail-wr1-x429.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 4745D60ACD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4745D60ACD
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4745D60ACD
 for <buildroot@buildroot.org>; Wed, 16 Jul 2025 10:22:23 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-3a54700a463so411287f8f.1
 for <buildroot@buildroot.org>; Wed, 16 Jul 2025 03:22:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752661342; x=1753266142;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=56P842/KawbvqyIHYSM5VRqAYekUhvB1Vn7wzcZA2Tg=;
 b=AXEbhAm1KFYfkfWrwpmJdTy6eaO7JdhVxkT1XoqH8ufFDPGkPMzeJsK6ojwwnWtc7E
 aWsGEWWl90H9o+mzPaeDke5yiUJQkhY9ZmRaJqpjqcB8tdzDRhHkWAnIqSENYg8vFnEj
 trxIh3ETCwd2VzojW35dtz4yQqKrgx6EZaD75H7aZNklLn+5edPwUYjBHpLSPPzUWwrd
 mq3Llc+5pCTThGX8LGig8TQ/r0Gp1nCdhPwIcgHiqLzd0Isk8iiRZva0x7ay7uQSHP3t
 VUKCS8Wv2YkzOCMm1zI6qaTIqtu/iwAgRluMZHXLIC6Uqg7T4CL2ywVS7GfUac1S/NJH
 8+fg==
X-Gm-Message-State: AOJu0Yw79AP0a/fKbO9y2JOYsq1m5+YpAcLPgoYGtCu4PTS6xUZy7Sl+
 4LyqYtMlQYe46HkHXBmxQVmqFXafnG8IxVEq0JtNV5rTBVDm6riJUYK7rF0nvpAGnRnBtrLqqGz
 jhUqu
X-Gm-Gg: ASbGncv7gXedfnHXJKxepdRjP1Al21/aHdHKwzDjXXkYJgjuag6Ci0JWtCfP2pAP+W7
 BsR5G9LYvajZ4mewF8yddUJn2EA5lzOuKGVroa6h3SyY3kxLbvERih+cSTwdB9aaHyBshI4KMP8
 vwY0eINIHMzXVii7rdh8+XHw9JE1RZCETm/l3YtWDBxcLMgzH+G5/8N5O+q6Xdcd0Aj82sUJRY8
 kxaeZHEMoQ4helXQIexOUr0vV1L1vnJmMhIBew3jAHhFf20FMj7VpauSmsDLUaAImJ9YF3Mbtja
 pMGw9qQCtIHY+hXmJtvQ3dG62YTWlJx7p56ioPJauEYM1gconQOMbuRhK0W8vFRGjl409Iq77il
 yroM/Zp8AhOssii2f4Zainm91CY3t9SHgs1uGNjDrNEEzv9BSzZwRuUZJO5s4ig07ktTq7Xnyqw
 0ZAQU4y8L3nGLqCQ==
X-Google-Smtp-Source: AGHT+IEHTZPY47FjD7FxNb9EAlUOGgpwjXHG3RhfKUDjIt83Fz2+xWvITObbe0bRZmqB/NkQekKhOQ==
X-Received: by 2002:a05:6000:658:b0:3a5:2915:ed68 with SMTP id
 ffacd0b85a97d-3b60dd7aa9bmr2074290f8f.28.1752661341738; 
 Wed, 16 Jul 2025 03:22:21 -0700 (PDT)
Received: from dragon.local.ess-mail.com
 (ip-94-140-185-241.reverse.destiny.be. [94.140.185.241])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b5e8bd18a2sm17303223f8f.20.2025.07.16.03.22.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Jul 2025 03:22:21 -0700 (PDT)
To: buildroot@buildroot.org
Date: Wed, 16 Jul 2025 12:21:59 +0200
Message-ID: <20250716102159.306474-1-titouan.christophe@mind.be>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1752661342; x=1753266142; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=56P842/KawbvqyIHYSM5VRqAYekUhvB1Vn7wzcZA2Tg=;
 b=a3MlsFUbqMDhN1Eel4ZfJy4mcS0Y4jY0WvG9Huali6IIy25DNYds4vdUSMkvh9577O
 A89VuwPdKiStsQ649p0Ci+Gu/ugouYtjznzKOu9qQabP0md3KfSXGCRQYI8wzZwARXms
 JacYVCBhymoty4oDIs40Vekq3SeeRjEaGD7f1x6atemIGTDthQGjBVKvjg/5lRjiR7hh
 uX3V70Xm4W72jI5Jx/LRLqTTBz6I0C6Eo3xLJHY3pWU3KlbIxoBdZ7Z5H8P/wRKBfiuF
 WAYmPodpFAUZ7erGOAX5IPcCJAyY838N9gJhKxB5kZ+ok7mGoSYaDgG12DyZakE3xSuP
 Oksw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=a3MlsFUb
Subject: [Buildroot] [PATCH] package/python-aiohttp: security bump to
 v3.12.14
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
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This fixes the following vulnerability:
- CVE-2025-53643:
    In aiohttp prior to version 3.12.14, the Python parser is vulnerable
    to a request smuggling vulnerability due to not parsing trailer
    sections of an HTTP request. If a pure Python version of aiohttp is
    installed (i.e. without the usual C extensions) or
    AIOHTTP_NO_EXTENSIONS is enabled, then an attacker may be able to
    execute a request smuggling attack to bypass certain firewalls or
    proxy protections. Version 3.12.14 contains a patch for this issue.
    https://www.cve.org/CVERecord?id=CVE-2025-53643

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 package/python-aiohttp/python-aiohttp.hash | 4 ++--
 package/python-aiohttp/python-aiohttp.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-aiohttp/python-aiohttp.hash b/package/python-aiohttp/python-aiohttp.hash
index ac12cafeea..0aa8dbd3bc 100644
--- a/package/python-aiohttp/python-aiohttp.hash
+++ b/package/python-aiohttp/python-aiohttp.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/aiohttp/json
-md5  7835f28e41adf6f09467533e8de0c199  aiohttp-3.11.14.tar.gz
-sha256  d6edc538c7480fa0a3b2bdd705f8010062d74700198da55d16498e1b49549b9c  aiohttp-3.11.14.tar.gz
+md5  4ed66dcec63108ae3a7c01d0415b4dd9  aiohttp-3.12.14.tar.gz
+sha256  6e06e120e34d93100de448fd941522e11dafa78ef1a893c179901b7d66aa29f2  aiohttp-3.12.14.tar.gz
 # Locally computed sha256 checksums
 sha256  9f80d0db7d755a941db4572172c270ecbd8f082ba215ddd095985942ed94a9eb  LICENSE.txt
diff --git a/package/python-aiohttp/python-aiohttp.mk b/package/python-aiohttp/python-aiohttp.mk
index d3e7d12eb6..e52b6e81c5 100644
--- a/package/python-aiohttp/python-aiohttp.mk
+++ b/package/python-aiohttp/python-aiohttp.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_AIOHTTP_VERSION = 3.11.14
+PYTHON_AIOHTTP_VERSION = 3.12.14
 PYTHON_AIOHTTP_SOURCE = aiohttp-$(PYTHON_AIOHTTP_VERSION).tar.gz
-PYTHON_AIOHTTP_SITE = https://files.pythonhosted.org/packages/6c/96/91e93ae5fd04d428c101cdbabce6c820d284d61d2614d00518f4fa52ea24
+PYTHON_AIOHTTP_SITE = https://files.pythonhosted.org/packages/e6/0b/e39ad954107ebf213a2325038a3e7a506be3d98e1435e1f82086eec4cde2
 PYTHON_AIOHTTP_SETUP_TYPE = setuptools
 PYTHON_AIOHTTP_LICENSE = Apache-2.0
 PYTHON_AIOHTTP_LICENSE_FILES = LICENSE.txt
-- 
2.50.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
