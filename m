Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 338C0CD11C2
	for <buildroot@archiver.kernel.org>; Sun,  7 Apr 2024 14:35:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EEC2E60A3F;
	Sun,  7 Apr 2024 14:35:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wr37pPC3YozZ; Sun,  7 Apr 2024 14:35:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0406960A41
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0406960A41;
	Sun,  7 Apr 2024 14:35:47 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 74BD11BF30F
 for <buildroot@lists.busybox.net>; Sun,  7 Apr 2024 14:35:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 61ADB81E81
 for <buildroot@lists.busybox.net>; Sun,  7 Apr 2024 14:35:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VKJ2erGYRqtE for <buildroot@lists.busybox.net>;
 Sun,  7 Apr 2024 14:35:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::434; helo=mail-wr1-x434.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 4037F81E7F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4037F81E7F
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4037F81E7F
 for <buildroot@buildroot.org>; Sun,  7 Apr 2024 14:35:40 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-34339f01cd2so2729354f8f.2
 for <buildroot@buildroot.org>; Sun, 07 Apr 2024 07:35:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712500538; x=1713105338;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=c6mBdSu4EfLXAzK8qjD/Y7jU6GomwJQh0g89p5ldlbM=;
 b=qduDvRH3Vn05lDIDO4fIRDeyEu+Cy8uV0xLjQ7oH+NkTDbRplM6BDMuB32mXDuOEMQ
 e6lTYDORzpmSFfc5ByVihFKFLY59XCuITLGoUi+dVxkVuLOoIFfTQkdxutsDfOU6Tn/3
 x4BPUYkshFbf3WbvXEQGCYjxSgx/oP+u9Q+w1O/yQxbBmhVCyPRmr/sWw/TDGBu/vlXY
 jN8/p1ufsePB6jcZXAIslo15ddoK1PqNAoBQ4Bavw6QAV13oxGKN4t2M14e7Hrj+ipu/
 /KpQji7PFoUm8fFoEnI1eBQDQuGYKgou3rrjOv2vUNG43poJSAdcCYcCV9VKsbPY/rJm
 dYXg==
X-Gm-Message-State: AOJu0YyR2GZ2rpIQgtMK9GM+4VJ+oiVvhWhpbnlf62yPwiTJ8VP2tqJj
 R8chiMtfwY+cNPpYgQTVJvbM8s/SLzCmvLLpqc64zoQFrBDBJwiCHcVX5jtM
X-Google-Smtp-Source: AGHT+IG+1nBSND67B8JHLCVBhy9V7kGh24P/jVmwiR3yP5mjzy2T0tkLPUZCpDqKhh1RXOe5skO6ng==
X-Received: by 2002:adf:a4db:0:b0:343:3e5b:e8af with SMTP id
 h27-20020adfa4db000000b003433e5be8afmr5545456wrb.52.1712500537811; 
 Sun, 07 Apr 2024 07:35:37 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 t8-20020a05600c450800b004147db8a91asm13683174wmo.40.2024.04.07.07.35.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Apr 2024 07:35:37 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  7 Apr 2024 16:35:34 +0200
Message-ID: <20240407143534.1888458-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1712500538; x=1713105338; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=c6mBdSu4EfLXAzK8qjD/Y7jU6GomwJQh0g89p5ldlbM=;
 b=VumhPZ5fkZgwq8wsV452k4WLoGWfNFxTfFLGRCvq6zaFoCIv/W+u/GLptduuUabevH
 N019iqC+1h6jNhc/VpTecqBAOORe0V/ZYi6QcRmqPz9CIip9fWzTXsFsA7RcMaBk6lpf
 LvI+5KFA5uxr4Bbc9i1qGRZwDWxYHrpTJhNrZH5rCaCbx4F8wQLXNgDpmwzZGn+u79Kl
 VT8T4GES2/Lm71FpvNvohtFZylPen76eKLQIndxihH1Vzb/+VLErAqqvkFg11RyrM2id
 akq8vfxEzFZy59KKEZqjKdSEVrkC7TH4WHXplEt1PJDaUoFaozTxqH3jrxKQ8xgJp34t
 GXHA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=VumhPZ5f
Subject: [Buildroot] [PATCH 1/1] package/cups: add libxcrypt optional
 dependency
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
Cc: Olivier Schonken <olivier.schonken@gmail.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following build failure raised since bump of glibc to version
2.39 in commit b5680f53d60acf8ff6010082f873438a39bd5d97:

/home/buildroot/autobuild/run/instance-1/output-1/host/lib/gcc/arc-buildroot-linux-gnu/13.1.1/../../../../arc-buildroot-linux-gnu/bin/ld: auth.o: in function `cupsdAuthorize':
auth.c:(.text+0xdba): undefined reference to `crypt'

Fixes: b5680f53d60acf8ff6010082f873438a39bd5d97
 - http://autobuild.buildroot.org/results/39b72d4e14895f901590d7e3404f69b4573d2cd2

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/cups/Config.in | 1 +
 package/cups/cups.mk   | 1 +
 2 files changed, 2 insertions(+)

diff --git a/package/cups/Config.in b/package/cups/Config.in
index 51cf10b073..ad852c0998 100644
--- a/package/cups/Config.in
+++ b/package/cups/Config.in
@@ -6,6 +6,7 @@ config BR2_PACKAGE_CUPS
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	# needs fork()
 	depends on BR2_USE_MMU
+	select BR2_PACKAGE_LIBXCRYPT if BR2_TOOLCHAIN_USES_GLIBC
 	help
 	  The Common Unix Printing System
 
diff --git a/package/cups/cups.mk b/package/cups/cups.mk
index 91fad30b38..dc66ee3e1c 100644
--- a/package/cups/cups.mk
+++ b/package/cups/cups.mk
@@ -32,6 +32,7 @@ CUPS_CONFIG_SCRIPTS = cups-config
 CUPS_DEPENDENCIES = \
 	host-autoconf \
 	host-pkgconf \
+	$(if $(BR2_PACKAGE_LIBXCRYPT),libxcrypt)
 	$(if $(BR2_PACKAGE_ZLIB),zlib)
 
 ifeq ($(BR2_PACKAGE_SYSTEMD),y)
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
