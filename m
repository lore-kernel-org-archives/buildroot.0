Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 125B4CD11C2
	for <buildroot@archiver.kernel.org>; Wed, 10 Apr 2024 17:19:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C5A4D605E8;
	Wed, 10 Apr 2024 17:19:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RX-LYh3K83IG; Wed, 10 Apr 2024 17:19:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E7F8F60BFB
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E7F8F60BFB;
	Wed, 10 Apr 2024 17:19:13 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7A87A1BF32A
 for <buildroot@lists.busybox.net>; Wed, 10 Apr 2024 17:19:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6397941713
 for <buildroot@lists.busybox.net>; Wed, 10 Apr 2024 17:19:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9haJEvkgpYYI for <buildroot@lists.busybox.net>;
 Wed, 10 Apr 2024 17:19:08 +0000 (UTC)
Received-SPF: Pass (sender SPF authorized) identity=helo;
 client-ip=217.70.178.240; helo=mslow1.mail.gandi.net;
 envelope-from=jeanmichel.hautbois@yoseli.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 5007441709
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5007441709
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5007441709
 for <buildroot@buildroot.org>; Wed, 10 Apr 2024 17:19:07 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (unknown [217.70.183.194])
 by mslow1.mail.gandi.net (Postfix) with ESMTP id 76E92C28DD
 for <buildroot@buildroot.org>; Wed, 10 Apr 2024 17:12:24 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 14FA040004;
 Wed, 10 Apr 2024 17:12:20 +0000 (UTC)
From: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
To: buildroot@buildroot.org
Date: Wed, 10 Apr 2024 19:12:09 +0200
Message-Id: <20240410171211.1633127-2-jeanmichel.hautbois@yoseli.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240410171211.1633127-1-jeanmichel.hautbois@yoseli.org>
References: <20240410171211.1633127-1-jeanmichel.hautbois@yoseli.org>
MIME-Version: 1.0
X-GND-Sasl: jeanmichel.hautbois@yoseli.org
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=yoseli.org; s=gm1; t=1712769140;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RBnsnoAQUY0stdYGhGLeLU0QRd5SsdvlsUTcoOoC0kc=;
 b=JwfXIk8C9VD6o6M/x2D99iT6kG7lGzmRSXXv8ATlEbjoWxnHp5laeTYvtmsGizeUok1ivZ
 s5Rs98KZhFhdX3acJqob0Q/f9L5/EXfxLB8u+/HlHekWHpaoTUfeeYgsSLqlthePwDuZvQ
 B+MidYGTuvdxS5lWNdd2Z3EuaOEyQEaeJsA/bS2oz7/eJ18KKjlfEDXhKr2o43Bqj3hDrA
 uBXJT8q+QjNJQjQ7ArAtQFwR9vdkdX4Skr8z/ORHfWUrR0qNlTV4k7AmVErBo3zq1S4+b2
 ltsYSrvZ1bUCpev1SkTpSgpoE/YvqcC+wojFD+1r9YLAWusMQ1fbIRHwF25pRA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=yoseli.org
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=yoseli.org header.i=@yoseli.org header.a=rsa-sha256
 header.s=gm1 header.b=JwfXIk8C
Subject: [Buildroot] [PATCH v2 1/3] arch: add support for mcf5441x Colfdire
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
 Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, yann.morin.1998@free.fr
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The m68k family ony has one Coldfire variant, namely the 5208. Add the
support for the MCF5441x CPU family in the configuration file.
This covers MCF54410, MCF54415, MCF54416, MCF54417 and MCF54418.

Commit [1] removed the GCC ARCH configuration which was used to
determine if the architecture is "m68k" or "cf". I have re-introduced
this configuration here, only for the MCF5441x case. It has been tested
as an external toolchain too.

[1]: eda11417be m68k: remove BR2_GCC_TARGET_ARCH

Signed-off-by: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
---
 arch/Config.in.m68k | 10 ++++++++++
 toolchain/Config.in |  1 +
 2 files changed, 11 insertions(+)

diff --git a/arch/Config.in.m68k b/arch/Config.in.m68k
index 9fd22aaf1e..c707276e9c 100644
--- a/arch/Config.in.m68k
+++ b/arch/Config.in.m68k
@@ -33,11 +33,21 @@ config BR2_m68k_cf5208
 	select BR2_m68k_cf
 	select BR2_SOFT_FLOAT
 
+config BR2_m68k_cf5441x
+	bool "5441x"
+	select BR2_m68k_cf
+	select BR2_USE_MMU
+	select BR2_SOFT_FLOAT
+
 endchoice
 
 config BR2_GCC_TARGET_CPU
 	default "68040"		if BR2_m68k_68040
 	default "5208"		if BR2_m68k_cf5208
+	default "54455"		if BR2_m68k_cf5441x
+
+config BR2_GCC_TARGET_ARCH
+	default "cf"            if BR2_m68k_cf5441x
 
 config BR2_READELF_ARCH_NAME
 	default "MC68000"
diff --git a/toolchain/Config.in b/toolchain/Config.in
index e8b3db64fb..782b9944d5 100644
--- a/toolchain/Config.in
+++ b/toolchain/Config.in
@@ -100,6 +100,7 @@ config BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS
 	depends on !BR2_ARM_CPU_ARMV5
 	depends on !BR2_sparc_v8
 	depends on !BR2_m68k_cf5208
+	depends on !BR2_m68k_cf5441x
 
 # GCC uses thunk functions to adjust the 'this' pointer when calling
 # C++ member functions in classes derived with multiple inheritance.
-- 
2.40.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
