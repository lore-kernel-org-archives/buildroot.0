Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC17FC3DA42
	for <buildroot@archiver.kernel.org>; Sat, 13 Jul 2024 09:37:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BD46C606C8;
	Sat, 13 Jul 2024 09:37:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vToVJFJx5uh5; Sat, 13 Jul 2024 09:37:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 93FB5606D5
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 93FB5606D5;
	Sat, 13 Jul 2024 09:37:32 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A06B11BF4D6
 for <buildroot@lists.busybox.net>; Sat, 13 Jul 2024 09:37:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8CAC4418CA
 for <buildroot@lists.busybox.net>; Sat, 13 Jul 2024 09:37:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2PejNqOlRyy4 for <buildroot@lists.busybox.net>;
 Sat, 13 Jul 2024 09:37:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::132; helo=mail-lf1-x132.google.com;
 envelope-from=antoine.coutant@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org C160941885
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C160941885
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C160941885
 for <buildroot@buildroot.org>; Sat, 13 Jul 2024 09:37:27 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-52e94eaf5efso3363517e87.2
 for <buildroot@buildroot.org>; Sat, 13 Jul 2024 02:37:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720863445; x=1721468245;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=l3je8fktQNaObUypiC9MbkVR/Dfn24FfNzzHZlUbcVM=;
 b=cEpp2Jc/Mg2KVKR7LH5bMaZhdLhTpqkc0F97bf+GruoWiWiCe6ZM3q6w5EMHbjbSVq
 LmLEhKfHh5vbGngM0sFfHclMc8dCGg1TgrC/XF0qF/n3z/1UzQHMXadY2uvwUlP2JRPd
 zJpjWi3bIqqTxTV4ZUM+mv07/LoD2LzvsHBkqekdA/7XCT9Pexkj6lnS2svu4ED1m1fn
 gw2NK9WH1N2YYiMgrjwBOYf/dCgBFuO0dv5xjKY7jU40+cr9IpBW6YFvz9vRbToR6yDu
 gDI9iPWP62wL5JlcawoiuiobzvGUH0ob7IRSSIvXQAk/KNksv5yPnUrTf4FU0dFy6o+/
 SEmg==
X-Gm-Message-State: AOJu0YyciYdfM3mccxSGV1sgP02cDnMdGbm+Kmj7Yv+m3B3iczxT/+RX
 Q25A2kk7OKsBkJCRZbT8sk6tGd9NTh3Lvz+LqX0S4EcOJBIN2X56EQ+yO2iz91z0Fy7NH7BrGRR
 k
X-Google-Smtp-Source: AGHT+IHu+w1lhTnA0l7h0YgfXu0lAsDuo3HjzjXwe5Bv6kr+Q5g9iSbKmFFJfcxwUWgLvZHmi277HQ==
X-Received: by 2002:ac2:58e8:0:b0:52e:9b87:233c with SMTP id
 2adb3069b0e04-52eb99a3116mr7116183e87.36.1720863445509; 
 Sat, 13 Jul 2024 02:37:25 -0700 (PDT)
Received: from antco-7390.home
 (2a01cb08994fdf00389d87faa24d1c32.ipv6.abo.wanadoo.fr.
 [2a01:cb08:994f:df00:389d:87fa:a24d:1c32])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4279f25abf0sm49065935e9.14.2024.07.13.02.37.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 13 Jul 2024 02:37:25 -0700 (PDT)
To: buildroot@buildroot.org
Date: Sat, 13 Jul 2024 11:36:54 +0200
Message-Id: <20240713093700.13981-2-antoine.coutant@smile.fr>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240713093700.13981-1-antoine.coutant@smile.fr>
References: <20240713093700.13981-1-antoine.coutant@smile.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1720863445; x=1721468245; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=l3je8fktQNaObUypiC9MbkVR/Dfn24FfNzzHZlUbcVM=;
 b=Ga46rPDbLvk2x2lvFexqSd03/iyPhi67uLavX4R8sCTIyD646aOu19v8zuG1cbiP2Z
 X7bPg/5XguaxvisTdSHUM798j/amkEBZDKToqE76ZCx+PSpTFtrvbSCzGPpkzXdl/7yd
 bCagM2iQdLP+4PLen1lq6WtJOoti+pGGDNdFQ=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=smile.fr header.i=@smile.fr
 header.a=rsa-sha256 header.s=google header.b=Ga46rPDb
Subject: [Buildroot] [PATCH 1/7] package/pkg-meson.mk: add rust
 cross-compiler support
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
From: Antoine Coutant via buildroot <buildroot@buildroot.org>
Reply-To: Antoine Coutant <antoine.coutant@smile.fr>
Cc: Antoine Coutant <antoine.coutant@smile.fr>, romain.naour@smile.fr,
 Sebastian Weyer <sebastian.weyer@smile.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Romain Naour <romain.naour@smile.fr>

This change is needed to be able to build target packages requiring
rust. If a package has rust in its project or in an add_language()
call in their meson.build file, meson will try to find a suitable
compiler for this language[1]. If the language is classified as
required but not found, it will abort the build.

It is necessary to specify rust and rust_ld separately in
support/misc/cross-compilation.conf.in. If you specify it in one line
just as "rust", it will generate the following warning:
    WARNING: Please do not put -C linker= in your compiler command,
    set rust_ld=command in your cross file or use the RUST_LD environment
    variable, otherwise meson will override your selection.

[1] https://mesonbuild.com/Reference-manual_functions.html#add_languages

Signed-off-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Sebastian Weyer <sebastian.weyer@smile.fr>
Signed-off-by: Antoine Coutant <antoine.coutant@smile.fr>
---
 package/pkg-meson.mk                   | 13 +++++++++++++
 support/misc/cross-compilation.conf.in |  2 ++
 2 files changed, 15 insertions(+)

diff --git a/package/pkg-meson.mk b/package/pkg-meson.mk
index 65cabf23ba..1f2e6394b9 100644
--- a/package/pkg-meson.mk
+++ b/package/pkg-meson.mk
@@ -82,6 +82,16 @@ else
 PKG_MESON_TARGET_FC = /bin/false
 endif
 
+ifeq ($(BR2_PACKAGE_HOST_RUSTC),y)
+PKG_MESON_TARGET_RUSTC = $(HOST_DIR)/bin/rustc
+PKG_MESON_TARGET_RUSTC_LINKER = $(TARGET_CROSS)gcc
+PKG_MESON_TARGET_RUSTC_TARGET_NAME = $(RUSTC_TARGET_NAME)
+else
+PKG_MESON_TARGET_RUSTC = /bin/false
+PKG_MESON_TARGET_RUSTC_LINKER = /bin/false
+PKG_MESON_TARGET_RUSTC_TARGET_NAME =
+endif
+
 # Generates sed patterns for patching the cross-compilation.conf template,
 # since Flags might contain commas the arguments are passed indirectly by
 # variable name (stripped to deal with whitespaces).
@@ -91,6 +101,7 @@ define PKG_MESON_CROSSCONFIG_SED
         -e "s%@TARGET_CXX@%$(PKG_MESON_TARGET_CXX)%g" \
         -e "s%@TARGET_AR@%$(TARGET_AR)%g" \
         -e "s%@TARGET_FC@%$(PKG_MESON_TARGET_FC)%g" \
+        -e "s%@TARGET_RUSTC@%$(PKG_MESON_TARGET_RUSTC)%g" \
         -e "s%@TARGET_STRIP@%$(TARGET_STRIP)%g" \
         -e "s%@TARGET_ARCH@%$(PKG_MESON_TARGET_CPU_FAMILY)%g" \
         -e "s%@TARGET_CPU@%$(GCC_TARGET_CPU)%g" \
@@ -99,6 +110,8 @@ define PKG_MESON_CROSSCONFIG_SED
         -e "s%@TARGET_CFLAGS@%$(call make-sq-comma-list,$($(strip $(1))))%g" \
         -e "s%@TARGET_LDFLAGS@%$(call make-sq-comma-list,$($(strip $(3))))%g" \
         -e "s%@TARGET_CXXFLAGS@%$(call make-sq-comma-list,$($(strip $(2))))%g" \
+        -e "s%@TARGET_RUSTC_LINKER@%$(PKG_MESON_TARGET_RUSTC_LINKER)%g" \
+        -e "s%@RUSTC_TARGET_NAME@%$(PKG_MESON_TARGET_RUSTC_TARGET_NAME)%g" \
         -e "s%@BR2_CMAKE@%$(BR2_CMAKE)%g" \
         -e "s%@PKGCONF_HOST_BINARY@%$(HOST_DIR)/bin/pkgconf%g" \
         -e "s%@HOST_DIR@%$(HOST_DIR)%g" \
diff --git a/support/misc/cross-compilation.conf.in b/support/misc/cross-compilation.conf.in
index a58ab553d0..21cec10b82 100644
--- a/support/misc/cross-compilation.conf.in
+++ b/support/misc/cross-compilation.conf.in
@@ -13,6 +13,8 @@ fortran = '@TARGET_FC@'
 pkg-config = '@PKGCONF_HOST_BINARY@'
 g-ir-compiler = '@STAGING_DIR@/usr/bin/g-ir-compiler'
 g-ir-scanner = '@STAGING_DIR@/usr/bin/g-ir-scanner'
+rust = ['@TARGET_RUSTC@', '--target', '@RUSTC_TARGET_NAME@' ]
+rust_ld = '@TARGET_RUSTC_LINKER@'
 
 [built-in options]
 c_args = [@TARGET_CFLAGS@]
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
