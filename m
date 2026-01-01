Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E1E0EED626
	for <buildroot@archiver.kernel.org>; Thu,  1 Jan 2026 17:12:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 09F48407D4;
	Thu,  1 Jan 2026 17:12:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lrO0bRfEgw5m; Thu,  1 Jan 2026 17:12:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 66A07406D8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767287536;
	bh=MPE5805MtsKH/6IjvITHM8ZsdDKw+MhnBb/ATQmbeHI=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=T3YoPmsx2a/7uw+9XOoRBqG/VBFAzOSiQuiyd+vUS2rFKIER+d8n/rivxGeFUtPK5
	 B2emmbuOmEZdcsGK96B9sJZwR5wb6moQSP45e22P0DeP+20JQjlINxfO8LqLouSIkT
	 48Nk5wfP52ez02dQM6bgAqXvYLp361GPLpuMq/P2LPvhUXvXmiz+h1M/M1+uzv15GX
	 Vxa/NknIyZN/RMB6pObkcWeJaUmBkV59cCRomiQiYkYGmHs2JICcdrRjgkfBysHNzC
	 mC2ApHwSDX6VCsMXAbaSiDYQV1LDgVHjPK6ZV5qu14kEto7wT6t7Cst5T5h1MdG7ur
	 VvmWkuMu9Jv1w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 66A07406D8;
	Thu,  1 Jan 2026 17:12:16 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id A73BD19D
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 17:12:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8CF9160665
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 17:12:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8Ski1muuLya9 for <buildroot@buildroot.org>;
 Thu,  1 Jan 2026 17:12:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org B5BD260656
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B5BD260656
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B5BD260656
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 17:12:13 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id A4CE54E41EDE;
 Thu,  1 Jan 2026 17:12:11 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 729F260749;
 Thu,  1 Jan 2026 17:12:11 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 177DF113B077F; Thu,  1 Jan 2026 18:12:09 +0100 (CET)
Date: Thu, 1 Jan 2026 18:12:09 +0100
To: Florian Fainelli <f.fainelli@gmail.com>
Cc: buildroot@buildroot.org, ju.o@free.fr, romain.naour@smile.fr
Message-ID: <20260101181209.6ecf51a3@windsurf>
In-Reply-To: <20251017171608.2940076-1-f.fainelli@gmail.com>
References: <20251017171608.2940076-1-f.fainelli@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1767287531; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=3VThHovEYtxxCstKucfCAl9mlQ6DRQjFUlFcOrfwOVM=;
 b=hOk75nr1EwUg1HeuExX6ajEsVj97hlXKuGztnrHEtYxcVinwjbUHKoGberFmfo31BUPuX2
 n6EXggdCP9k5tS0M0Qjcgab7pBA1gh/RxaSv0xieIkVyWpHqjiVmMvLvjB3aLujLg227Br
 BxpJ11ZAASJyAeoBHQIAb9oqNYygRX13D82berVeHAyW4cSww/5uLJRTXK5TMASiD7gGoB
 uisxPU4XeR3nr0ppLXW4+6V/brRF/9SC5jGW39+J9lF5EjYqyYdkH3aUvTAsYJ94aBCmaM
 AYHqbIaGialzjnZJ1B6H3pFoiF/DSk9A6xkHQPjHVfupCE4iYCgw5xZ/bIlrwA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=hOk75nr1
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Florian,

Happy New Year and best wishes for 2026! :-)

On Fri, 17 Oct 2025 10:16:08 -0700
Florian Fainelli <f.fainelli@gmail.com> wrote:

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
> ---
>  package/cpulimit/0005-Correct-loop-function-signature.patch | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)

Applied to master after extending the commit log to explain a bit which
configurations are affected. Oddly enough recent compilers are happy,
but older GCC versions <= 10.x are not happy with the unnamed parameter.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
