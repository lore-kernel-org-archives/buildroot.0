Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00FF1E7719C
	for <buildroot@archiver.kernel.org>; Sat, 11 Jan 2025 17:30:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C562F606E9;
	Sat, 11 Jan 2025 17:30:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Kls8KC4BFdLq; Sat, 11 Jan 2025 17:30:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E7904606ED
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E7904606ED;
	Sat, 11 Jan 2025 17:30:09 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 5D1F9952
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 17:30:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4BD29400DD
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 17:30:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KZZwh5pDnTID for <buildroot@buildroot.org>;
 Sat, 11 Jan 2025 17:30:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.6;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 8BADA40017
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8BADA40017
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8BADA40017
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 17:30:07 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 67568780509;
 Sat, 11 Jan 2025 18:30:03 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:59932])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 11 Jan 2025 18:30:03 +0100
MIME-Version: 1.0
Date: Sat, 11 Jan 2025 18:30:03 +0100
From: Julien Olivain <ju.o@free.fr>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org, Mauro Condarelli <mc5686@mclink.it>
In-Reply-To: <20250111125931.2456371-1-james.hilliard1@gmail.com>
References: <20250111125931.2456371-1-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <2e1f9f027f317a1f4d6807a62b38fcb1@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1736616605;
 bh=Ux9A5LBX73ViK/+y2+6UDXub53hOU9S30jtBJjincVY=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=D4JY4p1TKimCO+UeVVheYJALfg8YYPBUHNg/dCyWptIZGvqbWsKFMiqIccmQa3SII
 CjciiBOJJDQRgqsXFaudRoKI6Q2Kb2uLVkd0dK62o0wmxFkhC3itt7/FDjRZxu13KK
 QmSaCPS8Jf3JMrR2CIQgTpa3gtG+v5oAcgTNDm18pqqS9H1CGA1bblm0rVaZQoCzub
 iS85qizkuUjONzo6owli4KTA2X7uhH3c2HumZ5mHZz1eV96TI+6yeovoYbTg17ovTv
 nVkXmT7Bvd9C/nhLbCzu3bwrdeI4MSDYgwPCQy0zHxvu3Aqp0kXJ2lAGyb+V7uyWvf
 Dqg3ZJt4tAdow==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=D4JY4p1T
Subject: Re: [Buildroot] [PATCH 1/1] package/python-lmdb: bump to version
 1.6.2
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

On 11/01/2025 13:59, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
