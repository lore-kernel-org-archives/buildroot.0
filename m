Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71B03CF58E8
	for <buildroot@archiver.kernel.org>; Wed, 19 Nov 2025 20:35:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8CB496111E;
	Wed, 19 Nov 2025 20:35:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Dl3uO9y3eyVs; Wed, 19 Nov 2025 20:35:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D17C16085F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D17C16085F;
	Wed, 19 Nov 2025 20:35:56 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id D82FF37D
 for <buildroot@buildroot.org>; Wed, 19 Nov 2025 20:35:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C99EF6085F
 for <buildroot@buildroot.org>; Wed, 19 Nov 2025 20:35:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2Rr0QkzSPX-W for <buildroot@buildroot.org>;
 Wed, 19 Nov 2025 20:35:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org C2CF3606CB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C2CF3606CB
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C2CF3606CB
 for <buildroot@buildroot.org>; Wed, 19 Nov 2025 20:35:53 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 8FF0AB0053D;
 Wed, 19 Nov 2025 21:35:50 +0100 (CET)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Wed, 19 Nov 2025 21:35:50 +0100
MIME-Version: 1.0
Date: Wed, 19 Nov 2025 21:35:50 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20251119202016.563421-1-bernd@kuhls.net>
References: <20251119202016.563421-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.11
Message-ID: <23b82ca316349720d395ede35ba6b01e@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1763584551;
 bh=JOvcYWsIoap7F50s6v6XbHKfPrOt00JMBLLw1DH0FMw=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=B1L40xUmpNhaLuzPJ8AwxTjqGhfbeTxj/1aI2Li3ThnTu4e0pXOzgUVpdDAMKaN9g
 ad7bB5pJxJPIhNEa3T/0B//KIgH7HHc95YzjJQCJ7gIs19Lx2WcRgMoHzYI09qt2g0
 2nr0m+NIXNfmMg/HRRke6eXZYHOsnGX6gg4lCgDMYr/gtIL9/eF4mVuuiat3MZwhhK
 98z3/XtMChX/a5FubkWcZ5nUheTfAp1V7sf2WgebsHtGNhKDYSPQCQnNE7iA1qR33L
 iHAQJY/PyokmTiRV15GRjczuVw/8eK5SM34WibBCPXoHnB1ijkPDbLoMII1orOgmVU
 KCX6wCJ2P9zog==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=B1L40xUm
Subject: Re: [Buildroot] [PATCH 1/1] package/openvpn: security bump version
 to 2.6.16
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

On 19/11/2025 21:20, Bernd Kuhls wrote:
> Fixes CVE-2025-13086.
> 
> Release notes:
> https://sourceforge.net/p/openvpn/mailman/message/59261309/
> 
> Changelog:
> https://github.com/OpenVPN/openvpn/blob/release/2.6/ChangeLog
> https://github.com/OpenVPN/openvpn/blob/release/2.6/Changes.rst
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
