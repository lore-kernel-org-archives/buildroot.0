Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B758BEE6B58
	for <buildroot@archiver.kernel.org>; Fri,  6 Feb 2026 20:43:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 409BD61206;
	Fri,  6 Feb 2026 20:43:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id K_N6lHp9cHBR; Fri,  6 Feb 2026 20:43:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 69ED0611C3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770410589;
	bh=lmGYEeF4o2rJJnqUEMDK2Tvb0CjQ/Bvf4IzFNtcVT54=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=cUfqxTG7Bxaz440MWD0R6A5s1YvwtBIBVdtLXHJR8H//hYZZEZrxL27JevnQXaUc3
	 3MdDLg+lq4S+fHJdy8+/WAQipMrarzCIkklGVyva/QCgYftsNqqCbc5eTp3dWYDGHq
	 4XHtkpSEvgow4sZ109ICWIn9nud48VnGpxJoFrvjsYv1rr1QU77VloEbLRJua60Uae
	 UT3q1knUJXpSs63cL2KjNnFESi2w36aLmwqVAtrsdTCkFSOxRvFJx29W/PywtXdxrc
	 WyieoE5dO/fnmCpJJ1bstuWLFRGGVnTyJ19dOtfH4MWhobYiL0YlJsrZ2jrOyosiAW
	 /2/t2ScEF3cAg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 69ED0611C3;
	Fri,  6 Feb 2026 20:43:09 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 63F0C219
 for <buildroot@buildroot.org>; Fri,  6 Feb 2026 20:43:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 45D75400CD
 for <buildroot@buildroot.org>; Fri,  6 Feb 2026 20:43:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aSxUhdLi42Ej for <buildroot@buildroot.org>;
 Fri,  6 Feb 2026 20:43:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.4;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 606B4400B7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 606B4400B7
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 606B4400B7
 for <buildroot@buildroot.org>; Fri,  6 Feb 2026 20:43:06 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 47AF119F574;
 Fri,  6 Feb 2026 21:43:03 +0100 (CET)
Received: from 77.109.103.251.adsl.dyn.edpnet.net ([77.109.103.251:62579])
 via 77.109.103.251.adsl.dyn.edpnet.net ([77.109.103.251])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 06 Feb 2026 21:43:03 +0100
MIME-Version: 1.0
Date: Fri, 06 Feb 2026 21:43:03 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20260206200232.1976939-1-bernd@kuhls.net>
References: <20260206200232.1976939-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.12
Message-ID: <3ec5e547929eededd559f8473a704d53@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1770410584;
 bh=W9aqAld4S+Ws2mkg5d2UC7mT2aBc4MWmiNKyqsHXxvo=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=vS3YWLXOzYgj0h4Mx+sAqBl3G621fgYRvJM3lO5GNZ1dE4QbsBr9M69oDJJ4mW2gM
 XbotolXalHWkvBb9BUJScencmPCfo9YZbVyP8bFSBjV49I5LVBkBwwbN1B4qmu2cFr
 JrZ31qp7czd6fKLfSz0kzD/dbLO+6NZE3aUhN53YTBIkmMSeWsqXSfOsVSdAhXOVhP
 0S+8ljPOKOOUEQ2NUanurl/Gt5mbePDMvr0sOg/SkEM5OEXJV6jYobk+DF3eehYh50
 +RqUZLJXvXfqzXk22F0oN/fZ4rheiR8XDjmE1teaEYV57ogiotajbykaa73BSRn5mh
 Ujw65k4z2xsGQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=vS3YWLXO
Subject: Re: [Buildroot] [PATCH 1/1] {linux, linux-headers}: bump 5.{10,
 15}.x / 6.{1, 6, 12, 18}.x series
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

On 06/02/2026 21:02, Bernd Kuhls wrote:
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
