Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00159C369CB
	for <buildroot@archiver.kernel.org>; Wed, 23 Apr 2025 18:44:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9F93261035;
	Wed, 23 Apr 2025 18:44:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rBNmzFLRHI5S; Wed, 23 Apr 2025 18:44:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C2C8D61294
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C2C8D61294;
	Wed, 23 Apr 2025 18:44:55 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id E557F19F
 for <buildroot@buildroot.org>; Wed, 23 Apr 2025 18:44:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CB9AA412A0
 for <buildroot@buildroot.org>; Wed, 23 Apr 2025 18:44:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QMTUffaocH-m for <buildroot@buildroot.org>;
 Wed, 23 Apr 2025 18:44:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::13;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org E94824125E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E94824125E
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E94824125E
 for <buildroot@buildroot.org>; Wed, 23 Apr 2025 18:44:52 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 040D619F5BA;
 Wed, 23 Apr 2025 20:44:49 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Wed, 23 Apr 2025 20:44:49 +0200
MIME-Version: 1.0
Date: Wed, 23 Apr 2025 20:44:49 +0200
From: Julien Olivain <ju.o@free.fr>
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20250423142203.2815631-1-giulio.benetti@benettiengineering.com>
References: <20250423142203.2815631-1-giulio.benetti@benettiengineering.com>
User-Agent: Webmail Free/1.6.10
Message-ID: <088ada766f0080306b25ccbb075e988a@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1745433891;
 bh=OiULRG2Im3WqpBaaAW5L9RHkHGHO7Bk8uYszHnOgix0=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=MAa3tQgklH//tBBOnsG6ygNKJ7wn1BWQnEcgfzqK5bq/sxsfy8/FWRGd2a1BLvORQ
 RB4ARHBz41GCvews+EQcsE+Ld9IiyMlU4t1Vtb4qYeIccxZLqX6FdiQgMHXFY8dgTZ
 ipK4T4qxU/XxBzHpCDfyvxX9hyX2oeZqY3I8EEOltbmYhgQ/SF4rcTbcLdVAzH3Gat
 MATYB9XBHneVGhMPsnD4TDRrUrV6pQ4v03LuAwEAZjWA5YUV7aeEKVuZdBrU/6ZhGX
 m1ojeF7eeILDx3RyPPghcZVyboBJzETlMps49w1TmNlATqSecidpAzU7qLnOSsCn+l
 2iE8QwCZ58vCg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=MAa3tQgk
Subject: Re: [Buildroot] [PATCH] package/harfbuzz: bump to version 11.1.0
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

On 23/04/2025 16:22, Giulio Benetti wrote:
> Release notes:
> https://github.com/harfbuzz/harfbuzz/releases/tag/11.1.0
> 
> Since the major release changed all the packages that have direct
> dependency to harfbuzz have been successfully built:
> - efl
> - libass
> - mupdf
> - pango
> - qt5base
> - qt5webengine
> - qt6base
> - sdl2_ttf
> - supertuxkart
> - vlc
> - webkitgtk
> - wpewebkit
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
