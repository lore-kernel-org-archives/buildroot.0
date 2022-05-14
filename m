Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23DA6C433FE
	for <buildroot@archiver.kernel.org>; Sat, 14 May 2022 22:57:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B852960E1A;
	Sat, 14 May 2022 22:57:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Sj55L2781Ics; Sat, 14 May 2022 22:57:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C97C860D91;
	Sat, 14 May 2022 22:57:46 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id AAD1D1BF5F5
 for <buildroot@lists.busybox.net>; Sat, 14 May 2022 22:57:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A846082998
 for <buildroot@lists.busybox.net>; Sat, 14 May 2022 22:57:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RGgChSfxtZ8X for <buildroot@lists.busybox.net>;
 Sat, 14 May 2022 22:57:45 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-io1-xd2a.google.com (mail-io1-xd2a.google.com
 [IPv6:2607:f8b0:4864:20::d2a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1FE0E82948
 for <buildroot@buildroot.org>; Sat, 14 May 2022 22:57:45 +0000 (UTC)
Received: by mail-io1-xd2a.google.com with SMTP id m6so12461742iob.4
 for <buildroot@buildroot.org>; Sat, 14 May 2022 15:57:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Kzpa2dG+9xoBdV5zqmID/NCgJsCmfb/XmTh/u3TnWfY=;
 b=aP10Oj6TF04v9hiP1beJrukP+9rKGBrqO24XqEkAM0Z/mbkh9aAQ878fKGJpfizd8L
 6nrlU4KxG31DRgaT/oT84IbWlWqp21pfDW9L++1oFVJ4r3DTFu0MHfg2JXUh19CYYvLH
 ZnyTLC32Vww68uHfS5VcqAQYhpOnmdpCp8cUstdHTPoo0pzQEWs/vPhB30eIFnKQbzq+
 TOELDeY56TeNc7NJ3waC+zn7KKzLSblzKDxEhMGZazNK/7pcqDW5B9exp8nVeNF/y9yX
 1qXMoIKI17i04FYz4u4+X4RUlIKrVLmtpkbLdt2yEfDjHEhymY9K3iJ4n/2rwpnKBxW1
 EZWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Kzpa2dG+9xoBdV5zqmID/NCgJsCmfb/XmTh/u3TnWfY=;
 b=zU5HHlQn7aKjE5KbJHrz2Rc6ZoHTfcJTfOIZKeip8d1KQqDpnd7VoojF80HSNifr3j
 eQ5JkYoOJvJJ9NFtGgkWP90XVcqiVrfFN64+FArxqoBfQRbH0PVRXw0jEDojkfokUXB9
 KR4V9Vv4lHlLg58veAdvhaHXPYVfLdESqhks5Ak2wBmqOk83J+HOsQhRWMXXwLmPO00z
 Zhojc+LJWfex51l9wcfQgPmHO71CXG3FHcwVIocFBr6SryTElgZo9eldcbXT6CT9ONmy
 k+KH1Lijs+40GlgY2fYlqE1VEKTf34KvH3+p7omirXdID02C/0a4v+VnVrt7BQa0WW+i
 W5Pw==
X-Gm-Message-State: AOAM532+CT3WUT7jrqQNrGSL52DecCZSCVgxWEDee3/6rF9Zsb8TKusa
 ev9/Plewz9PJ+wnd3H49RAqZ8vDppjA=
X-Google-Smtp-Source: ABdhPJzmoTvsuuPAdgRjR3hXvDMWloGC22ZgD1kJlwBjgaMFO88D+CN+qrqii/fL5Yhd4zwBWKlCFg==
X-Received: by 2002:a05:6602:3d2:b0:65d:c151:f29f with SMTP id
 g18-20020a05660203d200b0065dc151f29fmr5114830iov.28.1652569064096; 
 Sat, 14 May 2022 15:57:44 -0700 (PDT)
Received: from james-x399.localdomain (97-118-134-20.hlrn.qwest.net.
 [97.118.134.20]) by smtp.gmail.com with ESMTPSA id
 q17-20020a056e02079100b002d11397f4f9sm349213ils.74.2022.05.14.15.57.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 14 May 2022 15:57:43 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 14 May 2022 16:57:32 -0600
Message-Id: <20220514225732.3102078-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/gst1-imx: add missing
 BR2_INSTALL_LIBSTDCPP dependency
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
Cc: Gary Bisson <bisson.gary@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fixes:
WARNING: unmet direct dependencies detected for BR2_PACKAGE_GST1_PLUGINS_BAD
  Depends on [n]: BR2_PACKAGE_GSTREAMER1 [=y] && BR2_INSTALL_LIBSTDCPP [=n]
  Selected by [y]:
  - BR2_PACKAGE_GST1_IMX_V4L2VIDEOSRC [=y] && BR2_PACKAGE_GSTREAMER1 [=y] && BR2_PACKAGE_GST1_IMX [=y]

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/gstreamer1/gst1-imx/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/gstreamer1/gst1-imx/Config.in b/package/gstreamer1/gst1-imx/Config.in
index 41ef8548c5..18ffd1f7f5 100644
--- a/package/gstreamer1/gst1-imx/Config.in
+++ b/package/gstreamer1/gst1-imx/Config.in
@@ -81,6 +81,7 @@ comment "imxvpu needs the VPU imxvpuapi library"
 
 config BR2_PACKAGE_GST1_IMX_V4L2VIDEOSRC
 	bool "imxv4l2videosrc"
+	depends on BR2_INSTALL_LIBSTDCPP # gst1-plugins-bad
 	select BR2_PACKAGE_GST1_PLUGINS_BAD
 	help
 	  Elements for V4L2 capture
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
