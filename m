Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 603DAC4332F
	for <buildroot@archiver.kernel.org>; Sat, 15 Oct 2022 23:07:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 10CE560DF9;
	Sat, 15 Oct 2022 23:07:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 10CE560DF9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id stbUMnVT5gDi; Sat, 15 Oct 2022 23:07:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 49E6960DF0;
	Sat, 15 Oct 2022 23:07:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 49E6960DF0
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 14B771BF3FF
 for <buildroot@lists.busybox.net>; Sat, 15 Oct 2022 23:05:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 92E0F81911
 for <buildroot@lists.busybox.net>; Sat, 15 Oct 2022 23:05:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 92E0F81911
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UnR5crI79CBE for <buildroot@lists.busybox.net>;
 Sat, 15 Oct 2022 23:05:46 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AC2D681403
Received: from mail-il1-x131.google.com (mail-il1-x131.google.com
 [IPv6:2607:f8b0:4864:20::131])
 by smtp1.osuosl.org (Postfix) with ESMTPS id AC2D681403
 for <buildroot@buildroot.org>; Sat, 15 Oct 2022 23:05:46 +0000 (UTC)
Received: by mail-il1-x131.google.com with SMTP id q18so4213103ils.12
 for <buildroot@buildroot.org>; Sat, 15 Oct 2022 16:05:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=C80T/G1WJwT/wf8wjMboC4CVHqPovZM+oRTn+yy10tM=;
 b=T1zEmI8A/eYCM5F8yX4pjes4zsQfejgOpvR3R1P/SgmHr1iq3wvi+GMhci4UygFhjc
 rVwgl6e9YoA+q6D1vfpuse2z2pPcvGjHRIT4UU4tQwoMRRha8N9wTBPB0Cjp5RD8WAIG
 xK/RSn3toSLkTnO8w1Q35W89xBBURglEcJON2Va6j448ft3GecnFx6oKvBWFRAHQ7umj
 Qxaq9sm/queRjSJZcj+HXOTyuHf1cfaRl64NRLZvP3Yk0M1ltEfGXIOJdJj0tCN0fett
 kPtyS5483ee9bWl+OPnIv/o88vxKelIKOvzXw0+olfaEu2fI8j5kxxe8IHRlpJV/7pYy
 IiOA==
X-Gm-Message-State: ACrzQf1gfBiLdbOqoIeA/N/FeRMZEH+ojMdijkvfZGzphDf/jU9c1ykO
 rkBqUlemioQcg9ZnGAOXlNJzbxTIADQIwQ==
X-Google-Smtp-Source: AMsMyM57T2Vk9vA3MbXMpjxxB9OJCcqv2R6ZpgT2QCFENp1hCENTLpwOJXH+JsgG7Q75jCOw48yG+w==
X-Received: by 2002:a92:dc8a:0:b0:2f9:9675:42ef with SMTP id
 c10-20020a92dc8a000000b002f9967542efmr1905097iln.130.1665875145491; 
 Sat, 15 Oct 2022 16:05:45 -0700 (PDT)
Received: from james-x399.localdomain (71-218-240-5.hlrn.qwest.net.
 [71.218.240.5]) by smtp.gmail.com with ESMTPSA id
 186-20020a021dc3000000b00363e61908bfsm2718163jaj.10.2022.10.15.16.05.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 15 Oct 2022 16:05:44 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 15 Oct 2022 17:05:31 -0600
Message-Id: <20221015230534.4016536-9-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221015230534.4016536-1-james.hilliard1@gmail.com>
References: <20221015230534.4016536-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=C80T/G1WJwT/wf8wjMboC4CVHqPovZM+oRTn+yy10tM=;
 b=RKkR0nr2XfUYlhQYtfw8s7GUlKPEpuVt1SaLS7RlJOfBeERVhQtY7yvG+GH0kWDtu7
 NZGtJD0gFo+YTXNtZSPa0WRlSoQhSrRd/6yhdB36ackHCgNCavgvgJ6nGexT8uhchqgj
 05mQuSoNm/uYdzJFjVI+GTj+xmbQCtcaSd/xHMNR+96N5HTnxjfs5DSAki0iNL2u7C43
 wJYPKsovLd3ck39LbCQm6cYJgG95Tw/QaGpldU0ssANz5VvYVDOOKw84Gxv7zX5b5xhf
 UbH5lfmWk1vPi1vECPpiReya7f1xUUAgv7yO7XoXPnUqqWap+Dv4oMj+9i1NxptWvXVI
 D6AQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=RKkR0nr2
Subject: [Buildroot] [PATCH 09/12] package/gst1-rtsp-server: bump version to
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
 package/gstreamer1/gst1-rtsp-server/gst1-rtsp-server.hash | 4 ++--
 package/gstreamer1/gst1-rtsp-server/gst1-rtsp-server.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gstreamer1/gst1-rtsp-server/gst1-rtsp-server.hash b/package/gstreamer1/gst1-rtsp-server/gst1-rtsp-server.hash
index 13dcb764d8..b6a31f8796 100644
--- a/package/gstreamer1/gst1-rtsp-server/gst1-rtsp-server.hash
+++ b/package/gstreamer1/gst1-rtsp-server/gst1-rtsp-server.hash
@@ -1,4 +1,4 @@
-# From https://gstreamer.freedesktop.org/src/gst-rtsp-server/gst-rtsp-server-1.20.3.tar.xz.sha256sum
-sha256  ee402718be9b127f0e5e66ca4c1b4f42e4926ec93ba307b7ccca5dc6cc9794ca  gst-rtsp-server-1.20.3.tar.xz
+# From https://gstreamer.freedesktop.org/src/gst-rtsp-server/gst-rtsp-server-1.20.4.tar.xz.sha256sum
+sha256  88d9ef634e59aeb8cc183ad5ae444557c5a88dd49d833b9072bc6e1fae6a3d7d  gst-rtsp-server-1.20.4.tar.xz
 sha256  ad2eec519ebd4b5df86ea84dff24ae3bfa2edea846a703b58902dd221ae375db  COPYING
 sha256  ad2eec519ebd4b5df86ea84dff24ae3bfa2edea846a703b58902dd221ae375db  COPYING.LIB
diff --git a/package/gstreamer1/gst1-rtsp-server/gst1-rtsp-server.mk b/package/gstreamer1/gst1-rtsp-server/gst1-rtsp-server.mk
index 02cf9e5eb1..0b18c1fcf8 100644
--- a/package/gstreamer1/gst1-rtsp-server/gst1-rtsp-server.mk
+++ b/package/gstreamer1/gst1-rtsp-server/gst1-rtsp-server.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GST1_RTSP_SERVER_VERSION = 1.20.3
+GST1_RTSP_SERVER_VERSION = 1.20.4
 GST1_RTSP_SERVER_SOURCE = gst-rtsp-server-$(GST1_RTSP_SERVER_VERSION).tar.xz
 GST1_RTSP_SERVER_SITE = http://gstreamer.freedesktop.org/src/gst-rtsp-server
 GST1_RTSP_SERVER_LICENSE = LGPL-2.1+
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
