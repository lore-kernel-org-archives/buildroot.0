Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C281CAC592
	for <buildroot@archiver.kernel.org>; Tue, 16 Sep 2025 18:43:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3F554823AB;
	Tue, 16 Sep 2025 18:43:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id r8_NH5EmJSyp; Tue, 16 Sep 2025 18:43:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 561BB82387
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 561BB82387;
	Tue, 16 Sep 2025 18:43:48 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id B5F5F12D
 for <buildroot@buildroot.org>; Tue, 16 Sep 2025 18:43:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A7ACA60B97
 for <buildroot@buildroot.org>; Tue, 16 Sep 2025 18:43:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qLiB9DZEUcv6 for <buildroot@buildroot.org>;
 Tue, 16 Sep 2025 18:43:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 3E14760B36
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3E14760B36
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3E14760B36
 for <buildroot@buildroot.org>; Tue, 16 Sep 2025 18:43:44 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 4338EB0055E;
 Tue, 16 Sep 2025 20:43:41 +0200 (CEST)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 16 Sep 2025 20:43:41 +0200
MIME-Version: 1.0
Date: Tue, 16 Sep 2025 20:43:41 +0200
To: Thomas Perale <thomas.perale@mind.be>
Cc: buildroot@buildroot.org
In-Reply-To: <20250916175144.1057267-1-thomas.perale@mind.be>
References: <20250916175144.1057267-1-thomas.perale@mind.be>
User-Agent: Webmail Free/1.6.11
Message-ID: <3dc78337e05f4e35554cd97caca32da9@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1758048222;
 bh=RqTsBeRs8nOE6ZC1fWd3ZprBZE5Q+kEZTqND+BVfS5I=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=FuUUfFhXdqBQfNvTGriziDQ1YZ2xt7z/AhglIhmWryqHPYR2oXke5KDizN+42xgF5
 aA/2JAzfsJDTOT6S1tYn2vB25MI1KveHDR3kBEW90cVjP3P49/YDSqLFZl4pDXsf5a
 CFB40J7LMyASd2SvMXkmGoFZE9KZ8q/J3c4777pbueqfa0fLpzOpxfYmjZZu6RK90r
 DZkC9ehj9mGInWlZLZ7/qfN/KoE1VsfDw7GKnKLzQBBQ6KMBCOZdi0a9vXw1/TNmCY
 eR/0nsep5cOD+mp2B7eLojnhXbV+psb71VHc5Q9OO4Jbsd2daQrNft9Y3IAW0ynu3r
 ffWoL1VNNlrCw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=FuUUfFhX
Subject: Re: [Buildroot] [PATCH] package/cjson: update deprecated CPE
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

On 16/09/2025 19:51, Thomas Perale via buildroot wrote:
> The CPE 'cpe:2.3:a:cjson_project:cjson:0.0.0:*:*:*:*:*:*:*' has been
> deprecated in favour of 
> 'cpe:2.3:a:davegamble:cjson:0.0.0:*:*:*:*:*:*:*''
> 
> See 
> https://nvd.nist.gov/products/cpe/detail/70BC45DA-D915-4A1D-96AF-84A6CECEE148
> 
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
