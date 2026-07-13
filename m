Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A02CC43458
	for <buildroot@archiver.kernel.org>; Mon, 13 Jul 2026 13:44:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4D4A280F22;
	Mon, 13 Jul 2026 13:44:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yxySv-TiHd51; Mon, 13 Jul 2026 13:44:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 75C2180F33
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783950287;
	bh=89V+WqdNU4uOy1KwnvLZiOviVD8UBaZZUK3vdcsS/o8=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Adpu/dnnNnG1IKL0zSXQOkW/uQLtVxVfvSoLB99zPxd/cn8ZauA9nBtq4PM+3QFGY
	 xDha49R8DvGkpXo4/1P1ufS6cu6QO4Bc2GLvqC0hsJ7u8NFD3N8VQxD1qLQFoVT0bS
	 5nCnWb5JiiIsDvFtDnbZrqyFyglncUirP2I70LW4JwueOGaDzW8JHrMHDB7fPWWIgi
	 zE5rnvxTl/bybBF3DxFalszLnUrzUuGzJgGRO/v1+ho7x7KhV4eC2cu8WE+vyBSYoo
	 GIGjTq54klCAN3hUJ2GdAGQIm8BiX4OW9hyOA0dGmdDzNCpCjRe4Xlo7Tvmm+7ESxH
	 A7q6mQNhlS+gw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 75C2180F33;
	Mon, 13 Jul 2026 13:44:47 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 31C80128
 for <buildroot@buildroot.org>; Mon, 13 Jul 2026 13:44:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 230C880F33
 for <buildroot@buildroot.org>; Mon, 13 Jul 2026 13:44:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nU1ccE6Bjcng for <buildroot@buildroot.org>;
 Mon, 13 Jul 2026 13:44:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::15;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 5642D80F22
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5642D80F22
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5642D80F22
 for <buildroot@buildroot.org>; Mon, 13 Jul 2026 13:44:45 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id E27A8780510;
 Mon, 13 Jul 2026 15:44:40 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 13 Jul 2026 15:44:40 +0200
MIME-Version: 1.0
Date: Mon, 13 Jul 2026 15:44:40 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
In-Reply-To: <20260712112841.1579476-1-bernd@kuhls.net>
References: <20260712112841.1579476-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.17
Message-ID: <9ae68070b0cf42de22ccdb0c71b573ad@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1783950283;
 bh=vZ+VpYFlL+2uYnbjyl9O4j05RiZWVrkcvnGe+eqjlzM=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=JnHhbv/0s2QwsNVGpJPUgpVeCT3eujK3CnqnYzmrZKQbLnHuovt1kSHd+q7+ZcNlP
 91BuiF9Dyg/7AqWqPsPExRY4xF4Y5bd3kEs6Wz/SKxmuJQldZhc3ExV3IyZZFEbMyW
 piRCOQQJV2k+lieBoK2G8aTO/WKLFDGh1dZM2H6x/ENTAEdWL9MelX2DUxSUyWg+DT
 q57RBcragJbGp+wve0Gh4Ut0ZYjPQ3+0wvkk12f/VOJvY1atUI8F4Ky5QbToioYFQz
 wYgCgcuM+Ckdrdr5x7ZT76Kn8Tg5qxx3DuwUTQC4Zfu/Jx9KrsXy6QeKOmNj+eGhXm
 g9S9RvEqkdcCQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=JnHhbv/0
Subject: Re: [Buildroot] [PATCH 1/1] package/libffi: bump version to 3.7.1
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

On 12/07/2026 13:28, Bernd Kuhls wrote:
> https://github.com/libffi/libffi/releases/tag/v3.7.1
> https://github.com/libffi/libffi/releases/tag/v3.7.0
> https://github.com/libffi/libffi/releases/tag/v3.6.0
> 
> Updated license hash due to copyright year bump:
> https://github.com/libffi/libffi/commit/4f7ef24565eb60e8a093bfeba0bb77d5c576c311
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
