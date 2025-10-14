Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF640CCD184
	for <buildroot@archiver.kernel.org>; Tue, 14 Oct 2025 18:46:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C912B83DF6;
	Tue, 14 Oct 2025 18:46:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NgYzeZPbH7yz; Tue, 14 Oct 2025 18:46:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 33CD880E52
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 33CD880E52;
	Tue, 14 Oct 2025 18:46:56 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 4EA71294
 for <buildroot@buildroot.org>; Tue, 14 Oct 2025 18:46:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3FD6741520
 for <buildroot@buildroot.org>; Tue, 14 Oct 2025 18:46:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xXDh2YUXQdBU for <buildroot@buildroot.org>;
 Tue, 14 Oct 2025 18:46:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 945E2413AE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 945E2413AE
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 945E2413AE
 for <buildroot@buildroot.org>; Tue, 14 Oct 2025 18:46:53 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id EC74BB0053D;
 Tue, 14 Oct 2025 20:46:43 +0200 (CEST)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 14 Oct 2025 20:46:43 +0200
MIME-Version: 1.0
Date: Tue, 14 Oct 2025 20:46:43 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Attila Wagner <attila.wagner@onyxinsight.com>,
 =?UTF-8?Q?Rapha=C3=ABl_M=C3=A9lotte?= <raphael.melotte@mind.be>, Andrey
 Smirnov <andrew.smirnov@gmail.com>, Grzegorz Blach <grzegorz@blach.pl>,
 James Hilliard <james.hilliard1@gmail.com>, Bartosz Bilas
 <b.bilas@grinn-global.com>
In-Reply-To: <20251012182016.2711834-1-bernd@kuhls.net>
References: <20251012182016.2711834-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.11
Message-ID: <4f673572edad6689a0a1da74103ea2ae@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1760467611;
 bh=6trrdNs35tG0B5TYWWrqcPF1h3wExEkmmrGZKt4LOPs=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=cEcjYUwSqyJmbNyCaUO+TIp5OGLikW3nIYnnXiRCe38mBmm9Mk7p1WzelcKBuKrZ+
 Txq1xVpOIkWW+uTlFX3JS1oqb/LFUaNMZePanaEK1ruUpGmIELiAnhzZYZaduHSAxe
 p5p2RXF1BblLn271uZ+A4PVY8UjBk/XRt4eolj20VIIb8POqmIE7aqdxL1ahRBVdy6
 4YLE87CokZYpXqicr2oQ33i4qnqEZhl4gifbyorbotOaBbBk+zrfStvdwcyGCyvE+0
 PKEzpfTQfNVENpgKyYqzl+cEPx1tfX5HGONI3WC0+UsxJnuWVP+oH5yGTxAwSlOnMa
 3ZDoWpYwax+wg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=cEcjYUwS
Subject: Re: [Buildroot] [PATCH 01/21] package/python-aexpect: bump version
 to 1.8.0
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

On 12/10/2025 20:19, Bernd Kuhls wrote:
> Removed patch which is included in this release.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Series (except the automat bump) applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
