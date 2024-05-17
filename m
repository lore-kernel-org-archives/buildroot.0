Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C18FC04FFE
	for <buildroot@archiver.kernel.org>; Fri, 17 May 2024 15:39:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0CF3081E2D;
	Fri, 17 May 2024 15:39:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dQXWcP6edGQL; Fri, 17 May 2024 15:39:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E21318176E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E21318176E;
	Fri, 17 May 2024 15:39:09 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7C3421BF2FA
 for <buildroot@lists.busybox.net>; Fri, 17 May 2024 15:39:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 68EB0405E8
 for <buildroot@lists.busybox.net>; Fri, 17 May 2024 15:39:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yIGDkUqFqQbY for <buildroot@lists.busybox.net>;
 Fri, 17 May 2024 15:39:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 3017A40592
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3017A40592
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3017A40592
 for <buildroot@buildroot.org>; Fri, 17 May 2024 15:39:07 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 6927F13F8AE;
 Fri, 17 May 2024 17:39:02 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Fri, 17 May 2024 17:39:02 +0200
Date: Fri, 17 May 2024 17:39:02 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Jarkko Sakkinen <jarkko@kernel.org>
Message-ID: <Zkd6Fnl8gkytr_ob@landeda>
References: <20240517132039.7124-1-jarkko@kernel.org>
 <20240517132039.7124-2-jarkko@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240517132039.7124-2-jarkko@kernel.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1715960345;
 bh=PbHQcvgEMOZJR4cC6zaVWoWDpqe9wB5SN6qLQZCapMY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=DyBEW2fApA5GDIrY4PhuODarnUAKW1vYhGkqIres4emEhdlCfcQqA215HFpbXhWZu
 3yaAKqlvG3wV7W7MwdrHAkP0JgiG0h2lArRQSU6LkbV/b8wpvZTi4Y1zMhFC3+jC2V
 enLtNb/de886NwcoLJFsuG9VCFttmUeif6SMgya60Mows5bdfMMeyIMSTAe1dSUcSj
 tM3eJ2Dn6puyDY69aja0SWuS8hzq3ETf7T7JrOG1tINwTUETWifMJeR7QQPwtuV1SR
 3gvP9DWwMVE4t+36/NVNXQ7/L9FE8i+HC35PXh28gNwn0svFRexbIb+3yWOn/eXu6a
 QPx1Ux0liGOjA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=DyBEW2fA
Subject: Re: [Buildroot] [PATCH 1/4] package/quota: Update DEVELOPERS address
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
Cc: Stefan Berger <stefanb@linux.ibm.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Jarkko, All,

On 2024-05-17 16:20 +0300, Jarkko Sakkinen spake thusly:
> Signed-off-by: Jarkko Sakkinen <jarkko@kernel.org>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  DEVELOPERS | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/DEVELOPERS b/DEVELOPERS
> index a9deddb343..52c9b84a9d 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -1518,7 +1518,7 @@ F:	package/zip/
>  N:	Jared Bents <jared.bents@rockwellcollins.com>
>  F:	package/libvirt/
>  
> -N:	Jarkko Sakkinen <jarkko.sakkinen@intel.com>
> +N:	Jarkko Sakkinen <jarkko@kernel.org>
>  F:	package/quota/
>  
>  N:	Jason Pruitt <jrspruitt@gmail.com>
> -- 
> 2.45.0
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
