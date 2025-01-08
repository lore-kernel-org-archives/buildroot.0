Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C49E0E7719A
	for <buildroot@archiver.kernel.org>; Wed,  8 Jan 2025 23:06:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2B1F880F8B;
	Wed,  8 Jan 2025 23:06:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id w5rNYg_fFlYg; Wed,  8 Jan 2025 23:06:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2AE1480DEA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2AE1480DEA;
	Wed,  8 Jan 2025 23:05:56 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 351281FF9
 for <buildroot@buildroot.org>; Wed,  8 Jan 2025 23:05:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D6CA14026A
 for <buildroot@buildroot.org>; Wed,  8 Jan 2025 23:05:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GeLQFnNaNhZN for <buildroot@buildroot.org>;
 Wed,  8 Jan 2025 23:05:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42c; helo=mail-wr1-x42c.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 9FE4340595
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9FE4340595
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9FE4340595
 for <buildroot@buildroot.org>; Wed,  8 Jan 2025 23:05:33 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-38637614567so161279f8f.3
 for <buildroot@buildroot.org>; Wed, 08 Jan 2025 15:05:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736377531; x=1736982331;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZR0xTbO9lpDNEPrGaM9bt8C+wVenQ6PEVvqYInBHmYI=;
 b=XwbAAGpe5WHGXlF3cnykN74AqY2v7caDNqpzLjUxNbYcU5B52bTSrbvjoa9/g7OU83
 pD2LfjzSLCR2KnY/7zo8iJFDOjf0Rj61Gl1wyd7LnJ7l7A1T6hXbu6n6a24Kz0ZAT+us
 8xNMe5SNm4Bi/orE4OmoV4SNQWLiYN9lYakHHEZYpgEc4v6ZeQ1XDF9JMSZVRWmV360E
 hRlmGKkO2DkGG+zvhbKsAyPDdvQxUL3FdRhGqynemTfM4BDxPLcSkmQ15agJ5zrzbSBK
 G1tJos1ThTYbKkA2k9yFZZ42iIRN4YZGY4xWkJbv93aUgnxLx1yIsH3W/gL/EeeW6xbn
 xBvg==
X-Gm-Message-State: AOJu0YxiaNFBOKqZj2siOA4f0sr5tfqOLMd4KJJr80g91gKqADcIAGRc
 ATrn/gnBXzoyw4x0kqfPmpG6FB3RP1CT7T2rSdstDuMtcBLTFzWJUR2DAZE93W2hUWhtDKXR0jg
 w
X-Gm-Gg: ASbGncsP7JqI5paZr/9tQFWLmukSodWS/8iHedH0dVSA0Vf//fDQEXDQeaGVaL9A30K
 quC0yoRQhAP9TbvnN0wyemEi4hz5+9e86lxN+saD6en5o67jenBUWI2W1c6ld0lexwksnX6ezj+
 QotjOfcAKxh8BKXzLAauAYR2VGwR/BwgMdlHvYbPNG1VX7/M0kykLnfNvCJcB/uOrKq2lFTaYof
 DTDh+5ds3FFr6DSzcEnJZKD36/fGSzOp8FiIk8oIO3pSk8uDIUuVqyot64/Bucr0jU1EAFKtftL
 BF8NbivHCHBh65WgHLwgFhZiQTH26jnFacTRoElXMW1CCpVFosPTJg==
X-Google-Smtp-Source: AGHT+IHx8lWfyI+uLlwdx8VUSB+XBUYA+VFBHUvfua3xovLQRaIpzL7rdtsonfG9E+KnwMfazE9iOg==
X-Received: by 2002:a05:6000:18ac:b0:385:ef39:6cd5 with SMTP id
 ffacd0b85a97d-38a872f6ed5mr4026938f8f.1.1736377531650; 
 Wed, 08 Jan 2025 15:05:31 -0800 (PST)
Received: from P-NTS-Evian.home
 (2a01cb05949d5800e3ef2d7a4131071f.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:e3ef:2d7a:4131:71f])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-436e9e03ffcsm1059745e9.20.2025.01.08.15.05.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Jan 2025 15:05:31 -0800 (PST)
To: buildroot@buildroot.org
Cc: Romain Naour <romain.naour@smile.fr>
Date: Thu,  9 Jan 2025 00:05:19 +0100
Message-ID: <20250108230521.1345210-10-romain.naour@smile.fr>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250108230521.1345210-1-romain.naour@smile.fr>
References: <20250108230521.1345210-1-romain.naour@smile.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1736377531; x=1736982331; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZR0xTbO9lpDNEPrGaM9bt8C+wVenQ6PEVvqYInBHmYI=;
 b=Kc5CaBMNlMcD+XwcBreKf6ehi//OKO4lC6oUdFqIlU3I0VSd1aQLcpybf1VIT6/AMx
 1sSuzWtlGVuuNhaWyXz2ceMKemQnkY0+sPA1S5YZQhe/nJSJahl/V/y9l//mf4i0wSUv
 e1WNeX8JUD9e09KxVw7BD6MZaJzvpfI5RThqQ=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=smile.fr header.i=@smile.fr
 header.a=rsa-sha256 header.s=google header.b=Kc5CaBMN
Subject: [Buildroot] [PATCH 10/12] toolchain: remove
 BR2_TOOLCHAIN_HAS_GCC_BUG_99410 (nios2 only)
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
From: Romain Naour via buildroot <buildroot@buildroot.org>
Reply-To: Romain Naour <romain.naour@smile.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 package/belle-sip/belle-sip.mk |  4 ----
 package/matio/matio.mk         |  4 ----
 toolchain/Config.in            | 10 ----------
 3 files changed, 18 deletions(-)

diff --git a/package/belle-sip/belle-sip.mk b/package/belle-sip/belle-sip.mk
index c9bcc3f55d..b4de3612ce 100644
--- a/package/belle-sip/belle-sip.mk
+++ b/package/belle-sip/belle-sip.mk
@@ -35,10 +35,6 @@ endif
 
 BELLE_SIP_CFLAGS = $(TARGET_CFLAGS)
 
-ifeq ($(BR2_TOOLCHAIN_HAS_GCC_BUG_99410),y)
-BELLE_SIP_CFLAGS += -O0
-endif
-
 BELLE_SIP_CONF_OPTS += -DCMAKE_C_FLAGS="$(BELLE_SIP_CFLAGS)"
 
 $(eval $(cmake-package))
diff --git a/package/matio/matio.mk b/package/matio/matio.mk
index dc9be2ac18..d378f06e5b 100644
--- a/package/matio/matio.mk
+++ b/package/matio/matio.mk
@@ -19,10 +19,6 @@ MATIO_CONF_ENV = ac_cv_va_copy=yes
 
 MATIO_CFLAGS = $(TARGET_CFLAGS)
 
-ifeq ($(BR2_TOOLCHAIN_HAS_GCC_BUG_99410),y)
-MATIO_CFLAGS += -O0
-endif
-
 MATIO_CONF_ENV += CFLAGS="$(MATIO_CFLAGS)"
 
 # mat73 require hdf5 (not available), extented-sparse take 2KB
diff --git a/toolchain/Config.in b/toolchain/Config.in
index 23123138e5..86ab3710a0 100644
--- a/toolchain/Config.in
+++ b/toolchain/Config.in
@@ -180,16 +180,6 @@ config BR2_TOOLCHAIN_HAS_GCC_BUG_90620
 	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_10 \
 		|| BR2_TOOLCHAIN_GCC_AT_LEAST_11
 
-# https://gcc.gnu.org/bugzilla/show_bug.cgi?id=99410
-# Error: branch offset out of range on Nios II. This bug
-# no longer exists in gcc 8.x but reappeared on gcc 9.x and still exists
-# on gcc 12.x
-config BR2_TOOLCHAIN_HAS_GCC_BUG_99410
-	bool
-	default y if !BR2_TOOLCHAIN_GCC_AT_LEAST_8
-	default y if BR2_TOOLCHAIN_GCC_AT_LEAST_9
-	depends on BR2_nios2
-
 # https://gcc.gnu.org/bugzilla/show_bug.cgi?id=101737
 # ICE: SH4 -Os causes internal compiler error. This bug
 # still exists in gcc = 11.1.0
-- 
2.47.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
