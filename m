Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C434C4167B
	for <buildroot@archiver.kernel.org>; Thu,  8 Dec 2022 19:39:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 85B2D60681;
	Thu,  8 Dec 2022 19:39:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 85B2D60681
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NPtrpPSkCY1J; Thu,  8 Dec 2022 19:39:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B4AA960669;
	Thu,  8 Dec 2022 19:39:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B4AA960669
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E69331BF2F0
 for <buildroot@lists.busybox.net>; Thu,  8 Dec 2022 19:39:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C23DC60675
 for <buildroot@lists.busybox.net>; Thu,  8 Dec 2022 19:39:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C23DC60675
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JXkUjLrUzW-S for <buildroot@lists.busybox.net>;
 Thu,  8 Dec 2022 19:39:38 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C13BF605EA
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C13BF605EA
 for <buildroot@buildroot.org>; Thu,  8 Dec 2022 19:39:37 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id m19so228216edj.8
 for <buildroot@buildroot.org>; Thu, 08 Dec 2022 11:39:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=9z72GFtzAIxlqOBbUuTSdWO+CGjkPq3oKIOulRlN5uM=;
 b=tPv/2xDd8lpnnbJb/GNWQDoPAxMM02pSQ8k6eGPvBt2uoXhLC+F2vs1t0I2jEjqUqZ
 mm2Nt+BjsRRlUnL70Fe8cE61HB3D7NIM5cVYHmp/nVg8ez+VALqAOPbqmM0DejaLGPJ5
 m3B03KZ2TMYgZdrYS9zItdVQfTkZzAllJ41Sr0IOD1l5zMCsZnyd9JIRJl18dePPtDYc
 l3qoiVvuMTnQdcfk+rAXIaGnVHddwdgK6jNH60buOe0yh5hNly0sR0YjAxLqlPAe9adz
 1hZmcfhOpneTDH+cCUaYBTUDSkYa8qbIiux3QMNbLmk7/5S6Gh/tuub6kCrP+LwEmr2u
 WMCA==
X-Gm-Message-State: ANoB5pm8S/TXDtl4Ndfaisjj3GJpv2Vu8EZOqKLrBSXQ8Mf5jfom9cTS
 KB2WBmQPdCVkQUPUaVUcgpqwSvBKdqcVFQ==
X-Google-Smtp-Source: AA0mqf5JMnx4/omJ9NLKgYuN0nWEJXAe5dh0VG/F2HvH1W6mdlsMJc9b/LMIbfykhD8oUgnZTQoMLA==
X-Received: by 2002:a05:6402:884:b0:46c:8a01:7494 with SMTP id
 e4-20020a056402088400b0046c8a017494mr2996163edy.37.1670528375108; 
 Thu, 08 Dec 2022 11:39:35 -0800 (PST)
Received: from t450s.fritz.box (ip4d15a215.dynamic.kabel-deutschland.de.
 [77.21.162.21]) by smtp.gmail.com with ESMTPSA id
 s26-20020a056402015a00b00461bacee867sm3717799edu.25.2022.12.08.11.39.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Dec 2022 11:39:34 -0800 (PST)
From: Heiko Thiery <heiko.thiery@gmail.com>
To: buildroot@buildroot.org
Date: Thu,  8 Dec 2022 20:39:18 +0100
Message-Id: <20221208193917.6391-1-heiko.thiery@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=9z72GFtzAIxlqOBbUuTSdWO+CGjkPq3oKIOulRlN5uM=;
 b=CEdK0O9ixkHSHnNkjvOhbn8Ogp5Y0T4dJbdQEvnbNOjrtrqsVVz+zj0GbMD2uHWaoY
 gg5MPq9Dl9h5j9Strc8VJLISOM8c+1ebcCLcE90xDqCKox9FkM1OVbuxl5/YuApcoDj7
 cTQZmuRaHG8QxAOMJLh3jovCrJFGXe1sMrIdeIQS+M3yxxFGieWpwo2k9TX7mp1f6KSw
 pnxDz5lJjQTbFFt3jDNtxwNRWAXEML21ld0+ZmJU2FFBcXirrmiWEXK/9NojmJrn5QX5
 IBDDoXLOMaL7Qqc2vIU+GEIqKhlMVHCVPfRZrLC3Q3WOroXNrXKIw8lfyT0DTVGbJpRr
 XHrw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=CEdK0O9i
Subject: [Buildroot] [PATCH] package/network-manager: bump to version 1.40.6
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
Cc: Michael Fischer <mf@go-sys.de>, TIAN Yuanhao <tianyuanhao3@163.com>,
 James Hilliard <james.hilliard1@gmail.com>, John Keeping <john@metanate.com>,
 Heiko Thiery <heiko.thiery@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
---
 package/network-manager/network-manager.hash | 4 ++--
 package/network-manager/network-manager.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/network-manager/network-manager.hash b/package/network-manager/network-manager.hash
index 26bcf843c2..f503665a9a 100644
--- a/package/network-manager/network-manager.hash
+++ b/package/network-manager/network-manager.hash
@@ -1,5 +1,5 @@
-# From https://download.gnome.org/sources/NetworkManager/1.36/NetworkManager-1.36.4.sha256sum
-sha256  61304e937dd926471d56715bdede7bab7ccac827356e67f2700d343317cd3c59  NetworkManager-1.36.4.tar.xz
+# From https://download.gnome.org/sources/NetworkManager/1.40/NetworkManager-1.40.6.sha256sum
+sha256  2f025b2d5af7de593bbf47c17e4d98a2b9608ea90a8260fb08080be97439534e  NetworkManager-1.40.6.tar.xz
 # Locally computed
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LGPL
diff --git a/package/network-manager/network-manager.mk b/package/network-manager/network-manager.mk
index a17c5e1774..847c6a82ba 100644
--- a/package/network-manager/network-manager.mk
+++ b/package/network-manager/network-manager.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-NETWORK_MANAGER_VERSION_MAJOR = 1.36
-NETWORK_MANAGER_VERSION = $(NETWORK_MANAGER_VERSION_MAJOR).4
+NETWORK_MANAGER_VERSION_MAJOR = 1.40
+NETWORK_MANAGER_VERSION = $(NETWORK_MANAGER_VERSION_MAJOR).6
 NETWORK_MANAGER_SOURCE = NetworkManager-$(NETWORK_MANAGER_VERSION).tar.xz
 NETWORK_MANAGER_SITE = https://download.gnome.org/sources/NetworkManager/$(NETWORK_MANAGER_VERSION_MAJOR)
 NETWORK_MANAGER_INSTALL_STAGING = YES
-- 
2.20.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
