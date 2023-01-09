Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC4DCC54EBD
	for <buildroot@archiver.kernel.org>; Mon,  9 Jan 2023 03:18:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4EA7480C22;
	Mon,  9 Jan 2023 03:18:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4EA7480C22
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zTrfoB03l2eY; Mon,  9 Jan 2023 03:18:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 977CE80A4E;
	Mon,  9 Jan 2023 03:18:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 977CE80A4E
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 14AC91BF86B
 for <buildroot@lists.busybox.net>; Mon,  9 Jan 2023 03:18:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E3613401C9
 for <buildroot@lists.busybox.net>; Mon,  9 Jan 2023 03:18:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E3613401C9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tzUyOvwzuuRv for <buildroot@lists.busybox.net>;
 Mon,  9 Jan 2023 03:18:27 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C3907401BB
Received: from mail-il1-x12e.google.com (mail-il1-x12e.google.com
 [IPv6:2607:f8b0:4864:20::12e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C3907401BB
 for <buildroot@buildroot.org>; Mon,  9 Jan 2023 03:18:26 +0000 (UTC)
Received: by mail-il1-x12e.google.com with SMTP id y2so4337644ily.5
 for <buildroot@buildroot.org>; Sun, 08 Jan 2023 19:18:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Hi+ImLCXliT4s8/+8eJw3ueKdRXizWq8EWaxy8KbxAU=;
 b=vkWSpWJpAccm++PZtjHOTT/j++V3wNh+ha/XvH3ejyxjGbjENbetzgyuB12+Hc0wog
 q3wuw/7SpRUVQbmvino0WE05o15qA1/X8nfyzcvDf7090fFNTePo7b4VTvT+TzAGt9YH
 xbCHISkkNheOGvINi8elASh55Y4Z8xUpzD7zV6QRnw7mRQKNfj1PBbKYL/Jc4fbFBywW
 3XP3AqMuuUYwq2IXP2A1ObbnPy+LjaFNXnjs5zN0sn2jrgZTZ02XassacEQQnt+H0g8W
 is3hX8f1xPD8Gfy8zJ0P/+PKSkCp8QgzrQSBqaaKjB5LF561RRGnRQ0bdcT+ZsUmvPf/
 /ZYg==
X-Gm-Message-State: AFqh2kr6AcvkrPVVqoujTiDOPyuXkjSh3LaEIA0fJW7rcXxXNPkXV2vP
 xsLLkUArxaH1P8fRawaEGEH7K29GioJVLA==
X-Google-Smtp-Source: AMrXdXu6pf9Gg+FTPH5NGQ3HuYLsWr6LrtFFtZRSScpvMgbO2Pf+nFVh8fqtx+6WceVdQvXLb0xiaQ==
X-Received: by 2002:a92:c744:0:b0:30c:41cc:6978 with SMTP id
 y4-20020a92c744000000b0030c41cc6978mr20171155ilp.1.1673234305671; 
 Sun, 08 Jan 2023 19:18:25 -0800 (PST)
Received: from james-x399.localdomain (71-33-132-231.hlrn.qwest.net.
 [71.33.132.231]) by smtp.gmail.com with ESMTPSA id
 y1-20020a92c981000000b0030392271239sm2393719iln.8.2023.01.08.19.18.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Jan 2023 19:18:24 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  8 Jan 2023 20:18:22 -0700
Message-Id: <20230109031822.2053199-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Hi+ImLCXliT4s8/+8eJw3ueKdRXizWq8EWaxy8KbxAU=;
 b=W2vFmAIBs8mUyuiVu/Mb3WACQ4a3/d8GE9J1TjmBsNCymvaTc7gwyxaHZ3rZNnTnzL
 WVX5XkAjFJ1mXlcGAbkM8h8doXNvI8NYGeK6iwrO8OM0gR6NPCXSfE0Ik95n0XzJs3ga
 VNN4IfNkHk/OzzkBdnHxMsQdUfZhvW94Uuk0PdVTeXjLp1pw5oauiLP4H0H3iecSgkmU
 wN5plE8HI7zAx3p8TyqvwlacVa7H7vS+XpUyqLLoMNzIzotLsA1x6A5fM/Umx8FGv36E
 MNdR7gsePgxRtEJ+9GntQI+ck1FG1J05saHL9NnSOKsd0UausWSSNAXw49TwXVGOfJ7q
 RZTw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=W2vFmAIB
Subject: [Buildroot] [PATCH 1/1] package/python-botocore: bump to version
 1.29.45
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
 =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-botocore/python-botocore.hash | 4 ++--
 package/python-botocore/python-botocore.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-botocore/python-botocore.hash b/package/python-botocore/python-botocore.hash
index 8314c534e9..0e9d0572d7 100644
--- a/package/python-botocore/python-botocore.hash
+++ b/package/python-botocore/python-botocore.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/botocore/json
-md5  488df64a4fcd884f9fbcf990bdc8b34c  botocore-1.29.27.tar.gz
-sha256  0932b22d8737b11037adf7e734f9b90425b575d0757e4c1a035e99f382955221  botocore-1.29.27.tar.gz
+md5  3946a693e09b65a0f6615a1a30f606d7  botocore-1.29.45.tar.gz
+sha256  62ae03e591ff25555854aa338da35190ffe18c0b1be2ebf5cfb277164233691f  botocore-1.29.45.tar.gz
 # Locally computed sha256 checksums
 sha256  0d542e0c8804e39aa7f37eb00da5a762149dc682d7829451287e11b938e94594  LICENSE.txt
diff --git a/package/python-botocore/python-botocore.mk b/package/python-botocore/python-botocore.mk
index 4b14af4368..ceb3fbe6ea 100644
--- a/package/python-botocore/python-botocore.mk
+++ b/package/python-botocore/python-botocore.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_BOTOCORE_VERSION = 1.29.27
+PYTHON_BOTOCORE_VERSION = 1.29.45
 PYTHON_BOTOCORE_SOURCE = botocore-$(PYTHON_BOTOCORE_VERSION).tar.gz
-PYTHON_BOTOCORE_SITE = https://files.pythonhosted.org/packages/08/3f/e9f97b0700e0be670404a7d4a9ac62fd59495897f15c928dd38874e98ef7
+PYTHON_BOTOCORE_SITE = https://files.pythonhosted.org/packages/9d/4f/1c24126941d1f8c1f2ecf459f88959d59566af34a55a81d926368fd2e6e5
 PYTHON_BOTOCORE_SETUP_TYPE = setuptools
 PYTHON_BOTOCORE_LICENSE = Apache-2.0
 PYTHON_BOTOCORE_LICENSE_FILES = LICENSE.txt
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
