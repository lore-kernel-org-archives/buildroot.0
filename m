Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AAB2CDB465
	for <buildroot@archiver.kernel.org>; Thu, 19 Oct 2023 07:46:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DDB4F4010D;
	Thu, 19 Oct 2023 07:46:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DDB4F4010D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zMcaI9YP4UzI; Thu, 19 Oct 2023 07:46:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id F179B424A8;
	Thu, 19 Oct 2023 07:46:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F179B424A8
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 618A11BF45A
 for <buildroot@lists.busybox.net>; Thu, 19 Oct 2023 07:46:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3AD446FAC0
 for <buildroot@lists.busybox.net>; Thu, 19 Oct 2023 07:46:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3AD446FAC0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DEPQRjjlHlC9 for <buildroot@lists.busybox.net>;
 Thu, 19 Oct 2023 07:46:26 +0000 (UTC)
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2FB826FAB2
 for <buildroot@buildroot.org>; Thu, 19 Oct 2023 07:46:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2FB826FAB2
Received: by mail-wm1-x343.google.com with SMTP id
 5b1f17b1804b1-4083f613272so10866285e9.1
 for <buildroot@buildroot.org>; Thu, 19 Oct 2023 00:46:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697701584; x=1698306384;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=lowdAcV4GBBaN9JFNNQAQ1lonNHtLfOWPpwdFSpuCzI=;
 b=sVAW20o91lsZhwscEOBghDLn49Zipr09aH3CVfox6WUdNTYWEpmhNsGPM24g/qi/SP
 VXIa9eL2Llrp4nVXS3V2w14rHhfQ2Sn7ux+dvCcicB+Wr1beeGV683COJMeha9gpK2Y8
 g/aFGpey9pSG9KvhNIzkWq5+DsUjGElvmhng8gmnkPkq007+De7yC4aVwFOyCxaFacx6
 rXrrkourf8Fu3EFoSfQvfRG868X/zKPU6MJTrvKXNn7re7MT+s+L63zI21KztqS566qo
 1OfQypWErc5vlcw17SECCI3ig5PXrfHXMnQIW7hTBu53gcveFaKiEYgBJyQR330/aNXK
 nBkw==
X-Gm-Message-State: AOJu0Yz8oHde156irMMOehl4gwy/niNX9LWpl+i/t7G6ma2IPq+FO+yA
 /db9aATlelZJacBEuADRg13yKsTTQ4tN6mMCMb+oHf8C2rc=
X-Google-Smtp-Source: AGHT+IHsx/eM7AgiV8JtaYpLOiEC5YZqzRTY3HQ5aN34r/rrCuVwNqKxtm+5ftTwwfUdaHSseQBEaw==
X-Received: by 2002:a05:600c:354e:b0:408:45e2:1425 with SMTP id
 i14-20020a05600c354e00b0040845e21425mr640034wmq.4.1697701583757; 
 Thu, 19 Oct 2023 00:46:23 -0700 (PDT)
Received: from localhost.localdomain (net-91-81-8-146.cust.vodafonedsl.it.
 [91.81.8.146]) by smtp.gmail.com with ESMTPSA id
 fc8-20020a05600c524800b0040535648639sm3739268wmb.36.2023.10.19.00.46.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Oct 2023 00:46:23 -0700 (PDT)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Thu, 19 Oct 2023 09:46:11 +0200
Message-ID: <20231019074615.1672645-1-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1697701584; x=1698306384;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=lowdAcV4GBBaN9JFNNQAQ1lonNHtLfOWPpwdFSpuCzI=;
 b=ozgrWYgq10R5jVYgV4uZfqtQzuhG61plDT1i37asfaYgBMVDsLQKZ5RIormim5Big/
 R7SUKVF3vKh32ntakRgrBPHh4Oj4GkrC6os4vOEfStPk4WaNKAVfL+rGkC13Rz3T/8h9
 1I0TCv4rtq1Kgls+YgL0mOFzBK3rVJ+6tbqRs=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=ozgrWYgq
Subject: [Buildroot] [PATCH 1/5] package/flutter-sdk-bin: bump version to
 3.13.8
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
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 package/flutter-sdk-bin/flutter-sdk-bin.hash | 2 +-
 package/flutter-sdk-bin/flutter-sdk-bin.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/flutter-sdk-bin/flutter-sdk-bin.hash b/package/flutter-sdk-bin/flutter-sdk-bin.hash
index 9daf6c58be..c914434e7e 100644
--- a/package/flutter-sdk-bin/flutter-sdk-bin.hash
+++ b/package/flutter-sdk-bin/flutter-sdk-bin.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  d9bbfbfb6fe3c72a29c1040235126edd0cd461e4e18556335fd1cf217c2e1473  flutter_linux_3.13.4-stable.tar.xz
+sha256  98e78d32a0b600b1ab762b84774891c97a2f40a0ec09919fb6d35892c349e350  flutter_linux_3.13.8-stable.tar.xz
 sha256  a598db94b6290ffbe10b5ecf911057b6a943351c727fdda9e5f2891d68700a20  LICENSE
diff --git a/package/flutter-sdk-bin/flutter-sdk-bin.mk b/package/flutter-sdk-bin/flutter-sdk-bin.mk
index dc6d68fdcb..0d764f8e25 100644
--- a/package/flutter-sdk-bin/flutter-sdk-bin.mk
+++ b/package/flutter-sdk-bin/flutter-sdk-bin.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FLUTTER_SDK_BIN_VERSION = 3.13.4
+FLUTTER_SDK_BIN_VERSION = 3.13.8
 FLUTTER_SDK_BIN_SITE = https://storage.googleapis.com/flutter_infra_release/releases/stable/linux
 FLUTTER_SDK_BIN_SOURCE = flutter_linux_$(FLUTTER_SDK_BIN_VERSION)-stable.tar.xz
 FLUTTER_SDK_BIN_LICENSE = BSD-3-Clause
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
