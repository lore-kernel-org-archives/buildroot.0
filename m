Return-Path: <SRS0=m+kO=QD=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83C90C433FE
	for <buildroot@archiver.kernel.org>; Tue, 16 Nov 2021 18:00:57 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E94B961A08
	for <buildroot@archiver.kernel.org>; Tue, 16 Nov 2021 18:00:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E94B961A08
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8D98A60751;
	Tue, 16 Nov 2021 18:00:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4fC8THbZz3zm; Tue, 16 Nov 2021 18:00:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 44CDD60782;
	Tue, 16 Nov 2021 18:00:54 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A609B1BF3FB
 for <buildroot@lists.busybox.net>; Tue, 16 Nov 2021 18:00:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9303140142
 for <buildroot@lists.busybox.net>; Tue, 16 Nov 2021 18:00:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KINip57e67MU for <buildroot@lists.busybox.net>;
 Tue, 16 Nov 2021 18:00:49 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C343D400BD
 for <buildroot@buildroot.org>; Tue, 16 Nov 2021 18:00:48 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 n33-20020a05600c502100b0032fb900951eso2689885wmr.4
 for <buildroot@buildroot.org>; Tue, 16 Nov 2021 10:00:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=mZUYjKX44SR5zrSczXdzRc/VDUMk8qiXAieL9rbN6uc=;
 b=JBB/am47mYxj49O2e8zUXxH8UtyrqMaboooYp7/diRZEt/JeYhuRUR+sGiYJMVnP2a
 uGU8J5eVW8o63ud7oYhRF6fL/ooeqjKvwh4P0XW4zzCf0fuBMGNfwPLukBNYKQMuRdCL
 idKVlKIgkjFy50KFaUMcAsdF+uDwhKthcSBTNeHQ5ybNt8AyLnIo7Bvx5VGSswLUIokK
 qgSa6/3Iz+mRBpfEu8PxKkMBsSYDQWkqykLCdToBy220Mt7h5ATQjsy03CPSGYmfIt3k
 Jmg19vmaWgew7+a3XMzT9Ylq+qn3e628vcB/nvrTnDcJ8o4KXQGlU8Q9g9m+ltl39Wzy
 W8TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=mZUYjKX44SR5zrSczXdzRc/VDUMk8qiXAieL9rbN6uc=;
 b=x/odez6Q4MQjuru98aGf+cPVjPl47VvAim7sL54RY37C7isP7412FrwHsnrOZAh14D
 Tv1PqYJvQ/MKFMYb1l4Al9UdkbpN00Kb2pTfD7H1VZzF2/3lEUeOm3R6TmQEcb93jWPd
 BwOtkeQo00b3UvolpmCU1bSBGbuphHs+9h4AtqNGVDaQYs2ip4j6dcc/4eiYdiZmVs1o
 4GiYyo33p8yEAO8NdMLohG06kPB1j27kLLWZ2w0k5BtJuhzEILC+gAwZtroDx8nKo6nM
 uuU+Z/STYG0JRiocTLIbM0rXNY01B7hPqAGT1jXSTPEoK2LIfvXrZ586EswwRvwZia5w
 j4uQ==
X-Gm-Message-State: AOAM532xO67H8/ceCEOKsSXh59Bv3bhlVusXCpeiXJW6OR0sFSBCNQjw
 rmL2nKDFzOYHdAgSs77z9I3bvGzkRqv5Kw==
X-Google-Smtp-Source: ABdhPJyn5KwJkdnOlZgWYAIHA6XdfoSffc5gSWKUTUVyYR9TxYRZJAatXLPPFC9pLicV26lJbQJ8mA==
X-Received: by 2002:a05:600c:2f01:: with SMTP id
 r1mr10089536wmn.153.1637085646869; 
 Tue, 16 Nov 2021 10:00:46 -0800 (PST)
Received: from scaer.home ([2a01:cb19:8b51:cb00:e176:4ed7:f33:d40f])
 by smtp.gmail.com with ESMTPSA id u16sm2934917wmc.21.2021.11.16.10.00.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Nov 2021 10:00:46 -0800 (PST)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Tue, 16 Nov 2021 19:00:41 +0100
Message-Id: <20211116180041.1047747-1-yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] boot/uboot: kconfig needs the toolchain
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Starting with uboot 2021.10, with upstream commit 473fc279c89 (kconfig /
kbuild: Re-sync with Linux 4.20), the kconfig in uboot now needs the
compiler to detect its features.

Like was done for linux in 3fc990a7983 (linux: kconfig needs the
toolchain) and barebox in 1c1a629d814 (boot/barebox: kconfig needs the
toolchain), add the toolchain to the kconfig dependencies of uboot.

Reported-by: Davian on IRC
Reported-by: Xogium on IRC
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 boot/uboot/uboot.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index a10e224501..9661f901ea 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -525,7 +525,11 @@ UBOOT_DEPENDENCIES += \
 $(eval $(generic-package))
 else ifeq ($(BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG),y)
 UBOOT_MAKE_ENV = $(TARGET_MAKE_ENV)
+# Starting with 2021.10, the kconfig in uboot calls the cross-compiler
+# to check its capabilities. So we need the toolchain before we can
+# call the configurators.
 UBOOT_KCONFIG_DEPENDENCIES += \
+	toolchain \
 	$(BR2_MAKE_HOST_DEPENDENCY) \
 	$(BR2_BISON_HOST_DEPENDENCY) \
 	$(BR2_FLEX_HOST_DEPENDENCY)
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
