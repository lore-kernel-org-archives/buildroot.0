Return-Path: <SRS0=BIUF=O2=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98C68C433EF
	for <buildroot@archiver.kernel.org>; Wed,  6 Oct 2021 20:42:03 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1BD6B61075
	for <buildroot@archiver.kernel.org>; Wed,  6 Oct 2021 20:42:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1BD6B61075
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id BAA6A407F9;
	Wed,  6 Oct 2021 20:42:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4q7Ka6MlvWxj; Wed,  6 Oct 2021 20:42:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 48AA640DA9;
	Wed,  6 Oct 2021 20:41:59 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0FD171BF34F
 for <buildroot@lists.busybox.net>; Wed,  6 Oct 2021 20:41:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F211D40DAA
 for <buildroot@lists.busybox.net>; Wed,  6 Oct 2021 20:41:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id izV84aldQ4ke for <buildroot@lists.busybox.net>;
 Wed,  6 Oct 2021 20:41:44 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 278A6407F9
 for <buildroot@buildroot.org>; Wed,  6 Oct 2021 20:41:43 +0000 (UTC)
Received: by mail-ed1-x52f.google.com with SMTP id v18so14595389edc.11
 for <buildroot@buildroot.org>; Wed, 06 Oct 2021 13:41:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=utuWTHTZ/yNCxvRH8SLuAEa3CJyR5ab2grywImKu3Uo=;
 b=SrS40UATCGdgaxRACdxF/0q5PM1mAFWjRRLK3hpkhdnc3eggkhfQZKqPBHGqcSBK4a
 WXlslURdGpyHraMP3nY4CWB+8XbPy4uRTCOv2sVdfMNyO1kCBa7kLrnACxLOqYvQZBvw
 CzptiheO0XKct7JkQAOtOLy872v/E5RnhIWBGgcWiAtIkWUeE+qUCfPtGWaNCe8KYjes
 9VgzrbtEFwmAQroYqr8axI/chDi/A23JuliyGkKp0CfYSOp1fkHhtVueqjuGJ7qCPhPG
 F2hQ6dr7pIPQYxrSwTgpDKPk3wqAmRg5c2/la9QRPZ1wCO4IFYIXWn1/yzAKYuba9UDS
 DxEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=utuWTHTZ/yNCxvRH8SLuAEa3CJyR5ab2grywImKu3Uo=;
 b=Kr4vIwzvcxTZ3x/xnfolk3u9L8pdGdtAvp+mDjENkdqK8cmx964oze8IHhlpfmSBKC
 8xqdl+BKMbrftDZaX8AEZUziUMQIgMkt9ixeyCRKJNZo2clX9J7IA3QNCYNmkeSuQp5E
 5W5ZWNccFBoaz/Lfofo+QHsSpnbPPD3y99zIbAmW5gRxnT7GMlDS0LeM2q7D+czSI8iF
 JXDArLjD19bYur2UQ6XbwwBns5lp/WD8z08LeNpFObgMTcCjpjX3E0qHOp0ZxXsLuuyF
 bufAQeAXFJlDXfVk9314p3Eoq2kT5P/D24s8HETsjP3MTTFxthQGPxYX4Y6ua7qQCx/t
 6Zlw==
X-Gm-Message-State: AOAM532PoB0BReA2vy/yyTtjHQp2/Mpgtry12IXRB+obEKQ3ksQxCFZc
 NDmm7ZYsITy5G8wDU3A9MyQhHCw55TeZKCjS
X-Google-Smtp-Source: ABdhPJzRNpkFwlNC+b6fWqsnkyQDlyydinwJZQu9C8NA+mHNA7ce5XqIsAbEt7i7/ZvORXgXMmVD2Q==
X-Received: by 2002:a17:907:a411:: with SMTP id
 sg17mr494986ejc.412.1633552901942; 
 Wed, 06 Oct 2021 13:41:41 -0700 (PDT)
Received: from localhost.localdomain
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id p6sm5736047edi.18.2021.10.06.13.41.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Oct 2021 13:41:41 -0700 (PDT)
From: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>
To: buildroot@buildroot.org
Date: Wed,  6 Oct 2021 22:41:32 +0200
Message-Id: <20211006204133.465875-1-arnout@mind.be>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Subject: [Buildroot] [RFC 1/2] toolchain: invert glibc <-> !static dependency
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
Cc: Raul Cabello <raul.cabello@suse.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Currently, glibc depends on !BR2_STATIC_LIBS in all the toolchain
variants.

However, for some architectures, glibc is the only supported libc.
Therefore, for these, it's possible to select static libs, at which
point no libc is selectable any more.

To overcome this situation, invert the dependency between glibc and
static libs: BR2_STATIC_LIBS depends on !BR2_TOOLCHAIN_USES_GLIBC, and
all the dependencies on !BR2_STATIC_LIBS are removed from the glibc
variants of all toolchains.

Fixes: https://bugs.busybox.net/show_bug.cgi?id=14256

An alternative (simpler) fix would be to let BR2_STATIC_LIBS depend on
!BR2_s390x. However, that doesn't solve the problem for the myriad of
other architectures that only support glibc. In addition, there are some
architecture variants that only support glibc, etc. etc., which really
complicates stuff.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 Config.in                                     |  1 +
 toolchain/toolchain-buildroot/Config.in       |  5 +-
 toolchain/toolchain-external/Config.in        |  3 -
 .../toolchain-external-andes-nds32/Config.in  |  1 -
 .../Config.in                                 |  1 -
 .../toolchain-external-arm-aarch64/Config.in  |  1 -
 .../toolchain-external-arm-arm/Config.in      |  1 -
 .../Config.in.options                         | 60 -------------------
 .../Config.in                                 |  1 -
 .../Config.in                                 |  1 -
 .../Config.in                                 |  1 -
 .../Config.in                                 |  1 -
 .../Config.in.options                         |  4 --
 .../Config.in                                 |  1 -
 .../Config.in                                 |  1 -
 .../toolchain-external-linaro-arm/Config.in   |  2 -
 .../toolchain-external-linaro-armeb/Config.in |  2 -
 17 files changed, 3 insertions(+), 84 deletions(-)

diff --git a/Config.in b/Config.in
index 3db2c8dcab..8ed11c994d 100644
--- a/Config.in
+++ b/Config.in
@@ -597,6 +597,7 @@ choice
 
 config BR2_STATIC_LIBS
 	bool "static only"
+	depends on !BR2_TOOLCHAIN_USES_GLIBC
 	help
 	  Build and use only static libraries. No shared libraries will
 	  be installed on the target. This potentially increases your
diff --git a/toolchain/toolchain-buildroot/Config.in b/toolchain/toolchain-buildroot/Config.in
index 4004c0edf8..3a64cd36d5 100644
--- a/toolchain/toolchain-buildroot/Config.in
+++ b/toolchain/toolchain-buildroot/Config.in
@@ -51,7 +51,6 @@ config BR2_TOOLCHAIN_BUILDROOT_GLIBC
 		   BR2_sparc64     || BR2_x86_64     || BR2_microblaze  || \
 		   BR2_nios2       || (BR2_arc && BR2_ARC_ATOMIC_EXT)   || BR2_csky
 	depends on BR2_USE_MMU
-	depends on !BR2_STATIC_LIBS
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_2
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_10 || !BR2_powerpc64le
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_5 || !BR2_MIPS_NAN_2008
@@ -66,9 +65,9 @@ config BR2_TOOLCHAIN_BUILDROOT_GLIBC
 
 	  http://www.gnu.org/software/libc/
 
-comment "glibc needs a toolchain w/ dynamic library, kernel headers >= 3.2"
+comment "glibc needs a toolchain w/ kernel headers >= 3.2"
 	depends on BR2_USE_MMU
-	depends on BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_2
+	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_2
 
 # glibc >= 2.26 require kernel headers >= 3.10 on powerpc64le.
 comment "glibc on powerpc64le needs a toolchain w/ headers >= 3.10"
diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
index 2177e6a678..fb61b8e8bd 100644
--- a/toolchain/toolchain-external/Config.in
+++ b/toolchain/toolchain-external/Config.in
@@ -5,9 +5,6 @@ comment "Toolchain External Options"
 choice
 	prompt "Toolchain"
 
-comment "glibc toolchains only available with shared lib support"
-	depends on BR2_STATIC_LIBS
-
 # Kept toolchains sorted by architecture in order to use some toolchain
 # as default choice
 
diff --git a/toolchain/toolchain-external/toolchain-external-andes-nds32/Config.in b/toolchain/toolchain-external/toolchain-external-andes-nds32/Config.in
index 9c937b8c44..77ec51e219 100644
--- a/toolchain/toolchain-external/toolchain-external-andes-nds32/Config.in
+++ b/toolchain/toolchain-external/toolchain-external-andes-nds32/Config.in
@@ -1,7 +1,6 @@
 config BR2_TOOLCHAIN_EXTERNAL_ANDES_NDS32
 	bool "Andes nds32"
 	depends on BR2_nds32
-	depends on !BR2_STATIC_LIBS
 	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
 	select BR2_HOSTARCH_NEEDS_IA32_LIBS
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_8
diff --git a/toolchain/toolchain-external/toolchain-external-arm-aarch64-be/Config.in b/toolchain/toolchain-external/toolchain-external-arm-aarch64-be/Config.in
index 783ed35314..eeb88579fe 100644
--- a/toolchain/toolchain-external/toolchain-external-arm-aarch64-be/Config.in
+++ b/toolchain/toolchain-external/toolchain-external-arm-aarch64-be/Config.in
@@ -2,7 +2,6 @@ config BR2_TOOLCHAIN_EXTERNAL_ARM_AARCH64_BE
 	bool "Arm AArch64 BE 2021.07"
 	depends on BR2_aarch64_be
 	depends on BR2_HOSTARCH = "x86_64"
-	depends on !BR2_STATIC_LIBS
 	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
 	select BR2_TOOLCHAIN_HAS_SSP
 	select BR2_INSTALL_LIBSTDCPP
diff --git a/toolchain/toolchain-external/toolchain-external-arm-aarch64/Config.in b/toolchain/toolchain-external/toolchain-external-arm-aarch64/Config.in
index 4557debe5d..9eb5d64a9d 100644
--- a/toolchain/toolchain-external/toolchain-external-arm-aarch64/Config.in
+++ b/toolchain/toolchain-external/toolchain-external-arm-aarch64/Config.in
@@ -2,7 +2,6 @@ config BR2_TOOLCHAIN_EXTERNAL_ARM_AARCH64
 	bool "Arm AArch64 2021.07"
 	depends on BR2_aarch64
 	depends on BR2_HOSTARCH = "x86_64"
-	depends on !BR2_STATIC_LIBS
 	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
 	select BR2_TOOLCHAIN_HAS_SSP
 	select BR2_INSTALL_LIBSTDCPP
diff --git a/toolchain/toolchain-external/toolchain-external-arm-arm/Config.in b/toolchain/toolchain-external/toolchain-external-arm-arm/Config.in
index 0fbeba6aae..86a6f9fd25 100644
--- a/toolchain/toolchain-external/toolchain-external-arm-arm/Config.in
+++ b/toolchain/toolchain-external/toolchain-external-arm-arm/Config.in
@@ -10,7 +10,6 @@ config BR2_TOOLCHAIN_EXTERNAL_ARM_ARM
 	depends on BR2_ARM_CPU_HAS_NEON
 	depends on BR2_HOSTARCH = "x86_64"
 	depends on BR2_ARM_EABIHF
-	depends on !BR2_STATIC_LIBS
 	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
 	select BR2_TOOLCHAIN_HAS_SSP
 	select BR2_INSTALL_LIBSTDCPP
diff --git a/toolchain/toolchain-external/toolchain-external-bootlin/Config.in.options b/toolchain/toolchain-external/toolchain-external-bootlin/Config.in.options
index 61ead9b82e..eaf75b4dae 100644
--- a/toolchain/toolchain-external/toolchain-external-bootlin/Config.in.options
+++ b/toolchain/toolchain-external/toolchain-external-bootlin/Config.in.options
@@ -56,7 +56,6 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_GLIBC_BLEEDING_EDGE
 	bool "aarch64 glibc bleeding-edge 2020.08-1"
 	depends on BR2_aarch64
 	depends on BR2_USE_MMU
-	depends on !BR2_STATIC_LIBS
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
 	select BR2_INSTALL_LIBSTDCPP
@@ -81,7 +80,6 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_GLIBC_STABLE
 	bool "aarch64 glibc stable 2020.08-1"
 	depends on BR2_aarch64
 	depends on BR2_USE_MMU
-	depends on !BR2_STATIC_LIBS
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_9
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9
 	select BR2_INSTALL_LIBSTDCPP
@@ -197,7 +195,6 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64BE_GLIBC_BLEEDING_EDGE
 	bool "aarch64be glibc bleeding-edge 2020.08-1"
 	depends on BR2_aarch64_be
 	depends on BR2_USE_MMU
-	depends on !BR2_STATIC_LIBS
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
 	select BR2_INSTALL_LIBSTDCPP
@@ -222,7 +219,6 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64BE_GLIBC_STABLE
 	bool "aarch64be glibc stable 2020.08-1"
 	depends on BR2_aarch64_be
 	depends on BR2_USE_MMU
-	depends on !BR2_STATIC_LIBS
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_9
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9
 	select BR2_INSTALL_LIBSTDCPP
@@ -342,7 +338,6 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARCLE_HS38_GLIBC_BLEEDING_EDGE
 	depends on BR2_arcle
 	depends on BR2_archs38
 	depends on BR2_USE_MMU
-	depends on !BR2_STATIC_LIBS
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
 	select BR2_INSTALL_LIBSTDCPP
@@ -368,7 +363,6 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARCLE_HS38_GLIBC_STABLE
 	depends on BR2_arcle
 	depends on BR2_archs38
 	depends on BR2_USE_MMU
-	depends on !BR2_STATIC_LIBS
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_9
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9
 	select BR2_INSTALL_LIBSTDCPP
@@ -442,7 +436,6 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV5_EABI_GLIBC_BLEEDING_EDGE
 	depends on BR2_ARM_CPU_ARMV5
 	depends on BR2_ARM_EABI
 	depends on BR2_USE_MMU
-	depends on !BR2_STATIC_LIBS
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
 	select BR2_INSTALL_LIBSTDCPP
@@ -468,7 +461,6 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV5_EABI_GLIBC_STABLE
 	depends on BR2_ARM_CPU_ARMV5
 	depends on BR2_ARM_EABI
 	depends on BR2_USE_MMU
-	depends on !BR2_STATIC_LIBS
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_9
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9
 	select BR2_INSTALL_LIBSTDCPP
@@ -590,7 +582,6 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV6_EABIHF_GLIBC_BLEEDING_EDGE
 	depends on BR2_ARM_CPU_ARMV6
 	depends on BR2_ARM_EABIHF
 	depends on BR2_USE_MMU
-	depends on !BR2_STATIC_LIBS
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
 	select BR2_INSTALL_LIBSTDCPP
@@ -616,7 +607,6 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV6_EABIHF_GLIBC_STABLE
 	depends on BR2_ARM_CPU_ARMV6
 	depends on BR2_ARM_EABIHF
 	depends on BR2_USE_MMU
-	depends on !BR2_STATIC_LIBS
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_9
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9
 	select BR2_INSTALL_LIBSTDCPP
@@ -738,7 +728,6 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7_EABIHF_GLIBC_BLEEDING_EDGE
 	depends on BR2_ARM_CPU_ARMV7A
 	depends on BR2_ARM_EABIHF
 	depends on BR2_USE_MMU
-	depends on !BR2_STATIC_LIBS
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
 	select BR2_INSTALL_LIBSTDCPP
@@ -764,7 +753,6 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7_EABIHF_GLIBC_STABLE
 	depends on BR2_ARM_CPU_ARMV7A
 	depends on BR2_ARM_EABIHF
 	depends on BR2_USE_MMU
-	depends on !BR2_STATIC_LIBS
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_9
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9
 	select BR2_INSTALL_LIBSTDCPP
@@ -1015,7 +1003,6 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MICROBLAZEBE_GLIBC_BLEEDING_EDGE
 	bool "microblazebe glibc bleeding-edge 2020.08-1"
 	depends on BR2_microblazebe
 	depends on BR2_USE_MMU
-	depends on !BR2_STATIC_LIBS
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
 	select BR2_INSTALL_LIBSTDCPP
@@ -1039,7 +1026,6 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MICROBLAZEBE_GLIBC_STABLE
 	bool "microblazebe glibc stable 2020.08-1"
 	depends on BR2_microblazebe
 	depends on BR2_USE_MMU
-	depends on !BR2_STATIC_LIBS
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_9
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9
 	select BR2_INSTALL_LIBSTDCPP
@@ -1153,7 +1139,6 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MICROBLAZEEL_GLIBC_BLEEDING_EDGE
 	bool "microblazeel glibc bleeding-edge 2020.08-1"
 	depends on BR2_microblazeel
 	depends on BR2_USE_MMU
-	depends on !BR2_STATIC_LIBS
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
 	select BR2_INSTALL_LIBSTDCPP
@@ -1177,7 +1162,6 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MICROBLAZEEL_GLIBC_STABLE
 	bool "microblazeel glibc stable 2020.08-1"
 	depends on BR2_microblazeel
 	depends on BR2_USE_MMU
-	depends on !BR2_STATIC_LIBS
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_9
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9
 	select BR2_INSTALL_LIBSTDCPP
@@ -1293,7 +1277,6 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32_GLIBC_BLEEDING_EDGE
 	depends on BR2_mips_32
 	depends on !BR2_MIPS_SOFT_FLOAT
 	depends on BR2_USE_MMU
-	depends on !BR2_STATIC_LIBS
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
 	select BR2_INSTALL_LIBSTDCPP
@@ -1320,7 +1303,6 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32_GLIBC_STABLE
 	depends on BR2_mips_32
 	depends on !BR2_MIPS_SOFT_FLOAT
 	depends on BR2_USE_MMU
-	depends on !BR2_STATIC_LIBS
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_9
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9
 	select BR2_INSTALL_LIBSTDCPP
@@ -1446,7 +1428,6 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32EL_GLIBC_BLEEDING_EDGE
 	depends on BR2_mips_32
 	depends on !BR2_MIPS_SOFT_FLOAT
 	depends on BR2_USE_MMU
-	depends on !BR2_STATIC_LIBS
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
 	select BR2_INSTALL_LIBSTDCPP
@@ -1473,7 +1454,6 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32EL_GLIBC_STABLE
 	depends on BR2_mips_32
 	depends on !BR2_MIPS_SOFT_FLOAT
 	depends on BR2_USE_MMU
-	depends on !BR2_STATIC_LIBS
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_9
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9
 	select BR2_INSTALL_LIBSTDCPP
@@ -1599,7 +1579,6 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32R5EL_GLIBC_BLEEDING_EDGE
 	depends on BR2_mips_32r5
 	depends on !BR2_MIPS_SOFT_FLOAT
 	depends on BR2_USE_MMU
-	depends on !BR2_STATIC_LIBS
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
 	select BR2_INSTALL_LIBSTDCPP
@@ -1626,7 +1605,6 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32R5EL_GLIBC_STABLE
 	depends on BR2_mips_32r5
 	depends on !BR2_MIPS_SOFT_FLOAT
 	depends on BR2_USE_MMU
-	depends on !BR2_STATIC_LIBS
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_9
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9
 	select BR2_INSTALL_LIBSTDCPP
@@ -1753,7 +1731,6 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32R6EL_GLIBC_BLEEDING_EDGE
 	depends on BR2_mips_32r6
 	depends on !BR2_MIPS_SOFT_FLOAT
 	depends on BR2_USE_MMU
-	depends on !BR2_STATIC_LIBS
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
 	select BR2_INSTALL_LIBSTDCPP
@@ -1780,7 +1757,6 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32R6EL_GLIBC_STABLE
 	depends on BR2_mips_32r6
 	depends on !BR2_MIPS_SOFT_FLOAT
 	depends on BR2_USE_MMU
-	depends on !BR2_STATIC_LIBS
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_9
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9
 	select BR2_INSTALL_LIBSTDCPP
@@ -1908,7 +1884,6 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64_N32_GLIBC_BLEEDING_EDGE
 	depends on BR2_MIPS_NABI32
 	depends on !BR2_MIPS_SOFT_FLOAT
 	depends on BR2_USE_MMU
-	depends on !BR2_STATIC_LIBS
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
 	select BR2_INSTALL_LIBSTDCPP
@@ -1936,7 +1911,6 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64_N32_GLIBC_STABLE
 	depends on BR2_MIPS_NABI32
 	depends on !BR2_MIPS_SOFT_FLOAT
 	depends on BR2_USE_MMU
-	depends on !BR2_STATIC_LIBS
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_9
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9
 	select BR2_INSTALL_LIBSTDCPP
@@ -2068,7 +2042,6 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64EL_N32_GLIBC_BLEEDING_EDGE
 	depends on BR2_MIPS_NABI32
 	depends on !BR2_MIPS_SOFT_FLOAT
 	depends on BR2_USE_MMU
-	depends on !BR2_STATIC_LIBS
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
 	select BR2_INSTALL_LIBSTDCPP
@@ -2096,7 +2069,6 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64EL_N32_GLIBC_STABLE
 	depends on BR2_MIPS_NABI32
 	depends on !BR2_MIPS_SOFT_FLOAT
 	depends on BR2_USE_MMU
-	depends on !BR2_STATIC_LIBS
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_9
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9
 	select BR2_INSTALL_LIBSTDCPP
@@ -2228,7 +2200,6 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64R6EL_N32_GLIBC_BLEEDING_EDGE
 	depends on BR2_MIPS_NABI32
 	depends on !BR2_MIPS_SOFT_FLOAT
 	depends on BR2_USE_MMU
-	depends on !BR2_STATIC_LIBS
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
 	select BR2_INSTALL_LIBSTDCPP
@@ -2256,7 +2227,6 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64R6EL_N32_GLIBC_STABLE
 	depends on BR2_MIPS_NABI32
 	depends on !BR2_MIPS_SOFT_FLOAT
 	depends on BR2_USE_MMU
-	depends on !BR2_STATIC_LIBS
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_9
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9
 	select BR2_INSTALL_LIBSTDCPP
@@ -2385,7 +2355,6 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_NIOS2_GLIBC_BLEEDING_EDGE
 	bool "nios2 glibc bleeding-edge 2020.08-1"
 	depends on BR2_nios2
 	depends on BR2_USE_MMU
-	depends on !BR2_STATIC_LIBS
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
 	select BR2_INSTALL_LIBSTDCPP
@@ -2410,7 +2379,6 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_NIOS2_GLIBC_STABLE
 	bool "nios2 glibc stable 2020.08-1"
 	depends on BR2_nios2
 	depends on BR2_USE_MMU
-	depends on !BR2_STATIC_LIBS
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_9
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9
 	select BR2_INSTALL_LIBSTDCPP
@@ -2527,7 +2495,6 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_440FP_GLIBC_BLEEDING_EDGE
 	depends on BR2_powerpc
 	depends on BR2_powerpc_440fp
 	depends on BR2_USE_MMU
-	depends on !BR2_STATIC_LIBS
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
 	select BR2_INSTALL_LIBSTDCPP
@@ -2553,7 +2520,6 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_440FP_GLIBC_STABLE
 	depends on BR2_powerpc
 	depends on BR2_powerpc_440fp
 	depends on BR2_USE_MMU
-	depends on !BR2_STATIC_LIBS
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_9
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9
 	select BR2_INSTALL_LIBSTDCPP
@@ -2673,7 +2639,6 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_E300C3_GLIBC_BLEEDING_EDGE
 	depends on BR2_powerpc
 	depends on BR2_powerpc_e300c3
 	depends on BR2_USE_MMU
-	depends on !BR2_STATIC_LIBS
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
 	select BR2_INSTALL_LIBSTDCPP
@@ -2699,7 +2664,6 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_E300C3_GLIBC_STABLE
 	depends on BR2_powerpc
 	depends on BR2_powerpc_e300c3
 	depends on BR2_USE_MMU
-	depends on !BR2_STATIC_LIBS
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_9
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9
 	select BR2_INSTALL_LIBSTDCPP
@@ -2819,7 +2783,6 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_E500MC_GLIBC_BLEEDING_EDGE
 	depends on BR2_powerpc
 	depends on BR2_powerpc_e500mc
 	depends on BR2_USE_MMU
-	depends on !BR2_STATIC_LIBS
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
 	select BR2_INSTALL_LIBSTDCPP
@@ -2845,7 +2808,6 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_E500MC_GLIBC_STABLE
 	depends on BR2_powerpc
 	depends on BR2_powerpc_e500mc
 	depends on BR2_USE_MMU
-	depends on !BR2_STATIC_LIBS
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_9
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9
 	select BR2_INSTALL_LIBSTDCPP
@@ -2965,7 +2927,6 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC64_E5500_GLIBC_BLEEDING_EDGE
 	depends on BR2_powerpc64
 	depends on BR2_powerpc_e5500
 	depends on BR2_USE_MMU
-	depends on !BR2_STATIC_LIBS
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
 	select BR2_INSTALL_LIBSTDCPP
@@ -2991,7 +2952,6 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC64_E5500_GLIBC_STABLE
 	depends on BR2_powerpc64
 	depends on BR2_powerpc_e5500
 	depends on BR2_USE_MMU
-	depends on !BR2_STATIC_LIBS
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_9
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9
 	select BR2_INSTALL_LIBSTDCPP
@@ -3017,7 +2977,6 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC64_E6500_GLIBC_BLEEDING_EDGE
 	depends on BR2_powerpc64
 	depends on BR2_powerpc_e6500
 	depends on BR2_USE_MMU
-	depends on !BR2_STATIC_LIBS
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
 	select BR2_INSTALL_LIBSTDCPP
@@ -3043,7 +3002,6 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC64_E6500_GLIBC_STABLE
 	depends on BR2_powerpc64
 	depends on BR2_powerpc_e6500
 	depends on BR2_USE_MMU
-	depends on !BR2_STATIC_LIBS
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_9
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9
 	select BR2_INSTALL_LIBSTDCPP
@@ -3117,7 +3075,6 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC64_POWER8_GLIBC_BLEEDING_EDGE
 	depends on BR2_powerpc64
 	depends on BR2_powerpc_power8
 	depends on BR2_USE_MMU
-	depends on !BR2_STATIC_LIBS
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
 	select BR2_INSTALL_LIBSTDCPP
@@ -3143,7 +3100,6 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC64_POWER8_GLIBC_STABLE
 	depends on BR2_powerpc64
 	depends on BR2_powerpc_power8
 	depends on BR2_USE_MMU
-	depends on !BR2_STATIC_LIBS
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_9
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9
 	select BR2_INSTALL_LIBSTDCPP
@@ -3217,7 +3173,6 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC64LE_POWER8_GLIBC_BLEEDING_EDGE
 	depends on BR2_powerpc64le
 	depends on BR2_powerpc_power8
 	depends on BR2_USE_MMU
-	depends on !BR2_STATIC_LIBS
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
 	select BR2_INSTALL_LIBSTDCPP
@@ -3243,7 +3198,6 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC64LE_POWER8_GLIBC_STABLE
 	depends on BR2_powerpc64le
 	depends on BR2_powerpc_power8
 	depends on BR2_USE_MMU
-	depends on !BR2_STATIC_LIBS
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_9
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9
 	select BR2_INSTALL_LIBSTDCPP
@@ -3319,7 +3273,6 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_RISCV32_ILP32D_GLIBC_BLEEDING_EDGE
 	depends on BR2_RISCV_32
 	depends on BR2_RISCV_ABI_ILP32D
 	depends on BR2_USE_MMU
-	depends on !BR2_STATIC_LIBS
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
 	select BR2_INSTALL_LIBSTDCPP
@@ -3346,7 +3299,6 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_RISCV64_GLIBC_BLEEDING_EDGE
 	depends on BR2_RISCV_64
 	depends on BR2_RISCV_ABI_LP64
 	depends on BR2_USE_MMU
-	depends on !BR2_STATIC_LIBS
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
 	select BR2_INSTALL_LIBSTDCPP
@@ -3398,7 +3350,6 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_SH_SH4_GLIBC_BLEEDING_EDGE
 	depends on BR2_sh
 	depends on BR2_sh4
 	depends on BR2_USE_MMU
-	depends on !BR2_STATIC_LIBS
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
 	select BR2_INSTALL_LIBSTDCPP
@@ -3424,7 +3375,6 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_SH_SH4_GLIBC_STABLE
 	depends on BR2_sh
 	depends on BR2_sh4
 	depends on BR2_USE_MMU
-	depends on !BR2_STATIC_LIBS
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_9
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9
 	select BR2_INSTALL_LIBSTDCPP
@@ -3545,7 +3495,6 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_SH_SH4AEB_GLIBC_BLEEDING_EDGE
 	depends on BR2_sh
 	depends on BR2_sh4aeb
 	depends on BR2_USE_MMU
-	depends on !BR2_STATIC_LIBS
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
 	select BR2_INSTALL_LIBSTDCPP
@@ -3571,7 +3520,6 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_SH_SH4AEB_GLIBC_STABLE
 	depends on BR2_sh
 	depends on BR2_sh4aeb
 	depends on BR2_USE_MMU
-	depends on !BR2_STATIC_LIBS
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_9
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9
 	select BR2_INSTALL_LIBSTDCPP
@@ -3644,7 +3592,6 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_SPARC64_GLIBC_BLEEDING_EDGE
 	depends on BR2_sparc64
 	depends on BR2_sparc_v9
 	depends on BR2_USE_MMU
-	depends on !BR2_STATIC_LIBS
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
 	select BR2_INSTALL_LIBSTDCPP
@@ -3670,7 +3617,6 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_SPARC64_GLIBC_STABLE
 	depends on BR2_sparc64
 	depends on BR2_sparc_v9
 	depends on BR2_USE_MMU
-	depends on !BR2_STATIC_LIBS
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_9
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9
 	select BR2_INSTALL_LIBSTDCPP
@@ -3750,7 +3696,6 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_CORE_I7_GLIBC_BLEEDING_EDGE
 	depends on BR2_X86_CPU_HAS_SSE4
 	depends on BR2_X86_CPU_HAS_SSE42
 	depends on BR2_USE_MMU
-	depends on !BR2_STATIC_LIBS
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
 	select BR2_INSTALL_LIBSTDCPP
@@ -3782,7 +3727,6 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_CORE_I7_GLIBC_STABLE
 	depends on BR2_X86_CPU_HAS_SSE4
 	depends on BR2_X86_CPU_HAS_SSE42
 	depends on BR2_USE_MMU
-	depends on !BR2_STATIC_LIBS
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_9
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9
 	select BR2_INSTALL_LIBSTDCPP
@@ -3932,7 +3876,6 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_CORE2_GLIBC_BLEEDING_EDGE
 	depends on BR2_X86_CPU_HAS_SSE3
 	depends on BR2_X86_CPU_HAS_SSSE3
 	depends on BR2_USE_MMU
-	depends on !BR2_STATIC_LIBS
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
 	select BR2_INSTALL_LIBSTDCPP
@@ -3962,7 +3905,6 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_CORE2_GLIBC_STABLE
 	depends on BR2_X86_CPU_HAS_SSE3
 	depends on BR2_X86_CPU_HAS_SSSE3
 	depends on BR2_USE_MMU
-	depends on !BR2_STATIC_LIBS
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_9
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9
 	select BR2_INSTALL_LIBSTDCPP
@@ -4099,7 +4041,6 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_I686_GLIBC_BLEEDING_EDGE
 	depends on !BR2_x86_i586
 	depends on !BR2_x86_x1000
 	depends on BR2_USE_MMU
-	depends on !BR2_STATIC_LIBS
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
 	select BR2_INSTALL_LIBSTDCPP
@@ -4127,7 +4068,6 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_I686_GLIBC_STABLE
 	depends on !BR2_x86_i586
 	depends on !BR2_x86_x1000
 	depends on BR2_USE_MMU
-	depends on !BR2_STATIC_LIBS
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_9
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9
 	select BR2_INSTALL_LIBSTDCPP
diff --git a/toolchain/toolchain-external/toolchain-external-codesourcery-aarch64/Config.in b/toolchain/toolchain-external/toolchain-external-codesourcery-aarch64/Config.in
index 24cbcffa29..8c0f985c5b 100644
--- a/toolchain/toolchain-external/toolchain-external-codesourcery-aarch64/Config.in
+++ b/toolchain/toolchain-external/toolchain-external-codesourcery-aarch64/Config.in
@@ -5,7 +5,6 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_AARCH64
 	# a57/a53 and a72/a53 appeared in gcc-6 or were broken before
 	depends on !BR2_cortex_a57_a53 && !BR2_cortex_a72_a53
 	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
-	depends on !BR2_STATIC_LIBS
 	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
 	select BR2_TOOLCHAIN_HAS_SSP
 	select BR2_INSTALL_LIBSTDCPP
diff --git a/toolchain/toolchain-external/toolchain-external-codesourcery-arm/Config.in b/toolchain/toolchain-external/toolchain-external-codesourcery-arm/Config.in
index bdbe2acaea..c1e423b7bb 100644
--- a/toolchain/toolchain-external/toolchain-external-codesourcery-arm/Config.in
+++ b/toolchain/toolchain-external/toolchain-external-codesourcery-arm/Config.in
@@ -6,7 +6,6 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM
 	depends on BR2_ARM_EABI
 	# Unsupported ARM cores
 	depends on !BR2_cortex_a12 && !BR2_cortex_a17 && !BR2_ARM_CPU_ARMV8A
-	depends on !BR2_STATIC_LIBS
 	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
 	select BR2_TOOLCHAIN_HAS_SSP
 	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
diff --git a/toolchain/toolchain-external/toolchain-external-codesourcery-mips/Config.in b/toolchain/toolchain-external/toolchain-external-codesourcery-mips/Config.in
index 1a3bdc9393..cb66255cf3 100644
--- a/toolchain/toolchain-external/toolchain-external-codesourcery-mips/Config.in
+++ b/toolchain/toolchain-external/toolchain-external-codesourcery-mips/Config.in
@@ -7,7 +7,6 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS
 	depends on !BR2_mips_interaptiv
 	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
 	depends on !BR2_MIPS_NABI32
-	depends on !BR2_STATIC_LIBS
 	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
 	select BR2_TOOLCHAIN_HAS_SSP
 	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
diff --git a/toolchain/toolchain-external/toolchain-external-codesourcery-niosII/Config.in b/toolchain/toolchain-external/toolchain-external-codesourcery-niosII/Config.in
index 9d785a4b6b..cf3ce69a68 100644
--- a/toolchain/toolchain-external/toolchain-external-codesourcery-niosII/Config.in
+++ b/toolchain/toolchain-external/toolchain-external-codesourcery-niosII/Config.in
@@ -3,7 +3,6 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII
 	depends on BR2_nios2
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_8
 	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
-	depends on !BR2_STATIC_LIBS
 	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
 	select BR2_TOOLCHAIN_HAS_SSP
 	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
diff --git a/toolchain/toolchain-external/toolchain-external-custom/Config.in.options b/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
index ae78c0ef9e..d8af6ea2f3 100644
--- a/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
+++ b/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
@@ -370,7 +370,6 @@ config BR2_TOOLCHAIN_EXTERNAL_CUSTOM_UCLIBC
 
 config BR2_TOOLCHAIN_EXTERNAL_CUSTOM_GLIBC
 	bool "glibc/eglibc"
-	depends on !BR2_STATIC_LIBS
 	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
 	help
 	  Select this option if your external toolchain uses the GNU C
@@ -382,9 +381,6 @@ config BR2_TOOLCHAIN_EXTERNAL_CUSTOM_GLIBC
 	  toolchain with eglibc configured to exclude key features may
 	  cause build failures to some packages.
 
-comment "(e)glibc only available with shared lib support"
-	depends on BR2_STATIC_LIBS
-
 config BR2_TOOLCHAIN_EXTERNAL_CUSTOM_MUSL
 	bool "musl (experimental)"
 	select BR2_TOOLCHAIN_EXTERNAL_MUSL
diff --git a/toolchain/toolchain-external/toolchain-external-linaro-aarch64-be/Config.in b/toolchain/toolchain-external/toolchain-external-linaro-aarch64-be/Config.in
index bac90374cf..53d5dfd8f2 100644
--- a/toolchain/toolchain-external/toolchain-external-linaro-aarch64-be/Config.in
+++ b/toolchain/toolchain-external/toolchain-external-linaro-aarch64-be/Config.in
@@ -2,7 +2,6 @@ config BR2_TOOLCHAIN_EXTERNAL_LINARO_AARCH64_BE
 	bool "Linaro AArch64 BE 2018.05"
 	depends on BR2_aarch64_be
 	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
-	depends on !BR2_STATIC_LIBS
 	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
 	select BR2_TOOLCHAIN_HAS_SSP
 	select BR2_INSTALL_LIBSTDCPP
diff --git a/toolchain/toolchain-external/toolchain-external-linaro-aarch64/Config.in b/toolchain/toolchain-external/toolchain-external-linaro-aarch64/Config.in
index 824eb76c72..c9b84b1d30 100644
--- a/toolchain/toolchain-external/toolchain-external-linaro-aarch64/Config.in
+++ b/toolchain/toolchain-external/toolchain-external-linaro-aarch64/Config.in
@@ -2,7 +2,6 @@ config BR2_TOOLCHAIN_EXTERNAL_LINARO_AARCH64
 	bool "Linaro AArch64 2018.05"
 	depends on BR2_aarch64
 	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
-	depends on !BR2_STATIC_LIBS
 	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
 	select BR2_TOOLCHAIN_HAS_SSP
 	select BR2_INSTALL_LIBSTDCPP
diff --git a/toolchain/toolchain-external/toolchain-external-linaro-arm/Config.in b/toolchain/toolchain-external/toolchain-external-linaro-arm/Config.in
index beb38609c3..015e92f17c 100644
--- a/toolchain/toolchain-external/toolchain-external-linaro-arm/Config.in
+++ b/toolchain/toolchain-external/toolchain-external-linaro-arm/Config.in
@@ -1,7 +1,6 @@
 comment "Linaro toolchains available for Cortex-A + EABIhf"
 	depends on BR2_arm
 	depends on !BR2_ARM_CPU_ARMV7A || !BR2_ARM_EABIHF
-	depends on !BR2_STATIC_LIBS
 
 config BR2_TOOLCHAIN_EXTERNAL_LINARO_ARM
 	bool "Linaro ARM 2018.05"
@@ -9,7 +8,6 @@ config BR2_TOOLCHAIN_EXTERNAL_LINARO_ARM
 	depends on BR2_ARM_CPU_ARMV7A || BR2_ARM_CPU_ARMV8A
 	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
 	depends on BR2_ARM_EABIHF
-	depends on !BR2_STATIC_LIBS
 	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
 	select BR2_TOOLCHAIN_HAS_SSP
 	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
diff --git a/toolchain/toolchain-external/toolchain-external-linaro-armeb/Config.in b/toolchain/toolchain-external/toolchain-external-linaro-armeb/Config.in
index aa21e44860..b338a72bff 100644
--- a/toolchain/toolchain-external/toolchain-external-linaro-armeb/Config.in
+++ b/toolchain/toolchain-external/toolchain-external-linaro-armeb/Config.in
@@ -1,7 +1,6 @@
 comment "Linaro toolchains available for Cortex-A + EABIhf"
 	depends on BR2_armeb
 	depends on !BR2_ARM_CPU_ARMV7A || !BR2_ARM_EABIHF
-	depends on !BR2_STATIC_LIBS
 
 config BR2_TOOLCHAIN_EXTERNAL_LINARO_ARMEB
 	bool "Linaro armeb 2018.05"
@@ -9,7 +8,6 @@ config BR2_TOOLCHAIN_EXTERNAL_LINARO_ARMEB
 	depends on BR2_ARM_CPU_ARMV7A || BR2_ARM_CPU_ARMV8A
 	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
 	depends on BR2_ARM_EABIHF
-	depends on !BR2_STATIC_LIBS
 	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
 	select BR2_TOOLCHAIN_HAS_SSP
 	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
-- 
2.31.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
