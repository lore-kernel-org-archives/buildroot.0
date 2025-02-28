Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5ACA3C282C5
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 22:43:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DE17884AFE;
	Fri, 28 Feb 2025 22:39:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IVTDidNqwAji; Fri, 28 Feb 2025 22:39:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 03DD784C87
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 03DD784C87;
	Fri, 28 Feb 2025 22:33:02 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 222531CB
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 22:33:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 96F4E4F72C
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 22:07:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lZCE8TWyONW5 for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 22:07:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 8B4CC5145A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8B4CC5145A
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8B4CC5145A
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 21:50:45 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 5AB4813F879;
 Fri, 28 Feb 2025 22:50:42 +0100 (CET)
Received: from 2a01:e0a:485:b220:8213:2270:4a8d:a1d5
 via 2a01:e0a:485:b220:8213:2270:4a8d:a1d5 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 28 Feb 2025 22:50:42 +0100
MIME-Version: 1.0
Date: Fri, 28 Feb 2025 22:50:42 +0100
From: Julien Olivain <ju.o@free.fr>
To: Maxim Kochetkov <fido_max@inbox.ru>
Cc: buildroot@buildroot.org
In-Reply-To: <20250228064643.91177-1-fido_max@inbox.ru>
References: <20250228064643.91177-1-fido_max@inbox.ru>
User-Agent: Webmail Free/1.6.10
Message-ID: <986fadf42374341522d4a0eef2090904@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1740779443;
 bh=DzBbrqUaHUskO75CWUBet2aT8UgDTI/3LdDvhDHdG94=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=VGSLxPBCBxcCdYHCjzSbfmhEx33yJnNLBKnec+8RKDJZNGFvHUcR8C4YDwnb2NJc0
 tqqirc/q90T/UdlR3hPxxIHmHVaYkq5BEowIr6WT/xnAKCFj0fUfLSl+ytMQGhxxl2
 6nKzxb7vCBca2CanZzu0biCpVYiKO62TesNaklNite5tE3GmACrNwFh8bhiZ2fgQp3
 HsBQqLLx7uiNBmBmFssg4uCjdRdbZcQb459xjsd9NbtodhvzgrDwx/OVao4Iv5xOWc
 I7xeibAfubZMEYjwLKO7wT+bQzNTfRFDyFrgks6h8rYIiEEwKGSUDP6SDpmP4yy5n1
 G0JyFU2z8EziQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=VGSLxPBC
Subject: Re: [Buildroot] [PATCH 1/1] package/osm2pgsql: bump version to 2.0.1
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

On 28/02/2025 07:46, Maxim Kochetkov wrote:
> Release-notes: 
> https://github.com/osm2pgsql-dev/osm2pgsql/releases/tag/2.0.1
> 
> Change URL to osm2pgsql-dev.
> 
> Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>

Applied to next, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
