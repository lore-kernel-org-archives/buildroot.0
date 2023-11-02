Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C43BCC4332F
	for <buildroot@archiver.kernel.org>; Thu,  2 Nov 2023 18:54:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 570FD8523C;
	Thu,  2 Nov 2023 18:54:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 570FD8523C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id r4vOq94u5XtG; Thu,  2 Nov 2023 18:54:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A02C78523E;
	Thu,  2 Nov 2023 18:54:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A02C78523E
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6089B1BF287
 for <buildroot@lists.busybox.net>; Thu,  2 Nov 2023 18:54:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 388F44F2C6
 for <buildroot@lists.busybox.net>; Thu,  2 Nov 2023 18:54:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 388F44F2C6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MXgB3lOd8uVf for <buildroot@lists.busybox.net>;
 Thu,  2 Nov 2023 18:54:16 +0000 (UTC)
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com
 [IPv6:2607:f8b0:4864:20::1043])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B5BD74F22F
 for <buildroot@buildroot.org>; Thu,  2 Nov 2023 18:54:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B5BD74F22F
Received: by mail-pj1-x1043.google.com with SMTP id
 98e67ed59e1d1-28014fed9efso1246044a91.0
 for <buildroot@buildroot.org>; Thu, 02 Nov 2023 11:54:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698951255; x=1699556055;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=7ULRV7OhYjjZ5TcAMqf+4LO1PZcPZHSLhrZJ1ODiT2M=;
 b=XCJk7SMqYW17Spa0V2rli+vR91iFLONRNU/z6aYRRQ8ge4kP6ngWXGKJLeHKjIKpjp
 4WsvTt4zYrnA91WPfBxMWqD7oF5wgSdGadJDIR3ePGmciq0qGjn6xjJno70tcc6bFA+y
 eozY5j7+qqNHeT6TrA+Iv+g4JdFnNCTGF/lk3KtSw2yWBG4vpJBCOWyrSxsBP21ZfntK
 bK93bArusWSmVytC0+0VLk4L/LKctAsryXYTzw8CZT0o0Pu6aXdeeh1aHyWuqYHIfC3t
 lFvafBSMSsyEOt7CtCekrzOpQcyED9Tfa5tpfGoxcMkmENHquSKe0m5e36DsOldA9G/p
 mRmA==
X-Gm-Message-State: AOJu0Yzp4xksrpt9wVa9BNorABtPByoXH3rmKzhTTdOnc5ABOqPyEkgZ
 06NKWUHCp2D9Re80yZqurXgFe0/mQLsq8+st12Drs/tvvyU=
X-Google-Smtp-Source: AGHT+IGQ4NflPYDnRoPt4dPwntLeqV/dDuPepE0w/OfVFKU7aCGrfBmYOGnOrG7dDzf9Cwgcm5Rxig==
X-Received: by 2002:a17:90a:f0d8:b0:27d:375a:e322 with SMTP id
 fa24-20020a17090af0d800b0027d375ae322mr16454106pjb.31.1698951255052; 
 Thu, 02 Nov 2023 11:54:15 -0700 (PDT)
Received: from DESKTOP-OI0KN2B.lan ([172.56.201.196])
 by smtp.gmail.com with ESMTPSA id
 ge17-20020a17090b0e1100b0027cf8869ee7sm210962pjb.0.2023.11.02.11.54.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Nov 2023 11:54:14 -0700 (PDT)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Thu,  2 Nov 2023 12:54:07 -0600
Message-ID: <20231102185411.51382-1-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1698951255; x=1699556055;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=7ULRV7OhYjjZ5TcAMqf+4LO1PZcPZHSLhrZJ1ODiT2M=;
 b=c3CigFLDLjnZSzx3NDPELY9xWf+EHUY6iXxLYA98R6pPPrvSPbAB5iFHs7DmM2ZKXm
 6Xf281mcHL+kEHcjFbmBO0IWOnfeKcNmlloMm6iBuZnGZoVtxlsCzTc4S93ZJR+7PGo3
 qO/SW6HdsmAvAktic+vxc6/OI0ZfVB7+m0nrA=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=c3CigFLD
Subject: [Buildroot] [PATCH 1/5] package/flutter-sdk-bin: bump version to
 3.13.9
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
index 9daf6c58be..a204de1807 100644
--- a/package/flutter-sdk-bin/flutter-sdk-bin.hash
+++ b/package/flutter-sdk-bin/flutter-sdk-bin.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  d9bbfbfb6fe3c72a29c1040235126edd0cd461e4e18556335fd1cf217c2e1473  flutter_linux_3.13.4-stable.tar.xz
+sha256  b6bc6f93423488c67110e0fe56523cd2260f3a4c379ed015cd1c7fab66362739  flutter_linux_3.13.9-stable.tar.xz
 sha256  a598db94b6290ffbe10b5ecf911057b6a943351c727fdda9e5f2891d68700a20  LICENSE
diff --git a/package/flutter-sdk-bin/flutter-sdk-bin.mk b/package/flutter-sdk-bin/flutter-sdk-bin.mk
index dc6d68fdcb..17cd3523a6 100644
--- a/package/flutter-sdk-bin/flutter-sdk-bin.mk
+++ b/package/flutter-sdk-bin/flutter-sdk-bin.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FLUTTER_SDK_BIN_VERSION = 3.13.4
+FLUTTER_SDK_BIN_VERSION = 3.13.9
 FLUTTER_SDK_BIN_SITE = https://storage.googleapis.com/flutter_infra_release/releases/stable/linux
 FLUTTER_SDK_BIN_SOURCE = flutter_linux_$(FLUTTER_SDK_BIN_VERSION)-stable.tar.xz
 FLUTTER_SDK_BIN_LICENSE = BSD-3-Clause
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
