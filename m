Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DD0BFF886D
	for <buildroot@archiver.kernel.org>; Tue, 28 Apr 2026 18:55:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 58FD6610BA;
	Tue, 28 Apr 2026 18:55:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JKm9wg9q2cbN; Tue, 28 Apr 2026 18:55:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 84024610B6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777402531;
	bh=VNNbXsbnv2PUBLhSWHkdBygkgP5acItC3Q/LGejdxek=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=ZVsp3dBqZTV+2aCFiRC21MzEzYR0HscTlo+qGRJwc7E3LLnI2JIuVEX2KsUAq9uYd
	 8tvpQeUyWZJFhCmv9ybna5rou0YNdGOKgy8hrHhH+ksJCkBpn0uzJRGDUeWuhV6FJ1
	 UBggC5nB0FNaTtuiwqZ0aaUuYmuktvi4rn3p3XGK5kUWaQ7Jc1CdZsE0FTnO225b1X
	 G0FHIL6bd6VL++TNRkBFN2x8am/BQwLLue71KaQejkzgU62+JSUdLXROrN5U9DCK3o
	 0fidN/xvz+JKKMTtoKMZrpSXcT++532yBjqr2+nX0pKQrYq4GTMaYi/m4aXBiH+B14
	 ttzBmmuXYVWkg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 84024610B6;
	Tue, 28 Apr 2026 18:55:31 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 21D85231
 for <buildroot@buildroot.org>; Tue, 28 Apr 2026 18:55:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1FB63407C5
 for <buildroot@buildroot.org>; Tue, 28 Apr 2026 18:55:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vsBj5-CSu2ZV for <buildroot@buildroot.org>;
 Tue, 28 Apr 2026 18:55:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::11;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 459C7402EF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 459C7402EF
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 459C7402EF
 for <buildroot@buildroot.org>; Tue, 28 Apr 2026 18:55:29 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 120992003D6;
 Tue, 28 Apr 2026 20:55:25 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 28 Apr 2026 20:55:25 +0200
MIME-Version: 1.0
Date: Tue, 28 Apr 2026 20:55:25 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20260427061334.338941-1-bernd@kuhls.net>
References: <20260427061334.338941-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.14
Message-ID: <aa4ea0ead43df78377028cbfcead3349@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1777402527;
 bh=jq8wmIx81bNwq9SMu6Vxf19XBjXCrjRX1sTDWts9QgQ=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=KJHkMKo4G0mW5NMrbOzV4Jan4AgDUimB3l9gfyRSJnnWK6aX23T9xAfS9vaDlHkHf
 2kYa9O4GrLma4/JJ+w7z5h32FeraJ8D4UHEH3RP2igucsJNWgSiFoNBi+pEOZxP/1x
 u8h6Il2u66tpFUzYbxePkAKQ9nuWUS9y5s1tbQuQF0uBgtcHSOMLQHjSe9pT12WUXW
 98t5wlX2gedCx+eSsRSFKC7hu8zcT2mxwsA/F/LWri+nKdqXDoNRgc2g3r/qJTOm2s
 LMqYyPQEbgjoydaMfGjorV0j60fDSk6zOLkWr6eJiyznJM7AcDQ9ICzJXp2qVqcVFZ
 VfXaIDpscLB4w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=KJHkMKo4
Subject: Re: [Buildroot] [PATCH 1/1] package/mpg123: bump version to 1.33.5
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

On 27/04/2026 08:13, Bernd Kuhls wrote:
> https://www.mpg123.org/cgi-bin/news.cgi
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
