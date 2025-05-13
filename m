Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5775AC3ABC9
	for <buildroot@archiver.kernel.org>; Tue, 13 May 2025 20:06:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 24B13411CA;
	Tue, 13 May 2025 20:06:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id X-IOXC8uNZsI; Tue, 13 May 2025 20:06:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5C25741216
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5C25741216;
	Tue, 13 May 2025 20:06:08 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 1B85312A
 for <buildroot@buildroot.org>; Tue, 13 May 2025 20:06:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EBC6560F82
 for <buildroot@buildroot.org>; Tue, 13 May 2025 20:06:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Q8nOfFlTArBK for <buildroot@buildroot.org>;
 Tue, 13 May 2025 20:06:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 5178E60ED9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5178E60ED9
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5178E60ED9
 for <buildroot@buildroot.org>; Tue, 13 May 2025 20:06:06 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 32EB55FFB4;
 Tue, 13 May 2025 22:06:03 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 13 May 2025 22:06:03 +0200
MIME-Version: 1.0
Date: Tue, 13 May 2025 22:06:03 +0200
From: Julien Olivain <ju.o@free.fr>
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20250512214910.478137-1-bernd@kuhls.net>
References: <20250512214910.478137-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.10
Message-ID: <e7f8ac7f082b8160ab8c1e48a579d578@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1747166764;
 bh=bqAHRYtlVc6vWVYP9OIpoqgD3pWCi50EprcuWXWsZFg=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=q58l508LRMTbOBatyHwlrzLM6+WjoGegpvLC8y9FtoMQ6j3ks7MMNcxHdTX27hpEd
 JldDhk2cZZ6InkpFD9RUYdgdYlEaomipEJcc1FiEnL0OByaCh0d6DWRbzM+WYZsoah
 mU3zBouedd+UQsTIhZvo1pZkPtMAY95pVTZv82FfwGlSv0cYN9FVGpWL7BmGJVkcO9
 Qws5EzZ3+B4qcyLDuSPBiHxL2r1LJhFhETzGklopn6EcGzAvQeVCZORDul0YW8+olF
 tIBLDXnLH5Jaiq4oMGJ2hXtiIbZNkIDJIn+RLhOa+tZDpgEDXX4PZrYwFfPMalNyaN
 2+Ixc1T6WUwCw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=q58l508L
Subject: Re: [Buildroot] [PATCH] package/libsndfile: Add upstream commits to
 fix build with gcc-15.x
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

On 12/05/2025 23:49, Bernd Kuhls wrote:
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
