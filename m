Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0B0CC27C54
	for <buildroot@archiver.kernel.org>; Thu,  6 Jun 2024 11:44:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7200080F37;
	Thu,  6 Jun 2024 11:44:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qs23lSjnwsRC; Thu,  6 Jun 2024 11:44:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7ECC780F32
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7ECC780F32;
	Thu,  6 Jun 2024 11:44:20 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 43FC01BF5DE
 for <buildroot@lists.busybox.net>; Thu,  6 Jun 2024 11:44:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 30CFE60842
 for <buildroot@lists.busybox.net>; Thu,  6 Jun 2024 11:44:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 74N6pItgHGsP for <buildroot@lists.busybox.net>;
 Thu,  6 Jun 2024 11:44:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 2CBA460752
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2CBA460752
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2CBA460752
 for <buildroot@buildroot.org>; Thu,  6 Jun 2024 11:44:17 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id CD27F13F8CF;
 Thu,  6 Jun 2024 13:44:10 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Thu, 06 Jun 2024 13:44:10 +0200
Date: Thu, 6 Jun 2024 13:44:10 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Thomas Perale <thomas.perale@essensium.com>
Message-ID: <ZmGhClo0Bvp-PrlF@landeda>
References: <20240415162229.1357491-1-thomas.perale@mind.be>
 <20240415162229.1357491-4-thomas.perale@mind.be>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240415162229.1357491-4-thomas.perale@mind.be>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1717674255;
 bh=VHXNNJRucc3ktwPXpAgxnYpY44uDiW5KlHKqwFmLTy0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ROpDT/sy1NHT6hbtVsy+l+avnhCtM5BCMIBL+n1pfrPPKiiepiKuJIQhGbqr0t3XK
 mXGXMMR+sEG/429gF8f7XZHbIge7Cq3DxPUxBphkPV5651vIVPVVEq3GBlXnJYI67u
 svd68Kcg0PYhIUcbj6jfGINyLuwzuvjzynMlH2ZawqzmdGK4Wyln3bM8MzSBXKxCdq
 pQk7grcLctJgywzS04UJTO7C+GmmEtt0nLjfLNOBO3DMoOjcrkUabap218lrQVNyqO
 ggT3b0SxycR4MYoOjMzbwJORa1CQFPVQ0XHTZ5hCpasyCVsyf6iRxfLjQOPocwFNib
 qNRd6iSvjsqrg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=ROpDT/sy
Subject: Re: [Buildroot] [PATCH v2 3/6] package/pkg-golang: select
 BR2_PACKAGE_HOST_GO
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
> Makes every packages built by the Go compiler select a new variable
> introduced in this patch: BR2_PACKAGE_HOST_GO.
> In later commits Go compiler variant will be introduced (built from
> source, pre-built binaries) and selecting BR2_PACKAGE_HOST_GO will
> force to add host-go provider to the dependency list.
[--SNIP--]
> diff --git a/package/delve/Config.in b/package/delve/Config.in
> index 9428e4016a..288dc1ea15 100644
> --- a/package/delve/Config.in
> +++ b/package/delve/Config.in
> @@ -7,6 +7,7 @@ config BR2_PACKAGE_DELVE_ARCH_SUPPORTS
>  	default y if BR2_x86_64
>  	depends on BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
>  	depends on BR2_PACKAGE_HOST_GO_TARGET_CGO_LINKING_SUPPORTS
> +	select BR2_PACKAGE_HOST_GO
> 
>  config BR2_PACKAGE_DELVE
>  	bool "delve"

I missed that the 'select' was added to the _ARCH_SUPPORTS symbol, not
to the main symbol. That means that hos-go (and all the bootstraps
before it) are built as soon as the target is supported be delve, even
if devle is not itself enabled.

I've sent a fixup commit that moves the seelct to the main symbol
instead:
    https://gitlab.com/buildroot.org/buildroot/-/commit/f820d41f0a7479bd43b72dcc4f70b978e5d0ed70

I looked at the other packages, and I could not spot any issue. Could
you please have a second look on your side, please?

Regards,
Yann E. MORIN.

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
