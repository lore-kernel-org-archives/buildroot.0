Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55AE8E82CCE
	for <buildroot@archiver.kernel.org>; Wed, 27 Sep 2023 20:08:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 02E7540111;
	Wed, 27 Sep 2023 20:08:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 02E7540111
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hXazfBPIBxWj; Wed, 27 Sep 2023 20:08:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5978D4018A;
	Wed, 27 Sep 2023 20:08:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5978D4018A
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1B19E1BF267
 for <buildroot@lists.busybox.net>; Wed, 27 Sep 2023 20:08:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E8B0F61442
 for <buildroot@lists.busybox.net>; Wed, 27 Sep 2023 20:08:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E8B0F61442
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id INGkUDbCZ41u for <buildroot@lists.busybox.net>;
 Wed, 27 Sep 2023 20:08:39 +0000 (UTC)
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7DCB561132
 for <buildroot@buildroot.org>; Wed, 27 Sep 2023 20:08:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7DCB561132
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-405497850dbso99840045e9.0
 for <buildroot@buildroot.org>; Wed, 27 Sep 2023 13:08:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695845317; x=1696450117;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=QIiqUboNdW36cja4ufEilOosO+mBqPHnEmQfKezpKeM=;
 b=sjm4+pP+dFmGWduK7NENY6Drvq1r/G7EHCz6r2j/hUuyetRbyUbp3dqY0qfrgE4WZC
 +Pn0QkB0SGaTPMo3a5VkieDkbrBVsa7RCDc7liWJnxvfOgwWXM+g2xVP1J94xyP2iI0b
 cRApQZdsABWJaSpG0f6GX3665zC7Gl5XiJo5gkUXTh4X9Vg+GWf7ms6yoxYPtuD6Bvni
 8M3b/kFa59ED8iWh5VupBxeHHacn3gwrdHm6IC3iO3AydQIKZRX51DJCznhG8dD2C7AD
 IE8FcNFPirZTT9ss16zzzsm9ndCNpgUzmuc9zVkTFNMMuJn9U3vJKpPe1CdG8OVcsu3d
 cSjw==
X-Gm-Message-State: AOJu0YyqiO/jxR+0l3H4JQO7ZPpZ7mKM10fytkasw7S68QdYC6AiaHUJ
 8Dh3o0+grWtukFg16Ukx03HQ4jI3+Vo=
X-Google-Smtp-Source: AGHT+IF0+EKjM5AQFspFrauunOa959213sVLLmePkzMJk09E0ZU4tQxFlbe0fZ6Mb8gyNPHR25kxjg==
X-Received: by 2002:a05:600c:cc:b0:405:3d04:5f55 with SMTP id
 u12-20020a05600c00cc00b004053d045f55mr2950192wmm.14.1695845316800; 
 Wed, 27 Sep 2023 13:08:36 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 t21-20020a7bc3d5000000b00405c7591b09sm6258510wmj.35.2023.09.27.13.08.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Sep 2023 13:08:36 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 27 Sep 2023 22:08:34 +0200
Message-Id: <20230927200834.494483-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1695845317; x=1696450117; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=QIiqUboNdW36cja4ufEilOosO+mBqPHnEmQfKezpKeM=;
 b=CVoqtcuAHOOjsLseECUc6Utvg7qLnynOWH+OfIzbvaB++W2+wo6IQJnjl4dx9AU4aU
 YiInWPclvt1goxL6CFcOVZVgOLPBZn+z7yY+0DdEb/O3vuP6vIlS4QnQrBS8LWJM94q0
 znAyXnPc3L8uUxAqLU0+2henvRgUUz3e1OFpgzN9VbIEUuFcOKAQyBrTBAi+SJLaqdqt
 zkMyDyRvhOuDDA9TaEg4v4H5U9BNsP9vCYkXYiQnubyNeIorydU4dDzo3Qo0VsSMdqkz
 BNPJVjjtipRqxXo4Gh/c8tWPsR1opy4URsI+SJ5aOdgvhxXe8AB22uFHR/J4/sM6/od1
 TwHA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=CVoqtcuA
Subject: [Buildroot] [PATCH 1/1] package/minizip: bump to version 4.0.1
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

https://github.com/zlib-ng/minizip-ng/releases/tag/3.0.8
https://github.com/zlib-ng/minizip-ng/releases/tag/3.0.9
https://github.com/zlib-ng/minizip-ng/releases/tag/3.0.10
https://github.com/zlib-ng/minizip-ng/releases/tag/4.0.0
https://github.com/zlib-ng/minizip-ng/releases/tag/4.0.1

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/minizip/minizip.hash | 2 +-
 package/minizip/minizip.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/minizip/minizip.hash b/package/minizip/minizip.hash
index 55fc176dbd..5e00881ce3 100644
--- a/package/minizip/minizip.hash
+++ b/package/minizip/minizip.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  39981a0db1bb6da504909bce63d7493286c5e50825c056564544c990d15c55cf  minizip-3.0.7.tar.gz
+sha256  63e47a2b4dbac0da501f43f4da74f118dfb3ef0dee0ffbbe89428271002260f8  minizip-4.0.1.tar.gz
 sha256  675181c03fc1302a1c8554c00f7be9bb420c5dbc9dcc2013433cec144413de03  LICENSE
diff --git a/package/minizip/minizip.mk b/package/minizip/minizip.mk
index c74c0df8d1..d3e539d0e9 100644
--- a/package/minizip/minizip.mk
+++ b/package/minizip/minizip.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MINIZIP_VERSION = 3.0.7
+MINIZIP_VERSION = 4.0.1
 MINIZIP_SITE = $(call github,zlib-ng,minizip-ng,$(MINIZIP_VERSION))
 MINIZIP_DEPENDENCIES = host-pkgconf
 MINIZIP_INSTALL_STAGING = YES
-- 
2.40.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
