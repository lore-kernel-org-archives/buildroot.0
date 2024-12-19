Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 989A8E77184
	for <buildroot@archiver.kernel.org>; Thu, 19 Dec 2024 23:36:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 55460813A2;
	Thu, 19 Dec 2024 23:36:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dIzzmezfTLk9; Thu, 19 Dec 2024 23:36:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6B134813A6
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6B134813A6;
	Thu, 19 Dec 2024 23:36:58 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 08E456C
 for <buildroot@buildroot.org>; Thu, 19 Dec 2024 23:36:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DC3DF40526
 for <buildroot@buildroot.org>; Thu, 19 Dec 2024 23:36:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7U7VMf3Z8GYK for <buildroot@buildroot.org>;
 Thu, 19 Dec 2024 23:36:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org CB46A404A5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CB46A404A5
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CB46A404A5
 for <buildroot@buildroot.org>; Thu, 19 Dec 2024 23:36:55 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id B3B7113F88E;
 Fri, 20 Dec 2024 00:36:52 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:51528])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 20 Dec 2024 00:36:52 +0100
MIME-Version: 1.0
Date: Fri, 20 Dec 2024 00:36:52 +0100
From: Julien Olivain <ju.o@free.fr>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20241219224713.989560-1-james.hilliard1@gmail.com>
References: <20241219224713.989560-1-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <b8ccf74c096b60612741d7fffbce2327@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1734651413;
 bh=cz5V1KO/FlTZCdrpAa8M3wMwHc1MtqJGufbl3fYRRrw=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Anfw/zirJlK49TGFRJQ5JVgnu9EU3ls9W3Bve6Fgr41Bk3ID0A+W/xYd9qf2CTc4K
 EUL4LhwiRCca7miDveutKzLoN+fN9E2BdVIApresP2CeXTQhJx1a+BdGK1YL++TCJA
 aHGOauujobXuxclfJHoh3d/hod0F2K6v+yGJ4OZCemQSfxreGTvjOxu+KdCn48sAKZ
 /5rxcW5ZFh+jbxfNjzEij7tD45Ej3Tyanc1kkYMP4QDqG+qy62jV+S0k4L0W7ikI+X
 RmhdjJUHjap6vd6qBvAN+zGQG96r8iipaiCeCeXBKBmLQ9D5vC8SUmuz71TQcgFw1R
 Q+StDjnZwMXFA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Anfw/zir
Subject: Re: [Buildroot] [PATCH 1/1] package/cloudflared: bump to version
 2024.12.2
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

On 19/12/2024 23:47, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.

> ---
>  package/cloudflared/cloudflared.hash | 2 +-
>  package/cloudflared/cloudflared.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/cloudflared/cloudflared.hash 
> b/package/cloudflared/cloudflared.hash
> index e924d12481..3d02b78b6f 100644
> --- a/package/cloudflared/cloudflared.hash
> +++ b/package/cloudflared/cloudflared.hash
> @@ -1,3 +1,3 @@
>  # Locally computed
> -sha256  
> f96b703ea848bc538322eb957749b0b2395e0cf83213cf310cbde0a3f598eac4  
> cloudflared-2024.9.1-go2.tar.gz
> +sha256  
> 48b9c54d79419d0489baadb8cb54d5196e0ff17650fb9eff81de02989fa8b009  
> cloudflared-2024.12.2-go2.tar.gz
>  sha256  
> 58d1e17ffe5109a7ae296caafcadfdbe6a7d176f0bc4ab01e12a689b0499d8bd  
> LICENSE
> diff --git a/package/cloudflared/cloudflared.mk 
> b/package/cloudflared/cloudflared.mk
> index 68849e9b82..78b46f9d0e 100644
> --- a/package/cloudflared/cloudflared.mk
> +++ b/package/cloudflared/cloudflared.mk
> @@ -4,7 +4,7 @@
>  #
>  
> ################################################################################
> 
> -CLOUDFLARED_VERSION = 2024.9.1
> +CLOUDFLARED_VERSION = 2024.12.2
>  CLOUDFLARED_SITE = $(call 
> github,cloudflare,cloudflared,$(CLOUDFLARED_VERSION))
>  CLOUDFLARED_LICENSE = Apache-2.0
>  CLOUDFLARED_LICENSE_FILES = LICENSE
> --
> 2.34.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
