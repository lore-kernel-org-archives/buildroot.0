Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D798E67482
	for <buildroot@archiver.kernel.org>; Sun, 21 Dec 2025 15:34:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F205F40782;
	Sun, 21 Dec 2025 15:34:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xhGa5_I6dlM0; Sun, 21 Dec 2025 15:34:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1B12F4078A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766331253;
	bh=qfmFYyhDDE2Tyo0OYduCQb1orA4ggeVZkC6DexUu2zM=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=FNHLjR/9X8jupoABDBvN4MCjsHy1Ka+WGagw2eM7Z58ORCaFBdv8TAMI0nSfxxFnR
	 ZGnh7stmy20cc4PQok/klDSOnJ/2rVoqEIuadqvDo2Cx0lLkFzm0zfryBs6rirtiLv
	 yCFo/b1H2n1OU+jy99NCxPzmJOncJ10Efcv32ZN/W53umA6D6QzmExAQiGvQsVemvU
	 pRt/PrJBcAaRXEVb7u5ajjnxuw4SOMCJYtEPBzYDKY8NkESCij2V6+gVvo2v7D76MW
	 OHzxvecavpxZ2nPDD5T5H3wmmRttGLRhlDYJgqH43Wb4+TftjHV0HImrVSGjpdhMii
	 DZQmCAvR/uP0w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1B12F4078A;
	Sun, 21 Dec 2025 15:34:13 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id E0127195
 for <buildroot@buildroot.org>; Sun, 21 Dec 2025 15:34:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C70E080DEE
 for <buildroot@buildroot.org>; Sun, 21 Dec 2025 15:34:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aTAFf2el2HG2 for <buildroot@buildroot.org>;
 Sun, 21 Dec 2025 15:34:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.2;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 2F99C80D99
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2F99C80D99
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2F99C80D99
 for <buildroot@buildroot.org>; Sun, 21 Dec 2025 15:34:10 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id DF90C2003CC;
 Sun, 21 Dec 2025 16:34:06 +0100 (CET)
Received: from 2a0d:e487:412e:ace1:8cb:5573:7181:a54f
 via 2a0d:e487:412e:ace1:8cb:5573:7181:a54f by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 21 Dec 2025 16:34:06 +0100
MIME-Version: 1.0
Date: Sun, 21 Dec 2025 16:34:06 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20251122211223.1401842-1-bernd@kuhls.net>
References: <20251122211223.1401842-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.12
Message-ID: <68aef7bf1b0ff21d1bf46ac69012e188@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1766331248;
 bh=ddAlf7xZrVkq4VN2ykvGxqfYHidqAKsGUzcdlaoFdjI=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=RV2SaOoTluzHyb+B3kUlQyPAd2FQo2AeaGE1veJ7tMj4yXtNqZo31SEIZ9y/f9mSg
 rnUB0obSWniaCe8mj4tMkTSvl3D2DzdCmg9Z8l5eLRFwbZ6YZcvzqCd4sEBFYSlzI1
 BaD6oU2hO1LmXVGq1AAvmRnVMthIYiNQzQRmIvaVQMto9Ow0tvXQ3d/DaI0XuX+rO4
 kCYveKjBqp+2PAHGPubvMQIc6gVvCOxlg4fbbmB/khByLQbTXwtkgX1rMdw+kHAl/w
 00jEvaaCQNwEwRJLJe4nwOrQxp0kDFK+SsOAUcvXh7GfhMewRzB0qJiNv7Wtd9B6Hw
 Scd5SmjzrGzDA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=RV2SaOoT
Subject: Re: [Buildroot] [PATCH/next 1/1] package/libmbus: bump version to
 0.9.0
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

On 22/11/2025 22:12, Bernd Kuhls wrote:
> Release notes:
> https://github.com/rscada/libmbus/blob/master/release_notes.txt
> 
> Downloading the source tarball is broken since at least Oct 30th, 2024
> as reported by the buildroot autobuilders:
> https://autobuild.buildroot.net/?reason=libmbus-0.8.0&step=50&start=50
> 
> Switching to the github helper provides the correct source code but the
> tarball downloaded has a different hash. A quick search did not provide
> alternative download locations for the original tarball
> libmbus-0.8.0.tar.gz.
> 
> To solve the broken build we do not only switch _SITE to github but 
> also
> bump the package to 0.9.0 and add autoreconf which needs two 
> directories
> being created in _POST_PATCH_HOOKS. One missing directory was already
> reported upstream: https://github.com/rscada/libmbus/issues/179
> 
> Updated license hash due to upstream commit:
> https://github.com/rscada/libmbus/commit/ab8919136d3cabb943b1cbdd4d6e2f7eea4b8f3f
> 
> Fixes:
> https://autobuild.buildroot.net/results/91a/91a82dc73bf87cf1969cd6a2ddea1809ab9a1613/
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
