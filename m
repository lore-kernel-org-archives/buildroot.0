Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2473DD64070
	for <buildroot@archiver.kernel.org>; Fri,  8 Nov 2024 17:38:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A8DDE42AC1;
	Fri,  8 Nov 2024 17:38:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qo4ccDWP4xiW; Fri,  8 Nov 2024 17:38:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4A57642ABF
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4A57642ABF;
	Fri,  8 Nov 2024 17:38:12 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 44E35C0
 for <buildroot@buildroot.org>; Fri,  8 Nov 2024 17:38:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 26767811CE
 for <buildroot@buildroot.org>; Fri,  8 Nov 2024 17:38:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cKYTkypDNYBG for <buildroot@buildroot.org>;
 Fri,  8 Nov 2024 17:38:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::52b; helo=mail-ed1-x52b.google.com;
 envelope-from=francois.perrad@gadz.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 482A681153
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 482A681153
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 482A681153
 for <buildroot@busybox.net>; Fri,  8 Nov 2024 17:38:09 +0000 (UTC)
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-5cec7cde922so3114598a12.3
 for <buildroot@busybox.net>; Fri, 08 Nov 2024 09:38:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731087487; x=1731692287;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=mz3lB4UzYMc816Lek/0PVDpYC6syh0bM6Cy/d9LPiFY=;
 b=iikNu+ZEc83ej1HZo+o9YAtEGJYzXfIuJVYfWzD8bN0XlsSiuxOUalhZ7Eg8CJmOi+
 8+j1z6MuDiX1SboQG08ktKHygxvgXrBO7Ii9xjua0zGfr1jgZfgkoSuywKdChFpak9vR
 9Haeo+qW/BSBm8BGHaqJyPqskdyQimFaCGXpX2Dsu7P58z694tthHjS/tepeWQ9y+KUi
 JaXCgcpdbdr8EvpGTZnG2xNvpc4wj7o1pGviYVmulnSWRrGVv6u1xjA+Ry4gRewT9w/1
 ickB3i/hxRMwKuwJJf/DNX3JlbdFh+sKUBujXmsN7Qy3OWGxitmJjkm/xhJSSiAP33VY
 eg9w==
X-Gm-Message-State: AOJu0YycX5TZRen4bBhTAgYJmKFYVtWCpV065fM5KP7lkDWoGbKI05jF
 WYNVHkbJoO/aGFM3/cEKI+YKbVhEpuPbLbuWhyL2Hcko2FP2Ioy0nolOW2C+wESvdu0rRvYvGcy
 Asw==
X-Google-Smtp-Source: AGHT+IFnCTrW7bXkkonZZ8cpdn2UkmGTpF1xXG9i5zrk+XNLBw2K0G2/2MQS6u/88CQPVXPr4MQKOg==
X-Received: by 2002:a17:907:26c2:b0:a9a:dac:2ab9 with SMTP id
 a640c23a62f3a-a9eefff12c6mr341110866b.42.1731087487053; 
 Fri, 08 Nov 2024 09:38:07 -0800 (PST)
Received: from vm-2404.. (206.34.66.37.rev.sfr.net. [37.66.34.206])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9ee0def48csm256935666b.155.2024.11.08.09.38.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Nov 2024 09:38:06 -0800 (PST)
From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Fri,  8 Nov 2024 18:37:53 +0100
Message-ID: <20241108173754.1642869-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gadz.org; s=google; t=1731087487; x=1731692287; darn=busybox.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=mz3lB4UzYMc816Lek/0PVDpYC6syh0bM6Cy/d9LPiFY=;
 b=becI9Pie77vK/1+tSu7XWoCpBrfOxNpnknzSpnC7RUx4HFpd8l4780lzo2OqahC3PJ
 k5dZtkOKi9/vYa8QO9YWFIO94BzyltRH5qa6iL+Ckwc5bzhFU7C/LtM1OqO+INsuyNyI
 w/97y4gGEvpmNk1x0wtyZ6TVMIjCWRPjzJKZW3bFO0sL4i7VrRbafhqhpg/Cba/T9Omu
 dpY27caLXTAPf9S2pVSOLLcPKVhif92T/J49MrT+P/YHGhmpyLiF99z0KVpOelocwKNj
 5TfulrV8Dz4acRRDDwM0UlKzz0Wl4p85xkNLkD7h400FDq3qSOQ6v4gVr5vdbN3kMZ3M
 Vqlg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gadz.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gadz.org header.i=@gadz.org header.a=rsa-sha256
 header.s=google header.b=becI9Pie
Subject: [Buildroot] [PATCH] package/luaexpat: bump to version 1.5.2
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

diff LICENSE:
    -Copyright (C) 2003-2007 The Kepler Project, 2013-2022 Matthew Wild
    +Copyright (C) 2003-2007 The Kepler Project, 2013-2024 Matthew Wild

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/luaexpat/luaexpat.hash | 4 ++--
 package/luaexpat/luaexpat.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/luaexpat/luaexpat.hash b/package/luaexpat/luaexpat.hash
index 621293a0b..91fc9177c 100644
--- a/package/luaexpat/luaexpat.hash
+++ b/package/luaexpat/luaexpat.hash
@@ -1,3 +1,3 @@
 # computed by luarocks/buildroot
-sha256  eb7abc4cc39dd50eecb30896686bac84e66fd3c0774d0749b391e7ac5d222f45  luaexpat-1.5.1-1.src.rock
-sha256  7e6a727e5b57cca713a2f2633f05d7e0cc1e261cc6a7613bbe266e625b2f14da  luaexpat/LICENSE
+sha256  a88ac147d2ceaf168fddedd2245928f35d4c0218094142b054db7e9bae0b5b82  luaexpat-1.5.2-1.src.rock
+sha256  9a169eddcc5b1f05e85659a0ba5403a7e3804bc3b6e60b730251d963e1a9ac10  luaexpat/LICENSE
diff --git a/package/luaexpat/luaexpat.mk b/package/luaexpat/luaexpat.mk
index 73675a8ee..86d800d69 100644
--- a/package/luaexpat/luaexpat.mk
+++ b/package/luaexpat/luaexpat.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LUAEXPAT_VERSION = 1.5.1-1
+LUAEXPAT_VERSION = 1.5.2-1
 LUAEXPAT_SUBDIR = luaexpat
 LUAEXPAT_LICENSE = MIT
 LUAEXPAT_LICENSE_FILES = $(LUAEXPAT_SUBDIR)/LICENSE
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
