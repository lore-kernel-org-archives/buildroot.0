Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46861C43334
	for <buildroot@archiver.kernel.org>; Mon, 27 Jun 2022 05:35:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 918FB61053;
	Mon, 27 Jun 2022 05:34:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 918FB61053
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zgj1JJcYjESW; Mon, 27 Jun 2022 05:34:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A86666104C;
	Mon, 27 Jun 2022 05:34:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A86666104C
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3B8431BF33E
 for <buildroot@lists.busybox.net>; Mon, 27 Jun 2022 05:34:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 11B4E4171B
 for <buildroot@lists.busybox.net>; Mon, 27 Jun 2022 05:34:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 11B4E4171B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id F0tkoJBIR2Gj for <buildroot@lists.busybox.net>;
 Mon, 27 Jun 2022 05:34:30 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B401041838
Received: from mail-io1-xd2a.google.com (mail-io1-xd2a.google.com
 [IPv6:2607:f8b0:4864:20::d2a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B401041838
 for <buildroot@buildroot.org>; Mon, 27 Jun 2022 05:34:30 +0000 (UTC)
Received: by mail-io1-xd2a.google.com with SMTP id r133so8490377iod.3
 for <buildroot@buildroot.org>; Sun, 26 Jun 2022 22:34:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=j7Yb0jvvuOtAsD0CD6YxZ7DZF2qbVOhXK8s/uDsGjlc=;
 b=3rfDvkZ7aVV1xKBqN58+PLiuWielw3Cg08xur/ejpMjGuHm9ths34LTdWs/4TNoTrJ
 a1GotUr8LIBnL/SyikGuUd2b45BwVUy6TEleZm4ThLGl9tJCCCZipGeEFOijIIyko6Nl
 aMaaAD5CkpneAfnao6AezOHXT2TRQub4+gfz6G7SWZwpu9iy18SwXv9+p5ywP1b8B6gy
 VVbR/2Oxf0tVKeUflFXFA7+6E3nv50ktFKybCO+vL3igArcIzeGIdlmNxZ3a+vixT136
 9e+QXtNeiHd9rPi0Nzgo1y35znrOcVjdh9d7hOT4Nekxl9UJuudX+oXiUI4B6k0EVVQf
 eh2w==
X-Gm-Message-State: AJIora9X0e200dLa0iwJTcA18Brtyl5SCDZSI8S6T4YzymkxIxFznnaD
 /xDhM6iss6TR2KOCBwH1gAmYkrxBD2M=
X-Google-Smtp-Source: AGRyM1uNnHBz2wdxrqSJXf3gG+IhBy7vhvCAvT5vu8BKzZFQ1ZHPKN5OmIgKnFAMd9Aor6m1UGgXTA==
X-Received: by 2002:a05:6638:2486:b0:331:f9b9:a8ef with SMTP id
 x6-20020a056638248600b00331f9b9a8efmr6591750jat.139.1656308069629; 
 Sun, 26 Jun 2022 22:34:29 -0700 (PDT)
Received: from james-x399.localdomain (97-118-147-20.hlrn.qwest.net.
 [97.118.147.20]) by smtp.gmail.com with ESMTPSA id
 n9-20020a056e021ba900b002d95fd5ad64sm4082623ili.59.2022.06.26.22.34.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Jun 2022 22:34:29 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 26 Jun 2022 23:34:14 -0600
Message-Id: <20220627053422.618280-4-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220627053422.618280-1-james.hilliard1@gmail.com>
References: <20220627053422.618280-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=j7Yb0jvvuOtAsD0CD6YxZ7DZF2qbVOhXK8s/uDsGjlc=;
 b=lnGdveG/61n2f6UjcmXuz2OLWpJQxUSGEkmOQusO3H5oCEu6uTZf0gspkTMko90bdC
 Oq8K2WwNv2o2d+4axXHIjurp3rG7IR4yphVgZmC4jI1ZWcixnF50UhBkgASESF3RMirc
 VR7vQqSYmWPRW7nC5wP07cgpx5/yJ5mXZKgQjOyh4nHc3tl98qXRgbNOy/TvIMQM5tZS
 8Dj4aFHH/ihxrEnjAWJyKl9dgW3eAqVgwa5zOog5TvS8l9ywxmotnp0AV+ixrjv/Z4EJ
 9zy0trScVTZj3R5TZWiY68fwIpnKR2nh2mTUn6Ca2dDLjVL01gh0v5z7ybysEzb/COHv
 4sjg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=lnGdveG/
Subject: [Buildroot] [PATCH 04/12] package/gst1-plugins-bad: bump version to
 1.20.3
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Peter Seiderer <ps.report@gmx.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.hash | 4 ++--
 package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.hash b/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.hash
index 2874d955f4..5a413cd350 100644
--- a/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.hash
+++ b/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.hash
@@ -1,3 +1,3 @@
-# From https://gstreamer.freedesktop.org/src/gst-plugins-bad/gst-plugins-bad-1.20.1.tar.xz.sha256sum
-sha256  09d3c2cf5911f0bc7da6bf557a55251779243d3de216b6a26cc90c445b423848  gst-plugins-bad-1.20.1.tar.xz
+# From https://gstreamer.freedesktop.org/src/gst-plugins-bad/gst-plugins-bad-1.20.3.tar.xz.sha256sum
+sha256  7a11c13b55dd1d2386dd902219e41cbfcdda8e1e0aa3e738186c95074b35da4f  gst-plugins-bad-1.20.3.tar.xz
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
diff --git a/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk b/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
index 343a53a3c5..57974d723a 100644
--- a/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
+++ b/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GST1_PLUGINS_BAD_VERSION = 1.20.1
+GST1_PLUGINS_BAD_VERSION = 1.20.3
 GST1_PLUGINS_BAD_SOURCE = gst-plugins-bad-$(GST1_PLUGINS_BAD_VERSION).tar.xz
 GST1_PLUGINS_BAD_SITE = https://gstreamer.freedesktop.org/src/gst-plugins-bad
 GST1_PLUGINS_BAD_INSTALL_STAGING = YES
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
