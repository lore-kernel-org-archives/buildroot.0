Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DEE5CF9C69
	for <buildroot@archiver.kernel.org>; Sun, 22 Sep 2024 09:23:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 594EF40677;
	Sun, 22 Sep 2024 09:23:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ObP65sPTzGFv; Sun, 22 Sep 2024 09:23:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5EE39406BC
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5EE39406BC;
	Sun, 22 Sep 2024 09:23:52 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0F2841BF4D6
 for <buildroot@lists.busybox.net>; Sun, 22 Sep 2024 09:23:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0B7F2606B8
 for <buildroot@lists.busybox.net>; Sun, 22 Sep 2024 09:23:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yM-oRIF_AipU for <buildroot@lists.busybox.net>;
 Sun, 22 Sep 2024 09:23:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62a; helo=mail-ej1-x62a.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 34F51606B1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 34F51606B1
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 34F51606B1
 for <buildroot@buildroot.org>; Sun, 22 Sep 2024 09:23:41 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-a8d64b27c45so606857966b.3
 for <buildroot@buildroot.org>; Sun, 22 Sep 2024 02:23:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726997020; x=1727601820;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ceODNqSm9hg37wywX8Ojzcv3XUtRabHbELIzd4cVhkI=;
 b=X7zjw5hfFjdEMl+jcd731AXrM2EiXa8+9QUtwWzuBTt3c7iCX6J/EaAKnL8pL352xM
 fcSEqqX7Zy83mHwu9APmteXmjJ8YHybGgOJzAczcQ/4cWukA+olw6imlAX4bV6WB7X7q
 J1RJyk2u6ndO2ePBB/agwHbe8DbDnTLTYIC5EOj5vNYLxpY+tXe9gk6IlGkfBdWq5Tvq
 gPB9HnWx+01lm0+PSpufvfEbcLJ4qgnZ6Vxfti6ov5sTTVKf7cHYI5Yf1lS0PdXqYx1t
 TjbuuwtwqV7W6Y8JtAT9qljs/QdxmykLioYSNYuixEUG2nJqLfLwkJYlZrEygmKCvEvG
 flqg==
X-Gm-Message-State: AOJu0YyGdbtHU0fNgFTbpZOfPjOTy/NyzmTw5QK6V4A0TgvVGUpBBxrT
 SxxpFFWBQbfAh3DmCYpyHphJXdDKdxE7KCM3kWWi3Ycx6ixojPCEznu6MLjOokMrjellotku2XO
 Mcmw=
X-Google-Smtp-Source: AGHT+IGM/ipWgaRkdzTlG3ahULVUGu5aOuPNi78kHI0UywFYsVfmHSVIA2Qhg4Plr/kj0LTbHPyHAg==
X-Received: by 2002:a17:907:e61a:b0:a8d:4d76:a77d with SMTP id
 a640c23a62f3a-a90d507b27fmr731415666b.37.1726997019798; 
 Sun, 22 Sep 2024 02:23:39 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-79-20-102-52.retail.telecomitalia.it. [79.20.102.52])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a90612b33fasm1065235866b.139.2024.09.22.02.23.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 22 Sep 2024 02:23:39 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Sun, 22 Sep 2024 11:23:08 +0200
Message-ID: <20240922092312.2061358-6-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240922092312.2061358-1-dario.binacchi@amarulasolutions.com>
References: <20240922092312.2061358-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1726997020; x=1727601820;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ceODNqSm9hg37wywX8Ojzcv3XUtRabHbELIzd4cVhkI=;
 b=Zpn+0wiyYpwBUtzK2UBS+2dVdph1r41SsWKuV57qWuAGkQlrtg5h4SE8y5gwEIQo4H
 B8Vu0LzzfaaGa6AkzAgINlmobR7ZRQWD5RGX/WgOgxDQf8h3Nh7QI62EvWGKaeQ/o9pq
 mr60sM2JQ/eVwr6Fdqq+z4JQ20umF/7cq8QUk=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=Zpn+0wiy
Subject: [Buildroot] [PATCH v2 5/9] boot/uboot: pass -mno-fdpic if FDPIC is
 enabled
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
Cc: Ben Wolsieffer <ben.wolsieffer@hefring.com>, yann.morin.1998@free.fr,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com, Romain Naour <romain.naour@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Ben Wolsieffer <ben.wolsieffer@hefring.com>

If the FDPIC ABI is enabled by default in the toolchain, it must be
explicitly disabled when building U-Boot.

Signed-off-by: Ben Wolsieffer <Ben.Wolsieffer@hefring.com>
Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
No changes since v1

 boot/uboot/uboot.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index ab534a8b3a20..d8faef648fad 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -172,6 +172,11 @@ UBOOT_MAKE_OPTS += \
 	HOSTLDFLAGS="$(HOST_LDFLAGS)" \
 	$(call qstrip,$(BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS))
 
+# Disable FDPIC if enabled by default in toolchain
+ifeq ($(BR2_BINFMT_FDPIC),y)
+UBOOT_MAKE_OPTS += KCFLAGS=-mno-fdpic
+endif
+
 ifeq ($(BR2_TARGET_UBOOT_NEEDS_ATF_BL31),y)
 UBOOT_DEPENDENCIES += arm-trusted-firmware
 ifeq ($(BR2_TARGET_UBOOT_NEEDS_ATF_BL31_ELF),y)
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
