Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91902C3ABC9
	for <buildroot@archiver.kernel.org>; Fri, 16 May 2025 11:05:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3C50341A53;
	Fri, 16 May 2025 11:05:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VkR2ftWbuQ38; Fri, 16 May 2025 11:05:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 38BAA419C9
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 38BAA419C9;
	Fri, 16 May 2025 11:05:06 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id A258E13D
 for <buildroot@buildroot.org>; Fri, 16 May 2025 11:05:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 883F883342
 for <buildroot@buildroot.org>; Fri, 16 May 2025 11:05:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6brf4V1vAM85 for <buildroot@buildroot.org>;
 Fri, 16 May 2025 11:05:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.11;
 helo=mail1.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org A162881280
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A162881280
Received: from mail1.nubo.coop (mail1.nubo.coop [79.99.201.11])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A162881280
 for <buildroot@buildroot.org>; Fri, 16 May 2025 11:05:03 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id AEC2A1C0FA2; Fri, 16 May 2025 13:05:01 +0200 (CEST)
Message-ID: <ddaf668f-3042-4d70-bbbd-06aff43a6e91@rnout.be>
Date: Fri, 16 May 2025 13:05:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Florian Larysch <fl@n621.de>, buildroot@buildroot.org
References: <20250507170752.24643-1-fl@n621.de>
Content-Language: en-GB, fr-BE
In-Reply-To: <20250507170752.24643-1-fl@n621.de>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1747393501; h=from:subject:date:message-id:to:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=2Dgo1Or8hIVeJG3KI0LqXokppvLdSK9dUzbDLmm8o1I=;
 b=HLqol9SyQiQwyzcMOEBVTurk09Eys8pmNRPyTm7LBoaK7C1pb45jAK306qIDmevfUxB+RG
 LmphbZcT5Ct90agOcHWnF+nLh8FV20kcshyOQ4dWLGHSPeQpg4Y/cPbcjI4bFnTg52H6BT
 LENFh5TZ9GCXI6XaKv16IcuH7MdNH3CL2kt66CbvaE1ftWnIqmhE18lNoNCQHnnN2cC8JT
 xCGXnCZuQB6XgmvqU1r1rH9jd8a8KgyNL1b1s72BL70GVLQbCmHBW2HobquXDOmpigRiCa
 8e7SwhrpZTEffDH1M6RhafVUKIGODBH4LHnbu1v/mN+qmKPlMK+SViJPuQz1mg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=HLqol9Sy
Subject: Re: [Buildroot] [PATCH 1/1] package/cpio: fix build with GCC 15
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



On 07/05/2025 19:07, Florian Larysch wrote:
> On systems running GCC 15, host-cpio will fail to build with errors like
> 
>    copyout.c:646:12: error: too many arguments to function 'xstat'; expected 0, have 2
> 
> and
> 
>    main.c:407:13: error: assignment to 'int (*)(void)' from incompatible pointer type 'int (*)(const char * restrict,  struct stat * restrict)' [-Wincompatible-pointer-types]
> 
> This was reported[1] and fixed upstream, but there is no new release
> yet. Import the upstream patch for now.
> 
> [1] https://lists.gnu.org/archive/html/bug-cpio/2025-05/msg00000.html
> 
> Signed-off-by: Florian Larysch <fl@n621.de>

  Applied to 2025.02.x, thanks.

  Regards,
  Arnout

> ---
>   package/cpio/0001-Fix-c23-conformity.patch | 47 ++++++++++++++++++++++
>   1 file changed, 47 insertions(+)
>   create mode 100644 package/cpio/0001-Fix-c23-conformity.patch
> 
> diff --git a/package/cpio/0001-Fix-c23-conformity.patch b/package/cpio/0001-Fix-c23-conformity.patch
> new file mode 100644
> index 0000000000..63d598ad1c
> --- /dev/null
> +++ b/package/cpio/0001-Fix-c23-conformity.patch
> @@ -0,0 +1,47 @@
> +From f42137f5ab9cf07d1e62edc05e0212688d3ebaa2 Mon Sep 17 00:00:00 2001
> +From: Sergey Poznyakoff <gray@gnu.org>
> +Date: Tue, 6 May 2025 21:02:43 +0300
> +Subject: [PATCH] Fix c23 conformity
> +
> +Upstream: https://git.savannah.gnu.org/gitweb/?p=cpio.git;a=commit;h=f42137f5ab9cf07d1e62edc05e0212688d3ebaa2
> +
> +---
> + src/extern.h | 4 ++--
> + src/global.c | 4 ++--
> + 2 files changed, 4 insertions(+), 4 deletions(-)
> +
> +diff --git a/src/extern.h b/src/extern.h
> +index bf3d5b3..455119b 100644
> +--- a/src/extern.h
> ++++ b/src/extern.h
> +@@ -96,8 +96,8 @@ extern char input_is_special;
> + extern char output_is_special;
> + extern char input_is_seekable;
> + extern char output_is_seekable;
> +-extern int (*xstat) ();
> +-extern void (*copy_function) ();
> ++extern int (*xstat) (const char *, struct stat *);
> ++extern void (*copy_function) (void);
> + extern char *change_directory_option;
> +
> + #define STRINGIFY_BIGINT(i, b) umaxtostr (i, b)
> +diff --git a/src/global.c b/src/global.c
> +index 66686f2..5c6ab16 100644
> +--- a/src/global.c
> ++++ b/src/global.c
> +@@ -184,10 +184,10 @@ bool to_stdout_option = false;
> +
> + /* A pointer to either lstat or stat, depending on whether
> +    dereferencing of symlinks is done for input files.  */
> +-int (*xstat) ();
> ++int (*xstat) (const char *, struct stat *);
> +
> + /* Which copy operation to perform. (-i, -o, -p) */
> +-void (*copy_function) () = 0;
> ++void (*copy_function) (void) = 0;
> +
> + char *change_directory_option;
> +
> +--
> +2.49.0
> +

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
