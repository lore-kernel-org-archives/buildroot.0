Return-Path: <SRS0=Qe4W=PG=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28E9AC4332F
	for <buildroot@archiver.kernel.org>; Mon, 18 Oct 2021 21:50:52 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C871861027
	for <buildroot@archiver.kernel.org>; Mon, 18 Oct 2021 21:50:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C871861027
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9AEED40600;
	Mon, 18 Oct 2021 21:50:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nr_4epsGPMD3; Mon, 18 Oct 2021 21:50:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id F1A18404E4;
	Mon, 18 Oct 2021 21:50:49 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id CFC671BF36A
 for <buildroot@lists.busybox.net>; Mon, 18 Oct 2021 21:50:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BED58404E4
 for <buildroot@lists.busybox.net>; Mon, 18 Oct 2021 21:50:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0GADt5zwGpxe for <buildroot@lists.busybox.net>;
 Mon, 18 Oct 2021 21:50:48 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 213E9404B0
 for <buildroot@buildroot.org>; Mon, 18 Oct 2021 21:50:48 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 67-20020a1c1946000000b0030d4c90fa87so1172270wmz.2
 for <buildroot@buildroot.org>; Mon, 18 Oct 2021 14:50:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=u3AFrjSQ8TFvUrDOOwVYQRO9T2XG5Ohqbk4iSQK6V7U=;
 b=H8HZMK1/Hvx9NfhK6MEQNkhGmDNF46cahZ2zFlDesBtDegODRYEJ2uw2Z5JW2vLY2l
 g8DCcEZ7vg4onEFCI7bnQVynHTADwPN4puJAPArpsIysD+znkYIpvhQs8nNo2k80ufc+
 76GiPX38Egc2TS9AZRrNGdmK+cJTQGDYp2jZWFZutwrQRnFOFB+Hqh4/7PTdvIBsBj/j
 Qe0QHGBD7ncaD8GSgj0aF9rryyi3o4jKmKBih9/ftQ8jZfkHGUToccbv1IhGnbqQ0YQc
 ISHJ1OPXeb/8sI1MkfgV86J9tFSriPhoG4rgqNqAyjPARRlTM2hc07tTVORuT34A3A/f
 /Xxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=u3AFrjSQ8TFvUrDOOwVYQRO9T2XG5Ohqbk4iSQK6V7U=;
 b=2oYqP6CJeQiCophh4KpFRKTk7qdbb+3Sgnv2vmuF8a9qLfiN0pMruEhJniP8MnPnWx
 431Tto2XOlAKN7hD76ZKzTN2WAl8VEx5IBp1YDj2mG+UIF4leX0Ue/ZOwy01bEi2edh6
 O1W9KA/2Aqgh/Peo7EkTeJG3rQOXHs7tjRt5dh/y5sbzF71nlG5b1TCPeVSwEPquzch/
 K665LKaTXQl55rGEjaLCFmZm8IJDt/1hBUmQ0UZ4A+7xX/jUR59SIOS7ibx1/lu0MZ/e
 Ib1TyldxLPl3M7Otj163UYV9geDZUUFsdKA983/8GDdeYJzndnM/8wTSwRhzA9SkWdEf
 EUqw==
X-Gm-Message-State: AOAM531bQ+suBfrdT7n79Vcgz6QZiJF826DMQOjnXy1HIM/dFPEKSUE3
 0KOqJ8smXZo/TRV8ylqOOq3tBuwqKr0=
X-Google-Smtp-Source: ABdhPJwXWlcQGDHGTNJYqtLq9hSmO/WRkwidOyvr/iHRAI6rGRAE4ZX+8zfaRbPtIIsNk19jOCJbqg==
X-Received: by 2002:a05:600c:1d1a:: with SMTP id
 l26mr1642487wms.98.1634593846203; 
 Mon, 18 Oct 2021 14:50:46 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-1732-95.w86-253.abo.wanadoo.fr.
 [86.253.44.95])
 by smtp.gmail.com with ESMTPSA id y5sm13052788wrq.85.2021.10.18.14.48.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Oct 2021 14:49:16 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 18 Oct 2021 23:47:27 +0200
Message-Id: <20211018214727.1514701-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/smcroute: don't override
 dependencies
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
Cc: Matt Weber <matthew.weber@collins.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Don't override SMCROUTE_DEPENDENCIES in a conditional

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/smcroute/smcroute.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/smcroute/smcroute.mk b/package/smcroute/smcroute.mk
index 96da0dc346..913647e7bf 100644
--- a/package/smcroute/smcroute.mk
+++ b/package/smcroute/smcroute.mk
@@ -13,7 +13,7 @@ SMCROUTE_CPE_ID_VENDOR = troglobit
 SMCROUTE_CONF_OPTS = --enable-mrdisc
 
 ifeq ($(BR2_PACKAGE_LIBCAP),y)
-SMCROUTE_DEPENDENCIES = libcap
+SMCROUTE_DEPENDENCIES += libcap
 SMCROUTE_CONF_OPTS += --with-libcap
 else
 SMCROUTE_CONF_OPTS += --without-libcap
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
