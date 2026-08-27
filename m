Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD83CC61DC2
	for <buildroot@archiver.kernel.org>; Thu, 27 Aug 2026 21:21:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AD521607A8;
	Thu, 27 Aug 2026 21:21:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hNWmZYnqFhom; Thu, 27 Aug 2026 21:21:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787865697;
	bh=jRgrGtjrUSR7wEaQuHO0IU56ZbarBqmjYiE02Oa+v2w=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=FNyxU6XjUeCaM7y9vH9TS70iHNOLAADrPGM8GgEqBPG9lPjDvVn6t3uXXIunow1mt
	 oS81cnQfB3dD5fnzQfAmoQnzVibxl90fb8lszwkLL74Jj/JIzFBP/pksHi17rIlNuV
	 +wGw7b0pXm5eieymTlGzTHrbXLL6VR/EKgt8TGPbU8ipCC0cyj7p6hWe+MFTao/vGb
	 6DGeuZ7+Z1klSPh7+yizKgRMBY7lVnJrhI7roZCGdOwtjyjuCaF4MBj3k/kmdAJfbZ
	 xUB3dB3ezALAdgPlwilu3yUozcXJFa1JnKuEFgDk1dyJOaVoJZq2tRRvW/dnz+CX/m
	 1Izom4w/WKQRg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D2B72607AD;
	Thu, 27 Aug 2026 21:21:37 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 29253386
 for <buildroot@buildroot.org>; Thu, 27 Aug 2026 21:21:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1B87040379
 for <buildroot@buildroot.org>; Thu, 27 Aug 2026 21:21:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qUSuGzIiotRU for <buildroot@buildroot.org>;
 Thu, 27 Aug 2026 21:21:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::329; helo=mail-wm1-x329.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 012794016F
 for <buildroot@buildroot.org>; Thu, 27 Aug 2026 21:21:31 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-495437bb891so2727895e9.1
 for <buildroot@buildroot.org>; Thu, 27 Aug 2026 14:21:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787865689; x=1788470489;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=+/qQqeIPznjZsIi4OYwZFNoeKVPfDLZIyPPGWSHB/6Q=;
 b=OTOk3hBh0Zr0NUoTZRIX+ToZxQkBtIp7oe5wtad0nPYI0nQerqS2YuPRoN1a4sElaO
 tcS7nODGrwpTHBfqxbexC/JvHxYdw1qLfAv9KN4Cv2UyKwHRJE6+ZATh1B0Jk3ptAK9K
 XrCYRSBnJVk52gpxVw3XkD/eThzaVHixzy4LBBqYh6I6rADHv0y9u7ZyMABj4lExlrKv
 1EFYQJgquB5eqgPV5alBimI0GKJSubRBa8kxiYNAZuhlm2YfxjkJq+55gte1fWXXTC17
 qknkgirF4Ub6/AOo90o4f2YWn1AjvWs3Z7xNgMiuzze3yeyfHbdzAarrdmmbe/iZCZCe
 sf+g==
X-Gm-Message-State: AFuF++mBqMYGySqTisPA07jneDG40BPoQjKHwBBhoYXptCpc3kfwjemz
 dUAw5YJXQnlOh+2cKEpUItoN01fYnhNQQ15VdxuGeuub/3deL6zL7ZLahD1EPU9/lsptGLaW8x6
 fDQRadr8=
X-Gm-Gg: AR+sD13KU31Vx3ht2n/mSlWIs5sMa1ylxxBeoff67+u1AwqzB/xQJSG1VSoiwUI6zy1
 KALIq2H38TV0f/1fxY+AI5KIovx1FVi8mhWKpXkwCqSt4N3+jFktDYE1jccoytIr0uHT17uzo6r
 Q4cHVjruNvdlkz/eWyM0jZevwBANo+U3JfFstRIDrPw1A3pWyxqbsatWrAlwXA3Bt+A2NP5js7Y
 PQF+Ab7FccaNTgS10QGPQw7IGSy8Oy0HVMGYIiw9meV7/nTWZVp/81y+jG50aNaVmzJGdCaZ6Kx
 2fUBLMaIKi4d1O2T6Z/IZt0WJOvAFaSIEsAoh8l5+2Z+F+UF2qO/Ncf88Mg5Ec30D+EYk5jK89e
 MMDWV/JLmAR7W5TMClg1QHJCC0Q13lWHevOf7MVD4qoO7vUtmUP40Rq+ER3O6Ekcvwn7Fij9rVi
 HFG2V7Lm9pIZCvFL/qhIYyvYymHaLp6R35pYgfTr2QraDrgtr3A4vnx6li9+Mfv4DrwfhcuoEIx
 lLgDUVG0rscTd4LWix5j9X5rK5gBYZNER7v1MP5/jPuVGuBelcypTxKt4N55jg=
X-Received: by 2002:a05:600d:8653:10b0:49b:9105:e831 with SMTP id
 5b1f17b1804b1-49b9105e89fmr41259645e9.7.1787865689435; 
 Thu, 27 Aug 2026 14:21:29 -0700 (PDT)
Received: from P-NTS-Evian.home
 (2a01cb0594a2a2002ad9827a59cb148a.ipv6.abo.wanadoo.fr.
 [2a01:cb05:94a2:a200:2ad9:827a:59cb:148a])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-482e27a9945sm11303467f8f.9.2026.08.27.14.21.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Aug 2026 14:21:29 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Romain Naour <romain.naour@smile.fr>
Date: Thu, 27 Aug 2026 23:21:25 +0200
Message-ID: <20260827212125.1988552-3-romain.naour@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260827212125.1988552-1-romain.naour@smile.fr>
References: <20260827212125.1988552-1-romain.naour@smile.fr>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] board/qemu: add xtensa kernel patch
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Romain Naour via buildroot <buildroot@buildroot.org>
Reply-To: Romain Naour <romain.naour@smile.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

-fno-stack-protector must be passed to avoid linking errors related to
undefined references to '__stack_chk_guard' and '__stack_chk_fail' if
toolchain enforces -fstack-protector.

Fixes:
https://gitlab.com/buildroot.org/toolchains-builder/-/jobs/15876432953

Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 .../0001-xtensa-disable-SSP-when-needed.patch | 36 +++++++++++++++++++
 configs/qemu_xtensa_lx60_defconfig            |  2 +-
 configs/qemu_xtensa_lx60_nommu_defconfig      |  2 +-
 3 files changed, 38 insertions(+), 2 deletions(-)
 create mode 100644 board/qemu/xtensa-lx60/patches/linux/0001-xtensa-disable-SSP-when-needed.patch

diff --git a/board/qemu/xtensa-lx60/patches/linux/0001-xtensa-disable-SSP-when-needed.patch b/board/qemu/xtensa-lx60/patches/linux/0001-xtensa-disable-SSP-when-needed.patch
new file mode 100644
index 0000000000..cc19348140
--- /dev/null
+++ b/board/qemu/xtensa-lx60/patches/linux/0001-xtensa-disable-SSP-when-needed.patch
@@ -0,0 +1,36 @@
+From 5358d4e20801ffbb1c0834eab36c003049d4055f Mon Sep 17 00:00:00 2001
+From: Romain Naour <romain.naour@smile.fr>
+Date: Sun, 16 Aug 2026 22:27:28 +0200
+Subject: [PATCH] xtensa: disable SSP when needed
+
+-fno-stack-protector must be passed to avoid linking errors related to
+undefined references to '__stack_chk_guard' and '__stack_chk_fail' if
+toolchain enforces -fstack-protector.
+
+Fixes:
+https://gitlab.com/buildroot.org/toolchains-builder/-/jobs/15876432953
+
+Upstream: Submitted to Max Filippov via email for initial review.
+
+Cc: Max Filippov <jcmvbkbc@gmail.com>
+Signed-off-by: Romain Naour <romain.naour@smile.fr>
+---
+ arch/xtensa/boot/Makefile | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/arch/xtensa/boot/Makefile b/arch/xtensa/boot/Makefile
+index d8b0fadf429a9..dfb758cdb2756 100644
+--- a/arch/xtensa/boot/Makefile
++++ b/arch/xtensa/boot/Makefile
+@@ -9,7 +9,7 @@
+ 
+ 
+ # KBUILD_CFLAGS used when building rest of boot (takes effect recursively)
+-KBUILD_CFLAGS	+= -fno-builtin
++KBUILD_CFLAGS	+= -fno-builtin -fno-stack-protector
+ 
+ subdir-y	:= lib
+ targets		+= vmlinux.bin vmlinux.bin.gz
+-- 
+2.55.0
+
diff --git a/configs/qemu_xtensa_lx60_defconfig b/configs/qemu_xtensa_lx60_defconfig
index d2d6c92faf..a84395a344 100644
--- a/configs/qemu_xtensa_lx60_defconfig
+++ b/configs/qemu_xtensa_lx60_defconfig
@@ -2,7 +2,7 @@ BR2_xtensa=y
 BR2_XTENSA_CUSTOM=y
 BR2_XTENSA_OVERLAY_FILE="https://github.com/jcmvbkbc/xtensa-toolchain-build/raw/95291b7c39e6f790d0b2f062c945a630290f2c81/overlays/xtensa_dc233c.tar.gz"
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_18=y
-BR2_GLOBAL_PATCH_DIR="board/qemu/patches"
+BR2_GLOBAL_PATCH_DIR="board/qemu/patches board/qemu/xtensa-lx60/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
 BR2_SYSTEM_DHCP="eth0"
diff --git a/configs/qemu_xtensa_lx60_nommu_defconfig b/configs/qemu_xtensa_lx60_nommu_defconfig
index 89b73ee1e6..a937112a9e 100644
--- a/configs/qemu_xtensa_lx60_nommu_defconfig
+++ b/configs/qemu_xtensa_lx60_nommu_defconfig
@@ -3,7 +3,7 @@ BR2_XTENSA_CUSTOM=y
 BR2_XTENSA_OVERLAY_FILE="https://github.com/jcmvbkbc/xtensa-toolchain-build/raw/95291b7c39e6f790d0b2f062c945a630290f2c81/overlays/xtensa_dc233c.tar.gz"
 # BR2_XTENSA_USE_MMU is not set
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_18=y
-BR2_GLOBAL_PATCH_DIR="board/qemu/patches"
+BR2_GLOBAL_PATCH_DIR="board/qemu/patches board/qemu/xtensa-lx60/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
 BR2_SYSTEM_DHCP="eth0"
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
