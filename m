Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4496DC433F5
	for <buildroot@archiver.kernel.org>; Wed,  5 Oct 2022 21:22:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C8E394180F;
	Wed,  5 Oct 2022 21:22:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C8E394180F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Eo-zBM2onTIS; Wed,  5 Oct 2022 21:22:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A854741805;
	Wed,  5 Oct 2022 21:22:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A854741805
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2936E1BF301
 for <buildroot@lists.busybox.net>; Wed,  5 Oct 2022 21:22:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0356441805
 for <buildroot@lists.busybox.net>; Wed,  5 Oct 2022 21:22:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0356441805
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WU3mL41neKmj for <buildroot@lists.busybox.net>;
 Wed,  5 Oct 2022 21:22:00 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 13D5B417FC
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com
 [IPv6:2607:f8b0:4864:20::634])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 13D5B417FC
 for <buildroot@buildroot.org>; Wed,  5 Oct 2022 21:21:59 +0000 (UTC)
Received: by mail-pl1-x634.google.com with SMTP id 10so12977005pli.0
 for <buildroot@buildroot.org>; Wed, 05 Oct 2022 14:21:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FIF2Za9R2H8Qv7fiOSEankJyjU0Fb76JfDbONL7PjL8=;
 b=5Nj+VVbG9tGlin9a5OoXBdCMrN1TXlLzArO6AWnDgPtfO3Em/Ix4yYf4ZlaM8Qbd0T
 vid6RpidLOWKr1Pg7VETLD+77V5f0s8oTa+jAq8btyU5o/qXYCQUuBaR6yeUmjMZltQO
 DjNFOoXjfyBALeAjOL8O+TdFSMpKWD7TJhl4ot2HOjidh0UaCB7ntIVue0YtqoWFHbHS
 Gy9KqOgNMI1lOOFWSKxzWxZqaSlGaochQpq0f/nGcm9fV0sN0c40pj7MJNPhwyfIHWTW
 1raiN1PU086j+GIt96LXCMA37JlyJryMYmBqbiaTyJibgymtkmzs7xXcj2ztTHy9OQ6K
 cnGA==
X-Gm-Message-State: ACrzQf2Vnv33722kOgE9ZdHnKIcY53ogXZYfXJHXR/Zb9bfVA0yIYE53
 aV7lKDhsbXCO9CLuKKxj1XPfOUuFmIAwOg==
X-Google-Smtp-Source: AMsMyM4zswKNJFqELRD4Cpwk6BSXWHsOQjc1g959qEC53V5jqfgFfTTWsQfXwRWSqC/JfTeh6j29rQ==
X-Received: by 2002:a17:902:d70e:b0:178:2d9d:ba7b with SMTP id
 w14-20020a170902d70e00b001782d9dba7bmr1278554ply.90.1665004919061; 
 Wed, 05 Oct 2022 14:21:59 -0700 (PDT)
Received: from adam-workstation.. ([47.153.94.144])
 by smtp.gmail.com with ESMTPSA id
 z12-20020a170903018c00b00172e19c2fa9sm11003033plg.9.2022.10.05.14.21.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Oct 2022 14:21:58 -0700 (PDT)
From: Adam Duskett <aduskett@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  5 Oct 2022 14:21:48 -0700
Message-Id: <20221005212150.1384370-2-aduskett@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221005212150.1384370-1-aduskett@gmail.com>
References: <20221005212150.1384370-1-aduskett@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FIF2Za9R2H8Qv7fiOSEankJyjU0Fb76JfDbONL7PjL8=;
 b=n4LjcvMk+d43QKsWWM050NP+3sJ0Cwdn/WpWj+nyhHOVZt5AXY/Z9ehwEnRthS0wFb
 65jneik1g4g4dSKkcyvhOqFbOi/Crq99Ip18h1+OSAWXTcsIaBDfG+awNThfl+ntnQYs
 WGqCUlEcGrha/tQBeMPEZ9JIYcMMph/Q+h3ewtghZK0yyAB5pyplq8AhBQ7v0j0o2uKV
 CBPZL7ZoxQRtWD9ZQ7CmyOia1GMaX7EjC8cVDyFMZGNwAx5PwPP5TnWKo69vRI5dpBLE
 xHMUg0FsW2IfeueHYzt3TL6bSJvH63Ig1180r0c9yQkZoI9WRvbmSzlvnp1wA1+hPrZ3
 9Nbw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=n4LjcvMk
Subject: [Buildroot] [PATCH 2/4] package/mender-connect: bump version to
 2.1.0
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
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Adam Duskett <aduskett@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Adam Duskett <aduskett@gmail.com>
---
 package/mender-connect/mender-connect.hash | 2 +-
 package/mender-connect/mender-connect.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/mender-connect/mender-connect.hash b/package/mender-connect/mender-connect.hash
index 46f37f954b..da4ec5fbbd 100644
--- a/package/mender-connect/mender-connect.hash
+++ b/package/mender-connect/mender-connect.hash
@@ -1,5 +1,5 @@
 # Locally computed:
-sha256  6410bcd76cebd21e9f18fe5768928d67163e4bb2b6ae76d0e20815400d907657  mender-connect-2.0.2.tar.gz
+sha256  96b81bb4c72eb8c1756febb94101c0dea5a6d4884591824e61a5f2509cd9ca9b  mender-connect-2.1.0.tar.gz
 sha256  78b3954421ec6499c3f9735b96d52288574ae80c747416a52548d7f526f26e8c  LIC_FILES_CHKSUM.sha256
 
 # Vendor licenses
diff --git a/package/mender-connect/mender-connect.mk b/package/mender-connect/mender-connect.mk
index 1b0285cffc..36ddd5f7db 100644
--- a/package/mender-connect/mender-connect.mk
+++ b/package/mender-connect/mender-connect.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MENDER_CONNECT_VERSION = 2.0.2
+MENDER_CONNECT_VERSION = 2.1.0
 MENDER_CONNECT_SITE = $(call github,mendersoftware,mender-connect,$(MENDER_CONNECT_VERSION))
 MENDER_CONNECT_LICENSE = Apache-2.0, BSD-2-Clause, BSD-3-Clause, ISC, MIT
 
-- 
2.37.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
