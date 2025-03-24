Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12C33C36002
	for <buildroot@archiver.kernel.org>; Mon, 24 Mar 2025 20:18:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B64DF82043;
	Mon, 24 Mar 2025 20:18:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hk1wPnTUdOLD; Mon, 24 Mar 2025 20:18:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 03CA482071
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 03CA482071;
	Mon, 24 Mar 2025 20:18:29 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 8C85DC0
 for <buildroot@buildroot.org>; Mon, 24 Mar 2025 20:18:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 72C2340F92
 for <buildroot@buildroot.org>; Mon, 24 Mar 2025 20:18:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3xr4BhWVgQe3 for <buildroot@buildroot.org>;
 Mon, 24 Mar 2025 20:18:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org A29A840F8A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A29A840F8A
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A29A840F8A
 for <buildroot@buildroot.org>; Mon, 24 Mar 2025 20:18:26 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 70637B00572;
 Mon, 24 Mar 2025 21:18:23 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:33426])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 24 Mar 2025 21:18:23 +0100
MIME-Version: 1.0
Date: Mon, 24 Mar 2025 21:18:23 +0100
From: Julien Olivain <ju.o@free.fr>
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20250323190538.3336153-1-bernd@kuhls.net>
References: <20250323190538.3336153-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.10
Message-ID: <50ac3ac2680f5f9be9f62eba3e447b9b@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1742847504;
 bh=BNu4D+WctrHAt5U+hY9Fgt0thtc8jfDqChifhc4M000=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=aOcMRFvji9NCPfGq7FZEt7hk+/5pQ385M3+3OtJNQGkCTixONnCH7H8KQh1OCn7QF
 T2u2uuVZcVTmjxUzRA1h9iCogsb4ePNWlstBVUFLRXhKg0xg1wv6UC8Lv5gIpnW6W6
 SivK2DCFH1ge4/FcS6F/8Wz9E6JZ+8QNLCeygFYj95/4Oz4N20gKftB5ZBlNtWKW1C
 My56gBPPQ7uumcp1/WInnvBUklMhffxkDeRDJ8236mJaOL2/AaYRaEDoNLXwmOl/1S
 ZfsW03vWWnpvdZZGSrGtGZfmudNEEOvSw19qX3hXzOFPOXjTM40YiCf1Cs6l4KCLrs
 44+lOo8EGUwnA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=aOcMRFvj
Subject: Re: [Buildroot] [PATCH] package/ccache: bump version to 4.11.2
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

On 23/03/2025 20:05, Bernd Kuhls wrote:
> Updated license hash due to copyright year and version bumps:
> https://github.com/ccache/ccache/commits/v4.11.2/LICENSE.adoc
> 
> Follow upstream rename of Config.cpp to config.cpp:
> https://github.com/ccache/ccache/commit/d805b66b0f1ffdfc7035537fbca677d7463d2782
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
