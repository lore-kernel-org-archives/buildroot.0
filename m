Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 214C5C6FD19
	for <buildroot@archiver.kernel.org>; Mon, 13 Mar 2023 06:56:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BA6B5415A6;
	Mon, 13 Mar 2023 06:56:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BA6B5415A6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tYxzlSYhdssl; Mon, 13 Mar 2023 06:56:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id AC907415B5;
	Mon, 13 Mar 2023 06:55:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AC907415B5
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D90CD1BF4DA
 for <buildroot@lists.busybox.net>; Mon, 13 Mar 2023 06:55:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BD3804160A
 for <buildroot@lists.busybox.net>; Mon, 13 Mar 2023 06:55:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BD3804160A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZtO5G85slBMS for <buildroot@lists.busybox.net>;
 Mon, 13 Mar 2023 06:55:29 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4F3FB415B5
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4F3FB415B5
 for <buildroot@buildroot.org>; Mon, 13 Mar 2023 06:55:29 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 k25-20020a7bc419000000b003ed23114fa7so1415382wmi.4
 for <buildroot@buildroot.org>; Sun, 12 Mar 2023 23:55:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678690527;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=zOZRytoWff018qc3DgyWy0Zv4jvCF0OaRC8LWH449/0=;
 b=qQYrM6VFNntTvTTkk5fab+cW6rBJ0bvejOOUSIO+38jGEPpXItLp+ZQ3+TdRHYOkl4
 UP8ovFApm+uVKRDffCO6MKU8sRjDeKnuHxY2U1Tk6q9wDz98wdfF43eblS5hPxaPNZDW
 M0uSqU/l1ufH2lZ6n8+uyaqpiUEIrDBz3/CRVl4VEunAaHzmtFfetDtESiK8WivMLQum
 8rBLGUyfGb/Q/ziMBm+cpV8lV68HXOSaIoqbEIvDn/Htr5JnrwXdK0guZPQRTgttSuGh
 ELOMkoIIkhb5ZZ7RpgklWPucpyOtQ6fFwnwE/Kn7HOYE8bHOUeENnpoLJTzk8NqVpPM6
 3HIA==
X-Gm-Message-State: AO0yUKXCrAPUZsMXIeRkbUasknO/A95P0F/F/oDUmd/bo4uzthnPhA1H
 OsFyvms1QTq7OMBr/RolQhEiU+IPNj3ztw==
X-Google-Smtp-Source: AK7set+J0QFi3IRj1E70jENa2M4IClqGqO0SLje22jK1DiQpA+3oNovWRzBT/d9lpwmsPEj99oWkhA==
X-Received: by 2002:a05:600c:3553:b0:3ea:f6c4:5f2a with SMTP id
 i19-20020a05600c355300b003eaf6c45f2amr9237628wmq.17.1678690526814; 
 Sun, 12 Mar 2023 23:55:26 -0700 (PDT)
Received: from thomas-OptiPlex-7090.nmg.localnet (d528f5fc4.static.telenet.be.
 [82.143.95.196]) by smtp.gmail.com with ESMTPSA id
 s16-20020a05600c45d000b003daf6e3bc2fsm10737978wmo.1.2023.03.12.23.55.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Mar 2023 23:55:26 -0700 (PDT)
From: Thomas Devoogdt <thomas@devoogdt.com>
X-Google-Original-From: Thomas Devoogdt <thomas.devoogdt@barco.com>
To: buildroot@buildroot.org
Date: Mon, 13 Mar 2023 07:55:16 +0100
Message-Id: <20230313065516.2023267-3-thomas.devoogdt@barco.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230313065516.2023267-1-thomas.devoogdt@barco.com>
References: <CACXRmJjeRm3+zZTkOLoZ4NPu7bgi_udWmc=KBLD2KcTRQiHOhw@mail.gmail.com>
 <20230313065516.2023267-1-thomas.devoogdt@barco.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678690527;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zOZRytoWff018qc3DgyWy0Zv4jvCF0OaRC8LWH449/0=;
 b=cWA1a9i6qKmZrhDk9pMcNuUsQ565Y0qQSMc04Jm1ORuIFGPg5svLEnadZmPFQpxtic
 bkXVkDgHpqARhI3u6KkXEKgF8J9ziCdfxPK0WlDHvm6Ry4ZRk0TXXIxWZ0cp50yUS3mP
 sqDbD4j/7F5w1cws7ECJ65OAkn4gDQC+a0TIm4h3gy8sENEykCh5RkSRxN1MwzViQ/NW
 upP8hzpei2wBJ0meFiYWy5j0961ZUGGctsdwyVKlx6o9EGfbPkZFvWFpId05dakrfTS0
 MHo+eqa0kcgTDcvNM/TtWe7Us/LWS7HeyLTD1V+IlpuL3c+pwiDYyoxCIdCb5FDfbinK
 G96Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=cWA1a9i6
Subject: [Buildroot] [PATCH v4 3/3] package/wpewebkit: use the CMAKE_NINJA
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

commit 78d499409f71d8a22b0632c8ebc06f67ee6ae6dd
Author: Peter Korsgaard <peter@korsgaard.com>
Date:   Thu Feb 9 18:07:06 2023 +0100

    package/wpewebkit: Build with ninja

    Wpewebkit needs cmake >= 3.20 when building with the make backend since
    wpewebkit 3.8.0.

    Cmake 3.20 is above our minimal version in
    support/dependencies/check-host-cmake.mk, so this breaks builds on hosts
    with cmake >= 3.18 < 3.20 - So use the ninja backend instead.

    https://github.com/WebKit/WebKit/commit/6cd89696b5d406c1a3d9a7a9bbb18fda9284fa1f

    Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Signed-off-by: Thomas Devoogdt <thomas.devoogdt@barco.com>
---
 package/wpewebkit/wpewebkit.mk | 20 +-------------------
 1 file changed, 1 insertion(+), 19 deletions(-)

diff --git a/package/wpewebkit/wpewebkit.mk b/package/wpewebkit/wpewebkit.mk
index 48e5c2f8cd..c1b5dee121 100644
--- a/package/wpewebkit/wpewebkit.mk
+++ b/package/wpewebkit/wpewebkit.mk
@@ -14,6 +14,7 @@ WPEWEBKIT_LICENSE_FILES = \
 	Source/WebCore/LICENSE-LGPL-2.1
 WPEWEBKIT_CPE_ID_VENDOR = wpewebkit
 WPEWEBKIT_CPE_ID_PRODUCT = wpe_webkit
+WPEWEBKIT_CMAKE_NINJA = YES
 WPEWEBKIT_DEPENDENCIES = host-gperf host-python3 host-ruby \
 	harfbuzz cairo icu jpeg libepoxy libgcrypt libgles libsoup libtasn1 \
 	libpng libxslt openjpeg wayland-protocols webp wpebackend-fdo
@@ -103,23 +104,4 @@ ifeq ($(BR2_ARM_CPU_ARMV5)$(BR2_ARM_CPU_ARMV6)$(BR2_MIPS_CPU_MIPS32R6)$(BR2_MIPS
 WPEWEBKIT_CONF_OPTS += -DENABLE_JIT=OFF -DENABLE_C_LOOP=ON -DENABLE_SAMPLING_PROFILER=OFF
 endif
 
-# wpewebkit needs cmake >= 3.20 when building with the make backend, which is
-# above our minimal version in
-# support/dependencies/check-host-cmake.mk, so use the ninja backend:
-# https://github.com/WebKit/WebKit/commit/6cd89696b5d406c1a3d9a7a9bbb18fda9284fa1f
-WPEWEBKIT_CONF_OPTS += -GNinja
-WPEWEBKIT_DEPENDENCIES += host-ninja
-
-define WPEWEBKIT_BUILD_CMDS
-	$(TARGET_MAKE_ENV) $(BR2_CMAKE) --build $(WPEWEBKIT_BUILDDIR)
-endef
-
-define WPEWEBKIT_INSTALL_STAGING_CMDS
-	$(TARGET_MAKE_ENV) DESTDIR=$(STAGING_DIR) $(BR2_CMAKE) --install $(WPEWEBKIT_BUILDDIR)
-endef
-
-define WPEWEBKIT_INSTALL_TARGET_CMDS
-	$(TARGET_MAKE_ENV) DESTDIR=$(TARGET_DIR) $(BR2_CMAKE) --install $(WPEWEBKIT_BUILDDIR)
-endef
-
 $(eval $(cmake-package))
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
