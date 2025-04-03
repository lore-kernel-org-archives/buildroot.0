Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79F56C3600C
	for <buildroot@archiver.kernel.org>; Thu,  3 Apr 2025 19:56:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2AC3482FA2;
	Thu,  3 Apr 2025 19:56:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8eEf1Crwncsp; Thu,  3 Apr 2025 19:56:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 54AA982EB5
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 54AA982EB5;
	Thu,  3 Apr 2025 19:56:26 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 5AE541F4
 for <buildroot@buildroot.org>; Thu,  3 Apr 2025 19:56:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4023A41A57
 for <buildroot@buildroot.org>; Thu,  3 Apr 2025 19:56:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cUlnTMoVO9Js for <buildroot@buildroot.org>;
 Thu,  3 Apr 2025 19:56:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 55912419DC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 55912419DC
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 55912419DC
 for <buildroot@buildroot.org>; Thu,  3 Apr 2025 19:56:24 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 35F0CB005C1;
 Thu,  3 Apr 2025 21:56:20 +0200 (CEST)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:36770])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Thu, 03 Apr 2025 21:56:20 +0200
MIME-Version: 1.0
Date: Thu, 03 Apr 2025 21:56:20 +0200
From: Julien Olivain <ju.o@free.fr>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org, Romain Naour <romain.naour@gmail.com>
In-Reply-To: <20250403071258.1995429-1-thomas.petazzoni@bootlin.com>
References: <20250403071258.1995429-1-thomas.petazzoni@bootlin.com>
User-Agent: Webmail Free/1.6.10
Message-ID: <a0347a1a419983edd131b2507a7b8a70@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1743710182;
 bh=BmME1ZLyXvdFWPlMqSXKr0eHoJ+GVoBkJYCybusi//g=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=ue3NrcT8SwWvCaU/0A2xvAKYcV8DSqrTRmZbTOJaiazlmHXsaTas2BwFqe6IyubBO
 zA4qAnwdh5YNM4ffNgn/JKKGdM22TqnIB/K0BFR3ZARIRK7LFlyzkkx9FrQ/uSjkM4
 3DNs1s88R5sUZbmVYnGUozm+moLDTgwVNmppb7sp3m3G3lu4qtyuiB4iNtNbN/z50W
 IyUoS0YK4fSNTmc35bBvVcEaByLc8jF+pLDagH6tUeXrra0ZP8h2JYkbaITcCyO9/O
 WMOo3nKKTD1NzjRoe49rqXQPbNB0HNZCa2pBqSJu8KflaZlhgahNSCfYmQ6Daqth2q
 MC8Hq6Jfk03uA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=ue3NrcT8
Subject: Re: [Buildroot] [PATCH] package/glibc: disable on RISC-V ilp32f and
 lp64f, not supported
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

On 03/04/2025 09:12, Thomas Petazzoni via buildroot wrote:
> glibc fails to build on RISC-V 32-bit with the ilp32f ABI and on
> RISC-V 64-bit with the lp64f: both use single-point precision floating
> point, which glibc doesn't support, failing during the configure step
> with:
> 
>   configure: error: glibc does not yet support the single 
> floating-point ABI
> 
> Fix that by disabling glibc support on those configurations.
> 
> Fixes:
> 
>   
> https://autobuild.buildroot.org/results/fe8d569cab507992978ef0da649278dd3a9e0b23/
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
