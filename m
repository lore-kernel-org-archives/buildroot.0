Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EE88C6FD1F
	for <buildroot@archiver.kernel.org>; Mon, 13 Mar 2023 06:56:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B4C1541602;
	Mon, 13 Mar 2023 06:56:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B4C1541602
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hmd7EolBqD9H; Mon, 13 Mar 2023 06:56:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9E0EF41680;
	Mon, 13 Mar 2023 06:56:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9E0EF41680
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 89EE41BF4DA
 for <buildroot@lists.busybox.net>; Mon, 13 Mar 2023 06:55:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 71D8E4012A
 for <buildroot@lists.busybox.net>; Mon, 13 Mar 2023 06:55:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 71D8E4012A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GUkzwLC0hbTr for <buildroot@lists.busybox.net>;
 Mon, 13 Mar 2023 06:55:27 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 03C10400FE
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 03C10400FE
 for <buildroot@buildroot.org>; Mon, 13 Mar 2023 06:55:26 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 r19-20020a05600c459300b003eb3e2a5e7bso7112836wmo.0
 for <buildroot@buildroot.org>; Sun, 12 Mar 2023 23:55:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678690525;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=pndoObDs60jdvkW70d4FUP2PDQVPqA3KQR+emeoHNLE=;
 b=DrQyKwZxYEXUaxWqehmBzYR30PdA+/Jvr6lWLunP7OWrzy/9JHcIHFEZmZU71S4NAs
 UlzW5LaJ3+DpNbSQnrATut19mweWkY9rwY4ZdO1p7BNWp0aMDHSmZbYc0Biyr6a3ybTO
 Hiwcz6XHMFKUeaf94Rn8ErDk/Mfps0/jzZDKpeI/FJWubQsgs+izibsrYlWW+V9d4/4/
 F8/VS4QSDr8MCTUMyxR/GvI7nRBw+KCX2ccJU/RL1f3MOj93fT8b1G0/OxYoGYdk8iS1
 Nu6GDIHr2Jq69bzja5SEM0QnY+kvnt0997jHMzxpoLp1m8mCm5hyFvflKUCs3cZ4kHmk
 +QSg==
X-Gm-Message-State: AO0yUKX2G6RdOXO2WGjkar0wFjeiNTzJGhseDVT9U9P8x3WVQzLe81i0
 VmxD4G/G30RsDJXN3LV1YhiuedAv8vKrdQ==
X-Google-Smtp-Source: AK7set/d0cbEL1MtHbzOMOjUFnY9FoNiPPWQpCznHURIQ1mO1P7hXceP+QcK2aKB7PDqum2siu/5UA==
X-Received: by 2002:a1c:cc06:0:b0:3eb:42fa:39d5 with SMTP id
 h6-20020a1ccc06000000b003eb42fa39d5mr9781274wmb.29.1678690524823; 
 Sun, 12 Mar 2023 23:55:24 -0700 (PDT)
Received: from thomas-OptiPlex-7090.nmg.localnet (d528f5fc4.static.telenet.be.
 [82.143.95.196]) by smtp.gmail.com with ESMTPSA id
 s16-20020a05600c45d000b003daf6e3bc2fsm10737978wmo.1.2023.03.12.23.55.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Mar 2023 23:55:24 -0700 (PDT)
From: Thomas Devoogdt <thomas@devoogdt.com>
X-Google-Original-From: Thomas Devoogdt <thomas.devoogdt@barco.com>
To: buildroot@buildroot.org
Date: Mon, 13 Mar 2023 07:55:15 +0100
Message-Id: <20230313065516.2023267-2-thomas.devoogdt@barco.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230313065516.2023267-1-thomas.devoogdt@barco.com>
References: <CACXRmJjeRm3+zZTkOLoZ4NPu7bgi_udWmc=KBLD2KcTRQiHOhw@mail.gmail.com>
 <20230313065516.2023267-1-thomas.devoogdt@barco.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678690525;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pndoObDs60jdvkW70d4FUP2PDQVPqA3KQR+emeoHNLE=;
 b=TSpdNxArXJOkDuV6BEPituO5UrQOsXOKy45Qr1xngV0OD7AdF8DfUQiq0wE9TnwTO1
 /+Vn71BRGWj3LLKiF4n2v/v2rHXqqG4dC2BHo6x0yvUkFLO2wARZp744C28M1ezoZVyy
 rIvq2copq3fG9oFJZeYXkv/KTQG3SYQHGFTLirnqmunog2Rs0y0ZZ1DrtG3b2GSVf4DQ
 JbVs6KWGxGS4Umbi6SgPzdV8ktnBtFN90eo2kOAJOFShuS2skrrrd5ZvKx//IMLeQVcb
 Mc2KB0tTbYg3tauG05DSRkl9iIp6zKV/9qFXqfBL3Qg4ZKlto85RpUStm+JY1HxmemjC
 +hPQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=TSpdNxAr
Subject: [Buildroot] [PATCH v4 2/3] package/webkitgtk: use the CMAKE_NINJA
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
Cc: Adrian Perez de Castro <aperez@igalia.com>,
 Samuel Martin <s.martin49@gmail.com>,
 Thomas Devoogdt <thomas.devoogdt@barco.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

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
 package/webkitgtk/webkitgtk.mk | 20 +-------------------
 1 file changed, 1 insertion(+), 19 deletions(-)

diff --git a/package/webkitgtk/webkitgtk.mk b/package/webkitgtk/webkitgtk.mk
index 3263f7fea0..b43f97f0ca 100644
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
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
