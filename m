Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A644E668BC
	for <buildroot@archiver.kernel.org>; Sat, 20 Dec 2025 19:21:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4C3134098B;
	Sat, 20 Dec 2025 19:21:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id prPZnHzWVhbP; Sat, 20 Dec 2025 19:21:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 822E44096E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766258484;
	bh=1pEooAW1OfPe4gIw/eD5xgl1mYlwEgQ41GvztJjUxto=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=PVlDfonsDC059du5ZxOYvBfo/zq3Ajl6CxmC+YeHUI5KkLs6O7oolDV6+K6IUPUF+
	 yRwBZIfnKCbus+BYqGOXeE8MZkHAGYCUq3eXjzzdfQCpFtV/91osnRihGKdt5IUutz
	 DKXQxMqhRd7WeJVphAspqsYGMdtGPnXkaqLCsslv/DbPq16+2T1/TtCOoq7QPra47n
	 qa2xlT63e+7RxzXmvJ/DsKQJw04uSr5WYnUzqXuLCYVeTxGBsqDBs4Q7V24cRuPYVL
	 /GQNAYttrs25WW44aMePYO4c5diPqUw12JqtJztffuZhv+I2xAKjACbpEMZ/koK5zq
	 BdhiNyF2Td8Tw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 822E44096E;
	Sat, 20 Dec 2025 19:21:24 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 6EC501A6
 for <buildroot@buildroot.org>; Sat, 20 Dec 2025 19:21:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6C46E60DEA
 for <buildroot@buildroot.org>; Sat, 20 Dec 2025 19:21:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Acdbf2N-oMIb for <buildroot@buildroot.org>;
 Sat, 20 Dec 2025 19:21:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 955CF60DC9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 955CF60DC9
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 955CF60DC9
 for <buildroot@buildroot.org>; Sat, 20 Dec 2025 19:21:22 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 63E405FFB4;
 Sat, 20 Dec 2025 20:21:17 +0100 (CET)
Received: from 2a0d:e487:416e:b4c0:bc35:8e33:c88c:ebb9
 via 2a0d:e487:416e:b4c0:bc35:8e33:c88c:ebb9 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 20 Dec 2025 20:21:17 +0100
MIME-Version: 1.0
Date: Sat, 20 Dec 2025 20:21:17 +0100
To: Marcus Hoffmann <buildroot@bubu1.eu>
Cc: buildroot@buildroot.org, James Hilliard <james.hilliard1@gmail.com>,
 Marcus Hoffmann <bubu@bubu1.eu>
In-Reply-To: <20251205122122.579507-1-buildroot@bubu1.eu>
References: <20251205122122.579507-1-buildroot@bubu1.eu>
User-Agent: Webmail Free/1.6.12
Message-ID: <4c278fac658fee2f7e017af040cae983@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1766258480;
 bh=OXjpibD51rQyRTbNT/J7MjJI61RFqDQ+IYvTiWkqtGQ=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=tNh3u+LNr6lYgAUxmtM7wIbpVfBXqxvqsN2SgAmNtQOY69Lfz5C+Kir8tCEsZ6nJW
 kgl+rxg5daCu56gLoWnsOCi6B+UbnMU887aZGscPfT8YO7VkFe+p9dT66KcFWHfDIB
 w1W7vVqi9vV1iC/I32JRfbu+EJXc7uc4PgMULVb4SwWZOEwJL8jwWC0rMNSGj7vpal
 PrW58FSAs9IAZ/tK1DM0+j0Qmgp+V5wE+hfukpM+/wfWQnKw90kblsh/W9VyxdwVCh
 PrskqOhcskgmsxBr4uPo8wFkf/9Ew8VByAb+VVH60e+q0CaiftA/MXlb5F46Ha6/ex
 q1GjvAWRxn+Yg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=tNh3u+LN
Subject: Re: [Buildroot] [PATCH] package/python-pydantic: bump to 2.12.5
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

On 05/12/2025 13:21, Marcus Hoffmann via buildroot wrote:
> Release Notes: 
> https://github.com/pydantic/pydantic-core/releases/tag/v2.41.5
> 
> No bump of pydantic-core as the version requirement didn't change.
> 
> Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
