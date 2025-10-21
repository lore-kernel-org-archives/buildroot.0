Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 393D5CCD1AA
	for <buildroot@archiver.kernel.org>; Tue, 21 Oct 2025 20:51:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F3BDC60C21;
	Tue, 21 Oct 2025 20:51:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ILMT6uXgi_2N; Tue, 21 Oct 2025 20:51:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 32D5460D5B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 32D5460D5B;
	Tue, 21 Oct 2025 20:51:03 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 28A2A277
 for <buildroot@buildroot.org>; Tue, 21 Oct 2025 20:51:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1A29B40CF2
 for <buildroot@buildroot.org>; Tue, 21 Oct 2025 20:51:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TL6sk3iLv822 for <buildroot@buildroot.org>;
 Tue, 21 Oct 2025 20:51:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::11;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 2122440323
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2122440323
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2122440323
 for <buildroot@buildroot.org>; Tue, 21 Oct 2025 20:50:59 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id EF72320039E;
 Tue, 21 Oct 2025 22:50:55 +0200 (CEST)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 21 Oct 2025 22:50:55 +0200
MIME-Version: 1.0
Date: Tue, 21 Oct 2025 22:50:55 +0200
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: buildroot@buildroot.org, Romain Naour <romain.naour@gmail.com>
In-Reply-To: <20251020164911.1712014-1-dario.binacchi@amarulasolutions.com>
References: <20251020164911.1712014-1-dario.binacchi@amarulasolutions.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <f314efdb3ac0dcfbb7d0264d52924ec4@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1761079858;
 bh=jrJa8CKrvVLBWf2u2Ev6QAq6VLiXBfzAVLfLf5I1pwI=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=czUwsil8Mtj7IHm2kYUTJ/3XftaQmwfGpMrBP9JSLfIAcg46KupdbH1DqW421Rfgi
 l8sqwNg1oxPorhyojbqXlNR1e9akXixNzUwsmalLVUsLUVRy8Dtcm0EPi58UdcGrMx
 7ThcQzKAtedK+8ZrN+zcJNKgFdGpN/AAIVirlP/IzN9CojiXjTC+tUztiNabw7nlJK
 DpjLKAJ6UG8TXrSsyts+0CtNysqrJsNdqHFuSD60BQ1fQa/B3WiaM7OClMPJpU6LLg
 4ffSLPAap+73nU1NTSXzAUxzkpNHLLPQOQ02YC9V9ogwBV0JZTY7DC2tyELEpWINMl
 0QYnZsxvNbGZw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=czUwsil8
Subject: Re: [Buildroot] [PATCH 1/2] package/libbpf: security bump to
 version 1.6.0
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

On 20/10/2025 18:49, Dario Binacchi wrote:
> The removed patch has been merged in version 1.6.0 fixing
> the security CVE-2025-29481.
> 
> Fixes:
> https://www.cve.org/CVERecord?id=CVE-2025-29481
> 
> Release notes:
> https://github.com/libbpf/libbpf/releases/tag/v1.5.1
> https://github.com/libbpf/libbpf/releases/tag/v1.6.0
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

Series applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
