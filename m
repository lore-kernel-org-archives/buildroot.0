Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CF70E77183
	for <buildroot@archiver.kernel.org>; Sun, 15 Dec 2024 17:45:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B9FEC607AC;
	Sun, 15 Dec 2024 17:45:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Q0smTaOzAQ5C; Sun, 15 Dec 2024 17:45:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C0D75607B1
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C0D75607B1;
	Sun, 15 Dec 2024 17:45:50 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 174E9CE
 for <buildroot@buildroot.org>; Sun, 15 Dec 2024 17:45:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EC03081F01
 for <buildroot@buildroot.org>; Sun, 15 Dec 2024 17:45:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SGLKS6zdpVvP for <buildroot@buildroot.org>;
 Sun, 15 Dec 2024 17:45:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 0504C81EEA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0504C81EEA
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0504C81EEA
 for <buildroot@buildroot.org>; Sun, 15 Dec 2024 17:45:48 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 5468713F88F;
 Sun, 15 Dec 2024 18:45:46 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:58092])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 15 Dec 2024 18:45:46 +0100
MIME-Version: 1.0
Date: Sun, 15 Dec 2024 18:45:46 +0100
From: Julien Olivain <ju.o@free.fr>
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20241214204315.2666159-1-bernd@kuhls.net>
References: <20241214204315.2666159-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.9
Message-ID: <4254993cab9a9fd04702699d43b7ffcb@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1734284747;
 bh=9N/1R5gyN0650p8BJP5LtLZa8/OgAR+cs+GHKwzjHyY=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=njhBvKfQx/S6jd8wyQs3YlbSuMvK2wp2MDABmdaSZFHxJnPYxj5zfJPudMMJgPcNr
 5TwFSv5xCZUZJmOmNHVisHpgspVpVyfnYBEfwIyxixz1yAk5Wicl5/jXs/xzdAelyT
 IW1xvpm51hLXeOGdb/PXIkyKvqd5hJS7cJD1OlSq57wwc/9xl59XFUjlChBEKtCphG
 o9UxvwjdlZCW3kKVYqCocXAIc0y3TCYi8tABNsw35MQqBy6N37DHkGPFkDaMshx4I0
 pTuKQwYnF0KhLTFRsatvIUh/VVPdWzNMxqRDiartyA8yL2Sgm4nAUObKvE9/Q9BPZo
 Duybrd1CJxNEg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=njhBvKfQ
Subject: Re: [Buildroot] [PATCH 1/1] package/kodi-pvr-waipu: bump version to
 21.8.8-Omega
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

On 14/12/2024 21:43, Bernd Kuhls wrote:
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.

> ---
>  package/kodi-pvr-waipu/kodi-pvr-waipu.hash | 2 +-
>  package/kodi-pvr-waipu/kodi-pvr-waipu.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/kodi-pvr-waipu/kodi-pvr-waipu.hash 
> b/package/kodi-pvr-waipu/kodi-pvr-waipu.hash
> index 2214674bf2..90b599e452 100644
> --- a/package/kodi-pvr-waipu/kodi-pvr-waipu.hash
> +++ b/package/kodi-pvr-waipu/kodi-pvr-waipu.hash
> @@ -1,3 +1,3 @@
>  # Locally computed
> -sha256  
> 1fd3a101f09c471deaa83ac5b673be71df97957060e4aedb4d7a890e355608f2  
> kodi-pvr-waipu-21.8.7-Omega.tar.gz
> +sha256  
> 200c78d7ccde19046274549c1a59d1f1dc0763b73bb38f50f714e7a0627cb8d3  
> kodi-pvr-waipu-21.8.8-Omega.tar.gz
>  sha256  
> 4202d4fb329f58c83ba921b56d7071e37f7df3f15b3820a3a04ef8eee49f54d2  
> pvr.waipu/LICENSE.txt
> diff --git a/package/kodi-pvr-waipu/kodi-pvr-waipu.mk 
> b/package/kodi-pvr-waipu/kodi-pvr-waipu.mk
> index 97a830115e..edf7892dfa 100644
> --- a/package/kodi-pvr-waipu/kodi-pvr-waipu.mk
> +++ b/package/kodi-pvr-waipu/kodi-pvr-waipu.mk
> @@ -4,7 +4,7 @@
>  #
>  
> ################################################################################
> 
> -KODI_PVR_WAIPU_VERSION = 21.8.7-Omega
> +KODI_PVR_WAIPU_VERSION = 21.8.8-Omega
>  KODI_PVR_WAIPU_SITE = $(call 
> github,flubshi,pvr.waipu,$(KODI_PVR_WAIPU_VERSION))
>  KODI_PVR_WAIPU_LICENSE = GPL-2.0+
>  KODI_PVR_WAIPU_LICENSE_FILES = pvr.waipu/LICENSE.txt
> --
> 2.39.5
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
