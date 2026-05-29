Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC984CD6E45
	for <buildroot@archiver.kernel.org>; Fri, 29 May 2026 08:58:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9BAB8421B9;
	Fri, 29 May 2026 08:58:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nJBMpfo47H3b; Fri, 29 May 2026 08:58:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C63D9421BE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780045133;
	bh=YtAWJpZGbRswq2CAwELjylj8uYQJUqPjl05yQ09u8pI=;
	h=Date:To:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=MsUe9de7ZMUtWUowL1vG+Mc6M9ceZQJTltXjaSz7yVCY1uDbfRU0Qvwc0aSypPoUQ
	 bL/i3Bb2co725BRAor10h8vNrXuLHPCCC0HJR9Zjlec/axtrV2ydLXFKWf9WPfS0e4
	 i/pKWG4NSkIQhWQAHaIPE8FE2KRHKkqj6aleasCYUgy7lW2aGSlYURwEsrtn9xFskB
	 NLBjmII2dmum6B4NsWJr2Hh+E51Eeuo+Kw+cUVrkAnIdAaIJ/qtnYCNG+stPG2+lZh
	 Wq9NLKSIiKsXduDmrEPfRvSjrTKnK10FsUUjbcDGV8/LzyiB4cssNxEGUwQQcdSKeb
	 yEPkwc12gh2xg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C63D9421BE;
	Fri, 29 May 2026 08:58:53 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id A3D6E28E
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:58:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A033283C72
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:58:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QHqlai63ZJt8 for <buildroot@buildroot.org>;
 Fri, 29 May 2026 08:58:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 3CBDE83955
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3CBDE83955
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3CBDE83955
 for <buildroot@busybox.net>; Fri, 29 May 2026 08:58:50 +0000 (UTC)
Received: from [192.168.1.80] (unknown [82.65.127.30])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id 5435B2C84123;
 Fri, 29 May 2026 10:58:48 +0200 (CEST)
Message-ID: <1ec968cb-fd8c-4f47-89dc-a8a0c32966dc@bubu1.eu>
Date: Fri, 29 May 2026 10:58:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Francois Perrad <francois.perrad@gadz.org>, buildroot@busybox.net
References: <20260512184826.330381-1-francois.perrad@gadz.org>
Content-Language: en-US
In-Reply-To: <20260512184826.330381-1-francois.perrad@gadz.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1780045128; bh=sIFhrhLfDhPWhKgluz4YgjL/vNQfp547pgsEgkNRPFw=;
 h=Date:Subject:To:References:From:In-Reply-To;
 b=kRDP/qLJN2is2ywL2gGw24o5gwL9eea/b2qjnH0brf9cdO4vVhhsGtA+s3Jt2lGYP
 bFGmqCIsQhHbMXl8QXLz6Ny15VORyxyzuAiumulfjq2zDWdepTZ7GDpJswphSquAwI
 s3yCvIkKMD4sdOQL4olT4ycIPC6mAmjUPo9KekDJtKF/ZBp9cQHxXrVVcNtTBKtmWy
 v8szfaFIcwfuzTuwrN0OoG30WWit9HlzdwGgc2wEjVAL1kz2vttNNPlZIpAZ//anr9
 +7klchIiRdxCtuza9jfuiXJjnGBDy2xjkpzLnRyZqodg2NCEUW7VHzEyLqR89ZXNbl
 6h3/lIsmJWstQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bubu1.eu header.i=@bubu1.eu header.a=rsa-sha256
 header.s=bubu header.b=kRDP/qLJ
Subject: Re: [Buildroot] [PATCH v2] package/opendoas: fix permissions
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

On 5/12/26 20:48, Francois Perrad via buildroot wrote:
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> ---
Applied to master, thanks!

Marcus
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
