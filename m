Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A11DC4828E
	for <buildroot@archiver.kernel.org>; Fri,  2 Feb 2024 09:36:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 39C9C6FA8B;
	Fri,  2 Feb 2024 09:36:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 39C9C6FA8B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id m9wLA6jpWmwo; Fri,  2 Feb 2024 09:36:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 358656FA5D;
	Fri,  2 Feb 2024 09:36:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 358656FA5D
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 565141BF39D
 for <buildroot@lists.busybox.net>; Fri,  2 Feb 2024 09:36:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2EF3642E60
 for <buildroot@lists.busybox.net>; Fri,  2 Feb 2024 09:36:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2EF3642E60
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WCMSgwY94gsQ for <buildroot@lists.busybox.net>;
 Fri,  2 Feb 2024 09:36:34 +0000 (UTC)
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E203C42E73
 for <buildroot@buildroot.org>; Fri,  2 Feb 2024 09:36:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E203C42E73
Received: by mail-wr1-x443.google.com with SMTP id
 ffacd0b85a97d-33b1b95df3bso578922f8f.0
 for <buildroot@buildroot.org>; Fri, 02 Feb 2024 01:36:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706866592; x=1707471392;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ls7nw66oUs4L6enwDVBooIlbiG6ZkA2XoyCl9qCA7W4=;
 b=CaCs2Be2QPdEs9oSt9SYzhu23IVycefMsjbae+PNebO5jbt52VuPy0Z5BZGeZIIjcr
 OI0S7K6WBhKm+aj81T1A4TR0jf1vkqQKrCdkYVkmFU3//DUFNK1S5R4TBgDxMTE678yJ
 +o13mzEdu4Pn9NH8tUiqJUMSkjY5imVYLfEaW1HrzXRU2g8prVf71+8tmReG7QdNLOVy
 2rYfKyPl60lRRQ7rON5nuESbDEJWEXUbXjKllbUfae1awvG5Nxh61SGi2CvBcLFvw+KT
 sYnEJS+ik7of3nRntO8MlCucmqdrF0N3ew1WpirP21ca3CR5LF9Z5RIZruR0xAV0+e36
 eTWA==
X-Gm-Message-State: AOJu0YzkqlsszWN0owmrKO4ZI/SVGFwM79odxeMnqN0jMIodCNNgMEMc
 lbEoSw9vylTvdImwU7f35waUQxj5SvHN1li8eK/iI0IRbumas2gCovnR0lGdy1ly6J9pDqhEOhT
 WTn4IaA==
X-Google-Smtp-Source: AGHT+IErJDbHLNB3F1hG24Y2eedQwveH7qP+OcV9TITgKKUkLoomfLs0mT1yF7NZAWsW/tzyiOnGVw==
X-Received: by 2002:adf:b181:0:b0:33b:20f5:b908 with SMTP id
 q1-20020adfb181000000b0033b20f5b908mr751382wra.9.1706866591852; 
 Fri, 02 Feb 2024 01:36:31 -0800 (PST)
X-Forwarded-Encrypted: i=0;
 AJvYcCXFriCYbK/wCP11qmRd3BfMWUx9csZnfpPp1Zz/eaHmhJS7+RqFomVCbp8ZDQVWNSX4fwIfaSVzntVVDFN4ArKC8jcIgRakiGwxZy214ankdkSqA1rCK93lLOQoxBIaagWbjuFWEKhiZzJxsqMEUqQixqAyeuNYnJR7
Received: from localhost.localdomain ([80.215.186.96])
 by smtp.gmail.com with ESMTPSA id
 m1-20020adfe941000000b0033ae6fa7f20sm1504615wrn.65.2024.02.02.01.36.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Feb 2024 01:36:31 -0800 (PST)
From: Antoine Coutant <antoine.coutant@smile.fr>
To: buildroot@buildroot.org
Date: Fri,  2 Feb 2024 10:36:20 +0100
Message-Id: <20240202093625.1409559-3-antoine.coutant@smile.fr>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240202093625.1409559-1-antoine.coutant@smile.fr>
References: <20240202093625.1409559-1-antoine.coutant@smile.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1706866592; x=1707471392;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ls7nw66oUs4L6enwDVBooIlbiG6ZkA2XoyCl9qCA7W4=;
 b=OYgG6s4NyAAPQfNttvFvumB25hxMdk4+ZyvSChqEzyvxOvsc4SGgWpJZAkFDUL23eF
 zQzRdTLvTAR2iyFW28qhTdFaUsf3bWpthqsTXmGsi2T7JXt4s1OMBGpAXbEGmjpJ/sgY
 6UK6qWLbIbEEjHJ2/On7OMIk6ZRIOfb1hPB2WcTiCNm7zRNXoRfu8QU4jxgBFrHSwZHn
 n9/Ia4QyluCNi7Z1GE9V93kUw8dtUOL/INntniBSJ1yO0+ESP5XKLLWOSkDBaLvQz20V
 +HKjAMtNaMBSxmE118KVZkSwXAsBAiN9WQcQ1hFwsQ/HXmuTW7IGzIcUXqg/WOj8h6rn
 yEzw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=smile-fr.20230601.gappssmtp.com
 header.i=@smile-fr.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=OYgG6s4N
Subject: [Buildroot] [PATCH v4 2/7] package/pkg-meson.mk: add rust
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
Cc: sebastian.weyer@smile.fr, Antoine Coutant <antoine.coutant@smile.fr>,
 bernd@kuhls.net, romain.naour@smile.fr
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
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
