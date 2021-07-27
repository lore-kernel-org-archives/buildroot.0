Return-Path: <SRS0=yDzA=MT=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0256DC4338F
	for <buildroot@archiver.kernel.org>; Tue, 27 Jul 2021 21:54:28 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AE41B60F9C
	for <buildroot@archiver.kernel.org>; Tue, 27 Jul 2021 21:54:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org AE41B60F9C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7EA0F40454;
	Tue, 27 Jul 2021 21:54:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rQdKCSG7wQk2; Tue, 27 Jul 2021 21:54:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B8487403CB;
	Tue, 27 Jul 2021 21:54:25 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6EFFE1BF2B1
 for <buildroot@lists.busybox.net>; Tue, 27 Jul 2021 21:54:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5E9C860736
 for <buildroot@lists.busybox.net>; Tue, 27 Jul 2021 21:54:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uaG4sSnvlakk for <buildroot@lists.busybox.net>;
 Tue, 27 Jul 2021 21:54:23 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 62142606AE
 for <buildroot@buildroot.org>; Tue, 27 Jul 2021 21:54:23 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id j2so35999wrx.9
 for <buildroot@buildroot.org>; Tue, 27 Jul 2021 14:54:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=fj34HCB+9Xp122sOQzmuJolC3aYVl7Bd6BPsxssYsn4=;
 b=ZkBzKKvA82m/aga7zpDxxxotpJR4By1kXj4sV2TCSrEbh2EOJmoA3exwxh+2qEGt2S
 /InDJtCsUMpnploHmPO45B3Qx7lhymkrS71Zs0fNU160rNG/Nmxv2DZpi14Tut4Fuyun
 Ul95Bs8EYZBfsYH5x2vL21+to9O6pDaYiX6gMwRJ5dipx1kXuLvjNQwldpngsZWdOkh7
 K8xj0Sko9EiamJCyzUqIPLvUly5YrGE1/EP5BTxRAAFkwGgfhIgnwr8nTetmuIqPmZhB
 yclaKtVXYhdS8cGzshZ0tE0BL6I+vmT+0BMZuFiPBYJnk4CpaEEFQBbVfS6Y9bzCCLfJ
 A8kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=fj34HCB+9Xp122sOQzmuJolC3aYVl7Bd6BPsxssYsn4=;
 b=OYoK+6YEpdo5xUIYep0bHTfn8mJUu0ythaDLk1QeYxH7IUP2vQqJylt11RfZHdxarS
 9CPWp8492XuQ27g3hjplksOrB+G8g0zzrtSl/QbSDszHQopDDnKej6MQjny1nEdhLbST
 78+N9Ho7l2eQnsC0Za71ke7s6MxiHcFvNSCWFM8Z0IYXoMQ+HX7kF/dc54TvttJdRLiF
 /e13TxaSL1B+qhf7ncUCY4bSvCUk45uPC/GBzCMY+hbAnfDfLKU5VoIB/Ilvp/HV51Oe
 7PqLQ3v1LFrPknQm6LJPdNCU9NRZcncqm7kosdSlKNYZwI2NfSX12qHjKFN7nzXbyhig
 g99g==
X-Gm-Message-State: AOAM533JxdIsA9C3O+PYpCJfOydGD6jo1muKpY9yrnR4/H2+/TMxMspd
 s2aciISucLqvfiBvhy1uClnGHEP6vrG/mw==
X-Google-Smtp-Source: ABdhPJynhKHhJGdPlY6LQAXJ6CmfvAAPG+w24pzOt8vOU3QfDlCsFnc1If2dtLaryLoCLMxkG2QBvg==
X-Received: by 2002:adf:ecc9:: with SMTP id s9mr20459354wro.306.1627422861415; 
 Tue, 27 Jul 2021 14:54:21 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-1383-171.w86-229.abo.wanadoo.fr.
 [86.229.230.171])
 by smtp.gmail.com with ESMTPSA id l5sm1650074wrc.90.2021.07.27.14.54.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Jul 2021 14:54:21 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 27 Jul 2021 23:54:13 +0200
Message-Id: <20210727215413.3397453-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/opencv4: bump to version 4.5.3
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

https://github.com/opencv/opencv/wiki/ChangeLog#version453

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/opencv4/opencv4.hash | 2 +-
 package/opencv4/opencv4.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/opencv4/opencv4.hash b/package/opencv4/opencv4.hash
index 3f187b87d5..b8e38d333a 100644
--- a/package/opencv4/opencv4.hash
+++ b/package/opencv4/opencv4.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  e27fe5b168918ab60d58d7ace2bd82dd14a4d0bd1d3ae182952c2113f5637513  opencv4-4.5.1.tar.gz
+sha256  77f616ae4bea416674d8c373984b20c8bd55e7db887fd38c6df73463a0647bab  opencv4-4.5.3.tar.gz
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/opencv4/opencv4.mk b/package/opencv4/opencv4.mk
index 94ff77f14c..20e192fe7c 100644
--- a/package/opencv4/opencv4.mk
+++ b/package/opencv4/opencv4.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPENCV4_VERSION = 4.5.1
+OPENCV4_VERSION = 4.5.3
 OPENCV4_SITE = $(call github,opencv,opencv,$(OPENCV4_VERSION))
 OPENCV4_INSTALL_STAGING = YES
 OPENCV4_LICENSE = Apache-2.0
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
