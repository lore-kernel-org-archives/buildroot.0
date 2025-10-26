Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEC82CCF9E5
	for <buildroot@archiver.kernel.org>; Sun, 26 Oct 2025 16:23:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 39D8D82E29;
	Sun, 26 Oct 2025 16:23:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Jz8YKMGpltj0; Sun, 26 Oct 2025 16:23:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D888C82D75
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D888C82D75;
	Sun, 26 Oct 2025 16:23:00 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 7CDF6D7
 for <buildroot@buildroot.org>; Sun, 26 Oct 2025 16:22:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 793BD60AD5
 for <buildroot@buildroot.org>; Sun, 26 Oct 2025 16:22:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nT3520zB9hDF for <buildroot@buildroot.org>;
 Sun, 26 Oct 2025 16:22:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org B789760ACF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B789760ACF
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B789760ACF
 for <buildroot@buildroot.org>; Sun, 26 Oct 2025 16:22:58 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id A7E30B00583;
 Sun, 26 Oct 2025 17:22:54 +0100 (CET)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 26 Oct 2025 17:22:54 +0100
MIME-Version: 1.0
Date: Sun, 26 Oct 2025 17:22:54 +0100
To: Julien Olivain <ju.o@free.fr>
Cc: buildroot@buildroot.org, Bernd Kuhls <bernd@kuhls.net>
In-Reply-To: <20251026133551.583220-1-ju.o@free.fr>
References: <20251026133551.583220-1-ju.o@free.fr>
User-Agent: Webmail Free/1.6.11
Message-ID: <f125dcbb2f46836e037266185fc5c7cd@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1761495776;
 bh=BImk4ujni89rfOjQVswtrowVwCyeJCACkAMCa5gZnQM=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=vSy6xC54NrLBKnqAMX30EpdmHHzfwGpSCb/yrMge/A0jxFUlvChkaXQCTHjGhIu9/
 VL+jSuaX51sb9//8j48uHbEBBtUC1zkr9uuvDv/AGpq2DedKM6htNlK/R38SXJF+0P
 fDg+ABD/gffAZzEzSgTvnxI9fBbTwbV6gPJ6j5AsXfoqTwm707colJZSwi4ZOMZokq
 v5mH+acLWJrxiNXP4Cwgnp93Y5jdWsS4sebX6eKinwQJNrGWwWnudNzJODxUGp8G6t
 ZNllbR3HhzfdUf6nA40ZsL0KGEsZ5OnrlI+FsuMmJpovidJuvi6WOhtmSOu5J2yBsl
 m4UPm/pIxfxdA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=vSy6xC54
Subject: Re: [Buildroot] [PATCH 1/1] support/testing: package: bitcoin:
 replace deprecated wallet rpc calls
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

On 26/10/2025 14:35, Julien Olivain via buildroot wrote:
> The getunconfirmedbalance rpc call was marked as deprecated
> in [1] (included in v0.19.0, released on 2019-11-08) and removed
> in [2] (included in v30.0, released on 2025-10-09).
> 
> This commit replaces the old getbalance/getunconfirmedbalance rpc
> calls with the new call getbalances (plural) returning a json
> object containing all the data.
> 
> This commit is needed before updating bitcoin to v30.0.
> 
> [1] 
> https://github.com/bitcoin/bitcoin/commit/facfb4111d14a3b06c46690a2cca7ca91cea8a96
> [2] 
> https://github.com/bitcoin/bitcoin/commit/c3fe85e2d6dd4f251a62a99fd891b0fa370f9712
> 
> Cc: Bernd Kuhls <bernd@kuhls.net>
> Signed-off-by: Julien Olivain <ju.o@free.fr>

Applied to master.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
