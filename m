Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D7A9C982C1
	for <buildroot@archiver.kernel.org>; Thu, 17 Sep 2026 07:45:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E8D5A80EDF;
	Thu, 17 Sep 2026 07:45:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xQK-VD4_Cmwe; Thu, 17 Sep 2026 07:45:21 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 251D780ED8
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789631121;
	b=sSqETb/K4mwm9Smmyt3XHImRpMcR2YXWcY1TYQRMc1M2cmkh8fowZgxnVYKimTKS/Uyb
	 cZQLtCfsasjsd01vWQhCqqA1K9LN48mPISVj8ZFFayDqzQqrHw4zDwkzF0hP44ig7R8Bw
	 ji6xTY7Xe0aniVvulZpSTB4PgoYDAYl4I6PCQSPRkU04Zv2gQqY/uiGXoQxOSjcIFrDiA
	 ZfHtckUow7ymA6yBRkk+6sPYvvUoo4l9/SDZozdLqf8yi0nq/HpAKpGilwzmhlxbwOaBg
	 KqeLiTa2aduX/+1FnEdz716e/gYOub2/rlh8qWoQwass2MaBf5dpRzEP1C2evoBBVoA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789631121;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=ulmM6adnBiUSTlGiQRbhHVmjm9a5NH9a0UadM5+x/as=;
	b=bvl+oX9KkMqWby3GLG3nKjpm6gGrQbe4b8LddSXcEyHOjKcwAazszAz+kPn0ZW2AwyW5
	 Vo3GG6iU8zWlcGgiTj2oJdXG7u1GPvIhReZgcB2hQWblI9n7xBzjd8gTi3Hd9M4zMTl/+
	 9Os5w6EAAUka9ZErdyIOApDTeGdPrnnJlKWeHs434fwH5v34giu3HYfcHmuG/A4rCIeaO
	 p8B4Ng5iBSwClI+D4/nqPRmyJRhU1uBEgCfbYWrH70jSqxj77GiLSXayFuL58jWtMI5sK
	 JTL3jvg75/X2DbtMeRLXpBogFObpOxog6SuHl+couyA1MtGAt9aaNnMsU7aK3Jo3xNA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789631121;
	bh=ulmM6adnBiUSTlGiQRbhHVmjm9a5NH9a0UadM5+x/as=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=jQPyETsAhbfam1hVWHDDUxN3YEwXjlVglaWMaIceJeWPuEhmCLujan5EK0G+qbJCJ
	 qPjzZGay806NVhsxRady1oJVok9yAqhnfBFuZyslzctXDUyjA8YXiC9a3HLu92HWg0
	 Yn4wpmZK0GdKcRz7I5jNW/pt4gK+30cK6alhLHiQs499XEHxzVrMU3p7jWugwpSVHr
	 bv+ya4mhNuzDLiArswHnbM4qri49vM+XsMvimf+4qdKU4h2qN8Mi9k20n2rqQzEES7
	 jy5OPFlV8IUdO+a3p7s2aay2cKeucY/tlNcTCGSTDBcA4iymtxFZuUa4tkLwnEqv9k
	 7/JBZHiOE3gNQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 251D780ED8;
	Thu, 17 Sep 2026 07:45:21 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id E560F24D
 for <buildroot@buildroot.org>; Thu, 17 Sep 2026 07:45:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CB3B96081D
 for <buildroot@buildroot.org>; Thu, 17 Sep 2026 07:45:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id D1qdrTmVLKnQ for <buildroot@buildroot.org>;
 Thu, 17 Sep 2026 07:45:19 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 0F97460807
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789631119;
 b=opWJPmZB+3pN4Sf3qtDuKWjuuLiwtxVMWGgrglAZo6ovFA5+U5n56yf0Uc8earZz3JPi
 o1g/VeOx2KWItB8kp8l/7YoeJWtl6pi37Sc/UIiOmuUq5VW3SsBYbdvZwAru10zv3ue4k
 RRion3mbHHyo7bdAH+SpjTAVV+tapFnp9lOAEOgxl0Y7eEciiLrPYmamX1h5a7wDLVeib
 IEhEvNDT4/G/aRHxEaiz2/tUHoV2ra+fIwDKLnFRLbxSkzMrbeK2xucUgzAm0TevQywRO
 3fwYGRB872BXO6YcSZkx+4mb01uPLFT2q2lldkD9U1wW8xd2Q2yq8LZ9R3UZlssdDvw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789631119;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=+6msdFbxRRsVrMxxjsEfZ8IKAIsFfRFCYRTTSH5eHHA=;
 b=pzhoY8qgTPK+1qs89rF8bKU2T7lWsqJFFNJeaFKYFdWsj7JxKm96DNWmYnUJBkPrRM50
 yoWcezmWDtL82kPvlOEL0iJwYLUTfuJT2bm50U/h9cqQdcUFjXZrBTtY5YE68NxtszW7g
 RYvsLo3ozXk/P7r8CDhb5R+UE1ir5kFMwQ9088c0W6AXpHB0mbWe1hKcayM6Yh1ZLMdiM
 ExhbX5tWG2GITnzT1Ix06jzH49mK/TibTCJUhI5rTVFVplUyyqWhuTtwTi7q6zlQcwalV
 kamvh/SqBFIYtgMNjTn4sm8ZhXKGQuWoMdsM1NAB7s6hMwRLV0FJE0+Wn7Y5r+MVLlw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=bootlin.com; 
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=aosJ7S4+; 
 arc=none smtp.remote-ip=185.246.85.4
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0F97460807
 for <buildroot@buildroot.org>; Thu, 17 Sep 2026 07:45:18 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 98F334E40786
 for <buildroot@buildroot.org>; Thu, 17 Sep 2026 07:45:16 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 6D7115FAA3;
 Thu, 17 Sep 2026 07:45:16 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id C758011C7A20E; 
 Thu, 17 Sep 2026 09:45:15 +0200 (CEST)
Date: Thu, 17 Sep 2026 09:45:15 +0200
To: Joachim Wiberg <troglobit@gmail.com>
Cc: buildroot@buildroot.org
Message-ID: <aquaiHMwYOgXAD5Z@windsurf>
References: <20260914085828.3291832-1-troglobit@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260914085828.3291832-1-troglobit@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH 1/1] package/mdnsd: bump to version 1.2
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, Sep 14, 2026 at 10:58:28AM +0200, Joachim Wiberg wrote:
>  - Add support for running as an uprivileged user
>  - Fix undefined behavior when caching malformed records
> 
> Release notes: https://github.com/troglobit/mdnsd/releases/tag/v1.2
> 
> Signed-off-by: Joachim Wiberg <troglobit@gmail.com>

Applied to master, thanks!

Best regards,

Thomas Petazzoni
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
