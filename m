Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 527F7D3B98F
	for <buildroot@archiver.kernel.org>; Tue,  9 Dec 2025 18:45:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C79FC83DA7;
	Tue,  9 Dec 2025 18:45:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XRn3Q_zkEaRy; Tue,  9 Dec 2025 18:45:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2FD7783B80
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765305955;
	bh=KfKGJ8CDFyA1XNFQ245XkQ0sP5UWDKyHHhjtfmZyulc=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=IASLo2g46sS0yquH/Tkz8lqpJgYDEzXcAmCjPrtUwNl46Xws23zSC4Fh6JvKSV/Po
	 cRvgFF1oHxK/nIfhEu9hjX4Nu1wqBJymQonSRAR5b9Y1ywjJeEy54Yaqc2PYzd5QS8
	 fnFTM8grKh7MAmGLz6PMPd7xH/a2n0q1PGY10dlkXlIZSbvxIoE/PQuPR9EBuoM2Iq
	 xcE/MM7RzInsPcUcLWDEf6OikF3RIjEIWYGHAwX4JG8gnrUZjc6pBDxy9Sa3ONXw7g
	 PUq6BPB6a7YectBTKVHjiiowHrx7OurCQrJHADD9AUvtdgdlIkq/HUvxPggoqE9bXK
	 BmbcD9WMjv6GQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2FD7783B80;
	Tue,  9 Dec 2025 18:45:55 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id D44B2237
 for <buildroot@buildroot.org>; Tue,  9 Dec 2025 18:45:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D1FF483AEE
 for <buildroot@buildroot.org>; Tue,  9 Dec 2025 18:45:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2OaD9ER0kw4Y for <buildroot@buildroot.org>;
 Tue,  9 Dec 2025 18:45:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::15;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org EE54B838AC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EE54B838AC
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EE54B838AC
 for <buildroot@buildroot.org>; Tue,  9 Dec 2025 18:45:52 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 3695478032A;
 Tue,  9 Dec 2025 19:45:50 +0100 (CET)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 09 Dec 2025 19:45:50 +0100
MIME-Version: 1.0
Date: Tue, 09 Dec 2025 19:45:50 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20251203180740.2121090-1-bernd@kuhls.net>
References: <20251203180740.2121090-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.11
Message-ID: <077a2a4b6dae5b7cf32fc10f52b80bff@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1765305951;
 bh=g5ncLTASpSE3v3pF29xIGtmFJ1C+5Vd2NdMbYGyzzrU=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=FuvNejaaWTHy6AI/JTnUuYj8FjzWVmcAk0XKmP7KDwmU/1LC2XHLmA4o9DJv12YQk
 qaEoxBsg0QuK39ykDff0Wx9INKRAd8Cx45rRIk6PrOGiRKC7aLw/mfzgiMI2Vmg3O9
 DYKMp4xeqvhB0PHgnVJEtRTx9SdZvuOxD+105TM1Up+yWGeTGJV66CEccyQ5mQzo6F
 lQ7BnO4PFAEQEqcxcRI1PBO07c0h2SQ0EkK2aD6fe7cyzKJftBvEW6TNELeBc91kJq
 74eRNOVr5Jy4rmEKYcIoFiXGEkBLUcGQ7zwaLg1v5e4KsLws3JUg0PkX6ju278OdTu
 Irh+ddxIEWoHA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=FuvNejaa
Subject: Re: [Buildroot] [PATCH 1/1] package/sqlite: bump version to 3.51.1
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

On 03/12/2025 19:07, Bernd Kuhls wrote:
> Release notes of this bugfix release:
> https://sqlite.org/releaselog/3_51_1.html
> 
> "Changes in this specific patch release, version 3.51.1 (2025-11-28):
> 
>     Fix incorrect results from nested EXISTS queries caused by the
>     optimization in item 6b in the 3.51.0 release.
>     Fix a latent bug in fts5vocab virtual table, exposed by new
>     optimizations in the 3.51.0 release"
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
