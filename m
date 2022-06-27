Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9C43C43334
	for <buildroot@archiver.kernel.org>; Mon, 27 Jun 2022 07:23:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2D0A4408C8;
	Mon, 27 Jun 2022 07:23:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2D0A4408C8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9nMgQoKZPePL; Mon, 27 Jun 2022 07:23:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 382C2408D8;
	Mon, 27 Jun 2022 07:23:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 382C2408D8
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E99941BF3D5
 for <buildroot@lists.busybox.net>; Mon, 27 Jun 2022 07:23:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C3E5560759
 for <buildroot@lists.busybox.net>; Mon, 27 Jun 2022 07:23:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C3E5560759
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VfJPYUBo5IOn for <buildroot@lists.busybox.net>;
 Mon, 27 Jun 2022 07:23:51 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E090D60674
Received: from mail-il1-x131.google.com (mail-il1-x131.google.com
 [IPv6:2607:f8b0:4864:20::131])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E090D60674
 for <buildroot@buildroot.org>; Mon, 27 Jun 2022 07:23:50 +0000 (UTC)
Received: by mail-il1-x131.google.com with SMTP id w10so5438140ilj.4
 for <buildroot@buildroot.org>; Mon, 27 Jun 2022 00:23:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=uAzJX+JLVUyrRVEsk9njLatyKvWkyff04mYNcjzsveo=;
 b=rd/OJZp/1l2+5af9oqqSb1wHl+kWnmCwtoG9oWArykdSDizQvpfzq+6xcnqmvvr13j
 u6EoHYR+UY48JxCvCqBiBNdQ443G/K+MMRiNAsBrLFZn6tV865iyjwWrVygXV7dTpgmM
 E5FLRjhDWo/5aFrMDYYmewXGan/9KaO+hrV/9pzxbymxPQAQdlqSZizHmqlpi8e0nH/+
 xGeRErlwThSu18r/af2z6q2JWs+r5Wo+cNoYUxTGc7WgUSn2Ec4BM5ORqYS4WTG7NhCP
 Bv0DCKYos8+5k/LQpRw7no0ZIS/exjylDYLk+xWNBLuuVxxjInfO+d6Q/BCllICNaPHu
 7Bng==
X-Gm-Message-State: AJIora+76P2n05GXQCE9FQL8FjvbFMD9JGmydVrzg9cSezbG60fDfREk
 smEo2ZExSV2tFgJ9mJ0IW6o8z4plxsA=
X-Google-Smtp-Source: AGRyM1sAMxeBpCrLC4nnP9BP5KZWhJ4wq4a8RIyPEjN72h26zMjfM2FYkZlG9gFBSeU/PH14gPbanA==
X-Received: by 2002:a05:6e02:20e2:b0:2da:35cc:6c45 with SMTP id
 q2-20020a056e0220e200b002da35cc6c45mr6247991ilv.81.1656314629824; 
 Mon, 27 Jun 2022 00:23:49 -0700 (PDT)
Received: from james-x399.localdomain (97-118-147-20.hlrn.qwest.net.
 [97.118.147.20]) by smtp.gmail.com with ESMTPSA id
 a14-20020a056638018e00b00335d7c314b1sm4488211jaq.53.2022.06.27.00.23.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jun 2022 00:23:49 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 27 Jun 2022 01:23:36 -0600
Message-Id: <20220627072336.2673298-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=uAzJX+JLVUyrRVEsk9njLatyKvWkyff04mYNcjzsveo=;
 b=kdcTXf65eoviqjK3pFYQ+/hDluhNcrM8XMI6ym6ghjzWQkBga8xBaOsy1j1xYLnVjw
 dLWdjVsuQVUL/TMCAfIuGLZvTT3WOdjWSd475Po6UmewWHGDHN3p9JbomHQAN1G9S7uj
 JEffKBhsyomr/mwTWiLeTq19Kc6InwSTd1+2sjEtUjhHSroB2yxbypzp8LvFPmzMPo2J
 tD5ZhhRqB/TlDTwe9fd46wF5FUtGWkByF9My7F3QtUhrUqxpuycWcKxyQm8wVhuR3wJ7
 2n7LaYyHJ56OgAVAPUqx8TgS3aDHDkqWcO68VBGYUdfKHBjFMrDGbs/258eJkkPXDzCv
 iQjw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=kdcTXf65
Subject: [Buildroot] [PATCH 1/1] package/{webkitgtk,
 wpewebkit}: select audiofx for multimedia
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
 James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

When using webkit with multimedia support the scaletempo element may
be needed, select the audiofx plugin which provides scaletempo.

Fixes runtime warning:
createGSTPlayBin: Failed to create scaletempo

See:
https://github.com/WebKit/WebKit/blob/72b59ad50e079037073722bbdf469c0952e399fa/Source/WebCore/platform/graphics/gstreamer/MediaPlayerPrivateGStreamer.cpp#L2813

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/webkitgtk/Config.in | 1 +
 package/wpewebkit/Config.in | 1 +
 2 files changed, 2 insertions(+)

diff --git a/package/webkitgtk/Config.in b/package/webkitgtk/Config.in
index 2575108363..d0c73f3f29 100644
--- a/package/webkitgtk/Config.in
+++ b/package/webkitgtk/Config.in
@@ -107,6 +107,7 @@ config BR2_PACKAGE_WEBKITGTK_MULTIMEDIA
 	select BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_VIDEOSCALE
 	select BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_VOLUME
 	select BR2_PACKAGE_GST1_PLUGINS_GOOD
+	select BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_AUDIOFX
 	select BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_AUTODETECT
 	select BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_ISOMP4
 	select BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_MATROSKA
diff --git a/package/wpewebkit/Config.in b/package/wpewebkit/Config.in
index f50e0da21c..a205e6276f 100644
--- a/package/wpewebkit/Config.in
+++ b/package/wpewebkit/Config.in
@@ -100,6 +100,7 @@ config BR2_PACKAGE_WPEWEBKIT_MULTIMEDIA
 	select BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_VIDEOSCALE
 	select BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_VOLUME
 	select BR2_PACKAGE_GST1_PLUGINS_GOOD
+	select BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_AUDIOFX
 	select BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_AUTODETECT
 	select BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_ISOMP4
 	select BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_MATROSKA
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
