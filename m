Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77C80E77183
	for <buildroot@archiver.kernel.org>; Mon, 16 Dec 2024 22:32:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0219C41427;
	Mon, 16 Dec 2024 22:32:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Te4WVCnFttxy; Mon, 16 Dec 2024 22:32:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C7B754142D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C7B754142D;
	Mon, 16 Dec 2024 22:32:09 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 9AFD9C5
 for <buildroot@buildroot.org>; Mon, 16 Dec 2024 22:32:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7C19A84448
 for <buildroot@buildroot.org>; Mon, 16 Dec 2024 22:32:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id c08MNxy_8RtY for <buildroot@buildroot.org>;
 Mon, 16 Dec 2024 22:32:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::11;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 75C1484444
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 75C1484444
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 75C1484444
 for <buildroot@busybox.net>; Mon, 16 Dec 2024 22:32:07 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 6A63B2003C3;
 Mon, 16 Dec 2024 23:32:04 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:41704])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 16 Dec 2024 23:32:04 +0100
MIME-Version: 1.0
Date: Mon, 16 Dec 2024 23:32:04 +0100
From: Julien Olivain <ju.o@free.fr>
To: Francois Perrad <francois.perrad@gadz.org>
Cc: buildroot@busybox.net
In-Reply-To: <20241216120128.1187670-1-francois.perrad@gadz.org>
References: <20241216120128.1187670-1-francois.perrad@gadz.org>
User-Agent: Webmail Free/1.6.9
Message-ID: <dca1d1be9d0819ee4cc2b8198b769701@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1734388325;
 bh=FQ98BdoZc9LOteKKoPfz4rPwDUijR5R43+g0T7nM2kM=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=ZM13se7IedulPfhuJ3C4/MMSiNgjfJWUyYmxo/6ZVr8bdARgY2WKDjNkQyadFovfC
 Mr+Vwzn3di97FPA47X61E+6CbnQDtIzf3E0V5U0uolPCjRFOPq3sdcA4U0mrHpYCP5
 csM+3w/lelUGPxSnYsgxnb9Mju9z5VLF2zR5JnbjyMfiwFuJqRWpPWeu9j16c02oPd
 7xJclj0FztLdrO9P0TYgDeeiOaHTOtJwrdUqhuj3aemqKIJC+n4/KhpHzlnUqpjDPv
 yjzmE+1yBN0Y5iNzpQeCQiQGqvok/Sk4croxx8y0y/I5L6bh8UQvMi2aOpGssUi067
 FDowBYa7gBpHg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=ZM13se7I
Subject: Re: [Buildroot] [PATCH] package/gnupg2: bump to version 2.4.7
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
>  package/gnupg2/gnupg2.hash | 4 ++--
>  package/gnupg2/gnupg2.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/gnupg2/gnupg2.hash b/package/gnupg2/gnupg2.hash
> index e16a3f491..6a34f2a1c 100644
> --- a/package/gnupg2/gnupg2.hash
> +++ b/package/gnupg2/gnupg2.hash
> @@ -1,5 +1,5 @@
>  # From https://www.gnupg.org/download/integrity_check.html
> -sha1  2d8aa2662c398d60f1f8e0bf46fd163eae703189  gnupg-2.4.6.tar.bz2
> -sha256  
> 95acfafda7004924a6f5c901677f15ac1bda2754511d973bb4523e8dd840e17a  
> gnupg-2.4.6.tar.bz2
> +sha1  2d510a1a7294f2f9ef3f2e280c93c3ad9b0cdb68  gnupg-2.4.7.tar.bz2
> +sha256  
> 7b24706e4da7e0e3b06ca068231027401f238102c41c909631349dcc3b85eb46  
> gnupg-2.4.7.tar.bz2
>  # Locally calculated
>  sha256  
> bc2d6664f6276fa0a72d57633b3ae68dc7dcb677b71018bf08c8e93e509f1357  
> COPYING
> diff --git a/package/gnupg2/gnupg2.mk b/package/gnupg2/gnupg2.mk
> index f1a8e9917..d98829ca8 100644
> --- a/package/gnupg2/gnupg2.mk
> +++ b/package/gnupg2/gnupg2.mk
> @@ -4,7 +4,7 @@
>  #
>  
> ################################################################################
> 
> -GNUPG2_VERSION = 2.4.6
> +GNUPG2_VERSION = 2.4.7
>  GNUPG2_SOURCE = gnupg-$(GNUPG2_VERSION).tar.bz2
>  GNUPG2_SITE = https://gnupg.org/ftp/gcrypt/gnupg
>  GNUPG2_LICENSE = GPL-3.0+
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
