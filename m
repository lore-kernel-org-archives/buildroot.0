Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B3BBC61DA3
	for <buildroot@archiver.kernel.org>; Fri, 24 Feb 2023 11:15:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 225C460FBD;
	Fri, 24 Feb 2023 11:15:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 225C460FBD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dyRc2II74Lb8; Fri, 24 Feb 2023 11:15:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B699460FDC;
	Fri, 24 Feb 2023 11:15:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B699460FDC
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id BB0FA1BF36B
 for <buildroot@lists.busybox.net>; Fri, 24 Feb 2023 11:15:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A11F4418E9
 for <buildroot@lists.busybox.net>; Fri, 24 Feb 2023 11:15:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A11F4418E9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tiApymZgG2st for <buildroot@lists.busybox.net>;
 Fri, 24 Feb 2023 11:15:22 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 59696418E8
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 59696418E8
 for <buildroot@buildroot.org>; Fri, 24 Feb 2023 11:15:22 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id bo30so12977500wrb.0
 for <buildroot@buildroot.org>; Fri, 24 Feb 2023 03:15:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=zOZRytoWff018qc3DgyWy0Zv4jvCF0OaRC8LWH449/0=;
 b=6mn/8TOKyJGFYoVTdm3zkO+B7dSny6TIYy6meILkPLmAF5mPf3v30F6YuH2nQxlJpS
 zGmMUz0dtdfCaV6RRxWkVnvmnuXWucryW0zBdsmwZmIK1hwyz2isnU7Fbp6UKa2DcQWV
 TYqNrRuikKh/iHltcsDim+teVF768c42upOrxDi1udCKdTfZO1V0tjbtCqMnjNQFfNh7
 1Ah2Mz3agYyeiStqpt06taEbIDv0FQBIfPjF27SoDaQv/nF+HPUDhgQ16wUdK9gBiro0
 PvhgbL+ULmJkSywy7vLKIN5nrP6vwh8vmoceNta7CKVEq6bbR2c3X4sZfYF9IimiEoig
 xEyg==
X-Gm-Message-State: AO0yUKV33Zs6fMXtKuXffTy1oalil//1yUIb1e+2vytuFBfmEGlqOSnI
 XwYndmt7mvV9WSOKKI6vztoh/Zkai8lvRWoS
X-Google-Smtp-Source: AK7set8m4RgAQAqKIHDflWVntx6VqMUeUP7oXxyWX5NSPPvkRsnfZpN/UC24u9INrdMjNLOPb9xwzg==
X-Received: by 2002:adf:f3ca:0:b0:2c7:832:8fc0 with SMTP id
 g10-20020adff3ca000000b002c708328fc0mr8824741wrp.3.1677237320094; 
 Fri, 24 Feb 2023 03:15:20 -0800 (PST)
Received: from thomas-OptiPlex-7090.nmg.localnet (d528f5fc4.static.telenet.be.
 [82.143.95.196]) by smtp.gmail.com with ESMTPSA id
 g17-20020a5d6991000000b002c54911f50bsm13537960wru.84.2023.02.24.03.15.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Feb 2023 03:15:19 -0800 (PST)
From: Thomas Devoogdt <thomas@devoogdt.com>
X-Google-Original-From: Thomas Devoogdt <thomas.devoogdt@barco.com>
To: buildroot@buildroot.org
Date: Fri, 24 Feb 2023 12:15:09 +0100
Message-Id: <20230224111509.2434694-3-thomas.devoogdt@barco.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230224111509.2434694-1-thomas.devoogdt@barco.com>
References: <20230224111509.2434694-1-thomas.devoogdt@barco.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zOZRytoWff018qc3DgyWy0Zv4jvCF0OaRC8LWH449/0=;
 b=pwEin9TrIqvGDBDGrEnjM5w+dIhR79sZ2RNVCuxOqYh+NzBtV5T57rFdKUBck2GLJb
 n7xP41N7bJMYOuj1luc6heZdyl9zf9BZPQJXctuR9VOOyBBWmbDFLzllaVS7vy6GCOlJ
 dYwOyX4GI9D1LiXjOu+2zxixXbcvtiPn9Kr7eKgt+xRsEdAVdlXk7usP+m8zMtChSz94
 aJ6xnjsYzzJDud6LSBeQTeZvG4ma8eYGtwC3FM8M8VEPPI7hTdLd6m//54kjx/+T0gKO
 qPDsx/dWkngKNiCp1K1RRRoPOlnKmgEm+FQzRpg4SLaff9VzInxnhFn5/7Snj3FL1B/g
 vEhQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=pwEin9Tr
Subject: [Buildroot] [PATCH v1 3/3] package/wpewebkit: use the CMAKE_NINJA
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
