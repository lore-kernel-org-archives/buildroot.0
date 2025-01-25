Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAD56C0218C
	for <buildroot@archiver.kernel.org>; Sat, 25 Jan 2025 12:02:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 79954832D1;
	Sat, 25 Jan 2025 12:02:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LDC1NIszKoVf; Sat, 25 Jan 2025 12:02:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A1E17832D4
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A1E17832D4;
	Sat, 25 Jan 2025 12:02:20 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 48AFB1183
 for <buildroot@buildroot.org>; Sat, 25 Jan 2025 12:02:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 27F6C40F88
 for <buildroot@buildroot.org>; Sat, 25 Jan 2025 12:02:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id j-4y2ZZIVfXg for <buildroot@buildroot.org>;
 Sat, 25 Jan 2025 12:02:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 4AFE740F34
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4AFE740F34
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4AFE740F34
 for <buildroot@buildroot.org>; Sat, 25 Jan 2025 12:02:18 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 0FB395FFB7;
 Sat, 25 Jan 2025 13:02:14 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:45016])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 25 Jan 2025 13:02:14 +0100
MIME-Version: 1.0
Date: Sat, 25 Jan 2025 13:02:14 +0100
From: Julien Olivain <ju.o@free.fr>
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20250125085029.18171-1-bernd@kuhls.net>
References: <20250125085029.18171-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.9
Message-ID: <88827d0599bb4db5fdf05351e15d184b@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1737806536;
 bh=9aVhrIRUsAcJD5Xd+24LL6+INGzAoTEwLQmD7kQKZVs=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=iw84SYXsXd1AQ4FOZoPZphsuwC/4WtA8iYBCbtgWy8LoKuf0bToH8NjfADMVNQ8wc
 0el+cs9iC8f1iqW1QTkjVntHNlcATh49O/huQ5eH/i2H+xIdaLJo89PtuOUCJ+dT5D
 Y+gLILus22ENZXkxGzgpge4MPnwqGmJxqgXlwSARjcZvbBIIHcumiSccEZeKH83YAI
 MbaxKzIiWn0FJI7b/aeiIe3VRPBMzjLZhKwxtenbm9FSb6pzQHtjVksiKQFDpuUVu6
 kYYqH2Jcvle1vDoOX8srt83CsnKIojiZzzDqWMA4DB/2LonX/2iA2kqv8KDmX46rZV
 olzvpKU5rY0Mg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=iw84SYXs
Subject: Re: [Buildroot] [PATCH] package/kodi-pvr-*: mass version bump
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

On 25/01/2025 09:50, Bernd Kuhls wrote:
> - Translations updates from Weblate
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Series applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
