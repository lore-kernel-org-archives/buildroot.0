Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30FBECCD1BB
	for <buildroot@archiver.kernel.org>; Wed, 22 Oct 2025 16:43:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0B4F3613CB;
	Wed, 22 Oct 2025 16:43:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DRD5JZqJlUbG; Wed, 22 Oct 2025 16:43:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 426DA61338
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 426DA61338;
	Wed, 22 Oct 2025 16:43:02 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 3898E43F
 for <buildroot@buildroot.org>; Wed, 22 Oct 2025 16:42:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1F421612BA
 for <buildroot@buildroot.org>; Wed, 22 Oct 2025 16:42:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id z_fOFT4-Cj7P for <buildroot@buildroot.org>;
 Wed, 22 Oct 2025 16:42:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 0E99B61233
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0E99B61233
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0E99B61233
 for <buildroot@buildroot.org>; Wed, 22 Oct 2025 16:42:57 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id DD033B97918D; Wed, 22 Oct 2025 18:42:55 +0200 (CEST)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Arnout Vandecappelle <arnout@rnout.be>,
	buildroot@buildroot.org
Date: Wed, 22 Oct 2025 18:42:54 +0200
Message-ID: <20251022164254.285840-1-arnout@rnout.be>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251007204919.3783289-1-bernd@kuhls.net>
References: <20251007204919.3783289-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1761151376; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=6NKdkBUqbJpQv+pD+3aYRZ/lwbr+9XE11LDwbHKP8/4=;
 b=QsmvYUR2BPiibcG83ti7k1MFyKWdZShhXz2LjamOOdcxcKZTYttNO1jL6waduM7NzuMrwI
 rWLVw+XdjmedxQjPRoLyXaXKZskmE92kk9oLokwdxDE01wLFoLGHBEImcoHvSzIZrG0+yk
 p8L5RG9g3AqxBaux7bazyHjjJj0KWwLmopID0fFKSGR9BUG1Jdz0e2MMa8q/KAN+GlToeD
 RKsGCpSRPs/ghRcVuutEtGL6jG5/qSMW1U6NKi/BVjW2u9kzQrxkTB59mRU9aHBJL6dgAi
 /jVb6bYpIzqsRjol5Nk4zE7rshYGav/lGkY3OaNzd6WN7WADM7y1zTL5UTdnfg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=rnout.be header.i=@rnout.be header.a=rsa-sha256
 header.s=dkim header.b=QsmvYUR2
Subject: Re: [Buildroot] [PATCH 1/1] package/libdisplay-info: include
 sys/types.h to fix build error
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
> Fixes: https://autobuild.buildroot.org/results/2d72feabdd0c9e1c9aa89e6d683d5f5ae0bb942d/
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.02.x and 2025.08.x. Thanks

> ---
>  .../0001-cta-include-sys-types.h.patch        | 35 +++++++++++++++++++
>  1 file changed, 35 insertions(+)
>  create mode 100644 package/libdisplay-info/0001-cta-include-sys-types.h.patch
> 
> diff --git a/package/libdisplay-info/0001-cta-include-sys-types.h.patch b/package/libdisplay-info/0001-cta-include-sys-types.h.patch
> new file mode 100644
> index 0000000000..f56e41d7b4
> --- /dev/null
> +++ b/package/libdisplay-info/0001-cta-include-sys-types.h.patch
> @@ -0,0 +1,35 @@
> +From e569a92539c96acd2a618729827c8fbf3659d803 Mon Sep 17 00:00:00 2001
> +From: Bernd Kuhls <bernd@kuhls.net>
> +Date: Tue, 7 Oct 2025 22:44:01 +0200
> +Subject: [PATCH] cta: include sys/types.h
> +
> +Fixes build error with uClibc-based toolchain and gcc 15.2.0 found by
> +Buildroot autobuilders[1]:
> +
> +../cta.c: In function 'parse_vendor_hdmi_block':
> +../cta.c:168:15: error: unknown type name 'ssize_t'; did you mean 'size_t'?
> +
> +[1] https://autobuild.buildroot.org/results/2d72feabdd0c9e1c9aa89e6d683d5f5ae0bb942d/
> +
> +Upstream: https://gitlab.freedesktop.org/emersion/libdisplay-info/-/merge_requests/201
> +
> +Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> +---
> + cta.c | 1 +
> + 1 file changed, 1 insertion(+)
> +
> +diff --git a/cta.c b/cta.c
> +index 12187cc..53edfca 100644
> +--- a/cta.c
> ++++ b/cta.c
> +@@ -4,6 +4,7 @@
> + #include <math.h>
> + #include <stdlib.h>
> + #include <string.h>
> ++#include <sys/types.h>
> + 
> + #include "bits.h"
> + #include "cta.h"
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
