Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C937CE7A88
	for <buildroot@archiver.kernel.org>; Sun, 24 Sep 2023 14:50:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 973C040360;
	Sun, 24 Sep 2023 14:50:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 973C040360
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UUcoz9-NTsNV; Sun, 24 Sep 2023 14:50:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A1F354034A;
	Sun, 24 Sep 2023 14:50:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A1F354034A
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4C3631BF2E3
 for <buildroot@lists.busybox.net>; Sun, 24 Sep 2023 14:50:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1F9BF81A73
 for <buildroot@lists.busybox.net>; Sun, 24 Sep 2023 14:50:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1F9BF81A73
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lv4p_-5dyRIO for <buildroot@lists.busybox.net>;
 Sun, 24 Sep 2023 14:50:24 +0000 (UTC)
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 02BCD818C9
 for <buildroot@buildroot.org>; Sun, 24 Sep 2023 14:50:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 02BCD818C9
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-32179d3c167so4132436f8f.1
 for <buildroot@buildroot.org>; Sun, 24 Sep 2023 07:50:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695567022; x=1696171822;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=6LtzIlemJLsLn85BoFdb1XkpdFgGkThFdqwBWnmhutY=;
 b=UuX8GBlRASYKZLt+DAWwAQ7g5EJ+A8PBhdgQJZjRaUmfmaC+2EPy9JqMyGd1qfyW09
 4zx6o1vDK9FazcBKZG8XiT5zHaR8nhkcYyllVwpmXUSsQGHtAZoDFIc7lMlO0TMv5bEn
 JC+6I9X++hsxyhQXui6dMDHD/0w47qwbpvYoaYrFLSynPSKI1icY9vBpe3scqPbgXNq0
 6VRz9YjjuONNquKiOyxpBqoQPOLUU90HSkrczDfJolQ57JRO6yEarSNup7Aghm9NgYRB
 vlYiOUtLTW0id074ghJvY8avyp9THWiEP9IgWSnyh/9yy0lqWh3o4Mn3bMHfDNd+O6XX
 HD3A==
X-Gm-Message-State: AOJu0YxlD/zmcRBSrVe4WACjNg/332c96xUB01Ju45eRgbUYuAf16RYM
 YkEl7ZcGcIzz2OA6JCufUmxOJKZv8ZM=
X-Google-Smtp-Source: AGHT+IG+9u+hN34z+Yw/hliCbd4Bb3ctIvxJrIRbUbHX34uPQlmtQyNFvL/rQu7EuLHT0d2/Fe/FVQ==
X-Received: by 2002:adf:fc90:0:b0:31f:d2dc:df26 with SMTP id
 g16-20020adffc90000000b0031fd2dcdf26mr3889520wrr.28.1695567021469; 
 Sun, 24 Sep 2023 07:50:21 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 w7-20020adff9c7000000b0031912c0ffebsm9425415wrr.23.2023.09.24.07.50.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 Sep 2023 07:50:21 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 24 Sep 2023 16:50:17 +0200
Message-Id: <20230924145017.340500-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1695567022; x=1696171822; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=6LtzIlemJLsLn85BoFdb1XkpdFgGkThFdqwBWnmhutY=;
 b=EUC2t/WgFmXrmU4j8VzELq0qz7EJ3S+ZnfbhRkNV1rTWaCFNq9s/CVwxhzt7faxmBX
 Y5NVKJnW9+0F0eZi+huT1Ts5JNDzbL1LBi/UwQMjie4TnR2mb530zBIju3RKN39ohCyC
 DEoiaSDEdPxBCLr9NZ26mZaCp2ypJcS7NAMnlsSga/f5z1fWrkIl40A5R5XZHrMFrFWm
 JuA+4cnGxHpizFb59HmHuppQMBNx2w8myhnC2w0G/VpElm8VkLtXUf7WTKbxAPvVkzIo
 9sYx1cC06u5CPnKFaXgyJ/iRonrb9vwUxnDKjFOMOhs+xIs/Pqbn2DyTqgfpMx7a9lrL
 sfxw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=EUC2t/Wg
Subject: [Buildroot] [PATCH 1/1] package/luvi: fix build
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

pkg-config --variable=version luajit returns 2.1.1693350652 since bump
of luajit in commit c9dcd9e459d6e0a955129ab42916d4c1140bdc3d resulting
in the following build failure:

luajitluajit::  unknown luaJIT command or jit.* modules not installedunknown luaJIT command or jit.* modules not installed

Fixes:
 - http://autobuild.buildroot.org/results/d1cac93407122bb5a6e2c13f49b542e1db619fb5

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/luvi/luvi.mk | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/luvi/luvi.mk b/package/luvi/luvi.mk
index 4a8072dee5..a8e645fab3 100644
--- a/package/luvi/luvi.mk
+++ b/package/luvi/luvi.mk
@@ -32,14 +32,15 @@ endif
 
 # LUAJIT_VERSION and the luajit installation path may not use the
 # same value. Use the value from luajit.pc file.
-LUVI_LUAJIT_VERSION = `$(PKG_CONFIG_HOST_BINARY) --variable=version luajit`
+LUVI_LUAJIT_MAJVER = `$(PKG_CONFIG_HOST_BINARY) --variable=majver luajit`
+LUVI_LUAJIT_MINVER = `$(PKG_CONFIG_HOST_BINARY) --variable=minver luajit`
 
 # Bundled lua bindings have to be linked statically into the luvi executable
 LUVI_CONF_OPTS = \
 	-DBUILD_SHARED_LIBS=OFF \
 	-DWithSharedLibluv=ON \
 	-DTARGET_ARCH=$(LUVI_TARGET_ARCH) \
-	-DLUA_PATH=$(HOST_DIR)/share/luajit-$(LUVI_LUAJIT_VERSION)/?.lua
+	-DLUA_PATH=$(HOST_DIR)/share/luajit-$(LUVI_LUAJIT_MAJVER).$(LUVI_LUAJIT_MINVER)/?.lua
 
 # Add "rex" module (PCRE via bundled lrexlib)
 ifeq ($(BR2_PACKAGE_PCRE),y)
-- 
2.40.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
