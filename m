Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CBC8C4345F
	for <buildroot@archiver.kernel.org>; Sat, 20 Apr 2024 18:59:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1002A80C04;
	Sat, 20 Apr 2024 18:59:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2M_DZBh3oqOk; Sat, 20 Apr 2024 18:59:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 07E3581F69
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 07E3581F69;
	Sat, 20 Apr 2024 18:59:32 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 81AF11BF271
 for <buildroot@lists.busybox.net>; Sat, 20 Apr 2024 18:59:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6EB13600D4
 for <buildroot@lists.busybox.net>; Sat, 20 Apr 2024 18:59:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QVAaWsRLzVMp for <buildroot@lists.busybox.net>;
 Sat, 20 Apr 2024 18:59:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=209.85.221.52;
 helo=mail-wr1-f52.google.com; envelope-from=thomas.devoogdt@gmail.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org BCBBB6000A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BCBBB6000A
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
 [209.85.221.52])
 by smtp3.osuosl.org (Postfix) with ESMTPS id BCBBB6000A
 for <buildroot@buildroot.org>; Sat, 20 Apr 2024 18:59:05 +0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id
 ffacd0b85a97d-3465921600dso2703743f8f.3
 for <buildroot@buildroot.org>; Sat, 20 Apr 2024 11:59:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713639543; x=1714244343;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dOStzfBZNvMARMXQvoZhxO2GlIcvz5DsAtFd5DxQAEU=;
 b=SUTX8wUsowEShouVWBALvI9zL1DpzLsYZ3nw9u8rwB2HWPXzmzc02M+9Df7RjBVsDD
 A4ZtkGzmAeoFxIw6i93MA4rdUjD4TKHJ5F3mLnHlNbei1C8SEVFpGdceRymT94+MLPnX
 akWFXFxWxtM6k+/DO9qo1GgLTMMbdP3cnZEBG9jPHS0bYGOr4hR6eEtoDgC8oHqd3QEn
 jICvXefNsoiKPTacqiFBEV71upPjfmMWYMiHIh0jQDdChOKZchixAcHfgrhAh43vovTy
 rch1FCsGULqmNksRYyL+hhB9egUh64/aZ0d5Us9u5KUyVRBnGixdTIweKh0YytBZ5ESQ
 dzlA==
X-Gm-Message-State: AOJu0YzOQpJTjLupeTFKiSDmyRpXPRglNYFvIhUbNlgT+kzJKxFFjMVk
 exFDy4+UOrOHRWH14KJdjGeh1Ok7nGhRC7JOqxUd19sBnJkF6/FX5v0oWTT3
X-Google-Smtp-Source: AGHT+IGD+jk2x7RnE1q0IJeDF97lwGecsriyO25Sipha+f6qrD1fU1ujs530hRRGPa2Njjp4PYHllQ==
X-Received: by 2002:adf:f304:0:b0:34a:3e4a:7964 with SMTP id
 i4-20020adff304000000b0034a3e4a7964mr3415215wro.49.1713639543453; 
 Sat, 20 Apr 2024 11:59:03 -0700 (PDT)
Received: from localhost.localdomain ([2a02:a03f:eb68:2f00:2033:ef69:f14:1bd2])
 by smtp.gmail.com with ESMTPSA id
 cs7-20020a056000088700b00346cdf48262sm7573981wrb.2.2024.04.20.11.59.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 20 Apr 2024 11:59:02 -0700 (PDT)
From: Thomas Devoogdt <thomas@devoogdt.com>
To: buildroot@buildroot.org
Date: Sat, 20 Apr 2024 20:58:51 +0200
Message-Id: <20240420185853.4134260-6-thomas@devoogdt.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240420185853.4134260-1-thomas@devoogdt.com>
References: <20240420185853.4134260-1-thomas@devoogdt.com>
MIME-Version: 1.0
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=devoogdt.com
Subject: [Buildroot] [PATCH v1 6/8] package/at-spi2-core: fix reference to
 atomic
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
Cc: Joseph Kogut <joseph.kogut@gmail.com>,
 Thomas Devoogdt <thomas@devoogdt.com>,
 Aleksander Morgado <aleksander@aleksander.es>,
 Rahul Bedarkar <rahulbedarkar89@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

gthread-posix.c:(.text+0x137c): undefined reference to `__atomic_compare_exchange_4'
collect2: error: ld returned 1 exit status

Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>
---
 package/at-spi2-core/at-spi2-core.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/at-spi2-core/at-spi2-core.mk b/package/at-spi2-core/at-spi2-core.mk
index 828280de1a..43befa99f0 100644
--- a/package/at-spi2-core/at-spi2-core.mk
+++ b/package/at-spi2-core/at-spi2-core.mk
@@ -38,4 +38,9 @@ endif
 
 AT_SPI2_CORE_LDFLAGS = $(TARGET_LDFLAGS) $(TARGET_NLS_LIBS)
 
+# Uses __atomic_compare_exchange_4
+ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
+AT_SPI2_CORE_LDFLAGS += -latomic
+endif
+
 $(eval $(meson-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
