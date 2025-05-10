Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAF0EC3ABC3
	for <buildroot@archiver.kernel.org>; Sat, 10 May 2025 20:16:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 782ED820B8;
	Sat, 10 May 2025 20:16:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9rveA6Eh3T7R; Sat, 10 May 2025 20:16:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AEC5883422
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id AEC5883422;
	Sat, 10 May 2025 20:16:06 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 20AB1154
 for <buildroot@buildroot.org>; Sat, 10 May 2025 20:16:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 06268833B7
 for <buildroot@buildroot.org>; Sat, 10 May 2025 20:16:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jt63mr64zzEG for <buildroot@buildroot.org>;
 Sat, 10 May 2025 20:16:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.4;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 6B33A820A3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6B33A820A3
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6B33A820A3
 for <buildroot@buildroot.org>; Sat, 10 May 2025 20:16:03 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 8855019F54D;
 Sat, 10 May 2025 22:15:56 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 10 May 2025 22:15:56 +0200
MIME-Version: 1.0
Date: Sat, 10 May 2025 22:15:56 +0200
From: Julien Olivain <ju.o@free.fr>
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Giulio Benetti
 <giulio.benetti@benettiengineering.com>, Romain Naour
 <romain.naour@gmail.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
In-Reply-To: <20250510181745.1812058-1-bernd@kuhls.net>
References: <20250510181745.1812058-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.10
Message-ID: <59da7999781633f3cb8904e58c3f85bb@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1746908161;
 bh=l4gayA2jN9m/RqtvB88s+KPiDCZ/Vicn4xvUNcBLtJ4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=AAm7ukZ9Ywevcg0PgwiPUd6Ykdnw8z42RHsQ12SEgz9sppuLD0nk2BjFFpMxObL6H
 MEIlY8ZSRl9C+LIJNbSsTQV9gwpDICIDYAr4kXsUE6nOD9N/7smeiGPQljXiKJGBT/
 QZtLwQ4zD5U8VH4kE32NO0AH2YHhYychwxYBNN4ccjIdjPeg4dDvYZOZcqY9S1U4xR
 6vjCiCeRqntqEpfHT1bly5u0JIx9SJr94u+GUWC3Ki2lUSmcrUktUyUtV0KKkLrMXF
 gDchv7oyV96neHY24s6i8Bl+eeT+7sY01EkJvrPn9BW1I1sBmD3Zn44GE8mjJfHJMJ
 EhLCFA/yFPDaw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=AAm7ukZ9
Subject: Re: [Buildroot] [PATCH 1/3] {linux, linux-headers}: bump 5.{4, 10,
 15}.x / 6.{1, 6, 12, 13}.x series
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

On 10/05/2025 20:17, Bernd Kuhls wrote:
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Series applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
