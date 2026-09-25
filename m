Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43A04C9830D
	for <buildroot@archiver.kernel.org>; Fri, 25 Sep 2026 14:56:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F3A3E60D9B;
	Fri, 25 Sep 2026 14:56:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8tw3z97uIbe2; Fri, 25 Sep 2026 14:56:53 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 7CBDC60DA5
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790348213;
	b=j6skOzFvAxXv1tjKIRgtdZnRzwIhbPS8GA/5nvwuCga9HyGmYz0kCErAbsEELGi701zo
	 Uc9IFc9dVnmKAWqojdm/LmwfRDoA7Xdf+FMWr+VGst1XirOVV0GIt7ocOvqGx4DSIWDvO
	 IeFs6i9R0iNyqiFDg3bmLf5gFv4UYY2emXgLcN5KIme0ou28iXtrPaGYL9o0NJRriquoQ
	 eMSpXHe0X0sR4RAQohJeOlu1i8UJ/RdhAuvHVepqE/Mc2fpZ7Aj2JH8vQ1Yy69al9Dh1k
	 rfhJ3kBx6nOGv3DYFBTaS8qS+HwZmBAilaXS65+Nj96sp6kn9qVGmBubZ2c7RV2nHLg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790348213;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Cc:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=eMDnVxhm9E5gd1JaMTGhwBdGBv9SkSBNLYGZNZ+gvUY=;
	b=kcpcAHujSSNeRMHJLOfR/j8BKmPPiGjcUs4HcsJCXT03uYp9TWjf9aLonHabfjCGNQ7r
	 1ZGgcR+qOgotpwIO8BWuKMxZd0IA+rx1iI9a0uEHMDzEBwWoI5cND4/a9A6k2Y6Gn4YRn
	 NeJCea0/YQRifJAKLzPnc0bw1LieA1wyjbH5FUJCG9hbMaH1cPU0Pdg+xq2Z5nqnoSIhQ
	 /vCIcS/Dfg3aMWsJnraAdQFwffod2IXZW9VXYVzHir9fok6z2ZLAnzbwFuqn5wsK+CMnF
	 wEXEQK0OosEJADfWRGFX+t8bt+sy4l9ykfLaRMS3ImalundBukQYZBWV2WTHQ0EQNXQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790348213;
	bh=eMDnVxhm9E5gd1JaMTGhwBdGBv9SkSBNLYGZNZ+gvUY=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=h+EGXIFjFectBV1abAjtJ5PvxdBF/F1ZGhdc8y97gzHQGWMlmzcgNoNasDfqJwQHt
	 b66uG24lbuvSBOWpMo/bPsLIA/lG+J6XDYwVtHnsN/fzcd/JjMptOFDWYypu9Epoec
	 7eFmXBVIYQgmjx/PX5t6lRSR6hIg7MWhS8AfCi2K93kIbe5QsAncT4iHsRbMz+k0CS
	 MKEDNOJWAUBb2lCXDyY13Yj9kgXSJ7moNR4+KHOK1gXDg53I9cIRoBOGB9RZyzFCT+
	 FXKJ7395T6lDx5tyLOoySlAf3aRjrnEgbhFShq6NotNT/pLwfl7Gj0ZcJSPxqf8j1X
	 SMz7Bc1ntkL3A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7CBDC60DA5;
	Fri, 25 Sep 2026 14:56:53 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id BF624332
 for <buildroot@buildroot.org>; Fri, 25 Sep 2026 14:56:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B175840CBA
 for <buildroot@buildroot.org>; Fri, 25 Sep 2026 14:56:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6gGko8owj3L9 for <buildroot@buildroot.org>;
 Fri, 25 Sep 2026 14:56:50 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 1469640CB7
Authentication-Results: smtp4.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:30::10"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790348210;
 b=cITnb9W3rHBoKHThK0xDEkQ1w0TKEx/vLHqidSgOYnFpHv1NWbnICk6hr55163x//JkS
 KcAaq1n7DEfcZb4TaXOlpdzLakn4P9dJR00yJLt2JsfT0Eg/1EV57EgkkGytesoFB1nJA
 kZJmpXElbHpYx+0PeqO1vdHiQxI7TmkCvI/whbxRXn3btyvgGGrm765KH4HHsycC3IKaO
 AsIFE3uL0wVoCZDkSSE5YlNyAwu34C5+hKSQBEnFOi7WS5YB0zoB4pMiPn0CmyH4Grn0+
 d1KQMlmAnw8UjkhHNdwBmGmKLExIyqvLUvEmJf57TKeOyHZXBdqtgLryJeyHR8z2Nuw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790348210;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=yihFOTSrHiEnwMoSk1LoBfkVCPp5PJC3C2sIFumavFI=;
 b=W4pBB6CHUIFuy4RpvYw3Hre4iUGGfG2gCUKrEXcb5EAc78qfL9hAlhs5MEkhx0xSTObS
 jTB2cJT1CTg/w/IaMXf+vs8VL24Xu4F3MzRo+EVG9TEIMjRCQNy7sXp/7jVZ3PVsHohrn
 bj80l2V+nOO85HmairIUfHgsVNvZ8zLv7KZIB+t0BMdw4xMyaGMCnkr75hpCX94zRSPq4
 4xV5QcXeFacugjprUk3YOzTNXgNYUqAr/e8XhePhsR4Pp7LCzwi2DIACwTJiwzpjKf36t
 jcV04r8FAfmVLFMG0/RpUppzDRhcPvjvJHOls8NN8vb3nYpIZ8K+hroWDDqEMA2IgAw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=none header.from=vodden.com; 
 dkim=pass header.d=vodden.com header.i=@vodden.com header.a=rsa-sha256
 header.s=google header.b=JoPUG740; 
 arc=none smtp.remote-ip="2a00:1450:4864:30::10"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:30::10; helo=mail-wr2-x10.google.com;
 envelope-from=richard@vodden.com; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none) header.from=vodden.com
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=vodden.com header.i=@vodden.com
 header.a=rsa-sha256 header.s=google header.b=JoPUG740
Received: from mail-wr2-x10.google.com (mail-wr2-x10.google.com
 [IPv6:2a00:1450:4864:30::10])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1469640CB7
 for <buildroot@buildroot.org>; Fri, 25 Sep 2026 14:56:49 +0000 (UTC)
Received: by mail-wr2-x10.google.com with SMTP id
 ffacd0b85a97d-4843c3ea1f6so551047f8f.0
 for <buildroot@buildroot.org>; Fri, 25 Sep 2026 07:56:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=vodden.com; s=google; t=1790348207; x=1790953007; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=yihFOTSrHiEnwMoSk1LoBfkVCPp5PJC3C2sIFumavFI=;
 b=JoPUG740AmhLi466+iFiIZQ1Yevtqt1kD+qfFiXVNBaUY7ynL9qVxy85+tdJCAClq9
 mekLhjyCYHGws6qMh8DGhuotXd/hZDKt7QkCLyNs3E4GYaXo5fUEZyW9/hDQ1Da4aN9n
 qj2Jzn1SzOyVvePgoMjMe1Ev6V1qwRaDQJXN4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790348207; x=1790953007;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=yihFOTSrHiEnwMoSk1LoBfkVCPp5PJC3C2sIFumavFI=;
 b=nKV80rou0OAMUJ3aNq2Mf8nAjO6SI+ZuqZIzT8sBwgOmWJ69ADJaBxCWsWotjVxDGt
 UT1p1nK7CeI3lfhGKUunW6EVVrl4DFHwhqwBDl/pfWhle1Lc5liXZwJrOWDjQFBMcLXj
 Jk6Imjru9t8kjrAHzVeL+pRcGruIvTAygrpaCPtpcIDsa0ljj7qFAlxsRaytloNPW0JU
 IRXJwVQYvlS6L7I4NcUev8SVWPPONM61u5HjY+/u/9VWqVQ5NCLR4CXgKgLhIwQt928r
 rNS2iT/Ga6A5jG8cnjQrTsU2kgD53T5mE9bAi4h7G9BQ8Tr14+ap5BKq4SjDJYTjHBLI
 Lvdg==
X-Gm-Message-State: AFuF++mIVcRjbS7A6EqyHpeFcd22sKaRpfgFUu2GEe6oXurQQCAxKmvM
 DeR3Er1QnHsNfVCnNMZJeSslFpNLUCEKGhacUuqbPcygjo3n2yE3VTgrLWubbSSlkO9Z+nHJBEA
 XsWXvy277kA==
X-Gm-Gg: AYBFou0LQjT8GZCy278nV6cTKbtLIiYvYaiFDI2Puoq9mJPnqBcTQTVDaboKyHZ4YII
 u25uzpV8jCvrKd9BoJRYbY1sev2ySr0nDWL1LZuKsCF36wcdZ36RRvJGwQ3xnyC9ojhGjtaKUkh
 QLOQVCj5LXP8uToXhh/X8GstrE5chW/u2MiJNg/S+ty04MSn1uRAydeSECDlZFSfZEEvAr3927q
 oOt/6V7ZucaEKUAPwWKZeTkapJP8/5a8m33nhWJ9ZQduJwE9+RR2u40LdWMVEuNzkqLE6SgS7lC
 NXBQoxOYbEZGZGUn+aV4LRA42x2PiZQGUrE2BYHAqxM62vPXdYtUMQw0Tmii9dYapNOGkOi7cWE
 1g05V06XLFm8CQBFLXCk9+3QQJWImMtnZ10nITYIeAFp+o7zeYKoAkvtYQKhv/9INGfIPI8q0Ur
 SHANFQEEIyQizo9NEI6gGI7lCjHB6gv7hvlbtivH9N22TnHzRtvV4BopVT1GIKrGojivTe1z9WK
 y9VUBx5vTlUGlLPBGfNbFn+gjn/7YShYOQvqHKBv0LdDmbxg71Rt+aq3omEdUkhwAVaq7o+GOQ=
X-Received: by 2002:adf:e19e:0:b0:488:8132:1429 with SMTP id
 ffacd0b85a97d-4888132168fmr3360902f8f.20.1790348207441; 
 Fri, 25 Sep 2026 07:56:47 -0700 (PDT)
Received: from LargePixelCollider.localdomain ([154.61.62.140])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4887a3625ccsm8046779f8f.22.2026.09.25.07.56.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Sep 2026 07:56:47 -0700 (PDT)
From: Richard Vodden <richard@vodden.com>
To: buildroot@buildroot.org
Date: Fri, 25 Sep 2026 15:55:20 +0100
Message-ID: <20260925145521.54655-2-richard@vodden.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260925145521.54655-1-richard@vodden.com>
References: <20260925145521.54655-1-richard@vodden.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH RESEND 1/2] boot/opensbi: allow building against
 an external platform
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
Cc: Leo Yu-Chi Liang <ycliang@andestech.com>,
 Alistair Francis <alistair@alistair23.me>, Mark Corbin <mark@dibsco.co.uk>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Kanak Shilledar <kanakshilledar@gmail.com>, Julien Olivain <ju.o@free.fr>,
 Richard Vodden <richard@vodden.com>,
 Francois Dugast <francois.dugast.foss@gmail.com>,
 Thomas Bonnefille <thomas.bonnefille@bootlin.com>,
 Romain Naour <romain.naour@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

OpenSBI can build a platform that lives outside its source tree by
setting PLATFORM_DIR. For a board whose platform is not upstream, that
is considerably simpler than patching a platform directory into the
OpenSBI source or maintaining a custom tarball.

Replace the BR2_TARGET_OPENSBI_PLAT string with a choice of reference
platform, external platform, or no platform, and pass either PLATFORM or
PLATFORM_DIR accordingly. When PLATFORM is unset OpenSBI derives it from
the basename of PLATFORM_DIR and builds into build/platform/$(PLATFORM),
so OPENSBI_PLAT is set to that basename in order for the install step to
find the firmware. A trailing slash on the directory is stripped, as
$(notdir) would otherwise yield an empty string.

The three conditionals that previously tested BR2_TARGET_OPENSBI_PLAT
against the empty string now test !BR2_TARGET_OPENSBI_PLAT_NONE. Leaving
them referring to the removed symbol would have silently disabled
BR2_TARGET_OPENSBI_INSTALL_JUMP_IMG and INSTALL_DYNAMIC_IMG, producing
no firmware at all.

The in-tree defconfigs that set the old symbol are converted, and a
legacy entry carries an existing value over to the reference platform.

Signed-off-by: Richard Vodden <richard@vodden.com>
---
 Config.in.legacy                        | 18 ++++++++
 boot/opensbi/Config.in                  | 55 +++++++++++++++++++------
 boot/opensbi/opensbi.mk                 | 16 +++++--
 configs/andes_ae350_45_defconfig        |  3 +-
 configs/hifive_unleashed_defconfig      |  3 +-
 configs/hifive_unmatched_defconfig      |  3 +-
 configs/nezha_defconfig                 |  3 +-
 configs/pine64_star64_defconfig         |  3 +-
 configs/qemu_riscv32_virt_defconfig     |  3 +-
 configs/qemu_riscv64_virt_defconfig     |  3 +-
 configs/sipeed_lichee_rv_defconfig      |  3 +-
 configs/sipeed_lichee_rv_dock_defconfig |  3 +-
 configs/sipeed_licheepi_4a_defconfig    |  3 +-
 configs/spike_riscv32_defconfig         |  3 +-
 configs/spike_riscv64_defconfig         |  3 +-
 configs/visionfive2_defconfig           |  3 +-
 16 files changed, 100 insertions(+), 28 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index bb6257f5..e6f0ba1b 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,24 @@ endif
 
 comment "Legacy options removed in 2026.11"
 
+config BR2_TARGET_OPENSBI_PLAT
+	string "OpenSBI platform has been replaced"
+	help
+	  The OpenSBI platform is now selected with the "OpenSBI
+	  platform type" choice, which additionally allows building
+	  against a platform directory kept outside the OpenSBI source
+	  tree.
+
+	  Select "Reference platform" to keep the previous behaviour;
+	  the platform name has been carried over automatically.
+
+config BR2_TARGET_OPENSBI_PLAT_WRAP
+	bool
+	default y if BR2_TARGET_OPENSBI_PLAT != ""
+	select BR2_LEGACY
+
+# Note: BR2_TARGET_OPENSBI_PLAT is still referenced from boot/opensbi/Config.in
+
 config BR2_PACKAGE_LIBCPPRESTSDK
 	bool "libcpprestsdk has been removed"
 	select BR2_LEGACY
diff --git a/boot/opensbi/Config.in b/boot/opensbi/Config.in
index 6e26da63..2f4713b1 100644
--- a/boot/opensbi/Config.in
+++ b/boot/opensbi/Config.in
@@ -72,25 +72,56 @@ config BR2_TARGET_OPENSBI_LICENSE_FILES
 	  A space-separated list of license files related to the OpenSBI
 	  package.
 
-config BR2_TARGET_OPENSBI_PLAT
-	string "OpenSBI Platform"
-	default ""
+choice
+	prompt "OpenSBI platform type"
+	default BR2_TARGET_OPENSBI_PLAT_REF if BR2_TARGET_OPENSBI_PLAT != "" # legacy
+	default BR2_TARGET_OPENSBI_PLAT_NONE
+	help
+	  Select whether to build against a reference platform shipped
+	  with OpenSBI, or a platform directory kept outside the OpenSBI
+	  source tree.
+
+	  With "No platform", only the platform independent static
+	  library libsbi.a is built. Otherwise the platform specific
+	  library libplatsbi.a and the firmware examples are built too.
+
+config BR2_TARGET_OPENSBI_PLAT_REF
+	bool "Reference platform"
+
+config BR2_TARGET_OPENSBI_PLAT_EXT
+	bool "External platform"
+
+config BR2_TARGET_OPENSBI_PLAT_NONE
+	bool "No platform"
+
+endchoice
+
+config BR2_TARGET_OPENSBI_PLAT_REF_NAME
+	string "OpenSBI reference platform"
+	default BR2_TARGET_OPENSBI_PLAT if BR2_TARGET_OPENSBI_PLAT != "" # legacy
+	depends on BR2_TARGET_OPENSBI_PLAT_REF
+	help
+	  Name of a platform shipped with OpenSBI, as found under its
+	  platform/ directory, e.g. "generic".
+
+config BR2_TARGET_OPENSBI_PLAT_EXT_DIR
+	string "OpenSBI external platform directory"
+	depends on BR2_TARGET_OPENSBI_PLAT_EXT
 	help
-	  Specifies the OpenSBI platform to build. If no platform is
-	  specified only the OpenSBI platform independent static
-	  library libsbi.a is built. If a platform is specified then
-	  the platform specific static library libplatsbi.a and firmware
-	  examples are built.
+	  Path to an out-of-tree platform directory, passed to
+	  OpenSBI as PLATFORM_DIR. OpenSBI derives the platform
+	  name from its basename, so a trailing slash is tolerated
+	  but redundant.
 
 config BR2_TARGET_OPENSBI_INSTALL_DYNAMIC_IMG
 	bool "Install fw_dynamic image"
-	default y if BR2_TARGET_OPENSBI_PLAT != ""
+	default y if !BR2_TARGET_OPENSBI_PLAT_NONE
 	help
 	  This installs the fw_dynamic image.
 
 config BR2_TARGET_OPENSBI_INSTALL_JUMP_IMG
 	bool "Install fw_jump image"
-	default y if BR2_TARGET_OPENSBI_PLAT != ""
+	default y if !BR2_TARGET_OPENSBI_PLAT_NONE
 	help
 	  This installs the fw_jump image.
 
@@ -102,7 +133,7 @@ config BR2_TARGET_OPENSBI_INSTALL_PAYLOAD_IMG
 
 config BR2_TARGET_OPENSBI_LINUX_PAYLOAD
 	bool "Include Linux as OpenSBI Payload"
-	depends on BR2_TARGET_OPENSBI_PLAT != ""
+	depends on !BR2_TARGET_OPENSBI_PLAT_NONE
 	depends on BR2_LINUX_KERNEL
 	depends on BR2_LINUX_KERNEL_IMAGE
 	select BR2_TARGET_OPENSBI_INSTALL_PAYLOAD_IMG
@@ -111,7 +142,7 @@ config BR2_TARGET_OPENSBI_LINUX_PAYLOAD
 
 config BR2_TARGET_OPENSBI_UBOOT_PAYLOAD
 	bool "Include U-Boot as OpenSBI Payload"
-	depends on BR2_TARGET_OPENSBI_PLAT != ""
+	depends on !BR2_TARGET_OPENSBI_PLAT_NONE
 	depends on BR2_TARGET_UBOOT
 	select BR2_TARGET_OPENSBI_INSTALL_PAYLOAD_IMG
 	help
diff --git a/boot/opensbi/opensbi.mk b/boot/opensbi/opensbi.mk
index f9f55017..8ca8a298 100644
--- a/boot/opensbi/opensbi.mk
+++ b/boot/opensbi/opensbi.mk
@@ -32,11 +32,21 @@ OPENSBI_MAKE_ENV = \
 	CROSS_COMPILE=$(TARGET_CROSS) \
 	$(call qstrip,$(BR2_TARGET_OPENSBI_ADDITIONAL_VARIABLES))
 
-OPENSBI_PLAT = $(call qstrip,$(BR2_TARGET_OPENSBI_PLAT))
-ifneq ($(OPENSBI_PLAT),)
+ifeq ($(BR2_TARGET_OPENSBI_PLAT_REF),y)
+OPENSBI_PLAT = $(call qstrip,$(BR2_TARGET_OPENSBI_PLAT_REF_NAME))
 OPENSBI_MAKE_ENV += PLATFORM=$(OPENSBI_PLAT)
 endif
 
+# OpenSBI derives PLATFORM from $(basename PLATFORM_DIR) when PLATFORM is unset,
+# and builds into build/platform/$(PLATFORM)/ -- so OPENSBI_PLAT must match that
+# for the install step below to find the firmware. patsubst strips any trailing
+# slash, which would otherwise make notdir return an empty string.
+ifeq ($(BR2_TARGET_OPENSBI_PLAT_EXT),y)
+OPENSBI_PLAT_EXT_DIR = $(patsubst %/,%,$(call qstrip,$(BR2_TARGET_OPENSBI_PLAT_EXT_DIR)))
+OPENSBI_PLAT = $(notdir $(OPENSBI_PLAT_EXT_DIR))
+OPENSBI_MAKE_ENV += PLATFORM_DIR=$(OPENSBI_PLAT_EXT_DIR)
+endif
+
 ifeq ($(BR2_TARGET_OPENSBI_LINUX_PAYLOAD),y)
 OPENSBI_DEPENDENCIES += linux
 OPENSBI_MAKE_ENV += FW_PAYLOAD_PATH="$(BINARIES_DIR)/Image"
@@ -69,7 +79,7 @@ OPENSBI_INSTALL_IMAGES = YES
 OPENSBI_FW_IMAGES += payload
 endif
 
-ifneq ($(OPENSBI_PLAT),)
+ifneq ($(BR2_TARGET_OPENSBI_PLAT_NONE),y)
 define OPENSBI_INSTALL_IMAGES_CMDS
 	$(foreach f,$(OPENSBI_FW_IMAGES),\
 		$(INSTALL) -m 0644 -D $(@D)/build/platform/$(OPENSBI_PLAT)/firmware/fw_$(f).bin \
diff --git a/configs/andes_ae350_45_defconfig b/configs/andes_ae350_45_defconfig
index 80b780b6..a70b2281 100644
--- a/configs/andes_ae350_45_defconfig
+++ b/configs/andes_ae350_45_defconfig
@@ -21,7 +21,8 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_OPENSBI=y
 BR2_TARGET_OPENSBI_CUSTOM_VERSION=y
 BR2_TARGET_OPENSBI_CUSTOM_VERSION_VALUE="1.6"
-BR2_TARGET_OPENSBI_PLAT="generic"
+BR2_TARGET_OPENSBI_PLAT_REF=y
+BR2_TARGET_OPENSBI_PLAT_REF_NAME="generic"
 # BR2_TARGET_OPENSBI_INSTALL_JUMP_IMG is not set
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
diff --git a/configs/hifive_unleashed_defconfig b/configs/hifive_unleashed_defconfig
index e83af773..3771dd2a 100644
--- a/configs/hifive_unleashed_defconfig
+++ b/configs/hifive_unleashed_defconfig
@@ -27,7 +27,8 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_OPENSBI=y
 BR2_TARGET_OPENSBI_CUSTOM_VERSION=y
 BR2_TARGET_OPENSBI_CUSTOM_VERSION_VALUE="1.2"
-BR2_TARGET_OPENSBI_PLAT="generic"
+BR2_TARGET_OPENSBI_PLAT_REF=y
+BR2_TARGET_OPENSBI_PLAT_REF_NAME="generic"
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
diff --git a/configs/hifive_unmatched_defconfig b/configs/hifive_unmatched_defconfig
index 0b63ce15..b4ac91c5 100644
--- a/configs/hifive_unmatched_defconfig
+++ b/configs/hifive_unmatched_defconfig
@@ -27,7 +27,8 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_OPENSBI=y
 BR2_TARGET_OPENSBI_CUSTOM_VERSION=y
 BR2_TARGET_OPENSBI_CUSTOM_VERSION_VALUE="1.2"
-BR2_TARGET_OPENSBI_PLAT="generic"
+BR2_TARGET_OPENSBI_PLAT_REF=y
+BR2_TARGET_OPENSBI_PLAT_REF_NAME="generic"
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
diff --git a/configs/nezha_defconfig b/configs/nezha_defconfig
index c234b3e2..914b362e 100644
--- a/configs/nezha_defconfig
+++ b/configs/nezha_defconfig
@@ -21,7 +21,8 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_OPENSBI=y
 BR2_TARGET_OPENSBI_CUSTOM_VERSION=y
 BR2_TARGET_OPENSBI_CUSTOM_VERSION_VALUE="1.4"
-BR2_TARGET_OPENSBI_PLAT="generic"
+BR2_TARGET_OPENSBI_PLAT_REF=y
+BR2_TARGET_OPENSBI_PLAT_REF_NAME="generic"
 # BR2_TARGET_OPENSBI_INSTALL_JUMP_IMG is not set
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
diff --git a/configs/pine64_star64_defconfig b/configs/pine64_star64_defconfig
index a0356447..88b20bfe 100644
--- a/configs/pine64_star64_defconfig
+++ b/configs/pine64_star64_defconfig
@@ -17,7 +17,8 @@ BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_ROOTFS_EXT2_SIZE="100M"
 BR2_TARGET_OPENSBI=y
-BR2_TARGET_OPENSBI_PLAT="generic"
+BR2_TARGET_OPENSBI_PLAT_REF=y
+BR2_TARGET_OPENSBI_PLAT_REF_NAME="generic"
 # BR2_TARGET_OPENSBI_INSTALL_JUMP_IMG is not set
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
diff --git a/configs/qemu_riscv32_virt_defconfig b/configs/qemu_riscv32_virt_defconfig
index a57c9491..714e5ec6 100644
--- a/configs/qemu_riscv32_virt_defconfig
+++ b/configs/qemu_riscv32_virt_defconfig
@@ -14,6 +14,7 @@ BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_OPENSBI=y
 BR2_TARGET_OPENSBI_CUSTOM_VERSION=y
 BR2_TARGET_OPENSBI_CUSTOM_VERSION_VALUE="1.6"
-BR2_TARGET_OPENSBI_PLAT="generic"
+BR2_TARGET_OPENSBI_PLAT_REF=y
+BR2_TARGET_OPENSBI_PLAT_REF_NAME="generic"
 BR2_PACKAGE_HOST_QEMU=y
 BR2_PACKAGE_HOST_QEMU_SYSTEM_MODE=y
diff --git a/configs/qemu_riscv64_virt_defconfig b/configs/qemu_riscv64_virt_defconfig
index 0d91971d..91b49068 100644
--- a/configs/qemu_riscv64_virt_defconfig
+++ b/configs/qemu_riscv64_virt_defconfig
@@ -13,6 +13,7 @@ BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_OPENSBI=y
 BR2_TARGET_OPENSBI_CUSTOM_VERSION=y
 BR2_TARGET_OPENSBI_CUSTOM_VERSION_VALUE="1.6"
-BR2_TARGET_OPENSBI_PLAT="generic"
+BR2_TARGET_OPENSBI_PLAT_REF=y
+BR2_TARGET_OPENSBI_PLAT_REF_NAME="generic"
 BR2_PACKAGE_HOST_QEMU=y
 BR2_PACKAGE_HOST_QEMU_SYSTEM_MODE=y
diff --git a/configs/sipeed_lichee_rv_defconfig b/configs/sipeed_lichee_rv_defconfig
index 750d2d6e..eba7777b 100644
--- a/configs/sipeed_lichee_rv_defconfig
+++ b/configs/sipeed_lichee_rv_defconfig
@@ -16,7 +16,8 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_OPENSBI=y
 BR2_TARGET_OPENSBI_CUSTOM_VERSION=y
 BR2_TARGET_OPENSBI_CUSTOM_VERSION_VALUE="1.2"
-BR2_TARGET_OPENSBI_PLAT="generic"
+BR2_TARGET_OPENSBI_PLAT_REF=y
+BR2_TARGET_OPENSBI_PLAT_REF_NAME="generic"
 # BR2_TARGET_OPENSBI_INSTALL_JUMP_IMG is not set
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
diff --git a/configs/sipeed_lichee_rv_dock_defconfig b/configs/sipeed_lichee_rv_dock_defconfig
index 8c8dd277..56ef1070 100644
--- a/configs/sipeed_lichee_rv_dock_defconfig
+++ b/configs/sipeed_lichee_rv_dock_defconfig
@@ -24,7 +24,8 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_OPENSBI=y
 BR2_TARGET_OPENSBI_CUSTOM_VERSION=y
 BR2_TARGET_OPENSBI_CUSTOM_VERSION_VALUE="1.2"
-BR2_TARGET_OPENSBI_PLAT="generic"
+BR2_TARGET_OPENSBI_PLAT_REF=y
+BR2_TARGET_OPENSBI_PLAT_REF_NAME="generic"
 # BR2_TARGET_OPENSBI_INSTALL_JUMP_IMG is not set
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
diff --git a/configs/sipeed_licheepi_4a_defconfig b/configs/sipeed_licheepi_4a_defconfig
index c7867ed0..e57536c7 100644
--- a/configs/sipeed_licheepi_4a_defconfig
+++ b/configs/sipeed_licheepi_4a_defconfig
@@ -30,7 +30,8 @@ BR2_TARGET_OPENSBI=y
 BR2_TARGET_OPENSBI_CUSTOM_GIT=y
 BR2_TARGET_OPENSBI_CUSTOM_REPO_URL="https://github.com/revyos/thead-opensbi.git"
 BR2_TARGET_OPENSBI_CUSTOM_REPO_VERSION="61d7484c752a5e4c464d5dc18e21d9ac67fbbefa"
-BR2_TARGET_OPENSBI_PLAT="generic"
+BR2_TARGET_OPENSBI_PLAT_REF=y
+BR2_TARGET_OPENSBI_PLAT_REF_NAME="generic"
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BOARDNAME="light_lpi4a"
 BR2_TARGET_UBOOT_CUSTOM_GIT=y
diff --git a/configs/spike_riscv32_defconfig b/configs/spike_riscv32_defconfig
index a73f335f..22a1d344 100644
--- a/configs/spike_riscv32_defconfig
+++ b/configs/spike_riscv32_defconfig
@@ -12,6 +12,7 @@ BR2_TARGET_ROOTFS_CPIO=y
 BR2_TARGET_OPENSBI=y
 BR2_TARGET_OPENSBI_CUSTOM_VERSION=y
 BR2_TARGET_OPENSBI_CUSTOM_VERSION_VALUE="1.6"
-BR2_TARGET_OPENSBI_PLAT="generic"
+BR2_TARGET_OPENSBI_PLAT_REF=y
+BR2_TARGET_OPENSBI_PLAT_REF_NAME="generic"
 BR2_TARGET_OPENSBI_LINUX_PAYLOAD=y
 BR2_PACKAGE_HOST_RISCV_ISA_SIM=y
diff --git a/configs/spike_riscv64_defconfig b/configs/spike_riscv64_defconfig
index 7b698737..feedc9b2 100644
--- a/configs/spike_riscv64_defconfig
+++ b/configs/spike_riscv64_defconfig
@@ -11,6 +11,7 @@ BR2_TARGET_ROOTFS_CPIO=y
 BR2_TARGET_OPENSBI=y
 BR2_TARGET_OPENSBI_CUSTOM_VERSION=y
 BR2_TARGET_OPENSBI_CUSTOM_VERSION_VALUE="1.6"
-BR2_TARGET_OPENSBI_PLAT="generic"
+BR2_TARGET_OPENSBI_PLAT_REF=y
+BR2_TARGET_OPENSBI_PLAT_REF_NAME="generic"
 BR2_TARGET_OPENSBI_LINUX_PAYLOAD=y
 BR2_PACKAGE_HOST_RISCV_ISA_SIM=y
diff --git a/configs/visionfive2_defconfig b/configs/visionfive2_defconfig
index 7ce605b8..5846b8ca 100644
--- a/configs/visionfive2_defconfig
+++ b/configs/visionfive2_defconfig
@@ -21,7 +21,8 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_OPENSBI=y
 BR2_TARGET_OPENSBI_CUSTOM_VERSION=y
 BR2_TARGET_OPENSBI_CUSTOM_VERSION_VALUE="1.8.1"
-BR2_TARGET_OPENSBI_PLAT="generic"
+BR2_TARGET_OPENSBI_PLAT_REF=y
+BR2_TARGET_OPENSBI_PLAT_REF_NAME="generic"
 # BR2_TARGET_OPENSBI_INSTALL_JUMP_IMG is not set
 BR2_TARGET_OPENSBI_ADDITIONAL_VARIABLES="FW_TEXT_START=0x40000000 FW_OPTIONS=0"
 BR2_TARGET_UBOOT=y
-- 
2.47.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
