Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35617C5516D
	for <buildroot@archiver.kernel.org>; Thu, 30 Jul 2026 20:01:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DF2D840645;
	Thu, 30 Jul 2026 20:01:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id q8HyoiaWTBtu; Thu, 30 Jul 2026 20:01:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 18EFD40657
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1785441689;
	bh=4bkWaA83/TjRT6EhpqwIl2XDcHlijc6l5Mpdfie13rI=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=iGQp1zVkS7oKl/cdeb+2Mvo0Tlnx93FD8D2avV6+BO4mIDta1fLHoviGZX0p+5Bk9
	 w57NJiwVET8iI+BGASZrDy9WYtMmZbOpG2ahvJy20l0DAodtctG7fUH7IQE+rlCCN2
	 kFuee4wiE5xdlTZkQLH8wXW9b5P6m2tZZYTh66fJ0oE/OB2T104LwKQxVuPnSzELE5
	 b7gh4JVr360bYnCKqvXV69+AVW8XgWejOykqA7/n4Kz++flkR1tJ1f0X0kheg5OzSQ
	 VrWwVAYrgNaIic7LQxnujeBak+7U3ruuFIbw281PKEtEDqWI4cbxynRZXfhys7QT3m
	 vXtivuzd1b72w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 18EFD40657;
	Thu, 30 Jul 2026 20:01:29 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 6FB6E197
 for <buildroot@buildroot.org>; Thu, 30 Jul 2026 20:01:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 614C080E5B
 for <buildroot@buildroot.org>; Thu, 30 Jul 2026 20:01:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2FAn51DFkYi7 for <buildroot@buildroot.org>;
 Thu, 30 Jul 2026 20:01:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42d; helo=mail-wr1-x42d.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 90B9180E35
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 90B9180E35
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 90B9180E35
 for <buildroot@buildroot.org>; Thu, 30 Jul 2026 20:01:26 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-47c6e9a694bso55994f8f.1
 for <buildroot@buildroot.org>; Thu, 30 Jul 2026 13:01:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1785441684; x=1786046484;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=SN3QOojJ2KDZno0yhpGXwO//AZz6KDEQiugnTH8y/os=;
 b=s6sJBYRHrhVvVgodL8jnqXXXnCpGfGlTBWf9CHCBLUiivDqdCS2YLBf9ZVvvmOlZIu
 aQcIkeLAcml3Wh4l61CyqPFK+raJolN5wlhqsJIO0bTfeookDSDCh9v8O9zcNALY0mex
 K65s/EIK/DNbEUtWp3ywA6ptg5TUYVVFC5a5sqfpAIUgMeGRAnG+3i8yG90o8u2YtDFg
 fNsWGUzwN4Woz80iKxrvMD0qWYMN4jyAfMSlSyTAZcHX/dpk34s18XMqC9VviytINDjT
 +hMc4CI1a7PMQFFtc0P51prkDt6OnGJveooBhlTfF1o51StUIG0yUQq3J+iojodACz/f
 vK8w==
X-Gm-Message-State: AOJu0YwBSHtpn/zIz0OlGZHIOVcV758tunbz1sBen1wU0upxZque0QXB
 ehqfKLZxANUPicw+sqMaopb7HstSuOCOStCONEfsCG4e0DEWDLtbQKZeP5jqXZNTR1MTEhZOgvy
 wz/+f
X-Gm-Gg: AR+sD10cwSrnY2SQrCDTpJEWVIQmctZnGQ3MyR865F8fyT5y8LtPxp2aEtgdyt8H951
 XMjMn6m4uvjU6NLyOfcn/Fcn7/nhlUJvzuD+R/sOCmLu0exkBTdOCA3iEB7DPZZbgOanpujOlX3
 xSomnH0qHLMxyUyljjuSfeTUAasmeiIvYJQz/ufmW/6CjlUYWXL8qrmHHOLCrFDb3zE8CCJr4H6
 6+q003749u3vQO+ojq6/saFCL/dvBD/GTbsEmJsBjiYJYT/haboAltMvH0wbbG3zciU/Vidg+mG
 dCbbPgffKq8fghdSmvIsEJdUcwkLq17Nvl7tTCJBf/angwHLmo2ffHTJ2wy2F1TmVtHedNdKlST
 eFJp7cikoA7YC8MmGl+PTNzpO9m216Dw+dnZuENO37jFqompYfQ746ZQpDKa7pcELbnVWujk8LY
 U0n7HsAtAl12OpvXviuyab1idojgkIm5+RrU/mKGoLPhAi4mr03RVDIKBjJQdHb9dQHjCL6UgwN
 2VXY4DGLOf08u+I8uZnCGtSMlkktR2wAn/TpushIQqUZnt1OGIf22aY1bUhNozDsV1GetHUydT5
 1DEQ2m6J01Ymrtb4PD+4YT88MP82Ty3HXAMlfpQaTYZLlvBqzwNceLnAgS5imfaX
X-Received: by 2002:a5d:64ee:0:b0:47f:b452:49f1 with SMTP id
 ffacd0b85a97d-47fc80c0e26mr6113179f8f.2.1785441684458; 
 Thu, 30 Jul 2026 13:01:24 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it
 (host-79-17-119-233.retail.telecomitalia.it. [79.17.119.233])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47fc892cc3asm9639387f8f.23.2026.07.30.13.01.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Jul 2026 13:01:23 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Julien Olivain <ju.o@free.fr>, linux-amarula@amarulasolutions.com
Date: Thu, 30 Jul 2026 22:01:16 +0200
Message-ID: <20260730200118.3547779-2-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260730200118.3547779-1-dario.binacchi@amarulasolutions.com>
References: <20260730200118.3547779-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1785441684; x=1786046484;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=SN3QOojJ2KDZno0yhpGXwO//AZz6KDEQiugnTH8y/os=;
 b=Rm6ONPzT40HhIhbunkg3kh4A2n/bQbwSTs5dnXzjCjK96mi5jyqJx38lD4sg4Cmknk
 Kqe8n9UMwnr4U3AnAK2q+bGGAKrr29NC7gxNZQOQAK89spPTiuS5xAWalYTf+jeGJ4IH
 36Xxm/v8zomDLSreLFh1JZ2cT66Ii5IqTBqE8=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=Rm6ONPzT
Subject: [Buildroot] [PATCH 1/3] package/openblas: fix build on mips64 n32
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

BR2_ARCH_IS_64 is set for mips64/mips64el even when the n32 ABI is
used, so openblas was built with BINARY=64. Its build system then
passes -mabi=64, which conflicts with the n32 sysroot:

  gnu/stubs.h:35:11: fatal error: gnu/stubs-n64_hard.h: No such file
  or directory

For openblas, BINARY refers to the pointer size rather than to the
architecture, and n32 uses 32-bit pointers, so BINARY=32 is correct
there.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 package/openblas/openblas.mk | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/openblas/openblas.mk b/package/openblas/openblas.mk
index 9a3bb42496ab..a5bf68f69913 100644
--- a/package/openblas/openblas.mk
+++ b/package/openblas/openblas.mk
@@ -49,7 +49,9 @@ ifeq ($(BR2_STATIC_LIBS),y)
 OPENBLAS_MAKE_OPTS += NO_SHARED=1
 endif
 
-ifeq ($(BR2_ARCH_IS_64),y)
+# mips64 n32 is a 64-bit architecture, but with 32-bit pointers, so
+# openblas must be built with BINARY=32
+ifeq ($(BR2_ARCH_IS_64)$(BR2_MIPS_NABI32),y)
 OPENBLAS_MAKE_OPTS += BINARY=64
 else
 OPENBLAS_MAKE_OPTS += BINARY=32
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
