Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0B2BE7718B
	for <buildroot@archiver.kernel.org>; Mon, 23 Dec 2024 18:18:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A3B9F606B6;
	Mon, 23 Dec 2024 18:18:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sQi3RMIG1Dmt; Mon, 23 Dec 2024 18:18:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B22E9606BD
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B22E9606BD;
	Mon, 23 Dec 2024 18:18:09 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id E254FD3
 for <buildroot@buildroot.org>; Mon, 23 Dec 2024 18:18:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C15F6606C8
 for <buildroot@buildroot.org>; Mon, 23 Dec 2024 18:18:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bdTi4-g1h-6X for <buildroot@buildroot.org>;
 Mon, 23 Dec 2024 18:18:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 5026C606B6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5026C606B6
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5026C606B6
 for <buildroot@buildroot.org>; Mon, 23 Dec 2024 18:18:05 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 9F2A160134;
 Mon, 23 Dec 2024 19:18:01 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:54118])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 23 Dec 2024 19:18:01 +0100
MIME-Version: 1.0
Date: Mon, 23 Dec 2024 19:18:01 +0100
From: Julien Olivain <ju.o@free.fr>
To: Marcin Niestroj <m.niestroj@grinn-global.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20241223135927.2268815-1-m.niestroj@grinn-global.com>
References: <20241223135927.2268815-1-m.niestroj@grinn-global.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <09b1e5d20c5e3ab4b3769a509dc35db3@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1734977882;
 bh=/bXz1I/j61PJEowQmHMP7LuuCyq0g7m1LDa33rY72iA=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=tPYfVq/eqOE4vUCKRtQsL/iZpGkjahrUn5CNqGGdhuNUf4iGJ64vMNFxuxXRLXtn8
 x45BLKSwYbnAZrsCaVWwhrf7oVPIssSwoHWs+z9RBOqaAOKlzmMEJE9yXQSo/63Ju0
 eTqg0ZzfJCfeLkGNDPOGYqV9VJk49NxswaOrsT82lwyGmVcx9OHv6/bSpyldkOdTzY
 ueGmfVHXUeb27wBGad1bWuccye2qeH61TA+KDXwKrgFp5xa6R8HjlOFRC/m0J5THNA
 iiYAxyQ5blbSyqpUsmW3RJI42TrEjeWUhsj4XTgKQdE0SY53qg6fPOwPEbvTo9qpkH
 fOohei4XPBXHg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=tPYfVq/e
Subject: Re: [Buildroot] [PATCH] package/dt-utils: bump to 2023.11.0
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

On 23/12/2024 14:59, Marcin Niestroj wrote:
> Signed-off-by: Marcin Niestroj <m.niestroj@grinn-global.com>

Applied to master, thanks.

> ---
>  package/dt-utils/dt-utils.hash | 2 +-
>  package/dt-utils/dt-utils.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/dt-utils/dt-utils.hash 
> b/package/dt-utils/dt-utils.hash
> index c57145b835..af964606fe 100644
> --- a/package/dt-utils/dt-utils.hash
> +++ b/package/dt-utils/dt-utils.hash
> @@ -1,5 +1,5 @@
>  # Locally computed
> -sha256  
> a6988b889418737324ed3db3785d3a9692e802c1dff4a2323c962008b7b646b1  
> dt-utils-2023.08.0.tar.xz
> +sha256  
> 5a1ace759b37c4b5138738ae0fa03574b1f55da01a0faa88aaff0417d275cc0e  
> dt-utils-2023.11.0.tar.xz
>  sha256  
> a2010f343487d3f7618affe54f789f5487602331c0a8d03f49e9a7c547cf0499  
> LICENSES/CC0-1.0.txt
>  sha256  
> 2c9d733cadb50e33cc83f05f1fe7cc4b6c5ff7260fd9eea1b839151c7fa64742  
> LICENSES/GPL-2.0-only.txt
>  sha256  
> d6e37cb7eff6ef15ae3c4082cf40eae80a94cd59b636991d1149d4a5c9dc3537  
> LICENSES/GPL-2.0-or-later.txt
> diff --git a/package/dt-utils/dt-utils.mk 
> b/package/dt-utils/dt-utils.mk
> index 198b36d5fe..7b197c585a 100644
> --- a/package/dt-utils/dt-utils.mk
> +++ b/package/dt-utils/dt-utils.mk
> @@ -4,7 +4,7 @@
>  #
>  
> ################################################################################
> 
> -DT_UTILS_VERSION = 2023.08.0
> +DT_UTILS_VERSION = 2023.11.0
>  DT_UTILS_SOURCE = dt-utils-$(DT_UTILS_VERSION).tar.xz
>  DT_UTILS_SITE = 
> https://git.pengutronix.de/cgit/tools/dt-utils/snapshot
>  DT_UTILS_LICENSE = CC0-1.0, GPL-2.0, GPL-2.0+, Zlib
> --
> 2.47.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
