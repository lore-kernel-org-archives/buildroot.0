Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AD8DCD37B4
	for <buildroot@archiver.kernel.org>; Sun, 17 Sep 2023 11:28:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 86AA340874;
	Sun, 17 Sep 2023 11:28:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 86AA340874
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FcaUoWi9gtFq; Sun, 17 Sep 2023 11:28:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7B11E40891;
	Sun, 17 Sep 2023 11:28:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7B11E40891
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B10231BF38D
 for <buildroot@lists.busybox.net>; Sun, 17 Sep 2023 11:28:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8A839610C2
 for <buildroot@lists.busybox.net>; Sun, 17 Sep 2023 11:28:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8A839610C2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Nm4Zq2T4GDcX for <buildroot@lists.busybox.net>;
 Sun, 17 Sep 2023 11:28:40 +0000 (UTC)
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6CB01610C1
 for <buildroot@buildroot.org>; Sun, 17 Sep 2023 11:28:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6CB01610C1
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-31ad9155414so3347140f8f.3
 for <buildroot@buildroot.org>; Sun, 17 Sep 2023 04:28:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694950118; x=1695554918;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=T+0YgBPvOyJIcM1aMQ4btrO01/yDto0obh6N+aejFKY=;
 b=PvWdHFvCOZAWcdNpT+v7QFGjTPdkLk99SpeBpFsBw49pNdA0KCqFu00WRMyUzDhANn
 B4T11wYfwShKnKxmCKWfbYUK2HT0KjfS89xYZmL0F6Qx4o+aoX6JR6CwLYOZyjFZ0s4g
 la9mGTfoVY7qK+YX/7BfaIXeLk/y8dlrnrDcEFkNtk5HvQVCnH6Hs9Sl2pKDcpd5Roc8
 aLsF7uOvSlqMmxuyGB2cp4soWhY2ggTqYtOX/MUqwocvdwWuWsURz8vDmIRAFbmnrGZP
 IRNpMvainkUoPvN9QZVKNMe6y+PURvPa9MIW/7A1G12FokBMDcSkeJiqa+m41oKSTG6j
 iAkg==
X-Gm-Message-State: AOJu0YzTUkAVMBVvXYudTvUGUXjG3iO53JBZ1/rdhPIXhg/5xX1Yx+Ib
 XdCCOeuOXJ/EmC4qjGDyt5STe1J5LJw=
X-Google-Smtp-Source: AGHT+IFEAUO3iRYNP0WZH0ntr/H8AL2CW+Mt8Gv1SwYszAeVgjI/p5NaKBxV4h5/BEr46K86fBEySA==
X-Received: by 2002:a05:6000:98d:b0:320:6db:3548 with SMTP id
 by13-20020a056000098d00b0032006db3548mr2712637wrb.55.1694950117872; 
 Sun, 17 Sep 2023 04:28:37 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 q2-20020adff782000000b00317f70240afsm9445429wrp.27.2023.09.17.04.28.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Sep 2023 04:28:37 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 17 Sep 2023 13:28:28 +0200
Message-Id: <20230917112828.9695-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1694950118; x=1695554918; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=T+0YgBPvOyJIcM1aMQ4btrO01/yDto0obh6N+aejFKY=;
 b=LlngzH+/n+4WxcV2wj7N9q700SbeN0QjItefWQZLNEk0WOIb+54UGpXrHOPKO7kIIz
 ze54kvPkFGONnykFD8yhsp1m16fi/TLmm/f8KKP09XK9othg+TrkQkPS9PrhnxomNeee
 wd7jwFmCKNyfCsfSQrqBA4QyNHdjLVCIwMWh0DmXmEKrgVJHq6nb4mG651tw3N45JbXr
 +yrd+/qq/+T/mH6k+1TYm8F4/Fdy+6PXtapjqLtFwvlg/lJPcsx8HGUbmyjmg+Nge+fU
 vSO6SHg9rZ5EVErzvYJ8wlbAcna8NDKyvZE+Vnhfw3PuzZ/NMWunolQbyzO8bzwcW03K
 HxQA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=LlngzH+/
Subject: [Buildroot] [PATCH 1/1] package/libeaw: fix CVE-2023-1729
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

A flaw was found in LibRaw. A heap-buffer-overflow in raw2image_ex()
caused by a maliciously crafted file may lead to an application crash.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...shrink-flag-for-3-4-component-images.patch | 24 +++++++++++++++++++
 package/libraw/libraw.mk                      |  3 +++
 2 files changed, 27 insertions(+)
 create mode 100644 package/libraw/0001-do-not-set-shrink-flag-for-3-4-component-images.patch

diff --git a/package/libraw/0001-do-not-set-shrink-flag-for-3-4-component-images.patch b/package/libraw/0001-do-not-set-shrink-flag-for-3-4-component-images.patch
new file mode 100644
index 0000000000..ef93e0901b
--- /dev/null
+++ b/package/libraw/0001-do-not-set-shrink-flag-for-3-4-component-images.patch
@@ -0,0 +1,24 @@
+From 477e0719ffc07190c89b4f3d12d51b1292e75828 Mon Sep 17 00:00:00 2001
+From: Alex Tutubalin <lexa@lexa.ru>
+Date: Sat, 14 Jan 2023 18:32:59 +0300
+Subject: [PATCH] do not set shrink flag for 3/4 component images
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Upstream: https://github.com/LibRaw/LibRaw/commit/477e0719ffc07190c89b4f3d12d51b1292e75828
+---
+ src/preprocessing/raw2image.cpp | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/src/preprocessing/raw2image.cpp b/src/preprocessing/raw2image.cpp
+index e65e2ad7..702cf290 100644
+--- a/src/preprocessing/raw2image.cpp
++++ b/src/preprocessing/raw2image.cpp
+@@ -43,6 +43,8 @@ void LibRaw::raw2image_start()
+ 
+   // adjust for half mode!
+   IO.shrink =
++	  !imgdata.rawdata.color4_image && !imgdata.rawdata.color3_image &&
++	  !imgdata.rawdata.float4_image && !imgdata.rawdata.float3_image &&
+       P1.filters &&
+       (O.half_size || ((O.threshold || O.aber[0] != 1 || O.aber[2] != 1)));
+ 
diff --git a/package/libraw/libraw.mk b/package/libraw/libraw.mk
index b6616f0c10..cbd509cfea 100644
--- a/package/libraw/libraw.mk
+++ b/package/libraw/libraw.mk
@@ -18,6 +18,9 @@ LIBRAW_DEPENDENCIES = host-pkgconf
 LIBRAW_CXXFLAGS = $(TARGET_CXXFLAGS)
 LIBRAW_CONF_ENV = CXXFLAGS="$(LIBRAW_CXXFLAGS)"
 
+# 0001-do-not-set-shrink-flag-for-3-4-component-images.patch
+LIBRAW_IGNORE_CVES += 0001-do-not-set-shrink-flag-for-3-4-component-images.patch
+
 ifeq ($(BR2_PACKAGE_JASPER),y)
 LIBRAW_CONF_OPTS += --enable-jasper
 LIBRAW_DEPENDENCIES += jasper
-- 
2.40.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
