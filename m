Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCDFBC3ABBC
	for <buildroot@archiver.kernel.org>; Fri,  9 May 2025 14:47:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 764CD81469;
	Fri,  9 May 2025 14:47:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BU9tJfoAJXJs; Fri,  9 May 2025 14:47:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 90BDB81433
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 90BDB81433;
	Fri,  9 May 2025 14:47:24 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 85FE71A9
 for <buildroot@buildroot.org>; Fri,  9 May 2025 14:47:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8259481F18
 for <buildroot@buildroot.org>; Fri,  9 May 2025 14:47:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Px8smiu3Q2BT for <buildroot@buildroot.org>;
 Fri,  9 May 2025 14:47:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org A430081301
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A430081301
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A430081301
 for <buildroot@buildroot.org>; Fri,  9 May 2025 14:47:15 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 99B1BB0056A;
 Fri,  9 May 2025 16:47:12 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 09 May 2025 16:47:12 +0200
MIME-Version: 1.0
Date: Fri, 09 May 2025 16:47:12 +0200
From: Julien Olivain <ju.o@free.fr>
To: Kadambini Nema <kadambini.nema@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20250501082649.30153-1-kadambini.nema@gmail.com>
References: <20250501082649.30153-1-kadambini.nema@gmail.com>
User-Agent: Webmail Free/1.6.10
Message-ID: <29727abb5b35d2338b82cfba3068faa8@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1746802033;
 bh=2nepQoFO/LSCQHlFDEO9PU4qa1YuYuCmL9l8rokKVpk=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=BihMMVJLwQP98UcGvy0GEm12uZIDvzIN2lLD4Wy07RtSoFan8Q2dFmB4PYq7NapUO
 cUVgmwjnEETNYV3Syf1FU0Z/NhoNWx3IS5+Yg4Yqunmg/m5dPqWNEdcOx98u9z5UPN
 Uy/1/dV4KAF67/Ehwn112E4TGvMSzf+OarTq6njFNXB7gqq8qXbFCIf3zeXoqiNQWR
 uIaxX3e0Jfc5FnKUPZj84Sf/I73GWqRsqgtBhEKWY0FY6/Qfdg1uM2TxeC1QCyazth
 iW6rhqI4De/LOIPFqKpOKLXmJjsDJmE1HcHBgOmdsJ4T0vCMBL8FWkcnzkIt6GHc2y
 wBvXswdd9UUWg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=BihMMVJL
Subject: Re: [Buildroot] [PATCH 1/1] package/libwebsockets: bump to version
 4.3.5
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

On 01/05/2025 10:26, Kadambini Nema wrote:
> Changelog:
> https://github.com/warmcat/libwebsockets/compare/v4.3.3...v4.3.5
> 
> Signed-off-by: Kadambini Nema <kadambini.nema@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
