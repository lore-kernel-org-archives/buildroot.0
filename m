Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D84FCC369A1
	for <buildroot@archiver.kernel.org>; Sat, 12 Apr 2025 11:34:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6D4846065E;
	Sat, 12 Apr 2025 11:34:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BpLKfAJl2Qvf; Sat, 12 Apr 2025 11:34:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A29B1607F3
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A29B1607F3;
	Sat, 12 Apr 2025 11:34:55 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 933D9108
 for <buildroot@buildroot.org>; Sat, 12 Apr 2025 11:34:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8435E844AC
 for <buildroot@buildroot.org>; Sat, 12 Apr 2025 11:34:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id idjm3VYSmkkL for <buildroot@buildroot.org>;
 Sat, 12 Apr 2025 11:34:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 9715D83ED8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9715D83ED8
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9715D83ED8
 for <buildroot@buildroot.org>; Sat, 12 Apr 2025 11:34:53 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 222F75FF95;
 Sat, 12 Apr 2025 13:34:46 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 12 Apr 2025 13:34:46 +0200
MIME-Version: 1.0
Date: Sat, 12 Apr 2025 13:34:46 +0200
From: Julien Olivain <ju.o@free.fr>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: buildroot@buildroot.org, Anand Gadiyar <gadiyar@ti.com>, Bryan Brattlof
 <bb@ti.com>, Xuanhao Shi <X15000177@gmail.com>,
 linux-amarula@amarulasolutions.com
In-Reply-To: <20250412091936.1251605-1-dario.binacchi@amarulasolutions.com>
References: <20250412091936.1251605-1-dario.binacchi@amarulasolutions.com>
User-Agent: Webmail Free/1.6.10
Message-ID: <a4d544f3c100a66be5d4c3a354bbf218@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1744457691;
 bh=2S7IEg9QHjhc32Clqrt10Gxri67YDQqtw0yFhCd/Ci8=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=sVqjfBq+UqhWwCGuGTm3t409mKeil7VBDN/lBTn2NksXy6mjdWp+4LQq40KAKtGNj
 hCsW9H2lrqrBq06/prBqGhV37fcgMBTO5d0IfOgLDDVdhWYbcj4USEI8jtFB5RgkaY
 rRVcTZECHXt2NEiCedkwnsMOwJdx3ijVBk1ahk0BHLIjTiLeLMDI2LmTOXRgGEkg0y
 KOy12twnth9pCDcgHlJWToqnt+uKLMf7VVg5iuj/K5OnK0NHqL+ISzoHuGy+HZJhyz
 s4Iw8H1qJl4OhPkc2S0nEwfr9LF8BADSq2bkm3OwUs37DHtJVgSYi7nb1IOMwYFayY
 FrELdHsRLuLJw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=sVqjfBq+
Subject: Re: [Buildroot] [PATCH 1/2] boot/ti-k3-boot-firmware: bump to
 version 11.00.10
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

Hi Dario,

On 12/04/2025 11:19, Dario Binacchi wrote:
> Release-notes:
> https://git.ti.com/cgit/processor-firmware/ti-linux-firmware/tag/?h=11.00.10
> 
> Tested on SK-AM62B-P1.
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

A similar patch patch was proposed yesterday in:
https://patchwork.ozlabs.org/project/buildroot/patch/20250411095040.2276825-1-heiko.thiery@gmail.com/

I applied it in:
https://gitlab.com/buildroot.org/buildroot/-/commit/03cd7d1a4c8ba5b55af7d7343559060fe58d82b2

I also added you in a "Tested-by:" tag, to reflect the commit log of 
your submission.

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
