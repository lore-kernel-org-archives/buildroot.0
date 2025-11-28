Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59D62D116E2
	for <buildroot@archiver.kernel.org>; Fri, 28 Nov 2025 21:39:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0F35C414BB;
	Fri, 28 Nov 2025 21:39:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uc1LJnDtQwF4; Fri, 28 Nov 2025 21:39:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 175F14147E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 175F14147E;
	Fri, 28 Nov 2025 21:39:31 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 664C4273
 for <buildroot@buildroot.org>; Fri, 28 Nov 2025 21:39:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 57DB3400A9
 for <buildroot@buildroot.org>; Fri, 28 Nov 2025 21:39:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QE4pvIp3MekB for <buildroot@buildroot.org>;
 Fri, 28 Nov 2025 21:39:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.4;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 2D89F4002B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2D89F4002B
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2D89F4002B
 for <buildroot@buildroot.org>; Fri, 28 Nov 2025 21:39:27 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 9757F19F5BE;
 Fri, 28 Nov 2025 22:39:23 +0100 (CET)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 28 Nov 2025 22:39:23 +0100
MIME-Version: 1.0
Date: Fri, 28 Nov 2025 22:39:23 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, James Hilliard <james.hilliard1@gmail.com>
In-Reply-To: <20251128183119.3254445-2-bernd@kuhls.net>
References: <20251128183119.3254445-1-bernd@kuhls.net>
 <20251128183119.3254445-2-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.11
Message-ID: <0307cc4cd94354470ed43dcf8ca551a9@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1764365965;
 bh=GGz7DIjvKfk7SpAKYTsD5+T3DP0ltB1G7T2y5WWkCw0=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=gWqP8FEgSHCEy83kpcLq6RNhCdDoocuOMWhE9fnxeCTLuLWpqT9PtcXwt2vZ0k60c
 Sq3lsn4n+XA9D4Vy2EdmBcS7qdCSm+7Ti6oSniUvixX0wTACYqN0/M01R60qT4vyFE
 glWbEzJu0Vgm1QkIyyhvtxguxh3nXmijZFbGJ0feZWIWC8OSUlvDecy6OJr1Iya295
 BIkmZJEURUtMtJyFP9yiSMXocVP57IkkNM1rQOF5oGiG+vytkPlRpSqKd+NxUhg+kZ
 1i/TvnUW6S5UVzQnd6v5YTLBTsR3nHN7h3Y9LUy4FUepsffDNYpnQUIuK1tBwFYHqV
 1CfoDP2s4OPsg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=gWqP8FEg
Subject: Re: [Buildroot] [PATCH/next v2 1/2] package/python-pyicu: bump
 version to 2.16
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

On 28/11/2025 19:31, Bernd Kuhls wrote:
> Changelog:
> https://gitlab.pyicu.org/main/pyicu/-/blob/v2.16/CHANGES?ref_type=tags
> 
> Needed for compatibility with ICU 78.1.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Series applied to next, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
