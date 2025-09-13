Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5196BCAC592
	for <buildroot@archiver.kernel.org>; Sat, 13 Sep 2025 22:47:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 109E84122C;
	Sat, 13 Sep 2025 22:47:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0DT4YHxHTfD2; Sat, 13 Sep 2025 22:47:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3F1BE4122E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3F1BE4122E;
	Sat, 13 Sep 2025 22:47:24 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 6A485117
 for <buildroot@buildroot.org>; Sat, 13 Sep 2025 22:47:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5C69D41223
 for <buildroot@buildroot.org>; Sat, 13 Sep 2025 22:47:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ej7XmqhWkCLZ for <buildroot@buildroot.org>;
 Sat, 13 Sep 2025 22:47:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org B1A7C41222
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B1A7C41222
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B1A7C41222
 for <buildroot@buildroot.org>; Sat, 13 Sep 2025 22:47:21 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 321BC13F88F;
 Sun, 14 Sep 2025 00:47:18 +0200 (CEST)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 14 Sep 2025 00:47:18 +0200
MIME-Version: 1.0
Date: Sun, 14 Sep 2025 00:47:18 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20250909171516.848091-1-bernd@kuhls.net>
References: <20250909171516.848091-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.11
Message-ID: <4eee978d2839f041da348967b33ad31e@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1757803639;
 bh=FBGSmQG4JAO5AN9JlX1qFhISMZelUzU6m+MMh0TbqxE=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=uH7mb178iOjFBpIFBYEU5/lfRyjXdqU5nKNeW18xn4BVHl3RRk3xoKcgRZCYjwy7v
 hD/q7SvX2Sjl5jiFu4FNuR5wWfJmTilrzu/4thrRbRNJuj6JLY6jlURpvhDE9wqHDf
 oMGmYBhTx7xD2MhK5G6wJ9+F5iSIO4eLFFrLiTofReNdmnwAyoNcGHzYzR7aTPg6F7
 8idxUvlwKtGU4ONXhlKdDs+6n1yLTgzvdp02Wffnj/EIGjBbNHJOomeu9DGQlfqpFm
 jmQP157oo73ucvG7w5A6Z4nhrgnYKbIbLJCltj1QIgEk201iTpzld3S3Kmo6ORnu1c
 4KWk5ZqwLhFfQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=uH7mb178
Subject: Re: [Buildroot] [PATCH 1/1] package/kodi-pvr-hdhomerun: bump
 version to 21.0.4-Omega
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

On 09/09/2025 19:15, Bernd Kuhls wrote:
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
