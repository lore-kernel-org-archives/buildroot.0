Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D2E7C021A5
	for <buildroot@archiver.kernel.org>; Sat, 14 Sep 2024 16:25:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 47F1581334;
	Sat, 14 Sep 2024 16:25:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6OcNw8GwGSPx; Sat, 14 Sep 2024 16:25:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 47858813EE
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 47858813EE;
	Sat, 14 Sep 2024 16:25:01 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 244761BF83A
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 16:25:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1285840120
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 16:25:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id w53cb_dtectF for <buildroot@lists.busybox.net>;
 Sat, 14 Sep 2024 16:24:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.6;
 helo=smtp6-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 87A814010C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 87A814010C
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 87A814010C
 for <buildroot@buildroot.org>; Sat, 14 Sep 2024 16:24:58 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown [IPv6:2a02:61:a2::3f4])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id 1FB17780383;
 Sat, 14 Sep 2024 18:24:48 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 14 Sep 2024 18:24:48 +0200
Date: Sat, 14 Sep 2024 18:24:48 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Athaariq Ardhiansyah <foss@athaariq.my.id>
Message-ID: <ZuW40MpG-bqwnf43@landeda>
References: <20240610154028.792440-1-foss@athaariq.my.id>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240610154028.792440-1-foss@athaariq.my.id>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1726331095;
 bh=OI+VL6C5nRyd4pCpNt4B+9jTPNjRk6+mlar4YlODIXE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=d05crAXljK34LfiviAZcP7yRU5rpLbsiwuWQGMGqJKWo9DoTXGxtGFelIkY9oUj7T
 IbYh4I19wUsGUYmcYDWeR9U4AcHRjyGX0LbiRHD5QF6OuKMhdHs3/h8rETO8mpJsHP
 UlbDRHA08buabc2btrxevmEXBBmovKQzu+uDo21HWDBiBbpKZUtUY+VQi3auX43zUF
 Y8gsX+Tthy2MdW1BlEN7nq2pPAHdWPn/duvHYZr+yrV4NnTNfg4Bd412waAfgPUxTx
 lrqfqvz6XFS/DxaKsxE8+3jqfrpAvO4Q2EQKe9rXjQL8QRUZmvMe/wq2Sv2ZU45n/5
 HuZaXK1bCrszQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=d05crAXl
Subject: Re: [Buildroot] [PATCH 1/3] package/go: expose option to enable via
 configurator
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Thomas Perale <thomas.perale@mind.be>, Anisse Astier <anisse@astier.eu>,
 Christian Stewart <christian@aperture.us>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Athaariq, All,

On 2024-06-10 22:40 +0700, Athaariq Ardhiansyah spake thusly:
> Just in case you forgot it, I re-exposed the configuration option for
> enabling host-go virtual package before I'm adding host-go-bin
> subpackage.

Thank you for your patch.

I reworded the entire commit log when aplying: we want the commit log to
be in a neutral tense (no "I'), and explain why the patch is needed on
tehcnical grounds. You can check what I wrote:

    https://gitlab.com/buildroot.org/buildroot/-/commit/7cac7bc3c98c5008b646d2f33b386a45c0271a34

Thank you!

Regards,
Yann E. MORIN.

> Signed-off-by: Athaariq Ardhiansyah <foss@athaariq.my.id>
> ---
>  package/go/Config.in.host | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/go/Config.in.host b/package/go/Config.in.host
> index 483393f8e4..32483871e7 100644
> --- a/package/go/Config.in.host
> +++ b/package/go/Config.in.host
> @@ -34,7 +34,7 @@ config BR2_PACKAGE_HOST_GO_HOST_ARCH_SUPPORTS
>  
>  # Go packages should select BR2_PACKAGE_HOST_GO
>  config BR2_PACKAGE_HOST_GO
> -	bool
> +	bool "host go"
>  	depends on BR2_PACKAGE_HOST_GO_HOST_ARCH_SUPPORTS
>  
>  if BR2_PACKAGE_HOST_GO
> -- 
> 2.45.2
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
