Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46A2AC4345F
	for <buildroot@archiver.kernel.org>; Mon, 29 Apr 2024 12:02:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E638360799;
	Mon, 29 Apr 2024 12:02:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VSsqjz7OxyJx; Mon, 29 Apr 2024 12:02:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 19DF9607A4
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 19DF9607A4;
	Mon, 29 Apr 2024 12:02:48 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 5156F1BF8B4
 for <buildroot@lists.busybox.net>; Mon, 29 Apr 2024 12:02:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4A99B60799
 for <buildroot@lists.busybox.net>; Mon, 29 Apr 2024 12:02:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EeDA0lqcKbBx for <buildroot@lists.busybox.net>;
 Mon, 29 Apr 2024 12:02:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 128EB607A8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 128EB607A8
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 128EB607A8
 for <buildroot@buildroot.org>; Mon, 29 Apr 2024 12:02:41 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 520DC13F846;
 Mon, 29 Apr 2024 14:02:35 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 29 Apr 2024 14:02:34 +0200
Date: Mon, 29 Apr 2024 14:02:34 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Peter Korsgaard <peter@korsgaard.com>
Message-ID: <Zi-MWtd0pBrwWReA@landeda>
References: <20240428170101.1543928-1-peter@korsgaard.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240428170101.1543928-1-peter@korsgaard.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1714392158;
 bh=KlKcvH2Q0whDSKyEOahe4EBEmRATTRTjylRHWVSdzy0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=J5AF/44Y9XwuQgZFey8u474GluUHCVcC02ueRR//yCbjpY+LGbgdEuAzd7xjfQiRs
 luMFdJltNxn+CGdAHlyosYPIa0/pr0CX8DoN/GGHiun0xnDLtycfTAKWxHl2aM/NDw
 uB1RnS4JmYbZd7lP5qbLlj3ABcvqYfXZ5vcJDNJDMBkVTNh9Mv2xi46yvoUqWSMDYP
 DzIHiRoKsImibhh3FdkjntVsz2gOUnwf4Zma7jyNkYRf2wtoA+NGDSGC5qpkqMZMgx
 Zv+XC9XblOhZTN4lXqbLZIPTfNvz/y9u6+sLdAIEaC0cPvfwZZ1oMt9w1OqP8PGSzO
 e2FQow4CO4CAw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=J5AF/44Y
Subject: Re: [Buildroot] [PATCH 1/2] package/docker-engine: security bump to
 version 26.0.2
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

On 2024-04-28 19:01 +0200, Peter Korsgaard spake thusly:
> Fixes the following security issues:
> 
> CVE-2024-32473: Ensure IPv6 is disabled on interfaces only allocated an IPv4
> address by the engine
> 
> https://github.com/moby/moby/security/advisories/GHSA-x84c-p2g9-rqv9
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Both applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/docker-engine/docker-engine.hash | 2 +-
>  package/docker-engine/docker-engine.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/docker-engine/docker-engine.hash b/package/docker-engine/docker-engine.hash
> index 5c76b99af3..91bc3d8df2 100644
> --- a/package/docker-engine/docker-engine.hash
> +++ b/package/docker-engine/docker-engine.hash
> @@ -1,3 +1,3 @@
>  # Locally calculated
> -sha256  fae1aabb63ed5cf6d302a5f4266ed092716b1cea9a974a9d61154ef31b03c302  docker-engine-26.0.0.tar.gz
> +sha256  f1cf6a2e69607daa0e2ae9b5be752dc269ab30dee16f5f2180f7ff7f29270606  docker-engine-26.0.2.tar.gz
>  sha256  7c87873291f289713ac5df48b1f2010eb6963752bbd6b530416ab99fc37914a8  LICENSE
> diff --git a/package/docker-engine/docker-engine.mk b/package/docker-engine/docker-engine.mk
> index 86106d3ccb..f8dc87050f 100644
> --- a/package/docker-engine/docker-engine.mk
> +++ b/package/docker-engine/docker-engine.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -DOCKER_ENGINE_VERSION = 26.0.0
> +DOCKER_ENGINE_VERSION = 26.0.2
>  DOCKER_ENGINE_SITE = $(call github,moby,moby,v$(DOCKER_ENGINE_VERSION))
>  
>  DOCKER_ENGINE_LICENSE = Apache-2.0
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
