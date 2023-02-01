Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F317C38142
	for <buildroot@archiver.kernel.org>; Wed,  1 Feb 2023 05:18:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C9EA280B54;
	Wed,  1 Feb 2023 05:18:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C9EA280B54
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zTXxhoM32TIa; Wed,  1 Feb 2023 05:18:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E923A813F7;
	Wed,  1 Feb 2023 05:18:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E923A813F7
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B68B01BF2F0
 for <buildroot@lists.busybox.net>; Wed,  1 Feb 2023 05:17:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 90F53405BB
 for <buildroot@lists.busybox.net>; Wed,  1 Feb 2023 05:17:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 90F53405BB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gyIfu5jiHJ_B for <buildroot@lists.busybox.net>;
 Wed,  1 Feb 2023 05:17:15 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BE505405AE
Received: from mail-il1-x12c.google.com (mail-il1-x12c.google.com
 [IPv6:2607:f8b0:4864:20::12c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BE505405AE
 for <buildroot@buildroot.org>; Wed,  1 Feb 2023 05:17:15 +0000 (UTC)
Received: by mail-il1-x12c.google.com with SMTP id u7so5946140ilg.4
 for <buildroot@buildroot.org>; Tue, 31 Jan 2023 21:17:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zIEZ1RXIWguF/OaUKcBM3+yHarP1E1OHXTsKyXbC3W4=;
 b=f2UKr5jsW1/i4AKIIqfcfpDVvs5j7tnD3h9ERrcPLuiWYtwuDIz6XD9tJBqeutn4+G
 gfPumTJugtV5xabXKz4XBFnv7B5DOrpWmC1lz1MlRlfpvg6mrDrV1eb8U/o4i8+6F7j0
 nQwkxdjrhLOUd6HwV3PoVyDL6c0LiqDO9Aj51rdVocKU4s/DE+bjwoMf6P9dA2vOCx4i
 +20xjqTKPkFssMkPrw/xUgaW41/90MGZyCA867LcTHSnzmbmtGYjYbELm+XnzkEYo2u/
 GhP+NtyhWMQW5BmkEGL4IreiYV2Ki5qrIeKuJURmdsWT6HFmKshP7+fLccH1qrT+wBKi
 f/+w==
X-Gm-Message-State: AO0yUKUCzOOYELpKDsdUBWVWQtKQuMwdIkwOit3eZcSUKCfnKTkyDi93
 cdCMYXXgHPCdGbgwdn3oDI2idH+22HmY3g==
X-Google-Smtp-Source: AK7set+B5Z66xtbX+3MmVBMBFZN8edzf9JG1fLVHrbJSoVZ7PVqjUMgjgSpY0CmbG1MUIHafCsOpTg==
X-Received: by 2002:a05:6e02:2149:b0:311:ad48:ff26 with SMTP id
 d9-20020a056e02214900b00311ad48ff26mr408990ilv.14.1675228634703; 
 Tue, 31 Jan 2023 21:17:14 -0800 (PST)
Received: from james-x399.localdomain (71-218-114-73.hlrn.qwest.net.
 [71.218.114.73]) by smtp.gmail.com with ESMTPSA id
 k9-20020a02ccc9000000b003a961e5d33fsm6235960jaq.49.2023.01.31.21.17.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 Jan 2023 21:17:14 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 31 Jan 2023 22:16:53 -0700
Message-Id: <20230201051658.383420-8-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230201051658.383420-1-james.hilliard1@gmail.com>
References: <20230201051658.383420-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zIEZ1RXIWguF/OaUKcBM3+yHarP1E1OHXTsKyXbC3W4=;
 b=EQoht1AUbJ1peTvdTHr1fV2PnxvBBE7mncfVvsiynsjChOW+X7GJVV8V+cSXen2z79
 g2xbKo1zG+jXCBcgV0tVnC5mNXsCtelR91aToY1yjAzy4slGDMuYontzkWI9LX+6//bi
 PC0ZupOuc9KcWFQZdMBoi4RE/4HQuswWre2y4unQxAtpapj3mCytqy+xrSnQ3lLOnfoc
 5M1AKoYgEomsadz+LJJOESaXQ1qTlyihnkv5rws7qV6gJ2zIuKfkun38S40xljLwy/Jb
 gb7AgOnBk3TpVpqRwuqjOdBwH60QXE/h3YhCEEmnnri2qDduYgdGx+5Kvb4HQPzqXcAW
 JLvg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=EQoht1AU
Subject: [Buildroot] [PATCH 08/13] package/gst1-libav: bump version to 1.22.0
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
Cc: Adrian Perez de Castro <aperez@igalia.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Gregory Dymarek <gregd72002@gmail.com>
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
index 78f5b5bb07..c2c58ab2fe 100644
--- a/package/gstreamer1/gst1-libav/gst1-libav.hash
+++ b/package/gstreamer1/gst1-libav/gst1-libav.hash
@@ -1,3 +1,3 @@
-# From https://gstreamer.freedesktop.org/src/gst-libav/gst-libav-1.20.4.tar.xz.sha256sum
-sha256  04ccbdd58fb31dd94098da599209834a0e7661638c5703381dd0a862c56fc532  gst-libav-1.20.4.tar.xz
+# From https://gstreamer.freedesktop.org/src/gst-libav/gst-libav-1.22.0.tar.xz.sha256sum
+sha256  0e48407b4905227a260213dbda84cba3812f0530fc7a75b43829102ef82810f1  gst-libav-1.22.0.tar.xz
 sha256  ad2eec519ebd4b5df86ea84dff24ae3bfa2edea846a703b58902dd221ae375db  COPYING
diff --git a/package/gstreamer1/gst1-libav/gst1-libav.mk b/package/gstreamer1/gst1-libav/gst1-libav.mk
index a867af5147..d4b3873af1 100644
--- a/package/gstreamer1/gst1-libav/gst1-libav.mk
+++ b/package/gstreamer1/gst1-libav/gst1-libav.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GST1_LIBAV_VERSION = 1.20.4
+GST1_LIBAV_VERSION = 1.22.0
 GST1_LIBAV_SOURCE = gst-libav-$(GST1_LIBAV_VERSION).tar.xz
 GST1_LIBAV_SITE = https://gstreamer.freedesktop.org/src/gst-libav
 GST1_LIBAV_LICENSE = LGPL-2.1+
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
