Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41D52C3ABAD
	for <buildroot@archiver.kernel.org>; Sun, 15 Sep 2024 21:42:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F360784538;
	Sun, 15 Sep 2024 21:42:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id n-87cdU9NCzO; Sun, 15 Sep 2024 21:42:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6888684909
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6888684909;
	Sun, 15 Sep 2024 21:42:06 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5274A1BF28B
 for <buildroot@lists.busybox.net>; Sun, 15 Sep 2024 21:37:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3D29740597
 for <buildroot@lists.busybox.net>; Sun, 15 Sep 2024 21:37:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dzc-kvN9CdHw for <buildroot@lists.busybox.net>;
 Sun, 15 Sep 2024 21:37:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::15;
 helo=smtp6-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org CAD184059E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CAD184059E
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CAD184059E
 for <buildroot@buildroot.org>; Sun, 15 Sep 2024 21:37:13 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown [92.184.112.7])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id B76C3780368;
 Sun, 15 Sep 2024 23:37:07 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 15 Sep 2024 23:37:06 +0200
Date: Sun, 15 Sep 2024 23:37:06 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Peter Korsgaard <peter@korsgaard.com>
Message-ID: <ZudTgkMmVWyn4GQr@landeda>
References: <20240915152632.1374847-1-peter@korsgaard.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240915152632.1374847-1-peter@korsgaard.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1726436230;
 bh=8uJE2IzaQ4YN4TG72XlALxFbUEfAQ11xLzv2KaYa1CU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=HauKUDwA/IyhfyH6TtkL613OYImMDYcTVujZRTlxNtqBUE6Uu4gPAyKY7+ME5mvb2
 juUr+kLc0wYTjtcmeq4MiuZA/tvpOnH4VeEG6G7gDc5vJItrqhVvDfb/T9ZCvwmuFF
 fwx2qHAOp73ZrnnDVKCbWpRYW48JDkcnBoU1RsJwX8mwnOmHS7+iwE2A3Mz54l8dnw
 OWOP0On+ibE5Q57L1NC2hZOuTEBEVV6IgSo1Dhw8x3VgLMEU5BNOh9qzwrhj1L8rpN
 Qp5CNNMGUm9A4m4mrqWqQ9y8kvVLGy8q0Ktn2LbrVobHCVStdT46Xbi9lZdvg7eRsU
 S1WpMCJXjNSOA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=HauKUDwA
Subject: Re: [Buildroot] [PATCH] docs/manual/manual.adoc: unbreak
 BR2_VERSION logic
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Peter, All,

On 2024-09-15 17:26 +0200, Peter Korsgaard spake thusly:
> The behaviour of asciidoc on my laptop (Debian 10.2.0-1) changed at the end
> of last year, causing the BR2_VERSION logic to no longer work:
> 
> grep 'manual generated' buildroot-2023.02.*/docs/manual/manual.text
> buildroot-2023.02.6/docs/manual/manual.text:Buildroot 2023.02.6 manual generated on 2023-10-16 08:41:26 UTC from
> buildroot-2023.02.7/docs/manual/manual.text:Buildroot ${BR2_VERSION%%-git*} manual generated on 2023-11-14
> buildroot-2023.02.8/docs/manual/manual.text:Buildroot ${BR2_VERSION%%-git*} manual generated on 2023-12-04
> 
> We don't really NEED to strip the -git suffix, so just drop that to unbreak
> the version output.

I've added a blurb to explain why we don't need to drop the suffix.

Applied to master, thanks.

Regards,
Yann E. MORIN.

> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
>  docs/manual/manual.adoc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/docs/manual/manual.adoc b/docs/manual/manual.adoc
> index 31d5f80bae..cfcc3e52a9 100644
> --- a/docs/manual/manual.adoc
> +++ b/docs/manual/manual.adoc
> @@ -4,7 +4,7 @@
>  = The Buildroot user manual
>  :toc:
>  
> -Buildroot {sys:echo $\{BR2_VERSION%%-git*\}} manual generated on {localdate}
> +Buildroot {sys:echo $BR2_VERSION} manual generated on {localdate}
>  {localtime} from git revision {sys:git rev-parse --short HEAD}
>  
>  The Buildroot manual is written by the Buildroot developers.
> -- 
> 2.39.2
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
