Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7849BCD1292
	for <buildroot@archiver.kernel.org>; Mon,  1 Apr 2024 12:21:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4489281EB2;
	Mon,  1 Apr 2024 12:21:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fmnKqyelrGl6; Mon,  1 Apr 2024 12:21:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3807981EBE
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3807981EBE;
	Mon,  1 Apr 2024 12:21:56 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 96B431BF2CD
 for <buildroot@lists.busybox.net>; Mon,  1 Apr 2024 12:21:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 83E924031C
 for <buildroot@lists.busybox.net>; Mon,  1 Apr 2024 12:21:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TGJ7T1mDe1of for <buildroot@lists.busybox.net>;
 Mon,  1 Apr 2024 12:21:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 4BA35402F3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4BA35402F3
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4BA35402F3
 for <buildroot@buildroot.org>; Mon,  1 Apr 2024 12:21:53 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 4741513FA37;
 Mon,  1 Apr 2024 14:21:47 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 01 Apr 2024 14:21:47 +0200
Date: Mon, 1 Apr 2024 14:21:47 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Christian Stewart <christian@aperture.us>
Message-ID: <Zgqm28arkssJGgzZ@landeda>
References: <20240331074614.17359-1-christian@aperture.us>
 <20240331074614.17359-2-christian@aperture.us>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240331074614.17359-2-christian@aperture.us>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1711974111;
 bh=9nqYmueyfecU9cbHdA7SxfT45QfcrrioHIYHoezATps=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=q23waj1ViScJeooUKxcpRbJpAcynrUGl33pw79apbtVcGTFmEq3E5uVlmRdFObwaI
 McBkOVPkilawoT2ufZkrsA1q86W0moua72/GrH8PP7feKpSInRSok4BWnIQBx04fee
 BRviW0SlKb7gBVuGjpJvs8mpfUD9Yfi4CQ/G/4XFCmdCQD1gYUprdEcih/oLPIx6Im
 gXJ7FlfOLN5KJmdHIP2LLcLq5t21lSiIw5s5PxnWmR/zanndWzK9Ciy5I3Q/JZZoj+
 /Q9y9WN+n2VADfoSv122F9pDUzd1uEMpGIysl4KGhSJX/yhyPjVY8pVt455LPryC5l
 0ekv0HMjZPqsA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=q23waj1V
Subject: Re: [Buildroot] [PATCH v1 2/2] package/docker-cli: bump version to
 v26.0.0
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
Cc: Stefan Agner <stefan@agner.ch>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Christian, All,

On 2024-03-31 00:46 -0700, Christian Stewart via buildroot spake thusly:
> Update to the latest major release of docker-cli.
> 
> https://github.com/moby/moby/releases/tag/v26.0.0
> 
> Signed-off-by: Christian Stewart <christian@aperture.us>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/docker-cli/docker-cli.hash | 2 +-
>  package/docker-cli/docker-cli.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/docker-cli/docker-cli.hash b/package/docker-cli/docker-cli.hash
> index 9c8d08bba5..26558814c1 100644
> --- a/package/docker-cli/docker-cli.hash
> +++ b/package/docker-cli/docker-cli.hash
> @@ -1,3 +1,3 @@
>  # Locally calculated
> -sha256  72a54d131c28938221c81bd08364459fed9c71c093d4d615d324aaf31de6db1d  docker-cli-24.0.7.tar.gz
> +sha256  96ed5d7c33a12f505d13fa03fa48f94cb41cf871178df0df84aa0b76839ad321  docker-cli-26.0.0.tar.gz
>  sha256  2d81ea060825006fc8f3fe28aa5dc0ffeb80faf325b612c955229157b8c10dc0  LICENSE
> diff --git a/package/docker-cli/docker-cli.mk b/package/docker-cli/docker-cli.mk
> index 95fce27ffb..5f9242329a 100644
> --- a/package/docker-cli/docker-cli.mk
> +++ b/package/docker-cli/docker-cli.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -DOCKER_CLI_VERSION = 24.0.7
> +DOCKER_CLI_VERSION = 26.0.0
>  DOCKER_CLI_SITE = $(call github,docker,cli,v$(DOCKER_CLI_VERSION))
>  
>  DOCKER_CLI_LICENSE = Apache-2.0
> -- 
> 2.43.0
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
