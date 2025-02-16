Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABAB4C02198
	for <buildroot@archiver.kernel.org>; Sun, 16 Feb 2025 14:13:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 714D0412CF;
	Sun, 16 Feb 2025 14:13:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id v8NAirjj1Lyy; Sun, 16 Feb 2025 14:13:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4C96B412F8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4C96B412F8;
	Sun, 16 Feb 2025 14:13:11 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 91EF5DE
 for <buildroot@buildroot.org>; Sun, 16 Feb 2025 14:13:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8103760B49
 for <buildroot@buildroot.org>; Sun, 16 Feb 2025 14:13:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8eHzxFOe4vjC for <buildroot@buildroot.org>;
 Sun, 16 Feb 2025 14:13:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org ACF8260B38
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ACF8260B38
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp3.osuosl.org (Postfix) with ESMTPS id ACF8260B38
 for <buildroot@buildroot.org>; Sun, 16 Feb 2025 14:13:08 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id A3439B0054E;
 Sun, 16 Feb 2025 15:13:04 +0100 (CET)
Received: from 2a01:e0a:485:b220:8213:2270:4a8d:a1d5
 via 2a01:e0a:485:b220:8213:2270:4a8d:a1d5 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 16 Feb 2025 15:13:04 +0100
MIME-Version: 1.0
Date: Sun, 16 Feb 2025 15:13:04 +0100
From: Julien Olivain <ju.o@free.fr>
To: Peter Thompson <peter.macleod.thompson@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20250213081956.24293-1-peter.macleod.thompson@gmail.com>
References: <20250213081956.24293-1-peter.macleod.thompson@gmail.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <9a63c2adfccc87e6c0b427b21ac7934e@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1739715185;
 bh=y7XprMNCHcv8KaKkvzFjBnxr3iHyFgtRO5NY0nVbAgw=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=frkzyv1oIXObWy0dTydXUic7edMMDFDWutwssYBye4Up7c8yCw2fLy8LE5lljgcs7
 mCTSAOlH95zNdoWdUAkx+ATtAb5jahPTVYT6Va329Aj4c6d8IpsyKcgVr9ha76H+CZ
 Nk/HEXmgxlQDoc1qB3+PDiMwxlzdPCZP2XMe9hbWTRU+/DqD6SQhQ7WgT2U5xub3oa
 mKWA1IGP1UVevuH0XnZCj9mpdSkAiu0xYnDscjggRSaguhWKgXfPpMoyvYcNjK7X2j
 IrynP28/n135R7z0eOPX08p7cq++8ztuAOY7fFxGHwwUhrj9YhG72LV7eVm16vuVzv
 E4Yyf8uWQO0ug==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=frkzyv1o
Subject: Re: [Buildroot] [PATCH 1/2] package/sdl2_ttf: bump version to 2.24.0
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

On 13/02/2025 09:19, Peter Thompson wrote:
> From: Peter Macleod Thompson <peter.macleod.thompson@gmail.com>
> 
> Signed-off-by: Peter Macleod Thompson 
> <peter.macleod.thompson@gmail.com>

Series applied to master, thanks.

I added links to release notes in commit logs. See:
https://gitlab.com/buildroot.org/buildroot/-/commit/9f5ef2d8727499b9b92bfd24735e6d6b5a07bd18
https://gitlab.com/buildroot.org/buildroot/-/commit/678ad7d69d1b9757433d2235e8d2856961d904d1

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
