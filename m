Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72AF4C001DF
	for <buildroot@archiver.kernel.org>; Tue, 25 Jul 2023 17:34:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2A8FF61105;
	Tue, 25 Jul 2023 17:34:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2A8FF61105
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JGt-MICaK8Z8; Tue, 25 Jul 2023 17:34:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4906E610FE;
	Tue, 25 Jul 2023 17:34:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4906E610FE
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 841CD1BF317
 for <buildroot@lists.busybox.net>; Tue, 25 Jul 2023 17:33:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6AFE041578
 for <buildroot@lists.busybox.net>; Tue, 25 Jul 2023 17:33:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6AFE041578
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FgOp42Znbmvd for <buildroot@lists.busybox.net>;
 Tue, 25 Jul 2023 17:33:53 +0000 (UTC)
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 444354026A
 for <buildroot@buildroot.org>; Tue, 25 Jul 2023 17:33:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 444354026A
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-31763b2c5a4so1992386f8f.3
 for <buildroot@buildroot.org>; Tue, 25 Jul 2023 10:33:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690306431; x=1690911231;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6nCHObc5nEw5Xi0bx812O1kI5Z++gdoNFWV4SrWpQ9k=;
 b=OSeCqxoFqVyNsSE3k2fIHuz7jubYtiXBnZ/J721l07Ueo72Mfv0lOEF5AX5khT7bl1
 1OLTrqThD018i72rjH/pYUmZkBg7vbEukBkXFT11YG/eihwNdWHqh8Mgu0LAubMW/gLA
 ddQFUO8xotzCxzlyId2XIGNH3zOPxI8UkfRrDMV40WN2blryDSuHZS3kIEuv94STnXdK
 CSiYEN+w+hha3Bk1ig0wO6PLLl3HncC2TsQSRXpltzS1FWQmGEcYo4xryadsXzMHI+su
 rp2nrGYkmobVsZ9E0QeWAC/CiXP3dRU8M0dedt1boxge3tGZBOptwOebTJ4DWj24PziJ
 AWJQ==
X-Gm-Message-State: ABy/qLatl9ue7GFAaQ+4Gr7y4pjET3zmbqrEc483ajudk58wVruHZsux
 DeZWG82zeOpKJUMKCVL9oGtWXVrNGFEeailEn80=
X-Google-Smtp-Source: APBJJlHOWfxxdiS/96QTi4zDrqUaXJM6PJ/J7eBzOCH0mjtpVxdcv0a7ns2gn3s8GAO5GyoStlzcPA==
X-Received: by 2002:adf:ed4f:0:b0:317:6513:da7e with SMTP id
 u15-20020adfed4f000000b003176513da7emr4346158wro.36.1690306431155; 
 Tue, 25 Jul 2023 10:33:51 -0700 (PDT)
Received: from localhost.localdomain ([2001:861:5384:6b50:e537:2825:8aee:d1db])
 by smtp.gmail.com with ESMTPSA id
 q4-20020a5d61c4000000b00316eb7770b8sm11721541wrv.5.2023.07.25.10.33.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Jul 2023 10:33:50 -0700 (PDT)
From: Sebastian Weyer <sebastian.weyer@smile.fr>
To: buildroot@buildroot.org
Date: Tue, 25 Jul 2023 19:30:55 +0200
Message-Id: <20230725173102.543874-4-sebastian.weyer@smile.fr>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230725173102.543874-1-sebastian.weyer@smile.fr>
References: <20230725173102.543874-1-sebastian.weyer@smile.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20221208.gappssmtp.com; s=20221208; t=1690306431; x=1690911231;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6nCHObc5nEw5Xi0bx812O1kI5Z++gdoNFWV4SrWpQ9k=;
 b=490IkHbTVRtwWo9u5xQya3xE+a55GvuQk5iSELJcw0sibqBnnk8NEo4faxUeNBmIFB
 pPOaWBJY/79K4Xb5hYyEmuqwMYxbL4XuDhRV03twW9eIokuNAcA6ouk+mM+v+L66I6iB
 bGoLsSRJoySFVOT9MhIQfOsFySf2fluIquXAd/dDSe84sVPVB6k8WGErqj50eKrMWEhv
 gxMlhKby9+r2V6x/jCw7hfkSqs6h5lJrArevYZ3oDRrU8F0ilu4X4MoHMPppTRa191aj
 ChkZsOpggdu1jdDJKyfmr+3u4OCpQLFKzcIIFYT40CxFefMXMsVDLljWswbFS3yvzG5q
 jhGw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=smile-fr.20221208.gappssmtp.com
 header.i=@smile-fr.20221208.gappssmtp.com header.a=rsa-sha256
 header.s=20221208 header.b=490IkHbT
Subject: [Buildroot] [PATCH v2 3/9] package/pkg-meson.mk: add rust
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Romain Naour <romain.naour@smile.fr>,
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
---
 package/pkg-meson.mk                   | 13 +++++++++++++
 support/misc/cross-compilation.conf.in |  2 ++
 2 files changed, 15 insertions(+)

diff --git a/package/pkg-meson.mk b/package/pkg-meson.mk
index 65cabf23ba..25dd4f0d7f 100644
--- a/package/pkg-meson.mk
+++ b/package/pkg-meson.mk
@@ -82,6 +82,16 @@ else
 PKG_MESON_TARGET_FC = /bin/false
 endif
 
+ifeq ($(BR2_PACKAGE_HOST_RUSTC),y)
+PKG_MESON_TARGET_RUSTC = $(HOST_DIR)/bin/rustc
+PKG_MESON_TARGET_RUSTC_LINKER = $(notdir $(TARGET_CROSS))gcc
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
index 7053df472b..3c5812b131 100644
--- a/support/misc/cross-compilation.conf.in
+++ b/support/misc/cross-compilation.conf.in
@@ -13,6 +13,8 @@ fortran = '@TARGET_FC@'
 pkgconfig = '@PKGCONF_HOST_BINARY@'
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
