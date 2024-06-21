Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 251E9C2BB85
	for <buildroot@archiver.kernel.org>; Fri, 21 Jun 2024 16:11:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E48C844FD4;
	Fri, 21 Jun 2024 16:11:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XFUjW0qm_JMT; Fri, 21 Jun 2024 16:11:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 802EA45790
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 802EA45790;
	Fri, 21 Jun 2024 16:11:13 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E21CF1BF232
 for <buildroot@lists.busybox.net>; Fri, 21 Jun 2024 16:11:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C7C68447DA
 for <buildroot@lists.busybox.net>; Fri, 21 Jun 2024 16:11:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ai4ixjmn4yEg for <buildroot@lists.busybox.net>;
 Fri, 21 Jun 2024 16:11:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::336; helo=mail-wm1-x336.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org A6B9344302
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A6B9344302
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A6B9344302
 for <buildroot@buildroot.org>; Fri, 21 Jun 2024 16:11:03 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-4217990f997so16305725e9.2
 for <buildroot@buildroot.org>; Fri, 21 Jun 2024 09:11:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718986261; x=1719591061;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YxFTjSSVVkl6uVq6y288w8V2d0WpSTocs+6nszxElsw=;
 b=VyBtzB7s7MI5L1kEW41/L1hJc5xD8x4erb8sFjbk66uIDM5M/cRcvzDmuc6+bWD3Pk
 ieLZFpAYLxh8b/kMriSRieBsYhoUGgXC47ZSJwMtItxBdaf4Fri1MY1aLufTdkjQ3VMX
 nj9yRo75Mpb91e3bNUft7As7yi+ljGsoIjdhiyePddrcJHF1YEAt+f5AJh/bnu60PqWv
 tNdhtYYAUyZGJDhIYRW/rYtQzEpWRv4Lm7OMfmmdw9Tta5Hh8qM0BkBgQHXeaBcG1CC3
 iFIpXRT9nLRNN3YxaHGYe2ytk7YDgndZyj8lr6+ZWaFTvjACwdJJFBskTFLqynve14pd
 +z1A==
X-Gm-Message-State: AOJu0YxMogxQx87HPrzXmwH2Vjc/tX2QwbjjdQJZyhgxPpwvxkPzpMjm
 +u8d0GqjRpzdv68SjQW5jvqwCKI9BF/QKwKVRixhXdeQVJD4oqjrOor6yaIFkw85u5LkbbHMg6M
 n
X-Google-Smtp-Source: AGHT+IFXZbA5izdzWOtgfxqDzzbS25iZ3qRLlJSlM48kYhqff0hoZ0Vz6iWDhZjQG/Tra/w2wdotng==
X-Received: by 2002:a05:6000:ecd:b0:362:c971:d983 with SMTP id
 ffacd0b85a97d-363195b19ddmr6086202f8f.48.1718986261592; 
 Fri, 21 Jun 2024 09:11:01 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.amarulasolutions.com ([2.196.43.112])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-366389b8922sm2185522f8f.28.2024.06.21.09.11.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Jun 2024 09:11:01 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Fri, 21 Jun 2024 18:10:47 +0200
Message-ID: <20240621161049.4085310-4-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240621161049.4085310-1-dario.binacchi@amarulasolutions.com>
References: <20240621161049.4085310-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1718986261; x=1719591061;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YxFTjSSVVkl6uVq6y288w8V2d0WpSTocs+6nszxElsw=;
 b=TspxyEuL1RekEUioVGf3wcEpeRHBpM1dFI0bGJnPDTG9UDqgPShVn0EvRRncGjj/+W
 KIcEiID74tMCupY6E7aBznWKCAmG/gSq0yKr+pA77zK/Q2Lud9SPuwd8vkbiPRrtnaBV
 XVMeOuI9tsDvmQraB8Rq2emqLMfVDrJE8CaT4=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=TspxyEuL
Subject: [Buildroot] [PATCH 4/6] package/libopenssl: use `no-apps'
 configuration option
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
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

With version 3.2.0 of OpenSSL, the "no-apps" configuration option was
added, which does not build apps, e.g. the openssl program. This is
handy for minimization. This option also disables tests.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 package/libopenssl/libopenssl.mk | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/package/libopenssl/libopenssl.mk b/package/libopenssl/libopenssl.mk
index ed36fb593dde..fe472e2c7a19 100644
--- a/package/libopenssl/libopenssl.mk
+++ b/package/libopenssl/libopenssl.mk
@@ -84,6 +84,7 @@ define LIBOPENSSL_CONFIGURE_CMDS
 			no-fuzz-libfuzzer \
 			no-fuzz-afl \
 			no-afalgeng \
+			$(if $(BR2_PACKAGE_LIBOPENSSL_BIN),,no-apps) \
 			$(if $(BR2_PACKAGE_LIBOPENSSL_ENABLE_CHACHA),,no-chacha) \
 			$(if $(BR2_PACKAGE_LIBOPENSSL_ENABLE_RC2),,no-rc2) \
 			$(if $(BR2_PACKAGE_LIBOPENSSL_ENABLE_RC4),,no-rc4) \
@@ -156,14 +157,6 @@ endef
 LIBOPENSSL_POST_INSTALL_TARGET_HOOKS += LIBOPENSSL_REMOVE_PERL_SCRIPTS
 endif
 
-ifeq ($(BR2_PACKAGE_LIBOPENSSL_BIN),)
-define LIBOPENSSL_REMOVE_BIN
-	$(RM) -f $(TARGET_DIR)/usr/bin/openssl
-	$(RM) -f $(TARGET_DIR)/etc/ssl/misc/{CA.*,c_*}
-endef
-LIBOPENSSL_POST_INSTALL_TARGET_HOOKS += LIBOPENSSL_REMOVE_BIN
-endif
-
 ifeq ($(BR2_PACKAGE_LIBOPENSSL_ENGINES),)
 define LIBOPENSSL_REMOVE_LIBOPENSSL_ENGINES
 	$(RM) -rf $(TARGET_DIR)/usr/lib/engines-3
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
