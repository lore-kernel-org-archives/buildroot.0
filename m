Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AC14C433FE
	for <buildroot@archiver.kernel.org>; Sat, 15 Oct 2022 23:06:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id BD6CD405D2;
	Sat, 15 Oct 2022 23:06:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BD6CD405D2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AfzUu9JufXHx; Sat, 15 Oct 2022 23:06:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 00A1140291;
	Sat, 15 Oct 2022 23:06:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 00A1140291
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id EA26C1BF3FF
 for <buildroot@lists.busybox.net>; Sat, 15 Oct 2022 23:05:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C40E040939
 for <buildroot@lists.busybox.net>; Sat, 15 Oct 2022 23:05:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C40E040939
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2toJneLhZKlC for <buildroot@lists.busybox.net>;
 Sat, 15 Oct 2022 23:05:41 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6959C40935
Received: from mail-il1-x132.google.com (mail-il1-x132.google.com
 [IPv6:2607:f8b0:4864:20::132])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6959C40935
 for <buildroot@buildroot.org>; Sat, 15 Oct 2022 23:05:41 +0000 (UTC)
Received: by mail-il1-x132.google.com with SMTP id r20so4229992ilt.11
 for <buildroot@buildroot.org>; Sat, 15 Oct 2022 16:05:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=x7yz34vc6y4FQSxys8FZZmxMwT9Egw+i3pSwOTdPPLg=;
 b=EuodUzBzWdFTMg/48Zc5TvOeK3FGH46f0j2OYWSfPEuQ09Seru5VlAU4zGzNjSdm6y
 RA6Ur213XsRYECpMf6sHXEsBk9Y1Us8JJs92C/vIxrDVecbqbkYj/jqJ0uwfYBzYtz+2
 RN0HvntNMMZCbYYTTO55SgP3KiKgiv/8X7xW2mfItmzMWaTTHMIXOrRVNtdDeP6/JXRv
 x++vQ7T87/zYNQm7CYS8Miv67yEVLdv+Vuj5gRQ0G61UCZdVT34/j5xXGoqo4s2FtaKA
 uT8CT/CjbL0n/JlfDUnf1jUTWV9YAvswK+Y8j58ySdR7gc5gFO2PNfBlgHky8ivy2XK8
 fvFg==
X-Gm-Message-State: ACrzQf38iuOHoFif32GRP3VcSJJZlGcDcdKqxLMIJAso8ntFJwbXgJQ8
 MeEEEdV6P/d0+HMixvSzgjjqJVkWdB4jeg==
X-Google-Smtp-Source: AMsMyM5VpZm89o39STYhoaNs1YCHwYbec0x46AcbpIW1qiCXMAaxyp6w/wA/0kZKrvm4NtVuNryZTQ==
X-Received: by 2002:a92:730c:0:b0:2f5:7dd7:45f7 with SMTP id
 o12-20020a92730c000000b002f57dd745f7mr1928197ilc.12.1665875140062; 
 Sat, 15 Oct 2022 16:05:40 -0700 (PDT)
Received: from james-x399.localdomain (71-218-240-5.hlrn.qwest.net.
 [71.218.240.5]) by smtp.gmail.com with ESMTPSA id
 186-20020a021dc3000000b00363e61908bfsm2718163jaj.10.2022.10.15.16.05.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 15 Oct 2022 16:05:39 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 15 Oct 2022 17:05:25 -0600
Message-Id: <20221015230534.4016536-3-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221015230534.4016536-1-james.hilliard1@gmail.com>
References: <20221015230534.4016536-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=x7yz34vc6y4FQSxys8FZZmxMwT9Egw+i3pSwOTdPPLg=;
 b=qACNUVEPjBRmMe3SOPtcBT+hYvMjz0o7S5nG6UTR4v0ULzIzzfTraxQQcixDCY0Ehx
 e5A7ZCVdiu/Xn6sNslulTY6gKw1tVTm+lqgkfFhT2fwpgwuCsqJIFOxBHyrR7K8pqlvK
 0/8jZYjiY0jb7Ec+zqxmVutL+izkt48PEasL456avNNm8fExTOszwq9OzEHvzCpE+d+e
 xctTHWonuzEx0bv5DOXxgUIddIW976OAEZlUqVNJEtZwH1gm3GIRATAu4d76iSRilNRq
 ehrCR54X+rtLtUQVTLMR87gIyAI2ee3SCB8mgoOpNoub1jY9FRGe+g0Qxe/OydEGhyyy
 yegA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=qACNUVEP
Subject: [Buildroot] [PATCH 03/12] package/gst1-plugins-good: bump version
 to 1.20.4
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
 package/gstreamer1/gst1-plugins-good/gst1-plugins-good.hash | 4 ++--
 package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.hash b/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.hash
index 81da41388f..b30c512878 100644
--- a/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.hash
+++ b/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.hash
@@ -1,3 +1,3 @@
-# From https://gstreamer.freedesktop.org/src/gst-plugins-good/gst-plugins-good-1.20.3.tar.xz.sha256sum
-sha256  f8f3c206bf5cdabc00953920b47b3575af0ef15e9f871c0b6966f6d0aa5868b7  gst-plugins-good-1.20.3.tar.xz
+# From https://gstreamer.freedesktop.org/src/gst-plugins-good/gst-plugins-good-1.20.4.tar.xz.sha256sum
+sha256  b16130fbe632fa8547c2147a0ef575b0140fb521065c5cb121c72ddbd23b64da  gst-plugins-good-1.20.4.tar.xz
 sha256  6095e9ffa777dd22839f7801aa845b31c9ed07f3d6bf8a26dc5d2dec8ccc0ef3  COPYING
diff --git a/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk b/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk
index de7dcb985d..cc7bab5824 100644
--- a/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk
+++ b/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GST1_PLUGINS_GOOD_VERSION = 1.20.3
+GST1_PLUGINS_GOOD_VERSION = 1.20.4
 GST1_PLUGINS_GOOD_SOURCE = gst-plugins-good-$(GST1_PLUGINS_GOOD_VERSION).tar.xz
 GST1_PLUGINS_GOOD_SITE = https://gstreamer.freedesktop.org/src/gst-plugins-good
 GST1_PLUGINS_GOOD_LICENSE_FILES = COPYING
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
