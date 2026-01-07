Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EC18D0D151
	for <buildroot@archiver.kernel.org>; Wed,  7 Jan 2026 17:51:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 573BD40F35;
	Wed,  7 Jan 2026 17:51:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id I2KdyLVNECJ6; Wed,  7 Jan 2026 17:51:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9193740F4F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767808310;
	bh=ik/34F1IjlfRRjQcJPqddXM7qcoUVGOVQuNLHIlhMp0=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=r+o9CO9SZcP5RGYXSmTxG1hbJLl2/F6Wd/GMHpbIZS44ytOMgcqczuiLrDjzL7j7v
	 FJ8Bwkb3nxOupAFMTMb7sLQ9NVtUMTqBC68LZQjJEHRaRtUD56gl+Py1eaxKEzNnJv
	 CLljjZlj/RrkknTfhAkrUOtpXbwJk2/GZyc3GtSxxYcMofTaT3xvvpltVU1VJYwcHk
	 8Cuo0cY2m0w7Uwmc5jQ6dNrqlOTg5Y4M1q8xzUbqz/mkiQcuzih7/bvHKhSl6T0l1g
	 ai0JeqT9ovLKUbKfZZCCHhy5q7u663D5Do2lS4LwXTWA2nqhlXGYvflqx6FG8pc4HB
	 F+MZZ99nipPXw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9193740F4F;
	Wed,  7 Jan 2026 17:51:50 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id A03209ED
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:51:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 85C29607FC
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:51:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ynHSshxwlLG2 for <buildroot@buildroot.org>;
 Wed,  7 Jan 2026 17:51:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 6F0AD60667
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6F0AD60667
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6F0AD60667
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:51:48 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 811D6B97A704; Wed,  7 Jan 2026 18:51:46 +0100 (CET)
To: Thomas Perale <thomas.perale@mind.be>
Cc: Arnout Vandecappelle <arnout@rnout.be>,
	buildroot@buildroot.org
Date: Wed,  7 Jan 2026 18:51:45 +0100
Message-ID: <20260107175145.228283-1-arnout@rnout.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251229090719.13291-6-thomas.perale@mind.be>
References: <20251229090719.13291-6-thomas.perale@mind.be>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1767808306; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=bUj/IvQFt/sJagEqoO6OKOU1Tc+c9U0YkY81y+qHW2U=;
 b=ekuEmxGuc6DQ7GQ4Kkv2TMudtRSoPi80KfcgriJvlrVCSl19692WkBaO4C43dfau653Vw6
 rzqu2g/aBA8rla6ViAPprtb6FHc3izbKtsdzPrZRZJa8jZZDEUeQZA1U2p4VcZtVCmHo1G
 IoC1Seeb5QkFUIYsXjaQ3nBewqhNNINE4oSZKPICd61ru6U+bLTSVptQHvXw5wWywcnVKh
 0ig+vhgyWQgsQY6a7nOXxkzJkiEbjGhuWIh50YW5g7ER0o0hKsMsOOg2hc6A6NqF0/e66L
 ujQ+B3XEVyiPWdU1tfB8tsqeguqPdD6fcuUof+19JSY34sD5XtwdNNBDk2NksQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=ekuEmxGu
Subject: Re: [Buildroot] [PATCH 06/14] package/dovecot: add CVE trailer in
 patch
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
> Since Buildroot commit [1] the patches that fixes a security
> vulnerability needs to reference the fixed vulnerability.
> 
> This patch adds the relevant information to the patch header.
> 
> [1] 1167d0ff3d docs/manual: mention CVE trailer
> 
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>

Applied to 2025.02.x and 2025.11.x. Thanks

> ---
>  ...01-auth-Fix-handling-passdbs-with-identical-driver-args.patch | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/dovecot/0001-auth-Fix-handling-passdbs-with-identical-driver-args.patch b/package/dovecot/0001-auth-Fix-handling-passdbs-with-identical-driver-args.patch
> index 04b8f5392a..99a2b83563 100644
> --- a/package/dovecot/0001-auth-Fix-handling-passdbs-with-identical-driver-args.patch
> +++ b/package/dovecot/0001-auth-Fix-handling-passdbs-with-identical-driver-args.patch
> @@ -12,6 +12,7 @@ Fixed by moving mechanisms and username_filter from struct passdb_module
>  to struct auth_passdb, which is where they should have been in the first
>  place.
>  
> +CVE: CVE-2022-30550
>  Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
>  ---
>   src/auth/auth-request.c |  6 +++---
> -- 
> 2.52.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
