Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCD14C71136
	for <buildroot@archiver.kernel.org>; Thu, 12 Jun 2025 20:10:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7749383C25;
	Thu, 12 Jun 2025 20:10:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id USlGUj4WwYvI; Thu, 12 Jun 2025 20:10:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7B74683C15
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7B74683C15;
	Thu, 12 Jun 2025 20:10:09 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id CB90E183
 for <buildroot@buildroot.org>; Thu, 12 Jun 2025 20:10:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B277F83BF4
 for <buildroot@buildroot.org>; Thu, 12 Jun 2025 20:10:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0k6nqT_T3Wiv for <buildroot@buildroot.org>;
 Thu, 12 Jun 2025 20:10:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.11;
 helo=mail1.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org B6A2F83BC3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B6A2F83BC3
Received: from mail1.nubo.coop (mail1.nubo.coop [79.99.201.11])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B6A2F83BC3
 for <buildroot@buildroot.org>; Thu, 12 Jun 2025 20:10:06 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 6A39F1C116B; Thu, 12 Jun 2025 22:10:04 +0200 (CEST)
Message-ID: <d6e94ff7-8dd6-4c55-9558-2adff51816a0@rnout.be>
Date: Thu, 12 Jun 2025 22:10:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Perale <thomas.perale@mind.be>, buildroot@buildroot.org
Cc: Bernd Kuhls <bernd@kuhls.net>
References: <20250608101422.883807-1-thomas.perale@mind.be>
Content-Language: en-GB, fr-BE
In-Reply-To: <20250608101422.883807-1-thomas.perale@mind.be>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1749759004; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=xdZwJqWZKzUqdXMNItT4obKJY4usdtdHTAU45/kPn1o=;
 b=BqQJoOo5wIdIJ4NmyXYGz/Dr5NwyKaWKc9S1qngAN635g0dVBy5X4rfmLcr4vvvKOOsnz9
 A787mUcQ0rflnOS/eWy+6QauQ6c2x+swdLwXl/toWGArsOy110nO8J+xKZLbjwiKAURt5v
 HA32Nw2anevbRSoN/oOtckAMm/h9bnXc45LPLY3ZJyUjHLNEzvL0B2kUcyfdntxWbV1J/3
 hgmnmqePNxWsUfwtG54KECrMPiyq3SB6rSA171Q74T4/Q8R3oOXe2wIY1YvryKXTz7ar/U
 9ASxt2gUqpf+AaCTxmTqpk18DtReWkvoWKaUc++J8h9DT8aYhv0wk51V8uOFZA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=BqQJoOo5
Subject: Re: [Buildroot] [PATCH 1/1] package/ghostscript: fix build with
 host GCC 15
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



On 08/06/2025 12:14, Thomas Perale via buildroot wrote:
> Fix the following autobuild error on configs with host GCC15.
> 
> ```
> /workdir/instance-0/output-1/host/bin/ccache /usr/bin/gcc   -O2 -DNDEBUG -Wall -Wstrict-prototypes -Wundef -Wmissing-declarations -Wmissing-prototypes -Wwrite-strings -fno-strict-aliasing -Werror=declaration-after-statement -fno-builtin -fno-common -Werror=return-type -Wno-unused-local-typedefs -DHAVE_STDINT_H=1 -DHAVE_DIRENT_H=1 -DHAVE_SYS_DIR_H=1 -DHAVE_SYS_TIME_H=1 -DHAVE_SYS_TIMES_H=1 -DHAVE_INTTYPES_H=1 -DHAVE_LIBDL=1 -DGX_COLOR_INDEX_TYPE="unsigned long long" -D__USE_UNIX98=1 -DHAVE_SNPRINTF  -O2 -I/workdir/instance-0/output-1/host/include -L/workdir/instance-0/output-1/host/lib -Wl,-rpath,/workdir/instance-0/output-1/host/lib -DNOCONTRIB -DHAVE_RESTRICT=1 -DHAVE_LIMITS_H=1 -DHAVE_STRING_H=1 -fno-strict-aliasing -O2 -I/workdir/instance-0/output-1/host/include -L/workdir/instance-0/output-1/host/lib -Wl,-rpath,/workdir/instance-0/output-1/host/lib -DHAVE_POPEN_PROTO=1  -I./base -o ./obj/aux/genconf ./base/genconf.c   -lz
> In file included from ./base/genconf.c:18:
> ./base/stdpre.h:348:13: error: 'bool' cannot be defined via 'typedef'
>    348 | typedef int bool;
>        |             ^~~~
> ./base/stdpre.h:348:13: note: 'bool' is a keyword with '-std=c23' onwards
> ./base/stdpre.h:348:1: warning: useless type name in empty declaration
>    348 | typedef int bool;
>        | ^~~~~~~
> ```
> 
> This is due to the change in the default C language version in GCC15.
> 
> The patch included is not exactly the same as the upstream one, it only
> picks the part that fix the `bool` definition and dropped the declaration
> type changes.
> 
> Fixes: https://autobuild.buildroot.org/results/9c6/9c6cbff256635c6ab4be4c5b7bf18f9d3c4b46681
> 
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>

  Applied to 2025.02.x, thanks.

  Regards,
  Arnout

> ---
>   ...Fix-compatibility-with-C23-compilers.patch | 36 +++++++++++++++++++
>   1 file changed, 36 insertions(+)
>   create mode 100644 package/ghostscript/0001-Fix-compatibility-with-C23-compilers.patch
> 
> diff --git a/package/ghostscript/0001-Fix-compatibility-with-C23-compilers.patch b/package/ghostscript/0001-Fix-compatibility-with-C23-compilers.patch
> new file mode 100644
> index 0000000000..0dfca9cfa2
> --- /dev/null
> +++ b/package/ghostscript/0001-Fix-compatibility-with-C23-compilers.patch
> @@ -0,0 +1,36 @@
> +From ae940946473ceb8c5353bc6e7f04673c6e60502d Mon Sep 17 00:00:00 2001
> +From: Alex Cherepanov <alex@coscript.biz>
> +Date: Thu, 3 Apr 2025 17:19:41 +0100
> +Subject: Bug 708160: Fix compatibility with C23 compilers
> +
> +Upstream: https://cgit.ghostscript.com/cgi-bin/cgit.cgi/ghostpdl.git/commit/?id=ae940946473ceb8c5353bc6e7f04673c6e60502d
> +[thomas: Only backport the bool typedef condition]
> +Signed-off-by: Thomas Perale <thomas.perale@mind.be>
> +---
> + base/stdpre.h              |  6 ++++--
> + 1 files changed, 4 insertions(+), 2 deletions(-)
> +
> +diff --git a/base/stdpre.h b/base/stdpre.h
> +index dda30b6a4..2f9c84e0d 100644
> +--- a/base/stdpre.h
> ++++ b/base/stdpre.h
> +@@ -1,4 +1,4 @@
> +-/* Copyright (C) 2001-2023 Artifex Software, Inc.
> ++/* Copyright (C) 2001-2025 Artifex Software, Inc.
> +    All Rights Reserved.
> +
> +    This software is provided AS-IS with no warranty, either express or
> +@@ -341,7 +341,9 @@ typedef signed char schar;
> +  * and the MetroWerks C++ compiler insists that bool be equivalent to
> +  * unsigned char.
> +  */
> +-#ifndef __cplusplus
> ++
> ++/* C23 has bool as a builtin type. */
> ++#if !defined(__cplusplus) && (!defined(__STDC_VERSION__) || __STDC_VERSION__ < 202311L)
> + #ifdef __BEOS__
> + typedef unsigned char bool;
> + #else
> +--
> +cgit v1.2.3
> +

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
