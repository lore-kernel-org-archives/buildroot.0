Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66078FEE4EF
	for <buildroot@archiver.kernel.org>; Sat, 28 Feb 2026 16:06:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3C1F8417FF;
	Sat, 28 Feb 2026 16:06:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AyCtim17mEk3; Sat, 28 Feb 2026 16:06:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F3FF8417F0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772294775;
	bh=mkqUexQgqsjvV+e/214iWAnvjdCNiZhn5k2lT97adAY=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=EfFOQ4l8Ft54gZyB1uQcwB0aCCD30JtA26oCWNlIQAy4mb9bWYCXmR9j1/8A2quK3
	 UG6Y4U8EtdP9uc0sySZdeaulPWWPlU7PB0A41rSx2N6R04UMTQvlkhD/pV9bDIOhW/
	 0qw1Ju9m8oCg+vahnBL6CYChu44KMro7q35shTi+aNnAiRhbKeUDmEq7trWaYfUOkT
	 npnUDo2z25L6LAePWcEbkCykhiRcZEEwT27XnbtKbi33X7WjB9GP34itt4BMZdj9nU
	 ClHwHHG544/mKODH+6lTIa5JU1856K3e1WWGvBllfcaq2oK9PrbutRzWGrstSSyo8E
	 qb6hcL6Ynm1+g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id F3FF8417F0;
	Sat, 28 Feb 2026 16:06:14 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 982DA1EB
 for <buildroot@buildroot.org>; Sat, 28 Feb 2026 16:06:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7DC2C60B15
 for <buildroot@buildroot.org>; Sat, 28 Feb 2026 16:06:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aE8Nz0kdKmq1 for <buildroot@buildroot.org>;
 Sat, 28 Feb 2026 16:06:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org A577660752
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A577660752
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A577660752
 for <buildroot@buildroot.org>; Sat, 28 Feb 2026 16:06:12 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id CC715B00579;
 Sat, 28 Feb 2026 17:06:08 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 28 Feb 2026 17:06:08 +0100
MIME-Version: 1.0
Date: Sat, 28 Feb 2026 17:06:08 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20260226203658.3538998-1-bernd@kuhls.net>
References: <20260226203658.3538998-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.13
Message-ID: <91840b5a361b1c3b9fff33e0dc87457e@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1772294769;
 bh=IRualKljbAcsv0lpDjAuhBCe19BAbdNu6esEngSBWWA=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Y+RF3fh1xbBjaptmrIZ0U/NkuUnG6C2ASWSG+llPdRCklKricKCaOyIKzJvGvDUzv
 w1JC5O+G1RuilarI6RtyGOKfr0lr2Oek6BoVu5KXkOAUa/4rrFwTw9vMa8nvhzWHQW
 QuvYyO8OgeJuLqTGtbsATilSrLIyPt8lPxZ+Aqayc6H3JdyBkzVOkZDn2V3AjyV6nA
 VU9NiLP2rdu+pqd6NLznACWtApfyzXhqBvykzPvGLH9tRM+IOTShhjt5ZPtQ/PvA3i
 Pmxs9MUmRoMma/RuRK8Ok7ydyEYyGCD3T1h6hVmUSDOQ8pyB6v5qRgHYRskVjHjv2A
 WzurFCBBNYlDw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Y+RF3fh1
Subject: Re: [Buildroot] [PATCH/next 1/1] package/transmission: bump version
 to 4.1.1
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

On 26/02/2026 21:36, Bernd Kuhls wrote:
> https://github.com/transmission/transmission/releases/tag/4.1.1
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to next, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
