Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BC98C3ABC9
	for <buildroot@archiver.kernel.org>; Sun, 18 May 2025 14:38:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EF57981EB3;
	Sun, 18 May 2025 14:38:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pSc92z3Bxc1z; Sun, 18 May 2025 14:38:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F3C4C81EAD
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id F3C4C81EAD;
	Sun, 18 May 2025 14:38:52 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id EA0E1DF
 for <buildroot@buildroot.org>; Sun, 18 May 2025 14:38:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CFA5D60639
 for <buildroot@buildroot.org>; Sun, 18 May 2025 14:38:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8I9ELiZHatpt for <buildroot@buildroot.org>;
 Sun, 18 May 2025 14:38:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.11;
 helo=mail1.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org D3D8D60619
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D3D8D60619
Received: from mail1.nubo.coop (mail1.nubo.coop [79.99.201.11])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D3D8D60619
 for <buildroot@buildroot.org>; Sun, 18 May 2025 14:38:49 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 01A801C0FC0; Sun, 18 May 2025 16:38:44 +0200 (CEST)
Message-ID: <58d2430d-fd48-4f68-a303-e3944eb9b663@rnout.be>
Date: Sun, 18 May 2025 16:38:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Florian Larysch <fl@n621.de>, buildroot@buildroot.org
Cc: Grzegorz Blach <grzegorz@blach.pl>
References: <20250512120307.10341-2-fl@n621.de>
Content-Language: en-GB, fr-BE
In-Reply-To: <20250512120307.10341-2-fl@n621.de>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1747579125; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=LVxuQREKHZgHPnjt9aidGZyNeEV52W54JPC9surNrDk=;
 b=EDXvL6mrWTrrLbI3mDk22o43BhAXv1ftfEIrRybsqZmVFu1QupQifTOuxKqNNSxR6GhVNW
 sz6FJQpihD3qCN4OEc7gjE9QsFvkdjmYKqVNnPj8m9ipp+qhNIqAhnpreTUDgmgTLNemir
 2uwDQdBn5nhfgRT188JHX4i6XdTgT60izBxTPTJBr5UbFzM5rjwMAnN8u6GUzPFRG13iZX
 6UZSuMKGUDGxU7yqKby9amoh4QLf+EFyMNSeEbMkAz/KHlDCtPpN6OE32NsT8cyhYNuJR4
 isPUa2rzYoI6g62KJXFf09QBc00fO1qSyReWS4hZ66QMcOUzpuPio+YM7X0Tfg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=EDXvL6mr
Subject: Re: [Buildroot] [PATCH 1/1] package/f2fs-tools: fix GCC 15 build
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 12/05/2025 14:02, Florian Larysch wrote:
> f2fs-tools had its own "bool" typedef which now conflicts with the C23
> keyword, causing build failures on GCC 15.
> 
> Import a patch from upstream that fixes this.
> 
> Fixes: https://autobuild.buildroot.org/results/d17641582d1beaec9dcca4dc48a68d713cecfdc8 (and others)
> Signed-off-by: Florian Larysch <fl@n621.de>

  Applied to 2025.02.x, thanks.

  Regards,
  Arnout

> ---
>   ...-tools-use-stdbool.h-instead-of-bool.patch | 41 +++++++++++++++++++
>   1 file changed, 41 insertions(+)
>   create mode 100644 package/f2fs-tools/0002-f2fs-tools-use-stdbool.h-instead-of-bool.patch
> 
> diff --git a/package/f2fs-tools/0002-f2fs-tools-use-stdbool.h-instead-of-bool.patch b/package/f2fs-tools/0002-f2fs-tools-use-stdbool.h-instead-of-bool.patch
> new file mode 100644
> index 0000000000..90dfdc209a
> --- /dev/null
> +++ b/package/f2fs-tools/0002-f2fs-tools-use-stdbool.h-instead-of-bool.patch
> @@ -0,0 +1,41 @@
> +From ec0f9d07792298f89e71cee1e692ad60bf6b8d5c Mon Sep 17 00:00:00 2001
> +From: Jaegeuk Kim <jaegeuk@kernel.org>
> +Date: Thu, 24 Oct 2024 20:33:38 +0000
> +Subject: [PATCH] f2fs-tools: use stdbool.h instead of bool
> +
> +The existing bool definition is broken for c23, where bool is now a keyword.
> +
> +Signed-off-by: Elliott Hughes <enh@google.com>
> +Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
> +Upstream: https://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs-tools.git/commit/?id=6617d15a660becc23825007ab3fc2d270b5b250f
> +[Florian: rebased to 1.16.0]
> +Signed-off-by: Florian Larysch <fl@n621.de>
> +---
> + include/f2fs_fs.h | 4 +---
> + 1 file changed, 1 insertion(+), 3 deletions(-)
> +
> +diff --git a/include/f2fs_fs.h b/include/f2fs_fs.h
> +index f890634..a968380 100644
> +--- a/include/f2fs_fs.h
> ++++ b/include/f2fs_fs.h
> +@@ -26,6 +26,7 @@
> + #include <stddef.h>
> + #include <string.h>
> + #include <time.h>
> ++#include <stdbool.h>
> +
> + #ifdef HAVE_CONFIG_H
> + #include <config.h>
> +@@ -103,9 +104,6 @@ typedef uint16_t	u16;
> + typedef uint8_t		u8;
> + typedef u32		block_t;
> + typedef u32		nid_t;
> +-#ifndef bool
> +-typedef u8		bool;
> +-#endif
> + typedef unsigned long	pgoff_t;
> + typedef unsigned short	umode_t;
> +
> +--
> +2.49.0
> +

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
