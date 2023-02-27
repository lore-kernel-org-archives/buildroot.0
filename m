Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F34FEC64ED6
	for <buildroot@archiver.kernel.org>; Mon, 27 Feb 2023 10:40:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 99D5781959;
	Mon, 27 Feb 2023 10:40:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 99D5781959
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lO-r4WSxeJ8X; Mon, 27 Feb 2023 10:40:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D42E481E0D;
	Mon, 27 Feb 2023 10:40:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D42E481E0D
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 601331BF25F
 for <buildroot@lists.busybox.net>; Mon, 27 Feb 2023 10:40:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3AFEF40977
 for <buildroot@lists.busybox.net>; Mon, 27 Feb 2023 10:40:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3AFEF40977
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YsUOgyGoPz9V for <buildroot@lists.busybox.net>;
 Mon, 27 Feb 2023 10:40:10 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0E3AD4098F
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0E3AD4098F
 for <buildroot@buildroot.org>; Mon, 27 Feb 2023 10:40:09 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id bv17so5679673wrb.5
 for <buildroot@buildroot.org>; Mon, 27 Feb 2023 02:40:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=zOZRytoWff018qc3DgyWy0Zv4jvCF0OaRC8LWH449/0=;
 b=LIuPX6oTgLbBSf2ySDzaIm3RwQLVqBjWLLpidiJeC5jdEH0UMCMLDPcKhcNboT6jPD
 q6SGOTa7E2kWFg75AuzZZoVAOV4K1GAh5AWf8CB2GXrVcOtS0hE0e4igQ7aKXHQ1v/8+
 3YR2UE/8h9l7FPD8qYMhkAKGcGr6ljWU16vsk6In2ndC3GYKBguCLpogy3Y8vzw+xm+0
 eKZjnZs6QAFj99R7/CY6j0pt645xGC4Rc5v7uz0CKO2cY3FY9D+pte9THOIxPeFuHzYh
 jYWoNkGswobofBp2Ws7v8Naj9ghrItCuJjhkrZV6kMfVYlw0BhZp5rgO0GPX2ZtYNXsb
 jFnw==
X-Gm-Message-State: AO0yUKUian2ZRYoDM3QtB7DIgI89AMdQGgUy6HjM4uLiv0PaWCaF5gUc
 IqsiyB1PGje+or9fx40jeMqFS3w1Lo2+55sQ
X-Google-Smtp-Source: AK7set/hAZK/lCI7FeBJZvPEOFd7y56iUg1uirQZqihuz4M9Y1H72qBz7LGTS1nSphK59LPk1AuaUA==
X-Received: by 2002:adf:dfd0:0:b0:2c5:54a7:3646 with SMTP id
 q16-20020adfdfd0000000b002c554a73646mr18961380wrn.5.1677494407661; 
 Mon, 27 Feb 2023 02:40:07 -0800 (PST)
Received: from thomas-OptiPlex-7090.nmg.localnet (d528f5fc4.static.telenet.be.
 [82.143.95.196]) by smtp.gmail.com with ESMTPSA id
 fm26-20020a05600c0c1a00b003e6dcd562a6sm8964937wmb.28.2023.02.27.02.40.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Feb 2023 02:40:07 -0800 (PST)
From: Thomas Devoogdt <thomas@devoogdt.com>
X-Google-Original-From: Thomas Devoogdt <thomas.devoogdt@barco.com>
To: buildroot@buildroot.org
Date: Mon, 27 Feb 2023 11:39:56 +0100
Message-Id: <20230227103956.128236-3-thomas.devoogdt@barco.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230227103956.128236-1-thomas.devoogdt@barco.com>
References: <20230224111509.2434694-3-thomas.devoogdt@barco.com>
 <20230227103956.128236-1-thomas.devoogdt@barco.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zOZRytoWff018qc3DgyWy0Zv4jvCF0OaRC8LWH449/0=;
 b=dp9VkziMIUH0apqu42V++w537ow7ETpVp7pfeoNfj4uU9ZJVZzkwR8R2skBVseJ/QW
 94B39PzlHdINcYu2Po+uNl+LYgxojHUpTAAbVZ+63ucF8YZD9QuV9LUko2qlb/Kmhy16
 1aLo1vi6piNyf86hCQzJO3tj5lBhs1F4vvMEIlIg1nSgUUc5VuS5yQz8M8JgaScUwgbT
 sCv0QmPKO8o4+OLbBGghgq7lSVLpnxhUZJGFBGCrzMpxkPOzDNJ6UKk27nW3uFLOy/Ke
 YSmKlYW6H79uZAdTTWoSxvlMlWxC1QLIkq1yY0byNWm5ItTari721aA17F9U5W/vrH4B
 b77g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=dp9VkziM
Subject: [Buildroot] [PATCH v2 3/3] package/wpewebkit: use the CMAKE_NINJA
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
Cc: Samuel Martin <s.martin49@gmail.com>,
 Thomas Devoogdt <thomas.devoogdt@barco.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Adrian Perez de Castro <aperez@igalia.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
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
