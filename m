Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 360EEC4332F
	for <buildroot@archiver.kernel.org>; Mon, 19 Dec 2022 21:03:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A9395405E2;
	Mon, 19 Dec 2022 21:02:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A9395405E2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MUtxsYjIPtFO; Mon, 19 Dec 2022 21:02:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id EC887405D7;
	Mon, 19 Dec 2022 21:02:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EC887405D7
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0110F1BF369
 for <buildroot@lists.busybox.net>; Mon, 19 Dec 2022 21:02:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DAF7C812CF
 for <buildroot@lists.busybox.net>; Mon, 19 Dec 2022 21:02:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DAF7C812CF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hzKmkrRy3rXn for <buildroot@lists.busybox.net>;
 Mon, 19 Dec 2022 21:02:54 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A238380A8C
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A238380A8C
 for <buildroot@busybox.net>; Mon, 19 Dec 2022 21:02:54 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id m19so7317515wms.5
 for <buildroot@busybox.net>; Mon, 19 Dec 2022 13:02:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ngdE/SMSxhqEj9lhGPMQOaT50fsoK+bxCkhKiY12XCI=;
 b=tCXeQJPq6QHuPUTQoi2h3VusbHWcvnM7aK4dlrZIeJscTPSPm9udlWOhd3ZiHzFW7Z
 it7IQnMgHjg+dl058KqyFTqyjgnsAsheJvxoiKwwRBw+k2g+BXi3xe5CZnGkBrK0cp4G
 QEn6u0mhKaziVOgDzLJOXmZp0ypxoIuCUMT0yHqQdGiBa9pDGnAP4lBwbOPF8J/vJT4S
 K0jw0Yn7PTmI9aCNZPlV8t/FYovXo+t2mXa+gsvt4IfAsGdqXtzIdzbonOLw6vo16ifP
 S0l5Bk4fKoS2wAWsc5grBnwU/7H72aNYrYBBfqFQElIzAQlw/qNduGGlZHDegnFqfyqJ
 jCLA==
X-Gm-Message-State: ANoB5plhGFWquuIDwiAU4ghEBKdw8AZQk6qm6fdZAG6Sdj2PIxu5meBd
 N3so0oDJ4ZVv3xtJ/uroLrpLZxEk4yw=
X-Google-Smtp-Source: AA0mqf6LSa12FO3+CduIQIH9PvSbB5rWuX5jtGjKO9qZiJjEWVLRv5vrMDu6oAYVlhx53MRrkEBXTA==
X-Received: by 2002:a7b:cd89:0:b0:3d2:2651:64bd with SMTP id
 y9-20020a7bcd89000000b003d2265164bdmr23419209wmj.10.1671483772708; 
 Mon, 19 Dec 2022 13:02:52 -0800 (PST)
Received: from vm-22.. (12.197.24.93.rev.sfr.net. [93.24.197.12])
 by smtp.gmail.com with ESMTPSA id
 n11-20020a05600c3b8b00b003cf57329221sm23269167wms.14.2022.12.19.13.02.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Dec 2022 13:02:52 -0800 (PST)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Mon, 19 Dec 2022 22:02:46 +0100
Message-Id: <20221219210246.3416850-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ngdE/SMSxhqEj9lhGPMQOaT50fsoK+bxCkhKiY12XCI=;
 b=JRbvqJZPiOsxQIzhPix6ZfvAxIhqYv0oh/aGv6FOQGXU+Ib0n7yNk7ogAe5R3xaFEf
 YS0bKLEH4p+yuKIWTCB6AEJnnogLYQ5IflRIT1jw7WUtS+FW7RCiF4i7anHG5BT9lleQ
 pj2DcDu09lNPxwayezD0BDBBD9jJbAnYf2/bw0HVXaFoQ9ilVD/+8zfV06Qkn8S8Bj86
 JN3XEoBSkx5H3ElcplqvQldiVvYU9Ha1zwPn9E/uSz8vYrC5q0clZB4y7HeeTXn0DRGx
 qNT/jN/70TUh07UEiqTVabvLTwtQI09/GvFLwdfU/+2J6aNj1f85klsHb1ajSbYg8HQe
 CmgQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=JRbvqJZP
Subject: [Buildroot] [PATCH] package/luaexpat: bump to version 1.5.1
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/luaexpat/luaexpat.hash | 2 +-
 package/luaexpat/luaexpat.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/luaexpat/luaexpat.hash b/package/luaexpat/luaexpat.hash
index be67e9be6..621293a0b 100644
--- a/package/luaexpat/luaexpat.hash
+++ b/package/luaexpat/luaexpat.hash
@@ -1,3 +1,3 @@
 # computed by luarocks/buildroot
-sha256  536a5eda09bb070d2de8ecdd15566d3a55e2afa5ded2ef183cd453bac8c41e98  luaexpat-1.5.0-1.src.rock
+sha256  eb7abc4cc39dd50eecb30896686bac84e66fd3c0774d0749b391e7ac5d222f45  luaexpat-1.5.1-1.src.rock
 sha256  7e6a727e5b57cca713a2f2633f05d7e0cc1e261cc6a7613bbe266e625b2f14da  luaexpat/LICENSE
diff --git a/package/luaexpat/luaexpat.mk b/package/luaexpat/luaexpat.mk
index f56bf604b..73675a8ee 100644
--- a/package/luaexpat/luaexpat.mk
+++ b/package/luaexpat/luaexpat.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LUAEXPAT_VERSION = 1.5.0-1
+LUAEXPAT_VERSION = 1.5.1-1
 LUAEXPAT_SUBDIR = luaexpat
 LUAEXPAT_LICENSE = MIT
 LUAEXPAT_LICENSE_FILES = $(LUAEXPAT_SUBDIR)/LICENSE
-- 
2.37.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
