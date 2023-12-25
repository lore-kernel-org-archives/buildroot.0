Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCA1DC3DA6E
	for <buildroot@archiver.kernel.org>; Mon, 25 Dec 2023 19:38:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 35EFD813AC;
	Mon, 25 Dec 2023 19:38:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 35EFD813AC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WTpAGdiMgEn6; Mon, 25 Dec 2023 19:38:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 87E8F81394;
	Mon, 25 Dec 2023 19:38:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 87E8F81394
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 588F21BF28C
 for <buildroot@lists.busybox.net>; Mon, 25 Dec 2023 19:38:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3114A813A3
 for <buildroot@lists.busybox.net>; Mon, 25 Dec 2023 19:38:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3114A813A3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BeMDkUmw-5Ad for <buildroot@lists.busybox.net>;
 Mon, 25 Dec 2023 19:38:41 +0000 (UTC)
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id F36A281389
 for <buildroot@busybox.net>; Mon, 25 Dec 2023 19:38:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F36A281389
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-336990fb8fbso2407903f8f.1
 for <buildroot@busybox.net>; Mon, 25 Dec 2023 11:38:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703533119; x=1704137919;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=62TplakLo1EgIHnBiQv5xS5LfzpwztAkVd50WPgKi7w=;
 b=AARQiZr64aLfuFzsFef7BZ4PdDJEKej3jkfVqRZ4gmkozijJZb4OtV5G2VH0BtvJ3P
 Qry2DeLKhXOR+CorDr1UWoCiDmAAGt2YtXiixSpjax8tylMg96TGd5P0gmFw64yAj/D0
 M6szKWNd+BCmK/csI7B7kbh+Vl3U3TkmCgFyIlsnqeGAqLX8SBjtV4Jt6ZME9XTlOQ4i
 ZuLkP5RKtz+0WeZwtB2tmUv6aC0DMNvouw6tHeioEAdYa67jekJGpxjtfVdDqwZOD9Qx
 oeDDnvipaNwgIgSqGUjGEzuXZlgwaZFT6yu38wNJ6onBh1iMbzf2lpdEu+0DqVHmRzQv
 7LBA==
X-Gm-Message-State: AOJu0Yxp7N4QP88MNzXJMgNf2No+Ck6x2w4etUKssv7Eq33+z8Ak6noW
 BOuTfeSfcdGdsIiERk9yAzb9UTokSiw=
X-Google-Smtp-Source: AGHT+IHsrLma13caDqfCTIsb0yL1OGJXcofTjeDydwKvnToASrW2JvC3BMCfP9jB0O/+tsl4pGWcTQ==
X-Received: by 2002:a05:6000:371:b0:336:a6a1:ff9a with SMTP id
 f17-20020a056000037100b00336a6a1ff9amr2694226wrf.10.1703533118737; 
 Mon, 25 Dec 2023 11:38:38 -0800 (PST)
Received: from xubuntu-23.. ([93.24.197.12]) by smtp.gmail.com with ESMTPSA id
 m17-20020adffe51000000b003364a0e6983sm10909618wrs.62.2023.12.25.11.38.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Dec 2023 11:38:38 -0800 (PST)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Mon, 25 Dec 2023 20:38:33 +0100
Message-Id: <20231225193833.87941-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1703533119; x=1704137919; darn=busybox.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=62TplakLo1EgIHnBiQv5xS5LfzpwztAkVd50WPgKi7w=;
 b=Xwiy4mRLT1eH/1m5ggV8W30mjtpReB50JCGl7WhRBM8RTcWDtb7RLuNGrPLyuMd0Ov
 y+2g8JYK5XA6//rTTr2m2SwdhdZzeM/Ki8YQ0cdwzqE6rbrBltQH6sR+QFj/ofMhzIX+
 kfiK1ySt6jjQgyL29oxc0BlZqD3RmRKfJAAfoXCgoigonMwIbFn8pRJrKSzNU1XbcT1r
 +Zjnka/V2ypiOxHOMkRwcj5nIOpn4iq5/6LKl90BOBc/FpWndx2wdWYRYCqYzxXtl7nF
 swSmSfa3p3quDmVEYqb1/5Mg2UFG49NUm5sO9/yAZDvw5o3z89n5J+4PFKMebcREEWn1
 FaZw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Xwiy4mRL
Subject: [Buildroot] [PATCH] package/dbus: bump to version 1.14.10
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/dbus/dbus.hash | 4 ++--
 package/dbus/dbus.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/dbus/dbus.hash b/package/dbus/dbus.hash
index 638bb4bc6..a06ba50cc 100644
--- a/package/dbus/dbus.hash
+++ b/package/dbus/dbus.hash
@@ -1,7 +1,7 @@
 # Locally calculated after checking pgp signature
-# https://dbus.freedesktop.org/releases/dbus/dbus-1.14.8.tar.xz.asc
+# https://dbus.freedesktop.org/releases/dbus/dbus-1.14.10.tar.xz.asc
 # using key 36EC5A6448A4F5EF79BEFE98E05AE1478F814C4F
-sha256  a6bd5bac5cf19f0c3c594bdae2565a095696980a683a0ef37cb6212e093bde35  dbus-1.14.8.tar.xz
+sha256  ba1f21d2bd9d339da2d4aa8780c09df32fea87998b73da24f49ab9df1e36a50f  dbus-1.14.10.tar.xz
 
 # Locally calculated
 sha256  e61807cd1c32ff4e7bd5b4b61dd21997c6dc5642cf19316124fe38d50e1f9fa3  COPYING
diff --git a/package/dbus/dbus.mk b/package/dbus/dbus.mk
index 930b1a298..c41fbcb4d 100644
--- a/package/dbus/dbus.mk
+++ b/package/dbus/dbus.mk
@@ -6,7 +6,7 @@
 
 # When updating dbus, check if there are changes in session.conf and
 # system.conf, and update the versions in the dbus-broker package accordingly.
-DBUS_VERSION = 1.14.8
+DBUS_VERSION = 1.14.10
 DBUS_SOURCE = dbus-$(DBUS_VERSION).tar.xz
 DBUS_SITE = https://dbus.freedesktop.org/releases/dbus
 DBUS_LICENSE = AFL-2.1 or GPL-2.0+ (library, tools), GPL-2.0+ (tools)
-- 
2.40.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
