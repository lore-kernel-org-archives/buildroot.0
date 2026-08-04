Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C78FCC55184
	for <buildroot@archiver.kernel.org>; Tue,  4 Aug 2026 16:24:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8C52580C9D;
	Tue,  4 Aug 2026 16:24:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7en1N3zbK0c7; Tue,  4 Aug 2026 16:24:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DAC1880C8B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1785860646;
	bh=TY7rmpQzW8hB7iEzFKDWDIlTZjVlcqJoTHQOnTO9pBE=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=QXh82PAZzbwPvVdWOvE1YzniJaSj7eFG2SC2hCm5ypU4hiJFHr6iIQtYgIMW0I8rG
	 YY+t/Ym4wQs9rHV+WFtbcwEFQgI8HcxehhQPI9Ujnf86Uq0oq91w6xEGWn/yStsVBV
	 J/J9oBjnrb06co6eMXcgEgLefc/Wdg+uYLlnBJ7gtQ0bHxAMkzzAvkxbw2FFe7yYQU
	 eOqlK0CsFarv742dqgcmRbvGFo2YpshJlR6q70MXaUQs3DpF3BhUCgDHj8+nFE5LhY
	 w6a5vIOHsEVvb/BdEq7BjOnHe8kZUA0hjOSeZkMuqebRy3kkAUA4PhT8sAgDxoQVa+
	 Ldwf6HAAwhC1Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id DAC1880C8B;
	Tue,  4 Aug 2026 16:24:06 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id A3371218
 for <buildroot@buildroot.org>; Tue,  4 Aug 2026 16:24:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 896E380C8B
 for <buildroot@buildroot.org>; Tue,  4 Aug 2026 16:24:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oD_5XtDapgsX for <buildroot@buildroot.org>;
 Tue,  4 Aug 2026 16:24:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.4;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 85AFB80C88
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 85AFB80C88
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 85AFB80C88
 for <buildroot@buildroot.org>; Tue,  4 Aug 2026 16:24:04 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 43FCC19F75C;
 Tue,  4 Aug 2026 18:23:59 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 04 Aug 2026 18:23:59 +0200
MIME-Version: 1.0
Date: Tue, 04 Aug 2026 18:23:59 +0200
To: Joachim Wiberg <troglobit@gmail.com>
Cc: buildroot@buildroot.org, Alexander Sverdlin
 <alexander.sverdlin@gmail.com>, Fiona Klute <fiona.klute@gmx.de>
In-Reply-To: <20260706045206.2395575-2-troglobit@gmail.com>
References: <20260706045206.2395575-1-troglobit@gmail.com>
 <20260706045206.2395575-2-troglobit@gmail.com>
User-Agent: Webmail Free/1.6.17
Message-ID: <cc37a00ef265389c402ba7d382629d29@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1785860642;
 bh=HdPS1XGixXmqQ/wjmBP8/HD1atf7YlLB8gpQX7RLEgc=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=hs8bEUxCZs5SMIUAb87uZY6fB/xTRkhIp64w4/r4jp5EM3HP5V9WXUuxZErWhQJXC
 ZkSZ/jUq7fOQh4gmRowa3TTz1YJZR3C8K9JyXjfTBIKgj6bRAfE7TQzh5q8qmOu3yU
 CywsLH0zqFRB0kRzX5z0qp0yKMOOM6hjg6PLgo5HksvNuZutRDwSKwGb4r9SZXT6bb
 GOOUUKPx6WkWfhtNrvgDXg5IbriqZyWhNCwAAhBmMoYfi0ZK2Ur/3Goh65w2yYFxmK
 Nl2hETtIEN08BDeKiC4fj/ZofCuesrGQxp4otmGl9bJeNZMj/sW0+Dxi3vZOZ3knDq
 fpezEdDzI05sQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=hs8bEUxC
Subject: Re: [Buildroot] [PATCH 1/3] package/mini-snmpd: bump to version 2.0
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

On 06/07/2026 06:52, Joachim Wiberg wrote:
> This bumps from v1.6 directly to v2.0, for details, please see:
> 
>  - https://github.com/troglobit/mini-snmpd/releases/tag/v1.7
>  - https://github.com/troglobit/mini-snmpd/releases/tag/v2.0
> 
> The release tarball is the canonical supported source for the project
> and also ships a pre-generated configure script, hence the switch.
> 
> Signed-off-by: Joachim Wiberg <troglobit@gmail.com>

Series applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
