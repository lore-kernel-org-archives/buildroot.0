Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B52EBCF6497
	for <buildroot@archiver.kernel.org>; Sun, 29 Sep 2024 20:15:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4402A80FA7;
	Sun, 29 Sep 2024 20:15:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 24B2ZG_hQl9K; Sun, 29 Sep 2024 20:15:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6B1AC80FA1
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6B1AC80FA1;
	Sun, 29 Sep 2024 20:15:29 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4ACF41BF334
 for <buildroot@lists.busybox.net>; Sun, 29 Sep 2024 20:15:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 39386402AC
 for <buildroot@lists.busybox.net>; Sun, 29 Sep 2024 20:15:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ua-4ADWe6l_A for <buildroot@lists.busybox.net>;
 Sun, 29 Sep 2024 20:15:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::52f; helo=mail-ed1-x52f.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 1DD7D4014C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1DD7D4014C
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1DD7D4014C
 for <buildroot@buildroot.org>; Sun, 29 Sep 2024 20:15:15 +0000 (UTC)
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-5c8952f7f95so791947a12.0
 for <buildroot@buildroot.org>; Sun, 29 Sep 2024 13:15:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727640914; x=1728245714;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ceODNqSm9hg37wywX8Ojzcv3XUtRabHbELIzd4cVhkI=;
 b=M3l6ehiR1EsKS3FPkTX2qMgN3+cRH/jN/35UHuMUhigP76c+LB4FgEbg2lVvfNEaNo
 vk42RSIbdvG8DQnR1ejMtOR18dd3wz12/5Qvnx9ZcK29e25FZdVtzIZgzv+GidNuz7rr
 D2m6X39tVs/V0YqWcMnTrd/noGpDdUVsPy5MN5T6eMV/4P4pjFDQkyNysUrBZJ5zPfsU
 6kcXXBwGQIMJkp7leOAZcQ8EIgjAiIPilcGBqcFmwoFg8UornpHn0GE3gtA+5wS4loGn
 SZTE2PIfEOw8GomGf4AwrkqZHloFRbmBHTNbzslEAz1gjyPjlgmLsgId7tHBZ0KqvkOS
 8+HQ==
X-Gm-Message-State: AOJu0Yy1cdPsDa1SHaMJbOZwXOgOO6s5r5n+yJmP4gkvvFlK2vm0NVtO
 utMmcZtGfhSsi6zp9OzuHBeaNFg9ooIJupvDbyfOrRCRHGIaqLijP+J0V00BFWZHR8FAM5Gh1BZ
 oyXs=
X-Google-Smtp-Source: AGHT+IE5ryCg+nWkLAIlFMRrZv+TX9KfZV5+pHub130JQFLyulHo447Oy4h5ARIsoa+NXG4zTN2IdQ==
X-Received: by 2002:a05:6402:2109:b0:5be:f3ae:b9ce with SMTP id
 4fb4d7f45d1cf-5c88261a9a5mr8890540a12.27.1727640913912; 
 Sun, 29 Sep 2024 13:15:13 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-79-54-102-102.retail.telecomitalia.it. [79.54.102.102])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c88245fbd2sm3537870a12.42.2024.09.29.13.15.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Sep 2024 13:15:13 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Sun, 29 Sep 2024 22:14:55 +0200
Message-ID: <20240929201459.1761285-6-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240929201459.1761285-1-dario.binacchi@amarulasolutions.com>
References: <20240929201459.1761285-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1727640914; x=1728245714;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ceODNqSm9hg37wywX8Ojzcv3XUtRabHbELIzd4cVhkI=;
 b=JXNek2UMptdyMeKHSRpPFKEmvU5+xE7ROahUkS2xy4Amd8w4MgNeLZgUHRAtasYKmM
 9+K+FPHEDxZq83tptNo8xb9FpREn0Ri7F+U+CkblW2w5igHhmz64UjnW/S+lipfTV2+h
 ZAO4oAEEMRS/srz49JOMdhDoNeiydWv/63sG0=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=JXNek2UM
Subject: [Buildroot] [PATCH v3 5/9] boot/uboot: pass -mno-fdpic if FDPIC is
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
Cc: Ben Wolsieffer <Ben.Wolsieffer@hefring.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Romain Naour <romain.naour@gmail.com>
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
