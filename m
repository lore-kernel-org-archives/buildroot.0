Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48F60C282C1
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 14:48:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E79026064F;
	Fri, 28 Feb 2025 14:48:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FQDziU05njrs; Fri, 28 Feb 2025 14:48:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DD5B760817
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id DD5B760817;
	Fri, 28 Feb 2025 14:48:32 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 3A780950
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 14:48:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1A6EA4099B
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 14:48:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id t23z1U56sDPK for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 14:48:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::629; helo=mail-ej1-x629.google.com;
 envelope-from=adam.duskett@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 3FA07407E4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3FA07407E4
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3FA07407E4
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 14:48:27 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-abb76cc6108so33101066b.0
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 06:48:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740754105; x=1741358905;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Fgi5w96Fj4G2sZv8ucdk2mdNG8BfUJbBmqznXEByMXo=;
 b=t7lsJ9kBPDn5vLXsXUZH9nSqQZyamwZ/l+E177sag6JtZLodkiXsYpJaVSxH9NLOeE
 Zr02JztKD32H3SeOXIEYruHfEBNJlwhW43V1InDiaHKddzuL9lCpfFQgqHy5w7NiiWh2
 bk6Fh7DCH8EENceCr3yN4s1/gbeqI7VC9MwWL+1ixYhKJrqxPNp+vbZKMlZoLAl248XH
 H+hu+viYld1E1PM+qafYkRO8DG70seq/JHCAK6eXDvK5YXe2T1Do9jRyGIjSdeNrnEW4
 zpsBgd07q4eYYURGM8VfiMh6O3SO9nLHIkg8dnKY0weX5oZ4/RLaU2bDiRP0ei7HeQAT
 R/0Q==
X-Gm-Message-State: AOJu0YzIeRHxPHlJEeWodVrD10O48SimwSdzl6qiqBEDHpru6qd/TWBs
 lNc22YIf+8kPkUFSvGHypYVjTwqqthL7LwOTliY1xW+6u9xW2clnCJArGj8B0bIbGKsTxfoh8e3
 J
X-Gm-Gg: ASbGncse6s0rqvl3yMm653Y/ReT7imHYNz4JJdeQkgNpVN9goheJd4+ZkjPoL+X2ke9
 8RGxOtD2it5wREYClFU4xBG+gwlSPDddN3QBivhxa47OsbQS4Q3/j16dLxFKC9SzkfeLaWDg8/w
 LYEsGQ2SFbxCyE/lNIA2H9gyfS1EQz1rW3UUoQgSm3y6fBSkKx823CG4fs00cw0JeX1Qnq8VK6M
 bPtX3m6NYz1LvBSMHoawIfwnXxWpkoCc+D838ipGSpWF/TBQvPUZ7gBmBskx70QAPIzyQmL3uIg
 yTmzSyWxgGgAb1LmJpn8u8PQ9NkHBrjS+jcn5eVqRyaORWj4tut2Qah3Pfp+v0uUtpCzTrFIWXr
 HhAnWfUSZ2j6i
X-Google-Smtp-Source: AGHT+IETJMI+4OB0cnrd6GYrw79YSOTcqR62HBkys+kt0vZZWAP1rwSAe6rMw5f5p8Pfw+ZwTs0LRQ==
X-Received: by 2002:a17:907:7fab:b0:ab6:d3b6:d825 with SMTP id
 a640c23a62f3a-abf27390268mr164954766b.6.1740754104954; 
 Fri, 28 Feb 2025 06:48:24 -0800 (PST)
Received: from fedora.ipgroup.local (212-57-59-66.xdsl.deanconnect.nl.
 [212.57.59.66]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-abf0c6ee4b3sm293663566b.112.2025.02.28.06.48.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Feb 2025 06:48:24 -0800 (PST)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>
Date: Fri, 28 Feb 2025 15:48:18 +0100
Message-ID: <20250228144822.860085-1-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1740754105; x=1741358905;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Fgi5w96Fj4G2sZv8ucdk2mdNG8BfUJbBmqznXEByMXo=;
 b=p3AAeXRQU4WGd6kMYKnL8nWRX/AlxNFSWXYDO93L4yiaa823VpRgzM4DCyE9mJl+56
 DH3gyB/IeGbLeLd1yYtu21ENU4+r6mrG4UO6WOe1r/qFS7A5/fMCj4OTa9u8Ve07VcgG
 0MrFQ5hD1+x5uRfneVqd4h/Y8KGKXeHWB7CiQ=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=p3AAeXRQ
Subject: [Buildroot] [PATCH 1/5] package/ivi-homescreen: bump to version
 5ab78a19e95c88cc5d6b173ab1260a211e78cf0a
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 package/ivi-homescreen/ivi-homescreen.hash | 2 +-
 package/ivi-homescreen/ivi-homescreen.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/ivi-homescreen/ivi-homescreen.hash b/package/ivi-homescreen/ivi-homescreen.hash
index 60b9281abc..484ecfb128 100644
--- a/package/ivi-homescreen/ivi-homescreen.hash
+++ b/package/ivi-homescreen/ivi-homescreen.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  733a95a9b50875e8b45b0b69118656edba3ba88ecc65e3c0d76ea5df9761c433  ivi-homescreen-5ab78a19e95c88cc5d6b173ab1260a211e78cf0a-git4.tar.gz
+sha256  aba31437dd90eca1fc5723619c269394e475b3000309eda86efcfd252452a85e  ivi-homescreen-a038ce00031ed5a9a89b4d8dd7dbde5e3d7ade6e-git4.tar.gz
 
 # Apache-2.0
 sha256  6b96fa0a3def85caaf466caa2bd82d4ca4f22d106ff88f97a00c537c00cc714b  LICENSE
diff --git a/package/ivi-homescreen/ivi-homescreen.mk b/package/ivi-homescreen/ivi-homescreen.mk
index 4293b2bc35..525fb4e11b 100644
--- a/package/ivi-homescreen/ivi-homescreen.mk
+++ b/package/ivi-homescreen/ivi-homescreen.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IVI_HOMESCREEN_VERSION = 5ab78a19e95c88cc5d6b173ab1260a211e78cf0a
+IVI_HOMESCREEN_VERSION = a038ce00031ed5a9a89b4d8dd7dbde5e3d7ade6e
 IVI_HOMESCREEN_SITE = https://github.com/toyota-connected/ivi-homescreen.git
 IVI_HOMESCREEN_SITE_METHOD = git
 IVI_HOMESCREEN_LICENSE = Apache-2.0, BSD-3-Clause, BSD-Style, BSL-1.0, MIT
-- 
2.48.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
