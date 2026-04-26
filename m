Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12CA3FF885D
	for <buildroot@archiver.kernel.org>; Sun, 26 Apr 2026 16:59:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3913661C60;
	Sun, 26 Apr 2026 16:59:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id F9NrSKt7npMd; Sun, 26 Apr 2026 16:59:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9E52361C54
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777222786;
	bh=0dHczGT8doLpGOB065aZYaFq6Brus3UvGReWuc1yWuE=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=MYpPlUn0z8GJ+XholbVwKyk7jrF6IstKRxBJ4Ng/KLFkEewpDCoGP2O2MKKrm+3jL
	 GlYg4pE9xgGuLIUy/3uAbhDLgKFXdx8ywSYOwaHPvX3J+tHT9Pn7PxJGV3p73ppv6D
	 RWuFzg7nal9F0Ri61vqWn65udNc7k/7vDREHVA1kgdQkAAO5Y7XRERe+06cmu77SB2
	 XQTWpKZ2ZvHr6OlYurlJJV/bpu24djntGyNZ5k5oKwM34P1q3fbsJHZrp6fihXGixd
	 THPB8rT5FwE+qHTTMelLRshgYLZBjVwZ1j33Cpj9AvUkxdxls/95AcB0fk8bayHqad
	 u+34eSDSQO3yw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9E52361C54;
	Sun, 26 Apr 2026 16:59:46 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 02CE51B8
 for <buildroot@buildroot.org>; Sun, 26 Apr 2026 16:59:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E886884D58
 for <buildroot@buildroot.org>; Sun, 26 Apr 2026 16:59:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 27CwTO5Pu-5a for <buildroot@buildroot.org>;
 Sun, 26 Apr 2026 16:59:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org F210684D57
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F210684D57
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp1.osuosl.org (Postfix) with ESMTPS id F210684D57
 for <buildroot@buildroot.org>; Sun, 26 Apr 2026 16:59:44 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 5B08C5FFB4;
 Sun, 26 Apr 2026 18:59:40 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 26 Apr 2026 18:59:40 +0200
MIME-Version: 1.0
Date: Sun, 26 Apr 2026 18:59:40 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Shubham Chakraborty
 <chakrabortyshubham66@gmail.com>
In-Reply-To: <20260426071908.372315-1-bernd@kuhls.net>
References: <20260426071908.372315-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.14
Message-ID: <9dc9fa8439e2caa823272c78118124bc@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1777222782;
 bh=ZDoYABShrdjV43RG4hWXjv2THwx78zG1SWRJuvCuq2w=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=gObVUnll5YLk8HpAzxJNr6SKa1YxhSfOoQpFsVB0NGcKl61yQ6/vkAV8NLrNhHBHD
 EZG4Ocq6158cbh34ZdoqM0BdOGNHzMAVils+1fZRgHJrEZq9Z6FSqWZ2bvKmPZowhE
 YFzKMMjgiRGCYQdkUS+IX4kYnhpdaaXX4X1A/KQLD5Q6Ov2hXj6IclCPYAZX6Zi5ge
 k4vM++NAqyyQO7BRjZN0qFNsvgNwkIE4qryl4mXNaEC6JrnKPB7cdJPLC12CNH7/WQ
 NKm7ecEGzuXEc/WPEtO5g6WaEaQnNeyt7eKAihJuR5oi/Nlc9yGUtsJ4fCSiaOGhnu
 Hjn/Dx4UMzwnA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=gObVUnll
Subject: Re: [Buildroot] [PATCH 1/1] package/ccache: bump version to 4.13.4
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

On 26/04/2026 09:19, Bernd Kuhls wrote:
> https://ccache.dev/releasenotes.html#_ccache_4_13_4
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
