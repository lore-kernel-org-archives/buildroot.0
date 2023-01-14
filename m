Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C943CC3DA78
	for <buildroot@archiver.kernel.org>; Sat, 14 Jan 2023 08:05:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 54F3041C4B;
	Sat, 14 Jan 2023 08:05:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 54F3041C4B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VVWAJpfevT_W; Sat, 14 Jan 2023 08:05:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3F11941C49;
	Sat, 14 Jan 2023 08:05:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3F11941C49
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 04E3E1BF48C
 for <buildroot@lists.busybox.net>; Sat, 14 Jan 2023 08:05:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D364B41C49
 for <buildroot@lists.busybox.net>; Sat, 14 Jan 2023 08:05:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D364B41C49
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1pLfQbC6lI8V for <buildroot@lists.busybox.net>;
 Sat, 14 Jan 2023 08:05:36 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 818F241A50
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 818F241A50
 for <buildroot@buildroot.org>; Sat, 14 Jan 2023 08:05:36 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id s6so1884996edd.13
 for <buildroot@buildroot.org>; Sat, 14 Jan 2023 00:05:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=tH6fOGtXcZ+i7iU9f+GwKPTbWPhwO3Pf5NhAXXyBJmU=;
 b=xH4A9Q9QdLxa+jo9WSfoEAGOdX2gvnkcqqJKHMBpH/vcjidJY3RvdAHt09Qxyfh2dD
 kAUsVHWHqekiDts7uPCyKQ1U4Wt39lIJ2/dC4DC44FaN8PpAcGmtgv93ypQln+j5/PMZ
 2CHTP8iH/K/JeVnXDUV3VP8XtnKtDYMHORH1WyAchsopBud53lcfEnz+g4aO7b3UQPOC
 Z6XOZSEQrfh4OB2blpqqGd8fBE5jjwDYzIuB7SmAyQNEN4au28XeRL0f5LQbUbCN7KMN
 eAxwbRFfnvYxTxtMYlgRGjnSIFo8fJ70i0pIoy1DLjJJ2JGu2FRS2lLI52JFQXZxezoK
 2Mow==
X-Gm-Message-State: AFqh2kpEZT6+I1iPWe4o6ITsSx/XGJ5BMzH5tZVQnAxhajpWzI+8BML2
 Gr6UWzr+Yhx91GFn6frfE4O63d6Ovc4=
X-Google-Smtp-Source: AMrXdXtdV4qD3wA3cTm66y1ukIdnntBrTOSh88FEQqqHfeuxJHa4RG2rIZ2oEYu3/eudwU3+8rdvzQ==
X-Received: by 2002:a05:6402:2409:b0:493:597e:2192 with SMTP id
 t9-20020a056402240900b00493597e2192mr32470872eda.38.1673683533984; 
 Sat, 14 Jan 2023 00:05:33 -0800 (PST)
Received: from t450s.fritz.box (ip4d15a215.dynamic.kabel-deutschland.de.
 [77.21.162.21]) by smtp.gmail.com with ESMTPSA id
 z6-20020a50cd06000000b0046267f8150csm4628122edi.19.2023.01.14.00.05.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 14 Jan 2023 00:05:33 -0800 (PST)
From: Heiko Thiery <heiko.thiery@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 14 Jan 2023 09:05:25 +0100
Message-Id: <20230114080524.26943-1-heiko.thiery@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=tH6fOGtXcZ+i7iU9f+GwKPTbWPhwO3Pf5NhAXXyBJmU=;
 b=Vikrt5TVMBkAhf+BJEqg6DfoymEa9W9G04iLXPDRoNZqsVATmyVY9Gz165Rlt0NxZy
 mbIkreFNqjzvOhR1CoWk2AdNmLrZKmOl3ipk6knEayDnud1/vtrG7w4hxYSuOurgn/bB
 CkU1NygzG/oBcmFAtia4w++nrjKg4MGeA5L1/Vy0k51icUX2WSUEbgxk/Wg4vimdVrVh
 sB/4maXXn5U8+OiYj7xTAFozfbIZIas7GdteDHlHMjEx6Wb6GGG34wM8oPvHaNF1Kjmn
 HZzOAR6xKHxfAGofZpRq/v95pZurwqdAWwlGcOZfOG2P9EmX723fv+a6i0vInXAdM42I
 L7hA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=Vikrt5TV
Subject: [Buildroot] [PATCH] package/network-manager: bump version to 1.40.10
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
Cc: Heiko Thiery <heiko.thiery@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
---
 package/network-manager/network-manager.hash | 4 ++--
 package/network-manager/network-manager.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/network-manager/network-manager.hash b/package/network-manager/network-manager.hash
index f503665a9a..3895c1ffc3 100644
--- a/package/network-manager/network-manager.hash
+++ b/package/network-manager/network-manager.hash
@@ -1,5 +1,5 @@
-# From https://download.gnome.org/sources/NetworkManager/1.40/NetworkManager-1.40.6.sha256sum
-sha256  2f025b2d5af7de593bbf47c17e4d98a2b9608ea90a8260fb08080be97439534e  NetworkManager-1.40.6.tar.xz
+# From https://download.gnome.org/sources/NetworkManager/1.40/NetworkManager-1.40.10.sha256sum
+sha256  fa251455df3c38e2bf1e1ff806b4bc4346938dd135a3568bd250e92caa85eaf7  NetworkManager-1.40.10.tar.xz
 # Locally computed
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LGPL
diff --git a/package/network-manager/network-manager.mk b/package/network-manager/network-manager.mk
index 847c6a82ba..138ff46e4a 100644
--- a/package/network-manager/network-manager.mk
+++ b/package/network-manager/network-manager.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 NETWORK_MANAGER_VERSION_MAJOR = 1.40
-NETWORK_MANAGER_VERSION = $(NETWORK_MANAGER_VERSION_MAJOR).6
+NETWORK_MANAGER_VERSION = $(NETWORK_MANAGER_VERSION_MAJOR).10
 NETWORK_MANAGER_SOURCE = NetworkManager-$(NETWORK_MANAGER_VERSION).tar.xz
 NETWORK_MANAGER_SITE = https://download.gnome.org/sources/NetworkManager/$(NETWORK_MANAGER_VERSION_MAJOR)
 NETWORK_MANAGER_INSTALL_STAGING = YES
-- 
2.20.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
