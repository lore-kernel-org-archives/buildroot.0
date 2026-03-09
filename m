Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACCDFFCA191
	for <buildroot@archiver.kernel.org>; Mon,  9 Mar 2026 21:26:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 36AAB61314;
	Mon,  9 Mar 2026 21:26:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id S-mszxAmcbfu; Mon,  9 Mar 2026 21:26:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E522161307
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773091568;
	bh=6aQ5xo6tpZCYaQV8M8clPH2w8U8UHbXoYR5nTHr95gc=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=CWJ78mjmuTfqnEo1qCUoKijSwAqiOALihuasSAQku3hDGKK1XUmibqGEQnzKtrqCQ
	 qUX1c1sQwKIRG4SokN9hFYr2zxJdLQphG7612CKSCtDm6Lld6F0JCc+iDbYdNFuPtF
	 Zp4PnEnZxDa+v9Kqjvl40e81JXAv82mQGu9/QGstfFCOOUeBcdelgQLzfLMYwsDOCQ
	 N2sR7XWseeGYa/S0wt4B+lCWZcHNUgq6ntMpxSjclQoXCAjkntKY1gWWNkr5sZfyJl
	 QRevGSnnwttzwKlewTM/I8iT6pUuZrxzAAEEwjUoHwIoVyjRPEHb96GOjMeR9NRz7D
	 crThsUuwhC6kw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E522161307;
	Mon,  9 Mar 2026 21:26:07 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 7FAF4B8
 for <buildroot@buildroot.org>; Mon,  9 Mar 2026 21:26:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 65237827DE
 for <buildroot@buildroot.org>; Mon,  9 Mar 2026 21:26:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id h3IR1M1qOss5 for <buildroot@buildroot.org>;
 Mon,  9 Mar 2026 21:26:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org EA7B98248F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EA7B98248F
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EA7B98248F
 for <buildroot@busybox.net>; Mon,  9 Mar 2026 21:26:04 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id EA03413F8A2;
 Mon,  9 Mar 2026 22:26:00 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 09 Mar 2026 22:26:00 +0100
MIME-Version: 1.0
Date: Mon, 09 Mar 2026 22:26:00 +0100
To: Francois Perrad <francois.perrad@gadz.org>
Cc: buildroot@busybox.net
In-Reply-To: <20260308150650.48948-3-francois.perrad@gadz.org>
References: <20260308150650.48948-1-francois.perrad@gadz.org>
 <20260308150650.48948-3-francois.perrad@gadz.org>
User-Agent: Webmail Free/1.6.13
Message-ID: <f729111f87eafb3bbc02cc86213f7c2a@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1773091562;
 bh=3nzuAbscpwgs3x/fAGiQElvuGnihTxuek6CKkzKHVY0=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=pittRKuP3fhZU5AVPFJEO6njyzqcAe992F6wXTM2lw9GHCz6tz5EBRHkazCGUiTAB
 DJibZqLMgc4taNd3zz5YiQBr0lTADOhqENT9W9pndmhR1tApj3GA/s6bcPjH4f06ir
 ETZ1of36+Y9iLg0tpPsXFb2y+sZLaJY70hJe0fD032BbOSaXTEU4V+DGLou5zpn6+u
 BlVFB5ADL/Agq4X4zIdK+ExoYYw0PLpM1z+ZPwhhZUr9pcyc5ulclDPihs4L8imkZj
 cyX46c836PK2BkKLpkS4flNXq/1X7wOUcHRgO9Tk3d0rRIv2wg2sxA2+UK8b/+bqGi
 gtHXW533y8GoA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=pittRKuP
Subject: Re: [Buildroot] [PATCH v2 2/2] package/ficl: bump to version 3.05
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Francois,

Thanks for the update.

On 08/03/2026 16:06, Francois Perrad via buildroot wrote:
> - sources are now hosted on Github
> - ficl have its own LICENSE file
> - remove one upstreamed patch
> - support only static lib
> - requires C11
> ---
[...]
> diff --git a/package/ficl/ficl.mk b/package/ficl/ficl.mk
> index da9a9a33f..6ef94f11e 100644
> --- a/package/ficl/ficl.mk
> +++ b/package/ficl/ficl.mk
> @@ -4,55 +4,27 @@
>  #
>  
> ################################################################################
> 
> -FICL_VERSION = 303
> -FICL_VERSION_SO = 3.0.1
> +FICL_VERSION = 305

This new version does not resolve the issue on my side. See:
https://gitlab.com/jolivain/buildroot/-/pipelines/2374011153

Those build failures seems related to older uclibc. You might
need to do something like this:
https://gitlab.com/buildroot.org/buildroot/-/blob/2026.02/package/util-linux/util-linux.mk#L124

Also, your v2 also misses the "Signed-off-by:".

Did you considered my other comments in my last review?
https://lore.kernel.org/buildroot/907a398121ce011ac302cf4ff78de312@free.fr/
- squashing those two commits into a single one,
- updating to 3.06

You can test your patches with the command:

utils/test-pkg -a -p ficl

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
