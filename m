Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFD40C76195
	for <buildroot@archiver.kernel.org>; Mon, 27 Mar 2023 14:11:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CAB924175B;
	Mon, 27 Mar 2023 14:11:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CAB924175B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id svIjONua_8uQ; Mon, 27 Mar 2023 14:11:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id BE03740964;
	Mon, 27 Mar 2023 14:11:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BE03740964
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0C6701BF31A
 for <buildroot@lists.busybox.net>; Mon, 27 Mar 2023 14:11:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DA4E440327
 for <buildroot@lists.busybox.net>; Mon, 27 Mar 2023 14:11:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DA4E440327
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QKUP1yHpHT8i for <buildroot@lists.busybox.net>;
 Mon, 27 Mar 2023 14:11:10 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0BC59400C6
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0BC59400C6
 for <buildroot@buildroot.org>; Mon, 27 Mar 2023 14:11:09 +0000 (UTC)
Received: by mail-ed1-x52b.google.com with SMTP id w9so36842256edc.3
 for <buildroot@buildroot.org>; Mon, 27 Mar 2023 07:11:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679926267;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=DHWeFpIH5IR5YZtuAojyzmsMBv+GAfJo/16kBK8azEU=;
 b=qyzQu5RR8Kmc7UyBrrkFu4dJf7Cn+2ywoKqhOP7pGs96EPnXd25Oe7umL3wE1iR0TJ
 EsGUKzJCU4TOPUugL2dgGPvnmKDDz68xOfpM1W5PwEFuP9/UWiRuEJwbLEm1lmzQw+3/
 6oKQUN9vQId3o+mYfrmi6ao3jF66dQp9MuZUTV8KK48oL1hvCSBORTFn+igVtvs8jTg5
 5e9dCOaqzmkCvmcldWnuSoN1xHbreP487wxzBrDKxTgOqJK1zI7ASOnGuO7YT6qBXKat
 1/hWcT7ZxEwFntmdV9toLZM8pdrKi3tTfTvZpMVCsh0vGib8WO1/0S8DwMbdCaM0tmfm
 wNNg==
X-Gm-Message-State: AAQBX9cSezfonBcsaWLSZCp4SL4JWaY99lNYp1JERubWZk6T8ZzKu6jp
 SqnUhOElxTuGnMCiGCZY6qWn82mdYwk/xWsd
X-Google-Smtp-Source: AKy350bE/8Dg8cSw/cwNE9LSFgZdz0R23Yl724TGx1jvJ+0eHDeeDct05eyhonRO396rFE/S6T5V9Q==
X-Received: by 2002:aa7:da57:0:b0:4fb:80cf:89e6 with SMTP id
 w23-20020aa7da57000000b004fb80cf89e6mr13027329eds.8.1679926267430; 
 Mon, 27 Mar 2023 07:11:07 -0700 (PDT)
Received: from localhost.localdomain
 ([2a02:a03f:eb68:2f00:22fc:f856:23e6:784b])
 by smtp.gmail.com with ESMTPSA id
 u2-20020a50a402000000b004c4eed3fe20sm14824386edb.5.2023.03.27.07.11.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Mar 2023 07:11:07 -0700 (PDT)
From: Thomas Devoogdt <thomas@devoogdt.com>
X-Google-Original-From: Thomas Devoogdt <thomas.devoogdt@barco.com>
To: buildroot@buildroot.org
Date: Mon, 27 Mar 2023 16:10:56 +0200
Message-Id: <20230327141058.3669326-2-thomas.devoogdt@barco.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230327141058.3669326-1-thomas.devoogdt@barco.com>
References: <20230327141058.3669326-1-thomas.devoogdt@barco.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1679926267;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DHWeFpIH5IR5YZtuAojyzmsMBv+GAfJo/16kBK8azEU=;
 b=j2Xs5JoXFPm6uMr6MEkKLO78EYBaVtx6Qecd6LDlJSH6oX1g/KIAojvHmXzWGevAim
 NNLIIR8RLZeqii6NrBdNa+nocQOWYC8YCpawo0PiwfNmrdU1HMtDO8dv3D78CUxs579b
 JyjQnsKuUUOfJ4tp7dTq+VlNwkDBwoDK4nPf5BKtIsdg2I6Ay5Li9CdNfXk8UFBLX4lz
 nHpO7H99J3OaATtW82ELHd/2l495IqLTJasvXVFYqHC2rSkEzEvA/I7dJCn5JfEzxLBq
 Cvq34hSJYqHXTlw5q9rL0SqJzh2BH7c3fCXhoUGPZP3I95gQ7gzlLAg1W4v7PGbg1fRv
 YPsQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=j2Xs5JoX
Subject: [Buildroot] [PATCH 2/4] package/fluent-bit: fix luajit support
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
Cc: Thomas Devoogdt <thomas.devoogdt@barco.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fluent-bit doesn't link against any libraries,
it just compiles everything as static sources,
meaning that our buildroot BR2_PACKAGE_LUAJIT isn't
the right check.

The same -m32 fix as in the luajit package can't be done,
since fluent-bit uses a custom cmake wrapper. So just check if the
host and the target have the same number of bits.

My intention here is to fix upstream build errors,
not perse to have luajit support in fluent-bit.

Signed-off-by: Thomas Devoogdt <thomas.devoogdt@barco.com>
---
 package/fluent-bit/Config.in     | 17 +++++++++++++++++
 package/fluent-bit/fluent-bit.mk |  8 ++++++--
 2 files changed, 23 insertions(+), 2 deletions(-)

diff --git a/package/fluent-bit/Config.in b/package/fluent-bit/Config.in
index bfdea895b0..91fdf02134 100644
--- a/package/fluent-bit/Config.in
+++ b/package/fluent-bit/Config.in
@@ -13,6 +13,23 @@ config BR2_PACKAGE_FLUENT_BIT
 
 if BR2_PACKAGE_FLUENT_BIT
 
+config BR2_PACKAGE_FLUENT_BIT_LUAJIT_ARCH_SUPPORTS
+	bool
+	default y if BR2_arm || BR2_aarch64 || BR2_aarch64_be
+	default y if BR2_i386 || BR2_x86_64
+	default y if (BR2_mips || BR2_mipsel) && !BR2_MIPS_SOFT_FLOAT \
+		&& !BR2_MIPS_CPU_MIPS32R6 && !BR2_MIPS_CPU_MIPS64R6
+	default y if BR2_powerpc
+	# Building for 64-bit target requires a 64-bit host, the same for 32-bit.
+	depends on (BR2_ARCH_IS_64 && BR2_HOSTARCH = "x86_64") \
+		|| (!BR2_ARCH_IS_64 && BR2_HOSTARCH = "x86")
+
+config BR2_PACKAGE_FLUENT_BIT_LUAJIT
+	bool "lua scripting support"
+	depends on BR2_PACKAGE_FLUENT_BIT_LUAJIT_ARCH_SUPPORTS
+	help
+	  Support for Lua Scripting.
+
 config BR2_PACKAGE_FLUENT_BIT_WASM_ARCH_SUPPORTS
 	bool
 	# see lib/wasm-micro-runtime-WAMR-1.1.1/README.md#supported-architectures-and-platforms
diff --git a/package/fluent-bit/fluent-bit.mk b/package/fluent-bit/fluent-bit.mk
index 319815f056..335c16a295 100644
--- a/package/fluent-bit/fluent-bit.mk
+++ b/package/fluent-bit/fluent-bit.mk
@@ -28,9 +28,13 @@ else
 FLUENT_BIT_CONF_OPTS += -DFLB_WASM=No
 endif
 
-ifeq ($(BR2_PACKAGE_LUAJIT),y)
+ifeq ($(BR2_PACKAGE_FLUENT_BIT_LUAJIT),y)
 FLUENT_BIT_CONF_OPTS += -DFLB_LUAJIT=Yes
-FLUENT_BIT_DEPENDENCIES += luajit
+ifeq ($(BR2_ARCH_IS_64),y)
+FLUENT_BIT_CONF_OPTS += -DLUAJIT_DISABLE_GC64=No
+else
+FLUENT_BIT_CONF_OPTS += -DLUAJIT_DISABLE_GC64=Yes
+endif
 else
 FLUENT_BIT_CONF_OPTS += -DFLB_LUAJIT=No
 endif
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
