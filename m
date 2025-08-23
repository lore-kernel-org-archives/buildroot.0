Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 470DCCA0EED
	for <buildroot@archiver.kernel.org>; Sat, 23 Aug 2025 16:38:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F016883D77;
	Sat, 23 Aug 2025 16:38:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id It7c9SSK73pF; Sat, 23 Aug 2025 16:38:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3BFC783D71
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3BFC783D71;
	Sat, 23 Aug 2025 16:38:01 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id EABC971E
 for <buildroot@buildroot.org>; Sat, 23 Aug 2025 16:37:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D03C383D77
 for <buildroot@buildroot.org>; Sat, 23 Aug 2025 16:37:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1mu9Wc6SzTl9 for <buildroot@buildroot.org>;
 Sat, 23 Aug 2025 16:37:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org EBE5C83D71
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EBE5C83D71
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EBE5C83D71
 for <buildroot@buildroot.org>; Sat, 23 Aug 2025 16:37:58 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 9207B60129;
 Sat, 23 Aug 2025 18:37:53 +0200 (CEST)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 23 Aug 2025 18:37:53 +0200
MIME-Version: 1.0
Date: Sat, 23 Aug 2025 18:37:53 +0200
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org, Alexander Varnin <fenixk19@mail.ru>
In-Reply-To: <20250819202922.3407686-1-thomas.petazzoni@bootlin.com>
References: <20250819202922.3407686-1-thomas.petazzoni@bootlin.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <9e3f28e87f7f00f161be6b3f0ef52f52@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1755967075;
 bh=t3ZASuUrRfAkMzJUSuprVd+OU3CHsjYdGSXoAByYk3U=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=T/bKu5W9qLTHEvBsN+Oh1K9nGNBCkl6efelyei0PZ9Xb4MrAugOygDr8BNAYv68fz
 S+0/Z3khY0Ec7mV6VDBri0cs6O5wCBKUlqmxwUHKeDlYU9O1CHiYrtyqt8UAWQnz6j
 vh20C9kC3U/qHNtVh5tHgxvvmv/9nVWs3ZJQWnLk41ZVpwJ3gge/NiWKLUmpqa2hP2
 h7qUobTeKeP+rIDrk7H/m+h7X06U7r1pDFu9qv3EE4Hs5BIHZ5vt/08ZUGTwkx63Xe
 KQMmjpM4uAZD7CnqHsi8DR9bsvfn8JrXAFroZOrRa/jqfWLj0BauyvyrqUU72MvXlU
 WNN969vEWP4RA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=T/bKu5W9
Subject: Re: [Buildroot] [PATCH] package/liblog4c-localtime: fix build with
 GCC 15.x
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 19/08/2025 22:29, Thomas Petazzoni via buildroot wrote:
> Add simple patch, submitted upstream, to fix the build with GCC 15.x:
> 
> userloc_formatter.c: In function 'userloc_format':
> userloc_formatter.c:30:5: error: implicit declaration of function 
> 'sd_debug' [-Wimplicit-function-declaration]
>    30 |     sd_debug("Formatter s13_userloc checking location info for 
> userdata %X",a_event->evt_loc->loc_data);
>       |     ^~~~~~~~
> make[4]: *** [Makefile:519: userloc_formatter.lo] Error 1
> 
> Fixes:
> 
>   
> https://autobuild.buildroot.org/results/dab64025e6a1688d5fadc2b9bd3738a2c886aa9c/
> 
> Considering the level of upstream maintenance, we did hesitate with
> dropping the package, but as the fix was quite simple, we did the fix
> instead.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
