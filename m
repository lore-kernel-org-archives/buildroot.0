Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E418AC369AB
	for <buildroot@archiver.kernel.org>; Mon, 21 Apr 2025 09:51:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B052680BD4;
	Mon, 21 Apr 2025 09:51:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cvNLV9zX72Zh; Mon, 21 Apr 2025 09:51:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E9D9A80C69
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E9D9A80C69;
	Mon, 21 Apr 2025 09:51:46 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 43CEC1C0
 for <buildroot@buildroot.org>; Mon, 21 Apr 2025 09:51:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 26F7A80BD4
 for <buildroot@buildroot.org>; Mon, 21 Apr 2025 09:51:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9gMunnOlYpoo for <buildroot@buildroot.org>;
 Mon, 21 Apr 2025 09:51:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::15;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 4BD1F80BE2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4BD1F80BE2
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4BD1F80BE2
 for <buildroot@buildroot.org>; Mon, 21 Apr 2025 09:51:45 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 8AA67780389;
 Mon, 21 Apr 2025 11:51:42 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 21 Apr 2025 11:51:42 +0200
MIME-Version: 1.0
Date: Mon, 21 Apr 2025 11:51:42 +0200
From: Julien Olivain <ju.o@free.fr>
To: Daniel Lang <dalang@gmx.at>
Cc: buildroot@buildroot.org
In-Reply-To: <20250418144104.24180-2-dalang@gmx.at>
References: <20250418144104.24180-2-dalang@gmx.at>
User-Agent: Webmail Free/1.6.10
Message-ID: <c189fc5210d610c979196549a773d06c@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1745229103;
 bh=FvUC3bmrZJCKYEKW54rVAxSmPzad/WE6XciECWD01Is=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=HqlNIK2omUgvpsQFqS31PoimQ/WTXCJhvrg6x0iwiAc1Q3Tt5zTjrmR6F6oYMXHsO
 KrR9lCsPqlFq+mhwP/cl/6v6tjerrwpkPzyYen16Kf4fvKJA3h6IQQMc9pMz4A/5mh
 JpL8GE8i0lmPfwZqxMQnyPIT+J8RXS4a923sn7nZoD1krYrZDmEpfCiXEIVDnucfVG
 j01qWz3xPEw5L6FMW3uihlbsDoKx2oYUWVjdXAvKA4y64PRu/D8INCGNM4PIrRbc+N
 GPlXpXJQdgd2HXZJDd7Bmrarb2oiHTC1FjV5VU//y/zMKdLiz1p5+fpi9F5rbr1ktU
 Yh9NnTnyieugA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=HqlNIK2o
Subject: Re: [Buildroot] [PATCH] package/pangomm2_46: bump to version 2.46.4
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

On 18/04/2025 16:41, Daniel Lang via buildroot wrote:
> https://gitlab.gnome.org/GNOME/pangomm/-/blob/2.46.4/NEWS
> 
> Signed-off-by: Daniel Lang <dalang@gmx.at>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
