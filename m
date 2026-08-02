Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AAE0C55162
	for <buildroot@archiver.kernel.org>; Sun,  2 Aug 2026 19:49:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D4D9F405F4;
	Sun,  2 Aug 2026 19:49:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xnxv6vvdMIdO; Sun,  2 Aug 2026 19:49:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 379AD405E2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1785700190;
	bh=h4pytybNLOxUGvkf5dXskwGd8fyufThdEORqy47CuXc=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=YHoHBckD1gRA/mdGO2R7AFDnDnpgCH9HgUpCTbvm5B4QGVIrxAigpS7JFlzj/zB6M
	 zNACRfD6A1hAc0judXeJjPbNr1Z3jSd6cLLlYsCm1s38DBpgYMOnx8hmDlwCI9Aay0
	 QsbFUw8YVNwaCd+YXRSv8bHK1tWbE7kY7AyjnD2jxsEUfk3/Ohl09CNN7jVdeBH6he
	 psctOB8Kv1u6YdG5r4c0e7EFSlSxJmo2CBvKXfSpDmvQduCy3AqgWKodNgbfR7nfhV
	 1u4WaTauZc6dBuT6D3HKwyWOVr6bcDsEMZn+LOYbvxrfIl1mM2XVcQJW2SzSd8RUA6
	 Cb6OT08ok+IKA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 379AD405E2;
	Sun,  2 Aug 2026 19:49:50 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 7FE453A6
 for <buildroot@buildroot.org>; Sun,  2 Aug 2026 19:49:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7D2C4405E2
 for <buildroot@buildroot.org>; Sun,  2 Aug 2026 19:49:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mAg2SvSLPeMS for <buildroot@buildroot.org>;
 Sun,  2 Aug 2026 19:49:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.6;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 5D6EA405D9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5D6EA405D9
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5D6EA405D9
 for <buildroot@buildroot.org>; Sun,  2 Aug 2026 19:49:48 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 5AF4A780331;
 Sun,  2 Aug 2026 21:49:45 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 02 Aug 2026 21:49:45 +0200
MIME-Version: 1.0
Date: Sun, 02 Aug 2026 21:49:45 +0200
To: Julien Olivain <ju.o@free.fr>
Cc: buildroot@buildroot.org
In-Reply-To: <20260723202709.1036060-1-ju.o@free.fr>
References: <20260723202709.1036060-1-ju.o@free.fr>
User-Agent: Webmail Free/1.6.17
Message-ID: <a1da166887d5f890979519f68e981fdc@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1785700186;
 bh=Sx5ZT74JLzK+AwtmgcOpG4zuE59k1kZXQ8NRSKbehjY=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=CMAHAzBjFiEWJviT4Q2NuKOFkgLWtIIbIOgYMpqAZAT2n2Sscg+o1+WM/w1RkqWo4
 0Baf0avELhnlXfRx/Un0KcyncwfYN+6/y1eH53aWvI/5wENGYnREIoXrlm9Wzg/G1S
 yq9vByK7SCicSFVGSKg+Tt80iUBi+5VPPyjZDHoFd9ecWa5EiolecJvvYrctfMLWXS
 gRkQGtiuqKZ355tk1Wxa5XLG6ctOE5cOc6JYjmOSwHhG5khrOQ1Nm7DHOjXtzltmul
 A6HOf76ZjDTndKri9eVtiYRiWbbUwFN34/ObUZy4983lidfjm+PPv7ap6j+6MmAlyq
 pr9f7lHXJOTBw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=CMAHAzBj
Subject: Re: [Buildroot] [PATCH 1/1] package/fwts: bump to version 26.07.00
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

On 23/07/2026 22:27, Julien Olivain via buildroot wrote:
> See release announce [1].
> 
> This commit also removes the package patch, which was accepted upstream
> in [2]. The comment before "FWTS_AUTORECONF = YES" is changed to
> "No configure in tarball", because the patch 0001 is removed, but the
> autoreconf is still needed.
> 
> [1] https://lists.ubuntu.com/archives/fwts-devel/2026-July/014207.html
> [2] 
> https://github.com/fwts/fwts/commit/3bf8a5f3932239f76f2eb245265172ffc8f29323
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>

Applied to master.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
