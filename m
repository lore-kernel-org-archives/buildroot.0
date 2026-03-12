Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C60C106ACD6
	for <buildroot@archiver.kernel.org>; Thu, 12 Mar 2026 18:31:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3336C40788;
	Thu, 12 Mar 2026 18:31:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uTY22D48Nd3l; Thu, 12 Mar 2026 18:30:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 33F4040769
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773340259;
	bh=ywmZiDgWGxJc5qni7jHDHCnPXLxN4a1wclZ+NEfQ8Io=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=U3FS6J91+HLfG2eSQNOjIyhPuQ7Dj8H4EeYnMu4RU5j+zLA5h4weUu70M/pf12brf
	 B7zmQ0yvxOD3t35qHqg+cEjEDJ7mNZgHvdjgonhxT3Da2lgKRpbjYbuf1NE7bd3drt
	 SgJC19nUJoFD8We4ph6xetNp82DsY+oBuvkmvfZwY7F5ADys8klmimZ9brtvqOF7WG
	 p1ZB3ZBZNailjf3qzt1SEVnYLNjyfgbNDVVt6G6Hs6+bNqU91LR4LaIPBueDLiM008
	 x7ZsW2D4rKYXoo1KOfinNu1YhFTkRob8V1x/mR3GfuSRBpOuu2o9MdHUvgM2oGQzQU
	 cGxAkXyXc7t0w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 33F4040769;
	Thu, 12 Mar 2026 18:30:59 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id B41D2201
 for <buildroot@buildroot.org>; Thu, 12 Mar 2026 18:30:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 99F12606B1
 for <buildroot@buildroot.org>; Thu, 12 Mar 2026 18:30:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TvHoIbsbCnle for <buildroot@buildroot.org>;
 Thu, 12 Mar 2026 18:30:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::13;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 878F1606AA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 878F1606AA
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 878F1606AA
 for <buildroot@buildroot.org>; Thu, 12 Mar 2026 18:30:56 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 336D219F576;
 Thu, 12 Mar 2026 19:30:52 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Thu, 12 Mar 2026 19:30:52 +0100
MIME-Version: 1.0
Date: Thu, 12 Mar 2026 19:30:52 +0100
To: Julien Olivain <ju.o@free.fr>
Cc: buildroot@buildroot.org
In-Reply-To: <20260118150726.245853-1-ju.o@free.fr>
References: <20260118150726.245853-1-ju.o@free.fr>
User-Agent: Webmail Free/1.6.13
Message-ID: <be1a9843279fd17dc0ac13cb085a577d@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1773340253;
 bh=itbnWqcrnk4rMItkzmMA1KnblmC6RYdzLoouuU3kfvE=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=WxvSS/syvj5LnEgbtnLFHhWyFYskdSnk1V7QDNNIe3uLI1SyFXgV8YNYQ+ida3vjx
 1bdXX+g9tkMNNvJdfIYfVlBAYwzC1YICPq0/xoc5eQ/1tpYM0zPsWxitinecwNTntX
 j0/zFNuv9Oo5D7iHQfQ8Z+DLOWtxwP9x7uK/kw3btvFpoQ3KJ3wTEQyU7PLVeUJXgG
 8ctqYmr1bMAcy3hrciynDm4H63E6GSz6h8b7F5XK6fgFo7R0XRins2AjGgk0CD3Zfk
 wZHdhdDGckdGaM8zKJ8QUZHkN+g0u19pWltzjVLoplkv2gz50EaxD0P8c/pUHvENcP
 o+lR89h5mMhYQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=WxvSS/sy
Subject: Re: [Buildroot] [PATCH 1/1] package/openblas: bump to version
 v0.3.31
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

On 18/01/2026 16:07, Julien Olivain via buildroot wrote:
> For change log since v0.3.30, see:
> https://github.com/OpenMathLib/OpenBLAS/releases/tag/v0.3.31
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>

Applied to master.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
