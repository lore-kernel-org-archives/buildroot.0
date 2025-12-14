Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B58BD59D99
	for <buildroot@archiver.kernel.org>; Sun, 14 Dec 2025 16:04:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0E7E2407F5;
	Sun, 14 Dec 2025 16:04:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id z9xSG8NXv8S5; Sun, 14 Dec 2025 16:04:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6B67F40624
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765728293;
	bh=Fu68KOA6b7m1tghuYKNPFOItUy4T2rvLT+Kyj0TAgMc=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=U4kFrXp4wqh4hq0PAxpl7if8DgJbRy/wFdMH2WfTMKd7w76M9SzL9zakEcnJ58TQX
	 G+njgEDO27eweVnKxlW5vgi6dNAbKmkj6G+9bJSlXCtCKsPbPoVWILi6YR0JiT4X4Y
	 vbwu2QaB9QzAAekJMjPsfGhpvtLYn1Cwz9qodREef5IhpUn5akwIbM2y6wcFE2lJoA
	 8PO0QBkzxsRvXKn6tAaGdtc+yxqamwNhUctc6qH+24kq29PVHdozdMVvlqYOQmABG0
	 0Q66ZtNM6czIDKsECA7fMyZddtUMPogMdAGqyceq3OsA1+rkkK94PcSTDUJbXwPNSZ
	 4rm3QyC6fhJ1g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6B67F40624;
	Sun, 14 Dec 2025 16:04:53 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 150F32C1
 for <buildroot@buildroot.org>; Sun, 14 Dec 2025 16:04:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 06A654010A
 for <buildroot@buildroot.org>; Sun, 14 Dec 2025 16:04:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GspT93uMJT-t for <buildroot@buildroot.org>;
 Sun, 14 Dec 2025 16:04:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::15;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 00F884005F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 00F884005F
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 00F884005F
 for <buildroot@buildroot.org>; Sun, 14 Dec 2025 16:04:50 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 7D9B678050A;
 Sun, 14 Dec 2025 17:04:45 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 14 Dec 2025 17:04:45 +0100
MIME-Version: 1.0
Date: Sun, 14 Dec 2025 17:04:45 +0100
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc: buildroot@buildroot.org, Christian Stewart <christian@aperture.us>
In-Reply-To: <20251213204021.1811227-1-giulio.benetti@benettiengineering.com>
References: <20251213204021.1811227-1-giulio.benetti@benettiengineering.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <e57826e1656f5b722232e603777cbf2b@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1765728287;
 bh=S/RkU8eaRto/APzBu/3ANciGfL4LVWucKcczzEWXj6w=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=sbMZKsKZlwSfCKdNvVmTBhgq2UHkKUzshAYxk/1hJGN78g0zANSRZHhwg5a1BTK/T
 vrUKQta5lKte5gQPjCJQW/iXc3KZK7j9Rv0/5LZFA7lrAjBvXHitf64cOehCdTf8DT
 sqH155OFo6gDnIwjRz2t5gvVTSzYLu0kHau6KZZFlI5aJrv79qOnPTgjkNU9fhkbFy
 uy5ORm9dnQVwNtM6LRNjEz+KUzTFtF5FWkn4AQS9shz5EDa6LPieCLTt29ApYcVwn4
 vwNySpPlE6AEaqZx6FMZaY3hobuUygLK041YAxNnhoV0Bdvy7Nxle2xGGCfupSOzEj
 iA1oebA5UAJ6Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=sbMZKsKZ
Subject: Re: [Buildroot] [PATCH] package/rtl8821au: bump to version
 2025-12-13
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

On 13/12/2025 21:40, Giulio Benetti wrote:
> This allows to build with Linux 6.18
> 
> Fixes:
> https://autobuild.buildroot.org/results/bc0ec5fe3acb37740b54eb1af1fe5d9284c87cf2/
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
