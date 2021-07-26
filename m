Return-Path: <SRS0=wdlY=MS=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E140C4338F
	for <buildroot@archiver.kernel.org>; Mon, 26 Jul 2021 08:45:56 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2A9A260C41
	for <buildroot@archiver.kernel.org>; Mon, 26 Jul 2021 08:45:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2A9A260C41
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E1C2540332;
	Mon, 26 Jul 2021 08:45:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UHSswWvpoJP9; Mon, 26 Jul 2021 08:45:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2516F40355;
	Mon, 26 Jul 2021 08:45:54 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id BA7651BF293
 for <buildroot@lists.busybox.net>; Mon, 26 Jul 2021 08:45:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A9D67607B3
 for <buildroot@lists.busybox.net>; Mon, 26 Jul 2021 08:45:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id X2GXIDoCcnVp for <buildroot@lists.busybox.net>;
 Mon, 26 Jul 2021 08:45:52 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 09A01607AF
 for <buildroot@buildroot.org>; Mon, 26 Jul 2021 08:45:51 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 m20-20020a05600c4f54b029024e75a15716so4776080wmq.2
 for <buildroot@buildroot.org>; Mon, 26 Jul 2021 01:45:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=xCqm6Kqg3dY2yVJX2J/KomVr0eP/j30iC4ptaxUBynk=;
 b=Gj6vxq7t4bQxKzWuKDk58hWLUSBkkhw9wJoDZ6wPLABvp5G50fAocD3Bvsz/Pc6C9c
 DX8VX/3SqfJt0GbBlJb0tMefp7L6jXiaBgPPbHDj9dvPd9zIZBhgngkc8joZc/zGZmFf
 lb6DgcsDZYWFwdo1NfgIWLyinY78EfDeA/o1kNoJ50IQNfrygGjXBUXnlFVnHW+xU4ud
 t6v0dv5KBGZNdGvBoq+cFLWiYd7T/6ME9wHkjCvyq5svPPoc55lX/0WVZYzb2I7jOsmj
 Az5wsLCnI91O3UJHMgOLXjqOR9MyV5Cg+O9yQBIIne2+4SnAjpST6VIPx2N9HWawszW/
 EybA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=xCqm6Kqg3dY2yVJX2J/KomVr0eP/j30iC4ptaxUBynk=;
 b=gJKsVo62g6mRSZTWoFP6Rm7wQvpLzYLcRlSvYCqJhhSEL0ABa92bk3UIe8DyON2/WA
 u7JDQi4ybbJWbAsumGGoprpIMSPK3JQfcKPbGFs9W8KBGVa3x0OAeWexBSAwTKvpM8Nj
 rMpBvrKIECRsdD9bQoC5C4TgJr6QPLZj9Ug9yHWCilpGcG1RVwmALFxnNzZui8vnZQ41
 Exj4bode8cdgLDQZVQeCQXCGjiIyif/MAIu0oaWyDJaa8Hz4BYmOrpgYYvKWTxGen+g6
 IWbpSWAtF8rJOmZukxMVPYNZJXr4HnHclGP43x7pE5MBB48W1BX/ymSWyLPkE7FRVOzj
 3kyQ==
X-Gm-Message-State: AOAM532zsIFxabs7fEPf/Cb/njluvcH0wSgTXpOfE8xaInfgkvG4IyfN
 SDsf+eH4/iA/V5pkL4zen58r15tJSiyeXQ==
X-Google-Smtp-Source: ABdhPJwsOAE7CatqEWGfjYh6pA/3EaMLTWZ1SorkiUqmCQjX4VRvtFaGD1nbx0MPATzPTcWYdOaq5Q==
X-Received: by 2002:a05:600c:20b:: with SMTP id
 11mr26569987wmi.112.1627289150101; 
 Mon, 26 Jul 2021 01:45:50 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-1383-171.w86-229.abo.wanadoo.fr.
 [86.229.230.171])
 by smtp.gmail.com with ESMTPSA id h4sm4618442wru.2.2021.07.26.01.45.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Jul 2021 01:45:49 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 26 Jul 2021 10:45:44 +0200
Message-Id: <20210726084544.1708696-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/irqbalance: add SELinux module
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
Cc: Karoly Kasza <kaszak@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Support for irqbalance is added by the services/irqbalance module in the
SELinux refpolicy.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/irqbalance/irqbalance.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/irqbalance/irqbalance.mk b/package/irqbalance/irqbalance.mk
index b099f7c6e2..eb7c3e9f3b 100644
--- a/package/irqbalance/irqbalance.mk
+++ b/package/irqbalance/irqbalance.mk
@@ -8,6 +8,7 @@ IRQBALANCE_VERSION = 1.7.0
 IRQBALANCE_SITE = $(call github,irqbalance,irqbalance,v$(IRQBALANCE_VERSION))
 IRQBALANCE_LICENSE = GPL-2.0
 IRQBALANCE_LICENSE_FILES = COPYING
+IRQBALANCE_SELINUX_MODULES = irqbalance
 IRQBALANCE_DEPENDENCIES = host-pkgconf libglib2
 # Autoreconf needed because package is distributed without a configure script
 IRQBALANCE_AUTORECONF = YES
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
