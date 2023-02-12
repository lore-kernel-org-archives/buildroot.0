Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 245D5C636D3
	for <buildroot@archiver.kernel.org>; Sun, 12 Feb 2023 12:58:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8601260BCE;
	Sun, 12 Feb 2023 12:58:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8601260BCE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id s7pHIFYWGCFy; Sun, 12 Feb 2023 12:58:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E5BC260B96;
	Sun, 12 Feb 2023 12:58:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E5BC260B96
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5791E1BF593
 for <buildroot@lists.busybox.net>; Sun, 12 Feb 2023 12:58:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3E8F9812CF
 for <buildroot@lists.busybox.net>; Sun, 12 Feb 2023 12:58:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3E8F9812CF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6J4hpQKuCR-1 for <buildroot@lists.busybox.net>;
 Sun, 12 Feb 2023 12:58:50 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 40BDA812B1
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 40BDA812B1
 for <buildroot@buildroot.org>; Sun, 12 Feb 2023 12:58:50 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id a2so9688528wrd.6
 for <buildroot@buildroot.org>; Sun, 12 Feb 2023 04:58:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=5DZ6NQgAqDIqMbwN6shXQoyHFaXxcdvsEHlxkTo3vTM=;
 b=q9uBE2MFwAMI1XDndPefHD2bYH9UiOSNIw7C7Spwhqt7IpX/IXpNZCmfpb19vKMbyB
 SbLWpWCM0WandEWfrQxwS/cFlKj1wvgy/czcuPwsq9d4P9DYCYHsE9CbKUNfZiEY0eG1
 8h6uWIuiLGdTvzOrbGvGJxDvT4wTgoO6yoKqbz+RLz1+TT43Lb/AUax/l+virMMR77xv
 iFhDkxXwVLNXDS6+YWCKcXeC3WJoXQDQse7vs87Sa+gZ3uo4YtBuAIIWPVAMwycgXrQK
 4vFgbw6hkPSNP17YIWFqm7mFSR7xzIBGkt41jYjVLemEQ5LZv7KYiJGCsTi7drzDZLhC
 PpxQ==
X-Gm-Message-State: AO0yUKWC3xO4Y3P8b1Usyiy6jlkdhODeJXwqjJjjg/M3k0LwIcSYjamn
 dAUEBey0gccaIiDJSk6yXFRVAlq3NyY=
X-Google-Smtp-Source: AK7set8BZRZ9gbL0cv1ZEdeH8iyBJB9cTLguLWyESX3g/Yd/Jy9enfh8rCPlxfDrETU9uu7HRI6M0g==
X-Received: by 2002:a5d:595f:0:b0:2c5:585d:74c5 with SMTP id
 e31-20020a5d595f000000b002c5585d74c5mr619986wri.22.1676206728116; 
 Sun, 12 Feb 2023 04:58:48 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 b16-20020adfe650000000b002c5534db60bsm1882023wrn.71.2023.02.12.04.58.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Feb 2023 04:58:47 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 12 Feb 2023 13:58:44 +0100
Message-Id: <20230212125844.332225-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=5DZ6NQgAqDIqMbwN6shXQoyHFaXxcdvsEHlxkTo3vTM=;
 b=Sd2nCeNMcpDyGnM1TONbS39n88/dKY6YK252L6FI8cBofRhdr8cyAhoYydNyEc3Ydm
 YGjgRwU59O7nd3i3p2Dz4hiwckL6Q1Pa8bRyGKhdWF4pNXwtpKIp8i4dNJkQPVT1hbU1
 DwFouR9lRJ4ZFdHFXiFPuzASWhGkxFqX8N3vDArqtRj9Ueex6HLXV8bBGCBlRch3+pxS
 5HaQu7VnLIlNg7MRoN/Z4HYRxWPtGYbcfQudY6VcKkeg5VvV1YGE0qWao7m8rV1cyqjO
 wIyE9Y3prFiJMJQgNF3HCkkRQEg8XRaoB0lk+lDiLSK0bDuN4Avl4rVC88MIjBgr2dT5
 sR7g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=Sd2nCeNM
Subject: [Buildroot] [PATCH 1/1] package/log4cplus: bump to version 2.1.0
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://github.com/log4cplus/log4cplus/blob/REL_2_1_0/ChangeLog

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/log4cplus/log4cplus.hash | 2 +-
 package/log4cplus/log4cplus.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/log4cplus/log4cplus.hash b/package/log4cplus/log4cplus.hash
index c4540c9d56..1779b30949 100644
--- a/package/log4cplus/log4cplus.hash
+++ b/package/log4cplus/log4cplus.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  f5949e713cf8635fc554384ab99b04716e3430f28eed6dd7d71ad03d959b91a0  log4cplus-2.0.8.tar.xz
+sha256  d84ac8b1c46645122fbf72691f8eacef68c71b587403ee833bd9a252e06d46cc  log4cplus-2.1.0.tar.xz
 sha256  91d7e42ff80e74c4c94e5ad353375fa0358cd0abbf43f5fe957097cdbd4e2c4d  LICENSE
diff --git a/package/log4cplus/log4cplus.mk b/package/log4cplus/log4cplus.mk
index 2dab661654..28eb4ed8f4 100644
--- a/package/log4cplus/log4cplus.mk
+++ b/package/log4cplus/log4cplus.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LOG4CPLUS_VERSION = 2.0.8
+LOG4CPLUS_VERSION = 2.1.0
 LOG4CPLUS_SOURCE = log4cplus-$(LOG4CPLUS_VERSION).tar.xz
 LOG4CPLUS_SITE = http://downloads.sourceforge.net/project/log4cplus/log4cplus-stable/$(LOG4CPLUS_VERSION)
 LOG4CPLUS_LICENSE = Apache-2.0, BSD-2-Clause, BSD-like (threadpool)
-- 
2.39.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
