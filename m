Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 434D1C369AB
	for <buildroot@archiver.kernel.org>; Tue, 15 Apr 2025 20:06:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1318260E45;
	Tue, 15 Apr 2025 20:06:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hlCcWvFNi4hb; Tue, 15 Apr 2025 20:06:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4DF5060E61
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4DF5060E61;
	Tue, 15 Apr 2025 20:06:15 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id E6D05108
 for <buildroot@buildroot.org>; Tue, 15 Apr 2025 20:06:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E261580EF5
 for <buildroot@buildroot.org>; Tue, 15 Apr 2025 20:06:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vKlDPL5zL9vu for <buildroot@buildroot.org>;
 Tue, 15 Apr 2025 20:06:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::15;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 29AF380D73
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 29AF380D73
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 29AF380D73
 for <buildroot@buildroot.org>; Tue, 15 Apr 2025 20:06:12 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 05FC0780503;
 Tue, 15 Apr 2025 22:06:09 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 15 Apr 2025 22:06:09 +0200
MIME-Version: 1.0
Date: Tue, 15 Apr 2025 22:06:09 +0200
From: Julien Olivain <ju.o@free.fr>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20250415194646.2195669-1-thomas.petazzoni@bootlin.com>
References: <20250415194646.2195669-1-thomas.petazzoni@bootlin.com>
User-Agent: Webmail Free/1.6.10
Message-ID: <3064a0f8b5ff697a9ff64df411da4794@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1744747571;
 bh=BanxZNEDfMufSp6O8MHpVNeYvwrU470lo+iOrvLaA3s=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=gsPyDwKWLxmTn3Im2jOHK+VZPqEBsCdiTFISq3bdS5VRjUmAhrb3ICms9m3j12TXf
 idYjG0bSYvFMTjZGFTw6N4mWGXiBYFqNQok/eklElTcr33iHnBw7c8LpceEfMtcHat
 yoNXUIonv4qNr20umSl6Qb6OGH9SJF+Nfc+xkAZKWYhI2Mg6dE5JS6RyVky3RA2NNU
 0V8K85HrUX80c1EYacpT100JH3hhFeb5KPJz1km8S5tQE3e61vd8cSx0qwMAvankKg
 0UKNFD8FrZThMxXD+yZYY53Yt849p7PG9m24s2DAaxC0Lt9DXGwVcvQu/DTvSBFtwJ
 rJCWU15X6ygKQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=gsPyDwKW
Subject: Re: [Buildroot] [PATCH] package/igh-ethercat: bump to version 1.6.3
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

On 15/04/2025 21:46, Thomas Petazzoni via buildroot wrote:
> Changes between 1.6.2 and 1.6.3:
[...]
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
