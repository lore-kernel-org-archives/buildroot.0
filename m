Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABF58CA5FDD
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 21:06:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 57AE5606CE;
	Sat,  3 Oct 2026 21:06:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id saxvvmCguaJM; Sat,  3 Oct 2026 21:06:34 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 58FFC6064E
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791061594;
	b=Lg/YFYZzRBl7TL5V3zBsXff1VazpqxdXBnAQR+ghkcUOeVz6400aiIkzTgO7GG90IGEv
	 F+gidTTHzn+eLKlUnIO2zP5p4w4O3wZDWcK+ZE5d7EADEAefYte4/y6xxvUkE7iHI0alr
	 JBbwf/tUyrTn872Exr0TOv6V7Jt+Oq+T4FsdRgv25LjAZf4ZRcXwrIghmhLhfZkY/Um0E
	 7sdLrym1bzrD1sCTpy7SAPggnvz9Wi2GFP7tUIUaVgaFbMDjUNMf88BL8fPG7cxBQtNiT
	 ANxB5iNP31CqqU1OH/uun7VCk8O0MiUHXQEwix3yQeGayR1zsWXpil0uoRRwUdm2f8Q==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791061594;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Cc:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=FZmXoVIUpDM57J4VfZBbzLiMhGFxnITTcOa59TEup58=;
	b=gMydhNI21oNIAtkt7wESvg89/8oRGLxntNRD2sn7gyr/l9SYBZ9zp3Wczy6zGBEWNP+g
	 3XlO9xg79SQuithVMwnUzE2PkoisjNkPvV77TtSSnj80BjFB2JkN0BZE4jlwIOyBvW9J7
	 ikhzqWGNh+BZ0kf+6osfxFsPBpcbFysu/EeovFr3rnxtlFRnr8s5srdYMexyNCxG7pein
	 kt8OAByIPWOGvup7GHcqkagqoNQbtPVUV26E4aR5QidnficXnVDaG5ZQ2CK52tbSmEoJg
	 uYLMDaKkgneA+z4Gkv2Uu2+UakFgDDFu+J9ho25Ir4fwDPUPRLCglcMniURhHyHSV+A==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791061594;
	bh=FZmXoVIUpDM57J4VfZBbzLiMhGFxnITTcOa59TEup58=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=TZfLij4mCjC0WwzKErZIdQkZBeAvgPmRSnOaSK//CD0qrf8mcTb8/lgsKjW3Clr7b
	 K1jdrSLeMG+KtOsHJmhFlHYTcCnzMybbBonZqZ5U1AWEaWh7ch+40U0TZTJ7l7KF+N
	 1uvGlB+6dg8a/x9bSljSD+CzqG3d17V5qRSKkWqzWwkuYjdZ5y7I5tYQEvDUZozWnB
	 g5+lzsw/BqMGssOwK4SSnKeNnKykB11D/dIh2XmlnsxmQZ15vU8g5J9s1Ga4pG0Vfl
	 y7kr1f6RfGTO3LCKK7eQPpl5BEFg2Jhl7dgjlxvBVIjf2nwlOR4V53FZKGfPX/L3YF
	 xt5l74nqZtgEg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 58FFC6064E;
	Sat,  3 Oct 2026 21:06:34 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id ACCA01A6
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 21:06:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9D98840EAD
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 21:06:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mWg-oI95pjAz for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 21:06:31 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 3754C40836
Authentication-Results: smtp4.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:31::10"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791061591;
 b=E+mSVAcFtX1bFeMzQJ1K6rlnQWbdOzngYFjSFs48xve828YNMWsRzBHH6QtjfqkiyyuR
 i77OFgDIpxRrlKnB6cYfrFmpZA8Cfp3QYutOjpEN2AHKYUIrMv1slcaIiNBvpTzqyfR4O
 QAMGaMVAeuZ5jKpN70Vj71XvLi5Zr60qsIpDN4o0JLzC2Pj6qInVXvlQWm8RuV5RsLwkf
 7GFLozXYmKRx5TNccq2OTh//bWFupe+ZzvbvvqhCKKUmGCLqs32eSQ0LHVwtKCiQvYdgS
 zHfcsMkkPPjm9uFPkACXo2/nd7WVyAFM6QYf+0t5eQg7wKS7OK79V5OAhiWVsOxaWpA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791061591;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=MvPfVJyhisCkxuMO8tTDLc2CUfp2sOEungKjocJwkdg=;
 b=DS30F7fdsUgtcoggZ4vKubU3rxpdAV3cNiW1p3tOXk8oK9NNp5V2ZdcE8in2P5aAnZ0f
 zm6K5VbADU+NaNq/+XNDwSXfRpgTJHP2++jgcOoUIYmk7BiK75OMfypUOtta9uuquYGaB
 aUJWpHv0QvxUl/6obMk1/MExOJXJJeOi0Lste+xl39BjWj6LIaTqhObiFKOmw1EbQhSMk
 6n+VYq0LPFVjqumo4/I20lM4x7E+nawEWa9QKfT2NlObkahlKrwnLZ6ZJXltjRw1ha37p
 zoryZtvRywYfDZg6aw9iQ7CyY2X0imd4TwfMo/udkp3vpfwNPNwwp9iImnwrDjXgDIw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=gmail.com; 
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=Qk4zFEys; 
 arc=none smtp.remote-ip="2a00:1450:4864:31::10"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:31::10; helo=mail-wm2-x10.google.com;
 envelope-from=alexander.sverdlin@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp4.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=Qk4zFEys
Received: from mail-wm2-x10.google.com (mail-wm2-x10.google.com
 [IPv6:2a00:1450:4864:31::10])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3754C40836
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 21:06:30 +0000 (UTC)
Received: by mail-wm2-x10.google.com with SMTP id
 5b1f17b1804b1-4a16bc7ad39so885535e9.1
 for <buildroot@buildroot.org>; Sat, 03 Oct 2026 14:06:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791061586; x=1791666386; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=MvPfVJyhisCkxuMO8tTDLc2CUfp2sOEungKjocJwkdg=;
 b=Qk4zFEysVKvZ435KmixIadAo+wA6Oa8Lu/j3X/+g6U/PM4wEHnUh5i9WMg48Nu+Zqn
 bfaKiqTgjHPEjiMB6WBncfyZWPRT8PdLgsAlbMQR6tLwc888+4jBmv30f76bzBgUOREt
 q4w6C1z0wZrkDZoKC8c1CE2iL5YYq9AgiKlrge9acKoAxyTSKrZApcOcr2l2Numznazl
 41vFoij4eRoXBPOzyz3IaPEOw73m121pkYOE07VlYMFA2K2WoHm96r2qkI/4sJOmn0jh
 ds95cJ3LOjPQaWRiPFOMAv6Vneoh3oA7NPuDpQ1/EI6x9Amlto2XSveDW8MiZB9wOvEM
 d/pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791061586; x=1791666386;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=MvPfVJyhisCkxuMO8tTDLc2CUfp2sOEungKjocJwkdg=;
 b=cy+fqUIUfVrfNv9rsuUZteINHGGKo34JCF6wuI99nnSzr8/BMXbzbyN4Eutym7R21+
 ywf6DiIDchRl7JwjtqirMmp38wTvFYDieeq09jxZkmG/aCa2EIzMAgOa90zJdWixsZ00
 FO1yr5PXpfvYUfD/bJnFlFv2cSGICjb99wHUFgAA7+JXBWZB7pPX14AjK3SdOzM0VXg4
 ZlokBtOlsxS7OU14xXf4xxik6fsWZVl/4FF39FsuDqUPNYbcoqiKNc7TZ+9btCazll1y
 9rDPcjDBCHOobOd4m3UnGMT8tNWByfZnuHIzopjyNB7pX/5bJeqY5ljJKktqhIiwSm2x
 OJng==
X-Gm-Message-State: AFuF++l/KO7HQWW2mjd+fQrYSgv+CEqhMFQL6s2XtWOnl2L4tpT+Dm8H
 fb6lquzmhxTCRheJUA+vS8lWamsJZ5K1k3dB6NDV8IQN8pRYMVgCtOf7NZdiDg==
X-Gm-Gg: AYBFou2Sv/z1B59SNiwpaq72k4JzCOXFtT6siDIgkY43Y4qVlJ78Tob9+66SX28kbz3
 0B4PyXUT2+wpb9yosX0DF/mK6ZmlCfwuSO0bSFMCoSGUwKtjQaRNq4Lktig3wU3ldnRwar2vsHF
 4MgtLBQwBwOtONnfSNmA96lEHt75Q9FEw3LgGwDICKmSPAEaP0hJZo+1DDvWp2dr/qNTdlKDvjo
 KSV7WGUo10kaCXwSPlbSmiLB43NHgmMlaq//3CvlZOza3UAzl9b6fCdrnwuvSxTrDOtMa2CQl+h
 E/bhXrTEOQupM4AnpopefTXjY7MHNuF6C3cGlihCoRUkWt23QkmzzECjAjRSu0EkjPOAPrsn+At
 oSvc+KJoMKlIYE455qKTfccey3FMHC1jnTBtT1pABeyfLjVLXvioLjJbPltxiKV8iQuMJGeXWZ1
 zDoPYxtEbN5yzMCQt1fN12vX0CEAG1ZsKqX9hkYvAgMTxFQzaTadJ+hPcBrX9cVAJvn/X8fisHP
 gCCI5zz/NToKYm2QfJMhTWegd+BWxfM7X8ZYA==
X-Received: by 2002:a05:600c:1e24:b0:49f:ffa2:1c72 with SMTP id
 5b1f17b1804b1-4a0275507d7mr110510595e9.11.1791061586134; 
 Sat, 03 Oct 2026 14:06:26 -0700 (PDT)
Received: from localhost.localdomain
 ([2a02:1210:8642:2b00:82ee:73ff:feb8:99e3])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48b82253dc9sm14692255f8f.3.2026.10.03.14.06.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 03 Oct 2026 14:06:25 -0700 (PDT)
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: buildroot@buildroot.org
Cc: Alexander Sverdlin <alexander.sverdlin@gmail.com>,
 Romain Naour <romain.naour@smile.fr>, Vincent Jardin <vjardin@free.fr>
Date: Sat,  3 Oct 2026 23:06:12 +0200
Message-ID: <20261003210614.1376879-1-alexander.sverdlin@gmail.com>
X-Mailer: git-send-email 2.56.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v3] boot/uboot: support custom DTS with
 CONFIG_OF_UPSTREAM
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Since U-Boot 2024.07, boards with CONFIG_OF_UPSTREAM build their device
trees from dts/upstream/src/<arch>/<vendor>/ instead of arch/<arch>/dts/,
so the files copied by BR2_TARGET_UBOOT_CUSTOM_DTS_PATH were misplaced.

Derive the destination from the U-Boot configuration, including the vendor
sub-directory taken from CONFIG_DEFAULT_DEVICE_TREE.

Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
---
Changelog:
v3:
- reduced verbocity and duplication in the commit message, help text and
  code comments
v2:
- handle *u-boot.dtsi separately
- document the new behaviour with OF_UPSTREAM-enabled U-Boot builds
- https://lore.kernel.org/all/20260913133520.3423773-1-alexander.sverdlin@gmail.com/
v1:
- https://lore.kernel.org/all/20260901145225.579733-1-alexander.sverdlin@gmail.com/

 boot/uboot/Config.in |  5 ++---
 boot/uboot/uboot.mk  | 25 ++++++++++++++++++++++---
 2 files changed, 24 insertions(+), 6 deletions(-)

diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
index 1eabd10407..c6cddee1a2 100644
--- a/boot/uboot/Config.in
+++ b/boot/uboot/Config.in
@@ -802,9 +802,8 @@ if BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG
 config BR2_TARGET_UBOOT_CUSTOM_DTS_PATH
 	string "Device Tree Source file paths"
 	help
-	  Space-separated list of paths to device tree source files
-	  that will be copied to arch/ARCH/dts/ before starting the
-	  build.
+	  Space-separated paths to device tree source files to copy into
+	  source tree before building.
 
 	  To use this device tree source file, the U-Boot configuration
 	  file must refer to it.
diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index 5b3f46ac74..05972f6a79 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -426,10 +426,29 @@ endif # BR2_TARGET_UBOOT_BUILD_SYSTEM_LEGACY
 
 UBOOT_CUSTOM_DTS_PATH = $(call qstrip,$(BR2_TARGET_UBOOT_CUSTOM_DTS_PATH))
 
+# Linux uses arm64 where UBOOT_ARCH is arm.
+define UBOOT_INSTALL_CUSTOM_DTS
+	arch_dir="arch/$(UBOOT_ARCH)/dts"; \
+	dts_dir="$$arch_dir"; \
+	if grep -q "^CONFIG_OF_UPSTREAM=y" $(@D)/.config; then \
+		if grep -q "^CONFIG_ARM64=y" $(@D)/.config; then \
+			dts_dir="dts/upstream/src/arm64"; \
+		else \
+			dts_dir="dts/upstream/src/$(UBOOT_ARCH)"; \
+		fi; \
+		dt=$$(sed -n 's/^CONFIG_DEFAULT_DEVICE_TREE="\(.*\)"$$/\1/p' $(@D)/.config); \
+		case "$$dt" in */*) dts_dir="$$dts_dir/$${dt%/*}";; esac; \
+	fi; \
+	for dts in $(UBOOT_CUSTOM_DTS_PATH); do \
+		case "$$dts" in \
+		*u-boot.dtsi) cp -f "$$dts" $(@D)/$$arch_dir/;; \
+		*) cp -f "$$dts" $(@D)/$$dts_dir/;; \
+		esac; \
+	done
+endef
+
 define UBOOT_BUILD_CMDS
-	$(if $(UBOOT_CUSTOM_DTS_PATH),
-		cp -f $(UBOOT_CUSTOM_DTS_PATH) $(@D)/arch/$(UBOOT_ARCH)/dts/
-	)
+	$(if $(UBOOT_CUSTOM_DTS_PATH),$(UBOOT_INSTALL_CUSTOM_DTS))
 	$(TARGET_CONFIGURE_OPTS) \
 		PKG_CONFIG="$(PKG_CONFIG_HOST_BINARY)" \
 		PKG_CONFIG_SYSROOT_DIR="/" \
-- 
2.56.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
