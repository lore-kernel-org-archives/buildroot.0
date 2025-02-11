Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FED6C0219B
	for <buildroot@archiver.kernel.org>; Tue, 11 Feb 2025 18:24:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 329B64068A;
	Tue, 11 Feb 2025 18:24:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GhCmaJoOFBpT; Tue, 11 Feb 2025 18:24:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0E18E405D5
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0E18E405D5;
	Tue, 11 Feb 2025 18:24:18 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id EA6576C
 for <buildroot@buildroot.org>; Tue, 11 Feb 2025 18:24:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DA94B82089
 for <buildroot@buildroot.org>; Tue, 11 Feb 2025 18:24:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id A7wZjCQgX97L for <buildroot@buildroot.org>;
 Tue, 11 Feb 2025 18:24:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::13;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org C9E8582059
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C9E8582059
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C9E8582059
 for <buildroot@buildroot.org>; Tue, 11 Feb 2025 18:24:15 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 578AE19F576;
 Tue, 11 Feb 2025 19:24:11 +0100 (CET)
Received: from 2a01:e0a:485:b220:8213:2270:4a8d:a1d5
 via 2a01:e0a:485:b220:8213:2270:4a8d:a1d5 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 11 Feb 2025 19:24:11 +0100
MIME-Version: 1.0
Date: Tue, 11 Feb 2025 19:24:11 +0100
From: Julien Olivain <ju.o@free.fr>
To: Peter Korsgaard <peter@korsgaard.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20250211163748.2029763-1-peter@korsgaard.com>
References: <20250211163748.2029763-1-peter@korsgaard.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <c8a097572d1ec80f4d1559ed848fec57@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1739298252;
 bh=UYQynD0nEOjcyBJWZhjaAvJq+RjSedmbvYwVtlZzPM0=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=M6WyIdElfaYuDzH7BRlbe2E+dorHYKG0V6dNaLSx3EJ+fMslP40CO6zHkbfLsb/Zw
 Wc2IneNP9Wy9BLuXlT4ko1DbrerYbk3JF6h3ez+kKIZB3ARLD9c1Q6/6tR47XAr7qg
 abtRzKB1rwN868NrnbaNVQhHbpyQfsfnR7qq3MUGjYgoiiUCDnLFBoA1jswVRupQ6r
 IAoanVL/YQu+mq8Z/PrsTiijr4N2gYdMlrT1G0oR+tE10vgAFOt3X849zH9PYlk3Ev
 r4ctLMfuUWT2DVXPhEkm0j5pud4juHg4NzSM0IY5fFL6f3KW/3At1+3lG6ZrKdyd0k
 H1IUwEkGG0SKQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=M6WyIdEl
Subject: Re: [Buildroot] [PATCH] package/libopenssl: security bump to
 version 3.4.1
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

On 11/02/2025 17:37, Peter Korsgaard wrote:
> Fixes the following security issues:
> 
> CVE-2024-13176: Timing side-channel in ECDSA signature computation
> https://openssl-library.org/news/vulnerabilities/index.html#CVE-2024-13176
> 
> CVE-2024-12797: RFC7250 handshakes with unauthenticated servers don't 
> abort
> as expected
> https://openssl-library.org/news/vulnerabilities/index.html#CVE-2024-12797
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
