Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08AE8C25B78
	for <buildroot@archiver.kernel.org>; Tue,  4 Jun 2024 19:27:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C03A44068E;
	Tue,  4 Jun 2024 19:27:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id doQpR2Eei4BH; Tue,  4 Jun 2024 19:27:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6336740821
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6336740821;
	Tue,  4 Jun 2024 19:27:32 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 384911BF3E1
 for <buildroot@lists.busybox.net>; Tue,  4 Jun 2024 19:27:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3260A83192
 for <buildroot@lists.busybox.net>; Tue,  4 Jun 2024 19:27:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7tqIeWCB0f8e for <buildroot@lists.busybox.net>;
 Tue,  4 Jun 2024 19:27:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 01C678315C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 01C678315C
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 01C678315C
 for <buildroot@buildroot.org>; Tue,  4 Jun 2024 19:27:29 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 307D213F8C2;
 Tue,  4 Jun 2024 21:27:25 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Tue, 04 Jun 2024 21:27:24 +0200
Date: Tue, 4 Jun 2024 21:27:24 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Peter Korsgaard <peter@korsgaard.com>
Message-ID: <Zl9qnOs5xfssdEpJ@landeda>
References: <20240604182719.1588397-1-peter@korsgaard.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240604182719.1588397-1-peter@korsgaard.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1717529248;
 bh=1ivDoU16eZZClYVbLx/QyiP4qA7aDi0B7b97F6B7zYI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=IjJ53l6i7GKv9aYC7qxf6LnxeeaAJyaCX6Ln7XujFgozC/rudU0BDQkXLztaugmNY
 Kx5uQ5yjBoFx5udF5D0zdTS37MuBD8nWxSWmhrR5T8RVCCatFp0tyS2birz6nk11Yi
 ps3c/FyxgNU70Frn9arfcc9a2+jf3pTtK6ulMivNh6T4Po4Gma89oLq1vsBqEcsglU
 m3iOQtgU5iXs4098l3ks5JOR4QnU05e9CRdLhNsP3yyAwPC8+Wd+cCmazl+4/U5Dof
 v1189UzZ6btU78ME6W8S2TcUTPr8av7/YISC2th9Pu89rjg8K6yYIeZMOSsLWnREEg
 QvPILhCdLPsiQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=IjJ53l6i
Subject: Re: [Buildroot] [PATCH] package/docker-compose: correct vendored
 tarball hash
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
Cc: Christian Stewart <christian@aperture.us>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Peter, All,

On 2024-06-04 20:27 +0200, Peter Korsgaard spake thusly:
> Fixes: http://autobuild.buildroot.net/results/3a8/3a84e12ea7a88d1aefbc9e467416458d7bc6e7f5/
> 
> The vendored tarball hash was accidently created with tar < 1.35, leading to
> a wrong hash:
> 
> https://lore.kernel.org/buildroot/CA+h8R2qWatxGjtUnkNpETBBn6OUASgNXrK=vkOBWDbSzFCXPDw@mail.gmail.com/T/
> 
> Fix it by replacing it by the correct tar-1.35 hash.
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/docker-compose/docker-compose.hash | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/docker-compose/docker-compose.hash b/package/docker-compose/docker-compose.hash
> index 1fd454e3fa..12e839c71c 100644
> --- a/package/docker-compose/docker-compose.hash
> +++ b/package/docker-compose/docker-compose.hash
> @@ -1,3 +1,3 @@
>  # Locally computed
> -sha256  448eaf225c2984a2d78b4faa3fe74a4aa1e2bb791f90ac8d4970d3d046e638df  docker-compose-2.27.0-go2.tar.gz
> +sha256  42e9d2a33806656bd145ec742a3ba00b64acc3f88b500793d3b78319c39e25e0  docker-compose-2.27.0-go2.tar.gz
>  sha256  58d1e17ffe5109a7ae296caafcadfdbe6a7d176f0bc4ab01e12a689b0499d8bd  LICENSE
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
