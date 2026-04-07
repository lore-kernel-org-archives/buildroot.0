Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1956FF5138
	for <buildroot@archiver.kernel.org>; Tue,  7 Apr 2026 19:57:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EF65A816F3;
	Tue,  7 Apr 2026 19:57:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id swk6C9WKrSTw; Tue,  7 Apr 2026 19:57:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 10171816EE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775591858;
	bh=jV03QbofTOWrid8ccqPNbVNTZq89CaSK9UKs8PaG9V8=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=RAyntiVO61hj42pmH05ujWkJXcVXf1iBZIDKLQXwVPDLzdsaEob+NxXxCbq2qXBgO
	 zoiQsBdcS2wzVNS1xKQG+EpBMrVaOQOSYYKae+E6fINX5Ko4ZvAB1l9dGRh7mf7Gfq
	 XxonMYiQrazVL9Q1FrfL4+WiMDvc+XcccJ9ikoP/rSrdKNKvSEWkUTfWrnf4ryxHoD
	 +lk/9xobp/RC3tXZL+pkzITLxeAs6D5u8xcF5vYyxpQNvQiUtnn6GCswDT2I2nbWPe
	 3vZ+Dar/I4SWthWpfyMsQmIfGz+3oPPz6QZBXp2O3tBTK603Gy3sLzDWORrxb2kbTW
	 IDQ9tqwx+2/6g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 10171816EE;
	Tue,  7 Apr 2026 19:57:38 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 698CB237
 for <buildroot@buildroot.org>; Tue,  7 Apr 2026 19:57:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5B70D406DE
 for <buildroot@buildroot.org>; Tue,  7 Apr 2026 19:57:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wt-ueQorYrAX for <buildroot@buildroot.org>;
 Tue,  7 Apr 2026 19:57:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 4FDD940348
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4FDD940348
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4FDD940348
 for <buildroot@buildroot.org>; Tue,  7 Apr 2026 19:57:35 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 3F89EB97BCFF; Tue,  7 Apr 2026 21:57:32 +0200 (CEST)
Message-ID: <4870f8e1-7293-46f9-a3be-930da837cf72@rnout.be>
Date: Tue, 7 Apr 2026 21:57:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Julien Olivain <ju.o@free.fr>, buildroot@buildroot.org
Cc: Mark Corbin <mark@dibsco.co.uk>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20260307180711.1025866-1-ju.o@free.fr>
Content-Language: en-GB, fr-BE
In-Reply-To: <20260307180711.1025866-1-ju.o@free.fr>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1775591853; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=gOMXMU+iiiFrrpdLTBfsxCOZ0hQb3jhMnMuSSg/2w38=;
 b=hyPkdJp0SMTdDeINasZxVt88Yq2J1jKiu2db3haoDQBiKRcfWTiCHwY9HdQxuoKl3B3t8h
 COe6ICXMbKSHqOj8iAQhVxV8ozj0VS3WaRtKaZ5nZvAnmkp5jjyiyJO4iSXhgEtGrmsFOk
 kAZk8i9ojhmGR7Lakj4rY3uLy+aKZ9B4keNqQuWIJnpQxmeS5NDhZ3sRUiigKAUFmFxNnu
 3mMI7WP9TaCNvJMvgxNBFWTe8urVv0uavez5Xm2A2Fz5pZ1ZVy7YJguDpHYGVgMoOss3o0
 MRwAPy/RmIGTgweVNKqZ+ESRzVVSRlFlBUctgel3IkAJV3K7FLUdIzlCoXFmTQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=rnout.be header.i=@rnout.be header.a=rsa-sha256
 header.s=dkim header.b=hyPkdJp0
Subject: Re: [Buildroot] [PATCH RFC v2 1/5] arch/Config.in.x86: increase x86
 default CPU from i586 to i686
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



On 07/03/2026 19:07, Julien Olivain wrote:
> Signed-off-by: Julien Olivain <ju.o@free.fr>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
> Changes v1 -> v2: no change.
> ---
>   arch/Config.in.x86 | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/Config.in.x86 b/arch/Config.in.x86
> index f9b32130b2..548bef9226 100644
> --- a/arch/Config.in.x86
> +++ b/arch/Config.in.x86
> @@ -35,7 +35,7 @@ config BR2_X86_CPU_HAS_AVX512
>   # https://gcc.gnu.org/onlinedocs/gcc-13.2.0/gcc/x86-Options.html
>   choice
>   	prompt "Target Architecture Variant"
> -	default BR2_x86_i586 if BR2_i386
> +	default BR2_x86_i686 if BR2_i386
>   	depends on BR2_i386 || BR2_x86_64
>   	help
>   	  Specific CPU variant to use

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
