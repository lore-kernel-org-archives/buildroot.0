Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AA0DCCF2D9
	for <buildroot@archiver.kernel.org>; Mon, 19 Jan 2026 10:09:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5B6FC806D5;
	Mon, 19 Jan 2026 10:09:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id syPZ_KXEXJhY; Mon, 19 Jan 2026 10:09:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BDA6680626
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768817365;
	bh=PedZF9AK0oe4fLOoPJSSyZd05dbbvcRppVeuKD6he58=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=PZOS4CzDVESSl7ZetrvFEu5onTPHnyT723DYtILbUg4U3kUc7vuM0niwrmU1CTanf
	 ESKRFL3owZGYSGMIvZAcn6xvFYVia0rSOJnNuDpT4e2Os5BHoNmiQJqYgpSnGwOUJx
	 4rq6AcO7yZDD80fbPI6+cNyUp7YUVzPWAsFxsr7auObWVFRiwzQYMkpx69/+RsO62W
	 mwAWJuFYk72O27J8gnteWQ/A9q4AYm8MGi9lF+WVAaJRhcfwGfcRh7s//tVMf39XyW
	 lzGtX95EV6Cd15Ltg1aTN+26w1XwXTfaJEHPhj/84oJa3jcv0O/rYr8p7Bu16vpAiG
	 ug3Fjbwi5R1zg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id BDA6680626;
	Mon, 19 Jan 2026 10:09:25 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 6FD96160
 for <buildroot@buildroot.org>; Mon, 19 Jan 2026 10:09:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5DC2881CEF
 for <buildroot@buildroot.org>; Mon, 19 Jan 2026 10:09:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AgvxzG81Q9D0 for <buildroot@buildroot.org>;
 Mon, 19 Jan 2026 10:09:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 507FB81D65
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 507FB81D65
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 507FB81D65
 for <buildroot@buildroot.org>; Mon, 19 Jan 2026 10:09:16 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 252D2B97A961; Mon, 19 Jan 2026 11:09:14 +0100 (CET)
To: Philip Molloy <philip@philipmolloy.com>
Cc: Arnout Vandecappelle <arnout@rnout.be>,
	buildroot@buildroot.org
Date: Mon, 19 Jan 2026 11:09:13 +0100
Message-ID: <20260119100913.12781-1-arnout@rnout.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260105081456.2799173-1-philip@philipmolloy.com>
References: <20260105081456.2799173-1-philip@philipmolloy.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1768817354; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=V5pcQzOgC4go4CWuW8LS2+VZcjAMJuVSk8U1VzcqGoE=;
 b=Zr45Qb6DEf6UhfgZN7/RLgQH+nPfGERv9NIktIRnGdYsjQDtR048bijj/h5h6XGPpEa4Oe
 BuQgqCYuULnVg/iKbGzvT4xrv2q/UuegyS55JdQWWHq2G1Y0L07T6jo6IEkYKM+JX3BSz6
 ygPJAZ2BUroxgVUBg+TF5hpu8h5HuacmOvCXEuAjb71QybIOe/236beNf77erxIP74GnWc
 YbbGgDNGIbZqIu/7VOnDIjEMypBTyVg9J+3W2id1mEpWAMypFA/C+WDXMswVPYyeFZ4mGQ
 upxnZbWTKEZHYlQF97nORklXwmfcm9JgGe498xVeybki5eVuxpEg6KE3LPHu4A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=Zr45Qb6D
Subject: Re: [Buildroot] [PATCH] configs/beagleboneai_defconfig: fix
 whitespace
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
> Signed-off-by: Philip Molloy <philip.molloy@analog.com>

Applied to 2025.02.x and 2025.11.x. Thanks

> ---
>  board/beagleboard/beagleboneai/genimage.cfg | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/board/beagleboard/beagleboneai/genimage.cfg b/board/beagleboard/beagleboneai/genimage.cfg
> index 8aefd76ef8..02e61bc9be 100644
> --- a/board/beagleboard/beagleboneai/genimage.cfg
> +++ b/board/beagleboard/beagleboneai/genimage.cfg
> @@ -19,7 +19,7 @@ image sdcard.img {
>  	partition u-boot {
>  		partition-type = 0xC
>  		bootable = "true"
> -                image = "boot.vfat"
> +		image = "boot.vfat"
>  	}
>  
>  	partition rootfs {
> -- 
> 2.52.0
> 
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
