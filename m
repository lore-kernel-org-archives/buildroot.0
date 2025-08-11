Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F326CA0EC4
	for <buildroot@archiver.kernel.org>; Mon, 11 Aug 2025 15:30:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7669841532;
	Mon, 11 Aug 2025 15:30:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XvZ3BIQnstYn; Mon, 11 Aug 2025 15:30:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7BAA041515
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7BAA041515;
	Mon, 11 Aug 2025 15:30:51 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id C46F8154
 for <buildroot@buildroot.org>; Mon, 11 Aug 2025 15:30:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AA42E409E1
 for <buildroot@buildroot.org>; Mon, 11 Aug 2025 15:30:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2LrkUPDfJGxV for <buildroot@buildroot.org>;
 Mon, 11 Aug 2025 15:30:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.6;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org CE38F401DF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CE38F401DF
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CE38F401DF
 for <buildroot@buildroot.org>; Mon, 11 Aug 2025 15:30:48 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id EA3897804FD;
 Mon, 11 Aug 2025 17:30:44 +0200 (CEST)
Received: from 2001:18c0:a22:bf00:5c2b:f296:f108:6612
 via 2001:18c0:a22:bf00:5c2b:f296:f108:6612 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 11 Aug 2025 17:30:44 +0200
MIME-Version: 1.0
Date: Mon, 11 Aug 2025 17:30:44 +0200
To: Titouan Christophe <titouan.christophe@mind.be>
Cc: buildroot@buildroot.org, Daniel Price <daniel.price@gmail.com>
In-Reply-To: <20250811090700.20714-1-titouan.christophe@mind.be>
References: <20250811090700.20714-1-titouan.christophe@mind.be>
User-Agent: Webmail Free/1.6.11
Message-ID: <1abd8c5d5d0de8531314137dd5336f74@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1754926247;
 bh=/WX5u1HMEYHAVu8iVlOLePSMsCi/JJyyrnlAF+C1Mq0=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=PpbDdiX400hVROW5g7UFvxFb2E5yFUsOJf2cK+Y8lBTk9WwpFUpq5hHh9AtNGtDlP
 BkuKBpGYCze7XtdEWZiIuu2x3ouEvjLtq12XsKaiz+c5NvxK99Pc1VP7lvmbIZ1HzU
 /aKGyK5TJ7kOcP6Js5pdke9B86Df3pQjd/dlS607PXBVhGkr+IyO+2Z/HICFo2LWjw
 i328+0RQH1m4VfL7G3iW07qAMErj+R+9m0WyUvxmdYNv5LNh56sZDAeg+NEvgNzfKy
 ONjnjg8Sui1kBFyIRLgwQ013233InGaFPvhqgfPFoznM1kUHE4O3v3Z0kO02o/COGx
 v4BY3PCRfvBIw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=PpbDdiX4
Subject: Re: [Buildroot] [PATCH] package/redis: bump to v8.2.0
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

On 11/08/2025 11:07, Titouan Christophe via buildroot wrote:
> From the release notes:
> (https://github.com/redis/redis/blob/8.2.0/00-RELEASENOTES)
> 
> ===========================================================
> 8.2 GA (v8.2.0)    Released Mon 4 Aug 2025 15:00:00 IST
> ===========================================================
> 
> This is the General Availability release of Redis Open Source 8.2.
> 
> - Streams - new commands: `XDELEX` and `XACKDEL`; extension to `XADD` 
> and `XTRIM`
> - Bitmap - `BITOP`: new operators: `DIFF`, `DIFF1`, `ANDOR`, and `ONE`
> - Query Engine - new SVS-VAMANA vector index type which supports vector 
> compression
> - More than 15 performance and resource utilization improvements
> - New metrics: per-slot usage metrics, key size distributions for basic 
> data types, and more
> 
> Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>

Applied to next, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
