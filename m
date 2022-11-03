Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22AACC433FE
	for <buildroot@archiver.kernel.org>; Thu,  3 Nov 2022 19:19:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A2AC040B6D;
	Thu,  3 Nov 2022 19:19:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A2AC040B6D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UhizdTUtitig; Thu,  3 Nov 2022 19:19:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id AF95C404D8;
	Thu,  3 Nov 2022 19:19:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AF95C404D8
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 59B791BF3C0
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 19:18:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 34B4E81F71
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 19:18:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 34B4E81F71
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EZrY3OlknAcs for <buildroot@lists.busybox.net>;
 Thu,  3 Nov 2022 19:18:58 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 460A3818CD
Received: from mail-il1-x134.google.com (mail-il1-x134.google.com
 [IPv6:2607:f8b0:4864:20::134])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 460A3818CD
 for <buildroot@buildroot.org>; Thu,  3 Nov 2022 19:18:58 +0000 (UTC)
Received: by mail-il1-x134.google.com with SMTP id x16so1577416ilm.5
 for <buildroot@buildroot.org>; Thu, 03 Nov 2022 12:18:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=kBKjQdIo5p+mbxTErpYIi6M8ITPzvTRdHIXfEEbK2sc=;
 b=sSOKGBWaLpFJvzY/o9rEC4yi64GpZOb/RO//TyUmTS6xkml+vBYBuwPQ8JKyF7B9XL
 112y/bWek818vmV9bWI3Cb2TflTb4puElc/nXw0Guz9SyP+wK4xVPXYrNICFFnXvJsoU
 oc6/KSHImLaByVZ/JQEcUKhYaKldxSw5cYDxgjt/ZzwtsTqrI+YQzVavp2YxyLOqAO/e
 Koa7TemOtYmrp8EwOtbBuA4a92vczPOqE+D0WeR0oBtETozeqykSNHcCPZIXAMUu4nID
 lO1S86AtIfDt4cGHGgHhdhFdJ6fiVxG9new4gL48e6gPaD+vYBt9gUfvPnA9g3WKUh5P
 wdRg==
X-Gm-Message-State: ACrzQf1hx6Bkrd1zqQY9TcByyf7xIrezsY6t2LYjrQbQX54In/7mUnqa
 wQzoY13K7EKSkB7SqgyC4ryTEmcTGDbLcEGj
X-Google-Smtp-Source: AMsMyM78W6wWhnRwmL44xr80HN0vV3Ms0BnPl4j9JgWmUOmGi9CR7COhyNxWUMKpqgNg0YF82ilmjw==
X-Received: by 2002:a92:ddc2:0:b0:300:b1fb:de2a with SMTP id
 d2-20020a92ddc2000000b00300b1fbde2amr13619650ilr.29.1667503137086; 
 Thu, 03 Nov 2022 12:18:57 -0700 (PDT)
Received: from james-x399.localdomain (71-218-240-5.hlrn.qwest.net.
 [71.218.240.5]) by smtp.gmail.com with ESMTPSA id
 y18-20020a027312000000b003633b78ee12sm454972jab.75.2022.11.03.12.18.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Nov 2022 12:18:56 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Thu,  3 Nov 2022 13:18:54 -0600
Message-Id: <20221103191854.231813-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=kBKjQdIo5p+mbxTErpYIi6M8ITPzvTRdHIXfEEbK2sc=;
 b=WWuCuo/2aaWYgEF4s55GZDjMk215QplEPCvtrCnVugF34Ptb1uN+5WjPNoKriH7qDs
 7MWItZAsFaQ+do4345FM8VmzsCYMQreYbvjG11zY+F2OG5k7VzhmIzAtF58Q4ls3cQiw
 yJWrXBoxuWBwLfK+hubk9d9stPfPbbeF5BiYSpjmdXqOpS64sfn8pZlcT6W34j5lrUBG
 kx4QyussM4FI1wG3muwNqngh2NC51N92Nd1+7krS71TV1B3zTU04J5cJiBAm7mCTzbED
 JkMzQ9LEFQdnuTD7CMfRl8Jh04JV1njjdlgibvcW1lDewiiyKxoQWsOsYj+klX8gMyz6
 Hm/Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=WWuCuo/2
Subject: [Buildroot] [PATCH 1/1] package/python-setuptools-scm-git-archive:
 bump to version 1.4
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
 .../python-setuptools-scm-git-archive.hash                    | 4 ++--
 .../python-setuptools-scm-git-archive.mk                      | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-setuptools-scm-git-archive/python-setuptools-scm-git-archive.hash b/package/python-setuptools-scm-git-archive/python-setuptools-scm-git-archive.hash
index 6b3b1de3dd..40b4b0e7f7 100644
--- a/package/python-setuptools-scm-git-archive/python-setuptools-scm-git-archive.hash
+++ b/package/python-setuptools-scm-git-archive/python-setuptools-scm-git-archive.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/setuptools-scm-git-archive/json
-md5  1c9351fa5cebd12e76488737a7c78f2e  setuptools_scm_git_archive-1.1.tar.gz
-sha256  6026f61089b73fa1b5ee737e95314f41cb512609b393530385ed281d0b46c062  setuptools_scm_git_archive-1.1.tar.gz
+md5  df3933d33c49c5d9aca06715b4c65370  setuptools_scm_git_archive-1.4.tar.gz
+sha256  b048b27b32e1e76ec865b0caa4bb85df6ddbf4697d6909f567ac36709f6ef2f0  setuptools_scm_git_archive-1.4.tar.gz
 # Locally computed sha256 checksums
 sha256  89807acf2309bd285f033404ee78581602f3cd9b819a16ac2f0e5f60ff4a473e  LICENSE
diff --git a/package/python-setuptools-scm-git-archive/python-setuptools-scm-git-archive.mk b/package/python-setuptools-scm-git-archive/python-setuptools-scm-git-archive.mk
index 032e2d3fc9..278fc972e5 100644
--- a/package/python-setuptools-scm-git-archive/python-setuptools-scm-git-archive.mk
+++ b/package/python-setuptools-scm-git-archive/python-setuptools-scm-git-archive.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_SETUPTOOLS_SCM_GIT_ARCHIVE_VERSION = 1.1
+PYTHON_SETUPTOOLS_SCM_GIT_ARCHIVE_VERSION = 1.4
 PYTHON_SETUPTOOLS_SCM_GIT_ARCHIVE_SOURCE = setuptools_scm_git_archive-$(PYTHON_SETUPTOOLS_SCM_GIT_ARCHIVE_VERSION).tar.gz
-PYTHON_SETUPTOOLS_SCM_GIT_ARCHIVE_SITE = https://files.pythonhosted.org/packages/7e/2c/0c15b29a1b5940250bfdc4a4f53272e35cd7cf8a34159291b6b4ec9eb291
+PYTHON_SETUPTOOLS_SCM_GIT_ARCHIVE_SITE = https://files.pythonhosted.org/packages/69/5f/7135eec07395c51d3dd6899251b277405ecc2f8f7a80ef80a483e3c5a2bd
 PYTHON_SETUPTOOLS_SCM_GIT_ARCHIVE_SETUP_TYPE = setuptools
 PYTHON_SETUPTOOLS_SCM_GIT_ARCHIVE_LICENSE = MIT
 PYTHON_SETUPTOOLS_SCM_GIT_ARCHIVE_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
