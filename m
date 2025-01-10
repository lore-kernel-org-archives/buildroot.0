Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A827E7719C
	for <buildroot@archiver.kernel.org>; Fri, 10 Jan 2025 19:54:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 628CB40DB3;
	Fri, 10 Jan 2025 19:54:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jTC_vs4iLGU7; Fri, 10 Jan 2025 19:54:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 46CDD40B5B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 46CDD40B5B;
	Fri, 10 Jan 2025 19:54:16 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id C9B04942
 for <buildroot@buildroot.org>; Fri, 10 Jan 2025 19:54:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AAA0C40B47
 for <buildroot@buildroot.org>; Fri, 10 Jan 2025 19:54:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Lb6Su39LSUcZ for <buildroot@buildroot.org>;
 Fri, 10 Jan 2025 19:54:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::331; helo=mail-wm1-x331.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org AA401408BA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AA401408BA
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp4.osuosl.org (Postfix) with ESMTPS id AA401408BA
 for <buildroot@buildroot.org>; Fri, 10 Jan 2025 19:54:10 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-436637e8c8dso26071575e9.1
 for <buildroot@buildroot.org>; Fri, 10 Jan 2025 11:54:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736538849; x=1737143649;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lyadyqYeU2BGAr0Wlxumjhq63T6mOvKRwai2xF3OiOY=;
 b=Cuwgj99Wnba0OQFYJqCtXo1qDI++8sBMh2fZDWXW0SBqeSAnsWWRSAsMRvnPXnM3AL
 kEorNBrbEQwkk+pVg5KXyKwjZRxz/4ynOfQ2g4Y//+oRP2tSr0zNdjdOHW+aWSoQqWWe
 OuUn2GKe3055y+S0Fm0zZYPFwPcGcVrdU7PuSuUvQbE1soIbIoJRrD3yfeABwrIyC+08
 hmqyiU1G00ec8WIfXYlxfSRsayR5N0gOy6hILR+UKHB6Nr0VU27nDW4TwMZSQghgPsX9
 9YuVQn7Wzp2UEY7hfXtyZYCwLoWPLLvrhg9A6UnIJYzQ2N6xsFMpkGVDcnfLDXR0y9Fh
 XtGw==
X-Gm-Message-State: AOJu0YyW77OsUL75dJPw3X8AEoy8+48Fioq8XRCJkfPx7cPkgZxIcmT0
 Vwf8p3hI7fbc/vmquVR3HYJAQlJmdtx4RTaARjiTYZR6od8QTyPxW6/Y53XxjYgcbUNDIZCJX4S
 g
X-Gm-Gg: ASbGnct21kAgVbwopyohiKc6sM0BnKIhbISuldPVsLPX//69QwqO5702ZTF1FxahLnI
 1Uf5Z9zd9dx1y+iltcY+DAVjCuRHGaZ0/3q7IwCXuZlAQ4CCIMYFFjSlw4UebET4n/fB95Dbiea
 8mRLccBEGy1A3ha/R4qu6EChv2c0chDdq/7g/EIfdeX0f/GYh2y2mFYwikOinP4D5ZasDlOIQc/
 rsumU0sfo4NPMlTdjBxDzh+l3F83oK52Z0hgWmCKvOOSsuXDbB5faL6eZQSzNew71aG3izhy/US
 ZREXgMJbsBoTH2B6fu0YKH7b+EqdHu1dPoeE1/jkqWVFmRGXUY6A5A==
X-Google-Smtp-Source: AGHT+IFpMQUeVBME4yO+BaTtOxqbMLN3Ei9JbaSPW2/enMsXvpX4pPGN95+I0KW7CMO37QuapaPf5Q==
X-Received: by 2002:adf:a312:0:b0:38a:88bc:bae4 with SMTP id
 ffacd0b85a97d-38a88bcbb29mr6928533f8f.18.1736538848692; 
 Fri, 10 Jan 2025 11:54:08 -0800 (PST)
Received: from P-NTS-Evian.home
 (2a01cb05949d5800e3ef2d7a4131071f.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:e3ef:2d7a:4131:71f])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-436e2da66fcsm96439635e9.6.2025.01.10.11.54.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jan 2025 11:54:08 -0800 (PST)
To: buildroot@buildroot.org
Cc: Romain Naour <romain.naour@smile.fr>
Date: Fri, 10 Jan 2025 20:53:51 +0100
Message-ID: <20250110195359.3358022-4-romain.naour@smile.fr>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250110195359.3358022-1-romain.naour@smile.fr>
References: <20250110195359.3358022-1-romain.naour@smile.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1736538849; x=1737143649; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lyadyqYeU2BGAr0Wlxumjhq63T6mOvKRwai2xF3OiOY=;
 b=y5UtswcVKH59EVjnztUgphAawYfxeeXMhJFsy8qVKxFlRw0JRkiWsbFUkf4o2E9gU0
 Vio9Z1U99GbBJG9Ion+h203G1oK+nWM+RkCsFxn63Sw2Zv/FQTBTNwmlsgdZJGfdBj4a
 bJ9OJSllNwepe5tk2VV+fSfGvZDS+9qKnuJI0=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=smile.fr header.i=@smile.fr
 header.a=rsa-sha256 header.s=google header.b=y5UtswcV
Subject: [Buildroot] [PATCH v2 04/12] package/glibc: remove nios2 support
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

Doing so, we remove nios2 support from the internal toolchain backend.

Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 arch/Config.in          | 1 +
 package/glibc/Config.in | 1 -
 package/glibc/glibc.mk  | 4 ----
 3 files changed, 1 insertion(+), 5 deletions(-)

diff --git a/arch/Config.in b/arch/Config.in
index e57f4b2baa..7da2dc69e4 100644
--- a/arch/Config.in
+++ b/arch/Config.in
@@ -145,6 +145,7 @@ config BR2_mips64el
 
 config BR2_nios2
 	bool "Nios II"
+	select BR2_ARCH_HAS_NO_TOOLCHAIN_BUILDROOT
 	select BR2_USE_MMU
 	help
 	  Nios II is a soft core processor from Altera Corporation.
diff --git a/package/glibc/Config.in b/package/glibc/Config.in
index 6075d28874..d464b3def8 100644
--- a/package/glibc/Config.in
+++ b/package/glibc/Config.in
@@ -20,7 +20,6 @@ config BR2_PACKAGE_GLIBC_ARCH_SUPPORTS
 	default y if BR2_sparc64
 	default y if BR2_x86_64
 	default y if BR2_microblaze
-	default y if BR2_nios2
 	default y if BR2_arc && BR2_ARC_ATOMIC_EXT && !BR2_arc750d && !BR2_arc770d
 	depends on !BR2_POWERPC_CPU_HAS_SPE
 	depends on BR2_RISCV_ISA_RVA || !BR2_riscv
diff --git a/package/glibc/glibc.mk b/package/glibc/glibc.mk
index cee03a16fd..e026c18762 100644
--- a/package/glibc/glibc.mk
+++ b/package/glibc/glibc.mk
@@ -143,10 +143,6 @@ endif
 # Glibc nowadays can be build with optimization flags f.e. -Os
 
 GLIBC_CFLAGS = $(TARGET_OPTIMIZATION)
-# crash in qemu-system-nios2 with -Os
-ifeq ($(BR2_nios2),y)
-GLIBC_CFLAGS += -O2
-endif
 
 # glibc can't be built without optimization
 ifeq ($(BR2_OPTIMIZE_0),y)
-- 
2.47.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
