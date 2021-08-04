Return-Path: <SRS0=sxUg=M3=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1F98C4338F
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 10:32:47 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 87C5960FC3
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 10:32:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 87C5960FC3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 322584063A;
	Wed,  4 Aug 2021 10:32:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 03iDz6G2rK7d; Wed,  4 Aug 2021 10:32:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 90F7D40626;
	Wed,  4 Aug 2021 10:32:45 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id BCAC51BF418
 for <buildroot@lists.busybox.net>; Wed,  4 Aug 2021 10:32:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B951E83B9C
 for <buildroot@lists.busybox.net>; Wed,  4 Aug 2021 10:32:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xN2hMFtjNXUk for <buildroot@lists.busybox.net>;
 Wed,  4 Aug 2021 10:32:43 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C95E383B5D
 for <buildroot@buildroot.org>; Wed,  4 Aug 2021 10:32:42 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 m28-20020a05600c3b1cb02902b5a8c22575so941175wms.0
 for <buildroot@buildroot.org>; Wed, 04 Aug 2021 03:32:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+vR9s/stLUOMmq8HBdKHCTx/SNBgdP75fLXNaqBIHw0=;
 b=ntrRHQ1iz+FrqKU/zuTmoO2vk2cSrDycnXTMhGiGTTRWSmKgT++5aux2X1QYWlg4qf
 9piFmlY0i4oseksL0GWY0GaSfI8GQX6sBErNbyIfel8q55ZCn0zV+dalbBLc5j6NGGFz
 Bntg3XpCEuZ4ijk9EzRrda5vqIoYnY6/80RTrw9pf8N6iGdXNPIF7qt38+AjKNlUpU3Y
 y6vWl/wOtj70UlW87mnOK3ZmQJQpeKhl5Jf0DBCrVFiyVpIS9i2R5tbbQZFOb1LVjrXG
 C6qFrp5udn7mPn5zeoK6jeVXjFdGHbW5CrSISwTffZRgFFOttDpX2cCwymWtgPHz84Z+
 eTQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+vR9s/stLUOMmq8HBdKHCTx/SNBgdP75fLXNaqBIHw0=;
 b=LCtpfb+exIZPdz+KCKD54/c5bGTxBtqN2BSAUmUQwc3AcfCmLS5nP/zJjsECxDx9rZ
 47HZuYNrvTh/CNquO+vZPu6FBmLzT4kMlZql1usnWSleplR3fxjv/ShXphgBll1De7HU
 xqu4j/sCtWtrzA1sMKSTomHNnofPL+S2B8swfXlY90tCkOjyixNfyq3ZJjEJbpyAujVW
 giMofGmbMb1wDnSW55tvN+MBZnCAYUUnDVdAQFMUI/PSBaK+09UrJSMEuzam4xV8yYCV
 5yCreTvycb1QWt+a5vWnPlmdxN7Nq1j8pfnxnMD/0R/zIi1uhTu/VZ7nBdpk+EhMeAVO
 NuPQ==
X-Gm-Message-State: AOAM532BDMdUp8fscBvbDh7MVwtnmbcDMqEdHbopKSs17tnei0qfp9op
 aOwn9eAcjuZabUYTj0YUplfERtzK33EU0Q==
X-Google-Smtp-Source: ABdhPJzwZZ9MdHTR9X1NAh36zftnc6DGKw7MA17mwAkas147UByMX+Wq/0EcTwOrE5X4nXifYaFMpA==
X-Received: by 2002:a1c:c9:: with SMTP id 192mr25865185wma.128.1628073160804; 
 Wed, 04 Aug 2021 03:32:40 -0700 (PDT)
Received: from kali.home (pop.92-184-97-247.mobile.abo.orange.fr.
 [92.184.97.247])
 by smtp.gmail.com with ESMTPSA id v5sm2066648wrd.74.2021.08.04.03.32.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Aug 2021 03:32:40 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  4 Aug 2021 12:32:32 +0200
Message-Id: <20210804103232.935087-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/wine: add SELinux module
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
Cc: =?UTF-8?q?Andr=C3=A9=20Zwing?= <nerv@dawncrow.de>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Support for wine is added by the apps/wine module in the SELinux
refpolicy.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/wine/wine.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/wine/wine.mk b/package/wine/wine.mk
index 08eadb5b7c..c925a58632 100644
--- a/package/wine/wine.mk
+++ b/package/wine/wine.mk
@@ -10,6 +10,7 @@ WINE_SITE = https://dl.winehq.org/wine/source/6.0
 WINE_LICENSE = LGPL-2.1+
 WINE_LICENSE_FILES = COPYING.LIB LICENSE
 WINE_CPE_ID_VENDOR = winehq
+WINE_SELINUX_MODULES = wine
 WINE_DEPENDENCIES = host-bison host-flex host-wine
 HOST_WINE_DEPENDENCIES = host-bison host-flex
 
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
