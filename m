Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E107FCD6E5D
	for <buildroot@archiver.kernel.org>; Tue,  2 Jun 2026 21:30:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 840CF41FC2;
	Tue,  2 Jun 2026 21:30:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DijncDx1thi3; Tue,  2 Jun 2026 21:30:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 19F8A41FB8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780435856;
	bh=QDd0xE7XlpYLYs7dbZqFdet145tpCv9OETYrlAujLt4=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=hSGBbKbCwDpy2ORqw+EdK2Jbi89fD4Ig+2/XqJeL8VaztD/rs+6l+Kl3lWPXeCjDH
	 CSmIRpodDn8l4kCtUgX8JSwwi+nYclVxcgZCxSGPVGomoIJeAlFDeJHGHHj+h1DVLU
	 OKbEBMUQP/He6d6uoDg+q1SBmvyNzMge2xcuUCKLFy7wpkg3Fz7hPurBOIv3zSXrxB
	 xxh9rom7YqLTJ2dVJ+W5/myyayPT6gTNl3FtNObwWQQsp7VYWjgW2ALZgUdjoccFb0
	 uuYXIcWiol0GwMlGp/x7cNsUaEJkn+XZUDaOON3YG63WBy3ZUF6bY3jO4jquiYnTd2
	 k1rCM06bCKotQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 19F8A41FB8;
	Tue,  2 Jun 2026 21:30:56 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 2FADA381
 for <buildroot@buildroot.org>; Tue,  2 Jun 2026 21:30:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 161A7613A6
 for <buildroot@buildroot.org>; Tue,  2 Jun 2026 21:30:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ix0px0VO9U5x for <buildroot@buildroot.org>;
 Tue,  2 Jun 2026 21:30:53 +0000 (UTC)
Received-SPF: None (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::f2c; helo=mail-qv1-xf2c.google.com;
 envelope-from=ben.wolsieffer@hefring.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org AA02C613A5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AA02C613A5
Received: from mail-qv1-xf2c.google.com (mail-qv1-xf2c.google.com
 [IPv6:2607:f8b0:4864:20::f2c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id AA02C613A5
 for <buildroot@buildroot.org>; Tue,  2 Jun 2026 21:30:52 +0000 (UTC)
Received: by mail-qv1-xf2c.google.com with SMTP id
 6a1803df08f44-8ce9df31840so24127826d6.1
 for <buildroot@buildroot.org>; Tue, 02 Jun 2026 14:30:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780435851; x=1781040651;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mPobqlyozrMxVhi1Gjh2Kc1e+AvSgVJTo797MxGnqN8=;
 b=EFIY2Jj9WSW0hoJErNXcGQmL46bjaBVMQLrffDjteN6PgcFo6QYzA2XoQ0OAs3hsQL
 uNej5sQ3W2JfBwUrkJcuMUO401q60iGeafHzMdI5+yjQ/JNl3yu6J+I/YlsbTp+c1qJ9
 I4wWGNei/gBpP2pARZGAVHRSEqQ5RtEpC04gT2IpkObw1Ls3NkCmioCRZ3yNcvY0DVjO
 CGLO3yAR5i6cVaBuHxx7CZ+jPPp5KI1rXOkYLtjqBIFK9lrzKMr8uyosTpDBMXXxIfUe
 1Vy/YiG6Oymwdu34SncfLgHSG/jlmxlEQqiYXILRyh4GO8lDGNOhbEarifRuL8kfvSJG
 LmRQ==
X-Gm-Message-State: AOJu0YwrZANvibfVIeffR7KaHBdCgIl+89F2VluR3TEu1+s3TY/UV93R
 AQ9glsakarq3iYlcKNYlGssirIu9ZOSyY3kx28dncSi4TqTaxG1csIVCDTBj6Vit5W72SRG+8X9
 neq7x
X-Gm-Gg: Acq92OE9h4DPzjRscb1D6AlBn2W+dJ0XhUZTI4xblJ6CTIUKVkBu4SonGtZ5j1IB9le
 atQzal5wWmgRP3daBIxutR6fFHS6x9nDyMz12ybdnf7BDvU0l51UmYN/vKnZf+OSYWFeLWGHa3D
 A955k8O8tbOj62PB/Koj2NZIQf2DbnFOljWn76dHeLdfNJxODQzDycEL5Bse0TeSRVobobqr8LS
 crFCdYGL2KLz1c77/j6hpuRVXYRS6uIccPxz5vuaEG5wpsriSi33fofFrNQRqHDtH1g6qIuFmLd
 pgFR/ETuanfajnRAGjzlaQhdTgVsShaDcCebPTQq6LIk5o/L9bqxN0ELkHs/uT3uvYLZcdQm5go
 KmesF8iWoH6+W4cuabKMnf21fPDP4tJTD8PTWNPtrGA96lnzeyFECJSb6LntTX8DBh62uKAIGjn
 U1DZNZ1oosQiWRhRWWTZGssNOhGGx9
X-Received: by 2002:a05:6214:c4b:b0:8cc:f3e0:87fd with SMTP id
 6a1803df08f44-8cecdbfc768mr6373776d6.8.1780435842763; 
 Tue, 02 Jun 2026 14:30:42 -0700 (PDT)
Received: from dell-xps-15-9500 ([2601:18c:8002:3d41::5])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-8cecd07629dsm2791596d6.39.2026.06.02.14.30.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Jun 2026 14:30:42 -0700 (PDT)
From: Ben Wolsieffer <ben.wolsieffer@hefring.com>
To: buildroot@buildroot.org
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Ben Wolsieffer <ben.wolsieffer@hefring.com>
Date: Tue,  2 Jun 2026 17:29:48 -0400
Message-ID: <20260602212947.3669877-2-ben.wolsieffer@hefring.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=hefring-com.20251104.gappssmtp.com; s=20251104; t=1780435851; x=1781040651;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=mPobqlyozrMxVhi1Gjh2Kc1e+AvSgVJTo797MxGnqN8=;
 b=sK/a5K6cm1CjfSVQeXFsTRmft+3KkbdkqdPi0gUzDcfxT8Iw+t8svp3aPyZV8BeRP6
 FVZ+cn9Cj8OjDHTeikQBgkIo/BoN1HR7fbGVjH2mIRoajAoLE5kRKXlq9UaWRdWEGkxt
 abmT9o8UCJR970WT2aJ5kzjoDRZ+gqzq43V5r9xQ4jhEpMg+zytKqes91oFLYMCs0rHx
 TlpwUgRAjIFBn6FN5y7RHO2BEKxG779NWHDEDOZhWgaepxXFaMj4I3CScNWwy1qifzP8
 WJvIdNeKBV5e7B1OhRUCJYe0PHEmufASxR8ct5LDsEoXdZZ95OE79dtMxwItrquBCAYS
 8uCw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=hefring.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=hefring-com.20251104.gappssmtp.com
 header.i=@hefring-com.20251104.gappssmtp.com header.a=rsa-sha256
 header.s=20251104 header.b=sK/a5K6c
Subject: [Buildroot] [PATCH] package/pkg-meson.mk: pass debug and
 optimization options
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

Instead of passing the 'buildtype' option controlled by
BR2_ENABLE_RUNTIME_DEBUG (which shouldn't be used to control
optimization or debug symbols), pass the separate 'debug' and
'optimization' options, controlled by BR2_ENABLE_DEBUG and
BR2_OPTIMIZE_* respectively. This gives finer control of the build
settings and makes Meson packages match the optimization of the rest of
the system.

Signed-off-by: Ben Wolsieffer <ben.wolsieffer@hefring.com>
---
 package/pkg-meson.mk | 20 +++++++++++++++++++-
 1 file changed, 19 insertions(+), 1 deletion(-)

diff --git a/package/pkg-meson.mk b/package/pkg-meson.mk
index f2efbae2eb..8cc6955979 100644
--- a/package/pkg-meson.mk
+++ b/package/pkg-meson.mk
@@ -90,6 +90,23 @@ else ifeq ($(BR2_SHARED_STATIC_LIBS),y)
 PKG_MESON_DEFAULT_LIBRARY=both
 endif
 
+ifeq ($(BR2_OPTIMIZE_0),y)
+PKG_MESON_OPTIMIZATION = 0
+else ifeq ($(BR2_OPTIMIZE_1),y)
+PKG_MESON_OPTIMIZATION = 1
+else ifeq ($(BR2_OPTIMIZE_2),y)
+PKG_MESON_OPTIMIZATION = 2
+else ifeq ($(BR2_OPTIMIZE_3),y)
+PKG_MESON_OPTIMIZATION = 3
+else ifeq ($(BR2_OPTIMIZE_G),y)
+PKG_MESON_OPTIMIZATION = g
+else ifeq ($(BR2_OPTIMIZE_S),y)
+PKG_MESON_OPTIMIZATION = s
+else ifeq ($(BR2_OPTIMIZE_FAST),y)
+# Closest approximation supported by Meson
+PKG_MESON_OPTIMIZATION = 3
+endif
+
 # Generates sed patterns for patching the cross-compilation.conf template,
 # since Flags might contain commas the arguments are passed indirectly by
 # variable name (stripped to deal with whitespaces).
@@ -161,8 +178,9 @@ define $(2)_CONFIGURE_CMDS
 		--prefix=/usr \
 		--libdir=lib \
 		--default-library=$(PKG_MESON_DEFAULT_LIBRARY) \
-		--buildtype=$(if $(BR2_ENABLE_RUNTIME_DEBUG),debug,release) \
 		--cross-file=$$($$(PKG)_SRCDIR)/buildroot-build/cross-compilation.conf \
+		-Ddebug=$(if $(BR2_ENABLE_DEBUG),true,false) \
+		-Doptimization=$(PKG_MESON_OPTIMIZATION) \
 		-Db_pie=false \
 		-Db_staticpic=$(if $(BR2_m68k_cf),false,true) \
 		-Dstrip=false \
-- 
2.54.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
