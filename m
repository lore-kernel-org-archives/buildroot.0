Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BDE7C7115B
	for <buildroot@archiver.kernel.org>; Fri, 20 Jun 2025 16:31:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 38B6541232;
	Fri, 20 Jun 2025 16:31:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZxUPCrDoZdYv; Fri, 20 Jun 2025 16:31:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 77E144123F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 77E144123F;
	Fri, 20 Jun 2025 16:31:58 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 4AC40154
 for <buildroot@buildroot.org>; Fri, 20 Jun 2025 16:31:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3CB7640109
 for <buildroot@buildroot.org>; Fri, 20 Jun 2025 16:31:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iHMAKWup3bxX for <buildroot@buildroot.org>;
 Fri, 20 Jun 2025 16:31:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::15;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 4EB8C400D7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4EB8C400D7
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4EB8C400D7
 for <buildroot@buildroot.org>; Fri, 20 Jun 2025 16:31:55 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 7E5D97803A2;
 Fri, 20 Jun 2025 18:31:50 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 20 Jun 2025 18:31:50 +0200
MIME-Version: 1.0
Date: Fri, 20 Jun 2025 18:31:50 +0200
From: Julien Olivain <ju.o@free.fr>
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc: buildroot@buildroot.org, Joseph Kogut <joseph.kogut@gmail.com>
In-Reply-To: <20250619195132.1986901-3-giulio.benetti@benettiengineering.com>
References: <20250619195132.1986901-1-giulio.benetti@benettiengineering.com>
 <20250619195132.1986901-3-giulio.benetti@benettiengineering.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <30279595e5a06d6dbdd397b0113ab688@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1750437112;
 bh=zt7Gsu0lLLKSNNPCTWmiOcCl431cdzaKn/CJGcOIfLY=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=hO+mdNmqCX0k1kc0pVmLmkvdJQ/SlX/gRjFUAOtdM9TvgUf0hY5Va/oU6SUtkdQdu
 va5y8suGC4ZRPaEl7TzrOEziQ+u/eoWMlPAOTLFyXZJEmS8dp1+W5wan4TebOs2oy0
 8JZ+vjUgnjDV3NgBt51x1CU80k+Wg8jIf/ny54I0StIe+Bt3Vvjub99olLn8276DMs
 mqEcoPkwknMXTpfBgTXAu9JERFmlb/ORpgII1qFUrQu2I4LHb3ZAirXFTcdOyd/gxZ
 Ujh1CCjci9794zRMIjg7ZoSAQ1F8yGNNsIhUAAXugZnnaqAR/rAGNHxZEf360LG8Dp
 p0+Eax4J8903A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=hO+mdNmq
Subject: Re: [Buildroot] [PATCH] docs/website/support.html: add Benetti
 Engineering to the commercial support list
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

On 19/06/2025 21:51, Giulio Benetti wrote:
> As Benetti Engineering I keep contributing since 8 years more or less 
> on
> many packages and I've learnt a lot by joining this community. Most of 
> all
> I've received precious reviews from maintainers of today and yesterday.
> Also, finally I've found some time to create my company logo and so 
> let's
> add Benetti Engineering to commercial support using LinkedIn page as
> placeholder until the final website will be ready.
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
