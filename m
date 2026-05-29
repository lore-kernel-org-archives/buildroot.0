Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87764CD4F54
	for <buildroot@archiver.kernel.org>; Fri, 29 May 2026 18:02:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AA487844D6;
	Fri, 29 May 2026 18:02:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id s8Zab3j3HJM8; Fri, 29 May 2026 18:02:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E5A57844CC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780077727;
	bh=6OkNV0pd/9XmHSOz+SOh7DbZceRYwopjmW8nkisUXo4=;
	h=Date:To:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=W03kD9+SeUmZAd42jRKZNFq3UsnZ21HKtWcUs8KqsgGCvTeU708D5Jqjf97XTqYtu
	 EMuoPiSM8CjCOD1Bdtpgpy87vzmED1aEPGhcPPcrufodlRAmdEL2g1Bj9fDSeHnFZD
	 2bwKqnt/xejv4nFqj2B2ZPlJOhpwINe3ZyB9bJZ10rB0rZu4QJER71g8SkFsk02oBz
	 dLGmlbltVw2Iu8OUwMbRmGNLDSO6sDatCjz4dAsWxOoLJPrmiSYUZUIyhd8AjQlLn7
	 crrHREOA/1WDYLyfbYjAraInWUOPbqYuTRjoS3gPc5Vovb5YCmaR6TL59utJPJk9P0
	 WbcmQfNDDqdRA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E5A57844CC;
	Fri, 29 May 2026 18:02:06 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 284E8D3
 for <buildroot@buildroot.org>; Fri, 29 May 2026 18:02:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1778F615EA
 for <buildroot@buildroot.org>; Fri, 29 May 2026 18:02:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BZf9OoOsLc2L for <buildroot@buildroot.org>;
 Fri, 29 May 2026 18:02:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org E268A615D6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E268A615D6
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E268A615D6
 for <buildroot@buildroot.org>; Fri, 29 May 2026 18:02:03 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id EBC64B97C44C; Fri, 29 May 2026 20:02:01 +0200 (CEST)
Message-ID: <d8e8b490-c185-4a43-b992-300c2cfcf834@rnout.be>
Date: Fri, 29 May 2026 20:02:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Bernd Kuhls <bernd@kuhls.net>, buildroot@buildroot.org
References: <20260527195633.3540374-1-bernd@kuhls.net>
Content-Language: en-GB, fr-BE
In-Reply-To: <20260527195633.3540374-1-bernd@kuhls.net>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1780077722; h=from:subject:date:message-id:to:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=ZdaghLWu9OEnf2KMIQfVacwz+8jo+THnfGQPucZ/Mjc=;
 b=WaD0535pRO7Hxi2uTOwxYeuEfzGiV7wUsyw5jAIKyka1p2KyW1F4XykSB28AyjpZ+0vp9n
 2DiXFgCyfsm+yrVXwtIfHwHhHUcqBJawpCbCGiTa335guy2s+V+/1RfJdcDqfLRDaeu7l2
 fA2t0PJGsLL0OzqY7NKlZ1bUZmHwFJKqqcLiSc65l+z2kX6/qNBiOTDTN+Ake7wPJOQH0l
 1QaAtv/Q9vvoMY5cCV4n0W+jWGW5MCAkaSKi2O+2PQC7STBefe693lk9kSHjEo0SQZpWCH
 zVV0Yy8z0bHEtSjZ993TKE8JltUIUP2fyNqnJik+36YBS3favXoT0JN5m/cpUA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=WaD0535p
Subject: Re: [Buildroot] [PATCH v2 1/1] package/vorbis-tools: Fix build with
 gcc 14.x
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



On 27/05/2026 21:56, Bernd Kuhls wrote:
> Buildroot commit ce5d1735710d11b135fc6cb235e976b306833e7d removed
> 0001-fix-build-with-gcc-14.patch which the version bump to 1.4.3.
> 
> The patch originally not only fixed share/utf8.c but also
> ogginfo/codec_skeleton.c. Upstream only applied the fix for
> ogginfo/codec_skeleton.c:
> https://github.com/xiph/vorbis-tools/commit/68c5a33685f5b86e7f18f239ceb8861484fee552
> so the build still fails:
> 
> utf8.c: In function 'convert_buffer':
> utf8.c:271:9: error: implicit declaration of function 'charset_convert'
>   [-Wimplicit-function-declaration]
>    271 |   ret = charset_convert(fromcode, tocode, from, fromlen, to, tolen);
> 
> Added upstream commit to fix the problem.
> 
> Fixes:
> https://autobuild.buildroot.net/results/135/13520e3cbf6b6d169985f4d1378c2a1baab852e0/
> 
> The build error can be reproduced by this minimal defconfig:
> BR2_TOOLCHAIN_BUILDROOT_UCLIBC=y
> BR2_PACKAGE_VORBIS_TOOLS=y
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
> v2: replaced backported patch from Fabrice with upstream commit
>      added result of Gitlab pipeline:
>      https://gitlab.com/bkuhls/buildroot/-/pipelines/2556996655

  Unless I'm missing something, you already had a v2 and a v3 so this should be v4.

  Anyway, applied to master, thanks.
  Regards,
  Arnout

> 
>   ...r-charset.h-to-find-charset_convert-.patch | 32 +++++++++++++++++++
>   1 file changed, 32 insertions(+)
>   create mode 100644 package/vorbis-tools/0001-Added-include-for-charset.h-to-find-charset_convert-.patch
> 
> diff --git a/package/vorbis-tools/0001-Added-include-for-charset.h-to-find-charset_convert-.patch b/package/vorbis-tools/0001-Added-include-for-charset.h-to-find-charset_convert-.patch
> new file mode 100644
> index 0000000000..3e97976fd8
> --- /dev/null
> +++ b/package/vorbis-tools/0001-Added-include-for-charset.h-to-find-charset_convert-.patch
> @@ -0,0 +1,32 @@
> +From 5155bf98a5b10fdf950dfa8f6edad624c0db7030 Mon Sep 17 00:00:00 2001
> +From: Petter Reinholdtsen <pere@debian.org>
> +Date: Sun, 22 Feb 2026 23:33:59 +0100
> +Subject: [PATCH] Added include for "charset.h" to find charset_convert()
> + prototype with gcc >= 14.
> +
> +Patch from Bernd Kuhls.
> +
> +Fixes #2334.
> +
> +Upstream: https://github.com/xiph/vorbis-tools/commit/5155bf98a5b10fdf950dfa8f6edad624c0db7030
> +
> +Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> +---
> + share/utf8.c | 1 +
> + 1 file changed, 1 insertion(+)
> +
> +diff --git a/share/utf8.c b/share/utf8.c
> +index e1199bc..1e6965f 100644
> +--- a/share/utf8.c
> ++++ b/share/utf8.c
> +@@ -28,6 +28,7 @@
> + #include <stdlib.h>
> + #include <string.h>
> +
> ++#include "charset.h"
> + #include "utf8.h"
> +
> +
> +--
> +2.47.3
> +

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
