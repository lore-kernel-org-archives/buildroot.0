Return-Path: <SRS0=F6DF=PN=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A768C433F5
	for <buildroot@archiver.kernel.org>; Mon, 25 Oct 2021 07:57:12 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E023960E08
	for <buildroot@archiver.kernel.org>; Mon, 25 Oct 2021 07:57:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E023960E08
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A655F80E0C;
	Mon, 25 Oct 2021 07:57:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cjilIy6Ujmkj; Mon, 25 Oct 2021 07:57:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2688780D14;
	Mon, 25 Oct 2021 07:57:10 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 28BC21BF2CC
 for <buildroot@lists.busybox.net>; Mon, 25 Oct 2021 07:57:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 259476065A
 for <buildroot@lists.busybox.net>; Mon, 25 Oct 2021 07:57:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SEeN5t9EhVH8 for <buildroot@lists.busybox.net>;
 Mon, 25 Oct 2021 07:57:07 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-il1-x134.google.com (mail-il1-x134.google.com
 [IPv6:2607:f8b0:4864:20::134])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 21BB960643
 for <buildroot@buildroot.org>; Mon, 25 Oct 2021 07:57:07 +0000 (UTC)
Received: by mail-il1-x134.google.com with SMTP id j6so11620056ila.1
 for <buildroot@buildroot.org>; Mon, 25 Oct 2021 00:57:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=hpBUWukK2jxYQD+a92tlq4zNdZee8+Llpqma42TpJcA=;
 b=du/ZFZ2Vcgo1/nS3SRapRPsCGEJcHh+h7Zxu5dGk8TU9you9u0B0z66T0J242FmJYn
 IQv9FWKZ11Q1M4oJoyqInIMbRiz9uU2028y5tCZbq0CCVYAvFnqdaHW8c15LlvsQjYNE
 ug7T1rjIH/ZjD4CKetjeHUSUWoyBhYTVc5pnGIGydQg7XljNFYPAlDsngOSDVSfaGiS3
 zsHKuy/ksATSnfyLd2dnCv8hfYcRduDxRrBC+Iz9Hb7gtxDNvjSHBiZ5Mb+Z4gaIeIYS
 V/k8UB/bQI1Pa8kUS5fGEklATKGGM4DPrGGeVgWqKC3Cyxlvzzo2kNWNl4TMLII93U+w
 q3dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=hpBUWukK2jxYQD+a92tlq4zNdZee8+Llpqma42TpJcA=;
 b=ARKKHs45QPWRz/7mIPDBaZ8alNTywCb2hM7rAF1i4rUE0ofCJivRrd5hoC7ys7zbdY
 9ZkQRwxdxy5DATmMtrHPLrgQKF7rgkPUtPT+jYormbBV61tPUl6ZS0M1wubMzN0Encz3
 r/zr/A8r3xYJtLD6a3S6XhY2YUQwOdWaO/sUX3mOgrfxEyqCW9ZsQxNlP5XKe8+ACvY0
 wR3u3LhjgkiNavl7L2UhrTdfTgc9l39jzUBP1AsNf6Y6r2a0rNXRssyOHGsaeIVCCBGH
 PJWCXutylWo68HQKaVof0jSdNYSYMFz1fo2s6YKIzqPr1fMCTUsNw8dcQfQKU36vO+gI
 ZUHA==
X-Gm-Message-State: AOAM533HwWm2L6Kti7+Vy3stXSUZQCY1hfpprXYGq/DxUTzTq2YYemut
 Vomhv7TFUAlRMofcv7U29N5YwDrqdO4=
X-Google-Smtp-Source: ABdhPJz09unZKCTu85bGH95DmivqemvCjSqdz8z/n1wCZE+MZxByfbDZyg2WL7dWkqSY75e8FVJ3vg==
X-Received: by 2002:a92:7f0e:: with SMTP id a14mr8600060ild.215.1635148626105; 
 Mon, 25 Oct 2021 00:57:06 -0700 (PDT)
Received: from james-x399.localdomain (71-218-115-49.hlrn.qwest.net.
 [71.218.115.49])
 by smtp.gmail.com with ESMTPSA id c11sm8082476ilk.22.2021.10.25.00.57.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Oct 2021 00:57:05 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 25 Oct 2021 01:56:59 -0600
Message-Id: <20211025075659.3845637-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/gstreamer1/gst1-plugins-bad: fix
 meson options
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

Fix teletextdec name and remove vdpau which is no longer available.

Fixes:
output/build/gst1-plugins-bad-1.18.5/meson.build:1:0: ERROR: Unknown options: "teletextdec, vdpau"

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk b/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
index d8b2e2a5d3..d3f089bfed 100644
--- a/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
+++ b/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
@@ -59,12 +59,11 @@ GST1_PLUGINS_BAD_CONF_OPTS += \
 	-Dofa=disabled \
 	-Dopenexr=disabled \
 	-Dopenni2=disabled \
-	-Dteletextdec=disabled \
+	-Dteletext=disabled \
 	-Dwildmidi=disabled \
 	-Dsmoothstreaming=disabled \
 	-Dsoundtouch=disabled \
 	-Dgme=disabled \
-	-Dvdpau=disabled \
 	-Dspandsp=disabled \
 	-Dsvthevcenc=disabled \
 	-Dtranscode=disabled \
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
