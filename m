Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3064C83F01
	for <buildroot@archiver.kernel.org>; Wed, 30 Aug 2023 19:54:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 78D996125F;
	Wed, 30 Aug 2023 19:54:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 78D996125F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ye8WoeLGr9UH; Wed, 30 Aug 2023 19:54:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C84A961257;
	Wed, 30 Aug 2023 19:54:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C84A961257
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4B6681BF423
 for <buildroot@lists.busybox.net>; Wed, 30 Aug 2023 19:54:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1E54B61257
 for <buildroot@lists.busybox.net>; Wed, 30 Aug 2023 19:54:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1E54B61257
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PHXid7UAhJHG for <buildroot@lists.busybox.net>;
 Wed, 30 Aug 2023 19:54:52 +0000 (UTC)
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com
 [IPv6:2607:f8b0:4864:20::634])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 95C206124D
 for <buildroot@buildroot.org>; Wed, 30 Aug 2023 19:54:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 95C206124D
Received: by mail-pl1-x634.google.com with SMTP id
 d9443c01a7336-1c1ff5b741cso281135ad.2
 for <buildroot@buildroot.org>; Wed, 30 Aug 2023 12:54:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693425291; x=1694030091;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=//TG8orOYRwdV6vO4//X6Z98x41c2vadl9iFVZ3SZ1M=;
 b=ZNPAQGmkzRCiXHrDsumlnQY2btWlUw8D+Qiq3W13IAJbgvZ2HewtcAsafdmYgGkuhY
 yT0vb16eETR04XbNZkaLXqHx7gYsMdmyCOV4JzPxTUUl0/UxlK5rikEZ7Xk9U8FKZTIM
 z3p97ny2MIveCGzCI4QVCXz04zliyjtlTJBN4XK2MwbabuI8VTNo+4j+vEr/lG/Ddcs0
 BP9dhUPA43sn4LRxXEU3paH+TmCCEcGCPxlhOYqcpuP0DHcu+VQpSihvJW9dC0vUfPOQ
 dvk4JDxuDun6XqDApXdR77MS7mef75KbbxJJh/cPa0EbkQWl707bmkRa5Ky/x1B4tBQD
 FMQw==
X-Gm-Message-State: AOJu0Yx0g4hBVgxPc4bOLG8YzEp5bghl2QSTvLoTmc/yaN6aF2SiYlRL
 76Zu7wpi4rj1cYcA7qqB84QUmtk/FeM=
X-Google-Smtp-Source: AGHT+IFF2hmWQz+vgklgXheoPn8FBKg6Yoesc6QKFGt4WqYz6uQmdtmupPVU+59GFOTlvvS7q1UrBg==
X-Received: by 2002:a17:902:b687:b0:1bc:203f:3b3c with SMTP id
 c7-20020a170902b68700b001bc203f3b3cmr2730782pls.24.1693425291436; 
 Wed, 30 Aug 2023 12:54:51 -0700 (PDT)
Received: from DESKTOP-OI0KN2B.lan ([172.56.200.156])
 by smtp.gmail.com with ESMTPSA id
 m12-20020a1709026bcc00b001b8a85489a3sm11345492plt.262.2023.08.30.12.54.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Aug 2023 12:54:51 -0700 (PDT)
From: Adam Duskett <aduskett@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 30 Aug 2023 13:54:40 -0600
Message-ID: <20230830195446.3958486-1-aduskett@gmail.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1693425291; x=1694030091; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=//TG8orOYRwdV6vO4//X6Z98x41c2vadl9iFVZ3SZ1M=;
 b=rbQ673DevlaAdfeppIxzUw4XPxj621NaBY9s7ERsz/bXAFZ6f2XZz9VtVB8Ci4KoQc
 kpdnjggWWWdqjNyE4IyGZA6Qu6omJG3rLqiXylU85tHRjnJlCjENtjgr1PihokPwk1UF
 DU3lmaVTMwtr0AxpCQ50Jk+otJpvjrtPlWKKnNy9OYiyThNjoh0xXQHJUEojf6wIP/5E
 SdSkvAgZnjRSTVqxsIQoM8ty3fWcCfP3yeOyRSjaTeA9Ms3UP21rp2sl/56p/l0d+SVk
 TbEt10i5ja1rdAL7caLDedUxr3kZMAJ5FiWf39JZcIODidmYHTOUF0HBQBGOefS5o7US
 aZ5A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=rbQ673De
Subject: [Buildroot] [PATCH/next 1/7] package/vulkan-headers: bump version
 to 1.3.262
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
Cc: Bernd Kuhls <bernd@kuhls.net>, Samuel Martin <s.martin49@gmail.com>,
 Julien Corjon <corjon.j@ecagroup.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Jesse Van Gavere <jesseevg@gmail.com>, Romain Naour <romain.naour@gmail.com>,
 Adam Duskett <aduskett@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Update the license hash as the license file is now located at LICENSE.md
isntead of LICENSE.txt, and add MIT to the list of licenses.

Signed-off-by: Adam Duskett <aduskett@gmail.com>
---
 package/vulkan-headers/vulkan-headers.hash | 4 ++--
 package/vulkan-headers/vulkan-headers.mk   | 6 +++---
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/vulkan-headers/vulkan-headers.hash b/package/vulkan-headers/vulkan-headers.hash
index cf213d8b52..b38bfcff47 100644
--- a/package/vulkan-headers/vulkan-headers.hash
+++ b/package/vulkan-headers/vulkan-headers.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  e3ee02eff07ebcdb0ddfd06366d986c889f3392b6c4d79615bb06aefc1fda900  vulkan-headers-1.3.257.tar.gz
-sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE.txt
+sha256  317e467a5fb2eaa6a18b984ec70fdbfaccd93595a3e6f4bcceca7d3fab280505  vulkan-headers-1.3.262.tar.gz
+sha256  ac24e5ea920e4318e4d02c4086ae51f53cfb03feed06c18df1019e7ada1ec7bc  LICENSE.md
diff --git a/package/vulkan-headers/vulkan-headers.mk b/package/vulkan-headers/vulkan-headers.mk
index c42b005abe..5434f69a40 100644
--- a/package/vulkan-headers/vulkan-headers.mk
+++ b/package/vulkan-headers/vulkan-headers.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-VULKAN_HEADERS_VERSION = 1.3.257
+VULKAN_HEADERS_VERSION = 1.3.262
 VULKAN_HEADERS_SITE = $(call github,KhronosGroup,Vulkan-Headers,v$(VULKAN_HEADERS_VERSION))
-VULKAN_HEADERS_LICENSE = Apache-2.0
-VULKAN_HEADERS_LICENSE_FILES = LICENSE.txt
+VULKAN_HEADERS_LICENSE = Apache-2.0, MIT
+VULKAN_HEADERS_LICENSE_FILES = LICENSE.md
 VULKAN_HEADERS_INSTALL_STAGING = YES
 
 $(eval $(cmake-package))
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
