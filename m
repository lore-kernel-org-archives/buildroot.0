Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2FCDD2F35C
	for <buildroot@archiver.kernel.org>; Tue, 13 Jan 2026 19:46:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A96EB841A1;
	Tue, 13 Jan 2026 19:46:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5h_N2lKidtkt; Tue, 13 Jan 2026 19:46:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B1E93841A2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768333567;
	bh=5EoVG+ngc+9GBQ9yZfhov51LOQhqp5WPz5+hi3ja5gU=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=h23rNIHX8v2ldVMXxCH2uW/M7ZD92DPGVmJIG3HWwAqu+DSoKG7B/jGK15ff8/Hdq
	 x3ALadpRowMSwWwdg7MUDxszZwb0XfgP4TwmKYIhRoZ3gSNH3g0w2IYZp9ZdkdWa4L
	 yI+45Giky0NPkozyAxiPr616zpexT5F3kCM5GaDmdg7CVVJaeRfa5EF808qdYyt9rY
	 5te1nMpFuZmpQpK/q6rY0SPc53CCVLFIDhPsxCB3lo7HTXhic2/QE7wdRV9YXTKJKt
	 fOvhlpJwdsQRpX2Adtvm1b/d1eXiJ9vPZy5W+g7Gy+F0Oy28lhYB2JDuC9qvlmLHht
	 Xu60YnVAUpYxA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B1E93841A2;
	Tue, 13 Jan 2026 19:46:07 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 4429D231
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:46:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 35592841A4
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:46:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3ED59Eje2ElH for <buildroot@buildroot.org>;
 Tue, 13 Jan 2026 19:46:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 0A59784196
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0A59784196
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0A59784196
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:46:02 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id ECFC2B97A885; Tue, 13 Jan 2026 20:46:00 +0100 (CET)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Arnout Vandecappelle <arnout@rnout.be>,
	buildroot@buildroot.org
Date: Tue, 13 Jan 2026 20:45:59 +0100
Message-ID: <20260113194559.98178-1-arnout@rnout.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251201183142.2493628-1-bernd@kuhls.net>
References: <20251201183142.2493628-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1768333561; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=S5QSpF0PT39Chyi87jRxLQQC5qeMMKzSNRvwNt7oG48=;
 b=VobnCFVtBAiCpxyKYtzfVvvP5oCd27LS+Zj6ao9MKkqSTZOA/UybKEH/N7SMCYgaGDR9Kt
 7M9mjV20QIp4OeCM25gD5nLW8MbsVaGEAlN7OtZIdGeLynO5w41QekqrYOV4ItD8CA9KRZ
 o/JgiaW0gd6B5LYUNNEYoMaZKIi5f3xgzUBX95/eZIwLXdLeL/F2UpUG0eqyQyBAYmvTec
 DaXn1IHG/1u+jVQF+BREuBHMq8pUvnAKJ4fD1NY8P0njb0h1y9i2gNtakfkciirQk/gAgr
 4Fj79iw47JcVY446WVFDeg4t4NGHGV0I7v25/Tx6wtzKDZBEeI8IeBcCZlioug==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=VobnCFVt
Subject: Re: [Buildroot] [PATCH 1/1] package/ledmon: update patch to fix
 musl build
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In reply of:
> Updated patch following an upstream review:
> https://github.com/md-raid-utilities/ledmon/pull/272#issuecomment-3596495739
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.02.x and 2025.11.x. Thanks

> ---
> Build-tested using this defconfig
> 
> BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
> BR2_PACKAGE_LEDMON=y
> 
> 35 builds, 6 skipped, 0 build failed, 0 legal-info failed, 0 show-info failed
> 
>  ...-Include-libgen.h-to-fix-musl-builds.patch | 100 ------------------
>  ...e-basename-if-GLIBC-is-not-avialable.patch |  42 ++++++++
>  2 files changed, 42 insertions(+), 100 deletions(-)
>  delete mode 100644 package/ledmon/0001-Include-libgen.h-to-fix-musl-builds.patch
>  create mode 100644 package/ledmon/0001-libled-provide-basename-if-GLIBC-is-not-avialable.patch
> 
> diff --git a/package/ledmon/0001-Include-libgen.h-to-fix-musl-builds.patch b/package/ledmon/0001-Include-libgen.h-to-fix-musl-builds.patch
> deleted file mode 100644
> index 713aaee020..0000000000
> --- a/package/ledmon/0001-Include-libgen.h-to-fix-musl-builds.patch
> +++ /dev/null
> @@ -1,100 +0,0 @@
> -From 95adecd3cc8e94f9964c34fdf0354c209acce166 Mon Sep 17 00:00:00 2001
> -From: Bernd Kuhls <bernd@kuhls.net>
> -Date: Thu, 27 Nov 2025 21:17:22 +0100
> -Subject: [PATCH] Include libgen.h to fix musl builds
> -
> -Fixes various build errors like
> -
> -block.c: In function 'block_set_devnode':
> -block.c:226:22: error: implicit declaration of function 'basename'
> - [-Wimplicit-function-declaration]
> -  226 |         char *name = basename(device->sysfs_path);
> -
> -Upstream: https://github.com/md-raid-utilities/ledmon/pull/272
> -
> -Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> -[Bernd: backported upstream PR to v1.1.0]
> ----
> - src/ledctl/ledctl.c | 1 +
> - src/ledmon/ledmon.c | 1 +
> - src/lib/block.c     | 1 +
> - src/lib/npem.c      | 1 +
> - src/lib/slot.c      | 1 +
> - src/lib/vmdssd.c    | 1 +
> - 6 files changed, 6 insertions(+)
> -
> -diff --git a/src/ledctl/ledctl.c b/src/ledctl/ledctl.c
> -index 30adc74..af2ea1b 100644
> ---- a/src/ledctl/ledctl.c
> -+++ b/src/ledctl/ledctl.c
> -@@ -5,6 +5,7 @@
> - #include <ctype.h>
> - #include <errno.h>
> - #include <getopt.h>
> -+#include <libgen.h>
> - #include <linux/limits.h>
> - #include <inttypes.h>
> - #include <limits.h>
> -diff --git a/src/ledmon/ledmon.c b/src/ledmon/ledmon.c
> -index 37ef69a..4644492 100644
> ---- a/src/ledmon/ledmon.c
> -+++ b/src/ledmon/ledmon.c
> -@@ -5,6 +5,7 @@
> - #include <errno.h>
> - #include <fcntl.h>
> - #include <getopt.h>
> -+#include <libgen.h>
> - #include <limits.h>
> - #include <signal.h>
> - #include <stdint.h>
> -diff --git a/src/lib/block.c b/src/lib/block.c
> -index 23dc34f..afa7d57 100644
> ---- a/src/lib/block.c
> -+++ b/src/lib/block.c
> -@@ -3,6 +3,7 @@
> - 
> - #include <dirent.h>
> - #include <fcntl.h>
> -+#include <libgen.h>
> - #include <limits.h>
> - #include <stdint.h>
> - #include <stdio.h>
> -diff --git a/src/lib/npem.c b/src/lib/npem.c
> -index bdceee3..f980ba8 100644
> ---- a/src/lib/npem.c
> -+++ b/src/lib/npem.c
> -@@ -2,6 +2,7 @@
> - // Copyright (C) 2022 Intel Corporation.
> - 
> - #include <errno.h>
> -+#include <libgen.h>
> - #include <stdio.h>
> - #include <string.h>
> - #include <pci/pci.h>
> -diff --git a/src/lib/slot.c b/src/lib/slot.c
> -index 1044ddf..68e3009 100644
> ---- a/src/lib/slot.c
> -+++ b/src/lib/slot.c
> -@@ -1,6 +1,7 @@
> - // SPDX-License-Identifier: LGPL-2.1-or-later
> - // Copyright (C) 2023 Intel Corporation.
> - 
> -+#include <libgen.h>
> - #include <stdio.h>
> - #include <string.h>
> - 
> -diff --git a/src/lib/vmdssd.c b/src/lib/vmdssd.c
> -index 8a6e846..0270a7d 100644
> ---- a/src/lib/vmdssd.c
> -+++ b/src/lib/vmdssd.c
> -@@ -2,6 +2,7 @@
> - // Copyright (C) 2022 Intel Corporation.
> - 
> - #include <errno.h>
> -+#include <libgen.h>
> - #include <limits.h>
> - #include <stdlib.h>
> - #include <stdint.h>
> --- 
> -2.47.3
> -
> diff --git a/package/ledmon/0001-libled-provide-basename-if-GLIBC-is-not-avialable.patch b/package/ledmon/0001-libled-provide-basename-if-GLIBC-is-not-avialable.patch
> new file mode 100644
> index 0000000000..a205f41b6f
> --- /dev/null
> +++ b/package/ledmon/0001-libled-provide-basename-if-GLIBC-is-not-avialable.patch
> @@ -0,0 +1,42 @@
> +From 4c0477bdaef56314eb4df4a432be54cc49238be0 Mon Sep 17 00:00:00 2001
> +From: Bernd Kuhls <bernd@kuhls.net>
> +Date: Mon, 1 Dec 2025 19:07:42 +0100
> +Subject: [PATCH] libled: provide basename if GLIBC is not avialable
> +
> +If GNU basename is not avilable, define it. It is safer to use that
> +rather than include libgen.h with XPG basename() definition.
> +
> +Suggested in
> +https://github.com/md-raid-utilities/ledmon/pull/272#issuecomment-3596495739
> +
> +Code copied from
> +https://github.com/md-raid-utilities/mdadm/commit/9dbd11e091f84eb0bf9d717283774816c4c4453d
> +
> +Upstream: https://github.com/md-raid-utilities/ledmon/pull/272
> +
> +Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> +---
> + src/lib/libled_internal.h | 9 +++++++++
> + 1 file changed, 9 insertions(+)
> +
> +diff --git a/src/lib/libled_internal.h b/src/lib/libled_internal.h
> +index 2355d30..2061fc2 100644
> +--- a/src/lib/libled_internal.h
> ++++ b/src/lib/libled_internal.h
> +@@ -70,4 +70,13 @@ led_status_t device_exclude_pattern_add(struct led_ctx *ctx, const char *path);
> +  */
> + void lib_log(struct led_ctx *ctx, enum led_log_level_enum loglevel, const char *buf, ...)
> + 				__attribute__ ((format (printf, 3, 4)));
> ++
> ++/*
> ++ * Ensure GNU basename behavior on GLIBC less systems.
> ++ */
> ++#ifndef __GLIBC__
> ++#define basename(path) \
> ++       (strrchr((path), '/') ? strrchr((path),'/') + 1 : (path))
> ++#endif
> ++
> + #endif
> +-- 
> +2.47.3
> +
> -- 
> 2.47.3
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
