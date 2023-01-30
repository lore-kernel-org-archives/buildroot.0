Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77DB0C54EAA
	for <buildroot@archiver.kernel.org>; Mon, 30 Jan 2023 12:20:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F1016417AD;
	Mon, 30 Jan 2023 12:20:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F1016417AD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DO_2jx6UVpAx; Mon, 30 Jan 2023 12:20:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 69593417AB;
	Mon, 30 Jan 2023 12:20:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 69593417AB
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3B8B91BF5A4
 for <buildroot@lists.busybox.net>; Mon, 30 Jan 2023 12:19:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 16F62408ED
 for <buildroot@lists.busybox.net>; Mon, 30 Jan 2023 12:19:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 16F62408ED
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0Ed88GHiwk4s for <buildroot@lists.busybox.net>;
 Mon, 30 Jan 2023 12:19:42 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 30740408B0
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
 [209.85.221.48])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 30740408B0
 for <buildroot@buildroot.org>; Mon, 30 Jan 2023 12:19:42 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id d14so10855537wrr.9
 for <buildroot@buildroot.org>; Mon, 30 Jan 2023 04:19:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ynL8qf889uILhZiHzaL76NNaSbRZF37aqv+1EdnmFoc=;
 b=ppgQrTCWXRnSw+2zMUl3cZi5Uomclqql4TInfe+1D4wYx9b7FsI8tbFBZ8YLpzncfS
 Zq0FevGk4HYGbVUk64qIQ1Q+jdtQgc31MHwPogUWqXmypDFbqL7WYPQQsLRVhs7/R2CV
 bsnjNqdK+Ob2gBGhwjS9ERONMUQzulw6YkXn2h3RslfSn42Iw7PLLoDv3ZtJCCa0OIZH
 /J86IW+vx2seZ4Wp7Nh9ofdX9lyapfBkudBNFdeWSpZDEjvGc7yRPlaxWM2uZ/EPKpYf
 LU0PfKo9YsqKV2OX0grtXjiU1cYpL7SHuCcNIDgg2hi16AjWeHvowqspKakhSV4iHJSg
 aRTA==
X-Gm-Message-State: AFqh2krxh6s2/9mXp2Ye6uHnaH2iOtTqeszwZ/8ydIcxX4rqbORMrWa1
 fW6kqH38g9f6m1wIV377fa2oJYSdBQy6gA==
X-Google-Smtp-Source: AMrXdXtBi/uAFLMeQHwXcB7qvwpNMm9LDsY/zIzFvy/vTi4MlyohMjFsSFuSOqj6WXrjzyFZc9obKA==
X-Received: by 2002:adf:da42:0:b0:2bf:1ec:a068 with SMTP id
 r2-20020adfda42000000b002bf01eca068mr31313024wrl.53.1675081179960; 
 Mon, 30 Jan 2023 04:19:39 -0800 (PST)
Received: from thomas-OptiPlex-7090.nmg.localnet (d528f5fc4.static.telenet.be.
 [82.143.95.196]) by smtp.gmail.com with ESMTPSA id
 v2-20020adfe282000000b002bdec340a1csm11618612wri.110.2023.01.30.04.19.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Jan 2023 04:19:39 -0800 (PST)
From: Thomas Devoogdt <thomas@devoogdt.com>
To: buildroot@buildroot.org
Date: Mon, 30 Jan 2023 13:19:30 +0100
Message-Id: <20230130121930.3472747-3-thomas@devoogdt.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230130121930.3472747-1-thomas@devoogdt.com>
References: <20230130121930.3472747-1-thomas@devoogdt.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v3 3/3] package/fluent-bit: needs arch support
 and C++ for wasm
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
Cc: Thomas Devoogdt <thomas.devoogdt@gmail.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Thomas Devoogdt <thomas.devoogdt@gmail.com>

See:
https://github.com/fluent/fluent-bit/tree/master/lib/wasm-micro-runtime-WAMR-1.1.1#supported-architectures-and-platforms

MIPS & RISCV32 are mentioned in the supported list,
but that seems to be wrong, so excluded those.

Fixes:
- http://autobuild.buildroot.org/results/dfb/dfb8f71d7e016cdfd3beb4b8196081898bd49ae2/build-end.log
- http://autobuild.buildroot.org/results/ecf/ecfe7b67af68cd7f397a50360900cd9a7afc830e/build-end.log

Signed-off-by: Thomas Devoogdt <thomas.devoogdt@gmail.com>
---
 package/fluent-bit/Config.in     | 15 +++++++++++++++
 package/fluent-bit/fluent-bit.mk |  6 ++++++
 2 files changed, 21 insertions(+)

diff --git a/package/fluent-bit/Config.in b/package/fluent-bit/Config.in
index 11ceb55d4f..50437cab60 100644
--- a/package/fluent-bit/Config.in
+++ b/package/fluent-bit/Config.in
@@ -10,3 +10,18 @@ config BR2_PACKAGE_FLUENT_BIT
 
 comment "fluent-bit needs a glibc toolchain"
 	depends on !BR2_TOOLCHAIN_USES_GLIBC
+
+if BR2_PACKAGE_FLUENT_BIT
+
+config BR2_PACKAGE_FLUENT_BIT_WASM
+	bool "Build with WASM runtime support"
+	depends on BR2_INSTALL_LIBSTDCPP
+	# see lib/wasm-micro-runtime-WAMR-1.1.1/README.md#supported-architectures-and-platforms
+	default y if BR2_arc
+	default y if BR2_arm || BR2_armeb
+	default y if BR2_aarch64 || BR2_aarch64_be
+	default y if BR2_i386 || BR2_x86_64
+	default y if BR2_RISCV_64
+	default y if BR2_xtensa
+
+endif
diff --git a/package/fluent-bit/fluent-bit.mk b/package/fluent-bit/fluent-bit.mk
index c84042a0fa..6e9a33e02e 100644
--- a/package/fluent-bit/fluent-bit.mk
+++ b/package/fluent-bit/fluent-bit.mk
@@ -17,6 +17,12 @@ FLUENT_BIT_CONF_OPTS += \
 	-DFLB_CHUNK_TRACE=No \
 	-DFLB_BACKTRACE=No
 
+ifeq ($(BR2_PACKAGE_FLUENT_BIT_WASM),y)
+FLUENT_BIT_CONF_OPTS += -DFLB_WASM=Yes
+else
+FLUENT_BIT_CONF_OPTS += -DFLB_WASM=No
+endif
+
 ifeq ($(BR2_PACKAGE_LUAJIT),y)
 FLUENT_BIT_CONF_OPTS += -DFLB_LUAJIT=Yes
 FLUENT_BIT_DEPENDENCIES += luajit
-- 
2.39.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
