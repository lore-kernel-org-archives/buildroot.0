Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48C36E7717F
	for <buildroot@archiver.kernel.org>; Mon, 16 Dec 2024 22:02:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 08B1F407D8;
	Mon, 16 Dec 2024 22:02:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tvE33ckOhkix; Mon, 16 Dec 2024 22:02:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D9CBC407D0
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D9CBC407D0;
	Mon, 16 Dec 2024 22:02:07 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 232C8C5
 for <buildroot@buildroot.org>; Mon, 16 Dec 2024 22:02:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 10B6C60E07
 for <buildroot@buildroot.org>; Mon, 16 Dec 2024 22:02:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JX54vOX8kCRq for <buildroot@buildroot.org>;
 Mon, 16 Dec 2024 22:02:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::15;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 0694760B42
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0694760B42
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0694760B42
 for <buildroot@buildroot.org>; Mon, 16 Dec 2024 22:02:04 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id CE4A778032A;
 Mon, 16 Dec 2024 23:01:59 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:53734])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 16 Dec 2024 23:01:58 +0100
MIME-Version: 1.0
Date: Mon, 16 Dec 2024 23:01:58 +0100
From: Julien Olivain <ju.o@free.fr>
To: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
Cc: buildroot@buildroot.org, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, =?UTF-8?Q?Miqu=C3=A8l_Raynal?=
 <miquel.raynal@bootlin.com>
In-Reply-To: <20241216-fix_quickjs_prefix-v1-1-88ed52e67b76@bootlin.com>
References: <20241216-fix_quickjs_prefix-v1-1-88ed52e67b76@bootlin.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <791bca297695863309f2a7eeb6362018@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1734386523;
 bh=6/Q09KqvvaZ4Wx8lHW7RDss7rNHO+CPpIU1BJIrz2iI=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=CS6gMotf/Zosqpc9XBOY00XsZf62AiFDUAMuSLbf83zwgKCmbYIy+xxUAaL1plp+u
 EJWEFhIBRvgNneQwABOt/FC0dLKDXONc7Mnq20wEPbWpueINv7ad5sKCqb7JHVcDpa
 1uhrGt6eRCsqlurUMpzj8eoDIIrJ1oEq6vsK3b1XcQwv3aSb409UORVhV2Dt3kBDRz
 wsO6rWvFNpID2u/IGCYaEkR2rrZJkUQDZjeNhPqUUzY/wokAeFEoxGmdUu4no2prKD
 e+Uz5y7I2m8l6cDiREebrkggJJ8Bqgx2S4Hg60eR4VBRRzIOoNULD2ZRjsLtQJg28q
 K/1vRregy6sbw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=CS6gMotf
Subject: Re: [Buildroot] [PATCH] package/quickjs: fix typo in prefix
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

On 16/12/2024 22:30, Thomas Bonnefille wrote:
> The quickjs Makefile expects the variable PREFIX to be set [1] but
> prefix is set instead.
> Without this parameter quickjs is installed to /usr/local by default 
> [2]
> instead of /usr as requested.
> This commit fixed this error.
> 
> [1]: https://github.com/bellard/quickjs/blob/master/Makefile#L383
> [2]: https://github.com/bellard/quickjs/blob/master/Makefile#L43
> 
> Signed-off-by: Thomas Bonnefille <thomas.bonnefille@bootlin.com>

Applied to master, thanks.

> ---
>  package/quickjs/quickjs.mk | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/quickjs/quickjs.mk b/package/quickjs/quickjs.mk
> index 
> e745923b87bff3cdeb2f872264be5e65466020cf..2bd9da1392cb853e57492253c6202a65187fb81e 
> 100644
> --- a/package/quickjs/quickjs.mk
> +++ b/package/quickjs/quickjs.mk
> @@ -29,7 +29,7 @@ define QUICKJS_INSTALL_STAGING_CMDS
>  		EXTRA_LIBS="$(QUICKJS_EXTRA_LIBS)" \
>  		DESTDIR=$(STAGING_DIR) \
>  		STRIP=/bin/true \
> -		prefix=/usr \
> +		PREFIX=/usr \
>  		install
>  endef
> 
> @@ -39,7 +39,7 @@ define QUICKJS_INSTALL_TARGET_CMDS
>  		EXTRA_LIBS="$(QUICKJS_EXTRA_LIBS)" \
>  		DESTDIR=$(TARGET_DIR) \
>  		STRIP=/bin/true \
> -		prefix=/usr \
> +		PREFIX=/usr \
>  		install
>  endef
> 
> 
> ---
> base-commit: ed9da089449c53519be02204f97c3452abba5cc3
> change-id: 20241211-fix_quickjs_prefix-28a1837f0d65
> 
> Best regards,
> --
> Thomas Bonnefille <thomas.bonnefille@bootlin.com>
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
