Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCAB5FC6179
	for <buildroot@archiver.kernel.org>; Sat,  3 Jan 2026 11:09:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 86FA740756;
	Sat,  3 Jan 2026 11:09:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pxhu_232pVbi; Sat,  3 Jan 2026 11:09:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DE24640702
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767438593;
	bh=LRmorlE/dQzze/yMdll2HfHtqDvDPy6h6k+C6kwrNXI=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Zk6gk1Ro+xX7PmnkWQ3s4OdC6OtfHGr/87peSKKlsFhcqFTpwPeKYd6hPoFdVlKKa
	 MV0vjnJf+1MJ0yfwwJu/zZllch74elHZoBYlynX2Y4w23Jynvu7N+qnrjTndh2Dba0
	 dgvGsIRM4kvyHZtMpq+wt0t1Fe2j+L6t3S3oCB3tCGRr7CAdQu65S3FoqzRPbEe41R
	 xHlF8h9VsWv8Eoyf5JNRGRUWacE93i8DUohugm+uMn9YznsR+pL8Pw9wYmLP0J6bds
	 AR7ZPiJCO2Htk4h8mlC+K1Scod93gI+w++jvoN4UBxzSZl0b0z14SZVyWWlfNhJBGt
	 hwIXAIdmD4XpA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id DE24640702;
	Sat,  3 Jan 2026 11:09:53 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id A7971351
 for <buildroot@buildroot.org>; Sat,  3 Jan 2026 11:09:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A535E81E98
 for <buildroot@buildroot.org>; Sat,  3 Jan 2026 11:09:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id x0gvcsnaLBVv for <buildroot@buildroot.org>;
 Sat,  3 Jan 2026 11:09:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::13;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org A8B8481E95
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A8B8481E95
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A8B8481E95
 for <buildroot@buildroot.org>; Sat,  3 Jan 2026 11:09:51 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 588BA19F5AF;
 Sat,  3 Jan 2026 12:09:47 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 03 Jan 2026 12:09:47 +0100
MIME-Version: 1.0
Date: Sat, 03 Jan 2026 12:09:47 +0100
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20260102224820.504515-1-james.hilliard1@gmail.com>
References: <20260102224820.504515-1-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.12
Message-ID: <5db89a001df8340a0399271e8bdb2c9c@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1767438588;
 bh=DHh3rWKf2T+FJdHO4Fxp4dsLV9HPuKt0BCVe2+i4Xdo=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=cEptgHmGOIaNjHJ9KDyVcQgIqKG/tagl12HJ7Cd3037cHBrMpYYSuc9+l975nh2cs
 IpvgXND0KgAbrzD8hvZuUewl2/gLXC9krn4QYme5q/SsByi093oXKwjJaQI6JoRJ6I
 sVAphPh5946OcIGbVAZwBw9lFNnzRyi/+s3T1QBVnM4cxVEo06Afwx5CD7tbjdX7Tl
 fkQ7ry/7tOVcEojZM/zIieOfRvA43fJM8tqZMoLRZOjL7k2UX0fnBaq/LzqdQed3xb
 2LGb1l2MkIEJuTGswuo6FIMj4gxsyHezIMbXTLpMZXnyT5OKHkK7Qhxs30qUJ4W+6b
 Km/HlNEwrRAsA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=cEptgHmG
Subject: Re: [Buildroot] [PATCH 1/1] package/python-jaraco-collections: bump
 to version 5.2.1
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

On 02/01/2026 23:48, James Hilliard wrote:
> License hash changed due to move to license file autogeneration:
> https://github.com/jaraco/jaraco.collections/commit/9a81db3c77bc106017dcd4b0853a5a94f43ae33c
> https://github.com/jaraco/jaraco.collections/commit/d2b8d7750f78e870def98c4e04053af4acc86e29
> 
> Add new python-coherent-licensed build dependency.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
