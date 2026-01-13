Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5205D2502E
	for <buildroot@archiver.kernel.org>; Tue, 13 Jan 2026 19:45:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9CBE58418B;
	Tue, 13 Jan 2026 19:45:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id y-b-sdldVuho; Tue, 13 Jan 2026 19:45:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AD23784182
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768333557;
	bh=fpo4Xp/5uW87JZf46azNIhmxUdzx7SvcoDuzOFMLt6Q=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=ULnuWYFraIsnIbPyiOln1v2dFtNJcF+ajQN2aJmjxixXZZp9jldwxdNofzKnx/Cxx
	 z22PrAWj91YpjlBxlOlkNZXk92zhB7whrxfE9xV1EH+AZQgpy8/wKdHipJdypvAsVb
	 rZmxBqXgFxOYnOfOjuIvGWx8tz33IntwaG67BveswyHtMsthqxK0QTadJIfWAyuMuF
	 s4T8dVrkYrthaUCGMhhsQ+M55iSfyyV/D046LrQRmEhVwW4Xz5LSZ3nODAXgwHzt0b
	 U44D4YW+oBKPumVyII8OhiI07xddeNjmrXOtqM7qyC/m6EOlf5VgZDTYH4lm35VPCY
	 8UeiQ8QcNsxoA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id AD23784182;
	Tue, 13 Jan 2026 19:45:57 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 83CDC231
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:45:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 68DD740373
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:45:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nhKmOINIPngf for <buildroot@buildroot.org>;
 Tue, 13 Jan 2026 19:45:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 62B0E40376
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 62B0E40376
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 62B0E40376
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:45:54 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 760D3B97A885; Tue, 13 Jan 2026 20:45:52 +0100 (CET)
To: Florian Fainelli <f.fainelli@gmail.com>
Cc: Arnout Vandecappelle <arnout@rnout.be>,
	buildroot@buildroot.org
Date: Tue, 13 Jan 2026 20:45:47 +0100
Message-ID: <20260113194547.98023-1-arnout@rnout.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251017171608.2940076-1-f.fainelli@gmail.com>
References: <20251017171608.2940076-1-f.fainelli@gmail.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1768333552; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=/MhXX35kNKaDKhPu6TSu+lt+G9jKSAOdLc/hLWfaKeY=;
 b=Z8/XWRFSxFUdcBhDULVzep9k9qus8F8XIhQjtBaA6FbKk6BK2SRg5YtIZBtsVgHfPz07Du
 4B5IGNC1SJL8cCZX/b2Q83/1B1TsUZEDE1J9dGu7mjPfUdsqAJoZGQ3lUiZ7UVYASY7V/C
 hBH4LBICG86DR3G9bulCMTyibvMlYAthntMu2uMqiWQI/B4PwP/HZ67SwlMiR3CKuTqjC/
 R0VekWTJheyZXJWehhcKNrquygGvuUumut8HworsDxo1UpqYTJ4Aw7ppQQ3Oi29VzBFf66
 L2MYSGzGbIoNDuPo8o7PFFR2gFBXLUfQSqn8ca46NEDBWgFiRltKDdi+0kOWaQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=Z8/XWRFS
Subject: Re: [Buildroot] [PATCH] package/cpulimit: Correct function
 signature to use named parmeters
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
> Update 0005-Correct-loop-function-signature.patch to include a named
> parameter otherwise the following compiler warning turned error is
> triggered:
> 
> busy.c:6:1: error: parameter name omitted
>  void *loop(void *)
>  ^~~~
> 
> Fixes: https://autobuild.buildroot.org/results/8592e4eb5959124acc885a1cbc2f9d24fb7bcbd1
> Fixes: https://autobuild.buildroot.org/results/cf12d080ddd7a2398a79be430d935071ca3250a3/
> Fixes: e63181bc0056 ("package/cpulimit: Backport fix for function signature")
> Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>

Applied to 2025.02.x and 2025.11.x. Thanks

> ---
>  package/cpulimit/0005-Correct-loop-function-signature.patch | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/cpulimit/0005-Correct-loop-function-signature.patch b/package/cpulimit/0005-Correct-loop-function-signature.patch
> index 5b7f4a01dd5e..5b44ab9782c2 100644
> --- a/package/cpulimit/0005-Correct-loop-function-signature.patch
> +++ b/package/cpulimit/0005-Correct-loop-function-signature.patch
> @@ -1,4 +1,4 @@
> -From 74e95c96e8d82e4e374f86142972fcf4305fe1f2 Mon Sep 17 00:00:00 2001
> +From e94b6dd7b3ca884f72f02879fd85792a3aee961d Mon Sep 17 00:00:00 2001
>  From: Florian Fainelli <f.fainelli@gmail.com>
>  Date: Wed, 2 Jul 2025 20:47:58 -0700
>  Subject: [PATCH] Correct loop function signature
> @@ -23,7 +23,7 @@ Upstream: https://github.com/opsengine/cpulimit/pull/127
>   1 file changed, 2 insertions(+), 2 deletions(-)
>  
>  diff --git a/tests/busy.c b/tests/busy.c
> -index b3afb7cd853b..93f0bcce67a8 100644
> +index b3afb7cd853b..8acbcd82e04f 100644
>  --- a/tests/busy.c
>  +++ b/tests/busy.c
>  @@ -3,7 +3,7 @@
> @@ -31,7 +31,7 @@ index b3afb7cd853b..93f0bcce67a8 100644
>   #include <unistd.h>
>   
>  -void *loop()
> -+void *loop(void *)
> ++void *loop(void *unused)
>   {
>   	while(1);
>   }
> -- 
> 2.43.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
