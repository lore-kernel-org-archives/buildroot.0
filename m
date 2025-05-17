Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABF7DC2D0CD
	for <buildroot@archiver.kernel.org>; Sat, 17 May 2025 19:30:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 691EB60B45;
	Sat, 17 May 2025 19:30:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8GEWOjhyiMVu; Sat, 17 May 2025 19:30:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9116060AE5
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9116060AE5;
	Sat, 17 May 2025 19:30:42 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id CF3B4E4
 for <buildroot@buildroot.org>; Sat, 17 May 2025 19:30:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C09EC4023C
 for <buildroot@buildroot.org>; Sat, 17 May 2025 19:30:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4nult8VY6OOu for <buildroot@buildroot.org>;
 Sat, 17 May 2025 19:30:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.2;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org ECD834026F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org ECD834026F
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp2.osuosl.org (Postfix) with ESMTPS id ECD834026F
 for <buildroot@buildroot.org>; Sat, 17 May 2025 19:30:39 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id EA25B2003BE;
 Sat, 17 May 2025 21:30:31 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 17 May 2025 21:30:31 +0200
MIME-Version: 1.0
Date: Sat, 17 May 2025 21:30:31 +0200
From: Julien Olivain <ju.o@free.fr>
To: Peter Korsgaard <peter@korsgaard.com>
Cc: buildroot@buildroot.org, Maxim Kochetkov <fido_max@inbox.ru>
In-Reply-To: <20250517161505.3294288-1-peter@korsgaard.com>
References: <20250517161505.3294288-1-peter@korsgaard.com>
User-Agent: Webmail Free/1.6.10
Message-ID: <0e35d9a420330c8ed13cbb9e6e427276@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1747510236;
 bh=6wZllF9dfJ+85TJ4hZWuJdfxPOFDCTPBerYCbNtTUoo=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=B4Qr2vwRcB6DfERYJI/7yF9w6fG7TtHKpt6mJ4d5P0DG9ytn+VU0Gj40tThWxB4zV
 MLDcAoSYmlYg5QOgRyEJvK6lpCCZ6LaJN+jlFZEg1vqXG4LvH3yGeCWGkEi9QYfUYg
 gH1UzYT4B/XINeC5M6v8Qy6ixkBBvXCg8vxb0e/RVxIt0440mRZdziUeg021gY2r7/
 gO3fe5AEXIvWUQ/u9ezYcvxjkRqX4jCpQBAwOXXnzzAQCMLPAPh7QLS+v1q9vNkTfD
 SSXYGXqEFMhwc9/5IyXENMzVKjrsSQkTbg6wpAglPG6I/g9AX1udILVU2s5erhUd3a
 6r1SVtxUI3aSA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=B4Qr2vwR
Subject: Re: [Buildroot] [PATCH] package/postgresql: security bump to
 version 17.5
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

On 17/05/2025 18:15, Peter Korsgaard wrote:
> Fixes the following security issue:
> 
> CVE-2025-4207: PostgreSQL GB18030 encoding validation can read one byte 
> past
> end of allocation for text that fails validation
> 
> A buffer over-read in PostgreSQL GB18030 encoding validation allows a
> database input provider to achieve temporary denial of service on 
> platforms
> where a 1-byte over-read can elicit process termination.  This affects 
> the
> database server and also libpq.
> 
> https://www.postgresql.org/about/news/postgresql-175-169-1513-1418-and-1321-released-3072/
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
