Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C946CC61DA4
	for <buildroot@archiver.kernel.org>; Fri,  3 Feb 2023 03:44:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 36B7041CFD;
	Fri,  3 Feb 2023 03:44:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 36B7041CFD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id T-1cZrPn_bYZ; Fri,  3 Feb 2023 03:44:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 43BD841CCF;
	Fri,  3 Feb 2023 03:44:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 43BD841CCF
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2B2F21BF955
 for <buildroot@lists.busybox.net>; Fri,  3 Feb 2023 03:44:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 048B1820BA
 for <buildroot@lists.busybox.net>; Fri,  3 Feb 2023 03:44:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 048B1820BA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sUMVCqhG5H-8 for <buildroot@lists.busybox.net>;
 Fri,  3 Feb 2023 03:44:51 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C87C7820B9
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com
 [209.85.214.180])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C87C7820B9
 for <buildroot@buildroot.org>; Fri,  3 Feb 2023 03:44:51 +0000 (UTC)
Received: by mail-pl1-f180.google.com with SMTP id m13so4003594plx.13
 for <buildroot@buildroot.org>; Thu, 02 Feb 2023 19:44:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=dUSlivUcaoOigvHOOQHcjZBhHPYeQUN9f1ZmrVkw8yI=;
 b=kymSyico/yZ9Cj2ItM6cw0natQoCXiZkK98gdEn9MISdjrB2ZkKq0MGlhVq2R1FJ8S
 9XjBncxOb2ybdTPKrRll4yBtilU4XsToJDdGkT38vu0QOE+bFD07piAYGjPeIDtMwjCf
 UdAkvoJKfZ1TOxvanT9srCRm6UAKpDA7FI9q5E6XsKAd13TTRHF+oj3tGbp53svyUHop
 adNGOjbFaJM0e3db/XiZ30m0Q/W/wn2FeC5fTfWZgX6KSuUSzsAXUDFB/tPIeBMK7cjX
 64NCoKmOZrGoA9InQS/4uU1kNsvCsU6NBOOyZ4yHS+Qm5J7Zkdz10KsHb7D8t5fXkhrz
 d4qw==
X-Gm-Message-State: AO0yUKUteXysC7eL5jYrdvb/lfLJyrVjk5y3QglJgilVADBYoHllgjal
 YGkTLseFIwLZ29nMaxMkPR4c6GHLCAvH6Q==
X-Google-Smtp-Source: AK7set9H75VT987yo4+qrId3Se1Kc38WhtprXieiHLlZz50m0zeMRLzHWjUE3OuQsSM1Md6Zh/ghQA==
X-Received: by 2002:a17:90b:4c0e:b0:229:4dcd:ff61 with SMTP id
 na14-20020a17090b4c0e00b002294dcdff61mr8883310pjb.28.1675395890786; 
 Thu, 02 Feb 2023 19:44:50 -0800 (PST)
Received: from localhost.localdomain (ip184-189-231-225.sb.sd.cox.net.
 [184.189.231.225]) by smtp.gmail.com with ESMTPSA id
 b1-20020a17090aa58100b00229d7f2abd4sm582529pjq.54.2023.02.02.19.44.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Feb 2023 19:44:50 -0800 (PST)
To: buildroot@buildroot.org
Date: Thu,  2 Feb 2023 19:44:40 -0800
Message-Id: <20230203034443.326513-1-christian@paral.in>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2 1/4] package/containerd: bump to version
 1.6.16
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
From: Christian Stewart via buildroot <buildroot@buildroot.org>
Reply-To: Christian Stewart <christian@paral.in>
Cc: Christian Stewart <christian@paral.in>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Bugfixes and improvements.

We now install the containerd.service systemd unit.

https://github.com/containerd/containerd/releases/tag/v1.6.16

Signed-off-by: Christian Stewart <christian@paral.in>

---

v1 -> v2:

 - install containerd systemd unit (now required by docker-engine and others)

Signed-off-by: Christian Stewart <christian@paral.in>
---
 package/containerd/containerd.hash | 2 +-
 package/containerd/containerd.mk   | 8 +++++++-
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/package/containerd/containerd.hash b/package/containerd/containerd.hash
index 04a29949d7..16474089d1 100644
--- a/package/containerd/containerd.hash
+++ b/package/containerd/containerd.hash
@@ -1,3 +1,3 @@
 # Computed locally
-sha256  b86e5c42f58b8348422c972513ff49783c0d505ed84e498d0d0245c5992e4320  containerd-1.6.12.tar.gz
+sha256  e0a893cf67df9dfaecbcde2ba4e896efb3a86ffe48dcfe0d2b26f7cf19b5af3a  containerd-1.6.16.tar.gz
 sha256  4bbe3b885e8cd1907ab4cf9a41e862e74e24b5422297a4f2fe524e6a30ada2b4  LICENSE
diff --git a/package/containerd/containerd.mk b/package/containerd/containerd.mk
index 192175800c..4a0d6ec38b 100644
--- a/package/containerd/containerd.mk
+++ b/package/containerd/containerd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CONTAINERD_VERSION = 1.6.12
+CONTAINERD_VERSION = 1.6.16
 CONTAINERD_SITE = $(call github,containerd,containerd,v$(CONTAINERD_VERSION))
 CONTAINERD_LICENSE = Apache-2.0
 CONTAINERD_LICENSE_FILES = LICENSE
@@ -41,4 +41,10 @@ else
 CONTAINERD_TAGS += no_btrfs
 endif
 
+define CONTAINERD_INSTALL_INIT_SYSTEMD
+	$(INSTALL) -D -m 0644 $(@D)/containerd.service \
+		$(TARGET_DIR)/usr/lib/systemd/system/containerd.service
+	$(SED) 's,/usr/local/bin,/usr/bin,g' $(TARGET_DIR)/usr/lib/systemd/system/containerd.service
+endef
+
 $(eval $(golang-package))
-- 
2.39.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
