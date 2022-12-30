Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E80AAC4332F
	for <buildroot@archiver.kernel.org>; Fri, 30 Dec 2022 02:52:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4BD8460AC0;
	Fri, 30 Dec 2022 02:52:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4BD8460AC0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lkav-m-F-S3p; Fri, 30 Dec 2022 02:52:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8C474605F6;
	Fri, 30 Dec 2022 02:52:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8C474605F6
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8AE1E1BF2B6
 for <buildroot@lists.busybox.net>; Fri, 30 Dec 2022 02:52:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5FC7681B60
 for <buildroot@lists.busybox.net>; Fri, 30 Dec 2022 02:52:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5FC7681B60
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MYF_1PZK6f7P for <buildroot@lists.busybox.net>;
 Fri, 30 Dec 2022 02:52:25 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 44D2B81B52
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com
 [209.85.214.180])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 44D2B81B52
 for <buildroot@buildroot.org>; Fri, 30 Dec 2022 02:52:25 +0000 (UTC)
Received: by mail-pl1-f180.google.com with SMTP id jl4so14375911plb.8
 for <buildroot@buildroot.org>; Thu, 29 Dec 2022 18:52:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ZkL+i0OwnhDuYqROg/xd+iSA8t+3D+vGctW8lKTZSiM=;
 b=1vP5QkRC6vLF2rI6terhXQ9bITKsMXghQoaceTcgNXgX4sMjJWXe3KJ+H/9aqbp9q5
 1Ix54CTb8dnzLz07GnBKftDoB3/l3w9F2nmsCGRMmv2D06Dkj18s70DobV1eDNWtuj+f
 1+8l7D9RIVof6rwqr6CTK8OtfHIF6y6xVXwDqbjeUIyhld/jJNYYChQ5BupxaDkQ1x+B
 Y86C0KYNkLf6jIUzakbhm/zkzsWU5k5VeD5oUxQ2bSUx9FdiPcAUZdyTFgsW2wewTK76
 ukEiZcxtDCNh14wH5AL5hKmV7LLctDYLccxjv9h686Wf1UqlwkgdtP+EiGAF6ur3C58R
 Bvag==
X-Gm-Message-State: AFqh2koabyHTciMvNe2/n7Svk2SRaFj2s9scZGi7s1vwyI6jRfA+4tkL
 RHdT5q3FJWws808CHXLTrEDX5+OoZ0M=
X-Google-Smtp-Source: AMrXdXtmF39J1Np+kuD0LSa6xL12nHkuR7Q5hctG5AaZ1DqTWQAIpo+u9q0TRLy0Jc3EdJRP1HE8/Q==
X-Received: by 2002:a17:902:9f87:b0:189:b0ff:e319 with SMTP id
 g7-20020a1709029f8700b00189b0ffe319mr31559999plq.58.1672368744227; 
 Thu, 29 Dec 2022 18:52:24 -0800 (PST)
Received: from localhost.localdomain (ip184-189-231-225.sb.sd.cox.net.
 [184.189.231.225]) by smtp.gmail.com with ESMTPSA id
 a9-20020a170902710900b00186748fe6ccsm13607685pll.214.2022.12.29.18.52.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Dec 2022 18:52:23 -0800 (PST)
To: buildroot@buildroot.org
Date: Thu, 29 Dec 2022 18:52:21 -0800
Message-Id: <20221230025221.1051537-1-christian@paral.in>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2 1/1] package/rtl8812au-aircrack-ng: bump to
 2022-12-22 version of v5.6.4.2 branch
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Christian Stewart <christian@paral.in>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fixes:
http://autobuild.buildroot.net/results/4f6/4f65b521d5c6cffdf5f6294ce0257b9a19e441fc/

Reviewed-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Christian Stewart <christian@paral.in>

---

v1 -> v2:

 - reworded commit
 - added fixes to commit msg
 - added Giulio's reviewed-by

Signed-off-by: Christian Stewart <christian@paral.in>
---
 package/rtl8812au-aircrack-ng/rtl8812au-aircrack-ng.hash | 2 +-
 package/rtl8812au-aircrack-ng/rtl8812au-aircrack-ng.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/rtl8812au-aircrack-ng/rtl8812au-aircrack-ng.hash b/package/rtl8812au-aircrack-ng/rtl8812au-aircrack-ng.hash
index bc3a926314..4abbb2f4e8 100644
--- a/package/rtl8812au-aircrack-ng/rtl8812au-aircrack-ng.hash
+++ b/package/rtl8812au-aircrack-ng/rtl8812au-aircrack-ng.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  eed4888da9cfdc0f83ad3335beaf73af33ce0796b0a2637aeec102d47e1eb8f0  rtl8812au-aircrack-ng-e7a4a390ccbdd768411e1b2a8922c47837f76b47.tar.gz
+sha256  1f67a2089f7d7d7be056616de3ec869b70a1bd1d037ccdd7e2c397c888048937  rtl8812au-aircrack-ng-ee299797bcd54d5b8c58d2da8576c54cea1a03a2.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE
diff --git a/package/rtl8812au-aircrack-ng/rtl8812au-aircrack-ng.mk b/package/rtl8812au-aircrack-ng/rtl8812au-aircrack-ng.mk
index 45a6ce5729..e9f2340189 100644
--- a/package/rtl8812au-aircrack-ng/rtl8812au-aircrack-ng.mk
+++ b/package/rtl8812au-aircrack-ng/rtl8812au-aircrack-ng.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RTL8812AU_AIRCRACK_NG_VERSION = e7a4a390ccbdd768411e1b2a8922c47837f76b47
+RTL8812AU_AIRCRACK_NG_VERSION = ee299797bcd54d5b8c58d2da8576c54cea1a03a2
 RTL8812AU_AIRCRACK_NG_SITE = $(call github,aircrack-ng,rtl8812au,$(RTL8812AU_AIRCRACK_NG_VERSION))
 RTL8812AU_AIRCRACK_NG_LICENSE = GPL-2.0
 RTL8812AU_AIRCRACK_NG_LICENSE_FILES = LICENSE
-- 
2.39.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
