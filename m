Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D793C4332F
	for <buildroot@archiver.kernel.org>; Sat, 15 Oct 2022 23:06:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 41FE9408CD;
	Sat, 15 Oct 2022 23:06:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 41FE9408CD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id h9XoBdTjuTfr; Sat, 15 Oct 2022 23:06:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 65067408D1;
	Sat, 15 Oct 2022 23:06:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 65067408D1
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 636431BF3FF
 for <buildroot@lists.busybox.net>; Sat, 15 Oct 2022 23:05:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3D309813FE
 for <buildroot@lists.busybox.net>; Sat, 15 Oct 2022 23:05:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3D309813FE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SIe9tdOiufWc for <buildroot@lists.busybox.net>;
 Sat, 15 Oct 2022 23:05:42 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 573E081911
Received: from mail-il1-x136.google.com (mail-il1-x136.google.com
 [IPv6:2607:f8b0:4864:20::136])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 573E081911
 for <buildroot@buildroot.org>; Sat, 15 Oct 2022 23:05:42 +0000 (UTC)
Received: by mail-il1-x136.google.com with SMTP id l3so3835947ilg.13
 for <buildroot@buildroot.org>; Sat, 15 Oct 2022 16:05:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7422UTSuHF5WPPxc00CgqX24FEzDs+FOsEh3SFa3GRM=;
 b=Yo2M2DE6QEI6uvkGVLrZSRg32qBqKje7j7fVxbFppjLPWxmcGta81tqIvj2rIoTPcO
 1SUM4cggPs2/TgouDZ+m6sSkYT5iAnYyXCJGCcITpBUxt8gZKrCD4DBHhuAO3axQa+2w
 +MkPpi/dmi58Y/W22ja4EbQYQJm20PQfdn2j/xrWESDXp9y1XmtuaspJDbaz+4+EppuF
 PElqaBam0cn4sarxtIveywKO0A+qWFOmLV3orvqQDH0ZaPiI7WV/q9X83xNiDtov/O60
 yRszOFAk1wxwd3tR4tpofRy/B+cO1qyb29zL49QfwolhWak9IJJTNOtLHYKXgjF3ye6C
 F3nA==
X-Gm-Message-State: ACrzQf1/oh2FfBXM4Kg+e+KRLn9Pmhzu/afa15C67LNrcINnwTfbiYoi
 /lIWqFyIXFwKE34TbNwf7Qpe30MYve/6fQ==
X-Google-Smtp-Source: AMsMyM7kKuOgIwpwcnuFCmTJiVHb8LpPOrNMIm8OFCwa2SC+oSdEylVjoqytKRvB3rlwIWfPwHuZng==
X-Received: by 2002:a05:6e02:1a89:b0:2fd:4b9c:3390 with SMTP id
 k9-20020a056e021a8900b002fd4b9c3390mr1720454ilv.179.1665875141025; 
 Sat, 15 Oct 2022 16:05:41 -0700 (PDT)
Received: from james-x399.localdomain (71-218-240-5.hlrn.qwest.net.
 [71.218.240.5]) by smtp.gmail.com with ESMTPSA id
 186-20020a021dc3000000b00363e61908bfsm2718163jaj.10.2022.10.15.16.05.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 15 Oct 2022 16:05:40 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 15 Oct 2022 17:05:26 -0600
Message-Id: <20221015230534.4016536-4-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221015230534.4016536-1-james.hilliard1@gmail.com>
References: <20221015230534.4016536-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7422UTSuHF5WPPxc00CgqX24FEzDs+FOsEh3SFa3GRM=;
 b=cmI2wlJIB6MMKnqif3aVuRnJko2QHTH0ea8QDaCbJ/0oPKxWX0fa9sX7Ya2KP13nkq
 U89B5OKjzmW4dXWjpDv1f4V8jFKVOcX+BjcItovhayCVBJC+KwBTfIwqeRqejX2zAdkB
 PVBjj5L/iKAB/+LrQ+c0x4BNuuKDZh4pZMkXvjoGd9X60xULwzq+rsRuYmjv4Cbr3UGN
 P0Uc0O6Ke6I6jriab0Bhs8iiwAQgB/GhjizF0GKs5oQ2BIpWGAGmCf3WxA+akNVpEF+d
 rXFmndi2osYB0I6R0zqtF8lpRz4zUdpsSzI5cot2vgJgEaR963yBOmc3rV+NhSENZkbp
 zhdA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=cmI2wlJI
Subject: [Buildroot] [PATCH 04/12] package/gst1-plugins-bad: bump version to
 1.20.4
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
 package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.hash | 4 ++--
 package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.hash b/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.hash
index 5a413cd350..c8789a707d 100644
--- a/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.hash
+++ b/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.hash
@@ -1,3 +1,3 @@
-# From https://gstreamer.freedesktop.org/src/gst-plugins-bad/gst-plugins-bad-1.20.3.tar.xz.sha256sum
-sha256  7a11c13b55dd1d2386dd902219e41cbfcdda8e1e0aa3e738186c95074b35da4f  gst-plugins-bad-1.20.3.tar.xz
+# From https://gstreamer.freedesktop.org/src/gst-plugins-bad/gst-plugins-bad-1.20.4.tar.xz.sha256sum
+sha256  a1a3f53b3604d9a04fdd0bf9a1a616c3d2dab5320489e9ecee1178e81e33a16a  gst-plugins-bad-1.20.4.tar.xz
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
diff --git a/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk b/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
index 57974d723a..14710a2501 100644
--- a/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
+++ b/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GST1_PLUGINS_BAD_VERSION = 1.20.3
+GST1_PLUGINS_BAD_VERSION = 1.20.4
 GST1_PLUGINS_BAD_SOURCE = gst-plugins-bad-$(GST1_PLUGINS_BAD_VERSION).tar.xz
 GST1_PLUGINS_BAD_SITE = https://gstreamer.freedesktop.org/src/gst-plugins-bad
 GST1_PLUGINS_BAD_INSTALL_STAGING = YES
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
