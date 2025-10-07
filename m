Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84159CCA476
	for <buildroot@archiver.kernel.org>; Tue,  7 Oct 2025 20:00:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3C99B40A68;
	Tue,  7 Oct 2025 20:00:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bhU4R0D1czo0; Tue,  7 Oct 2025 20:00:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 423E940A63
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 423E940A63;
	Tue,  7 Oct 2025 20:00:13 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 9A700119
 for <buildroot@buildroot.org>; Tue,  7 Oct 2025 20:00:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 80D644041C
 for <buildroot@buildroot.org>; Tue,  7 Oct 2025 20:00:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id b1mYbRCVH4FG for <buildroot@buildroot.org>;
 Tue,  7 Oct 2025 20:00:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.6;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org AE9E7403CC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AE9E7403CC
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp2.osuosl.org (Postfix) with ESMTPS id AE9E7403CC
 for <buildroot@buildroot.org>; Tue,  7 Oct 2025 20:00:10 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 91574780389;
 Tue,  7 Oct 2025 22:00:05 +0200 (CEST)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 07 Oct 2025 22:00:05 +0200
MIME-Version: 1.0
Date: Tue, 07 Oct 2025 22:00:05 +0200
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: buildroot@buildroot.org, Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 linux-amarula@amarulasolutions.com
In-Reply-To: <20251006164955.1887486-1-dario.binacchi@amarulasolutions.com>
References: <20251006164955.1887486-1-dario.binacchi@amarulasolutions.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <5f4d1b15bad032e0207b5ec08d0c33c7@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1759867208;
 bh=aUgomKpjBlImoQnDcL/QrfdETj6FxFtSFimJdjIefeA=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=M4qohamwzRbGx2aZOti7GbLtdTJDH6nGsdVhJjdNjvSNCetZbxaKXm/5o50le50rs
 yMZFfHXvo8kHizan9nmSx7YooyOXl6YYUt8zmbRymzYdZs8mobNx+sf9lHGdauECSs
 fjg10ZYKokAOOKcB0nvoQJJkPcZpFN1jAG7khSBZq7G5OutlZoJ4i/xIEgcEugYc3f
 M6zeWoXGjAAuTbRay5hf1pUk6S0FMyVYL1mCCVBhXMK1j2MkfmEalvLLv1WhR5Bl99
 9Y1nZ8+t03Gv6pNCrh889FM+K8wwI6Q81imiIGbwcXEg8LUMb/wAzleZIMFIPwqX0d
 P+tlryIsJZ+eA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=M4qohamw
Subject: Re: [Buildroot] [PATCH 1/1] package/freeipmi: bump to version 1.6.16
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

On 06/10/2025 18:49, Dario Binacchi wrote:
> Removes the patches since they are all integrated upstream.
> 
> Release notes:
> https://lists.gnu.org/archive/html/freeipmi-announce/2025-01/msg00000.html
> https://lists.gnu.org/archive/html/freeipmi-announce/2025-09/msg00000.html
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
