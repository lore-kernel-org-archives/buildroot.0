Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68F34CA1005
	for <buildroot@archiver.kernel.org>; Tue,  2 Sep 2025 19:49:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3A604812C1;
	Tue,  2 Sep 2025 19:49:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qm1lvLBcyZiP; Tue,  2 Sep 2025 19:49:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 63FDB81285
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 63FDB81285;
	Tue,  2 Sep 2025 19:49:34 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 87E8BD2
 for <buildroot@buildroot.org>; Tue,  2 Sep 2025 19:49:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7A1564009D
 for <buildroot@buildroot.org>; Tue,  2 Sep 2025 19:49:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NBsr5l3KUfYu for <buildroot@buildroot.org>;
 Tue,  2 Sep 2025 19:49:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::15;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org A00DB40664
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A00DB40664
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A00DB40664
 for <buildroot@buildroot.org>; Tue,  2 Sep 2025 19:49:31 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 0D62378034D;
 Tue,  2 Sep 2025 21:49:27 +0200 (CEST)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 02 Sep 2025 21:49:27 +0200
MIME-Version: 1.0
Date: Tue, 02 Sep 2025 21:49:27 +0200
To: Michael Nosthoff <buildroot@heine.tech>
Cc: buildroot@buildroot.org
In-Reply-To: <20250901125608.664523-2-buildroot@heine.tech>
References: <20250901125608.664523-2-buildroot@heine.tech>
User-Agent: Webmail Free/1.6.11
Message-ID: <60541cdedfc1bfb70f4325cbff7b49fc@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1756842569;
 bh=V5irLjlEA535YWqnF++M788n8QZq0sFMF57e1PhGC/k=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=OavPM6+sJD5uQYR5R+AogtxeJopBVgkTBZCs8NYzDRAaPeWRl96mW+u6W3JsXeD1s
 CY7Rahsqg5BJ0HvS7DjU0zeTdIgr9LUduNNy4EkWHlvFG37H88hmQEuskdrtCoOyCb
 ao7JUtkZLqf88StOjrmuerh4KQwAsNaQSOjFWcPnrSWMR4DqmDhZgW1jy56tdP+p36
 Z1YBbNAUXlLE0369BKVhrNV3AsVWbjEelYxMw22W+fUNWr/ceP2yhJJ2hNtwP19x/9
 rLfhLOCmcpe5SF+ah9/ISVMXKQrKftZZeZjZS9G0ce0crqyI5gMBwz2TGMsf98R2s1
 s+h3HViH/xhTw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=OavPM6+s
Subject: Re: [Buildroot] [PATCH] package/catch2: bump to version 3.10.0
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

On 01/09/2025 14:55, Michael Nosthoff via buildroot wrote:
> Release Notes:
> 
> v3.10.0: https://github.com/catchorg/Catch2/releases/tag/v3.10.0
> v3.9.1: https://github.com/catchorg/Catch2/releases/tag/v3.9.1
> v3.9.0: https://github.com/catchorg/Catch2/releases/tag/v3.9.0
> 
> Signed-off-by: Michael Nosthoff <buildroot@heine.tech>

Applied to next, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
