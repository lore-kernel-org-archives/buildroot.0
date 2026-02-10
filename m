Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C32E8EA8108
	for <buildroot@archiver.kernel.org>; Tue, 10 Feb 2026 12:32:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 80D7182E19;
	Tue, 10 Feb 2026 12:32:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jheJESU_UEmJ; Tue, 10 Feb 2026 12:32:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9F11D82E4C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770726746;
	bh=oRnwqEgXLBPvg5UuOyN3K2KnQY7S/bNNOqTaStbWKGE=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=DY4ZsMWrqqdNodDyZAMjpChOq5uoVBd9ZEK7841nCLASez080bMXtTM9ZIoLcYcEv
	 oHmJHM43d6dhxwAcUB5tdR+6ZCPTKn14Cj1EPWyMm1LUqLGN+fFdpdX43JwbUiQX9G
	 M3MPV5OOMnxakXRaQtOz73OTAFzH+tnOn18Uw0bfuY8hZsHyIppKSD+C1auR6+EJpm
	 JOstYBvg9MQ2/Th7fwacfoUkdMsXdDEHREWJgglDyGoHVTWf9mbOc9s+UmDsbd/JEk
	 i5L26p2F4Emmlx0Iy/CPZVsovFvxERCSdI4qpjTGylGYxVsL8PaIXbhUj7bwZwRJ1w
	 VP3El9BO5OpKA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9F11D82E4C;
	Tue, 10 Feb 2026 12:32:26 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 6C2EF1A9
 for <buildroot@buildroot.org>; Tue, 10 Feb 2026 12:32:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 51B9740591
 for <buildroot@buildroot.org>; Tue, 10 Feb 2026 12:32:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id icQEKfLfef-x for <buildroot@buildroot.org>;
 Tue, 10 Feb 2026 12:32:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::13;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 7A14E40166
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7A14E40166
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7A14E40166
 for <buildroot@buildroot.org>; Tue, 10 Feb 2026 12:32:24 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 7E97319F574;
 Tue, 10 Feb 2026 13:32:20 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 10 Feb 2026 13:32:20 +0100
MIME-Version: 1.0
Date: Tue, 10 Feb 2026 13:32:20 +0100
To: Peter Korsgaard <peter@korsgaard.com>
Cc: buildroot@buildroot.org, Bernd Kuhls <bernd@kuhls.net>
In-Reply-To: <20260210081137.807581-1-peter@korsgaard.com>
References: <20260210081137.807581-1-peter@korsgaard.com>
User-Agent: Webmail Free/1.6.13
Message-ID: <c57b42632a0b9c9dd775c7e846dfb720@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1770726742;
 bh=tzIaZ+l4R1iYF/cIAw/Y1u95/cpjsI9qmRtFKpi+7vg=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=vZrxd0BrcWl498q0AmHeCjr2x4ROLMjngWhHUPLdkkzavo1RRHtIJ2wcDwXDuUGaf
 xMxmJaGoaaPJ1nP/huyMqx9v478j0XDyZnGxkEEucKXmvbqf/SD7QLnbrfRXdo06Pq
 z6SR75HODE6W19l0oW80e6PQBTMpUJB5KyWsFZjL5WVF825WwGaPmuUDpxqIFVIFLB
 W9l3QEOiYm+A3B2465t9F0zOjrmDAjHpPijsVSaZZ0L6rpNgRFk8rudniqFsolzFr6
 PF2WfxwPXy//7z+pcJ9AuXT9SUUuF6hP4NRfBvvNSastWD4gpRikMHn2uUS+FWhcnX
 rhWhb0k6/1yRw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=vZrxd0Br
Subject: Re: [Buildroot] [PATCH] package/libpng: security bump to version
 1.6.55
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

On 10/02/2026 09:11, Peter Korsgaard wrote:
> Fixes the following security vulnerability:
> 
> CVE-2026-25646 (High): Heap buffer overflow in png_set_quantize when 
> called
> with no histogram and a palette larger than twice the requested maximum
> number of colors.
> 
> For more details, see the advisory:
> https://github.com/pnggroup/libpng/security/advisories/GHSA-g8hp-mq4h-rqm3
> 
> Release notes:
> https://github.com/pnggroup/libpng/blob/v1.6.55/ANNOUNCE
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
