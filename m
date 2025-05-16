Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29AAEC3ABC9
	for <buildroot@archiver.kernel.org>; Fri, 16 May 2025 17:59:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E5F8A407E6;
	Fri, 16 May 2025 17:59:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id seugyv186NMT; Fri, 16 May 2025 17:59:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1914D40853
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1914D40853;
	Fri, 16 May 2025 17:59:29 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 19D2013D
 for <buildroot@buildroot.org>; Fri, 16 May 2025 17:59:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F2AB3612C1
 for <buildroot@buildroot.org>; Fri, 16 May 2025 17:59:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id r9Cub-quNrDu for <buildroot@buildroot.org>;
 Fri, 16 May 2025 17:59:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.11;
 helo=mail1.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org D89AF60C14
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D89AF60C14
Received: from mail1.nubo.coop (mail1.nubo.coop [79.99.201.11])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D89AF60C14
 for <buildroot@buildroot.org>; Fri, 16 May 2025 17:59:24 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 743641C0E0E; Fri, 16 May 2025 19:59:22 +0200 (CEST)
Message-ID: <f99c82d5-9845-46f5-a2d1-319d6dfa8bbe@rnout.be>
Date: Fri, 16 May 2025 13:05:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Florian Larysch <fl@n621.de>, buildroot@buildroot.org
References: <20250507170752.24643-1-fl@n621.de>
Content-Language: en-GB, fr-BE
In-Reply-To: <20250507170752.24643-1-fl@n621.de>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1747418362; h=from:subject:date:message-id:to:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=2Dgo1Or8hIVeJG3KI0LqXokppvLdSK9dUzbDLmm8o1I=;
 b=aFtoUpKBd+UcCqf9+fEUQU06RlnFcwSrWBD62TJ3mPmvQtev3ss+Y/GSRCU8/NUow7UbHW
 YhXJCayofPfOCA6+HEqiEZHA8websXeR+sPe7ubu1o8cdqowoRPLnraAb6rafP5NDW7bM4
 swpUAj5PLUjIgRD9HgFJupTj+FnkdCDRJD5VF44waaoj392BBB5Is1QPCzrM2i1wJWpHTA
 aNmgQMAIpi49fQ89Z1F2b4bgN+0I8riMlZ9PyfLGHa4VsGG/L0sPz8WHM237JzHv/Pe+Mv
 wgXTTTJ83qitYi/Wds7RzBasojG0cohI5i4SmQ4erVzl8krGFTE5TNJKvvmVyQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=rnout.be header.i=@rnout.be header.a=rsa-sha256
 header.s=dkim header.b=aFtoUpKB
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
