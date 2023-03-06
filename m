Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86D84C678D4
	for <buildroot@archiver.kernel.org>; Mon,  6 Mar 2023 07:26:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DA820819ED;
	Mon,  6 Mar 2023 07:26:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DA820819ED
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XYB35b_JcZyD; Mon,  6 Mar 2023 07:26:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id CE83D8148D;
	Mon,  6 Mar 2023 07:26:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CE83D8148D
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D2CFF1BF291
 for <buildroot@lists.busybox.net>; Mon,  6 Mar 2023 07:26:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id ABC0240917
 for <buildroot@lists.busybox.net>; Mon,  6 Mar 2023 07:26:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org ABC0240917
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Hx0WpaQaPPdf for <buildroot@lists.busybox.net>;
 Mon,  6 Mar 2023 07:26:03 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D00A2400C8
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com
 [209.85.216.50])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D00A2400C8
 for <buildroot@buildroot.org>; Mon,  6 Mar 2023 07:26:03 +0000 (UTC)
Received: by mail-pj1-f50.google.com with SMTP id
 ce8-20020a17090aff0800b0023a61cff2c6so6963464pjb.0
 for <buildroot@buildroot.org>; Sun, 05 Mar 2023 23:26:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=4ZsG9DZZt4oh9Oxcwt/ezrGnb4dRO5Ff52XzURBYUKo=;
 b=2QcM7j9j2z3wY/cWjUtyjZd/uASkm/yD5uRQPQOf/C6vRv6a4XxN3aHLigCM5WB9Rq
 MN/SpJlahT7bTjr5H6or8fDAzx96itbRLlQs8cX2Bb0hM8YrCbNREBU3Vaqw1bT7n0ts
 u2Z9vQMS+DN+Q0CLlDoltXYuebC4ySGlic47xm9lO75vYIHC/ob5S9/LUwgzt+Nddqg2
 emiW+js4NaV5KG8AXZKSXmgUMKFnsEfYYsme0GfM1IJ8Wn3ClX8NbhNdG36XF8yFEWkO
 CrTFoZpBsW1p+0L0w00BWI/ZfGMqpLmvgXZykE5WndOFZzkoA0yOb1YFpLPy+cIQL+3z
 EDfw==
X-Gm-Message-State: AO0yUKWF0vJyf171R9XOomNbLOflrPszRvbi/C/hosAfJF3TTnr5dtN2
 ZIzdvLaBTqpVmXfr3zev38cLpqr65cXGZA==
X-Google-Smtp-Source: AK7set92ydTmv/uxYRzp/MsHQJDz2qcHiyUfI+VwWuWUGczu3vAfPooq+yrMNPOdgGYg1S8Y1segQw==
X-Received: by 2002:a17:902:b181:b0:19e:bc01:610e with SMTP id
 s1-20020a170902b18100b0019ebc01610emr3181240plr.33.1678087562773; 
 Sun, 05 Mar 2023 23:26:02 -0800 (PST)
Received: from localhost.localdomain (ip184-189-231-225.sb.sd.cox.net.
 [184.189.231.225]) by smtp.gmail.com with ESMTPSA id
 jh5-20020a170903328500b0019a983f0119sm5897544plb.307.2023.03.05.23.26.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Mar 2023 23:26:02 -0800 (PST)
To: buildroot@buildroot.org
Date: Sun,  5 Mar 2023 23:25:58 -0800
Message-Id: <20230306072558.31515-1-christian@paral.in>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2 1/1] package/rtl8821cu: switch to version
 20210916
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
From: Christian Stewart via buildroot <buildroot@buildroot.org>
Reply-To: Christian Stewart <christian@paral.in>
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Christian Stewart <christian@paral.in>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The author of the 8821cu repository has requested that we switch to a newer
major version of the driver located at 8821cu-20210916:

https://github.com/morrownr/8821cu-20210118/pull/93#issuecomment-1452675897

Switch to that new repository.

Fixes a build issue against PowerPC64.

Signed-off-by: Christian Stewart <christian@paral.in>

---

v1 -> v2:

 - merged PR fixing PowerPC64: https://github.com/morrownr/8821cu-20210916/pull/73
 - supersedes: https://patchwork.ozlabs.org/project/buildroot/patch/20230302151859.400567-1-giulio.benetti@benettiengineering.com/

Signed-off-by: Christian Stewart <christian@paral.in>
---
 package/rtl8821cu/rtl8821cu.hash | 2 +-
 package/rtl8821cu/rtl8821cu.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/rtl8821cu/rtl8821cu.hash b/package/rtl8821cu/rtl8821cu.hash
index efb9871472..e2d83adc0f 100644
--- a/package/rtl8821cu/rtl8821cu.hash
+++ b/package/rtl8821cu/rtl8821cu.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  09b9fb4160003502d564d0d0d85d6f19b8b6d1627d1a339b3ddfca6a948d84fb  rtl8821cu-86cc5ceb7c28b9b997838e1c796847f6c395c382.tar.gz
+sha256  1d090da292c3f9322603846467a80278670211fcde3354dcabfe32c449992493  rtl8821cu-69c903b75bde36293c66b25c051916a74dbadf58.tar.gz
 sha256  af54d00efc57cfce664171ac8be2a20c0f290b1b5c1a67bb2eba7b6380276c4e  LICENSE
diff --git a/package/rtl8821cu/rtl8821cu.mk b/package/rtl8821cu/rtl8821cu.mk
index 97f50d9633..b3e4ad3fc8 100644
--- a/package/rtl8821cu/rtl8821cu.mk
+++ b/package/rtl8821cu/rtl8821cu.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-RTL8821CU_VERSION = 86cc5ceb7c28b9b997838e1c796847f6c395c382
-RTL8821CU_SITE = $(call github,morrownr,8821cu-20210118,$(RTL8821CU_VERSION))
+RTL8821CU_VERSION = 69c903b75bde36293c66b25c051916a74dbadf58
+RTL8821CU_SITE = $(call github,morrownr,8821cu-20210916,$(RTL8821CU_VERSION))
 RTL8821CU_LICENSE = GPL-2.0
 RTL8821CU_LICENSE_FILES = LICENSE
 
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
