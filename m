Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73FB9C48BC3
	for <buildroot@archiver.kernel.org>; Tue, 20 Feb 2024 21:00:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2E66660D68;
	Tue, 20 Feb 2024 21:00:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wHeVNdnYaeLi; Tue, 20 Feb 2024 21:00:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 20DB8605E8
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 20DB8605E8;
	Tue, 20 Feb 2024 21:00:48 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id DE1FF1BF3A7
 for <buildroot@lists.busybox.net>; Tue, 20 Feb 2024 21:00:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CA63440210
 for <buildroot@lists.busybox.net>; Tue, 20 Feb 2024 21:00:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id T2EAGTEQBSGJ for <buildroot@lists.busybox.net>;
 Tue, 20 Feb 2024 21:00:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 69FC840108
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 69FC840108
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 69FC840108
 for <buildroot@buildroot.org>; Tue, 20 Feb 2024 21:00:45 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 3D8C513F861;
 Tue, 20 Feb 2024 22:00:41 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Tue, 20 Feb 2024 22:00:41 +0100
Date: Tue, 20 Feb 2024 22:00:41 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <ZdUS-el3jQTC4haA@landeda>
References: <20240220185030.92016-1-bernd@kuhls.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240220185030.92016-1-bernd@kuhls.net>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1708462843;
 bh=T3hsVeEJzzKUqvQKnzpqAsiqxOkGS5Ug3/vACV+nWow=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=qN8AY5JwHtyypTFOI1taoJDxFgR6GbTg03I21GndD1mLvi52Tx1sLfaexIm0X+ATi
 ijv+B4LPKgf+feA3g+GoCOEvJQoMMcvDmxcQF7daW4zMvqQBP57uqYc8Ty0I1FjoXV
 3vSro2c17SffIBGxcxFa2/rs8q2zHe1YAM9/PpxyvTSXf2FB1sfOCA+BSVS2RBGu/z
 fq87hq8C04ayKfNG4qI54zabU1hgEHexY3A8Kt9AdORUalEiCyOWsmetD5fgcre/jL
 70uFRRfTqMfe3tW9WvzOASTPTUyvCUkkFkd0oU+pXo73VxxH5BkXLBvAFswSXzWLrR
 AqVVc2UgJRj7Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=qN8AY5Jw
Subject: Re: [Buildroot] [PATCH 1/1] package/bind: security bump version to
 9.16.48
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

Bernd, All,

On 2024-02-20 19:50 +0100, Bernd Kuhls spake thusly:
> Changelog: https://ftp.isc.org/isc/bind9/9.16.48/CHANGES
> 
> Version 9.16.46 fixes
> - CVE-2023-4408
> - CVE-2023-5517
> - CVE-2023-5679
> - CVE-2023-6516
> 
> Version 9.16.47 fixes CVE-2023-50387.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/bind/bind.hash | 4 ++--
>  package/bind/bind.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/bind/bind.hash b/package/bind/bind.hash
> index d500b61128..482b046c8d 100644
> --- a/package/bind/bind.hash
> +++ b/package/bind/bind.hash
> @@ -1,4 +1,4 @@
> -# Verified from https://ftp.isc.org/isc/bind9/9.16.44/bind-9.16.44.tar.xz.asc
> +# Verified from https://ftp.isc.org/isc/bind9/9.16.48/bind-9.16.48.tar.xz.asc
>  # with key AADBBA5074F1402F7B69D56BC5B4EE931A9F9DFD
> -sha256  cfaa953c36d5ca42d9584fcf9653d07c85527b59687e7c4d4cb8071272db6754  bind-9.16.44.tar.xz
> +sha256  8d3814582348f90dead1ad410b1019094cd399d3d83930abebb2b3b1eb0b2bbb  bind-9.16.48.tar.xz
>  sha256  13491a682dc0f5ee2273cebd3949e2be62f9470fe659419a03a308d4f444773b  COPYRIGHT
> diff --git a/package/bind/bind.mk b/package/bind/bind.mk
> index 03ffcbec42..0d81ffabd6 100644
> --- a/package/bind/bind.mk
> +++ b/package/bind/bind.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -BIND_VERSION = 9.16.44
> +BIND_VERSION = 9.16.48
>  BIND_SOURCE= bind-$(BIND_VERSION).tar.xz
>  BIND_SITE = https://ftp.isc.org/isc/bind9/$(BIND_VERSION)
>  # bind does not support parallel builds.
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
