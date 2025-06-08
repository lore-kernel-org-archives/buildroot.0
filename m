Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD1FBC5AD49
	for <buildroot@archiver.kernel.org>; Sun,  8 Jun 2025 17:27:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2FAE360F34;
	Sun,  8 Jun 2025 17:27:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GpPp6R8X0_sa; Sun,  8 Jun 2025 17:27:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4181D60AEA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4181D60AEA;
	Sun,  8 Jun 2025 17:27:06 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id B4AF11F2
 for <buildroot@buildroot.org>; Sun,  8 Jun 2025 17:27:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 957848133F
 for <buildroot@buildroot.org>; Sun,  8 Jun 2025 17:27:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PjsJTEz4BQ64 for <buildroot@buildroot.org>;
 Sun,  8 Jun 2025 17:27:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::13;
 helo=smtp4-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org A0EC48133E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A0EC48133E
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A0EC48133E
 for <buildroot@buildroot.org>; Sun,  8 Jun 2025 17:27:03 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:93aa:5000:c0e7:5e2f:eef4:db82])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id 71F4819F5BA;
 Sun,  8 Jun 2025 19:26:59 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 08 Jun 2025 19:26:48 +0200
Date: Sun, 8 Jun 2025 19:26:48 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Julien Olivain <ju.o@free.fr>
Cc: buildroot@buildroot.org
Message-ID: <aEXH2DWromIdh5wW@landeda>
References: <20250608110626.17746-1-ju.o@free.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250608110626.17746-1-ju.o@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1749403621;
 bh=ui3r5mQFq0eKu8IspzemMg4AJfn19UsSx3UAzLaJHRU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=hW/bPHUpOUeaeN7CvCvLJl/ZKW48dY3LmRvJx2ez1WGhDHk3SPjAovAc+t+o7UE0L
 uq9F0TUxenUgp0UOIFjQ0RVCouiA2taguyxqXV8tPXOB0IimxEEaXMCfpEeGgy6iD1
 fob39wTHieUaHuyg2qPKa+4OaqmZCishzDuXNxOmdcMYETtybz3YKfNAHhmI1jIuHQ
 WHPDv5P2NUC6QztyNJzJIKjtwUaF3Xw0IAsvUk33pekeD93dPRDxXtpHGQ7NX/4gU9
 rqU5w+cNx7CrLThy0b3VEUwwB8cZGE/7HUdo+yzctrk4/TPpss84nCMC8L0r3F2GH1
 SXVMT+fWzXSTw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=hW/bPHUp
Subject: Re: [Buildroot] [PATCH 1/1] package/podman: raise kernel header
 requirement to v4.14
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Julien, All,

On 2025-06-08 13:06 +0200, Julien Olivain spake thusly:
> Since its introduction in commit [1], the podman package has a
> dependency on a toolchain with headers >= 3.17, which was propagated
> from libseccomp and slirp4netns. The podman package also selects
> BR2_PACKAGE_SHADOW which has a requirement on toolchain with
> headers >= 4.14. See [2]. This requirement should have been
> propagated.
> 
> This commit fixes this issue.
> 
> Fixes:
> 
>     WARNING: unmet direct dependencies detected for BR2_PACKAGE_SHADOW
>       Depends on [n]: !BR2_STATIC_LIBS [=n] && BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_14 [=n]
>       Selected by [y]:
>       - BR2_PACKAGE_PODMAN [=y] && BR2_USE_MMU [=y] && BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS [=y] && BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS [=y] && BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS [=y] && BR2_PACKAGE_LIBSECCOMP_ARCH_SUPPORTS [=y] && BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_17 [=y] && BR2_TOOLCHAIN_HAS_THREADS [=y] && BR2_USE_WCHAR [=y]
> 
> [1] https://gitlab.com/buildroot.org/buildroot/-/commit/ebbaac08e3f462bf023c12077f739ed1c0543eb2
> [2] https://gitlab.com/buildroot.org/buildroot/-/commit/f78c5cb5cae93a9e63dad4361d78e1787759382f
> 
> Cc: Yann E. MORIN <yann.morin.1998@free.fr>
> Signed-off-by: Julien Olivain <ju.o@free.fr>
> ---
>  package/podman/Config.in | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/podman/Config.in b/package/podman/Config.in
> index 4378d9918d..2bcb8e71d2 100644
> --- a/package/podman/Config.in
> +++ b/package/podman/Config.in
> @@ -5,7 +5,7 @@ config BR2_PACKAGE_PODMAN
>  	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS  # netavark
>  	depends on BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS  # libgpgme
>  	depends on BR2_PACKAGE_LIBSECCOMP_ARCH_SUPPORTS  # libseccomp
> -	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_17  # libseccomp
> +	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_14  # shadow

I always wondered how we should express this situation: should we keep
both dependencies? For example, if shadow dropes the dependency on 4.14,
then we'd drop it from podman too; but then we'd be missing the one on
3.17 as inherited from libsecomp...

But anyway, there's no good soltion...

Acked-by: Yann E. MORIN <yann.morin.1998@free.fr>

Thanks for fixing my mess! ;-)

Regards,
Yann E. MORIN.

>  	depends on BR2_TOOLCHAIN_HAS_THREADS  # conmon
>  	depends on BR2_USE_WCHAR  # conmon
>  	select BR2_PACKAGE_HOST_GO
> @@ -81,12 +81,12 @@ endchoice
>  
>  endif
>  
> -comment "podman needs a toolchain w/ headers >= 3.17, threads, wchar"
> +comment "podman needs a toolchain w/ headers >= 4.14, threads, wchar"
>  	depends on BR2_USE_MMU
>  	depends on BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
>  	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
>  	depends on BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS
>  	depends on BR2_PACKAGE_LIBSECCOMP_ARCH_SUPPORTS
> -	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_17 \
> +	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_14 \
>  		|| !BR2_TOOLCHAIN_HAS_THREADS \
>  		|| !BR2_USE_WCHAR
> -- 
> 2.49.0
> 

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
