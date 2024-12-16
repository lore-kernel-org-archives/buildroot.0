Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACDE0E7717F
	for <buildroot@archiver.kernel.org>; Mon, 16 Dec 2024 22:19:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 65D6F409E8;
	Mon, 16 Dec 2024 22:19:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Erq3kZYJpemU; Mon, 16 Dec 2024 22:19:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3F813409EF
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3F813409EF;
	Mon, 16 Dec 2024 22:19:43 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 831BBC5
 for <buildroot@buildroot.org>; Mon, 16 Dec 2024 22:19:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 63FC482002
 for <buildroot@buildroot.org>; Mon, 16 Dec 2024 22:19:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XLR-0tYx2s4z for <buildroot@buildroot.org>;
 Mon, 16 Dec 2024 22:19:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 8007C82036
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8007C82036
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8007C82036
 for <buildroot@busybox.net>; Mon, 16 Dec 2024 22:19:40 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 6B32FB0055A;
 Mon, 16 Dec 2024 23:19:36 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:53516])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 16 Dec 2024 23:19:36 +0100
MIME-Version: 1.0
Date: Mon, 16 Dec 2024 23:19:36 +0100
From: Julien Olivain <ju.o@free.fr>
To: Francois Perrad <francois.perrad@gadz.org>
Cc: buildroot@busybox.net
In-Reply-To: <20241216120137.1187698-1-francois.perrad@gadz.org>
References: <20241216120137.1187698-1-francois.perrad@gadz.org>
User-Agent: Webmail Free/1.6.9
Message-ID: <4e3e50b154fa953b84f065034d693f03@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1734387577;
 bh=MpKs2SpgIZIt/dlsMkJMg2rrNvUuCvy72ttn9NSwBdU=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=qf/NOG5cZBKaSqZvlEE9ktFwop/BbrI6hPHBwcy+SiJnBZ28WCiPqhXDM/WxH6ffr
 deR1wDr6Xab6hGZz8q6lf3HihRtcKCgeg+MHrWFT50kmydQxw2E/+uWeGAcsWd9ulL
 OqbMDRZZ1ATgDPiOhA4kCyLby/QN3xSQVBnpkuf27yb4+uqrWG1B8/FdAF6kNFVKJ/
 t+XlVBdU6ZZ5pKUDQw71wG1cOOXBMZblKblp7mqG98OruF6KLFV+xVVa9b3E/foC2b
 QflJE35Op7/4Z1T3DXeUcS6INEnxTouElYcUfik1vjUXbTWL+vgdR+BH2gWXmzbaMg
 Q947d82duZ/tg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=qf/NOG5c
Subject: Re: [Buildroot] [PATCH] package/open62541: bump to version 1.3.15
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

On 16/12/2024 13:01, Francois Perrad wrote:
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>

Applied to master, thanks.

> ---
>  package/open62541/open62541.hash | 2 +-
>  package/open62541/open62541.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/open62541/open62541.hash 
> b/package/open62541/open62541.hash
> index 01ea652f9..3beead1a2 100644
> --- a/package/open62541/open62541.hash
> +++ b/package/open62541/open62541.hash
> @@ -1,3 +1,3 @@
>  # Locally calculated
> -sha256  
> dab44ad50b10cc5f9e9e1f44f0510e0c5f7a8226c6bba821babafc5a79acdc2d  
> open62541-v1.3.12-git4.tar.gz
> +sha256  
> a8719f299505b144bd68bf557ad0b023fa28faf8862ff2d0b171381c8bd278c3  
> open62541-v1.3.15-git4.tar.gz
>  sha256  
> fab3dd6bdab226f1c08630b1dd917e11fcb4ec5e1e020e2c16f83a0a13863e85  
> LICENSE
> diff --git a/package/open62541/open62541.mk 
> b/package/open62541/open62541.mk
> index 92ce3b852..0d1abf724 100644
> --- a/package/open62541/open62541.mk
> +++ b/package/open62541/open62541.mk
> @@ -4,7 +4,7 @@
>  #
>  
> ################################################################################
> 
> -OPEN62541_VERSION = v1.3.12
> +OPEN62541_VERSION = v1.3.15
>  OPEN62541_SITE_METHOD = git
>  OPEN62541_SITE = https://github.com/open62541/open62541.git
>  OPEN62541_GIT_SUBMODULES = YES
> --
> 2.43.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
