Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC2FDCD5BB1
	for <buildroot@archiver.kernel.org>; Tue, 26 May 2026 20:35:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 839CB82052;
	Tue, 26 May 2026 20:35:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zptcy1hOKPql; Tue, 26 May 2026 20:35:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B607C81F78
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1779827706;
	bh=fVjmEnCukK6PKjR6MbFfL8ycRMy7h1oKfQecRBqXmIc=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=cIxq9jKCDT+aoGBA2z4UEXAzy7WQMXWFl7GISVNegtanAKkEfzBPVBXT6siQiI9Mz
	 UtVt6Q/XVOZthaXj4mRf4BjH0z34z93HNhxiVn7b17b7E7QELsCAwq0eS9T+0Cdzr7
	 1dMvxqt1IspA1x4+vsl27tUEmp2cRoNlLX9+vgOKIhz8NdsENW/D9huOKK57TUq+Fu
	 ShaAQNFAg/z77iETKoBKwI5azkxshsbXxg1d67uFzEVhMhfTcfMx3/IOhbRKnbYes2
	 wrNZZ/89g85ShPdS/rD9vBaYb39TlWErlES03GaRokZj807vrh4oZb2N0Tjj2KD/gD
	 8v9uuW61c5mTw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B607C81F78;
	Tue, 26 May 2026 20:35:06 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 5561A21F
 for <buildroot@buildroot.org>; Tue, 26 May 2026 20:35:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3AC8E40A6E
 for <buildroot@buildroot.org>; Tue, 26 May 2026 20:35:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wmkRh5vba_BV for <buildroot@buildroot.org>;
 Tue, 26 May 2026 20:35:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::13;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 33C7940A6A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 33C7940A6A
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 33C7940A6A
 for <buildroot@buildroot.org>; Tue, 26 May 2026 20:35:03 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 9754519F574;
 Tue, 26 May 2026 22:34:59 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 26 May 2026 22:34:59 +0200
MIME-Version: 1.0
Date: Tue, 26 May 2026 22:34:59 +0200
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: buildroot@buildroot.org, linux-amarula@amarulasolutions.com
In-Reply-To: <20260526192733.2105339-1-dario.binacchi@amarulasolutions.com>
References: <20260526192733.2105339-1-dario.binacchi@amarulasolutions.com>
User-Agent: Webmail Free/1.6.14
Message-ID: <fcf1040d60e5db54e6afa6ca98331fdc@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1779827701;
 bh=vT+upyet2Wsp/LHIW1Xf0Sa9WQwt7yH9Q3/Ox0UQsAk=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=iR2r24fpUTJA2V40DvScGKGozZrs7fN3p87+yDlr3cyKwu8pX/RYOfRTu5Wl5+9jX
 bEzvpmyBFwDNJFvctLMz5FI02Fow3saT1Y6MtSnNladGxmtbuKbCojp+rmwakk5BJP
 L4RZaM+0+l76Y5Vc35g8tBJBIxKlO+bEM6TMSjKJptTNcuFQRjXS9xb/OcUffg7qqG
 92TJLbH5fpwq6E8Z5clYPVfc4ZKWwhacW0WwFDYWy9quwKxottqpwpVstFo2AEfF3j
 i08AFkB43KhhOEP9PKfEwEWTA3O/S+r8x7SO0zXdSCfYxSNHTbY3hNKtJCg+BB+xpL
 ycJwRWTm7wi/A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=iR2r24fp
Subject: Re: [Buildroot] [PATCH 1/1] package/less: bump to version 702
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

On 26/05/2026 21:27, Dario Binacchi wrote:
> For change log, see:
> https://www.greenwoodsoftware.com/less/news.702.html
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

Applied to next, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
