Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86097C77B78
	for <buildroot@archiver.kernel.org>; Wed, 19 Apr 2023 08:32:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3255484037;
	Wed, 19 Apr 2023 08:32:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3255484037
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ibyG2_tqmb76; Wed, 19 Apr 2023 08:32:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 60C428402F;
	Wed, 19 Apr 2023 08:32:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 60C428402F
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 45BE51C432F
 for <buildroot@lists.busybox.net>; Wed, 19 Apr 2023 08:31:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1FBE740527
 for <buildroot@lists.busybox.net>; Wed, 19 Apr 2023 08:31:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1FBE740527
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sye6d9sLspN7 for <buildroot@lists.busybox.net>;
 Wed, 19 Apr 2023 08:31:53 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 516B041E7C
Received: from mail-il1-x136.google.com (mail-il1-x136.google.com
 [IPv6:2607:f8b0:4864:20::136])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 516B041E7C
 for <buildroot@buildroot.org>; Wed, 19 Apr 2023 08:31:53 +0000 (UTC)
Received: by mail-il1-x136.google.com with SMTP id
 e9e14a558f8ab-3294fd17f1cso10713715ab.1
 for <buildroot@buildroot.org>; Wed, 19 Apr 2023 01:31:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681893112; x=1684485112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KnlY+JFADvOcD6aLkkGx6/QsGWakEbpZ840c7vT2pGw=;
 b=dj7IJBlfIh1tGtIZN8DK9sPofXbHNeG0BUbWD64JtrlCRE3PdfaOLQo6u+AdHfoeXf
 +yAHT6KaXPTyPRzxratcnkHPqhHKJDSY9o6aBLXYx8u71bpc88+S+Eb+GNpTcQohkJx8
 z4L0e/cdgst39EM9u1voL8ncnKQiyfAGat7TcCeOt6WLD4PBcT+8eC3uhUyuWszlnYof
 zKcqZ9AUmLuZOq1wHU3geC50G+9FN+WO2huKGOXLHkegrzyPl/u8j02Y86Y1GAN/FEto
 wq16dhGDCYyf9/8O1pDFmiohgsjfOJKrr2NL68JoCNPR+ddnXQTjuKDFiuQvGUeHPkgc
 3MfQ==
X-Gm-Message-State: AAQBX9eDcYj8h6fssY1w+LuDSQ0igk4j7TLEeoRZg1foQiQGn+Q/TBTb
 hP57s+jfFAWB210ZuHAox51z6Y/1eU4=
X-Google-Smtp-Source: AKy350YUQocQ5G92S/gomfEZ97XlYQ/6ElW7fBTLyq6ldHadUGt/LLnBVXpDGuLRNbLt77IhTzh44g==
X-Received: by 2002:a92:ddcb:0:b0:32b:6433:668f with SMTP id
 d11-20020a92ddcb000000b0032b6433668fmr3182379ilr.4.1681893112264; 
 Wed, 19 Apr 2023 01:31:52 -0700 (PDT)
Received: from james-x399.localdomain (71-218-108-164.hlrn.qwest.net.
 [71.218.108.164]) by smtp.gmail.com with ESMTPSA id
 z20-20020a056638241400b0040f8a65164csm4026442jat.105.2023.04.19.01.31.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Apr 2023 01:31:52 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 19 Apr 2023 02:31:39 -0600
Message-Id: <20230419083144.212921-7-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230419083144.212921-1-james.hilliard1@gmail.com>
References: <20230419083144.212921-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1681893112; x=1684485112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KnlY+JFADvOcD6aLkkGx6/QsGWakEbpZ840c7vT2pGw=;
 b=anG58ca1q8mVrWzbB5sOXCO3QuN6kqgYtOqKCcC/l+yu62Z7434opOzcXGtCwfY0Xz
 cvypbtiwFquRGOiyS1aykLKNJPaC2LcJ3QWr7ke9DsxYhfn/ZCF3j1mKkOwdIOo5MA5K
 7y7Oi4TV7fLbcTiVhFZBF2A6oqyRjFNOYiaI4pX1JZbm1w0BYHeFQouHwknVa/xLOdw9
 b09P336VaWzcmd71F2ZJqBCSZXidGfgbp0InpW7d5Rt/jLjEwuDPc87A7N2/0xK6l0/B
 4a3eONfzG+SIsGp40f7TcoAQ6ROKW4oXsAeKHBAwznTzt3vhgZELb+jrV+WmZi01n2Vz
 GA4w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=anG58ca1
Subject: [Buildroot] [PATCH 07/12] package/gst1-libav: bump version to 1.22.2
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
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/gstreamer1/gst1-libav/gst1-libav.hash | 4 ++--
 package/gstreamer1/gst1-libav/gst1-libav.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gstreamer1/gst1-libav/gst1-libav.hash b/package/gstreamer1/gst1-libav/gst1-libav.hash
index c2c58ab2fe..c3e84a17d2 100644
--- a/package/gstreamer1/gst1-libav/gst1-libav.hash
+++ b/package/gstreamer1/gst1-libav/gst1-libav.hash
@@ -1,3 +1,3 @@
-# From https://gstreamer.freedesktop.org/src/gst-libav/gst-libav-1.22.0.tar.xz.sha256sum
-sha256  0e48407b4905227a260213dbda84cba3812f0530fc7a75b43829102ef82810f1  gst-libav-1.22.0.tar.xz
+# From https://gstreamer.freedesktop.org/src/gst-libav/gst-libav-1.22.2.tar.xz.sha256sum
+sha256  fcaaf9878fe8f3bc82317ef13a1558824cb68df1f8968c6797f556c5e33bcffd  gst-libav-1.22.2.tar.xz
 sha256  ad2eec519ebd4b5df86ea84dff24ae3bfa2edea846a703b58902dd221ae375db  COPYING
diff --git a/package/gstreamer1/gst1-libav/gst1-libav.mk b/package/gstreamer1/gst1-libav/gst1-libav.mk
index d4b3873af1..0306db42c0 100644
--- a/package/gstreamer1/gst1-libav/gst1-libav.mk
+++ b/package/gstreamer1/gst1-libav/gst1-libav.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GST1_LIBAV_VERSION = 1.22.0
+GST1_LIBAV_VERSION = 1.22.2
 GST1_LIBAV_SOURCE = gst-libav-$(GST1_LIBAV_VERSION).tar.xz
 GST1_LIBAV_SITE = https://gstreamer.freedesktop.org/src/gst-libav
 GST1_LIBAV_LICENSE = LGPL-2.1+
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
