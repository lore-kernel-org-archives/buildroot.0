Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB104C43458
	for <buildroot@archiver.kernel.org>; Mon, 13 Jul 2026 15:17:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 994F94090B;
	Mon, 13 Jul 2026 15:17:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pYfUWsBejsEQ; Mon, 13 Jul 2026 15:17:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A729B408E0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783955865;
	bh=iQSYBwO4W126uNHiev2g4YOqNSTlDqxWhKWNP12FsiY=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Ly8NqufTWeZuDFZjIc141nPUg/6/sQqqPDXdubBY7fG0yEKzCr6uWAN/N0tb1dagz
	 ODkUX13xg7aSdTVWtOOiwFzGibpbTx61JSvnPCX2RzVZ0fN5E333uk4WZMZWU1/9Im
	 Cu/L7AvGK+LArh2CnmovKPFFASUIbRLiNRRqzUnqvUObRRtY2X9XUJGDANietk+/o1
	 sC7YxHNDBRH8CNN4rO4sJneW3fK4CqGq2ntiqjHcDhom/DTuJl0NcyHU4dDGqnOeC2
	 gfYsavBvOR+r2B3bQdVbEbBAfy+vBV5OKQatNezLtOYAGha0l0EM4dHl/Im8oXntqp
	 YPfYEUgSQu6yQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A729B408E0;
	Mon, 13 Jul 2026 15:17:45 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 05B10128
 for <buildroot@buildroot.org>; Mon, 13 Jul 2026 15:17:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DFA2660879
 for <buildroot@buildroot.org>; Mon, 13 Jul 2026 15:17:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hce3iAhWzWey for <buildroot@buildroot.org>;
 Mon, 13 Jul 2026 15:17:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.2;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org DA67C60867
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DA67C60867
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DA67C60867
 for <buildroot@buildroot.org>; Mon, 13 Jul 2026 15:17:42 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id E31332003D0;
 Mon, 13 Jul 2026 17:17:38 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 13 Jul 2026 17:17:38 +0200
MIME-Version: 1.0
Date: Mon, 13 Jul 2026 17:17:38 +0200
To: Manuel Diener <manuel.diener@oss.othermo.de>
Cc: buildroot@buildroot.org, James Hilliard <james.hilliard1@gmail.com>
In-Reply-To: <20260713125920.1637369-1-manuel.diener@oss.othermo.de>
References: <20260713125920.1637369-1-manuel.diener@oss.othermo.de>
User-Agent: Webmail Free/1.6.17
Message-ID: <18900a3fff82e8eb7ee70fd4161f3609@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1783955861;
 bh=DxG7FSkWMaWuXjPbli8iTRtvqoLw0e2oNpHhBeWOCIs=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=eLk0+TENhMGqaLXA4wESGKykoxmaqvH/lXEWEAcQGVi+PmooTk8ePX7m8TuD7Sg7U
 h5g22xAAAEb3qvI6sNZdwYHs+dfgfM+K/92NXY7nv/GSBuJsgZRbTmp0uRwPzAq3yO
 ZXAjwVh+ItRNjsYhIEQj8bzMnwXvVDYqp0nhWm1b7pjUSejgHiMKtDoQ5mLe9zz4KU
 lemiqUK8v43o54sgrsyBPAnCv3Ua/bNYJ9qQE7Bs4xK2GFgqZwJvp9N8WCc5cI5xBA
 vkE9ergQJFn+HucQjbzrcEd4YoBxFpM8TWi3Kn4Bx5GOrBf+BtiN5SZuDpgSbWqKrv
 as4RQ+wHgWtRQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=eLk0+TEN
Subject: Re: [Buildroot] [PATCH] package/python-click: bump to version 8.4.2
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

On 13/07/2026 14:59, Manuel Diener wrote:
> See the release notes here (also including versions 8.4.0 and 8.4.1):
> https://click.palletsprojects.com/en/stable/changes/
> 
> Signed-off-by: Manuel Diener <manuel.diener@oss.othermo.de>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
