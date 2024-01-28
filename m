Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89483C47DA9
	for <buildroot@archiver.kernel.org>; Sun, 28 Jan 2024 13:22:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 46A7B82779;
	Sun, 28 Jan 2024 13:22:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 46A7B82779
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9d74Ix2vJ0ts; Sun, 28 Jan 2024 13:22:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 88324827DE;
	Sun, 28 Jan 2024 13:22:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 88324827DE
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8C1741BF2C7
 for <buildroot@lists.busybox.net>; Sun, 28 Jan 2024 13:21:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 64AD1415A7
 for <buildroot@lists.busybox.net>; Sun, 28 Jan 2024 13:21:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 64AD1415A7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id agCmgcKc8KkY for <buildroot@lists.busybox.net>;
 Sun, 28 Jan 2024 13:21:05 +0000 (UTC)
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 812214159F
 for <buildroot@buildroot.org>; Sun, 28 Jan 2024 13:21:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 812214159F
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-40eacb6067dso34700525e9.1
 for <buildroot@buildroot.org>; Sun, 28 Jan 2024 05:21:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706448063; x=1707052863;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Fav8dT4tL7yNMf5aKUe6NG+WXmxuHrkYtzDV5INtExE=;
 b=izaveri+ka160G74zqOSSCXGBrexXv5bn9o7k9Zk1x2kVfzzSsoNVRyBwjIMsVXi4c
 eb7+EgSCaetyJc5h5+L+6KJC7dzkZwBCC/acCmoNo9dQ8Ba7Zdm099Z4rCYLaWppLLP5
 lXNapt8UCQiLSQythgCYvSqWlyRMlVeaMwV0Eeiv2VedbG+UHQgFaAFJPpVe7vKrQtEU
 Kdda0sXuibQ8V8tE8xHPYeL6G4cYG6f6nQ1yBickQ9n6tRyVTVRwb4iyeeDRYemdVaI8
 WJuieD+R2BShI24SM4h0/5+eX65woEHujJXQi7go9vP0wQoJHTf8qDSFSRYFsqHepO2J
 tV7Q==
X-Gm-Message-State: AOJu0YyVTM9p9YziaO6R+gYFYk7Pji6qWvq73cW4khe8zuZC37Ov8/WK
 CO2hcfgrolRzVfo8sIe7d/X3wuT/CIlp94LssWLPYWkBuS/BpqnJkM+RJXDB
X-Google-Smtp-Source: AGHT+IGg4AO1kV1YLsQAGDwmyWc7a7sQV54iUqx/kjDt1QAjWQ/MZQEAD7NxJbVY6KbTh/y0tLXoiw==
X-Received: by 2002:a05:600c:310b:b0:40e:f5e3:5e16 with SMTP id
 g11-20020a05600c310b00b0040ef5e35e16mr951635wmo.27.1706448063559; 
 Sun, 28 Jan 2024 05:21:03 -0800 (PST)
Received: from landeda.home ([2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 by smtp.gmail.com with ESMTPSA id
 bv25-20020a0560001f1900b0033aec64ba7dsm747778wrb.78.2024.01.28.05.21.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Jan 2024 05:21:03 -0800 (PST)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 28 Jan 2024 14:20:58 +0100
Message-ID: <681d58c130501398b80678a980d2fe511d35015f.1706448055.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1706448055.git.yann.morin.1998@free.fr>
References: <cover.1706448055.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1706448063; x=1707052863; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Fav8dT4tL7yNMf5aKUe6NG+WXmxuHrkYtzDV5INtExE=;
 b=ADLAWjYdcCynh4b0Mh7xASYhGIT2B3830K5ZIIKFXDb+lUFeuoIN1/7vUCSwDXSUsJ
 T+RNoWfRl3p44T4FqZBnHp7smxgSUJH3kyy+zz62XpQGAOiA83W8hYi4X+bcE6a9GHQh
 yAFBbg9aAGueTW5Vkd8GxgAJsfxCbnbOj0UN0gOug3CVPoEj5luHTl6sl6q/jLsGfKCm
 swtejTN4NXK+5cLJ77GiXMT1Qx3g17qipj3wprLA+F7HOCZNYU996MQGNHa9PF/xiTbe
 PnPT7QpPbwj9kwT79X+IuXIEvemDYxgFofeCmTWFVVN3K6zrTZOdzHb0wlI12dHbYvCf
 8mBA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=ADLAWjYd
Subject: [Buildroot] [PATCH 09/10] package/opencv-contrib: propagate opencv4
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
Cc: Woodrow Douglass <wdouglass@carnegierobotics.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Commit a7736afacaef (package/opencv4-contrib: properly note dependencies
between modules) forgot to propagate the dependencies of selected
symbols, causing unmet dependencies warnings (unfortunately, not
errors), such as:

    $ KCONFIG_SEED=0x9F66F854 make randconfig
    WARNING: unmet direct dependencies detected for BR2_PACKAGE_OPENCV4_LIB_DNN
      Depends on [n]: BR2_PACKAGE_OPENCV4 [=y] && !BR2_TOOLCHAIN_USES_UCLIBC [=y] && BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS [=y]
      Selected by [y]:
      - BR2_PACKAGE_OPENCV4_CONTRIB_LIB_DNN_OBJDETECT [=y] && BR2_PACKAGE_OPENCV4_CONTRIB [=y]

Propagate the dependencies and add associated comments.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Woodrow Douglass <wdouglass@carnegierobotics.com>
---
 package/opencv4-contrib/Config.in | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/package/opencv4-contrib/Config.in b/package/opencv4-contrib/Config.in
index 951d5f71ad..261d414869 100644
--- a/package/opencv4-contrib/Config.in
+++ b/package/opencv4-contrib/Config.in
@@ -74,19 +74,31 @@ config BR2_PACKAGE_OPENCV4_CONTRIB_LIB_DATASETS
 
 config BR2_PACKAGE_OPENCV4_CONTRIB_LIB_DNN_OBJDETECT
 	bool "dnn_objdetect"
+	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS # opencv4 dnn
+	depends on !BR2_TOOLCHAIN_USES_UCLIBC # opencv4 dnn
 	select BR2_PACKAGE_OPENCV4_LIB_DNN
 	help
 	  Object Detection using CNNs -- Implements compact CNN Model
 	  for object detection. Trained using Caffe but uses
 	  opencv_dnn module.
 
+comment "dnn_objdetect needs a glibc or musl toolchain"
+	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS
+	depends on !BR2_TOOLCHAIN_USES_UCLIBC
+
 config BR2_PACKAGE_OPENCV4_CONTRIB_LIB_DNN_SUPERRES
 	bool "dnn_superres"
+	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS # opencv4 dnn
+	depends on !BR2_TOOLCHAIN_USES_UCLIBC # opencv4 dnn
 	select BR2_PACKAGE_OPENCV4_LIB_DNN
 	help
 	  Superresolution using CNNs -- Contains four trained
 	  convolutional neural networks to upscale images.
 
+comment "dnn_superres needs a glibc or musl toolchain"
+	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS
+	depends on !BR2_TOOLCHAIN_USES_UCLIBC
+
 config BR2_PACKAGE_OPENCV4_CONTRIB_LIB_DNNS_EASILY_FOOLED
 	bool "dnns_easily_fooled"
 	help
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
