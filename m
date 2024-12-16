Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 481B4E7717F
	for <buildroot@archiver.kernel.org>; Mon, 16 Dec 2024 23:16:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F406140493;
	Mon, 16 Dec 2024 23:16:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id c1v1oXO35MB1; Mon, 16 Dec 2024 23:16:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B9162404A9
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B9162404A9;
	Mon, 16 Dec 2024 23:16:06 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 50E47C5
 for <buildroot@buildroot.org>; Mon, 16 Dec 2024 23:16:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3E656607E5
 for <buildroot@buildroot.org>; Mon, 16 Dec 2024 23:16:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GWoCj4a3Jy5l for <buildroot@buildroot.org>;
 Mon, 16 Dec 2024 23:16:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.4;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org D7A45607DE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D7A45607DE
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D7A45607DE
 for <buildroot@buildroot.org>; Mon, 16 Dec 2024 23:16:01 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id AC0A919F57B;
 Tue, 17 Dec 2024 00:15:56 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:53854])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 17 Dec 2024 00:15:56 +0100
MIME-Version: 1.0
Date: Tue, 17 Dec 2024 00:15:56 +0100
From: Julien Olivain <ju.o@free.fr>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org, Jannik Becher <becher.jannik@gmail.com>
In-Reply-To: <20241216223620.1125276-1-thomas.petazzoni@bootlin.com>
References: <20241216223620.1125276-1-thomas.petazzoni@bootlin.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <3cb4c93ffe10e6ee545b6afc14683178@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1734390958;
 bh=xyMOIMVN+SGNRFv0pMJzeqYle/3GiTwK94tCkQMiLmI=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=FEKJRmcP8idRbRTa2VX4czF1m3aHnjYzv7j5gihKLhTPtIR7ctNxNw8k2LddabhIY
 kafIdU86/VUG7dopvxWlwagwm90IOks3RqXkd4sQvJQ1Tu6BzQK0KDw2n5hhuEWs3X
 1qeIbuwk5b2Ygm2RQ9q9HtgIsem4vPFLc32PsvTp7zplgDFb+TaiqZXj//N8953k53
 rq0W5KJN0d76WWf6ldZbk7J1PEx0sLUMSIm3mb9Z4Kw6ekk4nKnxXNETnJADXOLqhw
 fOkoBhKVdv9U09h+9usOPBXGk5PfYI16oTXvyNDPCqwb9Q5IJMvEhWzBwjZhUOSJKg
 TW5tYaHlYk9dQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=FEKJRmcP
Subject: Re: [Buildroot] [PATCH] utils/genrandconfig: more igh-ethercat
 tweaks
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 16/12/2024 23:36, Thomas Petazzoni via buildroot wrote:
> utils/genrandconfig already had some logic to disable building
> igh-ethercat drivers since they are highly kernel version
> specific. Commit
> eec3a1108a65ab8de4a313a7f34205c5d5ad8f2b ("package/igh-ethercat: add
> configuration options") recently added a number of additional config
> options to build more igh-ethercat drivers, which causes a number of
> autobuilder failures. This commit therefore updates genrandconfig to
> also not build those new drivers.
> 
> Fixes:
> 
>   
> https://autobuild.buildroot.org/results/9489b68967a35aa398e608d663824b2d2be9cae5/ 
> (stmmac driver)
>   
> https://autobuild.buildroot.org/results/ec2c24f16b365a3e7de8964fc8d73cb570c74abe/ 
> (igc driver)
>   
> https://autobuild.buildroot.org/results/65e17f8e03ab14dd9f39386f2176629677b8ba8c/ 
> (genet driver)
> 
> Cc: Jannik Becher <becher.jannik@gmail.com>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Applied to master, thanks.

> ---
>  utils/genrandconfig | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/utils/genrandconfig b/utils/genrandconfig
> index 0698cc5ff0..67f0ea9f73 100755
> --- a/utils/genrandconfig
> +++ b/utils/genrandconfig
> @@ -504,7 +504,8 @@ async def fixup_config(sysinfo, configfile):
> 
>      # Don't build igh-ethercat driver as they are highly
>      # kernel-version specific
> -    for opt in ['8139TOO', 'E100', 'E1000', 'E1000E', 'R8169']:
> +    for opt in ['8139TOO', 'E100', 'E1000', 'E1000E', 'R8169', 
> 'GENET',
> +                'IGB', 'IGC', 'STMMAC_PCI', 'STMMAC', 'DWMAC_INTEL', 
> 'CCAT']:
>          optstr = 'BR2_PACKAGE_IGH_ETHERCAT_%s=y\n' % opt
>          if optstr in configlines:
>              configlines.remove(optstr)
> --
> 2.47.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
