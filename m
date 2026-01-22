Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 394B1D6CFA2
	for <buildroot@archiver.kernel.org>; Thu, 22 Jan 2026 19:21:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7EFF640925;
	Thu, 22 Jan 2026 19:21:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7de2TOmaknQL; Thu, 22 Jan 2026 19:21:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5B9BB40921
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1769109713;
	bh=HWRdLVFHK8mVzWDBiakQ22HFkEa2dGb/3R8aSaj9KQI=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=TO2WD9vP5zW+eLlBsvxwRuvTj5jAmtBFIGW4LT3WQli/XIct7ZH6Qk5sUk4l0RQ2d
	 Q7jc6tu3qChmoqIOE0PgNaSAY4lWkIRzMoFnSDWvF1oBjrwRtfhhjuWB77orm8Ur2x
	 /XJhc7TAGS9ehQx2qoqRxAvnlFK6xqtiTNeZLLbMRb2z+iUh+H/IWScsqHN42re0eb
	 aQHwIkrRVyePdWTJ5DCQhYNRvaYVuxF8/qTb4t2BK9s0XqckAjvblrJhK5JkuAQVmp
	 rOMnuyh5dWXc4149Oajf9kZ+9h1KP3mVlQ/aLNOvmZxG/DUoPvHAMgH2A3BqZhWswq
	 wLu5kVRFZLxoA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5B9BB40921;
	Thu, 22 Jan 2026 19:21:53 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 2D85B4DF
 for <buildroot@buildroot.org>; Thu, 22 Jan 2026 19:21:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1CF3A822A6
 for <buildroot@buildroot.org>; Thu, 22 Jan 2026 19:21:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ArHqv3bH6F0i for <buildroot@buildroot.org>;
 Thu, 22 Jan 2026 19:21:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::15;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 57AF4822A0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 57AF4822A0
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 57AF4822A0
 for <buildroot@buildroot.org>; Thu, 22 Jan 2026 19:21:50 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 7E7CD78034E;
 Thu, 22 Jan 2026 20:21:47 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Thu, 22 Jan 2026 20:21:47 +0100
MIME-Version: 1.0
Date: Thu, 22 Jan 2026 20:21:47 +0100
To: Andreas Ziegler <br025@umbiko.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20260120152059.413671-1-br025@umbiko.net>
References: <20260120152059.413671-1-br025@umbiko.net>
User-Agent: Webmail Free/1.6.12
Message-ID: <3b1e8a5f1664f91ecd3ab60b5131fa79@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1769109708;
 bh=u5XabzAJjQNjfZ4eQQa3Kerf2W8heAe4rs1o6oXCR0Y=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=kDM4L2fsZz+91YwB6rtj9QJ6VWrdXGmA7DPBKug1+IXpg/2RRmZMYwWloyoXyha53
 4xcY5bi3nGxI4TJk816sL7Pa9jm+uisqzUeVgQcCo1XtKpg5Kp/uK7igQ3iDJn3ctW
 D4dZq1Qg7lEo1lx6bFxM8NyShXs0ZLWyp5RUqBP/A5y6jv2y4+piw6WqOEbPB2C+Pk
 eF6x0A5GDohYSeDjvNexqvm2lOqHpNNjpcZvNeIu930/TF6hobC0MRtEIRF2zVsrS7
 4V3fYZksJD42K+EWN+gOvS1tSt8ZGUt4fpSyo6YG+2PT14Lf3mHXZsM8cyyFnfKYnV
 n+3H1B9APKmzQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=kDM4L2fs
Subject: Re: [Buildroot] [PATCH 1/1] package/mpd: update to version 0.24.7
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

On 20/01/2026 16:20, Andreas Ziegler wrote:
> Version 0.24.7 change log:
> 
> * decoder
>   - ffmpeg: allow seeking only if both AVFormatContext and InputStream 
> allow it
> * playlist
>   - cue: strip UTF-8 byte order marker
> * Linux: disable the iowait state for io_uring
> * fix GCC 16 compiler warning
> * fix spurious linker failures
> 
> Signed-off-by: Andreas Ziegler <br025@umbiko.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
