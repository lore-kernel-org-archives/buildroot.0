Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 352CAE95A6D
	for <buildroot@archiver.kernel.org>; Tue, 30 Dec 2025 10:51:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EBC6360AA4;
	Tue, 30 Dec 2025 10:51:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id R3Hhz9OFyyAx; Tue, 30 Dec 2025 10:51:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 190DD60802
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767091887;
	bh=vlvo/6/ayZ8SlMF0Tf7E62HUKqMBjQ2RkjSwzLBT1eM=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=ph+Gdqe0bvRcHuQnRNF37sGibzXcVH7hRZBv6NGUc/fd/OuMcfGOnvZeVHFtKkmhr
	 oU71k4LJneKTlUebVYCIOxR3BfTFvNzuNjdsQOFUFuXNl6a/haLXZ57oZVaEeKD7AL
	 YATMHKR6c+tmqRrRHhGhawuxFpBVLWJBCkDY2QuCf9RpOXv62e0wLbHbg1Ce8p39on
	 zb5bl2jKJ9Xt4d3r8jaGIA9dlSjHj+SaUzirKmVzHB0/sSKb9agLl6Xb6xeAJHhaLB
	 vCh8t1Di5eoTgjOUIQY8WHheh1y4G22Qn93BnMNEoSNzEpKgtXCIfB/JOHLBW0xyeh
	 gHWWKIxks9WPA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 190DD60802;
	Tue, 30 Dec 2025 10:51:27 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 6437B35B
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 10:51:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4ACB74024B
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 10:51:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 04jgWA1ktP0c for <buildroot@buildroot.org>;
 Tue, 30 Dec 2025 10:51:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 4435E400E6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4435E400E6
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4435E400E6
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 10:51:24 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id A7E16B00539;
 Tue, 30 Dec 2025 11:51:20 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 30 Dec 2025 11:51:20 +0100
MIME-Version: 1.0
Date: Tue, 30 Dec 2025 11:51:20 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Karoly Kasza <kaszak@gmail.com>
In-Reply-To: <20251230082753.2216587-1-bernd@kuhls.net>
References: <20251230082753.2216587-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.12
Message-ID: <a59248e779da4f782ecab6059a315be3@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1767091882;
 bh=d8l6Fyxp0DJXd9jom4gswQdmMpHsEt+7I6gl+1zoRMc=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=B59DE0UI32cODOZVq8aorHoat5WQQZjEcwjNda9pBCLFCYaqhW5dqpgMJdYxqMH3G
 gezSs/REwAv2gqskm95huYAIyUOXGRn7t4E3fz4vjsHiJA2Oq4SPXrSwcdD8maaM1C
 az1lzy+iZVuAe/EooNFPahOd+K35asLuI/N0c0T76O6wm73ZIsMeRtio1328tCUdKh
 x55PIM9J98c1FhYHiiGx3xsECA22zm+NgANVcVIq5tPowQJDjP7v3ugr3Rdo7ZA16U
 GT0mvhBHX/VZo4IncEdam7Z1b+jXz9lUBg47l1REIhr+Exdb3rinvrbBm/JvcivpUc
 vQbtQgAzIFxBA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=B59DE0UI
Subject: Re: [Buildroot] [PATCH 1/1] package/irqbalance: bump version to
 1.9.5
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

On 30/12/2025 09:27, Bernd Kuhls wrote:
> https://github.com/Irqbalance/irqbalance/releases/tag/v1.9.5
> 
> Removed patches which are included in this release.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
