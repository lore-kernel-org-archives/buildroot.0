Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA1B0C43334
	for <buildroot@archiver.kernel.org>; Mon, 25 Jul 2022 15:23:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8DD7B416ED;
	Mon, 25 Jul 2022 15:23:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8DD7B416ED
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eqIA02cgFECV; Mon, 25 Jul 2022 15:23:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 76D1340C4D;
	Mon, 25 Jul 2022 15:23:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 76D1340C4D
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1CD581BF2BD
 for <buildroot@lists.busybox.net>; Mon, 25 Jul 2022 15:22:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E99ED41A08
 for <buildroot@lists.busybox.net>; Mon, 25 Jul 2022 15:22:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E99ED41A08
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8CY-JR2KUHQk for <buildroot@lists.busybox.net>;
 Mon, 25 Jul 2022 15:22:35 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DC9D4419F5
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DC9D4419F5
 for <buildroot@buildroot.org>; Mon, 25 Jul 2022 15:22:34 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id bn9so5585062wrb.9
 for <buildroot@buildroot.org>; Mon, 25 Jul 2022 08:22:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GRwXaWWGm6jwhb2/twP8BiulE/qAO9PCdLj3wL1b6zo=;
 b=dW/cdEUr1iE3OYFAFROdJUbFPIP20oIoC57WgiFeXPUYSc+3l8mGxCV2LpXku4KDz1
 039rV8nDXNrplG1ijp+kbUsoW9hXgqc6aT8/bvGoRMLnklqdYcEw+VsTceIsKYYruzUO
 B9ktD43nx9ZyN00NRTKsqRoz68apJa7l4mOgc4+PPFJ9PJ7k7EmXSkXcYpFPDyiITp4A
 7qXqwOXjZmy0cDkRXWffJmkHFZj4n5zEDReSczABmUrfh0t5pSbhcWwGuQs2IZnMQssd
 rDa2ANcRn3ppEhrcCb/uLx/oguQO94lTCCNxt8nrfJHi/Nf56Q+2y/wcOaxsPtXHs+Jh
 FgFA==
X-Gm-Message-State: AJIora9TVSfeswwm0RUiYgTlzzmm8eTN4DTht2sot4ltUkFrtnDPgoIT
 mh0A2Fu+YfzQRv8gpaX75t2PHGrQjDAsWw==
X-Google-Smtp-Source: AGRyM1tL/eNOHtwAxcD2rI+S1bOTXE9l+69ihcUu3tIdZbovlKlFf1G3bY6xiLJk547n8PF4Xql87Q==
X-Received: by 2002:a5d:5581:0:b0:20f:fc51:7754 with SMTP id
 i1-20020a5d5581000000b0020ffc517754mr8366723wrv.413.1658762553140; 
 Mon, 25 Jul 2022 08:22:33 -0700 (PDT)
Received: from arnoutx1.home ([2a01:cb19:8acf:5600:3b0f:2669:24db:51d0])
 by smtp.gmail.com with ESMTPSA id
 o8-20020a05600c378800b003a2e7c13a3asm14244983wmr.42.2022.07.25.08.22.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Jul 2022 08:22:32 -0700 (PDT)
From: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>
To: buildroot@buildroot.org
Date: Mon, 25 Jul 2022 17:22:28 +0200
Message-Id: <20220725152229.3370033-4-arnout@mind.be>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220725152229.3370033-1-arnout@mind.be>
References: <20220725152229.3370033-1-arnout@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GRwXaWWGm6jwhb2/twP8BiulE/qAO9PCdLj3wL1b6zo=;
 b=INtGKXOdY69r9CCwv+DHNQNJLgAlh5pdb3du3oiXSJlu2iwpHjkmBKMlDiKu+hV7MQ
 9/UjhJZowAakWzWZUuLCvly20d/el6dJiFQtMsc68sXV9J6lz8K1m6nuCwcBC50zPiGC
 5eGM7012cEstizE4BTz+NdKRSOeOjnLvyrjYPVVVyA2Xw1zm/174wsNuUjTK+ONF4z2L
 gTjUHqiUd9piT1pIUvUY21jVTURD+DCr5JCNq2fqvKr68MTZe2bKShyUsrX1R0FGQEQZ
 guWeug6RDCZaDedJyfBIAHg4Wx3nlXP4cLYW8PUSCVtq6Rg5+UtgsEfNyvJK8F0N+gQd
 cUcA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=INtGKXOd
Subject: [Buildroot] [PATCH 4/5] package/binutils: remove
 BR2_BINUTILS_ENABLE_LTO
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
Cc: =?UTF-8?q?Peter=20K=C3=BCmmel?= <syntheticpp@gmx.net>,
 Douglas RAILLARD <public.douglas.raillard@gmail.com>,
 Dario Binacchi <dariobin@libero.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Currently, this option doesn't do anything. It only adds
--enable-plugins --enable-lto to the configure flags, but doesn't
disable them if it is not set. Since both of these default to enabled,
plugins and lto are effectively always enabled.

There really is no need to make this configurable: it adds a bit of size
and build time to host-binutils, but we don't care about that for host
tools. It's still up to individual builds to enable the LTO options.

Therefore, remove the option entirely. For clarity, explicitly pass
--enable-plugins --enable-lto to configure.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/binutils/Config.in.host | 3 ---
 package/binutils/binutils.mk    | 6 ++----
 package/gcc/Config.in.host      | 1 -
 3 files changed, 2 insertions(+), 8 deletions(-)

diff --git a/package/binutils/Config.in.host b/package/binutils/Config.in.host
index ef1b2a94db..5bdda25faf 100644
--- a/package/binutils/Config.in.host
+++ b/package/binutils/Config.in.host
@@ -35,9 +35,6 @@ config BR2_BINUTILS_VERSION
 	default "2.37"		if BR2_BINUTILS_VERSION_2_37_X
 	default "2.38"		if BR2_BINUTILS_VERSION_2_38_X
 
-config BR2_BINUTILS_ENABLE_LTO
-	bool
-
 config BR2_BINUTILS_EXTRA_CONFIG_OPTIONS
 	string "Additional binutils options"
 	default ""
diff --git a/package/binutils/binutils.mk b/package/binutils/binutils.mk
index c94ebe0995..6362cb1641 100644
--- a/package/binutils/binutils.mk
+++ b/package/binutils/binutils.mk
@@ -86,6 +86,8 @@ HOST_BINUTILS_CONF_OPTS = \
 	--with-sysroot=$(STAGING_DIR) \
 	--enable-poison-system-directories \
 	--without-debuginfod \
+	--enable-plugins \
+	--enable-lto \
 	$(BINUTILS_DISABLE_GDB_CONF_OPTS) \
 	$(BINUTILS_EXTRA_CONFIG_OPTIONS)
 
@@ -120,10 +122,6 @@ HOST_BINUTILS_POST_EXTRACT_HOOKS += BINUTILS_XTENSA_OVERLAY_EXTRACT
 HOST_BINUTILS_EXTRA_DOWNLOADS += $(ARCH_XTENSA_OVERLAY_URL)
 endif
 
-ifeq ($(BR2_BINUTILS_ENABLE_LTO),y)
-HOST_BINUTILS_CONF_OPTS += --enable-plugins --enable-lto
-endif
-
 # Hardlinks between binaries in different directories cause a problem
 # with rpath fixup, so we de-hardlink those binaries, and replace them
 # with copies instead.
diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
index a7e237c3f7..20187db6fd 100644
--- a/package/gcc/Config.in.host
+++ b/package/gcc/Config.in.host
@@ -132,7 +132,6 @@ config BR2_TOOLCHAIN_BUILDROOT_DLANG
 
 config BR2_GCC_ENABLE_LTO
 	bool "Enable compiler link-time-optimization support"
-	select BR2_BINUTILS_ENABLE_LTO
 	help
 	  This option enables link-time optimization (LTO) support in
 	  gcc.
-- 
2.35.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
