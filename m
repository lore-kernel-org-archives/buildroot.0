Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E20BCE8D6B
	for <buildroot@archiver.kernel.org>; Mon, 17 Nov 2025 20:01:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2786C60EB2;
	Mon, 17 Nov 2025 20:01:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id r9PVs223OfyZ; Mon, 17 Nov 2025 20:01:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5327060F8C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5327060F8C;
	Mon, 17 Nov 2025 20:01:26 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id C6C311BA
 for <buildroot@buildroot.org>; Mon, 17 Nov 2025 20:01:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AE48A408C5
 for <buildroot@buildroot.org>; Mon, 17 Nov 2025 20:01:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Tv1lumEEYLYK for <buildroot@buildroot.org>;
 Mon, 17 Nov 2025 20:01:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 9C23840027
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9C23840027
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9C23840027
 for <buildroot@buildroot.org>; Mon, 17 Nov 2025 20:01:23 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id AAD8DB979430; Mon, 17 Nov 2025 21:01:21 +0100 (CET)
Message-ID: <9f5eeee7-6cf1-4dd0-b896-a777a41716a5@rnout.be>
Date: Mon, 17 Nov 2025 21:01:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Bernd Kuhls <bernd@kuhls.net>, buildroot@buildroot.org
References: <20251026102229.1323577-1-bernd@kuhls.net>
Content-Language: en-GB, fr-BE
In-Reply-To: <20251026102229.1323577-1-bernd@kuhls.net>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1763409681; h=from:subject:date:message-id:to:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=HeS8r0HoevfjaPBuRocz43rYmT82I8Cl8Ure8rff+wk=;
 b=Yo4Tcdl9I/jdIdv4jABxSENPETKhaEhC/uIwUeX5WjRdp76fyMmggmsLRc+vy0R8kO2UKW
 qVkF7ffsUBafcc/xZ+gkVezjt7+QqmOn4Yqa5JTi4XmJrPnS0dM1niL6WSBOCxLIOEDgkq
 sH4D++1GopDFY8cZZqLaIww8qozBrezYxonfez+bIC8C0SaUujS6tDAhglDZqjGbycw85V
 ETiOW9mVTFTscIWakY2Qu9rhJDMQoq681wor5ZdJm9HPCUF5Hgyc0p8+cko4Ii5T+4MTxe
 VgVYU9z+o6HTctE60qaxqXi7RcmbGjQI1sFE07CrP1TfiiCRlc/K8bFy59mIBg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=Yo4Tcdl9
Subject: Re: [Buildroot] [PATCH 1/2] package/libiconv: fix build with gcc
 15.x
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



On 26/10/2025 11:22, Bernd Kuhls wrote:
> Fixes:
> https://autobuild.buildroot.net/results/387/3875466a80e57dfd96911a2166e496cf7d41bb69/
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

  Applied to 2025.02.x and 2025.08.x, thanks.

  Regards,
  Arnout

> ---
>   ...tion-declaration-without-a-prototype.patch | 34 +++++++++++++++++++
>   1 file changed, 34 insertions(+)
>   create mode 100644 package/libiconv/0001-Fix-a-clang-warning-a-function-declaration-without-a-prototype.patch
> 
> diff --git a/package/libiconv/0001-Fix-a-clang-warning-a-function-declaration-without-a-prototype.patch b/package/libiconv/0001-Fix-a-clang-warning-a-function-declaration-without-a-prototype.patch
> new file mode 100644
> index 0000000000..f859f7e014
> --- /dev/null
> +++ b/package/libiconv/0001-Fix-a-clang-warning-a-function-declaration-without-a-prototype.patch
> @@ -0,0 +1,34 @@
> +From: Bruno Haible <bruno@clisp.org>
> +Date: Sun, 29 Jan 2023 19:07:21 +0000 (+0100)
> +Subject: Fix a clang warning "a function declaration without a prototype...".
> +X-Git-Tag: v1.18~57
> +X-Git-Url: https://gitweb.git.savannah.gnu.org/gitweb/?p=libiconv.git;a=commitdiff_plain;h=e46dee2f581c1167137bcd045e114e96a9f00483
> +
> +Fix a clang warning "a function declaration without a prototype...".
> +
> +* lib/loop_wchar.h (mbrtowc): Don't declare. Drop portability to BeOS.
> +
> +Upstream: https://gitweb.git.savannah.gnu.org/gitweb/?p=libiconv.git;a=commitdiff;h=e46dee2f581c1167137bcd045e114e96a9f00483
> +
> +Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> +---
> +
> +diff --git a/lib/loop_wchar.h b/lib/loop_wchar.h
> +index b3edc29..9eb508e 100644
> +--- a/lib/loop_wchar.h
> ++++ b/lib/loop_wchar.h
> +@@ -1,5 +1,5 @@
> + /*
> +- * Copyright (C) 2000-2002, 2005-2006, 2008-2009, 2011 Free Software Foundation, Inc.
> ++ * Copyright (C) 2000-2002, 2005-2006, 2008-2009, 2011, 2023 Free Software Foundation, Inc.
> +  * This file is part of the GNU LIBICONV Library.
> +  *
> +  * The GNU LIBICONV Library is free software; you can redistribute it
> +@@ -36,7 +36,6 @@
> + # include <wchar.h>
> + # define BUF_SIZE 64  /* assume MB_LEN_MAX <= 64 */
> +   /* Some systems, like BeOS, have multibyte encodings but lack mbstate_t.  */
> +-  extern size_t mbrtowc ();
> + # ifdef mbstate_t
> + #  define mbrtowc(pwc, s, n, ps) (mbrtowc)(pwc, s, n, 0)
> + #  define mbsinit(ps) 1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
