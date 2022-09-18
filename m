Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA3E8C32771
	for <buildroot@archiver.kernel.org>; Sun, 18 Sep 2022 08:05:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8A6DE60D69;
	Sun, 18 Sep 2022 08:05:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8A6DE60D69
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id O8W98181z-aG; Sun, 18 Sep 2022 08:05:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9381E60A83;
	Sun, 18 Sep 2022 08:05:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9381E60A83
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E67591BF282
 for <buildroot@lists.busybox.net>; Sun, 18 Sep 2022 08:05:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C6A1141C41
 for <buildroot@lists.busybox.net>; Sun, 18 Sep 2022 08:05:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C6A1141C41
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id De5lbU0rEWhT for <buildroot@lists.busybox.net>;
 Sun, 18 Sep 2022 08:05:53 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 619C341C3C
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 619C341C3C
 for <buildroot@buildroot.org>; Sun, 18 Sep 2022 08:05:53 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id n10so11895297wrw.12
 for <buildroot@buildroot.org>; Sun, 18 Sep 2022 01:05:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:x-gm-message-state:from:to:cc:subject:date;
 bh=onka4ehKiqSWbllsXp44xNLN2ew74z8PkgavbFb338w=;
 b=5/R3u8VR+Fo7e/7MxSwFQoySPpBbXRh6AwZjWM42Imxb4RYxQALG35F33UjKK5HIN1
 OJ4MUeqtmIwy+bEq9P+a9AlpPreNzXr8RfRjsXbgAEqnvEjwQmx4FzpLx0W5LQaVeJuz
 BQ+YHdoHetw0T63556s0fgG+R7UEf3gKGx21zpjIBigJ6lnO3zNCs1ZiPOeAGa4/HCfE
 fDJ+wE41se/YHNcUFMokTdJRxgoyZYpQldZc1c9tZ7ioOoiPKLtNyuR4Z5UJrY6eRlNc
 /8M2/xbOO1oFlreE9cJXB3qte3QlNw77SJU+tc+CPwFz1iwS9WMIrOrnB7vJT1avT2V9
 M+Zw==
X-Gm-Message-State: ACrzQf0nEZPD1Q1CVLolZ9uIEa6HTGAth2qMpptk3nKh0hlTAyqUSmiY
 ezpdDTz8OWsp5RFmCNd0P6mSWGDpDV4=
X-Google-Smtp-Source: AMsMyM6Vuvvjy1Fx+8BjCst6tBaXiEkVLsfUE0JtOgegfnrzqqtTD7/aZJC2FohucPCVV53zVDPHJA==
X-Received: by 2002:a05:6000:69d:b0:22a:fa56:86b9 with SMTP id
 bo29-20020a056000069d00b0022afa5686b9mr964337wrb.193.1663488351470; 
 Sun, 18 Sep 2022 01:05:51 -0700 (PDT)
Received: from scaer.home ([2a01:cb19:8b51:cb00:2a18:6673:cb9f:3864])
 by smtp.gmail.com with ESMTPSA id
 m17-20020adfe951000000b0022afddab5dfsm136479wrn.7.2022.09.18.01.05.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 18 Sep 2022 01:05:48 -0700 (PDT)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 18 Sep 2022 10:05:45 +0200
Message-Id: <20220918080545.2889509-1-yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:from:to:cc:subject:date;
 bh=onka4ehKiqSWbllsXp44xNLN2ew74z8PkgavbFb338w=;
 b=NKUMUAvFN6WtfxwAJhXpvV1eqPPdBq0oawiCg3NB+0hfLub1XDBWZkku1Bfd5np4fv
 S2TWwXq0HlzJ5AaIa53cPUrmHWecOBSGvuNdxsq8TWZPmeiUwb5Yc4bZ+Fnd+eQTUbYV
 H3d1WtdQGMh6ndk5maQCDMx3OfzXyGrBpT9KDnKMEg0H+/bYHyw6d0H2TyAQIecMGamI
 V53KOqhgAk5yBHP7oouI8mZl50nByuEVZLeJGKE2uX/hRYEdk3wsAHHgKUNYSsmF8dcR
 KHGDu9q4gAX3crf8Qe/dqYL+kChQRQpUHg0gekc7mU91GJXUE/JqZSe1iUDziCB2TZCW
 6PmQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=NKUMUAvF
Subject: [Buildroot] [PATCH] fs/cpio: add legacy entry for renamed option
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
Cc: Adam Duskett <aduskett@gmail.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Thierry Bultel <thierry.bultel@linatsea.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Commit 4fd5d80e9dc0 (fs/cpio: accept a list of dracut.conf files) was
initially submitted before the first release wth dracut support was
made, so it took the liberty of renaming the option without introducing
the corresponding legacy entry.

But the patch was eventually applied after a release was made with
dracut support. In that case, renaming an option requires that the old
option be added to legacy, but that was understandably missed.

Fix that now.

We had two potions: revert to the previous name and add no legacy entry,
or keep the new name and add a legacy entry.

We choose the latter, because the new name with the plural form really
denotes that more than one file may be specified, and because we do not
expect too many people to be using that feature yet, so the burden of
updating should not impact too many (and it is very easy to update
anyway).

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Cc: Thierry Bultel <thierry.bultel@linatsea.fr>
Cc: Adam Duskett <aduskett@gmail.com>
---
 Config.in.legacy  | 13 +++++++++++++
 fs/cpio/Config.in |  1 +
 2 files changed, 14 insertions(+)

diff --git a/Config.in.legacy b/Config.in.legacy
index 631b31689b..b0aa8dff90 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,19 @@ endif
 
 comment "Legacy options removed in 2022.11"
 
+# Note: BR2_TARGET_ROOTFS_CPIO_DRACUT_CONF_FILE is still referenced
+# from fs/cpio/Config.in
+config BR2_TARGET_ROOTFS_CPIO_DRACUT_CONF_FILE
+	string "dracut configuration file option renamed"
+	help
+	  The option was renamed to make it clear it accepts more
+	  than one file.
+
+config BR2_TARGET_ROOTFS_CPIO_DRACUT_CONF_FILE_WRAP
+	bool
+	default y if BR2_TARGET_ROOTFS_CPIO_DRACUT_CONF_FILE != ""
+	select BR2_LEGACY
+
 config BR2_PACKAGE_GPSD_OLDSTYLE
 	bool "gpsd oldstyle removed"
 	select BR2_LEGACY
diff --git a/fs/cpio/Config.in b/fs/cpio/Config.in
index 94a826f9e4..6368dcccb5 100644
--- a/fs/cpio/Config.in
+++ b/fs/cpio/Config.in
@@ -31,6 +31,7 @@ if BR2_TARGET_ROOTFS_CPIO_DRACUT
 
 config BR2_TARGET_ROOTFS_CPIO_DRACUT_CONF_FILES
 	string "dracut configuration files"
+	default BR2_TARGET_ROOTFS_CPIO_DRACUT_CONF_FILE if BR2_TARGET_ROOTFS_CPIO_DRACUT_CONF_FILE != ""  # legacy
 	default "fs/cpio/dracut.conf"
 	help
 	  Space-separated list of Dracut configuration files. They
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
