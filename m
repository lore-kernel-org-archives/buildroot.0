Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D32AC5B549
	for <buildroot@archiver.kernel.org>; Wed,  4 Jun 2025 17:16:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 594EC80A52;
	Wed,  4 Jun 2025 17:16:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zvacw0d59cyL; Wed,  4 Jun 2025 17:16:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9A9B680B2E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9A9B680B2E;
	Wed,  4 Jun 2025 17:16:14 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id A1435DA
 for <buildroot@buildroot.org>; Wed,  4 Jun 2025 17:16:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 87D3E41FC1
 for <buildroot@buildroot.org>; Wed,  4 Jun 2025 17:16:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WqHv08WEKorI for <buildroot@buildroot.org>;
 Wed,  4 Jun 2025 17:16:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.11;
 helo=mail1.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org A84F941FB4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A84F941FB4
Received: from mail1.nubo.coop (mail1.nubo.coop [79.99.201.11])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A84F941FB4
 for <buildroot@buildroot.org>; Wed,  4 Jun 2025 17:16:12 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 104D21C1051; Wed,  4 Jun 2025 19:16:07 +0200 (CEST)
Message-ID: <b5522c8c-4c28-45a5-b51a-b17db135a58e@rnout.be>
Date: Wed, 4 Jun 2025 19:16:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Peter Korsgaard <peter@korsgaard.com>, buildroot@buildroot.org
References: <20250518081112.3980310-1-peter@korsgaard.com>
Content-Language: en-GB, fr-BE
In-Reply-To: <20250518081112.3980310-1-peter@korsgaard.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1749057369; h=from:subject:date:message-id:to:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=s8HU/xCs+OXMux7jMqQfI+8wzTe5xCGkOUM+pkMZwJY=;
 b=HE01tmaHGFX01lpBFBIc3ji9iHdkDf5gYMgIk0rEblsgIpGJ0wa4ruqqKLmv8p5QrQFPxv
 mBES9M8kKteTURIYi7H+mWfs2CV7IEE3A0Ve5UvRd2BjjsZ7G+iteGP69SxxckUuglx0Oc
 Q7NsvnLlnR4GBzHRzL4uj+QdnqvYy5RPhIruBiK2EXMOQ6wp6InQC9WhFLz8edIv6m4Q5+
 rXkRIsEDdQF121GvPubPYGNwyiCj4fBAz22kXP2qa8EaXb8+O9nY+zwm52yqJijCD/v4dR
 wpUcPWvbAY3x7ZlL2wG8eoEIBaJXKvxAWMfyX8uEA14lWM2+PQ4i5Yn/n28w4Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=HE01tmaH
Subject: Re: [Buildroot] [PATCH] package/flex: fix GCC 15.x build issue
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



On 18/05/2025 10:11, Peter Korsgaard wrote:
> Fixes:
> https://autobuild.buildroot.net/results/924b1015d4b81385409ef00f1a14be3ca1959c8e/
> 
> As part of building flex for the target a few files are built for the host,
> including a rpl_malloc() implementation containing a malloc() forward
> declaration without any function parameters.
> 
> GCC 15 defaults to -std=gnu23, which handles function declarations without
> parameters differently from earlier C standards leading to compilation
> errors:
> 
> ../lib/malloc.c:6:12: warning: conflicting types for built-in function 'malloc'; expected 'void *(long unsigned int)' [-Wbuiltin-declaration-mismatch]
>      6 |      void *malloc ();
>        |            ^~~~~~
> ../lib/malloc.c:5:1: note: 'malloc' is declared in header '<stdlib.h>'
>      4 |      #include <sys/types.h>
>    +++ |+#include <stdlib.h>
>      5 |
> ../lib/malloc.c: In function 'rpl_malloc':
> ../lib/malloc.c:16:15: error: too many arguments to function 'malloc'; expected 0, have 1
> 
> https://gcc.gnu.org/gcc-15/porting_to.html#c23-fn-decls-without-parameters
> 
> Add a patch submitted upstream to correct the prototype.
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

  Applied to 2025.02.x, thanks.

  Regards,
  Arnout

> ---
>   ...04-Match-malloc-signature-to-its-use.patch | 27 +++++++++++++++++++
>   1 file changed, 27 insertions(+)
>   create mode 100644 package/flex/0004-Match-malloc-signature-to-its-use.patch
> 
> diff --git a/package/flex/0004-Match-malloc-signature-to-its-use.patch b/package/flex/0004-Match-malloc-signature-to-its-use.patch
> new file mode 100644
> index 0000000000..ac57e3b4c8
> --- /dev/null
> +++ b/package/flex/0004-Match-malloc-signature-to-its-use.patch
> @@ -0,0 +1,27 @@
> +From 4b142954b54a57a9b0af0a9661056a9c39a8fa95 Mon Sep 17 00:00:00 2001
> +From: Richard Barnes <rbarnes@umn.edu>
> +Date: Wed, 2 Oct 2024 10:35:09 -0700
> +Subject: [PATCH] Match `malloc` signature to its use
> +
> +Upstream: https://github.com/westes/flex/pull/674
> +Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> +---
> + lib/malloc.c | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/lib/malloc.c b/lib/malloc.c
> +index 75e8ef9..701b9b3 100755
> +--- a/lib/malloc.c
> ++++ b/lib/malloc.c
> +@@ -3,7 +3,7 @@
> +
> +      #include <sys/types.h>
> +
> +-     void *malloc ();
> ++     void *malloc (size_t n);
> +
> +      /* Allocate an N-byte block of memory from the heap.
> +         If N is zero, allocate a 1-byte block.  */
> +--
> +2.39.5
> +

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
