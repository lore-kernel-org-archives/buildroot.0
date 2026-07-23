Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD0A9C531D0
	for <buildroot@archiver.kernel.org>; Thu, 23 Jul 2026 21:10:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 670B740AD1;
	Thu, 23 Jul 2026 21:10:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fznI89RHS2xL; Thu, 23 Jul 2026 21:10:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9486540AD2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1784841031;
	bh=cf5lQoz2CRparYZS5CRCXbI6BueUuHaH4I9QIkA08I8=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=S/mbHtw1VgdUpQ38gvaKiA9GqKNXOVayKcNNNtUaeu+JTblwXCl78olK745S8DyR0
	 WeefkaeT5fD/ZTRJ+xb8O5gwu381Oad3PIBVlnL4wh+YBspIPBZ6Cly/Q5ituALC/B
	 UGuAywvTWVNiBL+dHXo0+gc+l9OxGPiS0b8AVZ3VbFVV5HsqfayGenvgKmLVnrdaQS
	 Hm6PzIEt2vYxwFkDgdwE3B+qJzNCHrTDIOZT7xt0UOc9ZeKBJujnm3srRjgDO3kXLB
	 V7hYUJzldsmDS8kjPIQgWK2EjEDZzesYxs9IvZo24Akpjmz4W8mL76dOccJqNGbkFU
	 303H+y5KJ3JKA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9486540AD2;
	Thu, 23 Jul 2026 21:10:31 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0252E788
 for <buildroot@buildroot.org>; Thu, 23 Jul 2026 21:10:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E7B9740AD1
 for <buildroot@buildroot.org>; Thu, 23 Jul 2026 21:10:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id n1trUUmR5fJX for <buildroot@buildroot.org>;
 Thu, 23 Jul 2026 21:10:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 264CC40AD2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 264CC40AD2
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 264CC40AD2
 for <buildroot@buildroot.org>; Thu, 23 Jul 2026 21:10:28 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 0212FB0054C;
 Thu, 23 Jul 2026 23:10:24 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Thu, 23 Jul 2026 23:10:24 +0200
MIME-Version: 1.0
Date: Thu, 23 Jul 2026 23:10:24 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Giulio Benetti
 <giulio.benetti@benettiengineering.com>
In-Reply-To: <20260723195710.1465177-1-bernd@kuhls.net>
References: <20260723195710.1465177-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.17
Message-ID: <ee154927759e1d14e507e7f4a52c6416@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1784841027;
 bh=M6XBZiI2Gt7QeffyLScPWZuxrUN2zCEmfHifIi3ewt8=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=YARGqMK1RRBZ/hOer1IS9ZP+BY2isOXMdTvdjDwKrRyQDa0JQAolTTJKQ8peiEeyu
 Id2Dv1G2CAITLu4dnL1ye4X2CC9r2wH3A7XEx389tfEccjz6zxVmtiYbfjDXo195uT
 uLM4l7qFz30x8vIKW0PdMroCCS7bTIaUOeyQXyjvVT9vbGAE29RTT6q4/i/cMj0sAD
 LKKxf6hXAh8LqrCX+9YTzrN/bCaTa2y1DCfq6XnmYQfFLiUtssgypo5Grc2tQ8UY+Y
 T++Yh/XnDZPWPN3gYJ0+a9hP6MroDpO8m3ymXrdlg8LFlC4BUJZkfPSbMrlrSp6eYO
 ZYyCsz+vVdzBw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=YARGqMK1
Subject: Re: [Buildroot] [PATCH 1/1] package/bind: security bump version to
 9.20.26
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

On 23/07/2026 21:57, Bernd Kuhls wrote:
> https://downloads.isc.org/isc/bind9/9.20.26/doc/arm/html/notes.html#notes-for-bind-9-20-26
> https://downloads.isc.org/isc/bind9/9.20.26/doc/arm/html/changelog.html
> https://seclists.org/oss-sec/2026/q3/208
> 
> Fixes
> 
> CVE-2026-10723: Incorrect acceptance of NSEC3 records
> CVE-2026-10822: Key Record using PRIVATEDNS algorithm may lead to 
> unexpected exit
> CVE-2026-11331: Potential wildcard CNAME RPZ policy bypass
> CVE-2026-11605: Unnecessary validation of DNSSEC signed records
> CVE-2026-11622: Potential memory usage beyond configured limits
> CVE-2026-11721: Cache poisoning possible with label count discrepancy, 
> RRSIG, and wildcards
> CVE-2026-12617: Record ordering based unexpected exit with CNAME or 
> DNAME
> CVE-2026-13204: Unexpected exit in certain situations with NSEC and 
> NSEC3 both present
> CVE-2026-13321: DNSSEC Validation Bypass via Out-of-Zone NSEC Next 
> Field
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
