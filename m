Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9095CC00144
	for <buildroot@archiver.kernel.org>; Thu,  4 Aug 2022 07:15:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0069C41732;
	Thu,  4 Aug 2022 07:15:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0069C41732
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AJCiznEYzYnx; Thu,  4 Aug 2022 07:15:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B4C2041514;
	Thu,  4 Aug 2022 07:15:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B4C2041514
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A3E111BF2C1
 for <buildroot@lists.busybox.net>; Thu,  4 Aug 2022 07:15:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8BC3081750
 for <buildroot@lists.busybox.net>; Thu,  4 Aug 2022 07:15:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8BC3081750
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZfF2tNueRfZK for <buildroot@lists.busybox.net>;
 Thu,  4 Aug 2022 07:15:21 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B55B081656
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B55B081656
 for <buildroot@busybox.net>; Thu,  4 Aug 2022 07:15:20 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 m41-20020a05600c3b2900b003a4e094256eso1915311wms.0
 for <buildroot@busybox.net>; Thu, 04 Aug 2022 00:15:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Nthm/ObH0BnOP8nq71ln3GMgnlbfawGk1KN2pBVTpyo=;
 b=g7T0sPyRLKprLuOys6pdFswKDsoXvkfxOPZNFUJ/PXrwCbbN/ItCjJBKx7M5b3HoXL
 JWahzKObUiygUwZjSqyTd8lAtOOYkKYDXPu9h7JgSdiRX78nUx1TD3JbAoQqu1X0JcBY
 rVhs8vs9PRGdIPuRC67O281twLelRzb6Ycd8gT3LyNiYvm/w2f1WB8cmMREn/mD5yTHX
 DkzAc4p0BgDA6MGxgwmFpc963aSqIgI75BUJ18solYMNBRxBIKljqwtnb7jb+1fyL0BL
 cJ8Js3FZ8k76pYP79rJy28yWD7H+QmPInFBeyyppuXPETGM21OBXSI1ZS0v6F3Q3+CAa
 h+/Q==
X-Gm-Message-State: ACgBeo2Irwfs9WCcVxmIXxHylZXsyZ17AkPd9sFFtgeQrrKaONRqRqv+
 WtQHJqSr3q7Gr6tAN2RAd4uZdZ29MG4=
X-Google-Smtp-Source: AA6agR6HwKsS+on5+RUbuSnhuA5oA4xwvEA8ZcRn6ODp7AeoTY1jN8VzC/dJNFyQSi2vAdUx3P+63Q==
X-Received: by 2002:a05:600c:4f8e:b0:3a3:30b7:4901 with SMTP id
 n14-20020a05600c4f8e00b003a330b74901mr370209wmq.17.1659597318475; 
 Thu, 04 Aug 2022 00:15:18 -0700 (PDT)
Received: from pc-140.home ([2a01:cb1c:794:2300:d109:33e7:bc94:49e5])
 by smtp.gmail.com with ESMTPSA id
 e5-20020a056000120500b002207a0b93b4sm248905wrx.49.2022.08.04.00.15.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Aug 2022 00:15:18 -0700 (PDT)
From: "Guillaume W. Bres" <guillaume.bressaix@gmail.com>
To: buildroot@busybox.net
Date: Thu,  4 Aug 2022 09:15:03 +0200
Message-Id: <20220804071504.4062-1-guillaume.bressaix@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Nthm/ObH0BnOP8nq71ln3GMgnlbfawGk1KN2pBVTpyo=;
 b=HG4DqDUwFAbZLVMr2AYkPcW07fBuKh8EXlj6nfrJnq1EKR80DyMD/tHk9GxlYjtVw8
 0ScgQLqT8QgNAm9PpMavtgmIczdAK2RMe1eypfP3AKoh6XGw31+IMeVCOtA1uQ3TUbPk
 g1uPoysroYdfr9mMWmS4gZNNg+24mwEo+8ByLni1lXQAFCVVPcPNF0ksAI/ZhB+eojLv
 4kxxtg4m0JJJANtLmu2lgexpcu2i8dJ9g/EHHNKEy+AmqGvNV7fwQz+ifU3uME9sltsh
 RmT+NNRLPA+5vtHHG0FgX+WUezcssOvmmUVkL2B2bClZDJsLu9RJ2pY/GH33PmjCPbQT
 JhmQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=HG4DqDUw
Subject: [Buildroot] [RFC v2 1/2] package/pkg-meson: scipy needs fortran
 cross compilation
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 "Guillaume W. Bres" <guillaume.bressaix@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

---
 package/pkg-meson.mk                   | 2 ++
 support/misc/cross-compilation.conf.in | 3 +++
 2 files changed, 5 insertions(+)

diff --git a/package/pkg-meson.mk b/package/pkg-meson.mk
index 156b005fdd..32d41170f3 100644
--- a/package/pkg-meson.mk
+++ b/package/pkg-meson.mk
@@ -76,10 +76,12 @@ define PKG_MESON_CROSSCONFIG_SED
         -e "s%@TARGET_CC@%$(TARGET_CC)%g" \
         -e "s%@TARGET_CXX@%$(TARGET_CXX)%g" \
         -e "s%@TARGET_AR@%$(TARGET_AR)%g" \
+        -e "s%@TARGET_FC@%$(TARGET_FC)%g" \
         -e "s%@TARGET_STRIP@%$(TARGET_STRIP)%g" \
         -e "s%@TARGET_ARCH@%$(PKG_MESON_TARGET_CPU_FAMILY)%g" \
         -e "s%@TARGET_CPU@%$(GCC_TARGET_CPU)%g" \
         -e "s%@TARGET_ENDIAN@%$(call qstrip,$(call LOWERCASE,$(BR2_ENDIAN)))%g" \
+        -e "s%@TARGET_FCFLAGS@%$(call make-sq-comma-list,$($(strip $(2))))%g" \
         -e "s%@TARGET_CFLAGS@%$(call make-sq-comma-list,$($(strip $(1))))%g" \
         -e "s%@TARGET_LDFLAGS@%$(call make-sq-comma-list,$($(strip $(3))))%g" \
         -e "s%@TARGET_CXXFLAGS@%$(call make-sq-comma-list,$($(strip $(2))))%g" \
diff --git a/support/misc/cross-compilation.conf.in b/support/misc/cross-compilation.conf.in
index 235e5a8495..7053df472b 100644
--- a/support/misc/cross-compilation.conf.in
+++ b/support/misc/cross-compilation.conf.in
@@ -9,6 +9,7 @@ cpp = '@TARGET_CXX@'
 ar = '@TARGET_AR@'
 strip = '@TARGET_STRIP@'
 cmake = '@BR2_CMAKE@'
+fortran = '@TARGET_FC@'
 pkgconfig = '@PKGCONF_HOST_BINARY@'
 g-ir-compiler = '@STAGING_DIR@/usr/bin/g-ir-compiler'
 g-ir-scanner = '@STAGING_DIR@/usr/bin/g-ir-scanner'
@@ -18,6 +19,8 @@ c_args = [@TARGET_CFLAGS@]
 c_link_args = [@TARGET_LDFLAGS@]
 cpp_args = [@TARGET_CXXFLAGS@]
 cpp_link_args = [@TARGET_LDFLAGS@]
+fortran_args = [@TARGET_FCFLAGS@]
+fortran_link_args = [@TARGET_LDFLAGS@]
 wrap_mode = 'nodownload'
 cmake_prefix_path = '@STAGING_DIR@/usr/lib/cmake'
 
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
