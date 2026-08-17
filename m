Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B73FEC5B572
	for <buildroot@archiver.kernel.org>; Mon, 17 Aug 2026 17:50:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 81A1A81026;
	Mon, 17 Aug 2026 17:50:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bKoFs3gQlYVw; Mon, 17 Aug 2026 17:50:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ADF5880F95
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786989034;
	bh=hEYFLhj/idSgzEECdZ8uZPeHJLjnQD7E/Ph1q6mWmmo=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=LVETjZsRKlGxzjKDa94EoBHUMNOJKdzCL1xVjfJK+7Snw2hqzodtHd/Hu9uTCeeXM
	 uhf/nc0/fzh+rA0QSmc3Ebn05xFYpjfqMuj3WEYYqs44LQ0Tg9mhIzQ+5+9bTkf9tw
	 oDgCdNJ1Ba5dLSQjutdlw3o9GmWoWqhASOjxgnVoxlu0qN+9cAMJV9iPshkN/0Eamg
	 lkmKkUJriO0ErUbHyjJDOkI29kDuLgWD7rmp2yzcGT6QLi/dGZz27D3BgGkURo9oAy
	 sOacJqca9GqdC9vl8GDCLSM/1tB+wNBa2J+TqvTzqBKeNGwVib066ZOZIW2I9llNLm
	 1NFwQB1fl+SCQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id ADF5880F95;
	Mon, 17 Aug 2026 17:50:34 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 665CE337
 for <buildroot@buildroot.org>; Mon, 17 Aug 2026 17:50:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5812A406DB
 for <buildroot@buildroot.org>; Mon, 17 Aug 2026 17:50:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OewtfBu6iT3c for <buildroot@buildroot.org>;
 Mon, 17 Aug 2026 17:50:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 7E5F5406C9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7E5F5406C9
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7E5F5406C9
 for <buildroot@buildroot.org>; Mon, 17 Aug 2026 17:50:31 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 7578213F8A7;
 Mon, 17 Aug 2026 19:50:26 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 17 Aug 2026 19:50:26 +0200
MIME-Version: 1.0
Date: Mon, 17 Aug 2026 19:50:26 +0200
To: yann.morin@orange.com
Cc: buildroot@buildroot.org, Christian Stewart <christian@aperture.us>,
 Thomas Perale <thomas.perale@mind.be>
In-Reply-To: <552622897e269a9cbd28f3a4b08f4c45cab46124.1786948207.git.yann.morin@orange.com>
References: <552622897e269a9cbd28f3a4b08f4c45cab46124.1786948207.git.yann.morin@orange.com>
User-Agent: Webmail Free/1.6.17
Message-ID: <1f7a2a327be2fd9edce65691f1c362eb@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH 1/1] package/go: decrease debug level for
 CGO linking
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

On 17/08/2026 08:30, yann.morin@orange.com wrote:
> From: "Yann E. MORIN" <yann.morin@orange.com>
> 
> Workaround an upstream issue that arises when packages are build with
> gdb -g3 debug level:
>     https://github.com/golang/go/issues/77436
> 
> This has been fixed upstream, but is not released yet, so add a comment
> stating when to remove the workaround.
> 
> Fixes:
>     
> https://autobuild.buildroot.org/results/97cd9c2586a0cc2a16cdb2a75dae1836feb5ffc3/
>     (and probably a lot more...)
> 
> Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
> Cc: Christian Stewart <christian@aperture.us>
> Cc: Thomas Perale <thomas.perale@mind.be>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
