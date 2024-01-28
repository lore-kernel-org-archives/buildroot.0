Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE2C2C47258
	for <buildroot@archiver.kernel.org>; Sun, 28 Jan 2024 13:23:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6C03E828B5;
	Sun, 28 Jan 2024 13:23:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6C03E828B5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ANwkt7RKZQvx; Sun, 28 Jan 2024 13:23:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7F24082B81;
	Sun, 28 Jan 2024 13:22:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7F24082B81
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2B6001BF863
 for <buildroot@lists.busybox.net>; Sun, 28 Jan 2024 13:21:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 00404400C8
 for <buildroot@lists.busybox.net>; Sun, 28 Jan 2024 13:21:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 00404400C8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nbgawyzXgeHx for <buildroot@lists.busybox.net>;
 Sun, 28 Jan 2024 13:21:05 +0000 (UTC)
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp2.osuosl.org (Postfix) with ESMTPS id EDD7540585
 for <buildroot@buildroot.org>; Sun, 28 Jan 2024 13:21:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EDD7540585
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-33926ccbc80so1223503f8f.0
 for <buildroot@buildroot.org>; Sun, 28 Jan 2024 05:21:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706448063; x=1707052863;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Nc/LS6yu8STDPDKNOr6lD0PnV9Zg4OtNSM+GvhdLdU8=;
 b=euGb6C9+qr6FkEtGsMFNWfcGQxHTJKrm/ZSKF3XaXej6ztzS2ksx8VIg4Zg23MY8aN
 UMmG4gqVzsrpw6X68gwM6JV8vtb8cIeVM9Aye3TNHNzadB4w2MV04w2JmmX/CdhF7Nza
 uTeeUxl3UL0BWBhPfAH4qyscqFA+sGxYlMdTzPTYmxbHOBMZMNeBYuVBNOgH9uaYNerv
 f5vGmbdzpR7yQ9GcBN0GKiZSY887JzdcDa9+d/8txcdjP40dErhKeKMVPAJ5qmQ6Pc1I
 nB8cwfPZQDeZmSZQVtE55iSaeh8fIAWhUBDkj5q2WmWFQWvS+FLfiICE+k6MTfGUjm+3
 J+8w==
X-Gm-Message-State: AOJu0YzCeJGTEUd0vGlIdP70fbUCcwHpgMsbfR4bS4+YzgEEw0gvPSGn
 rf9Cjh6xYTzQC9ry27s5MHG5pWKcUUXHe4UhWE8dtPQLWlTMV3CuXqSImoDu
X-Google-Smtp-Source: AGHT+IHtwEDqWR16hgaoh3rKM6uh2RY5oKiqkbwW5SGqGjyYsS8uikaftCUoE7m5bQ5c6e8ty8OX3A==
X-Received: by 2002:a05:6000:50d:b0:337:9b30:36f0 with SMTP id
 a13-20020a056000050d00b003379b3036f0mr3694100wrf.67.1706448062962; 
 Sun, 28 Jan 2024 05:21:02 -0800 (PST)
Received: from landeda.home ([2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 by smtp.gmail.com with ESMTPSA id
 bv25-20020a0560001f1900b0033aec64ba7dsm747778wrb.78.2024.01.28.05.21.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Jan 2024 05:21:02 -0800 (PST)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 28 Jan 2024 14:20:57 +0100
Message-ID: <4ec42d32f6ea3c94fee3da6d63c884b5594d2c0e.1706448055.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1706448055.git.yann.morin.1998@free.fr>
References: <cover.1706448055.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1706448063; x=1707052863; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Nc/LS6yu8STDPDKNOr6lD0PnV9Zg4OtNSM+GvhdLdU8=;
 b=hPwLlPLaPIbMt9kpcut9y/qGEWP5GfLi3z/MpLHLcUAutMzOiZLskyKwyP/QcplWr1
 ahs3VDns2h89Tfi0ZKelQIMesgiTff+xqtPehWSCjEk3OjuDukLWkEGS1ySiYtbMNKQM
 sMNNwLJdW6YbzT/h3OElAEFkMjE0JblyFZox+l91fMG4W+TL99/+co4UL0kAp0ZFD9B+
 YwpzQj4YmUaFqO/iLqmNPly7++LO4kZDQ4WMY3AOz05lsrvwtErqi/2cjdRf7sZXCHk1
 YixFdtrNWkQi7zuuY9890Sb6sZruNNIYJh28QE+wZv2WP2NOrlYFAK0ggBjd6sZ5wR2f
 +jVA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=hPwLlPLa
Subject: [Buildroot] [PATCH 08/10] package/opencv4: propagate internal
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Woodrow Douglass <wdouglass@carnegierobotics.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Commit e22994378553 (package/opencv4: BR2_PACKAGE_OPENCV4_LIB_OBJDETECT
requires BR2_PACKAGE_OPENCV4_LIB_DNN) forgot to propagate the dependency
to the internal stitching option, and to the contrib options dpm, face,
and xobjdetect, causing unmet dependencies warning (unfortunately, not
errors) such as:

    $ KCONFIG_SEED=0x9F66F854 make randconfig
    WARNING: unmet direct dependencies detected for BR2_PACKAGE_OPENCV4_LIB_OBJDETECT
      Depends on [n]: BR2_PACKAGE_OPENCV4 [=y] && !BR2_TOOLCHAIN_USES_UCLIBC [=y] && BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS [=y]
      Selected by [y]:
      - BR2_PACKAGE_OPENCV4_LIB_STITCHING [=y] && BR2_PACKAGE_OPENCV4 [=y]
      - BR2_PACKAGE_OPENCV4_CONTRIB_LIB_XOBJDETECT [=y] && BR2_PACKAGE_OPENCV4_CONTRIB [=y]

Propagate the dependencies.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Woodrow Douglass <wdouglass@carnegierobotics.com>
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/opencv4-contrib/Config.in | 18 ++++++++++++++++++
 package/opencv4/Config.in         |  6 ++++++
 2 files changed, 24 insertions(+)

diff --git a/package/opencv4-contrib/Config.in b/package/opencv4-contrib/Config.in
index 851241ce5e..951d5f71ad 100644
--- a/package/opencv4-contrib/Config.in
+++ b/package/opencv4-contrib/Config.in
@@ -95,18 +95,30 @@ config BR2_PACKAGE_OPENCV4_CONTRIB_LIB_DNNS_EASILY_FOOLED
 
 config BR2_PACKAGE_OPENCV4_CONTRIB_LIB_DPM
 	bool "dpm"
+	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS # opencv4 objdetect
+	depends on !BR2_TOOLCHAIN_USES_UCLIBC # opencv4 objdetect
 	select BR2_PACKAGE_OPENCV4_LIB_OBJDETECT
 	help
 	  Deformable Part Model -- Felzenszwalb's Cascade with
 	  deformable parts object recognition code.
 
+comment "dpm needs a glibc or musl toolchain"
+	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS # opencv4 objdetect
+	depends on BR2_TOOLCHAIN_USES_UCLIBC # opencv4 objdetect
+
 config BR2_PACKAGE_OPENCV4_CONTRIB_LIB_FACE
 	bool "face"
+	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS # opencv4 objdetect
+	depends on !BR2_TOOLCHAIN_USES_UCLIBC # opencv4 objdetect
 	select BR2_PACKAGE_OPENCV4_LIB_OBJDETECT
 	help
 	  Face Recognition -- Face recognition techniques: Eigen, Fisher
 	  and Local Binary Pattern Histograms LBPH methods.
 
+comment "face needs a glibc or musl toolchain"
+	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS # opencv4 objdetect
+	depends on BR2_TOOLCHAIN_USES_UCLIBC # opencv4 objdetect
+
 config BR2_PACKAGE_OPENCV4_CONTRIB_LIB_FREETYPE
 	bool "freetype"
 	help
@@ -317,12 +329,18 @@ config BR2_PACKAGE_OPENCV4_CONTRIB_LIB_XIMGPROC
 
 config BR2_PACKAGE_OPENCV4_CONTRIB_LIB_XOBJDETECT
 	bool "xobjdetect"
+	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS # opencv4 objdetect
+	depends on !BR2_TOOLCHAIN_USES_UCLIBC # opencv4 objdetect
 	select BR2_PACKAGE_OPENCV4_LIB_OBJDETECT
 	help
 	  Boosted 2D Object Detection -- Uses a Waldboost cascade and
 	  local binary patterns computed as integral features for 2D
 	  object detection.
 
+comment "xobjdetect needs a glibc or musl toolchain"
+	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS # opencv4 objdetect
+	depends on BR2_TOOLCHAIN_USES_UCLIBC # opencv4 objdetect
+
 config BR2_PACKAGE_OPENCV4_CONTRIB_LIB_XPHOTO
 	bool "xphoto"
 	select BR2_PACKAGE_OPENCV4_LIB_PHOTO
diff --git a/package/opencv4/Config.in b/package/opencv4/Config.in
index 78ec7c2e41..f1a2d02d50 100644
--- a/package/opencv4/Config.in
+++ b/package/opencv4/Config.in
@@ -203,6 +203,8 @@ config BR2_PACKAGE_OPENCV4_LIB_SHAPE
 
 config BR2_PACKAGE_OPENCV4_LIB_STITCHING
 	bool "stitching"
+	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS # objdetect
+	depends on !BR2_TOOLCHAIN_USES_UCLIBC # objdetect
 	select BR2_PACKAGE_OPENCV4_LIB_CALIB3D
 	select BR2_PACKAGE_OPENCV4_LIB_FEATURES2D
 	select BR2_PACKAGE_OPENCV4_LIB_IMGPROC
@@ -211,6 +213,10 @@ config BR2_PACKAGE_OPENCV4_LIB_STITCHING
 	  Include opencv_stitching (images stitching) module into the
 	  OpenCV build.
 
+comment "stitching needs a glibc or musl toolchain"
+	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS
+	depends on BR2_TOOLCHAIN_USES_UCLIBC
+
 config BR2_PACKAGE_OPENCV4_LIB_SUPERRES
 	bool "superres"
 	select BR2_PACKAGE_OPENCV4_LIB_IMGPROC
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
