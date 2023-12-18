Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21CD1C35274
	for <buildroot@archiver.kernel.org>; Mon, 18 Dec 2023 21:26:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D0507408EA;
	Mon, 18 Dec 2023 21:26:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D0507408EA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XMMj1aXyrStG; Mon, 18 Dec 2023 21:26:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id CF7344015A;
	Mon, 18 Dec 2023 21:26:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CF7344015A
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 729831BF344
 for <buildroot@lists.busybox.net>; Mon, 18 Dec 2023 21:26:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 574DF402F5
 for <buildroot@lists.busybox.net>; Mon, 18 Dec 2023 21:26:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 574DF402F5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kDV7MHFqdmJb for <buildroot@lists.busybox.net>;
 Mon, 18 Dec 2023 21:26:20 +0000 (UTC)
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com
 [IPv6:2607:f8b0:4864:20::436])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 759164004A
 for <buildroot@buildroot.org>; Mon, 18 Dec 2023 21:26:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 759164004A
Received: by mail-pf1-x436.google.com with SMTP id
 d2e1a72fcca58-6d6d48354ccso1146840b3a.1
 for <buildroot@buildroot.org>; Mon, 18 Dec 2023 13:26:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702934779; x=1703539579;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vdGFK9Sgr1DcpaLFQYhc9ftXemYECX5d3esBuog3GQI=;
 b=W3jWFFszwDxz35pdS/YjSPyzSAvjAy375wI+hOCaG4KjsvsjHrHtNsNTtkYLLzgy8P
 VV6pgrrV0sP+UyW5Nt1RmEb2cFJ/K2MoQ2G76vWPgvNF9uKzuRpXlAXDNOPNwnQpw6Tl
 CPXKlU3s8xgKqiluYROyPIhWQjq5lsVSMknSC2BhnvfyRwUXF+4EUmagS71Gu1Ld4zMd
 Lba0U9dJJyuOOgJ11KT4kRf7oNpXnVBu4PI3klTxR2qcIjqIjwCJh9bOO0ik7AW6bOk4
 I8iwmSNtnJBISxXCJ1k06xFxuqIsMPTizfr81DLL0S227FjBAgmcTVQMweUIEOgCY8Mt
 b/CQ==
X-Gm-Message-State: AOJu0YzYlOgjVrULLrM3b7cpbrtZ256PeMS2QFgbLiuNKb6pFI5CPV+e
 T5/X9KWSVCzP1n/dErkq3OixibYkX4JZ7IAqKCI=
X-Google-Smtp-Source: AGHT+IFD7hvYYb73Tu/wMaU3q1A7/ir3r9ZpNIt7Zq4sLVKtWK0WMBc0QOVVgsvJllc5u0CZ7gXlqg==
X-Received: by 2002:a05:6a00:2f88:b0:6d1:dc8:86 with SMTP id
 fm8-20020a056a002f8800b006d10dc80086mr3355209pfb.62.1702934778789; 
 Mon, 18 Dec 2023 13:26:18 -0800 (PST)
Received: from DESKTOP-OI0KN2B.amarulasolutions.com ([174.27.209.61])
 by smtp.gmail.com with ESMTPSA id
 i18-20020a63e452000000b005cd7dd8708dsm4364264pgk.52.2023.12.18.13.26.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Dec 2023 13:26:18 -0800 (PST)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Mon, 18 Dec 2023 14:26:10 -0700
Message-ID: <20231218212613.1201821-3-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231218212613.1201821-1-adam.duskett@amarulasolutions.com>
References: <20231218212613.1201821-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1702934779; x=1703539579;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vdGFK9Sgr1DcpaLFQYhc9ftXemYECX5d3esBuog3GQI=;
 b=nzHJHn47TQcb9NWVf4sBlnsiVRILrTMLQcnaPljmq+HuEjVcOQlSp1ZIsuikfLmn1E
 Vf194W5zgZSajZZdlUSgVDMzihKRhTIbRlzmdhVcrimH2JpH4r7rOz6kWGhLUfTKgrZ0
 W1dEpStQ/vNC09I4opTJtlujseE0BViCuGLBc=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=nzHJHn47
Subject: [Buildroot] [PATCH v2 3/6] package/mender-grubenv: bump version to
 64e32b01d1bf54784d2a290ad0469c583e843864
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
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Adam Duskett <adam.duskett@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Mender grubenv now expects bios installs to be in boot/grub-mender-grubenv
instead of boot/grub/grub-mender-grubenv.

Also, update the LICENSE hash as the year has been updated to 2023.

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 package/mender-grubenv/mender-grubenv.hash | 4 ++--
 package/mender-grubenv/mender-grubenv.mk   | 6 +++---
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/mender-grubenv/mender-grubenv.hash b/package/mender-grubenv/mender-grubenv.hash
index 193bff073b..d44220eadd 100644
--- a/package/mender-grubenv/mender-grubenv.hash
+++ b/package/mender-grubenv/mender-grubenv.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  b7a08eb3d996afb38c1a4f7c51b7eb44aec6197ff713ce75e4f39d5b448cfc82  mender-grubenv-2ac898f5924d5870f8394ad8ecd3ef1ab1422e3b.tar.gz
-sha256  1033348db7606a7e61b6484f293847cf8d7a35766efebb97e304d4bd5d7f3f6b  LICENSE
+sha256  5232988ff3063a5132099807fcc7da9b70f0bf50a5396f763f4113a80284dff8  mender-grubenv-64e32b01d1bf54784d2a290ad0469c583e843864.tar.gz
+sha256  52b2497ce07650b825015e80ca7a5d40c360c04c530234ca6d950b0f98bca23a  LICENSE
diff --git a/package/mender-grubenv/mender-grubenv.mk b/package/mender-grubenv/mender-grubenv.mk
index a6d8d48d43..e733ca592c 100644
--- a/package/mender-grubenv/mender-grubenv.mk
+++ b/package/mender-grubenv/mender-grubenv.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MENDER_GRUBENV_VERSION = 2ac898f5924d5870f8394ad8ecd3ef1ab1422e3b
+MENDER_GRUBENV_VERSION = 64e32b01d1bf54784d2a290ad0469c583e843864
 MENDER_GRUBENV_SITE = $(call github,mendersoftware,grub-mender-grubenv,$(MENDER_GRUBENV_VERSION))
 MENDER_GRUBENV_LICENSE = Apache-2.0
 MENDER_GRUBENV_LICENSE_FILES = LICENSE
@@ -29,14 +29,14 @@ MENDER_GRUBENV_MODULES_MISSING_PC = \
 	$(filter-out $(call qstrip,$(BR2_TARGET_GRUB2_BUILTIN_MODULES_PC)),\
 		$(MENDER_GRUBENV_MANDATORY_MODULES))
 
-MENDER_GRUBENV_MAKE_ENV += BOOT_DIR=/boot/grub
+MENDER_GRUBENV_MAKE_ENV += BOOT_DIR=/boot
 
 define MENDER_GRUBENV_INSTALL_I386_CFG
 	mkdir -p $(BINARIES_DIR)/boot-part/grub
 	cp -dpfr $(MENDER_GRUBENV_BUILDDIR)/mender_grub.cfg \
 		$(TARGET_DIR)/boot/grub/grub.cfg
 	cp -dpfr $(TARGET_DIR)/boot/grub/grub.cfg \
-		$(TARGET_DIR)/boot/grub/grub-mender-grubenv \
+		$(TARGET_DIR)/boot/grub-mender-grubenv \
 		$(BINARIES_DIR)/boot-part/
 endef
 MENDER_GRUBENV_TARGET_FINALIZE_HOOKS += MENDER_GRUBENV_INSTALL_I386_CFG
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
