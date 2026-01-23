Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F693D6CFD1
	for <buildroot@archiver.kernel.org>; Fri, 23 Jan 2026 12:35:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 548A86084B;
	Fri, 23 Jan 2026 12:35:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JRo872NboOu7; Fri, 23 Jan 2026 12:35:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 486AD6083B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1769171722;
	bh=POicpEaW2QLyAJayBOKQEsrUhFfE/JihLUFcWjVsv2c=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=qMC/UHbu+j4CjJcglTc8L7BgM/Y6SFCroKPWnKSmXPTi5tsopQuzFQKM9LRGOBoaG
	 268PNaamUscK6FqHtKnAAhvKiraaHZVWQFPQg8Jq/8HG6Ft5sXvpaaQ5/4BOGKDyYB
	 qEXJe9F7xRjhVDWU7UR4OkXaXlneQjo9sZk4EZzz643ahW50Fi+4eRg1bQ8SsPoYJK
	 ddUWvmwDl+XUSQCuAzWbf4bsZcn1bkayxprqXWSptI8xo9fG5eTM1zdy/5jUNQlxVF
	 A3FbIRT9rFQdSDveDnp2pfEAhaAvGp1vQB8BNpbZrIiVCs5iDSu568MyUOQhaY+Smx
	 DGe21nrszTkOQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 486AD6083B;
	Fri, 23 Jan 2026 12:35:22 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 1B36623F
 for <buildroot@buildroot.org>; Fri, 23 Jan 2026 12:35:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0990E82768
 for <buildroot@buildroot.org>; Fri, 23 Jan 2026 12:35:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tUbgnQ3u28WP for <buildroot@buildroot.org>;
 Fri, 23 Jan 2026 12:35:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::11;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 2E5E582358
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2E5E582358
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2E5E582358
 for <buildroot@buildroot.org>; Fri, 23 Jan 2026 12:35:19 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 60E8C2003D0;
 Fri, 23 Jan 2026 13:35:15 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 23 Jan 2026 13:35:15 +0100
MIME-Version: 1.0
Date: Fri, 23 Jan 2026 13:35:15 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Giulio Benetti
 <giulio.benetti@benettiengineering.com>
In-Reply-To: <20260123074424.3991140-1-bernd@kuhls.net>
References: <20260123074424.3991140-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.12
Message-ID: <b21c164f9d7e26837469f2f8113035b8@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1769171717;
 bh=18VrGsr34eOcSWRbQ7U45Pcb2cSRrM2483CCssuhZk0=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Ef7Xtd7vhcD464QtsDsCxUzsNFT+VO7lDK8QgyX9Np3sa3LfjfcY9gEzGI2awF91+
 DRDY/rvqMCWzXwZPHzfK6AOVJ8xm36UEVmqPYlMozS3D1x35ZJtFf/LJCNDj5wReNP
 HJCWQQHMraaRXdL/Py8cJGegLoST6DVCUTYHHWpQzvX6wWCX7nypt0bERTibFU646h
 6hVsjyiPg9b8ACENDj3GsITxiDGeEIATRAawLbm3Lh981V3NmAZjYk4hb4q+0rtzBX
 0YB1OygaV3F6hkXcboHa6Wh0dyyb+8YsM8aZW7S1yVeJ6zmodwTyQG4YD50BRq0Pux
 vY68vQNNyuknA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=Ef7Xtd7v
Subject: Re: [Buildroot] [PATCH 1/1] package/harfbuzz: bump to version 12.3.1
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

On 23/01/2026 08:44, Bernd Kuhls wrote:
> https://github.com/harfbuzz/harfbuzz/blob/12.3.1/NEWS
> 
> Added sha256 tarball hash provided by upstream.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
