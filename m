Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97303C54E49
	for <buildroot@archiver.kernel.org>; Sun,  3 Mar 2024 16:08:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4F42E81F25;
	Sun,  3 Mar 2024 16:08:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CKS9jl9e_Xgu; Sun,  3 Mar 2024 16:08:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5DF9581F2D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5DF9581F2D;
	Sun,  3 Mar 2024 16:08:38 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9CDF01BF37A
 for <buildroot@lists.busybox.net>; Sun,  3 Mar 2024 16:08:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 97A6181F34
 for <buildroot@lists.busybox.net>; Sun,  3 Mar 2024 16:08:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fi_0YenzXzt4 for <buildroot@lists.busybox.net>;
 Sun,  3 Mar 2024 16:08:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 689E181F2D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 689E181F2D
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 689E181F2D
 for <buildroot@buildroot.org>; Sun,  3 Mar 2024 16:08:34 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 6EBBA13F8C2;
 Sun,  3 Mar 2024 17:08:25 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 03 Mar 2024 17:08:25 +0100
Date: Sun, 3 Mar 2024 17:08:25 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <ZeSgeRSJcx8eU3Fp@landeda>
References: <20240303141003.173987-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240303141003.173987-1-thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1709482110;
 bh=BJQjZmlbDBYMvxbxL9mQssLENeomH+XV/t+Hw1PzBvw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=vCP+yW/6cDWCD9vjurolDuNhozpA/PrRlRFghgEcJsWAufhbnZUH1fJq8WgjBS0j3
 boG4bFeroUc1hgtB3ieLSXFyJgTlLAlz0r1emcMwtlC/H5bzD0dkHKVzUvd6BeHdvA
 7PXmCyzvMNwvpnckkuzmT2SgKWq8K9IMVzRwBXbA7d/UDnSDAdYYa9yexeBeyO6zEt
 rls0gi4cRjqtoWz14KVcCsDvZFgIvFzqqXjt4T9IqeF/iTS/NksLdogazVL0Eg7ukv
 zx7MG4pgqNWigjRiiWC7sVysxcXiVwszDdgNAT/62RvRlIJJpdVX5eufQezU5h5VMl
 7JLmhDvXfMKkg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=vCP+yW/6
Subject: Re: [Buildroot] [PATCH] package/gcc: fix BR2_GCC_VERSION_ARC
 definition for gcc 13.x
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Alexey Brodkin <Alexey.Brodkin@synopsys.com>,
 Romain Naour <romain.naour@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Thomas, All,

On 2024-03-03 15:10 +0100, Thomas Petazzoni via buildroot spake thusly:
> Since the ARC-special GCC version was bumped from gcc 10.x to gcc 13.x
> in commit 045ab73702b8bc09f94ca1f3b8e5bf3acb0b0843 ("toolchain: bump
> ARC toolchain components to arc-2023.09-release"), the
> BR2_GCC_VERSION_ARC option definition is not entirely correct: it
> selects BR2_TOOLCHAIN_GCC_AT_LEAST_10, while it should select
> BR2_TOOLCHAIN_GCC_AT_LEAST_13. This commit fixes this.
> 
> Cc: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/gcc/Config.in.host | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
> index fabc6173f5..d294e8da30 100644
> --- a/package/gcc/Config.in.host
> +++ b/package/gcc/Config.in.host
> @@ -13,7 +13,7 @@ config BR2_GCC_VERSION_ARC
>  	bool "gcc arc (13.1)"
>  	# Only supported architecture
>  	depends on BR2_arc
> -	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
>  
>  config BR2_GCC_VERSION_POWERPC_SPE
>  	bool "gcc powerpc spe"
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
