Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21A5CCD1297
	for <buildroot@archiver.kernel.org>; Thu, 11 Apr 2024 04:25:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D801B40535;
	Thu, 11 Apr 2024 04:25:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eCMl_zy88e1v; Thu, 11 Apr 2024 04:25:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8EFC040539
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8EFC040539;
	Thu, 11 Apr 2024 04:25:02 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 83F161BF396
 for <buildroot@lists.busybox.net>; Thu, 11 Apr 2024 04:25:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 709C860B8A
 for <buildroot@lists.busybox.net>; Thu, 11 Apr 2024 04:25:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ePaIA-7DlQag for <buildroot@lists.busybox.net>;
 Thu, 11 Apr 2024 04:25:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 0C45660768
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0C45660768
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0C45660768
 for <buildroot@buildroot.org>; Thu, 11 Apr 2024 04:24:59 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id DCFD213F81D;
 Thu, 11 Apr 2024 06:24:53 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Thu, 11 Apr 2024 06:24:53 +0200
Date: Thu, 11 Apr 2024 06:24:53 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Romain Naour <romain.naour@smile.fr>
Message-ID: <ZhdmFahD0sO9VANK@landeda>
References: <20240410221448.88466-1-romain.naour@smile.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240410221448.88466-1-romain.naour@smile.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1712809496;
 bh=rjSJpmWxucmgilwW0d7bsApAmHdfTxGSyXd+pFvyOT4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=WsHb+wClXbBM/VfJbugOBp787lahAwzHGMF9biV3yI51BjKkM9+GiJGk2YpfxiXsQ
 Odh1KoSpFFWEe1lVtCb0MpLSv+o2R4aSrau+b3lQEct2tVoG3R+wX5oVhnzY5idPrE
 40YwKJtRdy3aoOtEFK8k3vjWgicJCxPH4dqd9P3jgcwlfcQcNhwAu+Vffr/fMCpb0K
 +zEGjQ68Uelj9Zy5CRtjnfzRk6ESocAZnfXFXZFeQeV6C36v/7asx5qPuA8aDmDO0J
 ZSZWyJWlxP/TtVl34mk1paj9ZHOluCjZJNlY58ibfzVkFZxJMiIltOC8t8q7I6c1Ug
 9PqLQcMVdiV8Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=WsHb+wCl
Subject: Re: [Buildroot] [PATCH] support/testing: regenerate
 .checkpackageignore used in TestCheckPackage
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

Romain, All,

On 2024-04-11 00:14 +0200, Romain Naour spake thusly:
> Commit ccb4e5db5c ("utils/check-package: emit library name along with check function name")
> updated the .checkpackageignore format but forgot to update
> .checkpackageignore files used in TestCheckPackage.

Gah! Thanks for fixing my mess!

> Keep .checkpackageignore_outdated as is since it must be outdated.
> 
> Fixes:
> https://gitlab.com/buildroot.org/buildroot/-/jobs/6568786785
> 
> Cc: Yann E. MORIN <yann.morin.1998@free.fr>
> Signed-off-by: Romain Naour <romain.naour@smile.fr>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  support/testing/tests/utils/br2-external/.checkpackageignore    | 2 +-
>  .../tests/utils/br2-external/package/.checkpackageignore        | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/support/testing/tests/utils/br2-external/.checkpackageignore b/support/testing/tests/utils/br2-external/.checkpackageignore
> index efb7680173..2a29916d08 100644
> --- a/support/testing/tests/utils/br2-external/.checkpackageignore
> +++ b/support/testing/tests/utils/br2-external/.checkpackageignore
> @@ -1 +1 @@
> -package/external/external.mk PackageHeader
> +package/external/external.mk lib_mk.PackageHeader
> diff --git a/support/testing/tests/utils/br2-external/package/.checkpackageignore b/support/testing/tests/utils/br2-external/package/.checkpackageignore
> index 5f4a5e1187..a9368d1c1c 100644
> --- a/support/testing/tests/utils/br2-external/package/.checkpackageignore
> +++ b/support/testing/tests/utils/br2-external/package/.checkpackageignore
> @@ -1 +1 @@
> -external/external.mk PackageHeader
> +external/external.mk lib_mk.PackageHeader
> -- 
> 2.44.0
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
