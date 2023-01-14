Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8C06C46467
	for <buildroot@archiver.kernel.org>; Sat, 14 Jan 2023 19:47:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 29FBD60F68;
	Sat, 14 Jan 2023 19:47:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 29FBD60F68
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UueeWEmnQTOl; Sat, 14 Jan 2023 19:47:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 776AF60F62;
	Sat, 14 Jan 2023 19:47:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 776AF60F62
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A84F11BF3D8
 for <buildroot@lists.busybox.net>; Sat, 14 Jan 2023 19:47:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9089881E89
 for <buildroot@lists.busybox.net>; Sat, 14 Jan 2023 19:47:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9089881E89
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WLjUP5FHtWTz for <buildroot@lists.busybox.net>;
 Sat, 14 Jan 2023 19:47:06 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A92F281EBC
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A92F281EBC
 for <buildroot@busybox.net>; Sat, 14 Jan 2023 19:47:05 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 k22-20020a05600c1c9600b003d1ee3a6289so19511534wms.2
 for <buildroot@busybox.net>; Sat, 14 Jan 2023 11:47:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=FsvVBVZUBxnX8h0E7MMJ3V5F3lPU4VNvY4Ukvo3iIr8=;
 b=d3UX1cEzfr/qbe4PKzeTrKNDUYQQPn5qPCPsIXJV/GAmnoVRa5+86hQd4uq2JWXLOu
 mgVQBddXAqGWIsZT6W6XPsfxUmPevnef8y4d/JAx4NIatGMV9hrYiFMWETegHW/qC9gE
 u6bROF0Dd7C+DaSL71KeiQdf7c46j9q+Q6IOj5Pi3GzDOeGBx5ehYf1HFXVWGplKznd6
 owyOnAS0zy4AIrinEzjbJx69fcz+KCngxNbBfAv2O2mZwfq0VC9p6Beo9VDo5Qh5yVat
 XM3F9VmOfxU+b7R9VfKjffGnKNzBYP7qwzCF1kG1hv7lNlReXDDC+qEiIjCKsLk6hHSb
 I7SA==
X-Gm-Message-State: AFqh2kpqc6zpu/hpKHm5TitNCd+blLi7qkV8Y/Cvemz9ZuX7p8YgedAG
 x/K1fWCI72xqIx+utvST7E1kzo8wYws=
X-Google-Smtp-Source: AMrXdXvzA7RihhKKazCwE/Zl8WtI9XXSzyqqY3yxIDJkvef003FRVulO23JwK2aZjCT18Xxqusv1SQ==
X-Received: by 2002:a05:600c:4f93:b0:3d9:e5f9:984c with SMTP id
 n19-20020a05600c4f9300b003d9e5f9984cmr20873361wmq.2.1673725623764; 
 Sat, 14 Jan 2023 11:47:03 -0800 (PST)
Received: from vm-22.. (12.197.24.93.rev.sfr.net. [93.24.197.12])
 by smtp.gmail.com with ESMTPSA id
 j18-20020a05600c191200b003d9dee823a3sm31475430wmq.5.2023.01.14.11.47.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 14 Jan 2023 11:47:03 -0800 (PST)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Sat, 14 Jan 2023 20:46:57 +0100
Message-Id: <20230114194657.2192-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=FsvVBVZUBxnX8h0E7MMJ3V5F3lPU4VNvY4Ukvo3iIr8=;
 b=bm1LJU7GD+kwItr87w6cS1orlRasZkvc4dinGtxRg8G/bdFciTkCjP/VLo+ReRwjrt
 GZYCXYVTU7Ap5Pr7zVeeVT6NwJlcXvcNYW3jq7SBP1bqjc4cSaveG0asP1bL/RDCm3sK
 o7kYSJYUGkg2rHIDkmN9SqfTasrctAWbUpnJJRve0omXcmeI1KSx1YtZ8j4h1HrMwjzk
 O81Ma0XGOeu09fTvhK3eZazE9qWef7J4bEB6dzsdx2DF3ktGSE4xOhRaxm9rlTuzwX6R
 8diy8AcWp64Oq7KP6sSMmPwsyrtqSJAj0KrS7qZxDMCPuGcUmhYFKJsv9OlwC0y7ICJx
 5EuA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=bm1LJU7G
Subject: [Buildroot] [PATCH] package/lua: add options for coercion between
 number and string
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

note: not available with Lua 5.1
Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/lua/Config.in | 12 ++++++++++++
 package/lua/lua.mk    |  8 ++++++++
 2 files changed, 20 insertions(+)

diff --git a/package/lua/Config.in b/package/lua/Config.in
index 309dd6eec..903031e50 100644
--- a/package/lua/Config.in
+++ b/package/lua/Config.in
@@ -41,6 +41,18 @@ config BR2_PACKAGE_LUA_32BITS
 	  default 64 bit type. This option is particularly attractive
 	  for small machines and embedded systems.
 
+config BR2_PACKAGE_LUA_CVT_N2S
+	bool "automatic coercion from number to string"
+	default y
+	help
+	  See LUA_NOCVTN2S in luaconf.h
+
+config BR2_PACKAGE_LUA_CVT_S2N
+	bool "automatic coercion from string to number"
+	default y
+	help
+	  See LUA_NOCVTS2N in luaconf.h
+
 endif
 
 choice
diff --git a/package/lua/lua.mk b/package/lua/lua.mk
index 01b554eb6..16086e7bf 100644
--- a/package/lua/lua.mk
+++ b/package/lua/lua.mk
@@ -31,6 +31,14 @@ else ifeq ($(BR2_PACKAGE_LUA_5_3),y)
 LUA_CFLAGS += -DLUA_COMPAT_5_2
 endif
 
+ifeq ($(BR2_PACKAGE_LUA_CVT_N2S),)
+LUA_CFLAGS += -DLUA_NOCVTN2S
+endif
+
+ifeq ($(BR2_PACKAGE_LUA_CVT_S2N),)
+LUA_CFLAGS += -DLUA_NOCVTS2N
+endif
+
 ifeq ($(BR2_STATIC_LIBS),y)
 LUA_BUILDMODE = static
 else
-- 
2.37.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
