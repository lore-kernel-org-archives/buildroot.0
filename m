Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D75D9C4332F
	for <buildroot@archiver.kernel.org>; Thu, 29 Dec 2022 16:30:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 44AB660B20;
	Thu, 29 Dec 2022 16:30:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 44AB660B20
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id h1dTXuRlNISB; Thu, 29 Dec 2022 16:30:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 80A1560AA7;
	Thu, 29 Dec 2022 16:30:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 80A1560AA7
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1AB531BF39A
 for <buildroot@lists.busybox.net>; Thu, 29 Dec 2022 16:30:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E87CA402BC
 for <buildroot@lists.busybox.net>; Thu, 29 Dec 2022 16:30:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E87CA402BC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wgjr1xFt_GVs for <buildroot@lists.busybox.net>;
 Thu, 29 Dec 2022 16:30:52 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 891CD401E3
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 891CD401E3
 for <buildroot@buildroot.org>; Thu, 29 Dec 2022 16:30:52 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 z8-20020a05600c220800b003d33b0bda11so11725029wml.0
 for <buildroot@buildroot.org>; Thu, 29 Dec 2022 08:30:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=CE9ECQXHwmAtk/TS8CdICkSkxBsElv7IbmUpSBj6co0=;
 b=T4C7YpiWGGiBaDHBcGxex5m+dpt5rwonILs5ueZU+dO10tba+jv0sEt+x2LaJZJ5Y9
 WW7Z1YEHIMwuDyBYuqcOFqtMCZGO/4wMDkNztjwZlIP0yRAw3IBvZc05MMOq8rzff6hv
 R5tQZEXNnCJem9Z2bQvgXvymy8rjqu+Xo4a9JoNfsLv1PzhGwXagSIIW2cAyC68gcPig
 czWrAF24ntxs1tTKRX2+S3QznL3wE00SAkES8z8diREJ2zQfgrYNVfHa5FWM+DtwgxMA
 gVGItYpmxNmK8PWfZ0Rl1K/dgxVEbjlAn/SOIQCtiCrCZqHVt1EBohIV7y7mpiWIhM/+
 NdDA==
X-Gm-Message-State: AFqh2kr0FpPPmlPOyd+Tdz3EmgUiwISfmVMAVtnW2mS/QKGm0WPn+akn
 LyhUHOBy/BYtBM5/coFhkEP71ZkQhR8=
X-Google-Smtp-Source: AMrXdXv0L4q4h2Tj2Z2akMfX40boNpBjBZpCdP4rGWD2vU9b+JmJLudh5BAXi4/tFeE3RPPN1T9QtQ==
X-Received: by 2002:a05:600c:a0f:b0:3cf:7704:50ce with SMTP id
 z15-20020a05600c0a0f00b003cf770450cemr21079937wmp.38.1672331450408; 
 Thu, 29 Dec 2022 08:30:50 -0800 (PST)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 f6-20020a05600c154600b003d98a7aa12csm12008020wmg.16.2022.12.29.08.30.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Dec 2022 08:30:49 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 29 Dec 2022 17:30:45 +0100
Message-Id: <20221229163046.355738-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=CE9ECQXHwmAtk/TS8CdICkSkxBsElv7IbmUpSBj6co0=;
 b=UAHo7xO0/IwUTVknaI3pvxDOM2zDcV8R/DW5D1eJc+/qo4/OJNCtk8VSmj3mxaY2W+
 6OngDNSNsTbCGcqevyMQNU5x3WzFZAk0WKdTm4ucWcJKPLJFM32V56NPh5plIPEawlRg
 vG5G49V938uBvwqZgC+HvxDXvdR5NVdT4HQq8qXhqvBHsQrVXXoowJNnu9Fa1icD+D52
 6jqowbzvXNnU5kNKpLXJVhHj8k6jV9BpI/1PrP568pZ5imQckECy7lPeRj6WpXo7XuhP
 FLERbpeeJoy31/f/yhmbzL4cJXcHVQ6Rp2xq2BXbTnhDadLEhimAkXHViQHqXKglWn4j
 FWLQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=UAHo7xO0
Subject: [Buildroot] [PATCH v2,
 1/2] Revert "package/tiff: add webp optional dependency"
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

This reverts commit 3fd6ada8dbca3370b9bb67feb2971e637cb4b11f to fix the
following build failure raised because tiff is already an optional
dependency of webp:

package/tiff/tiff.mk:122: *** Recursive variable 'TIFF_FINAL_RECURSIVE_DEPENDENCIES' references itself (eventually).  Stop.

Fixes:
 - http://autobuild.buildroot.org/results/d8486cd1d5e56fb3719dc88b8aebc76c3e23cdc9

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/tiff/Config.in | 4 ----
 package/tiff/tiff.mk   | 7 -------
 2 files changed, 11 deletions(-)

diff --git a/package/tiff/Config.in b/package/tiff/Config.in
index b9e3656e6f..d1004d6668 100644
--- a/package/tiff/Config.in
+++ b/package/tiff/Config.in
@@ -72,10 +72,6 @@ config BR2_PACKAGE_TIFF_UTILITIES
 	help
 	  Install all tiff utilities.
 
-config BR2_PACKAGE_TIFF_WEBP
-	bool "WEBP compression"
-	select BR2_PACKAGE_WEBP
-
 config BR2_PACKAGE_TIFF_ZSTD
 	bool "ZSTD compression"
 	select BR2_PACKAGE_ZSTD
diff --git a/package/tiff/tiff.mk b/package/tiff/tiff.mk
index c2a4108f35..f0b56150b1 100644
--- a/package/tiff/tiff.mk
+++ b/package/tiff/tiff.mk
@@ -105,13 +105,6 @@ else
 TIFF_CONF_OPTS += --disable-tools
 endif
 
-ifeq ($(BR2_PACKAGE_TIFF_WEBP),y)
-TIFF_CONF_OPTS += --enable-webp
-TIFF_DEPENDENCIES += webp
-else
-TIFF_CONF_OPTS += --disable-webp
-endif
-
 ifeq ($(BR2_PACKAGE_TIFF_ZSTD),y)
 TIFF_CONF_OPTS += --enable-zstd
 TIFF_DEPENDENCIES += zstd
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
