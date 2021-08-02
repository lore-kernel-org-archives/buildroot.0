Return-Path: <SRS0=hSOo=MZ=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C76B3C4338F
	for <buildroot@archiver.kernel.org>; Mon,  2 Aug 2021 20:44:16 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 79AC560F35
	for <buildroot@archiver.kernel.org>; Mon,  2 Aug 2021 20:44:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 79AC560F35
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DCE0E405F0;
	Mon,  2 Aug 2021 20:44:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ocF-WEdXgQe6; Mon,  2 Aug 2021 20:44:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4A226405E4;
	Mon,  2 Aug 2021 20:44:14 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5DCA61BF303
 for <buildroot@lists.busybox.net>; Mon,  2 Aug 2021 20:44:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 494F2831A9
 for <buildroot@lists.busybox.net>; Mon,  2 Aug 2021 20:44:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Y7TBntNoucxJ for <buildroot@lists.busybox.net>;
 Mon,  2 Aug 2021 20:44:11 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 05AC283139
 for <buildroot@buildroot.org>; Mon,  2 Aug 2021 20:44:10 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id k4so12098743wrc.0
 for <buildroot@buildroot.org>; Mon, 02 Aug 2021 13:44:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=FBmzKiWULuzSed0hVzJyfqP+uJLDfq7pxXZ+gEFcxWM=;
 b=oVCFc7TM+AnUqJnYgQhSsdeB/zlMsAAQhJrh3GhCpVxh0vv4J85jU6UC4IrEr4I9yw
 8mDWWo0Z5yJf9k7PstjcjI4xG9XjPQT7I9Em7Zw2Wl0tFB4t/Azng45PrKffR42+cyZk
 uOpsDqR68DQAd/f82j3da3+WODor2Hk5sZ1Vk4HQD9pOmt9aDIGFBlPmbY7lg4d7w1mj
 oveXlNGVf/M2HX4PuOIef3PumZDsH35RMBNzDf2G0A5S+hbE4pBc8tJe50J+MIMSik5z
 2vchgcA34tmM8zUVVeKxnNLp6NnSO31iIaY8sejv5txgEdy8/BXiIhseysrk6zWOJYIa
 ee7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=FBmzKiWULuzSed0hVzJyfqP+uJLDfq7pxXZ+gEFcxWM=;
 b=X8jlLE5xhLD/SERnRriaVChjUkkvlZuS4loBZpyW2mPZo+CDf7Ou5hSZLlXREb+DB4
 NQNKgA9eGOlOzWDHIWsebc1/B2zxoCoCk8cJrXqWpUDrpPR0z3XBMp4OlBZwabFJzWvC
 vhZl7kA+K5ipoXfqVA5ZzLdIAVVTiZg26aRuOFxTOCM+jejwuyOHRZvoNCi/Pt2QHyNR
 +g4ZH9Pp2dCq7DTe6vpruut1WXbKWrHWzXVGOIC7olnEYInrj2NL5PXNfpG6bN7FI6Uh
 7oqFgRYbyzev6LueGwChG0FI31ExLUXJcJEbynlru/p6aMIseyfmtciCX01zWU02eseI
 X75Q==
X-Gm-Message-State: AOAM531MxeLAHCgONmRMXo1NDYvbsm1LeRR88sVJG7I46JpBRvCDKV2i
 n2q2O72h2ZFxpJNOFN0EPNDMH6fVCe5UdQ==
X-Google-Smtp-Source: ABdhPJzQ5E+B1ehOjJhZPm9uPH8DcEPrzP+QntxXDd4NHzcuUrRbX1AGquph9N+AEQl9pX/OHrNO0g==
X-Received: by 2002:a05:6000:1c4:: with SMTP id
 t4mr18846304wrx.79.1627937048962; 
 Mon, 02 Aug 2021 13:44:08 -0700 (PDT)
Received: from kali.home (pop.92-184-116-137.mobile.abo.orange.fr.
 [92.184.116.137])
 by smtp.gmail.com with ESMTPSA id n8sm402664wms.11.2021.08.02.13.44.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Aug 2021 13:44:08 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon,  2 Aug 2021 22:44:00 +0200
Message-Id: <20210802204400.1597406-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/openzwave: set back -fPIC
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

Set back -fPIC in CFLAGS which was wrongly removed as a side effect of
commit c5ca521e232eae31276e7a12d17f0cf9d9c0108f

Fixes:
 - http://autobuild.buildroot.org/results/161f53574697016ab8bdb91aaaf4a2be5410ebb0

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/openzwave/openzwave.mk | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/openzwave/openzwave.mk b/package/openzwave/openzwave.mk
index 9c28c0a13b..0f639635dd 100644
--- a/package/openzwave/openzwave.mk
+++ b/package/openzwave/openzwave.mk
@@ -23,7 +23,7 @@ OPENZWAVE_INSTALL_STAGING = YES
 # the correct directory otherwise openzwave will install configuration files in
 # $(PREFIX)/etc/openzwave.
 # Disable doxygen documentation.
-# Set {DEBUG,RELEASE}_CFLAGS to an empty value to remove -Werror.
+# Set {DEBUG,RELEASE}_CFLAGS to remove -Werror.
 OPENZWAVE_MAKE_OPTS = \
 	CROSS_COMPILE="$(TARGET_CROSS)" \
 	PREFIX=/usr \
@@ -31,8 +31,8 @@ OPENZWAVE_MAKE_OPTS = \
 	pkgconfigdir=/usr/lib/pkgconfig \
 	sysconfdir=/etc/openzwave \
 	DOXYGEN= \
-	DEBUG_CFLAGS= \
-	RELEASE_CFLAGS= \
+	DEBUG_CFLAGS="-fPIC" \
+	RELEASE_CFLAGS="-fPIC" \
 	USE_BI_TXML=0
 
 ifeq ($(BR2_PACKAGE_HAS_UDEV),y)
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
