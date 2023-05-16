Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3B75C77B7A
	for <buildroot@archiver.kernel.org>; Tue, 16 May 2023 08:22:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 593A1418EB;
	Tue, 16 May 2023 08:22:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 593A1418EB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Zm3lPOI29Opm; Tue, 16 May 2023 08:22:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0EAC1418E3;
	Tue, 16 May 2023 08:22:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0EAC1418E3
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 865F91BF2CF
 for <buildroot@lists.busybox.net>; Tue, 16 May 2023 08:22:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5CA6F418EB
 for <buildroot@lists.busybox.net>; Tue, 16 May 2023 08:22:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5CA6F418EB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YBIjfdAGfGjz for <buildroot@lists.busybox.net>;
 Tue, 16 May 2023 08:22:25 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 411AC418DE
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com
 [209.85.218.50])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 411AC418DE
 for <buildroot@buildroot.org>; Tue, 16 May 2023 08:22:25 +0000 (UTC)
Received: by mail-ej1-f50.google.com with SMTP id
 a640c23a62f3a-96b0235c10bso523967066b.3
 for <buildroot@buildroot.org>; Tue, 16 May 2023 01:22:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684225343; x=1686817343;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=y8dAaSzOi0d5XRrEpm5nav0j//Y1yPeWPiW+5lrodnk=;
 b=AUug2tkj//Nn1Hxm7jenwXj5IWNaECiNfA/CKSX9xnLwntboCY2Y+GC8kmnBeqvA0X
 C6VGgvzuZJavhC45CNPuLiFBcp7B8uwHSf6JYfyh3N52Tz3ifpIO9ajosXE03+B6Za5f
 D75aH6tjuDXGvC+g11y4f0Cw3TcuwdRbMobTgac2mg38N/LD8YMVbt/LUQpWZ2o9J1Ej
 GgMruHHxgkcTYgaXTGyjPju6eP77lNUu5HLT0OFuIZvICDOCSgdBY/IO31JvxL4b0oRV
 8Ib4FetwMRyZeCTKWUv5wL7mWTv8yqEiNJvSBHNIBTH/FKHFiFgH4eiuompGwhNR9aIB
 yW5A==
X-Gm-Message-State: AC+VfDx4rqz5/393IaYJRxUrzjPzZwJKcP4bz1Yqx4nz2EjWsdWPNG3p
 tzZGDPDNVCpRBxrSEt25EUDGg3iKhNpOruvp
X-Google-Smtp-Source: ACHHUZ4gZcoCvwci9bLJuzfR10NqtRwQB0EnUwAuxs2p0wZfMZlTx+33wdguVMRcKTYPfp80nYACpg==
X-Received: by 2002:a17:907:6e10:b0:968:1e8:a754 with SMTP id
 sd16-20020a1709076e1000b0096801e8a754mr23817025ejc.72.1684225342680; 
 Tue, 16 May 2023 01:22:22 -0700 (PDT)
Received: from localhost.localdomain
 ([2a02:a03f:eb68:2f00:5cb4:21ec:50e8:94f8])
 by smtp.gmail.com with ESMTPSA id
 lt14-20020a170906fa8e00b0094efdfe60dcsm10422528ejb.206.2023.05.16.01.22.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 May 2023 01:22:22 -0700 (PDT)
From: Thomas Devoogdt <thomas@devoogdt.com>
To: buildroot@buildroot.org
Date: Tue, 16 May 2023 10:21:53 +0200
Message-Id: <20230516082155.22014-2-thomas@devoogdt.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230516082155.22014-1-thomas@devoogdt.com>
References: <20230516082155.22014-1-thomas@devoogdt.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v5 2/4] package/webkitgtk: use the CMAKE_NINJA
 flag
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
 Samuel Martin <s.martin49@gmail.com>, John Keeping <john@metanate.com>,
 Thomas Devoogdt <thomas.devoogdt@barco.com>,
 Adrian Perez de Castro <aperez@igalia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Thomas Devoogdt <thomas.devoogdt@barco.com>

Replaces:

commit 16e5c92ff5fd2b44a1126bd7d7538c68ce838213
Author: Peter Korsgaard <peter@korsgaard.com>
Date:   Thu Feb 9 18:07:05 2023 +0100

    package/webkitgtk: Build with ninja

    Webkitgtk needs cmake >= 3.20 when building with the make backend since
    webkitgtk 3.8.0.

    Cmake 3.20 is above our minimal version in
    support/dependencies/check-host-cmake.mk, so this breaks builds on hosts
    with cmake >= 3.18 < 3.20 - So use the ninja backend instead.

    https://github.com/WebKit/WebKit/commit/6cd89696b5d406c1a3d9a7a9bbb18fda9284fa1f

    Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Signed-off-by: Thomas Devoogdt <thomas.devoogdt@barco.com>
---
v5: no change
---
 package/webkitgtk/webkitgtk.mk | 20 +-------------------
 1 file changed, 1 insertion(+), 19 deletions(-)

diff --git a/package/webkitgtk/webkitgtk.mk b/package/webkitgtk/webkitgtk.mk
index dd17b46e67..5184c69dbf 100644
--- a/package/webkitgtk/webkitgtk.mk
+++ b/package/webkitgtk/webkitgtk.mk
@@ -13,6 +13,7 @@ WEBKITGTK_LICENSE_FILES = \
 	Source/WebCore/LICENSE-APPLE \
 	Source/WebCore/LICENSE-LGPL-2.1
 WEBKITGTK_CPE_ID_VENDOR = webkitgtk
+WEBKITGTK_CMAKE_NINJA = YES
 WEBKITGTK_DEPENDENCIES = host-ruby host-python3 host-gperf \
 	enchant harfbuzz icu jpeg libgcrypt libgtk3 libsecret libsoup \
 	libtasn1 libxml2 libxslt openjpeg sqlite webp woff2
@@ -139,23 +140,4 @@ ifeq ($(BR2_ARM_CPU_ARMV5)$(BR2_ARM_CPU_ARMV6)$(BR2_MIPS_CPU_MIPS32R6)$(BR2_MIPS
 WEBKITGTK_CONF_OPTS += -DENABLE_JIT=OFF -DENABLE_C_LOOP=ON -DENABLE_SAMPLING_PROFILER=OFF
 endif
 
-# webkitgtk needs cmake >= 3.20 when not building with ninja, which is
-# above our minimal version in
-# support/dependencies/check-host-cmake.mk, so use the ninja backend:
-# https://github.com/WebKit/WebKit/commit/6cd89696b5d406c1a3d9a7a9bbb18fda9284fa1f
-WEBKITGTK_CONF_OPTS += -GNinja
-WEBKITGTK_DEPENDENCIES += host-ninja
-
-define WEBKITGTK_BUILD_CMDS
-	$(TARGET_MAKE_ENV) $(BR2_CMAKE) --build $(WEBKITGTK_BUILDDIR)
-endef
-
-define WEBKITGTK_INSTALL_STAGING_CMDS
-	$(TARGET_MAKE_ENV) DESTDIR=$(STAGING_DIR) $(BR2_CMAKE) --install $(WEBKITGTK_BUILDDIR)
-endef
-
-define WEBKITGTK_INSTALL_TARGET_CMDS
-	$(TARGET_MAKE_ENV) DESTDIR=$(TARGET_DIR) $(BR2_CMAKE) --install $(WEBKITGTK_BUILDDIR)
-endef
-
 $(eval $(cmake-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
