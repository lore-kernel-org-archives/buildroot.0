Return-Path: <SRS0=7Pu+=OC=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A9FDC433EF
	for <buildroot@archiver.kernel.org>; Sun, 12 Sep 2021 18:35:11 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CFCC76101A
	for <buildroot@archiver.kernel.org>; Sun, 12 Sep 2021 18:35:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CFCC76101A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6AA9880F45;
	Sun, 12 Sep 2021 18:35:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NKZYI5uIIk36; Sun, 12 Sep 2021 18:35:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C95B580F3D;
	Sun, 12 Sep 2021 18:35:08 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A7F331BF40E
 for <buildroot@lists.busybox.net>; Sun, 12 Sep 2021 18:35:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 97F006067A
 for <buildroot@lists.busybox.net>; Sun, 12 Sep 2021 18:35:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id G2A2f4cac1CR for <buildroot@lists.busybox.net>;
 Sun, 12 Sep 2021 18:35:05 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8E061605E1
 for <buildroot@buildroot.org>; Sun, 12 Sep 2021 18:35:05 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id i23so11090092wrb.2
 for <buildroot@buildroot.org>; Sun, 12 Sep 2021 11:35:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9sJSFLgL4jp7gFhX5qS0jpBF48J+LBXn4bUmwwAH6oU=;
 b=Q685gysIPuyJwY+U/X1JR9wc5Bp/0MfiA2mw4bXzEqYuGoZbAMWX5TGg81eH0+/3Pn
 YK2J/sbNv8djynOpNoJO/pdnfM00z1SPXNQfhIhJCoUVkhMeL9yPSfJKg+gELqo/p7a+
 OiPF6goHV84Hak/sxifdX9hcklY/7FVh4DiZvs1y+trlsSzwfrRLvS6wsZG0LHMXTeOw
 CtgbaNEYJvBIDRT3DQVS5Mz1a9pIOxHQQdLjIMwNeB68vXmFmnV9BAg2d8OYeNqFYExK
 kAeJr5ro2FUUIBKA4bfGkL+8cia24x4FfFxJp03b6TEywYbpLhg6QE4xB2S7E1drIfZT
 hHaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9sJSFLgL4jp7gFhX5qS0jpBF48J+LBXn4bUmwwAH6oU=;
 b=mPlhGpyCo9ddRBRUIMby1O8Lv3oYMy2CUg2XOHt+oc3t7VUkxj0uPigM49tZ28jGJ7
 /8TKLK2Csk7+y4V7RpNARVqFQTQR9becfEPws5CP8h8tjqkMrN2k36FS2/+Cq9uJ8xZy
 LdWEi1eAkMI+wvVUHiTP9XZOzDCxiVpOnDqUn7JwNM42WG3Ee6VgwW/X+qYeoxrcDivs
 jEwuGSgSr0BDssqts/gXllJ3SMJJpEKKSCElxdWwLaLFWfcXkE3hXueM+4e8mF5GxGgw
 BEyZwzO7FrF2QHTMzgIKfbaCAY4bOOQQd9/mcOqMojKXKazhAtlZDX/39YTNNSQcX+s4
 bh0g==
X-Gm-Message-State: AOAM532CkBeKmzBAtSqT7B3ZAX8leaWJwCKddw4IiOvdXZyYJzx3Lf+u
 A+/qKotECt5iV1SFSboen1zzziO9mQQ=
X-Google-Smtp-Source: ABdhPJwqHy3lfigPz3AbGVtaDY3ypht4haWOPmJTj/GZ9EU+/dAhitqyiqq9UCL8UWFr8QrCemNA5w==
X-Received: by 2002:adf:ed82:: with SMTP id c2mr845374wro.203.1631471703493;
 Sun, 12 Sep 2021 11:35:03 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-2139-166.w92-167.abo.wanadoo.fr.
 [92.167.218.166])
 by smtp.gmail.com with ESMTPSA id c2sm5189240wrs.60.2021.09.12.11.35.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Sep 2021 11:35:02 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 12 Sep 2021 20:34:53 +0200
Message-Id: <20210912183453.2179183-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/vim: security bump to version
 8.2.3432
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

- Fix CVE-2021-3770: vim is vulnerable to Heap-based Buffer Overflow
- Update hash of README.txt due to changes not related to license:
  https://github.com/vim/vim/commit/f2a44e5c48b029666ded556e2ab052dfc1266d62
  https://github.com/vim/vim/commit/89a9c159f23fb7b3e24e6d09068adfc24a73afcb

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/vim/vim.hash | 4 ++--
 package/vim/vim.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/vim/vim.hash b/package/vim/vim.hash
index eb5928e91c..ce04e5cf5d 100644
--- a/package/vim/vim.hash
+++ b/package/vim/vim.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  8a72323817210daf40abe545bdf7637591b9b541a0fb3560baed76e436132dba  vim-8.2.0000.tar.gz
-sha256  accdbd6761e7dd7e580545fe30f3a5a7707d50073aec4b8afef85c30fc9c031b  README.txt
+sha256  12cce47b81e12779b7d58faf879633be1b668f54a5417a5a24adac50413b3b3c  vim-8.2.3432.tar.gz
+sha256  96970b67f9cb38b0e759946cff22562a3c4b11ce78f62f2117d5e7ecded9ab4d  README.txt
diff --git a/package/vim/vim.mk b/package/vim/vim.mk
index 36cb59331a..f1ed3c342d 100644
--- a/package/vim/vim.mk
+++ b/package/vim/vim.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-VIM_VERSION = 8.2.0000
+VIM_VERSION = 8.2.3432
 VIM_SITE = $(call github,vim,vim,v$(VIM_VERSION))
 VIM_DEPENDENCIES = ncurses $(TARGET_NLS_DEPENDENCIES)
 VIM_SUBDIR = src
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
