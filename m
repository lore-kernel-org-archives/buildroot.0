Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79D68C19F20
	for <buildroot@archiver.kernel.org>; Tue,  2 May 2023 22:05:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0654E60F0C;
	Tue,  2 May 2023 22:05:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0654E60F0C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kG2zCJrtm871; Tue,  2 May 2023 22:05:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1DCDB60EB3;
	Tue,  2 May 2023 22:05:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1DCDB60EB3
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0F4551BF3FD
 for <buildroot@lists.busybox.net>; Tue,  2 May 2023 22:04:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DB517409F1
 for <buildroot@lists.busybox.net>; Tue,  2 May 2023 22:04:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DB517409F1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YmaynpuBsFXz for <buildroot@lists.busybox.net>;
 Tue,  2 May 2023 22:04:57 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 541F0409F0
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 541F0409F0
 for <buildroot@buildroot.org>; Tue,  2 May 2023 22:04:57 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-304935cc79bso4398957f8f.2
 for <buildroot@buildroot.org>; Tue, 02 May 2023 15:04:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683065095; x=1685657095;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=UNF2qYmK4EUDmg/p1IoSPGBl6FGl5uCpPiUwCzqlrB4=;
 b=ejUBy1gS/TS10Bv9hIJc+d9TNPNOHKHQqJy2vBwz0boeidK+P9nFouH0XogH3aC8y9
 aRF2bMwBPCDeT+BnK32I2/Nx4k8POiIJgnifyR2SmOH/TmgTbfAFe0+68ZsG+L6INnrQ
 RbKK5zmSZLOQyCH5n0vZe8kZCIRiBHpfpUGqgqmZQL4IG1Ahjz4AW2RTuvxiAufAjk1i
 mKqp0uiVRg5KrKngNA2NBMi5xf5xTOU+c0vK1+fc4bIFxIM5wHTIu5ATkRQqOVr5ZxQj
 5fceajSl4ca333x1COZ0GnCBkXzAw7waduOG1XA79hrEe/Lo6kPvXtrzf0PdiZIr+Pjr
 Bdgw==
X-Gm-Message-State: AC+VfDyLd5zEG1cPjANej/pkI3Q7oRW2xDihyYBWDWBt8G5T0vFxK14a
 I4aJx2HN1CXtlSA+xW/i2AV0HJeKI+0=
X-Google-Smtp-Source: ACHHUZ6WKsxc6kZdEjaMB8Kwj3X5xNAswCFr3qyLIOCLNG8UMc7S8DllYO0mcDrRpKI+lSR6P03wdg==
X-Received: by 2002:a5d:61c6:0:b0:2f8:96f5:cb0f with SMTP id
 q6-20020a5d61c6000000b002f896f5cb0fmr13402603wrv.23.1683065095317; 
 Tue, 02 May 2023 15:04:55 -0700 (PDT)
Received: from P-NTS-Evian.home
 (2a01cb05945b7e009bdc688723a24f31.ipv6.abo.wanadoo.fr.
 [2a01:cb05:945b:7e00:9bdc:6887:23a2:4f31])
 by smtp.gmail.com with ESMTPSA id
 w15-20020a5d608f000000b002fe96f0b3acsm8429899wrt.63.2023.05.02.15.04.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 May 2023 15:04:54 -0700 (PDT)
From: Romain Naour <romain.naour@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  3 May 2023 00:04:51 +0200
Message-Id: <20230502220451.3087471-1-romain.naour@gmail.com>
X-Mailer: git-send-email 2.34.3
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1683065095; x=1685657095;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=UNF2qYmK4EUDmg/p1IoSPGBl6FGl5uCpPiUwCzqlrB4=;
 b=X3+u80+cCpqWPyjDczw3hs61QICGSfLtrwzHnfpIEuGO2a84ZINX+mtQtqoAcW6DdC
 qCSk61QWmQQH+hkHA9dqMHEX4qYZRQsjYIQYMqVRcEAM3bE0egoiNanw72mY4yxq4PkI
 P/0j3kDzpbeY3AfUVS2WNNJe4pjEcIX+cXmPxCfH1zI270rUdldTYCrak/fiyeht63hv
 Ic/WLG1Uj4GhllrIbWmTRKUkkEeLroYYKaivt9qznnLOaYIGcPg9TbmASxUZMpyp0yhm
 Z1BXCTxdIovpQq9USWcGfPvDkM7kUJD/vhE6Mv9sn+81bGvKimnEiRhgXpCpaKc20N5p
 eAhg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=X3+u80+c
Subject: [Buildroot] [PATCH] package/busybox: disable sha1/sha256 hwaccel
 with x86 musl toolchains
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
Cc: Romain Naour <romain.naour@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Buxybox's init segfault when built with x86 musl toolchain due to
recent changes about sha1 and sha156 hwaccel support in Busybox 1.36.0.

From Alpinelinux [1]:
"main/busybox: disable sha hwaccel
 the flag check for this seems incorrect- it triggers sha_ni use when
 the instructions aren't available, but avx512vl/bw is - Elly on irc

 causes failures in github actions, which have avx512 but no sha_no"

The flag check should be fixed upstream by commit [2].

But init still crash with the latest 1_36_stable (with backported patch)
and master branch...

Disable sha hwaccel with x86 musl toolchains until the issue is fixed.

Checked that qemu_x86_64_defconfig with musl for x86_64 for core2 boot
as expected with sha hwaccel enabled.

The same workaround has been applied to openembedded-core [3].

[1] https://git.alpinelinux.org/aports/commit/main/busybox?id=ae2cfdf6f6da3dc46ee09d8ceafa26921f6e058e
[2] https://git.busybox.net/busybox/commit/?id=bd76b75f72f717150b909e8c64edfda725cabe11
[3] https://github.com/openembedded/openembedded-core/commit/22f639d61127f4b82a79008c5305e44e090a3680

Fixes:
https://gitlab.com/buildroot.org/toolchains-builder/-/jobs/4202276721

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 package/busybox/busybox.mk | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index 1633ca525d..eb70f12f86 100644
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -276,6 +276,15 @@ define BUSYBOX_INSTALL_INDIVIDUAL_BINARIES
 endef
 endif
 
+# Disable SHA1 and SHA256 HWACCEL with x86 musl toolchains
+# to avoid segfault with init.
+ifeq ($(BR2_TOOLCHAIN_USES_MUSL):$(BR2_i386),y:y)
+define BUSYBOX_MUSL_DISABLE_SHA_HWACCEL
+	$(call KCONFIG_DISABLE_OPT,CONFIG_SHA1_HWACCEL)
+	$(call KCONFIG_DISABLE_OPT,CONFIG_SHA256_HWACCEL)
+endef
+endif
+
 # Only install our logging scripts if no other package does it.
 ifeq ($(BR2_PACKAGE_SYSKLOGD)$(BR2_PACKAGE_RSYSLOG)$(BR2_PACKAGE_SYSLOG_NG),)
 define BUSYBOX_INSTALL_LOGGING_SCRIPT
@@ -364,6 +373,7 @@ endef
 BUSYBOX_TARGET_FINALIZE_HOOKS += BUSYBOX_INSTALL_ADD_TO_SHELLS
 
 define BUSYBOX_KCONFIG_FIXUP_CMDS
+	$(BUSYBOX_MUSL_DISABLE_SHA_HWACCEL)
 	$(BUSYBOX_SET_MMU)
 	$(BUSYBOX_PREFER_STATIC)
 	$(BUSYBOX_SET_MDEV)
-- 
2.34.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
