Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E81F1C636D3
	for <buildroot@archiver.kernel.org>; Sun,  5 Feb 2023 14:06:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6A8DD416AC;
	Sun,  5 Feb 2023 14:06:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6A8DD416AC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3kxVxZ6cvAJK; Sun,  5 Feb 2023 14:06:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 57F9D4169E;
	Sun,  5 Feb 2023 14:06:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 57F9D4169E
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 519041BF475
 for <buildroot@lists.busybox.net>; Sun,  5 Feb 2023 14:06:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2BDBD40124
 for <buildroot@lists.busybox.net>; Sun,  5 Feb 2023 14:06:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2BDBD40124
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZuPvqafWbAwY for <buildroot@lists.busybox.net>;
 Sun,  5 Feb 2023 14:06:11 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0A5754010D
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0A5754010D
 for <buildroot@buildroot.org>; Sun,  5 Feb 2023 14:06:10 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 f23-20020a05600c491700b003dff4480a17so1222739wmp.1
 for <buildroot@buildroot.org>; Sun, 05 Feb 2023 06:06:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Y/o7RRLvdujmCVplg/csaCSo47q0UJSmNWHrKl+m3fE=;
 b=GAdM6W4lCF7EYgz9GcAQK4R1JxwbG0EjvSxWpszRf4NlBjFAfibaN5I7ZMHBA8WzDQ
 n+v+nND0OC7s13lq4sbmHzs6sfdO9DlDSijbpeWR+bIVS/9Q428joGdDEFqIQQKMjjpl
 8/LuPIkkGy6WmcOpSVx8XRWvCISNG1XebnYNBubYXYA4HBZ/HIQLQSaTWMI+E6Y4w07H
 zc6uWQscqqwJWXp1RxyLEwoZ1aiikz6uZjOZAMRXjSET9qfNdE4P+YQ87/iL36SKbsbF
 PeBYXxwP5JH2qCiHgEnpoQsNJFF6XBRibaAlJp+UkFu5S53P06FjyNh5wfIrDT6ckv+a
 P/aA==
X-Gm-Message-State: AO0yUKV5NbkvCAlPumvk+GyeO17KsKFaEdZf1/l5fCYQmE3PtdzCllmR
 e3JGH5iDj8RC3t0QjQiHIX9VI8UQHoE=
X-Google-Smtp-Source: AK7set/++x/PFIXWIDykVpXc/ywtlIJXcwMnrqWh3gtilV1iFjis07opXtueDt5ZVK5i4/rCT19LpA==
X-Received: by 2002:a1c:4b16:0:b0:3dc:19d1:3c1f with SMTP id
 y22-20020a1c4b16000000b003dc19d13c1fmr15548731wma.30.1675605968858; 
 Sun, 05 Feb 2023 06:06:08 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 q14-20020a7bce8e000000b003dc49e0132asm13096109wmj.1.2023.02.05.06.06.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Feb 2023 06:06:08 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  5 Feb 2023 15:06:02 +0100
Message-Id: <20230205140602.161881-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Y/o7RRLvdujmCVplg/csaCSo47q0UJSmNWHrKl+m3fE=;
 b=VXrJ3K46+a0c0bjxJvKi4LFCvAN6rSyx/K9qH60uiXu7eaP/nIpxdMu+K2JafirJm3
 ZLSYFjpGr0JeJQ9wz7K4eQU5OkJzFu6b9EEWNaYqQVuvVh0Epc5VsTKqqoBk0F1zQzhs
 KCm6G4wZwxk/HjOLFSFCK4IMGvYzQgOpf6ShMY5HxugQXR5FiDzbTMOwkOAFcEJYS7ht
 3ORJAkkVJRBdxqWMp+prfPeQ068SnqVLXnwGwbZiH4HJQiJ/qP9LTP1l3+6ekfuOH3DJ
 A34TQkAGjmDx19IXDfZxZE7j+pTod14Q5U71HKqqryFKIwATa9n4uZdCZcVwvGSplEmP
 GhdA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=VXrJ3K46
Subject: [Buildroot] [PATCH 1/1] package/upx: security bump to version 4.0.2
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

Fix CVE-2023-23456: A heap-based buffer overflow issue was discovered in
UPX in PackTmt::pack() in p_tmt.cpp file. The flow allows an attacker to
cause a denial of service (abort) via a crafted file.

Fix CVE-2023-23457: A Segmentation fault was found in UPX in
PackLinuxElf64::invert_pt_dynamic() in p_lx_elf.cpp. An attacker with a
crafted input file allows invalid memory address access that could lead
to a denial of service.

https://github.com/upx/upx/blob/v4.0.2/NEWS

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/upx/upx.hash | 2 +-
 package/upx/upx.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/upx/upx.hash b/package/upx/upx.hash
index 9f7c40c819..7c24906152 100644
--- a/package/upx/upx.hash
+++ b/package/upx/upx.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  77003c8e2e29aa9804e2fbaeb30f055903420b3e01d95eafe01aed957fb7e190  upx-4.0.1-src.tar.xz
+sha256  1221e725b1a89e06739df27fae394d6bc88aedbe12f137c630ec772522cbc76f  upx-4.0.2-src.tar.xz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/upx/upx.mk b/package/upx/upx.mk
index ef346b2310..6018b0a63d 100644
--- a/package/upx/upx.mk
+++ b/package/upx/upx.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-UPX_VERSION = 4.0.1
+UPX_VERSION = 4.0.2
 UPX_SITE = https://github.com/upx/upx/releases/download/v$(UPX_VERSION)
 UPX_SOURCE = upx-$(UPX_VERSION)-src.tar.xz
 UPX_LICENSE = GPL-2.0+
-- 
2.39.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
