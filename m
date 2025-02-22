Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 439D0C021B2
	for <buildroot@archiver.kernel.org>; Sat, 22 Feb 2025 17:33:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0C95540556;
	Sat, 22 Feb 2025 17:33:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Czw9Iw5oA-7V; Sat, 22 Feb 2025 17:33:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 004B44054B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 004B44054B;
	Sat, 22 Feb 2025 17:32:59 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 61B296B
 for <buildroot@buildroot.org>; Sat, 22 Feb 2025 17:32:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5D63F606B3
 for <buildroot@buildroot.org>; Sat, 22 Feb 2025 17:32:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jazW2EazF9w7 for <buildroot@buildroot.org>;
 Sat, 22 Feb 2025 17:32:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::11;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org ADD0860628
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ADD0860628
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp3.osuosl.org (Postfix) with ESMTPS id ADD0860628
 for <buildroot@buildroot.org>; Sat, 22 Feb 2025 17:32:57 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 617102003DD;
 Sat, 22 Feb 2025 18:32:53 +0100 (CET)
Received: from 2a01:e0a:485:b220:8213:2270:4a8d:a1d5
 via 2a01:e0a:485:b220:8213:2270:4a8d:a1d5 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 22 Feb 2025 18:32:53 +0100
MIME-Version: 1.0
Date: Sat, 22 Feb 2025 18:32:53 +0100
From: Julien Olivain <ju.o@free.fr>
To: Colin Foster <colin.foster@in-advantage.com>
Cc: buildroot@buildroot.org, James Hilliard <james.hilliard1@gmail.com>
In-Reply-To: <20250220192621.1744526-1-colin.foster@in-advantage.com>
References: <20250220192621.1744526-1-colin.foster@in-advantage.com>
User-Agent: Webmail Free/1.6.10
Message-ID: <97f2bd2d08d69009fc4dd5d9418bac54@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1740245575;
 bh=tcSW9+EyVPtrHdehq4C3ahYgjmPSSrjrvjRbmL5W2rM=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=pqMNiEabACXQiqEepobY8ARxBt9shv5P6rY98bCt++BKUAN5P3FLBlIskzXkryBQc
 t+ALjT5ECrNYT909c3dQYp5YbstoJPyjm0Nals2+6bL3ey2LvnwgqZXmrFKAHedPuw
 3qwZz8wIWeR+vRQ4gE519JZ/h/uYYNJnFbkK3v8tWE8WGCptwHPUUgllSiCgqdNR+R
 0fsKm2rOBmyFP8onK0NSMaPGgenqyIoLGYomG1yn0DetXMMdswUU3/3nCxbZlMbEQd
 RjUCBDECPQWG82R3c/nZse4HidpJFfaRSWVkYEJa70Ohw0YPalBo4TYD9SsWZVlBTq
 aqiWWbh1U0okg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=pqMNiEab
Subject: Re: [Buildroot] [PATCH] package/tftpy: bump to 0.8.5
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 20/02/2025 20:26, Colin Foster wrote:
> Signed-off-by: Colin Foster <colin.foster@in-advantage.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
