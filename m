Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8CD6C433EF
	for <buildroot@archiver.kernel.org>; Sat,  1 Jan 2022 00:40:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id EADD0400C7;
	Sat,  1 Jan 2022 00:40:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dHg5AOfsTJQU; Sat,  1 Jan 2022 00:40:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id DD2DE405D9;
	Sat,  1 Jan 2022 00:40:44 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 14C631C116E
 for <buildroot@lists.busybox.net>; Sat,  1 Jan 2022 00:40:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0384760DE5
 for <buildroot@lists.busybox.net>; Sat,  1 Jan 2022 00:40:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fHHlxAE0hKW3 for <buildroot@lists.busybox.net>;
 Sat,  1 Jan 2022 00:40:43 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-io1-xd2e.google.com (mail-io1-xd2e.google.com
 [IPv6:2607:f8b0:4864:20::d2e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4106B6074C
 for <buildroot@buildroot.org>; Sat,  1 Jan 2022 00:40:43 +0000 (UTC)
Received: by mail-io1-xd2e.google.com with SMTP id o7so32410364ioo.9
 for <buildroot@buildroot.org>; Fri, 31 Dec 2021 16:40:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Ndcpeh7jbtNjzEP/EeBO+G4V7VsNAY/0RevDhkx9u7w=;
 b=K00aTGM9ukhJD8wj++hAwBgDvfFsQCdprWXNxXvGCYh8tECmuQqolFoDYFB6hxynE3
 SH/xZPn6PvBev42wFV3+Ef6ftbrnnfj29eHTo3+RDnKpguwd2tV3cGuYHxsIxFx5s859
 rfxTGBbHnAzEoFz05SxhKuqyWq5QiRVu/1n8Vw5z2mMbMVObt5kxQKC6A38m4gR/Gx6G
 tWgClTmotTtmcmFUZtrZfAZCXTzllmEU9clRzrlqo8An7TFLaevKGFWICP+YSW9JW/uP
 mLx2sVV6LeFd57py3OVXDHPmYszeMhgnnQMXlO7JtcspTUJ/JkwU79iFpgKcgKBpzGlf
 PIIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Ndcpeh7jbtNjzEP/EeBO+G4V7VsNAY/0RevDhkx9u7w=;
 b=GPAzI1tfDg/+FzLHpj9FTJ/h6rIUYencpNJEu0uEkZz9wT5Awcsyk+0JDKVzQMWr0l
 NTVXB5LeSrStqrVZQqc2uYFe/KQNjdKN4+xzLfCtAb/nISR8VpwDkG+673gxSV2bcS4t
 Ka7DiDKsAR0/zfvpFLme4MGNDmCbiNMYaFcVED5Ups3c0k5YlKICgsp55/JX8w+EP8k9
 mvp/WxiofHDXMD6+ns/LrLh6LRbInzaapmrGiUjbjTkrFQXN9KffXBrJUDWh8k/M4gA3
 tOid612ShHyhDqGJHFLJpYPT7dOzcnkIy5nQakXUSRXGiHUWJ56SzcCmHY33JNEPZcGJ
 aeaQ==
X-Gm-Message-State: AOAM533RaXfafScu8w2l/6ccDix9BWNt0oh25TRDJ48yjgaLE6kCuBZd
 Ql0cJaSqjXVumrzgUb88iOg3YSU+loU=
X-Google-Smtp-Source: ABdhPJyc4qiLSL6/Htax7YmNWZk1fWfVY1GMhPLHvy6cVxufZG6xjMI06Wsf3w0oMcHqtVBnNz0Akg==
X-Received: by 2002:a05:6638:23a:: with SMTP id
 f26mr16952510jaq.222.1640997642210; 
 Fri, 31 Dec 2021 16:40:42 -0800 (PST)
Received: from james-x399.localdomain (71-218-242-12.hlrn.qwest.net.
 [71.218.242.12])
 by smtp.gmail.com with ESMTPSA id a5sm16723142ilb.76.2021.12.31.16.40.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 Dec 2021 16:40:41 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 31 Dec 2021 17:40:32 -0700
Message-Id: <20220101004032.1986569-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-aiohttp: bump to version
 3.8.1
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
 package/python-aiohttp/python-aiohttp.hash | 4 ++--
 package/python-aiohttp/python-aiohttp.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-aiohttp/python-aiohttp.hash b/package/python-aiohttp/python-aiohttp.hash
index 90dbd75994..b2b0f8c937 100644
--- a/package/python-aiohttp/python-aiohttp.hash
+++ b/package/python-aiohttp/python-aiohttp.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/aiohttp/json
-md5  4743950052dbaf5ce5c3622754ebceae  aiohttp-3.8.0.tar.gz
-sha256  d3b19d8d183bcfd68b25beebab8dc3308282fe2ca3d6ea3cb4cd101b3c279f8d  aiohttp-3.8.0.tar.gz
+md5  faf7726dc65a940272874c0f441e8ec6  aiohttp-3.8.1.tar.gz
+sha256  fc5471e1a54de15ef71c1bc6ebe80d4dc681ea600e68bfd1cbce40427f0b7578  aiohttp-3.8.1.tar.gz
 # Locally computed sha256 checksums
 sha256  383c70c090b60ae81e035fe4fafed689b45c4421cd3bc355f1bd41ac208ccf3f  LICENSE.txt
diff --git a/package/python-aiohttp/python-aiohttp.mk b/package/python-aiohttp/python-aiohttp.mk
index 03501a7527..5a2d306438 100644
--- a/package/python-aiohttp/python-aiohttp.mk
+++ b/package/python-aiohttp/python-aiohttp.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_AIOHTTP_VERSION = 3.8.0
+PYTHON_AIOHTTP_VERSION = 3.8.1
 PYTHON_AIOHTTP_SOURCE = aiohttp-$(PYTHON_AIOHTTP_VERSION).tar.gz
-PYTHON_AIOHTTP_SITE = https://files.pythonhosted.org/packages/48/1a/ba9542a545aed4b0b6ef128561f68dd3c2812ff5abfa9ed5b96547a728ea
+PYTHON_AIOHTTP_SITE = https://files.pythonhosted.org/packages/5a/86/5f63de7a202550269a617a5d57859a2961f3396ecd1739a70b92224766bc
 PYTHON_AIOHTTP_SETUP_TYPE = setuptools
 PYTHON_AIOHTTP_LICENSE = Apache-2.0
 PYTHON_AIOHTTP_LICENSE_FILES = LICENSE.txt
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
