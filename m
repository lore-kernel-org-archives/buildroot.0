Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7C58CAC5B9
	for <buildroot@archiver.kernel.org>; Mon, 29 Sep 2025 19:11:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 86C758130E;
	Mon, 29 Sep 2025 19:11:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id b7O59GnRL2Kt; Mon, 29 Sep 2025 19:11:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BF9C781302
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id BF9C781302;
	Mon, 29 Sep 2025 19:11:15 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id E0706CF
 for <buildroot@buildroot.org>; Mon, 29 Sep 2025 19:11:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C70B1407F2
 for <buildroot@buildroot.org>; Mon, 29 Sep 2025 19:11:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id T1L5d_73Abwk for <buildroot@buildroot.org>;
 Mon, 29 Sep 2025 19:11:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.4;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org A2A3E407E9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A2A3E407E9
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A2A3E407E9
 for <buildroot@buildroot.org>; Mon, 29 Sep 2025 19:11:11 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 751B019F57E;
 Mon, 29 Sep 2025 21:11:08 +0200 (CEST)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 29 Sep 2025 21:11:08 +0200
MIME-Version: 1.0
Date: Mon, 29 Sep 2025 21:11:08 +0200
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20250929124955.1295473-1-dario.binacchi@amarulasolutions.com>
References: <20250929124955.1295473-1-dario.binacchi@amarulasolutions.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <90e49a23200bb852d6d726969cc7cf99@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1759173069;
 bh=3kYhPSv0lP78HpX8YtOfd7p7/g00VoEkcBkNnwp1ky0=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=MbxbBX0T8GCxEadml0MCjt8ZdD8GQPEbmbFTvTcp0XX6EIDf/FhceibwQcs47DGlH
 95c+hSvw1ubjzIjJRU8j9a8HjTXFe46sVwmilNmg+5ro2f9voptSjZPoOcOnVscBvW
 NYLwVsJdJhkFCgkooil8TlOYQgtwhp8BVRQ1wddHmcR+f0bJrTuRKy11lIn79GFU7Y
 2QHelv+bT9lIxBcGzNQJrVI/lMf+YikmKmhhudnr6UNfjXPkj8KCK8t42d3nFdjSy5
 ixm6lYKU5TeHOl7OR1J54E9e4icf4aWpa8xmkksLURj86UfghdjoJmGRlN2zOiALkf
 7KC0zxtbHiwzw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=MbxbBX0T
Subject: Re: [Buildroot] [PATCH 1/2] package/empty: bump to version 0.6.23d
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

On 29/09/2025 14:49, Dario Binacchi wrote:
> Update hash of COPYRIGHT (update in year with
> https://sourceforge.net/p/empty/code/ci/bb26b085df1285570c386d2aa9f5e3bf2fb92ec5/)
> 
> Release notes:
> https://sourceforge.net/p/empty/code/ci/master/tree/CHANGELOG
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

Series applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
