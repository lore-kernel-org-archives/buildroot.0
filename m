Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C25A3C38147
	for <buildroot@archiver.kernel.org>; Wed, 18 Jan 2023 15:47:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1EA8A40ACD;
	Wed, 18 Jan 2023 15:47:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1EA8A40ACD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6rsgOYDioVO7; Wed, 18 Jan 2023 15:47:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6497B4038E;
	Wed, 18 Jan 2023 15:47:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6497B4038E
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 00B321BF312
 for <buildroot@lists.busybox.net>; Wed, 18 Jan 2023 15:46:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D049A82036
 for <buildroot@lists.busybox.net>; Wed, 18 Jan 2023 15:46:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D049A82036
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wsA9nVZzXsOL for <buildroot@lists.busybox.net>;
 Wed, 18 Jan 2023 15:46:58 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E4A748201F
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E4A748201F
 for <buildroot@busybox.net>; Wed, 18 Jan 2023 15:46:57 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 o17-20020a05600c511100b003db021ef437so1832998wms.4
 for <buildroot@busybox.net>; Wed, 18 Jan 2023 07:46:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=zyI0j7q1WZAGC7KerakJiV7hO4EDh4uzC28H++B2rlg=;
 b=PMUR9dOMXGPk3zylJLb3ZMLDZ+7lKJ7oKM0NeF5gbO9UoZ5RNBH8Iv8rbaCcKYCh7D
 wtXuoIX+m+vHPSktMobVjcx4IsJA0i6jXv3nujayCgszOaiW45GjqO+ej+oeekz6cfUp
 9TV4Gq/Me2ZRvY6OazkYQfdfleSI5AbQghtljq2dHcm1KNBUa5kMTiZ5hb3WtpnviCmg
 Bw+OuAtSh7kx6hSXEGO/URkaQDmM54U/6YRXlJZKw0EXHOXcW4FQbfwjPrdUWYQWgha2
 qYxzI0b8Pzq5/8ipbmMUxEZUqgqjBGPPBfutdgJCfjy7WgiUY8EXwSX8y12lqpa/ByDj
 cBCQ==
X-Gm-Message-State: AFqh2kr/5rYd0n+jAPP6b2qBaOjE4+YgTq+jygJKaxghIqmTCEft5A9G
 zYbFCQ9My1w+F8gbmOJmQB07SyoRlpY=
X-Google-Smtp-Source: AMrXdXsbyzmCvCuWIpQowRTS/YQwOmLMyipiTnVq3WuX5gGm7ehVvG7OXyqGxQsYASI0aifr+3QJrA==
X-Received: by 2002:a05:600c:1c01:b0:3da:fc07:5e80 with SMTP id
 j1-20020a05600c1c0100b003dafc075e80mr10536878wms.12.1674056815881; 
 Wed, 18 Jan 2023 07:46:55 -0800 (PST)
Received: from vm-22.. (12.197.24.93.rev.sfr.net. [93.24.197.12])
 by smtp.gmail.com with ESMTPSA id
 p10-20020a1c544a000000b003db16770bc5sm1630160wmi.6.2023.01.18.07.46.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Jan 2023 07:46:55 -0800 (PST)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Wed, 18 Jan 2023 16:46:14 +0100
Message-Id: <20230118154614.2103-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=zyI0j7q1WZAGC7KerakJiV7hO4EDh4uzC28H++B2rlg=;
 b=pREP4/7kWPGKtQPsE/hWbjT8QHBGaN05sTiixxWmEQ4K/+4oWASwr0c5uKS3cXLT7q
 b61pErDMUhU2QakCVlpHAq/aBLCIlTxZCKxFTCre4HCD5REOgWme7zXFL7qSo88kJqCp
 gzESiMvLo9OVgMP2omRpNN/k49wU+v/vjrXY04knBIGJv0TCcdjCsnA8aXy3+HG8YBjP
 GLUjIg8sbzwqB6Uu4tXxJnd5WxP/WCOwyljD5Gm78/BTCj+kMQABVIaYZB/qdhOgk1/V
 o31XiZe9T+hK/1Mvo6dC07rso1hzezNdOH+FjAD2siJbLDf0n+2rzj2sFeMCGUSdMozj
 nh6A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=pREP4/7k
Subject: [Buildroot] [PATCH v2] package/lua: add options for coercion
 between number and string
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

the default behavior of Lua 5.3/5.4 interperter
(and the only way with Lua 5.1) is the automatic coercion.

this default behavior could change in future version (ie. Lua 5.5).

disabling automatic coercion increases the performance of the interpreter.

currently, using automatic coercion is not a good/recommended practice,
but there are no way (expect testing) to say if a Lua module relies on it.

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/lua/Config.in | 14 ++++++++++++++
 package/lua/lua.mk    |  8 ++++++++
 2 files changed, 22 insertions(+)

diff --git a/package/lua/Config.in b/package/lua/Config.in
index 309dd6eec..ac30cfdde 100644
--- a/package/lua/Config.in
+++ b/package/lua/Config.in
@@ -41,6 +41,20 @@ config BR2_PACKAGE_LUA_32BITS
 	  default 64 bit type. This option is particularly attractive
 	  for small machines and embedded systems.
 
+config BR2_PACKAGE_LUA_CVT_N2S
+	bool "automatic coercion from number to string"
+	default y
+	help
+	  If unsure, say y, this is the default behavior of the Lua
+	  interpreter. See LUA_NOCVTN2S in luaconf.h
+
+config BR2_PACKAGE_LUA_CVT_S2N
+	bool "automatic coercion from string to number"
+	default y
+	help
+	  If unsure, say y, this is the default behavior of the Lua
+	  interpreter. See LUA_NOCVTN2S in luaconf.h
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
