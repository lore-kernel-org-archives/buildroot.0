Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE993D374A3
	for <buildroot@archiver.kernel.org>; Fri,  5 Dec 2025 20:53:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C47596F47D;
	Fri,  5 Dec 2025 20:53:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id R9pugUH8fmA1; Fri,  5 Dec 2025 20:53:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E80366075B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1764968035;
	bh=qrO8HGmUq9y5B+siDy3Cv4iAQkgxD5+kuX4kl2BGGpc=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=GGvuGTto9YC5UW6RM0VxUO5/Day+UdhR5PfcT/GqEgCZ4eNCug/L+BDukP7j7rrxK
	 DQxsX6LOffHg6qhZpOu6ARDyLHPnbgKDoiVVBWLyuQbIbrwSdqKjTjZWTCZYi6cLa1
	 sVIE1zOfS6xjxpdIpTRQWi6Fuubu9evue6HDKvMZ1w31eSgxkh2o+X9a6A/3M/aLOL
	 Z9mdrAvBkArwQ6IQyqqMWFy88M/wwmIqZ9a4igI+sZ0Ug7K3ggvbf7s0iAGJDDZtou
	 pHaWxB9NtsawWcLc7JkMpYoaQ7cI0edGOVpLoCgfk6IVc9VMSOe2zFkhMRhDHbbsKk
	 Yp2FUCDb6QEBA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E80366075B;
	Fri,  5 Dec 2025 20:53:54 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1BA6EE7
 for <buildroot@buildroot.org>; Fri,  5 Dec 2025 20:53:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0DFAD40BED
 for <buildroot@buildroot.org>; Fri,  5 Dec 2025 20:53:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PbzSOE2cLAT0 for <buildroot@buildroot.org>;
 Fri,  5 Dec 2025 20:53:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 0047F40BDD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0047F40BDD
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0047F40BDD
 for <buildroot@buildroot.org>; Fri,  5 Dec 2025 20:53:51 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 2FF62B00548;
 Fri,  5 Dec 2025 21:53:49 +0100 (CET)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 05 Dec 2025 21:53:49 +0100
MIME-Version: 1.0
Date: Fri, 05 Dec 2025 21:53:49 +0100
To: Raphael Pavlidis <raphael.pavlidis@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20251205171705.21591-1-raphael.pavlidis@gmail.com>
References: <20251205171705.21591-1-raphael.pavlidis@gmail.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <607ebe9b99e5e81b8c58fb5f7cc964d2@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1764968030;
 bh=xmQS28L/wTjnktQ5iN0kdBFWcfPFj1/Y5y2yVP3i4bg=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=AGIkA67emHGZZRYB46ICK+dz9Mbj/GZR4qvcHKFjWAxhS1slE1W+i96aM5uM70Rqx
 9W4ndogRGJ3ix4ChoWZNDKwz6p2XWLqx8fGD7hVGxAKLgrL4X72eR9IcFnq2Df9gMa
 VrSsq/SbdV5MSOzxVqrbJ0yXJV5y4lPahajhfBwjPk22vGHGJDXwTzAmwrmXh6goIU
 wGsOIDKeT9OE1icbSRW1FKNypbaoSKFNh/0S/HXuo6FwL03DsQEnfJ40J8cEaD8WXw
 gaT1mhSCOtZthsC7mKzpGuDcImNi0kseS1CaGZ/ZEpRg/refhYpK+Wc/SEupMgqFFl
 eTwjwWU5fyrew==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=AGIkA67e
Subject: Re: [Buildroot] [PATCH v1 1/1] package/x11r7/xserver_xorg-server:
 security bump to version 21.1.20
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

On 05/12/2025 18:17, Raphael Pavlidis wrote:
> Changelog:
> https://lists.x.org/archives/xorg/2025-October/062147.html
> https://lists.x.org/archives/xorg/2025-October/062150.html
> Signed-off-by: Raphael Pavlidis <raphael.pavlidis@gmail.com>

Applied to master, thanks.

For info, I fixed the license file hash. See:
https://gitlab.com/buildroot.org/buildroot/-/commit/78513ff979f457a7e817ea27fa600fbe3835aff0

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
