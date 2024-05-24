Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21CF8C25B7D
	for <buildroot@archiver.kernel.org>; Fri, 24 May 2024 19:36:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DF469408C4;
	Fri, 24 May 2024 19:36:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id m9iawHHTJyFE; Fri, 24 May 2024 19:36:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 032F341B1E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 032F341B1E;
	Fri, 24 May 2024 19:36:52 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A07F61CFD23
 for <buildroot@lists.busybox.net>; Fri, 24 May 2024 19:36:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8C2FB834F7
 for <buildroot@lists.busybox.net>; Fri, 24 May 2024 19:36:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FnDIW4hsTwCA for <buildroot@lists.busybox.net>;
 Fri, 24 May 2024 19:36:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=103.168.172.145;
 helo=fout2-smtp.messagingengine.com; envelope-from=jiaxun.yang@flygoat.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 76FA9834F6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 76FA9834F6
Received: from fout2-smtp.messagingengine.com (fout2-smtp.messagingengine.com
 [103.168.172.145])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 76FA9834F6
 for <buildroot@buildroot.org>; Fri, 24 May 2024 19:36:47 +0000 (UTC)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.48])
 by mailfout.nyi.internal (Postfix) with ESMTP id 9D8C813800A5;
 Fri, 24 May 2024 15:36:46 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute7.internal (MEProxy); Fri, 24 May 2024 15:36:46 -0400
X-ME-Sender: <xms:TuxQZp2kb48xzDGwBjk2bdh_h2HqPvnOLebhUOivHFmCWW8OIGYxcw>
 <xme:TuxQZgFBII_dyO9zj2AJleEKmIhzcOOvZAEwFsJdXqxMxh5UQ1ZDZ7PSGs4ZjROvl
 o_E5rgH2kHwmmCtH14>
X-ME-Received: <xmr:TuxQZp7rbq26pLqjbOJIPY9kUx7LkH3_WkOMKIPZmgMmaahokxdxMh0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrvdeikedgudefiecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhfffugggtgffkfhgjvfevofesthejredtredtjeenucfhrhhomheplfhi
 rgiguhhnucgjrghnghcuoehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtohhmqe
 enucggtffrrghtthgvrhhnpeegleejgfdtkeejfefhhfeutefhueduueevieeivdffjedu
 tdetvdetleehgeehieenucffohhmrghinhepfihikhhiphgvughirgdrohhrghdplhhooh
 hnghhsohhnrdgtnhenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhl
 fhhrohhmpehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtohhm
X-ME-Proxy: <xmx:TuxQZm2ydf6h0sEdLFkR9xdRd8s1m-PJHNvA8h1hU6g-fHvoIkLEiQ>
 <xmx:TuxQZsGqKlViLpuVcgAq2uATiAFXk4XgcNlvauH07ve5_VsqF1Zutw>
 <xmx:TuxQZn-2ZuF4cH2gRqN_u5XEvJm-TpfJIvQYhutoOhs5W6ee0s7TlQ>
 <xmx:TuxQZplfYxK3C6LSE5B0O2li9oKlamentO_3N_f7Ptx97YwLvtpxVA>
 <xmx:TuxQZhMo7y6tN2qXPYuzyXDptiBDAxMdC9DZgUEMRmfqEgiiElm6DFuu>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 24 May 2024 15:36:45 -0400 (EDT)
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
Date: Fri, 24 May 2024 20:36:37 +0100
MIME-Version: 1.0
Message-Id: <20240524-loongarch64-v1-3-d24078d79cd5@flygoat.com>
References: <20240524-loongarch64-v1-0-d24078d79cd5@flygoat.com>
In-Reply-To: <20240524-loongarch64-v1-0-d24078d79cd5@flygoat.com>
To: buildroot@buildroot.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4695;
 i=jiaxun.yang@flygoat.com; h=from:subject:message-id;
 bh=PjFdhwl3/TVZStx8ruQ/P7bTV+3LIOuwCBhpAm0sSeY=;
 b=owGbwMvMwCXmXMhTe71c8zDjabUkhrSAN96fp/dJTqpTW/i7vuXooRv/7zvM2TtJ1/Qp76vLp
 UeZ8kQ/dpSyMIhxMciKKbKECCj1bWi8uOD6g6w/MHNYmUCGMHBxCsBEftox/LPKqfPhcfSx4ZM/
 LO02Lbpy5v5bjCfl3y61f2khxRjQwMXIMOnS0qok/muHzSbyOpQKbAussucuuKj8ftHc5z4Fxz5
 vYQMA
X-Developer-Key: i=jiaxun.yang@flygoat.com; a=openpgp;
 fpr=980379BEFEBFBF477EA04EF9C111949073FC0F67
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=flygoat.com; h=
 cc:cc:content-transfer-encoding:content-type:content-type:date
 :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to; s=fm2; t=1716579406;
 x=1716665806; bh=Vy3k4doxccQBfwCGEiP3ab841BQfhbDBjWjfWu4hjJU=; b=
 thJ8IJt9yx64xuaZtZqfiGtN8ewFKDWq0yFYIBnREarcoV711BR0vtFKE2qw0Cp5
 VJ9P7v4fWmBo47ENadYDGdnJioe2Mikhy6W/s7tew60sb4uLNPvsD/Mub5HXGZ2H
 FlkxO/wCyrLUmgLTw7AuYKx5eo5036H7v7/cEVhc1QxfqJCkDQzDHeRcOXyhAcIK
 gW8lKgsAO/nN1j//SNLw40xFMa9vLy6AzbW/r0hl6D5W8kfri5TP8f4aR4Y4Bj+k
 F2ZQFli6u17NLNXC0JihfbhUqDy54H9+NwGPZJsUXoDMBFdupax7FJehMA12PP3S
 T7NTb9xPv9UumKw+oEDu3w==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:content-type:date:date:feedback-id:feedback-id
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1716579406; x=
 1716665806; bh=Vy3k4doxccQBfwCGEiP3ab841BQfhbDBjWjfWu4hjJU=; b=c
 SF1uXOWG939MRBq11o2lQvCFxVsHSa4eLB69rspTiOCrwTEBHP1Fsv5zkZE0RVic
 ZxSv8jTUcnUvxmuPRG2c/41PcBwFm7U6iWrPbHN2U067oBYE+r639rs/hb1eGxTn
 Rjr6t9vY6acPYfIi18M+86K+JfVEMwKypCSxRtvhDTV7FWdxWg6qPl2yceLRcD4r
 sc6p6FfcKi+HrttQ/vdCL0VDBT7F0KPICKrCugTgP8Eq/mta1kEulDMeE7eo9GCT
 nOaU42kxyomPXjF0YpzaNn3i/RgNpjnXSwEHslCaEpc0pBRioIzWt8eAfw4pLzJZ
 JcJhAbgwsLBiIqx+J6raA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=flygoat.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key, unprotected) header.d=flygoat.com
 header.i=@flygoat.com header.a=rsa-sha256 header.s=fm2 header.b=thJ8IJt9; 
 dkim=pass (2048-bit key,
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=cSF1uXOW
Subject: [Buildroot] [PATCH RESEND 3/7] arch: Introduce LoongArch64
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
Cc: Romain Naour <romain.naour@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Introduce LoongArch64 at architecture level.

Config.in.loongarch is prepared for possible loongarch32
enablement in future.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 arch/Config.in           |  13 +++++
 arch/Config.in.loongarch | 127 +++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 140 insertions(+)

diff --git a/arch/Config.in b/arch/Config.in
index cc902446bfd9..504808fcbce4 100644
--- a/arch/Config.in
+++ b/arch/Config.in
@@ -77,6 +77,15 @@ config BR2_i386
 	  Intel i386 architecture compatible microprocessor
 	  http://en.wikipedia.org/wiki/I386
 
+config BR2_loongarch64
+	bool "LoongArch64"
+	select BR2_USE_MMU
+	select BR2_ARCH_IS_64
+	help
+	  LoongArch64 is a  is a 64-bit architecture developed by Loongson.
+	  http://www.loongson.cn/
+	  https://en.wikipedia.org/wiki/Loongson
+
 config BR2_m68k
 	bool "m68k"
 	# MMU support is set by the subarchitecture file, arch/Config.in.m68k
@@ -380,6 +389,10 @@ if BR2_arm || BR2_armeb || BR2_aarch64 || BR2_aarch64_be
 source "arch/Config.in.arm"
 endif
 
+if BR2_loongarch64
+source "arch/Config.in.loongarch"
+endif
+
 if BR2_m68k
 source "arch/Config.in.m68k"
 endif
diff --git a/arch/Config.in.loongarch b/arch/Config.in.loongarch
new file mode 100644
index 000000000000..f5d767a9d87d
--- /dev/null
+++ b/arch/Config.in.loongarch
@@ -0,0 +1,127 @@
+# LoongArch CPU
+
+choice
+	prompt "Target Architecture Variant"
+	default BR2_loongarch64_generic
+
+config BR2_loongarch64_generic
+	bool "Generic LoongArch 64-bit"
+	depends on BR2_ARCH_IS_64
+	select BR2_ARCH_NEEDS_GCC_AT_LEAST_12
+	help
+	  Generic LoongArch 64-bit processor.
+
+config BR2_loongarch64_v1_0
+	bool "LoongArch64 ISA version 1.0"
+	depends on BR2_ARCH_IS_64
+	select BR2_ARCH_NEEDS_GCC_AT_LEAST_13
+	help
+	  LoongArch64 ISA version 1.0 processor.
+
+config BR2_loongarch64_v1_1
+	bool "LoongArch64 ISA version 1.1"
+	depends on BR2_ARCH_IS_64
+	select BR2_ARCH_NEEDS_GCC_AT_LEAST_13
+	help
+	  LoongArch64 ISA version 1.1 processor.
+endchoice
+
+choice
+	prompt "FPU Type"
+	default BR2_LOONGARCH_FPU_64
+
+config BR2_LOONGARCH_FPU_64
+	bool "64"
+	help
+	  Allow the use of hardware floating-point instructions for 32-bit
+	  and 64-bit operations.
+
+config BR2_LOONGARCH_FPU_32
+	bool "32"
+	help
+	  Allow the use of hardware floating-point instructions for 32-bit
+	  operations only.
+
+config BR2_LOONGARCH_FPU_NONE
+	bool "none"
+	help
+	  Prevent the use of hardware floating-point instructions.
+endchoice
+
+choice
+	prompt "SIMD Type"
+	default BR2_LOONGARCH_SIMD_NONE
+
+config BR2_LOONGARCH_SIMD_NONE
+	bool "none"
+	help
+	  Prevent the use of hardware SIMD instructions.
+
+config BR2_LOONGARCH_SIMD_LSX
+	bool "LSX"
+	help
+	  Enable generating instructions from the 128-bit LoongArch SIMD
+	  Extension (LSX).
+
+config BR2_LOONGARCH_SIMD_LASX
+	bool "LASX"
+	help
+	  Enable generating instructions from the 256-bit LoongArch Advanced
+	  SIMD Extension (LASX) and the 128-bit LoongArch SIMD Extension (LSX).
+endchoice
+
+choice
+	prompt "Target ABI"
+	default BR2_LOONGARCH_ABI_LP64D if BR2_ARCH_IS_64 && BR2_LOONGARCH_FPU_64
+	default BR2_LOONGARCH_ABI_LP64F if BR2_ARCH_IS_64 && BR2_LOONGARCH_FPU_32
+	default BR2_LOONGARCH_ABI_LP64S if BR2_ARCH_IS_64 && BR2_LOONGARCH_SIMD_NONE
+
+config BR2_LOONGARCH_ABI_LP64D
+	bool "lp64d"
+	depends on BR2_ARCH_IS_64
+	depends on BR2_LOONGARCH_FPU_64
+
+config BR2_LOONGARCH_ABI_LP64F
+	bool "lp64f"
+	depends on BR2_ARCH_IS_64
+	depends on BR2_LOONGARCH_FPU_64 || BR2_LOONGARCH_FPU_32
+
+config BR2_LOONGARCH_ABI_LP64S
+	bool "lp64d"
+	depends on BR2_ARCH_IS_64
+endchoice
+
+config BR2_ARCH
+	default "loongarch64" if BR2_ARCH_IS_64
+
+config BR2_NORMALIZED_ARCH
+	default "loongarch"
+
+config BR2_ENDIAN
+	default "LITTLE"
+
+config BR2_GCC_TARGET_ARCH
+	default "loongarch64" if BR2_loongarch64_generic
+	default "la64v1.0" if BR2_loongarch64_v1_0
+	default "la64v1.1" if BR2_loongarch64_v1_1
+
+config BR2_GCC_TARGET_FPU
+	default "64" if BR2_LOONGARCH_FPU_64
+	default "32" if BR2_LOONGARCH_FPU_32
+	default "none" if BR2_LOONGARCH_FPU_NONE
+
+config BR2_GCC_TARGET_SIMD
+	default "lasx" if BR2_LOONGARCH_SIMD_LASX
+	default "lsx" if BR2_LOONGARCH_SIMD_LSX
+	default "none" if BR2_LOONGARCH_FPU_NONE
+
+config BR2_GCC_TARGET_ABI
+	default "lp64d" if BR2_LOONGARCH_ABI_LP64D
+	default "lp64f" if BR2_LOONGARCH_ABI_LP64F
+	default "lp64s" if BR2_LOONGARCH_ABI_LP64S
+
+config BR2_READELF_ARCH_NAME
+	default "LoongArch"
+
+# vim: ft=kconfig
+# -*- mode:kconfig; -*-

-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
