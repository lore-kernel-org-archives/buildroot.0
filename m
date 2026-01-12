Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0003ECF45C5
	for <buildroot@archiver.kernel.org>; Mon, 12 Jan 2026 18:39:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4546760E74;
	Mon, 12 Jan 2026 18:39:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jne0D9uD7enG; Mon, 12 Jan 2026 18:39:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4C51260E1E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768243159;
	bh=wBH9JVB11F5nOHlN7dy0vYV0ThoUcVm185hD9G1A7mg=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=jLwyBjV45mVoFHVJ2xXidGbN+oQluz/iEjfS3KzdsEUP4KtOUbMeEirvw07+KizL2
	 yBU7dRBjEWFzLhS4k6oyGwGDYF0Zrx3FB3s+0Nh8larSUqz68zF9z09yLI5shdxBDg
	 vRl6NaaZwjd4WColQZ6xiEJ1q8yBnZW/zA7iXJkt/zVklwufu4cdSiMf4hncoO3sJ2
	 pnqQmNsuNkgtNE3CFzmNHvfwaWzxCWkEdy1WVt/raAubUfyVd/g0L8UpFdCTSV1WlV
	 3UbWuqmUI82+Bo6Tlv4r/KHrl5AXA9ve4T1+f1nF3Pz/c9mSIJeFoOXTPVGxi3aRRm
	 aoWxRwDml7WRw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4C51260E1E;
	Mon, 12 Jan 2026 18:39:19 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 16F8B231
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 18:39:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0943F8402A
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 18:39:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7A0ZhAHoSclk for <buildroot@buildroot.org>;
 Mon, 12 Jan 2026 18:39:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 412EB84029
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 412EB84029
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 412EB84029
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 18:39:17 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id E3DE75FFA3;
 Mon, 12 Jan 2026 19:39:11 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 12 Jan 2026 19:39:11 +0100
MIME-Version: 1.0
Date: Mon, 12 Jan 2026 19:39:11 +0100
To: Michael Nosthoff <buildroot@heine.tech>
Cc: buildroot@buildroot.org, James Hilliard <james.hilliard1@gmail.com>,
 Asaf Kahlon <asafka7@gmail.com>
In-Reply-To: <20260112095031.251701-1-buildroot@heine.tech>
References: <20260112095031.251701-1-buildroot@heine.tech>
User-Agent: Webmail Free/1.6.12
Message-ID: <389e4efa302cbc832e394aa79169e16e@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1768243155;
 bh=x9GZ8ePmGvuCoA2qzAwGl2oeiwy0OGwgAS657wMTcWg=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=OEyO4jHDYQ2YK7ArThGtWGbjItS/IAsHafcxtwtAx/Q0Es+Y6vjm327g2OKkNMfDH
 0t/IQRBFVNB28rQeBqQxubnC20QRKAGwOP/WNeBKJTafYDTpDWHs8C+YokfOhM5Zi7
 5SW7Z6I9MU5MaXzs7qDWsVzyngttA9rJ8XctzHuXD5MEMeHXmUsIs8ClMHLrcRC0xV
 eyXVnPjV/KnUqw52k4BoA1rFiAWB94pMyjrJQJX0HHWS+owjdoh3vC2lBBE9p2v0kT
 kN+i+km9bi1+UVdKZuyFjOyrE0Vlq3m7QXQxAz590DW7sUY9nFJrkC6fgmuyYP6nWQ
 cKaWAm4GmyEag==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=OEyO4jHD
Subject: Re: [Buildroot] [PATCH] package/{python-}protobuf: bump to version
 33.3
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

On 12/01/2026 10:50, Michael Nosthoff via buildroot wrote:
> Release Notes: 
> https://github.com/protocolbuffers/protobuf/releases/tag/v33.3
> 
> Signed-off-by: Michael Nosthoff <buildroot@heine.tech>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
