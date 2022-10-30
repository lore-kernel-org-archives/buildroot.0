Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A6F5ECAAA1
	for <buildroot@archiver.kernel.org>; Sun, 30 Oct 2022 21:35:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B11D540117;
	Sun, 30 Oct 2022 21:35:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B11D540117
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zh8h8Tpi6aeX; Sun, 30 Oct 2022 21:35:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id CD8A0400DC;
	Sun, 30 Oct 2022 21:35:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CD8A0400DC
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 15D2A1BF315
 for <buildroot@lists.busybox.net>; Sun, 30 Oct 2022 21:35:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E4F74400DC
 for <buildroot@lists.busybox.net>; Sun, 30 Oct 2022 21:35:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E4F74400DC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4ByMbP8f81R5 for <buildroot@lists.busybox.net>;
 Sun, 30 Oct 2022 21:35:24 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D83E9400CE
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D83E9400CE
 for <buildroot@buildroot.org>; Sun, 30 Oct 2022 21:35:23 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id a14so13569110wru.5
 for <buildroot@buildroot.org>; Sun, 30 Oct 2022 14:35:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=lW29RfIxvBTC8q5gcyjrbFouOOmHWs7rQ+O11C2YTBA=;
 b=IH2Um4aij85XZX8QoHn4Cm/kMVu36dTcLJsYouQyYEMvP4Ocp1RKX2vzEJQGs9PKsK
 RLTbjvlaHb7X/9HYg+USx7efFzIExpcqCkisz/083hkGsLSERucurC+XZF3im+gKbvqk
 Zk7id7DAK2YpdSymU78I6j0DhA7d2VlHIYFxF1It2Ya0SQiyw1DJga1XI/IXNLUxzhub
 lrpKzEDPqIdVHwgqsxCC205ZqmcKl18ovHLYg5DtaSAgfkdNqYGH5P/VIwHD9SbPO6N2
 okgDuB/kjFm0Ml8dd6x7meojbAouf2z+kAS0OFYcHYXHf2ayZ6xqhbE3nbVLxe2IQUZr
 sNwg==
X-Gm-Message-State: ACrzQf0naPxc7IT/RduMndXzOK0Gazy9ZK8RMdy3myoEAxztACH79LO1
 K3hPZED9FXFRTeeLvdl7L2iFPDXZd18=
X-Google-Smtp-Source: AMsMyM48VclcFrhJ0VU1AdPy3ZWKSXbxuA78nkNWpjqFBSw9dtDLVhFwEFFIFrzuGasCVwRHv9cXew==
X-Received: by 2002:a5d:64ee:0:b0:236:8f54:f180 with SMTP id
 g14-20020a5d64ee000000b002368f54f180mr5703587wri.559.1667165721543; 
 Sun, 30 Oct 2022 14:35:21 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 i4-20020a05600c354400b003cf4c1e211fsm5515464wmq.38.2022.10.30.14.35.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 30 Oct 2022 14:35:21 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 30 Oct 2022 22:35:17 +0100
Message-Id: <20221030213517.95390-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=lW29RfIxvBTC8q5gcyjrbFouOOmHWs7rQ+O11C2YTBA=;
 b=Y2eQKQInSxuqVbYmZbpwg/Tw6pAywBbRlw27yUxCQmlDrqVSAYaYop6O16+RtUEl5B
 sXgiK2DvmHqVAK+lRFdust0ZHbrZRmIARznIBE+n2xoOPNs2nj7xng/dYvW6ExVTjtJl
 FBMQIA1fevZ0jf4/baZxScCZitlwp/8u5BlqiIBetf9jTyCyFeIWS1ij4HBRyeAwLLNV
 hnm07Cr0+zkiLy5stvxQnA3QYQyiUq5+KpIYA8o24Vd2F1uSowxAHAJe9K1gkrQn92IK
 VorwqMaGFOcCojryUEKwU/igSqb2h8QO6graWql51taFfEzeHUBvEypTzod4qSB8P449
 FF8A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=Y2eQKQIn
Subject: [Buildroot] [PATCH 1/1] package/arp-scan: bump to version 1.9.8
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Update hash of COPYING (gnu.org license file used since
https://github.com/royhills/arp-scan/commit/6194ffb69d831709d49b83f734f8c338c13df28c)

https://github.com/royhills/arp-scan/blob/1.9.8/ChangeLog

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/arp-scan/arp-scan.hash | 4 ++--
 package/arp-scan/arp-scan.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/arp-scan/arp-scan.hash b/package/arp-scan/arp-scan.hash
index dd97333013..b18c6ceb38 100644
--- a/package/arp-scan/arp-scan.hash
+++ b/package/arp-scan/arp-scan.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  e03c36e4933c655bd0e4a841272554a347cd0136faf42c4a6564059e0761c039  arp-scan-1.9.7.tar.gz
-sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
+sha256  b9b75ceaef6348f5951b06c773ec7a243a9e780e160eafebc369f9c27f6a7d3f  arp-scan-1.9.8.tar.gz
+sha256  3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986  COPYING
diff --git a/package/arp-scan/arp-scan.mk b/package/arp-scan/arp-scan.mk
index 3fdbd463c2..73d1b99bc7 100644
--- a/package/arp-scan/arp-scan.mk
+++ b/package/arp-scan/arp-scan.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ARP_SCAN_VERSION = 1.9.7
+ARP_SCAN_VERSION = 1.9.8
 ARP_SCAN_SITE = $(call github,royhills,arp-scan,$(ARP_SCAN_VERSION))
 ARP_SCAN_LICENSE = GPL-3.0+
 ARP_SCAN_LICENSE_FILES = COPYING
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
