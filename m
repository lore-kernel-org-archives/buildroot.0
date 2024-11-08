Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51C5BD64089
	for <buildroot@archiver.kernel.org>; Fri,  8 Nov 2024 21:03:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 17A296077B;
	Fri,  8 Nov 2024 21:03:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PjA_prg7kol3; Fri,  8 Nov 2024 21:03:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 03B2C60670
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 03B2C60670;
	Fri,  8 Nov 2024 21:03:48 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 0BEB6D8F
 for <buildroot@buildroot.org>; Fri,  8 Nov 2024 21:03:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D88464018A
 for <buildroot@buildroot.org>; Fri,  8 Nov 2024 21:03:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9Q6_Gf4y4ot3 for <buildroot@buildroot.org>;
 Fri,  8 Nov 2024 21:03:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.6;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 9BAE8401FE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9BAE8401FE
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9BAE8401FE
 for <buildroot@buildroot.org>; Fri,  8 Nov 2024 21:03:45 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id AC61E780502;
 Fri,  8 Nov 2024 22:03:42 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:58506])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 08 Nov 2024 22:03:42 +0100
MIME-Version: 1.0
Date: Fri, 08 Nov 2024 22:03:42 +0100
From: Julien Olivain <ju.o@free.fr>
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20241103160421.41155-1-bernd@kuhls.net>
References: <20241103160421.41155-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.9
Message-ID: <d2a1a58ea086c047ad97b5e72f71275f@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1731099823;
 bh=rDWwJzSqZlkoXRi7VZIsj7hSsYmQ+WphDs6QjWLr89M=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=YXzdAgAsglJi6SiXSbKRa5cqd169m2q+p7NVSapwhtdmlHSSZIh3TL5nSngNTnO1T
 gemeP2rmjie3C60SlIt2I4YEL55grdnO6d6PgM23o8YCSDukhAAyQlYji5ks5nC6Sw
 ATMiv0jqqAc+tsUnlNtQv7uKGAN5O6oRVnPD12/04CT9R6+IFRorFcILftlmR2F/8C
 cgA13nAhkwWsBt7IptZjEc/2U43Ad/xSvnDUC6fCaVeVHGYe0kxeMEddSwoL6iiP5Y
 gqDdPRKKb2tXUJtokpbURVPlbuqnAxGZTB3mIpu64VFAcfNhlW9Ps1/33qWQ/7Ttvd
 PKxJq+/6vw/Bg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=YXzdAgAs
Subject: Re: [Buildroot] [PATCH 1/1] package/xmrig: bump version to 6.22.2
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

On 03/11/2024 17:04, Bernd Kuhls wrote:
> Changelog: https://github.com/xmrig/xmrig/blob/master/CHANGELOG.md
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.

> ---
>  package/xmrig/xmrig.hash | 2 +-
>  package/xmrig/xmrig.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/xmrig/xmrig.hash b/package/xmrig/xmrig.hash
> index b9d3cc387c..aa6676507a 100644
> --- a/package/xmrig/xmrig.hash
> +++ b/package/xmrig/xmrig.hash
> @@ -1,3 +1,3 @@
>  # Locally calculated
> -sha256  
> 189e4bf604f8b569cd15894439a4ad0209b64184c8ccb5a2119a4f07c16da448  
> xmrig-6.22.1.tar.gz
> +sha256  
> 34759ca9c1b2486ecb7b6bc267c76a6f365d401b2b6de6d667e0a13ae30882a2  
> xmrig-6.22.2.tar.gz
>  sha256  
> 589ed823e9a84c56feb95ac58e7cf384626b9cbf4fda2a907bc36e103de1bad2  
> LICENSE
> diff --git a/package/xmrig/xmrig.mk b/package/xmrig/xmrig.mk
> index 83d9636643..75657407d7 100644
> --- a/package/xmrig/xmrig.mk
> +++ b/package/xmrig/xmrig.mk
> @@ -4,7 +4,7 @@
>  #
>  
> ################################################################################
> 
> -XMRIG_VERSION = 6.22.1
> +XMRIG_VERSION = 6.22.2
>  XMRIG_SITE = $(call github,xmrig,xmrig,v$(XMRIG_VERSION))
>  XMRIG_LICENSE = GPL-3.0+
>  XMRIG_LICENSE_FILES = LICENSE
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
