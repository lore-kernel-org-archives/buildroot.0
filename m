Return-Path: <SRS0=V1ZZ=OR=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F20BC433F5
	for <buildroot@archiver.kernel.org>; Mon, 27 Sep 2021 06:39:23 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 090B46115C
	for <buildroot@archiver.kernel.org>; Mon, 27 Sep 2021 06:39:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 090B46115C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D849D607CB;
	Mon, 27 Sep 2021 06:39:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id d91hjLUdbnr2; Mon, 27 Sep 2021 06:39:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E762960796;
	Mon, 27 Sep 2021 06:39:19 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 96C391BF307
 for <buildroot@lists.busybox.net>; Mon, 27 Sep 2021 06:38:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 86EAA81A15
 for <buildroot@lists.busybox.net>; Mon, 27 Sep 2021 06:38:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id W8f1VLMbMnV6 for <buildroot@lists.busybox.net>;
 Mon, 27 Sep 2021 06:38:23 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 83D9D81DA3
 for <buildroot@buildroot.org>; Mon, 27 Sep 2021 06:38:23 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id t18so49228855wrb.0
 for <buildroot@buildroot.org>; Sun, 26 Sep 2021 23:38:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1fZjLqMt+WkcbhVzhIcH2aTlKm7zElFJgC4YE29VQp0=;
 b=JDZhgpv7NpsRRmKulks9L+HcDPEbeGvMA8Tn4uD8M/FfYg9ueCivLyUVl0pBmEmFkU
 A0PpuldS0Ho7e8ZGYC2MfsruR94z3MHnGBq1f9uY2o5BmI6cRXOC3FnhooM4NQJR2BVv
 UMkcTmdldZ5Mp4339wBbGk9khD3GUOSm9Xb/7q8HiuNVzseddmHgSdnmIe0WLIx+x4vL
 KmDApR3y2qHJoAXJV/LYy/2HeLLuaYNN52o/arZkn0Z5oLibWO1J6ws4k4oFA/ScJjr6
 1lzC5YsyNv/GCfWS2cyDWwm1uXaGmBRixUmlRnw/mXdzWwHayGFr3W5rXFfp7FLabvkC
 4mdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1fZjLqMt+WkcbhVzhIcH2aTlKm7zElFJgC4YE29VQp0=;
 b=F+O+BGcq0PVvhEWCd7ufbTUrVj2mOGEmknHVoV0KPmG9gtvulSIjh/9XNBjQyFs4vy
 SUgxbtbabIZLTkr/hyCo1I+bwPnGfx2DwCLU7YOvL2gj22D7fvdu5bhk+yAxPvp2Wjty
 upNnrQRiEBVLrv34lRzQMJfwzTRsPm41AVlUhg791TeUrdtQFn5LkOVfElikd9+jTej9
 y5fxBtZOtIDl2W9Im0jVV9jA46dkR23WWmRqSMhfvh38xdCXxjiogKvZKcT0vHQhxDv3
 ztl4obBtrg6OTZ8ExLXoYk+MaJRHDxMrIL7HMtjfTIunXUJtqRwnop5CByxCpYKKuf+K
 tcxQ==
X-Gm-Message-State: AOAM530xlEDqvclHYTeXssbuMvbbWpkB4AT/g0F2yM8PnZX4PHQ2iWfw
 enAGIsGzH8SeT2jGZvcxbVE05Dc8GuU=
X-Google-Smtp-Source: ABdhPJyBHT8lRBKOjKDeg2m5TZBeEarDtPv/Q+zOf/Vi6E4VwBewJqR/Zvng6wg1lKosielDdgLezg==
X-Received: by 2002:adf:d1e9:: with SMTP id g9mr25602220wrd.200.1632724701677; 
 Sun, 26 Sep 2021 23:38:21 -0700 (PDT)
Received: from asaf.. ([2a10:8002:6b25:0:424d:6143:cd4e:c1e])
 by smtp.gmail.com with ESMTPSA id t13sm5061135wro.76.2021.09.26.23.38.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Sep 2021 23:38:21 -0700 (PDT)
From: Asaf Kahlon <asafka7@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 27 Sep 2021 09:38:08 +0300
Message-Id: <20210927063809.505480-6-asafka7@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210927063809.505480-1-asafka7@gmail.com>
References: <20210927063809.505480-1-asafka7@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-typepy: bump to version 1.3.0
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
---
 package/python-typepy/python-typepy.hash | 4 ++--
 package/python-typepy/python-typepy.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-typepy/python-typepy.hash b/package/python-typepy/python-typepy.hash
index e4d84e9bfc..eade667341 100644
--- a/package/python-typepy/python-typepy.hash
+++ b/package/python-typepy/python-typepy.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/typepy/json
-md5  cc9ceef1f04a8ff4b979dc23b96f2e80  typepy-1.1.5.tar.gz
-sha256  1bbe790bb8d1b43b4541b235678974d5aee2357e1948cdf17cb4c14cbe4a2a82  typepy-1.1.5.tar.gz
+md5  9f73bef9ce9e9ccf49ed63a2dadada90  typepy-1.3.0.tar.gz
+sha256  96788530614083164993d1443959f6c58e6bb8e2da839812ddf462c203e4b84c  typepy-1.3.0.tar.gz
 # Locally computed sha256 checksums
 sha256  bebbdf0524a147f89a615fff53d79bdc90cbc7631550fb4b725cd3f3bdcd24f6  LICENSE
diff --git a/package/python-typepy/python-typepy.mk b/package/python-typepy/python-typepy.mk
index 6d8433e136..6c556df986 100644
--- a/package/python-typepy/python-typepy.mk
+++ b/package/python-typepy/python-typepy.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_TYPEPY_VERSION = 1.1.5
+PYTHON_TYPEPY_VERSION = 1.3.0
 PYTHON_TYPEPY_SOURCE = typepy-$(PYTHON_TYPEPY_VERSION).tar.gz
-PYTHON_TYPEPY_SITE = https://files.pythonhosted.org/packages/08/c8/ebfa4381563f1946a7cd2b03fab14df641c3a9acf8e6ca5f5787dd1f735a
+PYTHON_TYPEPY_SITE = https://files.pythonhosted.org/packages/07/7b/fb32933f2a17992af75c0f96e5538a25fecebd439a82dcc31926ba55d336
 PYTHON_TYPEPY_SETUP_TYPE = setuptools
 PYTHON_TYPEPY_LICENSE = MIT
 PYTHON_TYPEPY_LICENSE_FILES = LICENSE
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
