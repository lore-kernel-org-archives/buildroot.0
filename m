Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4ADA3E77188
	for <buildroot@archiver.kernel.org>; Wed,  8 Jan 2025 09:00:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E56A340225;
	Wed,  8 Jan 2025 09:00:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tr-zw-vg0Mj3; Wed,  8 Jan 2025 09:00:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C96C140239
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C96C140239;
	Wed,  8 Jan 2025 09:00:25 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 5A18E1FF7
 for <buildroot@buildroot.org>; Wed,  8 Jan 2025 09:00:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 47B6780B16
 for <buildroot@buildroot.org>; Wed,  8 Jan 2025 09:00:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JGQPEUur5HXx for <buildroot@buildroot.org>;
 Wed,  8 Jan 2025 09:00:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::431; helo=mail-wr1-x431.google.com;
 envelope-from=francois.perrad@gadz.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 42C0280B0E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 42C0280B0E
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 42C0280B0E
 for <buildroot@busybox.net>; Wed,  8 Jan 2025 09:00:23 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-385e87b25f0so357371f8f.0
 for <buildroot@busybox.net>; Wed, 08 Jan 2025 01:00:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736326821; x=1736931621;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=dN8Ftvi2AxXTbKDesPlGOaHRb9uUvJxKE3gbv9nnn2I=;
 b=POg2DOInaZfbkIUhYn7Tt9aUR01W8MgcdJyuWgr0+kbP82/Wjt+XmRbKQyCJ8WaHsK
 IphloOa63t+xLzPXJlfhqUSMXXCeB+y3oh4T1tokb8IaAzw+F6FuluYai6cvBZmf5bow
 8EbpGD0c2CuQvX+PPgekIQeQq6odhdxXJl8526E1Dwb4VGVcDTYg9/oMUWQ5zfMAAUuf
 7WcnQJBGz1CJ+4IL+f2i0O0eMLVw40YXX3zEZg+3puW/cDm4qvPV2MDH0dmtTzlnL0Vi
 c4vnLPCVvmHmh2S94NLEiJcF80qJwkErMOKtqkY57w2930vHvFl3XJr70d2WTUiWaJxN
 g9Cg==
X-Gm-Message-State: AOJu0YysmB/VXzwFl9dZ0brcMLZPCZ9gr1O7pyfhXreDgLhaPS49eG7U
 NBcNz0XQu63LMTRvfLG1HX2JcRgEao7e5K3hayclKvKs2PODkE6Hu46zVsM9KWgV5y5QWxwihHg
 2dg==
X-Gm-Gg: ASbGncv8GV3h5qs5wzkgJcst1pX1+eA4VsHfV6tqlajH2//cf9RIT+G7VEQ0o8ew9Hj
 E3IazjfrAFz11bIvO2SKYNWUZkfU/6y5D+tkw278SyXV/ebG2Dts0EsoDO+HwRMdjOIdc5WpQHO
 TNjfaUn9wbkJBXMdCtYTa+9mM6rLLSmKAB2FkzTRLBvFIEHkoBLWS/cnBCwVRPAJMycRB0Dv2ij
 kV4Q+MC9tKgUo2/6p5NHPiMp7LYHFOZAw7yV1DK0551CibdB834gy1zibBaaWUx38VU42ysxKcK
 h3H3sOpPThDDCR8=
X-Google-Smtp-Source: AGHT+IFMGUxc3f+sdy7peJPOPGrCo1j1NiGMz+e3gOrO+x6AFOncE28RVsmhAdFni4URIAVut24z2A==
X-Received: by 2002:a05:6000:1541:b0:385:fa30:4f87 with SMTP id
 ffacd0b85a97d-38a85ddc5bemr2000412f8f.0.1736326821069; 
 Wed, 08 Jan 2025 01:00:21 -0800 (PST)
Received: from vm-2404.. (75.184.66.37.rev.sfr.net. [37.66.184.75])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38a47c9b2efsm32760265f8f.91.2025.01.08.01.00.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Jan 2025 01:00:20 -0800 (PST)
From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Wed,  8 Jan 2025 10:00:10 +0100
Message-ID: <20250108090011.2566873-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gadz.org; s=google; t=1736326821; x=1736931621; darn=busybox.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=dN8Ftvi2AxXTbKDesPlGOaHRb9uUvJxKE3gbv9nnn2I=;
 b=APkgEOp4n7IUZakGbYw/KbyrzSPNUMI/6ISM+B3Ho6zMxUz5zBThrIpdAl26F0v42N
 Tu5vBWrQf2Cdm3Jmf14ld0ThkDBsbTvpnW8UWIMdlrxVMbKaFpnW5eBZExQforQDd9sa
 JAIIYYAqb8vZM9TEH2Q04ul/fMh1hJ999K+yQyhetPUMAsyZ1xmppeDjidBlxO1AIoha
 ++YsRSGlp73OWMv7SpYW98sLZDAf0CIVEzBBCb5XbpyqBbhcmD3jAMbpkbA7LTzHcJ2C
 P5kiYlwxSSayDTFUbfiILASghHySUh40ip+9vmqcHk2YniZllDgrKj0RqWRROeoz/jZC
 FgXw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gadz.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gadz.org header.i=@gadz.org
 header.a=rsa-sha256 header.s=google header.b=APkgEOp4
Subject: [Buildroot] [PATCH] package/moarvm: bump to version 2024.12
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

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/moarvm/moarvm.hash | 2 +-
 package/moarvm/moarvm.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/moarvm/moarvm.hash b/package/moarvm/moarvm.hash
index 3b0e0d62b..301243d52 100644
--- a/package/moarvm/moarvm.hash
+++ b/package/moarvm/moarvm.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  24ecedd1220e215742cbfa9228797812f6f281ba87bf5dc58e8caac0c0d404d0  MoarVM-2024.06.tar.gz
+sha256  7f8ae605a19189ebb48a51bae486bacd32141326df8289509825bdb1bee3984c  MoarVM-2024.12.tar.gz
 sha256  c53c6b96081b0a5b9b2fb4d0133d55c20e5e00e4c127ade62f03434ee7b3d2de  Artistic2.txt
diff --git a/package/moarvm/moarvm.mk b/package/moarvm/moarvm.mk
index 125404074..c0dcc0a18 100644
--- a/package/moarvm/moarvm.mk
+++ b/package/moarvm/moarvm.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MOARVM_VERSION = 2024.06
+MOARVM_VERSION = 2024.12
 MOARVM_SITE = http://moarvm.com/releases
 MOARVM_SOURCE = MoarVM-$(MOARVM_VERSION).tar.gz
 MOARVM_LICENSE = Artistic-2.0
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
