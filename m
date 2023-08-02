Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16F26C001DF
	for <buildroot@archiver.kernel.org>; Wed,  2 Aug 2023 11:15:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 620FE80EB1;
	Wed,  2 Aug 2023 11:15:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 620FE80EB1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WAMsiqoKCvHd; Wed,  2 Aug 2023 11:15:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 98F48813AA;
	Wed,  2 Aug 2023 11:15:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 98F48813AA
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C704A1BF343
 for <buildroot@lists.busybox.net>; Wed,  2 Aug 2023 11:15:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A79BC40166
 for <buildroot@lists.busybox.net>; Wed,  2 Aug 2023 11:15:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A79BC40166
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kme7rB7W5LBc for <buildroot@lists.busybox.net>;
 Wed,  2 Aug 2023 11:15:14 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
 [209.85.128.41])
 by smtp2.osuosl.org (Postfix) with ESMTPS id ABC6740569
 for <buildroot@buildroot.org>; Wed,  2 Aug 2023 11:15:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org ABC6740569
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-3fbea147034so62536575e9.0
 for <buildroot@buildroot.org>; Wed, 02 Aug 2023 04:15:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690974912; x=1691579712;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kq7fW8y6fag92W+YIiwP9VNVAmgX7NvVzi8SUeyjG04=;
 b=g2m7XtQ+gHD4i70kalSaJE+wmX/8BhrYb6x3X9c4WkPIwK4eCS0H1GA3VTJo+Ot+CL
 ShbhemQyL2M7v8yucVvI+7L9EN/yLtW/OzvQks2GLHhDKyZA7Z9s5jNJqaykWdovsUzF
 xqC7CPm5zLaUSdX0Z/8L0xaKgqnzHNqC00EJZ2dPSWeeFlAouzfsLLiZGvRyzGIrcZhy
 SKyFfRGRXqLmRtBXfOruyzu97Keq86r+ireHTZH2m7Oe/Humo/eH36Z2OWyL1zkrE0zZ
 Gm9I5aqcZ5oOuTTmacYFiQhSp1Hg14m0HJJRT9OmPcRysUBq5/YCF//eiu4dWtxZJ0Ly
 r8RA==
X-Gm-Message-State: ABy/qLYdzgfRv3+D1dewpEAcw3r/4bJN5ErXO0n8XLi7WkL1kzgPpiaC
 Irb4o19CGq04yWCAepDNMAr7bfYZdyW0J8VDRxk=
X-Google-Smtp-Source: APBJJlF9q0xZYqtwmsG2DzE8tb+bZiWJLcTIT2WGm5TCt3+dPspkI131rkSYwmx8YMBXlX58gJFYRA==
X-Received: by 2002:a7b:cbd8:0:b0:3fe:228a:e782 with SMTP id
 n24-20020a7bcbd8000000b003fe228ae782mr4504400wmi.37.1690974912047; 
 Wed, 02 Aug 2023 04:15:12 -0700 (PDT)
Received: from KORLIN44614.home ([2a02:a03f:eb68:2f00:d6c7:beba:8b4a:76a7])
 by smtp.gmail.com with ESMTPSA id
 c4-20020a056000104400b003143b14848dsm18653128wrx.102.2023.08.02.04.15.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Aug 2023 04:15:11 -0700 (PDT)
From: Thomas Devoogdt <thomas@devoogdt.com>
To: buildroot@buildroot.org
Date: Wed,  2 Aug 2023 13:14:46 +0200
Message-Id: <20230802111447.41714-3-thomas@devoogdt.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230802111447.41714-1-thomas@devoogdt.com>
References: <20230516082155.22014-1-thomas@devoogdt.com>
 <20230802111447.41714-1-thomas@devoogdt.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v6 3/4] package/wpewebkit: use the CMAKE_NINJA
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
 Samuel Martin <s.martin49@gmail.com>,
 Adrian Perez de Castro <aperez@igalia.com>,
 Thomas Devoogdt <thomas.devoogdt@barco.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Thomas Devoogdt <thomas.devoogdt@barco.com>

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
v5: no change
v6: rebase
---
 package/wpewebkit/wpewebkit.mk | 20 +-------------------
 1 file changed, 1 insertion(+), 19 deletions(-)

diff --git a/package/wpewebkit/wpewebkit.mk b/package/wpewebkit/wpewebkit.mk
index c13a7201e6..135db02b44 100644
--- a/package/wpewebkit/wpewebkit.mk
+++ b/package/wpewebkit/wpewebkit.mk
@@ -14,6 +14,7 @@ WPEWEBKIT_LICENSE_FILES = \
 	Source/WebCore/LICENSE-LGPL-2.1
 WPEWEBKIT_CPE_ID_VENDOR = wpewebkit
 WPEWEBKIT_CPE_ID_PRODUCT = wpe_webkit
+WPEWEBKIT_CMAKE_NINJA = YES
 WPEWEBKIT_DEPENDENCIES = host-gperf host-python3 host-ruby host-unifdef \
 	harfbuzz cairo icu jpeg libepoxy libgcrypt libgles libsoup libtasn1 \
 	libpng libxslt openjpeg wayland-protocols webp wpebackend-fdo
@@ -104,23 +105,4 @@ ifeq ($(BR2_ARM_CPU_ARMV5)$(BR2_ARM_CPU_ARMV6)$(BR2_MIPS_CPU_MIPS32R6)$(BR2_MIPS
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
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
