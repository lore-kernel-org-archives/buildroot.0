Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39AFFD2502D
	for <buildroot@archiver.kernel.org>; Sun, 11 Jan 2026 20:59:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D6F094062A;
	Sun, 11 Jan 2026 20:59:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Wk9rzIl6uJPf; Sun, 11 Jan 2026 20:59:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 51DC5405EB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768165187;
	bh=hkDvdQ0bRgSsLXTX7DpqvNRSi4E77JhOgQc3kro2cyI=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=IcFqrlO9/TYFg8AKbn6WxJ7/BrKJWPI7ACkJXz7czMyG99lXywI/ewWz0iYUo0JrU
	 eMgCAyociz6SCIu1ZxwrRX3MgxBkCZucrQphCdOmXmfRp3wo1o+zq9K7LQpsxBi4+q
	 EkZZxpAB11NiLRhGiXpuluiqtSPynO994RTQ1RLvgJDp43nY4QsC/3qxrhZAMi4EXM
	 L1z2C1RCZmkYILV7ASZN49uGJzGkK3qobGWaJIH1sFWtm/fCcez8ArbtOU+zyR6L1i
	 dOMrinHGIWn8vq9c3/vRaHT4eD3qXGJpfcSIO4KUXaSfoxJQeZjvwHGDyHTn1NDnAF
	 cKxUbNMq+B2mg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 51DC5405EB;
	Sun, 11 Jan 2026 20:59:47 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 0B16A18D
 for <buildroot@buildroot.org>; Sun, 11 Jan 2026 20:59:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F060C402ED
 for <buildroot@buildroot.org>; Sun, 11 Jan 2026 20:59:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gSXQVQdt5hdQ for <buildroot@buildroot.org>;
 Sun, 11 Jan 2026 20:59:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::11;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org CE64E402E3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CE64E402E3
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CE64E402E3
 for <buildroot@buildroot.org>; Sun, 11 Jan 2026 20:59:44 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id A31C02003B4;
 Sun, 11 Jan 2026 21:59:40 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 11 Jan 2026 21:59:40 +0100
MIME-Version: 1.0
Date: Sun, 11 Jan 2026 21:59:40 +0100
To: Maxim Kochetkov <fido_max@inbox.ru>
Cc: buildroot@buildroot.org
In-Reply-To: <20260111134914.393727-1-fido_max@inbox.ru>
References: <20260111134914.393727-1-fido_max@inbox.ru>
User-Agent: Webmail Free/1.6.12
Message-ID: <8a4ce3e87c11d090e6d620c21bebfa3c@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1768165181;
 bh=7dMV7PFHvjfsyoCzYexs8T+Q5qgwmiT3rgQOQkfv5pc=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=rTahG06O6Ok1pXzr0lGYKgCwqWFzqUeiN9pzA0CstS4n2SMCN0XDICsoVtXNFzhqi
 IzhiEgMhowc6bBbXIaVjVIVCUpLwWZkEM5yhfqT/WnVXsy4TG2KnLSvK9nEaq0Xs+u
 JAHHeBjo5vC+N17SlF6yxaV6EOlyW4Do0wbFxaYnWNqeck6nnUPZ8ODNPLul1Rh1VK
 lzryYfvkp3wtJHxsskJf3FZ1b+6fyWwJsTqNBbgVkmjlskcemHmA2yhrDwk4W8yImd
 2hTCo0rxdiPR2lZImTLyJrULg2FRzHzsauJIy6dL+mGoP88eYAecxsTyqIUiA9bTGz
 vSMZG3yisc8Ow==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=rTahG06O
Subject: Re: [Buildroot] [PATCH 1/1] package/osm2pgsql: bump version to 2.2.0
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

On 11/01/2026 14:49, Maxim Kochetkov via buildroot wrote:
> Release-notes: 
> https://github.com/osm2pgsql-dev/osm2pgsql/releases/tag/2.2.0
> 
> Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>

Applied to master, thanks.
For info, I also added links to other release notes since v2.0.1.

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
