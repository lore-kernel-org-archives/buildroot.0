Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8078AEE6B60
	for <buildroot@archiver.kernel.org>; Fri,  6 Feb 2026 21:37:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1D438611C3;
	Fri,  6 Feb 2026 21:37:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id povJkdyVVejH; Fri,  6 Feb 2026 21:37:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5817860FAA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770413836;
	bh=jdbr1CYsY7hPYT/JFyT2J4cbSjBSmVOmb1fmsVCKCgg=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=ZTfRG0JVX2DqPGSBZiNz8D0oTH7TKgxo9uUb0RQQyQGiKvkiT4dzuwXv8e5PAjDB9
	 WsFrO4J9OyyevmfvEcvwY1Zz7uPcqh9F3xLZtpwPFLLxyyeigW660v2pQiG2+ROWgp
	 +tCKJZ/xw4S81R3DmLNgkfr22Z509EltOP/1dg7EBTm0+3i6DtSC8YSqcUZvya4eSF
	 6OLdSGYDcyfcBsAG8HOZib+0eq0VygCnfQrvne8YlZeNEjwblI1y0ZK8iuKlw8C+e2
	 zwyDHHq0GGjqo16r77w39U7n4KCxHxaQrZgNn5duMcV/0a/h7gXzQjtpSvtPu1kfVP
	 2MYt1zUUl0AHg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5817860FAA;
	Fri,  6 Feb 2026 21:37:16 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id D305B219
 for <buildroot@buildroot.org>; Fri,  6 Feb 2026 21:37:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CDC4A60FAA
 for <buildroot@buildroot.org>; Fri,  6 Feb 2026 21:37:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xgYR0-Wo8ahV for <buildroot@buildroot.org>;
 Fri,  6 Feb 2026 21:37:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::13;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org BE25D60FA3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BE25D60FA3
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp3.osuosl.org (Postfix) with ESMTPS id BE25D60FA3
 for <buildroot@buildroot.org>; Fri,  6 Feb 2026 21:37:14 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id C0AD419F5AF;
 Fri,  6 Feb 2026 22:37:08 +0100 (CET)
Received: from 77.109.103.251.adsl.dyn.edpnet.net ([77.109.103.251:59612])
 via 77.109.103.251.adsl.dyn.edpnet.net ([77.109.103.251])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 06 Feb 2026 22:37:08 +0100
MIME-Version: 1.0
Date: Fri, 06 Feb 2026 22:37:08 +0100
To: Pierre-Yves Kerbrat <pyk@foss.peewhy.fr>
Cc: buildroot@buildroot.org, Kieran Bingham
 <kieran.bingham@ideasonboard.com>, Marcus Folkesson
 <marcus.folkesson@gmail.com>
In-Reply-To: <20260206145618.337231-1-pyk@foss.peewhy.fr>
References: <20260206105242.0f66fb07@pc-1>
 <20260206145618.337231-1-pyk@foss.peewhy.fr>
User-Agent: Webmail Free/1.6.12
Message-ID: <8233ca320c46b90e70f91fc85e55871e@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1770413832;
 bh=5YkuxnrXaopWsdLgAT+DxAOhmN9XIUO5O5JaqSyfNwk=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=YhJf8+w83E3jZDJ9a+NZOO+kljhLCIsw+mhXVx5l3qsWY/zmve0t6p8AZEfir+Gol
 aIetu4xi1ro7SgwKQ7IAJmPRBNC4CYLEOIZchoaES/7eXSaysPlwNthPaJYXv/Vm51
 5OK+2Kaq7SVXxmh1g1T5dnYWqVXNfRdyquybSxpFno2ExqcWmLQfoLc3LMcL7br3C5
 pyfYuK9LKHcKk2V2ya1eF5l0i68LBO2QabIu4s1hEmZNAkI5X4lPax0epJ5v06kQ9N
 nhD5RijQ2kr7UAKIcM98/jAc/vAy5/DJe6BElSg9pSqIvxctcYRMeL2bBXwEqmYXwZ
 6rBZCdxVh84OA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=YhJf8+w8
Subject: Re: [Buildroot] [PATCH v3] package/libcamera: bump to v0.7.0
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

On 06/02/2026 15:56, Pierre-Yves Kerbrat via buildroot wrote:
> Changelog:
> https://git.linuxtv.org/libcamera.git/tag/?h=v0.7.0
> 
> Signed-off-by: Pierre-Yves Kerbrat <pyk@foss.peewhy.fr>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
