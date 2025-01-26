Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94DAEC02181
	for <buildroot@archiver.kernel.org>; Sun, 26 Jan 2025 10:33:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4752960672;
	Sun, 26 Jan 2025 10:33:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dUOb60uwI1bs; Sun, 26 Jan 2025 10:33:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 59EB060715
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 59EB060715;
	Sun, 26 Jan 2025 10:33:13 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 2A63194A
 for <buildroot@buildroot.org>; Sun, 26 Jan 2025 10:33:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 251DE405B3
 for <buildroot@buildroot.org>; Sun, 26 Jan 2025 10:33:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id E8PkTDUYg3rB for <buildroot@buildroot.org>;
 Sun, 26 Jan 2025 10:33:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.4;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 294E1405A3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 294E1405A3
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 294E1405A3
 for <buildroot@buildroot.org>; Sun, 26 Jan 2025 10:33:11 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 7D61E19F5A7;
 Sun, 26 Jan 2025 11:33:07 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:51870])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 26 Jan 2025 11:33:07 +0100
MIME-Version: 1.0
Date: Sun, 26 Jan 2025 11:33:07 +0100
From: Julien Olivain <ju.o@free.fr>
To: Peter Thompson <peter.macleod.thompson@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20250125211657.14994-1-peter.macleod.thompson@gmail.com>
References: <20250125211657.14994-1-peter.macleod.thompson@gmail.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <deb392c270c7b7940ea16d8bc7521302@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1737887588;
 bh=S57CgXrdHXgHbKCo9oKiiMYqgzkyQNyWZuI19HAVSh8=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=FLiGcra1WaYdUIw3N8qS65dWKRSy+MQECvF7gbfUN+mkJui/YpCmII45M0NiNmOl0
 vukxayG2wR3AejzJqJod9Q6PmWMTl/EXzWrH6AWmliIDYeLD8zvAfat6/n0wdftZH1
 tLpIjTAuTCb0RuBGkBIYDnjFI6OdS2TYK4iux8IgEU6aoXHPgV6JoOEceUrgECNAL7
 38WwD0gleUTcIvkGn+mQrSJsMo/P/uGjsW39YmTwXN+6NwQZflc3wyqOjQe8pmxcDo
 w74FYYcgswNg2D7ZXRNMKLjTCq7SN/YFMnHW2wS1mj2dxVrrFI5oWTYp2Ft532w6Ni
 1VfruYVqlTwLA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=FLiGcra1
Subject: Re: [Buildroot] [PATCH 1/1] package/sdl2_ttf: bump version to 2.24.0
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

Hi Peter,

Thank you for the patch.

On 25/01/2025 22:16, Peter Thompson wrote:
> From: Peter Macleod Thompson <peter.macleod.thompson@gmail.com>
> 
> Signed-off-by: Peter Macleod Thompson 
> <peter.macleod.thompson@gmail.com>
> ---
>  package/sdl2_ttf/sdl2_ttf.hash | 4 ++--
>  package/sdl2_ttf/sdl2_ttf.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/sdl2_ttf/sdl2_ttf.hash 
> b/package/sdl2_ttf/sdl2_ttf.hash
> index 7693aeba6b..452dc82dbe 100644
> --- a/package/sdl2_ttf/sdl2_ttf.hash
> +++ b/package/sdl2_ttf/sdl2_ttf.hash
> @@ -1,3 +1,3 @@
>  # Locally calculated
> -sha256  
> d48cbd1ce475b9e178206bf3b72d56b66d84d44f64ac05803328396234d67723  
> SDL2_ttf-2.22.0.tar.gz
> -sha256  
> a0e8ce06504966e45088ee1cc7583cc8af9aac615d4cf56d47d847da9cb15139  
> LICENSE.txt
> +0b2bf1e7b6568adbdbc9bb924643f79d9dedafe061fa1ed687d1d9ac4e453bfd  
> SDL2_ttf-2.24.0.tar.gz
> +7826eca0a0f7e591f38dd844e207a200aac81a59b20d8a30c3af8c6282af13e6  
> SDL2_ttf-2.24.0/LICENSE.txt

The "sha256" hash type is missing here.

Can you send an updated patch please?

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
