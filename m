Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F402E668A5
	for <buildroot@archiver.kernel.org>; Fri, 19 Dec 2025 22:50:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5D9344040E;
	Fri, 19 Dec 2025 22:50:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6d2ssrJuNrVF; Fri, 19 Dec 2025 22:50:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8ECAE40F05
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766184621;
	bh=xK+R1axcl+ABSC8FMGiNvkUTBnPrxRapyPFLDDsCxmk=;
	h=From:Date:References:In-Reply-To:To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=juZJFuQDRqryz7+nhyNQVLiVHQqoOhiAUQ4m/4TVjOOwjd1fnFNtAk1zQkLOj31PM
	 91HAlytOGTeRP3e+hX5RFrIRQsgGMsxb7MLrYm//UJaEP/ztabq5KYcXFktZKqOjm8
	 VkQkCg250YlcYWPCy06/BK0FWU57QEajMU3ToXq1vFwXLmoeyO9OuV1gXStMRS5dnW
	 NEY+2WP6HuY2V6u6vsahTNZyyuXYrMj6wwmGiHoR4NvDfTV3xBHZANxtROAb2OnDdL
	 dZtf0J5tYgpOIHKX6diEtXyyombW0u4tOfcxp02UFtSsi+kk6SnWRpXUTld82rFieV
	 b43Uhp2oYfH/g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8ECAE40F05;
	Fri, 19 Dec 2025 22:50:21 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 6D229119
 for <buildroot@buildroot.org>; Fri, 19 Dec 2025 22:50:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 44B3940F35
 for <buildroot@buildroot.org>; Fri, 19 Dec 2025 22:50:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BtsoCQU54ayY for <buildroot@buildroot.org>;
 Fri, 19 Dec 2025 22:50:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::330; helo=mail-wm1-x330.google.com;
 envelope-from=obbardc@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org E7FAD402AC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E7FAD402AC
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E7FAD402AC
 for <buildroot@buildroot.org>; Fri, 19 Dec 2025 22:50:15 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-47bdbc90dcaso15467425e9.1
 for <buildroot@buildroot.org>; Fri, 19 Dec 2025 14:50:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766184614; x=1766789414;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=q3KSHqDaQKnnsw44pkLrp1GyoJP59s9/KUpudJI/v98=;
 b=KVuUpJBEnqzumXVjmkTi7vNrziv7tOj4PnguY3FeAe778U/bLP3VhugYf0RQ4UcVzE
 wK+Nzo1xsJFGzMeXXnH2S31dJ6/r02/XlArdpN2eMrab8wpKNMK5CXV1JaOn39ori9hQ
 BfaYxILat7EFMJZCdb711cbef0lgZiqWmYwRV8ZKb20WwJ1UvWC88NOOwDFx3Bp+nJcD
 C/lFw/uTKe5MXLcQk5YMxFPjlHoBW68Y7WhHdntFt6bhur7aQt7Furcc0tANlMpl+SrG
 3OtZaaSuUXzs1dpClvSCBFG9VHecRGfKTZMJC0/TiPNzeJPzzulXrmXWA3eEqGkVKTD5
 yEDQ==
X-Gm-Message-State: AOJu0YxXdLeqpJfi0Qz9SFEYzLS+ZFy2NrKqmSO65fZ5JUJ7VXuUEkLU
 7mxDltyn4KNVeqRN2YoOxlXs8LSpUMdb4aWyvlvB1TD5fywSnpnchHuO
X-Gm-Gg: AY/fxX5yi/XeSWPQ7a35hLFxbALQTmua++NwDFpKfhk3EoDOnGf0VzGeh+gpdifZiiK
 1N3qb7gQgzcdq50ZmzuOcWjcnnbLDV3G6NE3xDzs60qTUpu1wR0aMUIzbzVqi/N7w367Mh5c95N
 ppXaJQOFNqoPr6WaYagtaWag2Eh/zT4fsSuYoqpUYEy0JWMPvmPM6yu412F9SsZhHZdrxGezq9X
 pJrjQ5EFjf5+h2c3qJ80o4uvasONXqmdZeVVt4xAq+G10Ddiz6YwrIKaGovlkZUSbsT+wy4Sgb5
 fYrNVQazbUrNlxJwSbHsTPHOgMLl6qxqT3/rI7ymRmfi/o2pOVWv/rJoY+oxKkfChg2ScOF/UyZ
 RT4Sr9ioyxBeo074yVJ0UDYyRthn4BWOQ1m+1L5ta/9C9lJv6ELdi90DyyeV5lpx6RNzRUjX4WA
 o87L0jqK2hFhnAz2g38mhV/KHUqLtz/G6Zc6nmwUmiGWajhuPVBCI2/i/U67aO
X-Google-Smtp-Source: AGHT+IHl1byJzTM9XHQvkOqOgw2LQa0nysh9UEtrHURq5aFuO4DGzHdlHvkGEn9izJT1vchfiDAW3w==
X-Received: by 2002:a05:600c:46c4:b0:471:14af:c715 with SMTP id
 5b1f17b1804b1-47d19533472mr47189015e9.3.1766184613607; 
 Fri, 19 Dec 2025 14:50:13 -0800 (PST)
Received: from localhost (host109-150-127-3.range109-150.btcentralplus.com.
 [109.150.127.3]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47be3a7b687sm46457425e9.6.2025.12.19.14.50.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Dec 2025 14:50:12 -0800 (PST)
From: Christopher Obbard <obbardc@gmail.com>
Date: Fri, 19 Dec 2025 22:49:58 +0000
MIME-Version: 1.0
Message-Id: <20251219-wip-obbardc-boot-efibootguard-initial-pkg-v1-1-0f307ee73919@gmail.com>
References: <20251219-wip-obbardc-boot-efibootguard-initial-pkg-v1-0-0f307ee73919@gmail.com>
In-Reply-To: <20251219-wip-obbardc-boot-efibootguard-initial-pkg-v1-0-0f307ee73919@gmail.com>
To: buildroot@buildroot.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=12256; i=obbardc@gmail.com;
 h=from:subject:message-id; bh=lqNfiQdJYe5jwV/OJNlWhmWLnaRs/jILzmdMr7Ur3Jo=;
 b=owEBbQKS/ZANAwAKAWNNxPBocEb4AcsmYgBpRdajQzLeujl7nIM+NiPh9V2NZ84hBHKLwrB6O
 Md2lgv+jAqJAjMEAAEKAB0WIQTxi9yLbCX5CqI9UXRjTcTwaHBG+AUCaUXWowAKCRBjTcTwaHBG
 +OtuD/9Ni7tdwK3KTP8AdREWkV8+qEx1rjTMgK3sa5fEENtdqETJOQn4XIygn97mrzqtXK2RwTx
 V0Kt/zLn92KMp4vrBIiMDmNIJNGGAnMCx/YpJNXnqYFdg1i76LVrzgZ3zdgSJFh9xqkzCOzP4ev
 vOfTYSU3t4dWLbU5mp7aIw+LNkXVxn0xRIglwPJ7SJ5e53TxZvVzhji91qZPYRHvC9+u3JocGVA
 aoTJOuLek9l/M0utX/ZnWDzgM8dG6VUBgNDX9KClY0aYRCqB5edWYpNezucZ6TcvN9xArbRBPTv
 YZgE+XbZG7k3o7/IImbdH7pi6nufVHQtm7d+Ft3KzRTMX8cCi8rUs8+AB1lPKHUcm6gIkvh8912
 7IWtgG8wykG5lH6TG4rLoem1kwO2q/tFVjkTKCbOPBWI5V4QmRmM/DgKb9/QcyliZRoKoCGLdKG
 EpyVap3Q9kqrH+k6PmuVqjy1bshdMWsTxcKcfHXEyEVXKAE2MpO62zHtzvNG6KBQhYKbfEsKhUR
 z05+snMCF9BSvecSSYhxtJzKq04ORDz28zLxDMzXhnB3qlebAmuzFu+5cHaXEYQWuhlzhYjQnpL
 M3yeoldRlPsEdQyzCizFuRWujrKhQFAhiyULoObt5ZRlz3TbWuEmwSKlzW1bUbSSRfw/DbEj+tI
 S66uqlldF4hPSrg==
X-Developer-Key: i=obbardc@gmail.com; a=openpgp;
 fpr=F18BDC8B6C25F90AA23D5174634DC4F0687046F8
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1766184614; x=1766789414; darn=buildroot.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to;
 bh=q3KSHqDaQKnnsw44pkLrp1GyoJP59s9/KUpudJI/v98=;
 b=cb9j84cWCio2RDq7GQuqncj3khJwFUYmC19Sno8ZJ/kVA2MhPHT9T+yvytjPFA30z1
 2TvSZarvWAx7F4fzH7vBVj9Au+ups5TVk1YYlwCBMblSDYcegr5vA9DbKzlDpmGAPNEz
 H82fEEPUOy8pppamMFPCH8oMBpYLRaYyJvTMhX3yrFI0lqCgHrQ7hYk2PK0dUqex0ESK
 iNiw5dnlGNO0o2JsJ8BWPmeRJYXXC3QwY76mwaNo3iYVkITyfC3bhluCdtzZhkq6cVOg
 T+RIgpoijNoj8ByJT9QGbzYI0Xqm/DdrIrI9uymfYLbqod1S7Hv9UjaQBLfbWo/hgZS2
 JjQQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=cb9j84cW
Subject: [Buildroot] [PATCH 1/2] boot/efibootguard: new boot package
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Christopher Obbard <obbardc@gmail.com>, efibootguard-dev@googlegroups.com,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This patch adds a new boot package to Buildroot for building the
efibootguard bootloader from the https://github.com/siemens/efibootguard
repository.

efibootguard can be chainloaded as an EFI application or used as a
standalone bootloader and can be useful when building A/B systems.

Add a recipe to build the EFI bootloader application, user-space
tooling & host tooling (both of which are used to manage efibootguard
configuration).

efibootguard supports multiple architectures, but for now only build
the EFI bootloader for x86_64.

Signed-off-by: Christopher Obbard <obbardc@gmail.com>
---
 DEVELOPERS                                         |  3 +
 boot/Config.in                                     |  2 +
 ...e-segfault-when-building-with-busybox-ash.patch | 38 ++++++++++
 ...-parsing-and-checks-to-also-support-gnu-e.patch | 88 ++++++++++++++++++++++
 boot/efibootguard/Config.in                        | 37 +++++++++
 boot/efibootguard/Config.in.host                   |  8 ++
 boot/efibootguard/efibootguard.hash                |  3 +
 boot/efibootguard/efibootguard.mk                  | 60 +++++++++++++++
 8 files changed, 239 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 1b27df9beb..9b789b3023 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -689,6 +689,9 @@ F:	package/perl-sys-mmap/
 F:	package/perl-time-parsedate/
 F:	package/perl-x10/
 
+N:	Christopher Obbard <obbardc@gmail.com>
+F:	boot/efibootguard/
+
 N:	Clayton Shotwell <clayton.shotwell@collins.com>
 F:	package/audit/
 F:	package/checkpolicy/
diff --git a/boot/Config.in b/boot/Config.in
index d3e1b9c055..1aa1a4bfff 100644
--- a/boot/Config.in
+++ b/boot/Config.in
@@ -15,6 +15,8 @@ source "boot/barebox/Config.in"
 source "boot/binaries-marvell/Config.in"
 source "boot/boot-wrapper-aarch64/Config.in"
 source "boot/edk2/Config.in"
+source "boot/efibootguard/Config.in"
+source "boot/efibootguard/Config.in.host"
 source "boot/grub2/Config.in"
 source "boot/mv-ddr-marvell/Config.in"
 source "boot/mxs-bootlets/Config.in"
diff --git a/boot/efibootguard/0001-fix-resolve-segfault-when-building-with-busybox-ash.patch b/boot/efibootguard/0001-fix-resolve-segfault-when-building-with-busybox-ash.patch
new file mode 100644
index 0000000000..db301c8e93
--- /dev/null
+++ b/boot/efibootguard/0001-fix-resolve-segfault-when-building-with-busybox-ash.patch
@@ -0,0 +1,38 @@
+From f094a141df61c960bf7db4a26ab6a461438a2502 Mon Sep 17 00:00:00 2001
+From: Philip Schildkamp <philip.schildkamp@uni-koeln.de>
+Date: Sun, 28 Sep 2025 13:29:46 +0200
+Subject: [PATCH] fix: resolve segfault when building with busybox/ash
+
+This patch resolves a segmentation fault caused by the configure script,
+when building efibootguard using the BusyBox shell ash. The segmentation
+fault seems to be caused by the BusyBox shell consuming the opening $((
+as the beginning of an arithmetic statement.
+
+To mitigate this, this patch simply inserts one space character between
+the opening double parenthesis, whereby the BusyBox shell no longer
+tries to parse this as an arithmetic expression.
+
+Signed-off-by: Philip Schildkamp <philip.schildkamp@uni-koeln.de>
+Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
+
+Upstream: f094a141df61c960bf7db4a26ab6a461438a2502
+Signed-off-by: Christopher Obbard <obbardc@gmail.com>
+---
+ configure.ac | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index 038930b..d1c932b 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -234,7 +234,7 @@ fi
+ # Note: gnu-efi introduced pkg-config with version 3.0.16
+ # GNU_EFI_VERSION resolves to gnu-efi's version without dots, e.g., GNU_EFI_VERSION=3016
+ # gnu-efi versions < 3.0.16 resolve to GNU_EFI_VERSION=0
+-AC_SUBST([GNU_EFI_VERSION], [$(($PKG_CONFIG --modversion "gnu-efi" 2>/dev/null || echo 0) | $TR -d '.' )])
++AC_SUBST([GNU_EFI_VERSION], [$( ($PKG_CONFIG --modversion "gnu-efi" 2>/dev/null || echo 0) | $TR -d '.' )])
+ AC_DEFINE_UNQUOTED([GNU_EFI_VERSION], [${GNU_EFI_VERSION}], [gnu-efi version])
+ 
+ AC_SUBST([OBJCOPY_HAS_EFI_APP_TARGET], [$($OBJCOPY --info | $GREP -q pei- 2>/dev/null && echo "true")])
+-- 
+2.51.0
diff --git a/boot/efibootguard/0002-Fix-version-parsing-and-checks-to-also-support-gnu-e.patch b/boot/efibootguard/0002-Fix-version-parsing-and-checks-to-also-support-gnu-e.patch
new file mode 100644
index 0000000000..3cc22db75e
--- /dev/null
+++ b/boot/efibootguard/0002-Fix-version-parsing-and-checks-to-also-support-gnu-e.patch
@@ -0,0 +1,88 @@
+From 933dd15d71205ead6bc017740ad4618ee6c470ae Mon Sep 17 00:00:00 2001
+From: Christian Storm <christian.storm@siemens.com>
+Date: Thu, 20 Nov 2025 19:01:37 +0000
+Subject: [PATCH] Fix version parsing and checks to also support gnu-efi >= 4.0
+
+The current mechanism to parse gnu-efi's version is restricted to
+gnu-efi 3.x series. Improve the calculation to also account for
+gnu-efi 4.x series (and beyond).
+
+Reported-by: Andreas Tobler <andreas.tobler@onway.ch>
+Signed-off-by: Christian Storm <christian.storm@siemens.com>
+Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
+
+Upstream: 933dd15d71205ead6bc017740ad4618ee6c470ae
+Signed-off-by: Christopher Obbard <obbardc@gmail.com>
+---
+ configure.ac                     | 6 +++---
+ drivers/watchdog/wdfuncs_end.c   | 2 +-
+ drivers/watchdog/wdfuncs_start.c | 2 +-
+ main.c                           | 2 +-
+ 4 files changed, 6 insertions(+), 6 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index d1c932b..7f22339 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -40,7 +40,7 @@ AC_PROG_CC
+ AC_CHECK_TOOL(LD, ld)
+ AC_CHECK_TOOL(OBJCOPY, objcopy)
+ AC_CHECK_TOOL(GREP, grep)
+-AC_CHECK_TOOL(TR, tr)
++AC_CHECK_TOOL(AWK, awk)
+ 
+ dnl Dont try to use things like -std=c99 for efi compilation
+ GNUEFI_CC=$CC
+@@ -232,9 +232,9 @@ if test "x$PKG_CONFIG" = "xno"; then
+ fi
+ 
+ # Note: gnu-efi introduced pkg-config with version 3.0.16
+-# GNU_EFI_VERSION resolves to gnu-efi's version without dots, e.g., GNU_EFI_VERSION=3016
++# GNU_EFI_VERSION resolves to gnu-efi's version without dots, e.g., GNU_EFI_VERSION=3000016
+ # gnu-efi versions < 3.0.16 resolve to GNU_EFI_VERSION=0
+-AC_SUBST([GNU_EFI_VERSION], [$( ($PKG_CONFIG --modversion "gnu-efi" 2>/dev/null || echo 0) | $TR -d '.' )])
++AC_SUBST([GNU_EFI_VERSION], [$( ($PKG_CONFIG --modversion "gnu-efi" 2>/dev/null || echo 0) | $AWK -F. '{print $1*1000000 + $2*1000 + $3}' )])
+ AC_DEFINE_UNQUOTED([GNU_EFI_VERSION], [${GNU_EFI_VERSION}], [gnu-efi version])
+ 
+ AC_SUBST([OBJCOPY_HAS_EFI_APP_TARGET], [$($OBJCOPY --info | $GREP -q pei- 2>/dev/null && echo "true")])
+diff --git a/drivers/watchdog/wdfuncs_end.c b/drivers/watchdog/wdfuncs_end.c
+index d19a0ab..f90ffc7 100644
+--- a/drivers/watchdog/wdfuncs_end.c
++++ b/drivers/watchdog/wdfuncs_end.c
+@@ -12,7 +12,7 @@
+  * SPDX-License-Identifier:	GPL-2.0-only
+  */
+ 
+-#if GNU_EFI_VERSION < 3016
++#if GNU_EFI_VERSION < 3000016
+ 
+ #include <efi.h>
+ #include "utils.h"
+diff --git a/drivers/watchdog/wdfuncs_start.c b/drivers/watchdog/wdfuncs_start.c
+index bdf47f5..c627050 100644
+--- a/drivers/watchdog/wdfuncs_start.c
++++ b/drivers/watchdog/wdfuncs_start.c
+@@ -12,7 +12,7 @@
+  * SPDX-License-Identifier:	GPL-2.0-only
+  */
+ 
+-#if GNU_EFI_VERSION < 3016
++#if GNU_EFI_VERSION < 3000016
+ 
+ #include <efi.h>
+ #include "utils.h"
+diff --git a/main.c b/main.c
+index 5d61385..b1bbc56 100644
+--- a/main.c
++++ b/main.c
+@@ -45,7 +45,7 @@ VOID register_watchdog(WATCHDOG_DRIVER *driver)
+ 
+ static EFI_STATUS probe_watchdogs(UINTN timeout)
+ {
+-#if GNU_EFI_VERSION < 3016
++#if GNU_EFI_VERSION < 3000016
+ 	const unsigned long *entry = wdfuncs_start;
+ 	for (entry++; entry < wdfuncs_end; entry++) {
+ 		((void (*)(void))*entry)();
+-- 
+2.51.0
diff --git a/boot/efibootguard/Config.in b/boot/efibootguard/Config.in
new file mode 100644
index 0000000000..47fd478e8b
--- /dev/null
+++ b/boot/efibootguard/Config.in
@@ -0,0 +1,37 @@
+config BR2_TARGET_EFIBOOTGUARD_ARCH_SUPPORTS
+	bool
+	default y if BR2_x86_64
+	depends on BR2_USE_MMU
+
+config BR2_TARGET_EFIBOOTGUARD
+	bool "efibootguard"
+	depends on BR2_TARGET_EFIBOOTGUARD_ARCH_SUPPORTS
+	depends on BR2_USE_WCHAR
+	select BR2_PACKAGE_GNU_EFI
+	select BR2_PACKAGE_PCIUTILS if BR2_TARGET_EFIBOOTGUARD_INSTALL_TOOLS
+	help
+	  EFI Boot Guard is a UEFI bootloader intended for robust
+	  A/B style updates. It arms a hardware watchdog before
+	  handing over control to the OS and supports a fail-safe
+	  boot mechanism to roll back if a boot attempt fails.
+
+	  https://github.com/siemens/efibootguard
+
+if BR2_TARGET_EFIBOOTGUARD
+
+config BR2_TARGET_EFIBOOTGUARD_X86_64
+	bool "x86-64"
+	depends on BR2_x86_64
+	help
+	  Select this option if the platform you're targeting has a
+	  64 bits EFI BIOS.
+
+config BR2_TARGET_EFIBOOTGUARD_INSTALL_TOOLS
+	bool "install tools"
+	help
+	  Install the efibootguard user-space tools (e.g.
+	  bg_printenv and bg_setenv) on the target. These tools
+	  allow reading and updating efibootguard's configuration
+	  in user-space.
+
+endif # BR2_TARGET_EFIBOOTGUARD
diff --git a/boot/efibootguard/Config.in.host b/boot/efibootguard/Config.in.host
new file mode 100644
index 0000000000..845c14c079
--- /dev/null
+++ b/boot/efibootguard/Config.in.host
@@ -0,0 +1,8 @@
+config BR2_TARGET_HOST_EFIBOOTGUARD
+	bool "host efibootguard"
+	help
+	  Build efibootguard companion tools for the host. These
+	  can be used during image creation to inspect and
+	  modify the efibootguard configuration data.
+
+	  https://github.com/siemens/efibootguard
diff --git a/boot/efibootguard/efibootguard.hash b/boot/efibootguard/efibootguard.hash
new file mode 100644
index 0000000000..48e03496ff
--- /dev/null
+++ b/boot/efibootguard/efibootguard.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256  f252e87b6acc74df34a0d894f2b5188fe797c2a2b7a14a231b9f224ad9b9de20  efibootguard-0.21.tar.gz
+sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/boot/efibootguard/efibootguard.mk b/boot/efibootguard/efibootguard.mk
new file mode 100644
index 0000000000..9fe8ff63a7
--- /dev/null
+++ b/boot/efibootguard/efibootguard.mk
@@ -0,0 +1,60 @@
+################################################################################
+#
+# efibootguard
+#
+################################################################################
+
+EFIBOOTGUARD_VERSION = 0.21
+EFIBOOTGUARD_SITE = $(call github,siemens,efibootguard,refs/tags/v$(EFIBOOTGUARD_VERSION))
+EFIBOOTGUARD_LICENSE = GPL-2.0-only
+EFIBOOTGUARD_LICENSE_FILES = COPYING
+
+EFIBOOTGUARD_DEPENDENCIES = \
+	gnu-efi \
+	host-autoconf-archive
+
+ifeq ($(BR2_TARGET_EFIBOOTGUARD_INSTALL_TOOLS),y)
+EFIBOOTGUARD_DEPENDENCIES += pciutils
+EFIBOOTGUARD_INSTALL_TARGET = YES
+else
+EFIBOOTGUARD_INSTALL_TARGET = NO
+endif
+
+EFIBOOTGUARD_INSTALL_IMAGES = YES
+
+EFIBOOTGUARD_AUTORECONF = YES
+
+EFIBOOTGUARD_AUTORECONF_OPTS = \
+	-I $(HOST_DIR)/share/autoconf-archive
+
+EFIBOOTGUARD_CONF_OPTS = \
+	--with-gnuefi-sys-dir=$(STAGING_DIR) \
+	--with-gnuefi-include-dir=$(STAGING_DIR)/usr/include/efi \
+	--with-gnuefi-lib-dir=$(STAGING_DIR)/usr/lib \
+	--disable-completion \
+	--disable-tests
+
+# TODO: Perhaps take inspiration from Debian patch https://salsa.debian.org/debian/efibootguard/-/blob/master/debian/patches/always-override-stack-protector-variables-in-EFI-bui.patch?ref_type=heads
+EFIBOOTGUARD_CONF_ENV = \
+	LDFLAGS="$(LDFLAGS) -no-pie"
+
+define EFIBOOTGUARD_INSTALL_IMAGES_CMDS
+	$(INSTALL) -d $(BINARIES_DIR)/efibootguard
+	$(INSTALL) -m 0644 $(@D)/efibootguardx64.efi $(BINARIES_DIR)/efibootguard/
+endef
+
+HOST_EFIBOOTGUARD_DEPENDENCIES = \
+	host-autoconf-archive
+
+HOST_EFIBOOTGUARD_AUTORECONF = YES
+
+HOST_EFIBOOTGUARD_AUTORECONF_OPTS = \
+	-I $(HOST_DIR)/share/autoconf-archive
+
+HOST_EFIBOOTGUARD_CONF_OPTS = \
+	--disable-bootloader \
+	--disable-completion \
+	--disable-tests
+
+$(eval $(autotools-package))
+$(eval $(host-autotools-package))

-- 
2.51.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
