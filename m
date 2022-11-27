Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A489FC4321E
	for <buildroot@archiver.kernel.org>; Sun, 27 Nov 2022 13:13:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5024560B23;
	Sun, 27 Nov 2022 13:13:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5024560B23
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tVMMX-LNrmwL; Sun, 27 Nov 2022 13:13:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 72A936061B;
	Sun, 27 Nov 2022 13:13:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 72A936061B
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1BF741BF42C
 for <buildroot@lists.busybox.net>; Sun, 27 Nov 2022 13:09:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EC11C400D0
 for <buildroot@lists.busybox.net>; Sun, 27 Nov 2022 13:09:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EC11C400D0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3DF5q79mIWY5 for <buildroot@lists.busybox.net>;
 Sun, 27 Nov 2022 13:09:06 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 509FD400B8
Received: from mail-ot1-x332.google.com (mail-ot1-x332.google.com
 [IPv6:2607:f8b0:4864:20::332])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 509FD400B8
 for <buildroot@buildroot.org>; Sun, 27 Nov 2022 13:09:06 +0000 (UTC)
Received: by mail-ot1-x332.google.com with SMTP id
 g51-20020a9d12b6000000b0066dbea0d203so5362632otg.6
 for <buildroot@buildroot.org>; Sun, 27 Nov 2022 05:09:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DzkzXvbiCGKKCcd1SxjMlIAgDazZWzbQsr8uPvMtudM=;
 b=ggoO6HF4gPUOWI4/hyTT21mR3QIPitoXs4Y84Ty5TRDYMx9NRNeZfGDRq4WVhxFVq3
 wSBS7aG5K4K3441EunFc7fdNziniCJTW75074pKGZONC0xut5Ox2HHlAV6ylcr2CAjhQ
 oCNmvzfhy8OnN+WrT2446X6NjqNKlQBMZwrbUuR8rKI8kw2khttZQyqishctmfKfCB10
 gN3fIw/tuDN8563Xzp6zzkLiBpZ7yJ0e4+R1yo2w77I3PuFOGxGyZjCxHOkd4my67fqu
 PGITYjAZ7ATzPYePRTZdrEHEpX6Yl8HivwekHTON/b9LmJybcXNbaf0I7HWaXIVQrjh0
 ZgAA==
X-Gm-Message-State: ANoB5plROoYHH0NjkQr7pTSqPIFX4JLGac99b9YQw8WlUswT7XrtDZRs
 ur2CV4P2fU0wku73qU1vxVX/Unwj2sQ=
X-Google-Smtp-Source: AA0mqf7h3I3JCbIEgr+Phgn/eG/trXf8rweZtvMd1Ha8WxVUImAY0UaFxey+SvTxo5IjfMbUAfHN6Q==
X-Received: by 2002:a9d:4e90:0:b0:66c:83a8:c04a with SMTP id
 v16-20020a9d4e90000000b0066c83a8c04amr23022738otk.219.1669554545387; 
 Sun, 27 Nov 2022 05:09:05 -0800 (PST)
Received: from localhost.localdomain ([2804:14c:7980:988a:9b54:d73e:4d8c:458c])
 by smtp.gmail.com with ESMTPSA id
 i25-20020a9d6519000000b0066a9ba5094fsm3655102otl.1.2022.11.27.05.09.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 27 Nov 2022 05:09:04 -0800 (PST)
From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 27 Nov 2022 10:07:37 -0300
Message-Id: <20221127130739.1862398-24-ricardo.martincoski@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221127130739.1862398-1-ricardo.martincoski@gmail.com>
References: <20221127130739.1862398-1-ricardo.martincoski@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DzkzXvbiCGKKCcd1SxjMlIAgDazZWzbQsr8uPvMtudM=;
 b=S6BRMIVmY3X13Os13N1V64/Oq4pUgZ28N31PsqlDPllRMU0g3eIOlEpJMRfC/fckE0
 3upIG0OR2yDPmD1PwNQX2FCOuu5SewtA77HCiRyDmhoh+gsdvzHxrf7DhFEib9bVZqXw
 3JNYf73u778KTzzmt6c4vxqDnya10m/IA35HnqQZOEBvOHtt2WRLpFateBZelaBWXEw8
 +jOpHaPkLeJz4tzh0fjP6XavxkYnJtsz9OEPOaLlQgvOfPr+Yv9qaTVkDVi368y/FmE2
 KD4mM3MULAt0JDZIjtxjtf0eOsImFHOR3u0qrejddXoZkSk7Gn0WxXh4hBduhw+E3rAy
 ZN2w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=S6BRMIVm
Subject: [Buildroot] [next 23/25] package/sunxi-mali-utgard: properly handle
 legacy for renamed options
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Ricardo Martincoski <ricardo.martincoski@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Commit "6a7a652b14 package/sunxi-mali-utgard: rename from
sunxi-mali-mainline" tried to add legacy handling but the new symbols
are part of a choice, and Kconfig does not enforce the select of a
option from a choice.

Update the legacy entry for 2022.02, following the example described in
the beginning of the file.

Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
---
test config 1:
BR2_aarch64=y
BR2_ARM_FPU_VFPV2=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_PACKAGE_SUNXI_MALI_MAINLINE=y
BR2_PACKAGE_SUNXI_MALI_MAINLINE_R8P1=y
---
 Config.in.legacy                    | 6 ++++--
 package/sunxi-mali-utgard/Config.in | 2 ++
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 27f5602d19..ad2598f7a1 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -631,20 +631,22 @@ config BR2_PACKAGE_SUNXI_MALI_MAINLINE
 config BR2_PACKAGE_SUNXI_MALI_MAINLINE_R6P2
 	bool "sunxi-mali-mainline-r6p2 was renamed"
 	select BR2_LEGACY
-	select BR2_PACKAGE_SUNXI_MALI_UTGARD_R6P2
 	help
 	  The sunxi-mali-mainline package has been renamed
 	  sunxi-mali-utgard, the suboptions of this package have also
 	  been renamed accordingly.
+# Note: BR2_PACKAGE_SUNXI_MALI_MAINLINE_R6P2 is still referenced from
+# package/sunxi-mali-utgard/Config.in
 
 config BR2_PACKAGE_SUNXI_MALI_MAINLINE_R8P1
 	bool "sunxi-mali-mainline-r8p1 was renamed"
 	select BR2_LEGACY
-	select BR2_PACKAGE_SUNXI_MALI_UTGARD_R8P1
 	help
 	  The sunxi-mali-mainline package has been renamed
 	  sunxi-mali-utgard, the suboptions of this package have also
 	  been renamed accordingly.
+# Note: BR2_PACKAGE_SUNXI_MALI_MAINLINE_R8P1 is still referenced from
+# package/sunxi-mali-utgard/Config.in
 
 config BR2_PACKAGE_QT5WEBKIT_EXAMPLES
 	bool "qt5webkit-examples removed"
diff --git a/package/sunxi-mali-utgard/Config.in b/package/sunxi-mali-utgard/Config.in
index ff49ea03f1..59ac21f5ab 100644
--- a/package/sunxi-mali-utgard/Config.in
+++ b/package/sunxi-mali-utgard/Config.in
@@ -20,6 +20,8 @@ config BR2_PACKAGE_PROVIDES_LIBGLES
 
 choice
 	prompt "Version"
+	default BR2_PACKAGE_SUNXI_MALI_UTGARD_R6P2 if BR2_PACKAGE_SUNXI_MALI_MAINLINE_R6P2 # legacy
+	default BR2_PACKAGE_SUNXI_MALI_UTGARD_R8P1 if BR2_PACKAGE_SUNXI_MALI_MAINLINE_R8P1 # legacy
 	default BR2_PACKAGE_SUNXI_MALI_UTGARD_R6P2
 	help
 	  Select the version of the userspace module.
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
