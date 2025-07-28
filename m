Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1E0FC83F17
	for <buildroot@archiver.kernel.org>; Mon, 28 Jul 2025 22:28:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A763D60903;
	Mon, 28 Jul 2025 22:28:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DMGZzOuh7gH3; Mon, 28 Jul 2025 22:28:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EA78760DE3
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id EA78760DE3;
	Mon, 28 Jul 2025 22:28:32 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 631AEDA
 for <buildroot@buildroot.org>; Mon, 28 Jul 2025 22:28:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 49B5881343
 for <buildroot@buildroot.org>; Mon, 28 Jul 2025 22:28:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BfdZxwcCBWfg for <buildroot@buildroot.org>;
 Mon, 28 Jul 2025 22:28:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 9D0E781342
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9D0E781342
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9D0E781342
 for <buildroot@buildroot.org>; Mon, 28 Jul 2025 22:28:31 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 76641B0051E;
 Tue, 29 Jul 2025 00:28:28 +0200 (CEST)
Received: from [192.214.236.6:41552] via [192.214.236.6] by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 29 Jul 2025 00:28:28 +0200
MIME-Version: 1.0
Date: Tue, 29 Jul 2025 00:28:28 +0200
To: yegorslists@googlemail.com
Cc: buildroot@buildroot.org
In-Reply-To: <20250725094802.3695163-1-yegorslists@googlemail.com>
References: <20250725094802.3695163-1-yegorslists@googlemail.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <91bdc9f4e8e4931363bd9743c37c8001@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1753741709;
 bh=nkc8+BNE51U18zf5fPUrPP3LNEMufjwUTcbtrsQ9Pbg=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=BdbnWEVg432zkdgQabpR9YBjsAd4YU6E2dRFzOUZPYNbHiD5HsmCZaQJqOMzPwhx6
 9FgbkQtEQGGoFU7MmNt15mXBkpTK9ZDV28aHaFN1IDHeiPkzIEVdh8rnJvPfQp21Yy
 ffOASVZPWIcBTTESat+qD9bKdxakwPRkTsrIXcHaTWyd8ldKPer+wZmITG32uGf/Zx
 9TLlIB/GykvsAsq+6Ydb3NeQN9xRn7EtEcJiJU6V6yQk9+aT5+aHHMoy2jnmGVtoTt
 jIzvQ1HnzCKIMtK3vmN4OBJWs9eNk4JXrNo9mzA/RGQo9UUD8S+nQxvFwS9m1RpOZD
 BxS7QIBF//OkA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=BdbnWEVg
Subject: Re: [Buildroot] [PATCH] DEVELOPERS: add Yegor Yefremov for
 package/libxmlrpc
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

On 25/07/2025 11:48, yegorslists@googlemail.com wrote:
> From: Yegor Yefremov <yegorslists@googlemail.com>
> 
> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
