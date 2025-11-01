Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA0E6CCFA00
	for <buildroot@archiver.kernel.org>; Sat,  1 Nov 2025 17:59:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AF762612AB;
	Sat,  1 Nov 2025 17:59:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aosdF6r1Ip-M; Sat,  1 Nov 2025 17:59:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4DD2F6125E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4DD2F6125E;
	Sat,  1 Nov 2025 17:59:02 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 2D94E222
 for <buildroot@buildroot.org>; Sat,  1 Nov 2025 17:59:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1381A418D7
 for <buildroot@buildroot.org>; Sat,  1 Nov 2025 17:59:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7rV4eh9PntjW for <buildroot@buildroot.org>;
 Sat,  1 Nov 2025 17:59:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 4CC0341854
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4CC0341854
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4CC0341854
 for <buildroot@buildroot.org>; Sat,  1 Nov 2025 17:59:00 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id F19405FFB4;
 Sat,  1 Nov 2025 18:58:56 +0100 (CET)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 01 Nov 2025 18:58:56 +0100
MIME-Version: 1.0
Date: Sat, 01 Nov 2025 18:58:56 +0100
To: Michael Nosthoff <buildroot@heine.tech>
Cc: buildroot@buildroot.org
In-Reply-To: <20251013073036.1706358-1-buildroot@heine.tech>
References: <20251013073036.1706358-1-buildroot@heine.tech>
User-Agent: Webmail Free/1.6.11
Message-ID: <9450e200e34ccfc3c1c080257da2ecf2@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1762019938;
 bh=6xCL7iUwuwThJSa5G7s/v9d+QSmmde44fslPA3WUwCQ=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=SFDyPM2XIhUmAcb5DBW3pkgh68B7BgJzplcAxkEijY2yIFGUlahGvQq9FV+jbEAqg
 Lzb5fCYUJK5j6OpA3VmsLBkguDQhzHw+QKAnJAd7bqddAhgxF8qsCVd4mnCFS4tAzt
 +8sOieKQ9JsvMPVNwslkLCWOz8bpUgHKz+J2OC9jP7Qpg581DkeeISXQgyPhtN2ihL
 b/46stXau3FnGasmPOi8CdvPRibvkxFFT51TWE4m0lp+QA0wlkjiqsvukBBhd56UUU
 i9v7azaflD6mmybQWXXeR/fwxk0ZsjzAQwp/kMQHABV6n5yNpt7cmnoK+1JtvIY6Pf
 +QGkNJjJw/cDA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=SFDyPM2X
Subject: Re: [Buildroot] [PATCH] package/catch2: bump to version 3.11.0
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

On 13/10/2025 09:30, Michael Nosthoff via buildroot wrote:
> Release Notes: https://github.com/catchorg/Catch2/releases/tag/v3.11.0
> 
> Signed-off-by: Michael Nosthoff <buildroot@heine.tech>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
