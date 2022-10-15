Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B18A1C4332F
	for <buildroot@archiver.kernel.org>; Sat, 15 Oct 2022 23:05:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 06611813FE;
	Sat, 15 Oct 2022 23:05:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 06611813FE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id C4zkTwDPOEhj; Sat, 15 Oct 2022 23:05:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2A41481403;
	Sat, 15 Oct 2022 23:05:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2A41481403
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 16CE11BF3FF
 for <buildroot@lists.busybox.net>; Sat, 15 Oct 2022 23:05:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E5D4081403
 for <buildroot@lists.busybox.net>; Sat, 15 Oct 2022 23:05:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E5D4081403
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YqDNmE2gEGgR for <buildroot@lists.busybox.net>;
 Sat, 15 Oct 2022 23:05:39 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8E73B813FE
Received: from mail-il1-x135.google.com (mail-il1-x135.google.com
 [IPv6:2607:f8b0:4864:20::135])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8E73B813FE
 for <buildroot@buildroot.org>; Sat, 15 Oct 2022 23:05:39 +0000 (UTC)
Received: by mail-il1-x135.google.com with SMTP id o13so4234939ilc.7
 for <buildroot@buildroot.org>; Sat, 15 Oct 2022 16:05:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ItY1HduoJDOLgciFlHrMFlK+4XW0mut+fndiyQEwYVc=;
 b=BKLuodNjvg3H81aUw0syt9YI3DizFilpb+ghLaC1xer8qWmnXXDYA+shNT65FQz9Px
 IyV+sAJv9uaBTtePyksfoknlpwzxbns6yOrLz/oHsxoYPfYJaC9fQ+IIdMWRCRco1i+k
 QzkT3GUubcXeybqNLjVjQi0bFxOCHGKFJYTGQ+tSeetzCIKXlqk6rmtT3Dy6CL7MetMv
 QZCnLAykk3snkUg7c775XGzKuhWb5X0E09glwvRIbjF80xGdcTZfLXXfp5lPQxRhCAk7
 VwTSqpF37AQqlSDe18bCE3HcH8Q+tZ7QLV3GxNph4VAfcTuXX+IMWWPuJ9HKLWtRwLuS
 k8TA==
X-Gm-Message-State: ACrzQf1KeNCpsVXnfkWjh6JTfF11nOLfwY5SJkfkAqGHSutnA+G37yEx
 EPWUBjdoYW99ZrkyE7AvHCQXqeLGRejIhg==
X-Google-Smtp-Source: AMsMyM78mywdAHB+ssEZ0xvQIuZMw8xNFrPeXpuVkWV2FrAaY8i8zUx3vHAs4daEZKkoAJv17BYcAA==
X-Received: by 2002:a05:6e02:1909:b0:2fc:7bd1:25c0 with SMTP id
 w9-20020a056e02190900b002fc7bd125c0mr1983367ilu.147.1665875138304; 
 Sat, 15 Oct 2022 16:05:38 -0700 (PDT)
Received: from james-x399.localdomain (71-218-240-5.hlrn.qwest.net.
 [71.218.240.5]) by smtp.gmail.com with ESMTPSA id
 186-20020a021dc3000000b00363e61908bfsm2718163jaj.10.2022.10.15.16.05.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 15 Oct 2022 16:05:37 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 15 Oct 2022 17:05:23 -0600
Message-Id: <20221015230534.4016536-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ItY1HduoJDOLgciFlHrMFlK+4XW0mut+fndiyQEwYVc=;
 b=pBYp9tp+fjzxsYSrF0C9K63bvRuatiDefAPElfSTlYLz7Nz1+6bttgxis+VBDYGngo
 eHhF0dofsTJK4yhRUU5z2A1eqFzEpG31875Hf/wTkAXFp4l9WAz7uuWRWhjeHF5D+J/S
 zHFHWg76oDW3HR4Pa1OJz5WlCmSfW2oBfI1jR5Zh16xEXjTZCXBB8J1hXi2zwjPGZXf/
 SwAS7a8xN3M5+/SmT2+bB/zgHCjCaJtOdhErMOyYNlXUVETEMn0B6/LX330n0zFu2UTg
 fYRnfAQRPHZ+4yJTkyMbyHyr/pwce24h6Bqy71Xz9FW2f1xMYBHWr4GSSF6lsOrnEgsO
 ahXw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=pBYp9tp+
Subject: [Buildroot] [PATCH 01/12] package/gstreamer1: bump to version 1.20.4
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
 package/gstreamer1/gstreamer1/gstreamer1.hash | 4 ++--
 package/gstreamer1/gstreamer1/gstreamer1.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gstreamer1/gstreamer1/gstreamer1.hash b/package/gstreamer1/gstreamer1/gstreamer1.hash
index 5daadfae74..5fb52606fe 100644
--- a/package/gstreamer1/gstreamer1/gstreamer1.hash
+++ b/package/gstreamer1/gstreamer1/gstreamer1.hash
@@ -1,3 +1,3 @@
-# From https://gstreamer.freedesktop.org/src/gstreamer/gstreamer-1.20.3.tar.xz.sha256sum
-sha256  607daf64bbbd5fb18af9d17e21c0d22c4d702fffe83b23cb22d1b1af2ca23a2a  gstreamer-1.20.3.tar.xz
+# From https://gstreamer.freedesktop.org/src/gstreamer/gstreamer-1.20.4.tar.xz.sha256sum
+sha256  67c1edf8c3c339cda5dde85f4f7b953bb9607c2d13ae970e2491c5c4c055ef5f  gstreamer-1.20.4.tar.xz
 sha256  ad2eec519ebd4b5df86ea84dff24ae3bfa2edea846a703b58902dd221ae375db  COPYING
diff --git a/package/gstreamer1/gstreamer1/gstreamer1.mk b/package/gstreamer1/gstreamer1/gstreamer1.mk
index 89d5f93d43..16c016b145 100644
--- a/package/gstreamer1/gstreamer1/gstreamer1.mk
+++ b/package/gstreamer1/gstreamer1/gstreamer1.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GSTREAMER1_VERSION = 1.20.3
+GSTREAMER1_VERSION = 1.20.4
 GSTREAMER1_SOURCE = gstreamer-$(GSTREAMER1_VERSION).tar.xz
 GSTREAMER1_SITE = https://gstreamer.freedesktop.org/src/gstreamer
 GSTREAMER1_INSTALL_STAGING = YES
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
