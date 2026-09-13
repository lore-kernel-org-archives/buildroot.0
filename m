Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA7B5C88E56
	for <buildroot@archiver.kernel.org>; Sun, 13 Sep 2026 10:02:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9396180E76;
	Sun, 13 Sep 2026 10:02:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EUVgg9dPa9RK; Sun, 13 Sep 2026 10:02:07 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 27AC780E91
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789293727;
	b=dkZeLUVWIP8pga9JZpGVaJJDsXNsTE1ulbo46ZO2+tdD4NE/MpF/mD+eJLybCWFt45UL
	 gziNiP9B5TjZOghemuDlkQwRrCYX9kV46W+u6Hit6smWvdjw1z6hHik1bubDLMqzK+ufK
	 sHIPANPzONeAzmFRkwcDsb1eYzSSK5KfaQp02Fkp95+PweKzPYhMsIUIwNcX+Sf6urnYi
	 V7rDmNHtkdW7ZjY0mUb1pB+cNLMgsHP6+c7jp3TsfPHwDftkDEUDw6PmXUoDubT5Ki/0R
	 JzwxFtP+KusTKc+hGnwL6Lh7UihQ36QA34fYR7T5IcSstnMrRICWzaUirrrf7KxpeQg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789293727;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=XAqwJJDhjyfzwT52R2tG4vXPpiL8NMsA/EMVIJeM5NU=;
	b=AX1BHgefUUMJhmlox3wg52e+zCgQ+Npw+E2dt5rzqkBsHoRm/61OQqw5dOYVfQEyh1lB
	 w7BQgamZxVgTlxJUhdZxHPUnyzHUmFj2XJZ3zi/7OXfWqQOVvKqakMWTD2IyOOZmTL3Qv
	 MEFVvyNsuqpnpRGilLmVx34biT0RhPXKWJ+5Ikld4BGR/FlovHXopPnvfNDOx57DWpN7E
	 hQ3lvzQ42/P9GgZd7og/IBSxCehOqH03n1KiN0Uq9dJPfIA7gI+fQHE0/6LDfyRZuG0cC
	 2DaYbHZZqu/qP4pyZW06DfZ3ueSNAvxHmOYX9mwjPzRYzxJHjZUHv+5rjc0c+iorBgw==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789293727;
	bh=XAqwJJDhjyfzwT52R2tG4vXPpiL8NMsA/EMVIJeM5NU=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=jZ83HQN1O8/Nkznd7rwE8XX15ZvWawWFzpxQ+PFf0Wh1REiFcsH3Aaoc0mwz+I7S1
	 kovDNntLqk2NOTgtcmyrGN5lo4K+f87OhwLg11CLefRDEszLHdOlCzeuJyWirLIOnb
	 lLXr9+YCXnOxRECx0/14CqkeIsouQhYSP1KTrdqhUqoi+NhlwUiVLpfhxruroggJdC
	 Nu6kSbYsK5KhA4CibKWoqVCxc6eeJCq9ZGz7cwBZYWhQtWs4WtTNUn2cF7Tft/2eM8
	 f0Beg39c4YrwXypN3VbHxVT8sOnsVPRK6ykC6wNjWFq85hDB5ms5VKQQJkfP0U+XN2
	 0dwlxxszmM/LA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 27AC780E91;
	Sun, 13 Sep 2026 10:02:07 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 4A4AAEB
 for <buildroot@buildroot.org>; Sun, 13 Sep 2026 10:02:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3B16F60621
 for <buildroot@buildroot.org>; Sun, 13 Sep 2026 10:02:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id T8gnxTvYrE8t for <buildroot@buildroot.org>;
 Sun, 13 Sep 2026 10:02:03 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 0274E60604
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789293723;
 b=Gz4oFVU2GxFYKUHZwTnrs9I6u+/qyBW40f0rzE6DhTWe3JcF/1axuzAoRArilK0Z2OzV
 yde62kgOQcWoIkBshDsEZT24ICwdQ7t+KHG4JuSFk1s6cn+gubNyQzcKdUIYfTT0xHrBr
 UO5Oilh/w5twjeP7b0RcugGIoLYdZOdHHlZ+konf+DIxm9bgp9ZzVvjYlWgo6i+dEjWpj
 xjXuD0TpX9yb+qhCxaba3aLCiXM4FJ1yn+evL7FF42m4nd3pE0Gr/TVYbaR4wQ1D1euhk
 zRyYDuBAMZ1+KRCujqKukF2hoHt+emglI4yOBI8YNaZ6TC+Ha4UFL4b8lbbxTVZ+3sw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789293723;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=6YUuDeb0INrxK+8x3Ph17LQwm9W1zo6OeNXCu+Qcf7M=;
 b=YQT1Tjrj+JT9nPYsDvI7j+z3z/wMbKtQiydAS4IgI2hBw2+lNQbaOKnxkCStpwbwRIRe
 6+xN1mYrMOZPlzcjeLNIeIYfTAJghAv+nsgidqlE/oPSvQK6vnZREjpkD2GW4NJvl8z9b
 zAiz26Wy+bcIa03HN9sroTnKILwxeGo79tsMijO23GI1rpVdJkeSZ90rTXerGG4A9SKNY
 gnJ65H8ZU5V4R5b+gotXOzwB2xINCtK6/0zuBKWLfBFIIqpLAiPN23Zh2u4Z6Na2X1Fym
 +g5Nh1lhuAlhNhlPKDDa8WifdwGUu74qF/yZl9yZONnPB/8awj6zywZD/C0mRn4lDMg==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0274E60604
 for <buildroot@buildroot.org>; Sun, 13 Sep 2026 10:02:03 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 297C995B91; Sun, 13 Sep 2026 10:00:58 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 13 Sep 2026 11:56:17 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 43a8c35a383e53cc81ef4b56d346a5501178d7f8
X-Git-Newrev: d5990da7b19454852fd0cc2f530962f29ba89401
X-Patchwork-Hint: ignore
Message-Id: <20260913100058.297C995B91@busybox.osuosl.org>
Subject: [Buildroot] [git commit]
 toolchain/toolchain-external/toolchain-external-bootlin: regenerate after
 ARMv7 EABIhf toolchain fix
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/d5990da7b19454852fd0cc2f530962f29ba89401
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

The gen-bootlin-toolchains script has been fixed to generate more
correct conditions for the ARMv7 EABIhf toolchains (both little and
big endian). This change will make sure the toolchain cannot be
selected in a BR2_arm=y, BR2_ARM_CPU_ARMV8A=y, BR2_ARM_EABI=y
configuration.

Fixes:

  https://autobuild.buildroot.org/results/3ce1dbd480c71b782ef722c39034cb039a036523/

Reported-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 .../toolchain-external-bootlin/Config.in.options   | 40 ++++++++++++++--------
 1 file changed, 26 insertions(+), 14 deletions(-)

diff --git a/toolchain/toolchain-external/toolchain-external-bootlin/Config.in.options b/toolchain/toolchain-external/toolchain-external-bootlin/Config.in.options
index 86d951e8a6..81cb3f0a05 100644
--- a/toolchain/toolchain-external/toolchain-external-bootlin/Config.in.options
+++ b/toolchain/toolchain-external/toolchain-external-bootlin/Config.in.options
@@ -8,8 +8,8 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARCH_SUPPORTS
 	default y if BR2_arcle && BR2_archs38
 	default y if BR2_arm && BR2_ARM_CPU_ARMV5 && BR2_ARM_EABI
 	default y if BR2_arm && BR2_ARM_CPU_ARMV6 && BR2_ARM_EABIHF
-	default y if BR2_arm && (BR2_ARM_CPU_ARMV7A && BR2_ARM_EABIHF) || BR2_ARM_CPU_ARMV8A
-	default y if BR2_armeb && (BR2_ARM_CPU_ARMV7A && BR2_ARM_EABIHF) || BR2_ARM_CPU_ARMV8A
+	default y if BR2_arm && BR2_ARM_EABIHF && (BR2_ARM_CPU_ARMV7A || BR2_ARM_CPU_ARMV8A)
+	default y if BR2_armeb && BR2_ARM_EABIHF && (BR2_ARM_CPU_ARMV7A || BR2_ARM_CPU_ARMV8A)
 	default y if BR2_arm && BR2_ARM_CPU_ARMV7M && BR2_BINFMT_FLAT
 	default y if BR2_m68k_m68k && BR2_USE_MMU
 	default y if BR2_m68k_cf
@@ -770,7 +770,8 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV6_EABIHF_UCLIBC_STABLE
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7_EABIHF_GLIBC_BLEEDING_EDGE
 	bool "armv7-eabihf glibc bleeding-edge 2026.08-1"
 	depends on BR2_arm
-	depends on (BR2_ARM_CPU_ARMV7A && BR2_ARM_EABIHF) || BR2_ARM_CPU_ARMV8A
+	depends on BR2_ARM_EABIHF
+	depends on (BR2_ARM_CPU_ARMV7A || BR2_ARM_CPU_ARMV8A)
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_17
 	depends on BR2_USE_MMU
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_16
@@ -794,7 +795,8 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7_EABIHF_GLIBC_BLEEDING_EDGE
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7_EABIHF_GLIBC_STABLE
 	bool "armv7-eabihf glibc stable 2026.08-1"
 	depends on BR2_arm
-	depends on (BR2_ARM_CPU_ARMV7A && BR2_ARM_EABIHF) || BR2_ARM_CPU_ARMV8A
+	depends on BR2_ARM_EABIHF
+	depends on (BR2_ARM_CPU_ARMV7A || BR2_ARM_CPU_ARMV8A)
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
 	depends on BR2_USE_MMU
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
@@ -817,7 +819,8 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7_EABIHF_GLIBC_STABLE
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7_EABIHF_MUSL_BLEEDING_EDGE
 	bool "armv7-eabihf musl bleeding-edge 2026.08-1"
 	depends on BR2_arm
-	depends on (BR2_ARM_CPU_ARMV7A && BR2_ARM_EABIHF) || BR2_ARM_CPU_ARMV8A
+	depends on BR2_ARM_EABIHF
+	depends on (BR2_ARM_CPU_ARMV7A || BR2_ARM_CPU_ARMV8A)
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_17
 	depends on BR2_USE_MMU
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_16
@@ -841,7 +844,8 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7_EABIHF_MUSL_BLEEDING_EDGE
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7_EABIHF_MUSL_STABLE
 	bool "armv7-eabihf musl stable 2026.08-1"
 	depends on BR2_arm
-	depends on (BR2_ARM_CPU_ARMV7A && BR2_ARM_EABIHF) || BR2_ARM_CPU_ARMV8A
+	depends on BR2_ARM_EABIHF
+	depends on (BR2_ARM_CPU_ARMV7A || BR2_ARM_CPU_ARMV8A)
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
 	depends on BR2_USE_MMU
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
@@ -864,7 +868,8 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7_EABIHF_MUSL_STABLE
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7_EABIHF_UCLIBC_BLEEDING_EDGE
 	bool "armv7-eabihf uclibc bleeding-edge 2026.08-1"
 	depends on BR2_arm
-	depends on (BR2_ARM_CPU_ARMV7A && BR2_ARM_EABIHF) || BR2_ARM_CPU_ARMV8A
+	depends on BR2_ARM_EABIHF
+	depends on (BR2_ARM_CPU_ARMV7A || BR2_ARM_CPU_ARMV8A)
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_17
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_16
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_12
@@ -889,7 +894,8 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7_EABIHF_UCLIBC_BLEEDING_EDGE
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7_EABIHF_UCLIBC_STABLE
 	bool "armv7-eabihf uclibc stable 2026.08-1"
 	depends on BR2_arm
-	depends on (BR2_ARM_CPU_ARMV7A && BR2_ARM_EABIHF) || BR2_ARM_CPU_ARMV8A
+	depends on BR2_ARM_EABIHF
+	depends on (BR2_ARM_CPU_ARMV7A || BR2_ARM_CPU_ARMV8A)
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10
@@ -913,7 +919,8 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7_EABIHF_UCLIBC_STABLE
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMEBV7_EABIHF_GLIBC_BLEEDING_EDGE
 	bool "armebv7-eabihf glibc bleeding-edge 2026.08-1"
 	depends on BR2_armeb
-	depends on (BR2_ARM_CPU_ARMV7A && BR2_ARM_EABIHF) || BR2_ARM_CPU_ARMV8A
+	depends on BR2_ARM_EABIHF
+	depends on (BR2_ARM_CPU_ARMV7A || BR2_ARM_CPU_ARMV8A)
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_17
 	depends on BR2_USE_MMU
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_16
@@ -937,7 +944,8 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMEBV7_EABIHF_GLIBC_BLEEDING_EDGE
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMEBV7_EABIHF_GLIBC_STABLE
 	bool "armebv7-eabihf glibc stable 2026.08-1"
 	depends on BR2_armeb
-	depends on (BR2_ARM_CPU_ARMV7A && BR2_ARM_EABIHF) || BR2_ARM_CPU_ARMV8A
+	depends on BR2_ARM_EABIHF
+	depends on (BR2_ARM_CPU_ARMV7A || BR2_ARM_CPU_ARMV8A)
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
 	depends on BR2_USE_MMU
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
@@ -960,7 +968,8 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMEBV7_EABIHF_GLIBC_STABLE
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMEBV7_EABIHF_MUSL_BLEEDING_EDGE
 	bool "armebv7-eabihf musl bleeding-edge 2026.08-1"
 	depends on BR2_armeb
-	depends on (BR2_ARM_CPU_ARMV7A && BR2_ARM_EABIHF) || BR2_ARM_CPU_ARMV8A
+	depends on BR2_ARM_EABIHF
+	depends on (BR2_ARM_CPU_ARMV7A || BR2_ARM_CPU_ARMV8A)
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_17
 	depends on BR2_USE_MMU
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_16
@@ -984,7 +993,8 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMEBV7_EABIHF_MUSL_BLEEDING_EDGE
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMEBV7_EABIHF_MUSL_STABLE
 	bool "armebv7-eabihf musl stable 2026.08-1"
 	depends on BR2_armeb
-	depends on (BR2_ARM_CPU_ARMV7A && BR2_ARM_EABIHF) || BR2_ARM_CPU_ARMV8A
+	depends on BR2_ARM_EABIHF
+	depends on (BR2_ARM_CPU_ARMV7A || BR2_ARM_CPU_ARMV8A)
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
 	depends on BR2_USE_MMU
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
@@ -1007,7 +1017,8 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMEBV7_EABIHF_MUSL_STABLE
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMEBV7_EABIHF_UCLIBC_BLEEDING_EDGE
 	bool "armebv7-eabihf uclibc bleeding-edge 2026.08-1"
 	depends on BR2_armeb
-	depends on (BR2_ARM_CPU_ARMV7A && BR2_ARM_EABIHF) || BR2_ARM_CPU_ARMV8A
+	depends on BR2_ARM_EABIHF
+	depends on (BR2_ARM_CPU_ARMV7A || BR2_ARM_CPU_ARMV8A)
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_17
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_16
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_12
@@ -1032,7 +1043,8 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMEBV7_EABIHF_UCLIBC_BLEEDING_EDGE
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMEBV7_EABIHF_UCLIBC_STABLE
 	bool "armebv7-eabihf uclibc stable 2026.08-1"
 	depends on BR2_armeb
-	depends on (BR2_ARM_CPU_ARMV7A && BR2_ARM_EABIHF) || BR2_ARM_CPU_ARMV8A
+	depends on BR2_ARM_EABIHF
+	depends on (BR2_ARM_CPU_ARMV7A || BR2_ARM_CPU_ARMV8A)
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
