Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B940FC72C2
	for <buildroot@archiver.kernel.org>; Sun, 22 Mar 2026 11:35:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B91A0412D6;
	Sun, 22 Mar 2026 11:35:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id b7oEG7XBdtBH; Sun, 22 Mar 2026 11:35:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EB8FA412DE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1774179301;
	bh=AZ1Khj2LbH1cydC2eEIIPoh9B6qaFQnA/ITL8iRP9eo=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Xr9XZGxJaHEJ4wYk7jbL3tLvDKiLstCkMfhiAg4L/nQz88a40ltbpF0Cnnnl8rczV
	 A3nld0AA1AgtMi83p6pUdiFoXpcV0Pz+G2ExZhPL5MqRQwsy2GS5S2kRil5gZk+km6
	 LrDAqmxEKsADWnSCtAS6WklxZ1f7hh2zZ1o71JSf0pUGHQ/uTBbT9SwSPCdbHGm8Q9
	 yolzLAydVht0mUHNpN1k67xeDLKwqW/dVVGDGbHvkkNIdU2oUF2+oG33rCmpZw67iB
	 V8GXL3RhjsmRWcngLFjJol/zdM2LvQn2tMutlp4fyfsgM/iMeMu8/HR3u1QEoBYH03
	 +SKM0iizMebew==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id EB8FA412DE;
	Sun, 22 Mar 2026 11:35:00 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 3F3792CC
 for <buildroot@buildroot.org>; Sun, 22 Mar 2026 11:34:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2AF344009B
 for <buildroot@buildroot.org>; Sun, 22 Mar 2026 11:34:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id R5GdXKV1G9Bv for <buildroot@buildroot.org>;
 Sun, 22 Mar 2026 11:34:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 2220540052
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2220540052
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2220540052
 for <buildroot@buildroot.org>; Sun, 22 Mar 2026 11:34:57 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 00199B0051E;
 Sun, 22 Mar 2026 12:34:53 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 22 Mar 2026 12:34:53 +0100
MIME-Version: 1.0
Date: Sun, 22 Mar 2026 12:34:53 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Julian Scheel <julian@jusst.de>
In-Reply-To: <20260314171754.3071677-1-bernd@kuhls.net>
References: <20260314171754.3071677-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.14
Message-ID: <e14cd77f09a518be193013d05b419793@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1774179296;
 bh=a5tHHNXAcdKawfCkruoS9mUDNsaLiLV0d53PAJxou/M=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=YH8qe6zZDZW69EcH7nKf232XogXtproN+lwB343F2rmOjQssqEHVjbf2lsxJKgF6a
 jNzoRSXd7W9uRfD3WuML3oAiVx/qXrGdBYUshyxiS0BfLpXHR8lJQgNNjd9jMipG6d
 Lwn/QhM3E8NARL3BiGzdsQfeDnu1XUyYAgBAfZsKSzNohDA9OCldsQMSxL0knOaDHi
 P77YY19gNfQAwjO5zJy+uSa6id9R33UNL5GPrZqeIo24yrFdQB41AGDdX0nLUHe3GM
 HLo28eSA3yUu9usqWTrkVa5GFymsXZQa90TxhhYloAjJX0jn0T7vHIdfa0Iu7srso7
 +0C3nMt7Bh0Jw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=YH8qe6zZ
Subject: Re: [Buildroot] [PATCH 1/2] package/bitstream: bump version to 1.6
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

On 14/03/2026 18:17, Bernd Kuhls wrote:
> https://code.videolan.org/videolan/bitstream/-/blob/1.6/NEWS
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
