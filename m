Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA29CD5B161
	for <buildroot@archiver.kernel.org>; Sat, 13 Dec 2025 20:10:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0110040963;
	Sat, 13 Dec 2025 20:10:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gdLO64Pxg6ju; Sat, 13 Dec 2025 20:10:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DA94340961
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765656655;
	bh=Aw3sg6Ke90j24E1v5JNoMfK2txSZDISj0pOjDZx5hg0=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=oayhz1aJuo+CiFK31GaeYtO1bfy1uNFCYZnUPdBJ/mUiyeoEltuBxYwYzJq73i1HJ
	 G8GcDU5wtNHo6OXWMvkbV3j5qJ24iRZRIQ9qARl7lAE8y6nxFROoFUcyiR6CM1QFFA
	 tydlfBItfGhy3xzvMBnyQ5D81hM7t/9xV9syIg4nI322T6o8hE/zkMM14PwEI+AhQ4
	 la7eJqL55JhabaEdi5IjVS72U9J3gpqP5/jADrsWg5W2F0U25LO5HT9eBZt5+rKkvG
	 XnOE1x/8hErdm0zvIkfoqDMXBkxPWC7SHpEWfIIz5ehFokp2SpMBJLVauGg4Wrwa1K
	 jBIBBzdRg7Yrw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id DA94340961;
	Sat, 13 Dec 2025 20:10:55 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 4716B2C1
 for <buildroot@buildroot.org>; Sat, 13 Dec 2025 20:10:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 392128188A
 for <buildroot@buildroot.org>; Sat, 13 Dec 2025 20:10:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GrGCK7dKhust for <buildroot@buildroot.org>;
 Sat, 13 Dec 2025 20:10:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 2E0DF8187F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2E0DF8187F
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2E0DF8187F
 for <buildroot@buildroot.org>; Sat, 13 Dec 2025 20:10:52 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id E10535FFBA;
 Sat, 13 Dec 2025 21:10:47 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 13 Dec 2025 21:10:47 +0100
MIME-Version: 1.0
Date: Sat, 13 Dec 2025 21:10:47 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
In-Reply-To: <20251213115630.1277092-1-bernd@kuhls.net>
References: <20251213115630.1277092-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.11
Message-ID: <8d341e59f51096515e4ee6c0f81b2f49@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1765656650;
 bh=MSxsF+7zojHFgNbNlgCMxKDZJeryQ6Yv+gJcKeMU70U=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=ptN6WUcI2t2oxYhD+KNj7MRdWhKbYCTCGfNbD+hQqLgYrsjWNJJfBHE/F75wePWp6
 jaZEzDHjhBiiOXlFaFiXV23f8o5/LDwtnXx35Yo87Z1Lk7yVc9Tci01cGf97aZcNer
 2I+Ps5+uOGsqAVxDJn18RESQb2Hfap+wvs2eShfQ+N6oBRSFPaKjeVr38xBBHAwd/Y
 QXXrXN3DYIuz6pOw3JcCk9CmXmjJ07F3xjF42EI2DbX28+7zWWyjOtoYxx0FkKdaM4
 VCcWxUDT2Ug9Ytkd1efkBhkBkaeV0iFg5PqJWshjO/SmaZqqzWfaUB9jzSU/J1N4gy
 SWgbjZ/i8+5Og==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=ptN6WUcI
Subject: Re: [Buildroot] [PATCH 1/1] package/cmake: bump version to 4.2.1
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

On 13/12/2025 12:56, Bernd Kuhls wrote:
> https://cmake.org/cmake/help/latest/release/4.2.html#id1
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
