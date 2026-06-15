Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 351FCCD98C5
	for <buildroot@archiver.kernel.org>; Mon, 15 Jun 2026 17:34:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D02F661458;
	Mon, 15 Jun 2026 17:34:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id e-myJDyf1Kxg; Mon, 15 Jun 2026 17:34:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7470260C29
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781544889;
	bh=mKAW8EOlcWqOMXCphIdecoae8M+oldJGv7/Q8bJL0Wg=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=itUFvl1Nty83o34y8Rbi+t0tGIb3/fnhV73k44ARPIospUjzRKK1qyn99rdrteMry
	 Z9oUzoG5wfmoMwTXr2wB0O6QQhUSJ4jEII/9QGL4UW3cxGgROzqJBQkL9v07i/UpR0
	 SEYaU7JVu4BoyeigrB5xz6k3OurFD5+//+9RxjyBN/w9vY+7+00sqExgvwmVrL5Ye/
	 LbMdJUGMiRHv3UqePHqxTKYy3AQNSNTF7Md+kEs6L6/yoyElZHXGs80EEbXC0spQZI
	 otxI0hB8ggBLNLA3tIAQ91w5jMjf7SHbLCvD4rdjYLrT0IZ3U/p4c3gj0KBy1VvZsG
	 vpdTo7enbp3ug==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7470260C29;
	Mon, 15 Jun 2026 17:34:49 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id B6F19169
 for <buildroot@buildroot.org>; Mon, 15 Jun 2026 17:34:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9DF078329A
 for <buildroot@buildroot.org>; Mon, 15 Jun 2026 17:34:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 04DLPO1qJ4Zj for <buildroot@buildroot.org>;
 Mon, 15 Jun 2026 17:34:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 0601083147
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0601083147
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0601083147
 for <buildroot@buildroot.org>; Mon, 15 Jun 2026 17:34:44 +0000 (UTC)
Received: from [192.168.178.20] (unknown [212.37.174.96])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id 760902C831B6;
 Mon, 15 Jun 2026 19:34:42 +0200 (CEST)
Message-ID: <78638fc2-4100-4be8-a108-28631d2d9941@bubu1.eu>
Date: Mon, 15 Jun 2026 19:34:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 buildroot@buildroot.org
Cc: Joseph Kogut <joseph.kogut@gmail.com>
References: <20260615161707.1944489-1-giulio.benetti@benettiengineering.com>
Content-Language: en-US
In-Reply-To: <20260615161707.1944489-1-giulio.benetti@benettiengineering.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1781544882; bh=roCkOtHKZX6YEEXD5GeEzvza1a3n7iMlzO8RbjeIBqI=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To;
 b=G0zbIfQVsLHVfyvFsiPUBoHlLdjdZl50PEYWVtOW90e1cevEDRV25Fegw9ZQUabiC
 6bYgQ3GH+vU1cgbsUKXab/d3vk44qjxYlX/5Gw8U7lDNAfjXdfu/wh8q2VoDhgFM71
 MkEux3nAPgFKjZV4UUJlTwxqoScNmuQjw0hJ4LIfpudHrP5srhw6UPmXbBlH4/npuy
 Q6jNaQQ8lYpJRN/RbUFNgFMCtgPuJ8tlIWyTbCUNc1t7BWFUbK2NjVL2XpK4IPOczF
 iRutMY5yTHpq6MI7r4nzBRoxoQ7Ub5Jc2dAmTtxm11mY0s2/viOrvmHafs76QWqjDX
 BhHSFRIY6XdMg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bubu1.eu header.i=@bubu1.eu header.a=rsa-sha256
 header.s=bubu header.b=G0zbIfQV
Subject: Re: [Buildroot] [PATCH] package/libnss: bump version to 3.125
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
From: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Reply-To: Marcus Hoffmann <buildroot@bubu1.eu>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 6/15/26 18:17, Giulio Benetti wrote:
> For release note, see:
> https://hg-edge.mozilla.org/projects/nss/file/836970ddd36ab1076ae0958e76bd948d9d67f2da/doc/rst/releases/nss_3_125.rst
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---
Applied to master, thanks!
Marcus
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
