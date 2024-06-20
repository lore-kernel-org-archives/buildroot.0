Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D2EEC27C79
	for <buildroot@archiver.kernel.org>; Thu, 20 Jun 2024 18:35:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id EFF97404C3;
	Thu, 20 Jun 2024 18:35:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Q0BxKpzPkYSN; Thu, 20 Jun 2024 18:35:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9671C405DD
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9671C405DD;
	Thu, 20 Jun 2024 18:35:07 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 395361BF3DD
 for <buildroot@lists.busybox.net>; Thu, 20 Jun 2024 18:35:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 264FC614AA
 for <buildroot@lists.busybox.net>; Thu, 20 Jun 2024 18:35:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iBl5Vy9HcLg1 for <buildroot@lists.busybox.net>;
 Thu, 20 Jun 2024 18:35:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org F08F7606FA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F08F7606FA
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp3.osuosl.org (Postfix) with ESMTPS id F08F7606FA
 for <buildroot@buildroot.org>; Thu, 20 Jun 2024 18:35:04 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id CD02F13F880
 for <buildroot@buildroot.org>; Thu, 20 Jun 2024 20:35:01 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Thu, 20 Jun 2024 20:35:01 +0200
Date: Thu, 20 Jun 2024 20:35:01 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Message-ID: <ZnR2VURyTmEnZeIy@landeda>
References: <20240620155722.2931020-1-yann.morin.1998@free.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240620155722.2931020-1-yann.morin.1998@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1718908502;
 bh=ahUfo08W4j3Ho4Uj3030PjH9aAo0kgJOBBvmfwCxB2I=;
 h=Date:From:To:Subject:References:In-Reply-To:From;
 b=DaSE0yNFdJ3a1ma4Hls7IRWB4HYjFWKaZoQhzaswCJmDOB+zj+KCU5k5BOLRB9mOA
 BXNnM4leDBO4QhdGZFA2XnSfUaETU7qSsPPR/rdxxJsKLy39WwY1+1E307fbrt5wtJ
 6IDX5yW3NlKj07RMGlTBJfr66jxxyWiUNM8elWVvlo3LzE9nCnvymg/lM2YQd6zV2Y
 MvjNYDTMoMa1pIvv3qcpZcXT95d080itomHMb7gLI0061BfPYxKvdNtVO19Nva9LHs
 ooT8T7+hzjKZsrRtrFbnlFhMM9ybKlCIETY6Vr+M/WXFzFzJZo+MYFD60m8ZqOli7Z
 oOSLuC6E/58Pw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=DaSE0yNF
Subject: Re: [Buildroot] [PATCH] package/go: ensure there is a host-go
 provider
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

All,

On 2024-06-20 17:57 +0200, Yann E. MORIN spake thusly:
> Commit fa2536ec9401 (package/go: make host package a virtual package)
> introduced host-go as a host-only virtual package, which had a single
> provider, the choice of which is only exposed when a (target or host)
> package has selected BR2_PACKAGE_HOST_GO to indicate it needs host-go.
> 
> However, this forgot to account for prompt-less, host-only packages,
> which have no way of selecting that symbol.
> 
> Having prompt-less, host-only packages is a totally unexceptional,
> supported case; for example a host package can be depended upon by
> another (target or host) package, or by a filesystem, and we do not
> require Kconfig symbols to be exposed for those packages.
> 
> As a consequence, when not package is enabled, that can select that
> symbol, we can't run 'make source' or 'make host-foo-source':
> 
>     make[1]: *** No rule to make target 'host-', needed by
>     '[...]/build/host-go-1.22.4/.stamp_configured'. Stop.
> 
> Fix that by moving the provider symbol out of the if-block, so that
> there is always a provider defined.
> 
> Now, we only have host-go-src as a provider, but the symbol is still
> part of the choice that is conditional (and that _has_ to be
> conditional), so the BR2_PACKAGE_HOST_GO_SRC can never be set unless
> there is a package that explicitly select BR2_PACKAGE_HOST_GO.
> 
> So, drop the conditional on the default, so that there is always a
> provider available.
> 
> This mirrors other similar situations, like the rust case.
> 
> Fixes: fa2536ec940105acc71630144bd1187c931462ac
> 
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>

Applied to master, after adding the LGTM tag Arnout provided on IRC,
thanks.

Regards,
Yann E. MORIN.

> ---
>  package/go/Config.in.host | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/go/Config.in.host b/package/go/Config.in.host
> index 483393f8e4..92c1f4cdc3 100644
> --- a/package/go/Config.in.host
> +++ b/package/go/Config.in.host
> @@ -54,12 +54,12 @@ config BR2_PACKAGE_HOST_GO_SRC
>  
>  endchoice
>  
> +endif
> +
>  config BR2_PACKAGE_PROVIDES_HOST_GO
>  	string
> -	# Default to host-go-src
> -	default "host-go-src" if BR2_PACKAGE_HOST_GO_SRC
> -
> -endif
> +	# Default to host-go-src, as the only provider for now
> +	default "host-go-src"
>  
>  source "package/go/go-bootstrap-stage1/Config.in.host"
>  source "package/go/go-bootstrap-stage2/Config.in.host"
> -- 
> 2.45.1
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
