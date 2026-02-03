Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30B0EE8B362
	for <buildroot@archiver.kernel.org>; Tue,  3 Feb 2026 21:27:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 252D4408CA;
	Tue,  3 Feb 2026 21:26:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EwZYx-y_pAGC; Tue,  3 Feb 2026 21:26:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4831540834
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770154017;
	bh=xKFeuYR7MsZqsPLIrJhcYPXcLVTRVKFFPte3NWXnZbc=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=XmjWOXFhn3AzzSnpF0oe/xE9Cf3AbVymQMQ123eLgsNZKSgoHhOtmJTUNJ0kRz4cP
	 FTx8Hu6W53SBotBVa5YN3RnfUakcvC6lguqgDME2KTXyh6+d/ePFlPh5467uUYzTqa
	 DDzjbtTvq+CkShPQFYVgfmoVhRXXY++lFvsPa/mmf54EwY6ZJWkDdo1dEYkUr3UaXS
	 LlWYo4HHiIwU7+1GQp8gFoFbO6h1l3fnZTaNhMKx40qDV3OI7TOGIgIaXhyItQ3aJh
	 s18B22jZNTADztSs+J3jPeH7HASH/rU0se0SsHepfqYR2G2bmuiUsM70WVAqyy/MLD
	 jrZJe6nAExkiQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4831540834;
	Tue,  3 Feb 2026 21:26:57 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 28EDDF5
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 21:26:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0BA8B60A59
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 21:26:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TtU13pxozF1y for <buildroot@buildroot.org>;
 Tue,  3 Feb 2026 21:26:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.2;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org EF72A60A41
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EF72A60A41
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp3.osuosl.org (Postfix) with ESMTPS id EF72A60A41
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 21:26:54 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id A05692003B4;
 Tue,  3 Feb 2026 22:26:50 +0100 (CET)
Received: from 77.109.103.251.adsl.dyn.edpnet.net ([77.109.103.251:65185])
 via 77.109.103.251.adsl.dyn.edpnet.net ([77.109.103.251])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 03 Feb 2026 22:26:50 +0100
MIME-Version: 1.0
Date: Tue, 03 Feb 2026 22:26:50 +0100
To: Maxime Leroy <maxime@leroys.fr>
Cc: buildroot@buildroot.org, vjardin@free.fr
In-Reply-To: <20251222215636.975668-3-maxime@leroys.fr>
References: <20251222215636.975668-1-maxime@leroys.fr>
 <20251222215636.975668-3-maxime@leroys.fr>
User-Agent: Webmail Free/1.6.12
Message-ID: <29c160e6ee47ae325d398576e15aba0a@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1770154012;
 bh=L8Klu2VYwYUPPd1g7mTH/C/8IbF2IMCxXfyG+kSh/B8=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=jW7UNfj9mbo36QruX5c1OIrtw3QGUE8Y94nuageAva3FK8pb3lg2WE5MgA4aS95EU
 UaIQK0iNVtgEiiV/3v4q17piY/CbYb0/pSJAh5Pyx8f/kjD+v4eRZCS0IsVTLrl2PI
 3uj/nGMyeVKN2sDP7Yh3oC9afOWmgLMYLYcso/XQL6PZvTq6hr65R5O3iY5znETuSC
 RUfFdCvpaHowGFxS4yrMfh1SrjU1vZiwke/qw1vCwWRIjjVYZBLFi/UNCJfOtg+/8x
 3kEgmB0PnmrijFXqq36ja+Ul1ZIq30j187K+b4fqTjkdGRyqa6tmatvIedCUlMPeD4
 V6pqoLH039Erw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=jW7UNfj9
Subject: Re: [Buildroot] [PATCH 2/7] package/dpdk: make libraries selectable
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

On 22/12/2025 22:56, Maxime Leroy wrote:
> Add BR2_PACKAGE_DPDK_LIBS_LIST to control which DPDK libraries are
> built:
>   - empty : use DPDK defaults
>   - none  : disable all libs (-Ddisable_libs='*')
>   - list  : pass to -Denable_libs= (comma-separated)
> 
> Signed-off-by: Maxime Leroy <maxime@leroys.fr>
> Signed-off-by: Julien Olivain <ju.o@free.fr>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
