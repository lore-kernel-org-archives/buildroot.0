Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29B43C3DA79
	for <buildroot@archiver.kernel.org>; Mon, 15 Jan 2024 21:14:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BA52783D3D;
	Mon, 15 Jan 2024 21:14:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BA52783D3D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Rpoua6rPGJzJ; Mon, 15 Jan 2024 21:14:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 16B1A83D3A;
	Mon, 15 Jan 2024 21:14:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 16B1A83D3A
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2F90D1BF383
 for <buildroot@lists.busybox.net>; Mon, 15 Jan 2024 21:14:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 084EE42C7D
 for <buildroot@lists.busybox.net>; Mon, 15 Jan 2024 21:14:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 084EE42C7D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EEg1zpNZeQXY for <buildroot@lists.busybox.net>;
 Mon, 15 Jan 2024 21:14:36 +0000 (UTC)
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1485B42C68
 for <buildroot@buildroot.org>; Mon, 15 Jan 2024 21:14:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1485B42C68
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-40e7662621dso15967235e9.2
 for <buildroot@buildroot.org>; Mon, 15 Jan 2024 13:14:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705353273; x=1705958073;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=CNYf9djBqifyPDKjJeHds99gCQa7XawczV0SXF+mjBw=;
 b=Mrja6KcZM8VKU4n/spNgzh5FsrThSZlSA9hTXnJm5widXh9PK4BXqPQKhueh64f5ck
 kNzrLXyC3FQdk+lT4Q1LzbUhbt4gEoY3Vsda0V5whEmExXBbDTNU7VlfAx8a9tqIL3Kz
 VmjoRh1pLC7jubuJqjgMXXVGTAP8MGgAp0jG6migQNnNPnJzjlaaoW1qMEFivww6xXZP
 RFZ9asnBumpUS4Ep2SgN4EfzLwfrntE5+l4HURrboe6uCS9V05BMQZAKedwYGbJTRG7b
 MoFIUORLRK9kb+6gMejvnTYbAhVtZRPXjCgEjAc5jK9Iyk8wSkp2PrVmI2Nep1vOuReq
 Dd7g==
X-Gm-Message-State: AOJu0YycDQ58e9Xrn5rf5VvPRlqvD2FEqYHmJsZzttqvQHYfByMvJy7E
 the7/y9+lqP9yz8cEhx+KXMaNWZv7X0=
X-Google-Smtp-Source: AGHT+IHzfgs1MqlAnzBfu1kJkmt9BgGf+wpuabh73WrhZwFLUV1O/xhQ9TIk30n76fpy7OQL9HLa5g==
X-Received: by 2002:a05:600c:8607:b0:40e:46d9:cb60 with SMTP id
 ha7-20020a05600c860700b0040e46d9cb60mr2830445wmb.62.1705353272764; 
 Mon, 15 Jan 2024 13:14:32 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 p31-20020a05600c1d9f00b0040e6ea6d2d0sm1228202wms.24.2024.01.15.13.14.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Jan 2024 13:14:32 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 15 Jan 2024 22:14:27 +0100
Message-ID: <20240115211427.4291-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1705353273; x=1705958073; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=CNYf9djBqifyPDKjJeHds99gCQa7XawczV0SXF+mjBw=;
 b=lpVYpEoc4O+9vhi46/IodIoWklNGtFT2ONR0tY/9nIUB0qmAPkUH4ysk/ZybSy1UbI
 lTf3HOKo0U8td8l+/aRrywluISmgMCHecIwKRJjJIFKzcu/OyK/jpdL3vbiul8OUxBcQ
 0hZEmvpyxdXaB0Ad81Wjpskx4i0zh8zQLTbFnH2nZRT1PxM6GO5pAMmb0OwUOVJF/Mf4
 cLGLaxyABCQLKccqti2g+/eej4l4B2LYbknfVBjBNAZZPfLh9/qI40zH6kMZ4vbPkCHk
 91iq+mw8IQu7zvJR6PCp8YMdKx1Na4SdPffjE78qlGuCGrMe1iUxclFCtHTEx0ADjdkD
 eizg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=lpVYpEoc
Subject: [Buildroot] [PATCH 1/1] package/leptonica: affected by gcc bug
 101737
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
Cc: Gilles Talis <gilles.talis@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

leptonica is affected by gcc bug 101737 resulting in the following build
failure since at least bump to version 1.82.0 in commit
81a961c545cc9f240841b75d6c21f13b334bc274:

sh4eb-buildroot-linux-gnu-gcc.br_real: internal compiler error: Segmentation fault signal terminated program cc1
Please submit a full bug report, with preprocessed source (by using -freport-bug).
See <http://bugs.buildroot.net/> for instructions.

Fixes:
 - http://autobuild.buildroot.org/results/f18979454399d9c728f9e017e4cc3a1b27458f5b
 - http://autobuild.buildroot.org/results/f3c803892175b3bb2ce68e3140c879b4a4d4b302

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/leptonica/leptonica.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/leptonica/leptonica.mk b/package/leptonica/leptonica.mk
index 8eedf2fda9..4cb73296e8 100644
--- a/package/leptonica/leptonica.mk
+++ b/package/leptonica/leptonica.mk
@@ -14,6 +14,10 @@ LEPTONICA_DEPENDENCIES = host-pkgconf
 
 LEPTONICA_CONF_OPTS += --disable-programs
 
+ifeq ($(BR2_TOOLCHAIN_HAS_GCC_BUG_101737),y)
+LEPTONICA_CONF_OPTS += CFLAGS="$(TARGET_CFLAGS) -O0"
+endif
+
 ifeq ($(BR2_PACKAGE_GIFLIB),y)
 LEPTONICA_DEPENDENCIES += giflib
 LEPTONICA_CONF_OPTS += --with-giflib
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
