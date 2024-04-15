Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2F40C4345F
	for <buildroot@archiver.kernel.org>; Mon, 15 Apr 2024 16:44:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7A81D81423;
	Mon, 15 Apr 2024 16:44:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oTstpsl1lEUC; Mon, 15 Apr 2024 16:44:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 559D4813D5
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 559D4813D5;
	Mon, 15 Apr 2024 16:44:46 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B44531BF5E0
 for <buildroot@lists.busybox.net>; Mon, 15 Apr 2024 16:44:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AD6B5605E5
 for <buildroot@lists.busybox.net>; Mon, 15 Apr 2024 16:44:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 532-S_cnNopV for <buildroot@lists.busybox.net>;
 Mon, 15 Apr 2024 16:44:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 80471605DF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 80471605DF
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 80471605DF
 for <buildroot@buildroot.org>; Mon, 15 Apr 2024 16:44:42 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 2064D13F86A;
 Mon, 15 Apr 2024 18:44:34 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 15 Apr 2024 18:44:34 +0200
Date: Mon, 15 Apr 2024 18:44:34 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Thomas Perale <thomas.perale@essensium.com>
Message-ID: <Zh1ZciOBMxTssprd@landeda>
References: <20240415162229.1357491-1-thomas.perale@mind.be>
 <20240415162229.1357491-2-thomas.perale@mind.be>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240415162229.1357491-2-thomas.perale@mind.be>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1713199479;
 bh=IrUBb5akwrahJTFIO5+yVtkTi2x7LYnXhdLhPo5hgGI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=VjdAB1fvtRJNjGP3XndrWcl84VgswFGPyZzvrxALQTOzeTcOcNUyCRXYt2P9hGs0L
 KWAhtYX457Sh5yZHhU9Mj9KiNvK2qSD5xUTp/Zk4WlRCqq25E6l53z7KCrSH8W6Lhz
 bM8qi9KvHKT7Jvwa4UQ1rrg+bIGXyP0HJSZTSQNH6cDAM3tzXSNfmk+T0Ps08sruY6
 SM/ZyHUTHxl/njw+TNWHpFNKvI0SMi8Yw3+SSm3D5A+OnWg0Coxa0UMXg189zbFOo8
 CP8HtpXZpe9aLziiIH8G8UdOcw8TA6KjJVj1fSBvx5WOOYwYaUSrN9As10n4yGJK7G
 U6r2mxWzyzyQA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=VjdAB1fv
Subject: Re: [Buildroot] [PATCH v2 1/6] DEVELOPERS: add Thomas Perale for
 'go'
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
Cc: Christian Stewart <christian@paral.in>,
 Thomas Perale <thomas.perale@mind.be>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Thomas, All,

On 2024-04-15 18:22 +0200, Thomas Perale via buildroot spake thusly:
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>

Your From and Signed-off-by are still not the same: @essensium.com vs.
@mind.be.

Check your ~/.gitconfig for the proper user.email key. If you also set
format.signOff, it should automatically inject the proper SoB line, but
if you, like me, explicitly inject SoB lines [0], check your code
snippet.

[0] I use vim's snipmate plugin https://github.com/garbas/vim-snipmate
    with my own snippets for SoB lines:

    snippet sob
        Signed-off-by:
    snippet ME
        Yann E. MORIN <yann.morin.1998@free.fr>

(so that I can reflex-type sob<TAB>ME<TAB> for my SoB lines.)

For this series, no need to respin _just_ for this: just reply whether
to use the SoB line (@mind) or the From field (@essentium), and I can
fix it locally when applying.

Regards,
Yann E. MORIN.

> ---
>  DEVELOPERS | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/DEVELOPERS b/DEVELOPERS
> index 399b2931ff..039b803d50 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -2979,6 +2979,9 @@ F:	package/frotz/
>  F:	package/kvm-unit-tests/
>  F:	package/xorcurses/
> 
> +N:	Thomas Perale <thomas.perale@mind.be>
> +F:	package/go/
> +
>  N:	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
>  F:	arch/Config.in.arm
>  F:	board/beaglev/
> --
> 2.44.0
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
