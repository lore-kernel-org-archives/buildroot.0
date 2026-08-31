Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C31D3C624A5
	for <buildroot@archiver.kernel.org>; Mon, 31 Aug 2026 14:34:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CDCCF60627;
	Mon, 31 Aug 2026 14:34:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JZSgBIDZw3Gy; Mon, 31 Aug 2026 14:34:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788186860;
	bh=XgDZjMRwzbYC2NBphPP/oZEH5q448nhmabaXBZkVT7M=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=NwFlY6HpAhprDAl9QpYjiYDRRoa/A44o524CvPvPD8zvGKiCsZMKaJh9oRzcePbcH
	 jkhLRG0/SHn/6ybjlZ14CIrPiV3FS/cC2WIAyV/pcvkxBBemoDIDyY/J2WV3poA59E
	 rcq+6q/451ZQPzRoKx4tfLRR7gLSrEif1o15z8t3c3WiYAbjyOhA0iBGDH6ETCPG1m
	 spezKQlDqhlU3sV/bDGhw596Y5JMwsfBxM2lWH3a/K0JLzezSNQy9RTbCIiJ9u/BOc
	 NiKxj6QimiIz9quapaB9Igo9p/iKReHvnGUXQRrG0BlEWWuo5lJQ0Fd18xUeTTsAbJ
	 B2NDFV4XmLqaQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 934DB60608;
	Mon, 31 Aug 2026 14:34:20 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id E50D423E
 for <buildroot@buildroot.org>; Mon, 31 Aug 2026 14:34:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CA7E960608
 for <buildroot@buildroot.org>; Mon, 31 Aug 2026 14:34:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SdYQDUY4TyBo for <buildroot@buildroot.org>;
 Mon, 31 Aug 2026 14:34:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.19;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 761D9605C9
 for <buildroot@buildroot.org>; Mon, 31 Aug 2026 14:34:16 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MIwzA-1xLTcS3I8g-00MEQ8; Mon, 31
 Aug 2026 16:34:14 +0200
Message-ID: <6f5c19a0-9429-4b33-831e-96ace89e997c@gmx.de>
Date: Mon, 31 Aug 2026 16:34:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Titouan Christophe <titouan.christophe@mind.be>, buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 thomas.perale@mind.be
References: <20260831140530.443610-1-titouan.christophe@mind.be>
Content-Language: en-US, de-DE-1901, de-DE
Autocrypt: addr=fiona.klute@gmx.de; keydata=
 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
In-Reply-To: <20260831140530.443610-1-titouan.christophe@mind.be>
X-Provags-ID: V03:K1:pEb6LGJVuQ4FMPwsrdc0Nx2qvtgzIlpb/BHI3wa1tBpImu6EbDd
 26U0JJWIJktVfhT0fitc4yq/dP0vT7UZGQW6aXgiDtivtCnTzqOsndM55Ipww9Wh21vbFqn
 aN2YNO3U7K6fCZPopHBsWasjw0jXKLcDFYEESar4pE9k+qlBwMUnEVYsdIosrVenPC0rPoE
 FcNzTh3hsPVZFyQZ+IRpg==
UI-OutboundReport: notjunk:1;M01:P0:qqIdPTblV0Y=;HOo4Ie1dMnfXVUqBJMBF0QRAPWU
 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
 D4z6Sh73OjH2YgcI1M07SkkO/TVCEMLH
Subject: Re: [Buildroot] [PATCH] package/vim: fix hash for README.txt
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Am 31.08.26 um 16:05 schrieb Titouan Christophe via buildroot:
> Buildroot commit 297f6f1921960c1735bca34b5a80138e2a8261f4 updated vim.
> However README.txt (used as part of the license hash check) has been updated
> upstream in [1], without any corresponding hash change in Buildroot, leading
> to build failure.
> 
> Fixes: https://gitlab.com/buildroot.org/buildroot/-/work_items/189
> 
> NB: This also affects 2025.02.x & 2026.05.x, so this patch
>      should be applied there too.
> 
> [1] https://github.com/vim/vim/commit/e7e21018fc0b60c153c8e668f696d95e574cc5a4
> 
> Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>

Applied to master, thank you!

> ---
>   package/vim/vim.hash | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/vim/vim.hash b/package/vim/vim.hash
> index 57aa3dd49d..ec3e92aaa0 100644
> --- a/package/vim/vim.hash
> +++ b/package/vim/vim.hash
> @@ -2,4 +2,4 @@
>   
>   sha256  9b90b23241007b20ba89b7b00e6202008f4ff5b5278974d42aa199867c2eada5  vim-9.2.0943.tar.gz
>   sha256  0b3f1f330cb1b179bb17c7c687d4cec601e0aa3462bc7f890ad4c3888d37d720  LICENSE
> -sha256  ee1d0885bbc4a95a24e49873a075391bdf26b69d13758e30f3d9271f8f42bd2d  README.txt
> +sha256  1e9afcb6b83c11af081b6ff7873861895819c7bacfc8d2ea53972a532c622868  README.txt

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
