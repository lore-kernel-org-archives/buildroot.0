Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD3A1E7719A
	for <buildroot@archiver.kernel.org>; Sat, 11 Jan 2025 17:31:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8DA9D606E9;
	Sat, 11 Jan 2025 17:31:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2sxZRrom8a71; Sat, 11 Jan 2025 17:31:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C065160708
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C065160708;
	Sat, 11 Jan 2025 17:31:00 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 054EE950
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 17:31:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DAB068380E
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 17:30:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pcd0LxJUyv85 for <buildroot@buildroot.org>;
 Sat, 11 Jan 2025 17:30:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 40237837DA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 40237837DA
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 40237837DA
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 17:30:59 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 83C17B0056A;
 Sat, 11 Jan 2025 18:30:56 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:59932])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 11 Jan 2025 18:30:56 +0100
MIME-Version: 1.0
Date: Sat, 11 Jan 2025 18:30:56 +0100
From: Julien Olivain <ju.o@free.fr>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20250111144641.2757210-1-james.hilliard1@gmail.com>
References: <20250111144641.2757210-1-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <083dc1bdc8aa0277f33c6fd0ad29de00@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1736616657;
 bh=nUCrVQtIrT3feMGgg1C6/3OBXW6bMIeZxkEVINbQWTI=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=h4kJhvI7fBg5K/ACqq4gk1UWD2mYar3q/o//AnjyNyB1FIw2mh+3g9W3g+YV4YRbI
 XVe5zZhd/6PjUvvLOVZClP86c3kYMxDUrtf2q0GTAZjBXHh+jAGs4TlFuMbUw5FtrC
 1KKeS0n6fxOlZuYLjMyuoVhl2yhOF1I3ECN0ocedeFELutGJbsy4ncR/D4s73xWCc8
 U7BTY9GlLei2MZzZrMA9sh6ugC4sL2GBMZmvQ4E2gwhDj4KIGQyj1U4fnQsgoK29be
 68/5atyQJp2d9QeLRKgjlnKF235p/MXvD5bgbEmLQHcyfFgCQD6Lop21UhxoMHpT8P
 +N1vNRGY+0+TA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=h4kJhvI7
Subject: Re: [Buildroot] [PATCH 1/1] package/python-path: bump to version
 17.1.0
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

On 11/01/2025 15:46, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
