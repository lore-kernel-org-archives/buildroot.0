Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57CE9C64EC7
	for <buildroot@archiver.kernel.org>; Tue, 28 Feb 2023 15:56:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 03C7F6117B;
	Tue, 28 Feb 2023 15:56:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 03C7F6117B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LdDlhuKgWKa4; Tue, 28 Feb 2023 15:56:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1DDF2611C3;
	Tue, 28 Feb 2023 15:56:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1DDF2611C3
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 28F911BF2AA
 for <buildroot@lists.busybox.net>; Tue, 28 Feb 2023 15:55:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0F879600C4
 for <buildroot@lists.busybox.net>; Tue, 28 Feb 2023 15:55:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0F879600C4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TWtY1AeUYh9N for <buildroot@lists.busybox.net>;
 Tue, 28 Feb 2023 15:55:41 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 053A961183
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 053A961183
 for <buildroot@buildroot.org>; Tue, 28 Feb 2023 15:55:41 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 ay29-20020a05600c1e1d00b003e9f4c2b623so9891291wmb.3
 for <buildroot@buildroot.org>; Tue, 28 Feb 2023 07:55:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=zOZRytoWff018qc3DgyWy0Zv4jvCF0OaRC8LWH449/0=;
 b=SzEL0dz/Di22NUxRi5CfThUw8a0JhSGv9NUdfqHk+5KOf9/w0n0DtdCVV245OV/vna
 NpMzJDxJR9Hx8IjgS9+LbBtkIyX2MYpEsb0TkQruCO0gcRyVuXTmfcSBu8BPThpXvm+s
 IPbIGZR3pkoW2eehdHqp7SGQb4HVtE2dKwLp5jdOs9VfWG0rrGz1ZPwHc5F1AyrEHh74
 bD/2gKGv3GKw2++5/KfDzFltMY1bBDj1y/hagvNBWP4qzxr9HCwXb1emwaUDBzhHsyX3
 cvCQB1TwjZdIGME068r9rhI5ABFkWZurgpsSUbYjPQUIqaUpRCq9HbWIfwhEElrZaRp3
 e9fg==
X-Gm-Message-State: AO0yUKUx0hMrdiYoQ1OCCKXVbEkzyLfPTWIpbPL9be9LZTh9MC7JZYRD
 GYhxoeZulpJpg2erafY1FXWCYF36jmmwCQ==
X-Google-Smtp-Source: AK7set//nTnde1n1NrWTD0xN6LkY3C836E/iYSoKK/Pwmn/exDJlox8/JDajmJBLOUlT6PTPocd0xQ==
X-Received: by 2002:a05:600c:81e:b0:3e2:201a:5bce with SMTP id
 k30-20020a05600c081e00b003e2201a5bcemr2483014wmp.40.1677599740109; 
 Tue, 28 Feb 2023 07:55:40 -0800 (PST)
Received: from thomas-OptiPlex-7090.nmg.localnet (d528f5fc4.static.telenet.be.
 [82.143.95.196]) by smtp.gmail.com with ESMTPSA id
 n17-20020a05600c4f9100b003e876122dc1sm17478968wmq.47.2023.02.28.07.55.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Feb 2023 07:55:39 -0800 (PST)
From: Thomas Devoogdt <thomas@devoogdt.com>
X-Google-Original-From: Thomas Devoogdt <thomas.devoogdt@barco.com>
To: buildroot@buildroot.org
Date: Tue, 28 Feb 2023 16:55:28 +0100
Message-Id: <20230228155528.2430203-3-thomas.devoogdt@barco.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230228155528.2430203-1-thomas.devoogdt@barco.com>
References: <Y/4etrPX5MZiUpdq@donbot>
 <20230228155528.2430203-1-thomas.devoogdt@barco.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zOZRytoWff018qc3DgyWy0Zv4jvCF0OaRC8LWH449/0=;
 b=OTKHEw4HpiayJLEDsiDOzooX7v1jblPZvZZyrN7D5H+enRYAoJikW6A+3r61UGJjWv
 xFG9Yzzj7NKzpGCzivY/gmjQRSonv6v1+rfiun4kzU9GseqSz4wxBVqFMF2nwbYbGASW
 L9vACyK7xE/Z0VuVhjjxNGJhWevAORVE8g3TKl0zZRzrujG6eJrS1CsbTBjNnQFXQ3vE
 eazeeI6HqVePmzSEu33YtUfj9Bm/KKH8/qkirv++DM6OFDroNTwibqOQrxaZSWok/gpC
 dgyjhIlaDMYm83vvOY2OdpBE+7L/AC20RyKdzyUy0OJZn2beTxCIQMI/pSiDr0pq3IG/
 vh/Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=OTKHEw4H
Subject: [Buildroot] [PATCH v3 3/3] package/wpewebkit: use the CMAKE_NINJA
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
Cc: Thomas Devoogdt <thomas@devoogdt.com>, Samuel Martin <s.martin49@gmail.com>,
 John Keeping <john@metanate.com>, Thomas Devoogdt <thomas.devoogdt@barco.com>,
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
