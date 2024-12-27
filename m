Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D57E3E7718B
	for <buildroot@archiver.kernel.org>; Fri, 27 Dec 2024 10:43:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6E02480C31;
	Fri, 27 Dec 2024 10:43:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Wc16sBoD4esQ; Fri, 27 Dec 2024 10:43:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8E5D280C32
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8E5D280C32;
	Fri, 27 Dec 2024 10:43:41 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 190EE757
 for <buildroot@buildroot.org>; Fri, 27 Dec 2024 10:43:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 06E0E40252
 for <buildroot@buildroot.org>; Fri, 27 Dec 2024 10:43:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VUab6s6Ia19w for <buildroot@buildroot.org>;
 Fri, 27 Dec 2024 10:43:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org BCBE740246
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BCBE740246
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BCBE740246
 for <buildroot@buildroot.org>; Fri, 27 Dec 2024 10:43:38 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 85503B00573;
 Fri, 27 Dec 2024 11:43:34 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:59784])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 27 Dec 2024 11:43:34 +0100
MIME-Version: 1.0
Date: Fri, 27 Dec 2024 11:43:34 +0100
From: Julien Olivain <ju.o@free.fr>
To: yegorslists@googlemail.com
Cc: buildroot@buildroot.org
In-Reply-To: <20241227081342.2415503-1-yegorslists@googlemail.com>
References: <20241227081342.2415503-1-yegorslists@googlemail.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <b75c75efc8dab3fa29b2d044cd9394a1@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1735296215;
 bh=ABPG+8D6yGakX4odrsMBCF9XTD/IlfxeQ3cKFswjLrU=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=lxoUxRwocqykkFgDmF6cinMc/06VMZ+LnypGzvDoUta+JVFXLtwadYfY8IkLKBe7L
 AfoNlnpkgWvPX8OXqLQ/PZ6+ay2ZIQtRcq63DNf+OrviFJwa77X05luAfBlFyqh0pj
 RT/rxwVVg7DvD1Qci8gI2MgEA2KPQrW1N/LC8+E/r3jx1fbV8Xl1xB2fgx8lVRokoD
 MQOhBqvVI83ms074LTZcIdvhPirPA/w2i5PnB6lcmXso2mJ3mnRkrVgCLfr/QTFc+L
 ACSELBp5oCywwQ5YmrQmxx2p83bkMKISCbF4ycSNB7OqekuPFPzK+LtXFqeGayWUf9
 wPsHry1zCLq8A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=lxoUxRwo
Subject: Re: [Buildroot] [PATCH] package/kmod: bump to version 33
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

On 27/12/2024 09:13, yegorslists--- via buildroot wrote:
> From: Yegor Yefremov <yegorslists@googlemail.com>
> 
> Remove an upstreamed patch.
> 
> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>

Applied to master, thanks.
I also added links to release announces in the commit log.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
