Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B34A9C61CE8
	for <buildroot@archiver.kernel.org>; Thu, 12 Jun 2025 21:15:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 87D0A60D4E;
	Thu, 12 Jun 2025 21:15:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id o1Rs561F7FOO; Thu, 12 Jun 2025 21:15:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CD38960E22
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id CD38960E22;
	Thu, 12 Jun 2025 21:15:13 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 1AD2D1E0
 for <buildroot@buildroot.org>; Thu, 12 Jun 2025 21:15:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0C96381819
 for <buildroot@buildroot.org>; Thu, 12 Jun 2025 21:15:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SrMMCkyyUp5W for <buildroot@buildroot.org>;
 Thu, 12 Jun 2025 21:15:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 6D1AB80C06
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6D1AB80C06
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6D1AB80C06
 for <buildroot@buildroot.org>; Thu, 12 Jun 2025 21:15:11 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id C479B13F86E;
 Thu, 12 Jun 2025 23:15:03 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Thu, 12 Jun 2025 23:15:03 +0200
MIME-Version: 1.0
Date: Thu, 12 Jun 2025 23:15:03 +0200
From: Julien Olivain <ju.o@free.fr>
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Giulio Benetti
 <giulio.benetti@benettiengineering.com>, Romain Naour
 <romain.naour@gmail.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
In-Reply-To: <20250612171117.3475778-1-bernd@kuhls.net>
References: <20250612171117.3475778-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.11
Message-ID: <7e56855c9cf2d5ea9307d63d9c9d5814@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1749762908;
 bh=YaUFmmG5B1J60a8bkaZk93DfC0G2SR6szloYuoB5VFU=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=JioYbuxOf34IpO3L4AkqVDfoc+vcMMllO0i0LnB8V0VEd8BYk64kSC9bnn28E9SjB
 g2mzVvwaMNwhb0qjvMgefvcda2XCpUSkb+NPW1Qq+Blqz2j5EdRmj8semQvzPFJ0cF
 u9LabF5JWgX7tna13vl9IcxrKhng4OJetdorrA+bTkHMZKfVdTypZRK85pbiViAxkc
 mEV+EnJE9tXUOIzL1ACgFbc7tGtMcPD4+mz44q186RTC4Gas+NzncDCHLnmfGlCSCf
 oraGQ4efRu+CutbqbHxJtWXmAkykv4Ch4mXdcRzKMZ3vsY6+UmL/MGwC9Qtp0+V9/r
 cGq85PUMmxsHA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=JioYbuxO
Subject: Re: [Buildroot] [PATCH 1/4] {linux, linux-headers}: bump 6.{12,
 14}.x series
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

On 12/06/2025 19:11, Bernd Kuhls wrote:
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Series applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
