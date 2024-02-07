Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D2CAC4828F
	for <buildroot@archiver.kernel.org>; Wed,  7 Feb 2024 09:24:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D1C7980E92;
	Wed,  7 Feb 2024 09:24:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qU4xdEyWzqzG; Wed,  7 Feb 2024 09:24:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B7FF880E38
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B7FF880E38;
	Wed,  7 Feb 2024 09:24:18 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 288EB1BF868
 for <buildroot@lists.busybox.net>; Wed,  7 Feb 2024 09:24:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 157E142115
 for <buildroot@lists.busybox.net>; Wed,  7 Feb 2024 09:24:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jnT7whW3jnei for <buildroot@lists.busybox.net>;
 Wed,  7 Feb 2024 09:24:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 18B6941FEA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 18B6941FEA
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 18B6941FEA
 for <buildroot@buildroot.org>; Wed,  7 Feb 2024 09:24:15 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown [85.119.216.19])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 7A6CD13F8CE;
 Wed,  7 Feb 2024 10:24:10 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Wed, 07 Feb 2024 10:24:10 +0100
Date: Wed, 7 Feb 2024 10:24:10 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <ZcNMOl2yYbS0rd39@landeda>
References: <20240207070541.2296330-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240207070541.2296330-1-thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1707297852;
 bh=RF+iY6hy57lr7Nyr7PqKKj4UEit1Wp74apHboVgxGgs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=cMehX7Q/GDC7nU7VZrRIkeYC+1ED8U9iyZYuDFWaTETrjblIL//25f53Lq+NBkJcq
 OA1FC/whq3DFV3rFxoVBC6zuwgcuxV/IHHodp784sgF625GmR2G4t4HC0xz6VsWGpA
 /xDDYxGuzj1QRY42jgpRYDieLpLqmG73rMiC6Lm5T2ynufKRtTSfimqVyytav8+afL
 0kfhRIVvKjMOj4irip2OwPJeUT+Pz7RFvkT0LhDpdF0wldoKH4E7jpF82N7x0mL6sN
 RSxsv85SuqHGcaxBq5Y6IZ0iuUDJfc50LbE+xyO7uSxzd61bRkEdHqvwM5weVaNVML
 mMcVVePrKbDCQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=cMehX7Q/
Subject: Re: [Buildroot] [PATCH] utils/genrandconfig: add default setting
 for bare-metal toolchain arch
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

Thomas, All,

On 2024-02-07 08:05 +0100, Thomas Petazzoni via buildroot spake thusly:
> We recently added support for building a bare-metal toolchain, and the
> autobuilders are therefore trying to build such toolchains. However,
> by default the BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH option is
> empty, causing the target tuple to be empty, and therefore
> host-gcc-bare-metal tries to build a toolchain for the target
> "x86_64-pc-linux-gnu", which isn't a bare-metal target, and fails
> badly.
> 
> In order to properly test this bare-metal support, this commit adjusts
> the genrandconfig script so that it injects a valid target
> architecture tuple.
> 
> Fixes:
> 
>   http://autobuild.buildroot.net/results/6cb1514b19bfe056fb984d3538bdccdda5e174c1/
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  utils/genrandconfig | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/utils/genrandconfig b/utils/genrandconfig
> index 52edad06d8..eb1f8cbd4a 100755
> --- a/utils/genrandconfig
> +++ b/utils/genrandconfig
> @@ -315,6 +315,10 @@ def fixup_config(sysinfo, configfile):
>         'BR2_TOOLCHAIN_BUILDROOT=y' in configlines:
>          return False
>  
> +    if 'BR2_TOOLCHAIN_BARE_METAL_BUILDROOT=y' in configlines:
> +        configlines.remove('BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH=""')
> +        configlines.add('BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH="microblazeel-xilinx-elf"')
> +
>      if 'BR2_PACKAGE_AUFS_UTIL=y\n' in configlines and \
>         'BR2_PACKAGE_AUFS_UTIL_VERSION=""\n' in configlines:
>          return False
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
